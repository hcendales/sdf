create or replace function fn_divide_archivo_dep(p_uploadid        NUMBER,
                                             p_idbanco         char,
                                             p_cta_recaudo_fcm varchar2,
                                             p_usuario         varchar2,
                                             p_error           OUT VARCHAR2)
  return varchar2 is

  vBuffer      VARCHAR2(32767);
  l_amount     BINARY_INTEGER := 32767;
  l_pos        PLS_INTEGER := 1;
  i            number := 1;
  tk           number := 1;
  l_clob_len   PLS_INTEGER;
  v_cfile      CLOB;
  v_chr        NUMBER := 13; -- 1 tipo de Enter
  v_cuenta     recaudo_local.cta_recaudo%type;
  v_indtipo    recaudo_local.indtipo%type;
  r            recaudo_local_temp%rowtype;
  v_encabezado VARCHAR2(500) := 'Fecha de aplicacion,Fecha de transaccion,Origen,Valor Efectivo,Valor Canje,Valor Total,Referencia 1,Referencia 2,Referencia 3,Referencia 4,Referencia 5';
  v_registros number;
  v_total     number;
  v_finlinea  varchar(2);
  w_registros number;
  fin_dia_mes char(2);
  dia_corte char(2);

BEGIN

  delete from recaudo_local_temp;

  fin_dia_mes := 0;

  select cfile into v_cfile from upload where uploadid = p_uploadid;

  l_clob_len := dbms_lob.getlength(v_cfile);

  v_finlinea := chr(13) || chr(10);

  l_amount := dbms_lob.instr(v_cfile, v_finlinea, 1, 1);
  IF l_amount < 1 THEN
    v_finlinea    := chr(13);
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, 1, 1);
    IF l_amount < 1 THEN
       v_finlinea    := chr(10);
       l_amount := dbms_lob.instr(v_cfile, v_finlinea, 1, 1);
       IF l_amount < 1 THEN
          p_error := 'Formato desconocido de archivo';
            return(p_error);
       end if;
    end if;
  end if;

-- leer encabezado
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos, 1);
    IF l_amount < 1 THEN
      p_error := 'Registro 1  Invalido';
      return(p_error);
    else
      l_amount := l_amount - l_pos;
      dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      l_pos := l_pos + l_amount + length(v_finlinea);

 end if;
  --Informacion
  WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos, 1);
    IF l_amount < 1 THEN
      p_error := 'Registro ' || i || ' Invalido';
    else
      l_amount := l_amount - l_pos;
      dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      r.idbanco        := trim(fn_token(vBuffer, tk));
      r.cta_recaudo    := trim(fn_token(vBuffer, tk));
      r.indtipo        := trim(fn_token(vBuffer, tk));
      r.fec_corte      := to_date(trim(fn_token(vBuffer, tk)), 'yyyymmdd');
      r.fec_tran       := to_date(trim(fn_token(vBuffer, tk)), 'yyyymmdd');
      r.oficina_origen := null;
      r.valor_efectivo := to_number(trim(fn_token(vBuffer, tk)), '9999999999.99');
      r.valor_cheque   := 0.0;
      r.valor_total    := r.valor_efectivo;
      r.nit_m          := null;
      r.idmunicipio    := trim(fn_token(vBuffer, tk));
      r.p_consignado   := Substr(vBuffer, tk, 2);

      select count(*)
      into w_registros
      from cta_recaudo_fcm
      where idbanco = r.idbanco and
      indtipo = r.indtipo and
      cuenta = r.cta_recaudo;

      if w_registros = 0 then
         p_error := 'Cuenta no Registrada: ' || r.idbanco || '-' || r.indtipo || '-' || r.cta_recaudo;
         return(p_error);
      end if;


/* SE COMENTAREA POR Q RESTRINGUE EL RECAUDO LOCAL 09/12/15 19:41*/
      select count(*)
      into w_registros
      from municipio
      where idmunicipio = r.idmunicipio;

      if w_registros = 0 then
         p_error := 'Municipio no registrado: ' || r.idmunicipio;
         return(p_error);
      end if;
/**/
      if r.p_consignado <> 10 and r.p_consignado <> 45 and r.p_consignado <> 55 then
         p_error := 'Porcentaje de consignacion debe ser 10,45,55. Se registro  ' ||  r.p_consignado;
         return(p_error);
      end if;

--      if fin_dia_mes = '00' then
         fin_dia_mes := to_char(last_day(r.fec_corte),'dd');
--      end if;

      dia_corte := to_char(r.fec_corte,'dd');

      if dia_corte <> '15' and
         dia_corte <> fin_dia_mes then
         p_error := 'FECHA CORTE DEBE SER 15 O FIN DE MES';
         return(p_error);
      end if;


      select count(*)
      into w_registros
      from recaudo_local_liquidacion l
      where  r.idbanco = l.idbanco and
      r.cta_recaudo = l.cta_recaudo and
      r.fec_corte = l.fec_corte and
      l.oficina_origen like 'DEPOS%'; 

      if w_registros > 0 then
         p_error := 'No es posible cargar los depositos. Deposito ya liquidado. Solicitar reproceso recaudo local dia : ' || to_char(r.fec_corte,'yyyy-mm-dd');
         return(p_error);
      end if;


    end if;
    l_pos := l_pos + l_amount + length(v_finlinea);
    tk    := 1;
    insert into recaudo_local_temp values r;
  END LOOP;
  commit;


  select count(*)
  into w_registros
  from (select fec_corte from recaudo_local_temp group by fec_corte);

  if w_registros > 1 then
     p_error := 'SOLO ES POSIBLE CARGAR UNA FECHA DE CORTE POR ARCHIVO. FECHA CORTE DEBE SER 15 O FIN DE MES';
     return(p_error);
  end if;

  delete from recaudo_local
   where idbanco in
         (select idbanco from recaudo_local_temp group by idbanco)
     and cta_recaudo in
         (select cta_recaudo from recaudo_local_temp group by cta_recaudo)
     and indtipo in
         (select indtipo from recaudo_local_temp group by indtipo)
     and fec_corte in
         (select fec_corte from recaudo_local_temp group by fec_corte)
     and oficina_origen like 'DEPOS%';

  commit;



  insert into recaudo_local
    (idbanco,
     cta_recaudo,
     indtipo,
     fec_corte,
     fec_tran,
     oficina_origen,
     valor_efectivo,
     valor_cheque,
     valor_total,
     nit_m,
     idmunicipio,
     p_consignado)
    select idbanco,
           cta_recaudo,
           indtipo,
           fec_corte,
           fec_tran,
           'DEPOS ' || oficina_origen,
           valor_efectivo,
           valor_cheque,
           valor_total,
           nit_m,
           idmunicipio,
           p_consignado
      from recaudo_local_temp;

  commit;

  select count(*), sum( valor_total)
  into v_registros, v_total
  from recaudo_local_temp;


  if p_error is null then
    p_error := 'El archivo se VALIDO exitosamente. Registros: ' || v_registros || ' por un valor de $ ' || to_char(v_total,'999,999,999,999,999.00') ;
  end if;

  return(p_error);
EXCEPTION
  WHEN OTHERS THEN
    sp_ex(SQLCODE,
          p_usuario || ' [fn_divide_archivo] ' || SQLERRM,
          p_error);
end fn_divide_archivo_dep;
/

