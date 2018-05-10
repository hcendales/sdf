create or replace function fn_divide_archivo_avvillas(p_uploadid        NUMBER,
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
  w_registros number;
  v_total     number;
  v_finlinea  varchar(2);

BEGIN

  delete from recaudo_local_temp;


  r.idbanco     := p_idbanco;
  v_cuenta      := Substr(p_cta_recaudo_fcm,
                          Instrb(p_cta_recaudo_fcm, '-', 1, 2) + 1,
                          Length(p_cta_recaudo_fcm));
  r.cta_recaudo := v_cuenta;
  v_indtipo     := Substr(p_cta_recaudo_fcm,
                          1,
                          Instrb(p_cta_recaudo_fcm, '-', 1, 1) - 1);
  --  tk            := Length(v_indtipo);
  r.indtipo := v_indtipo;

  select cfile into v_cfile from upload where uploadid = p_uploadid;

  -- http://www.psoug.org/reference/dbms_lob.html
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


  --Registro #1
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);

    if replace(Substr(vBuffer, 12, 9), ' ', '0') <> v_cuenta then
      p_error := 'La cuenta No es Valida';
      return(p_error);
    end if;

    l_pos := l_pos + l_amount + length(v_finlinea) -1 ;

  --Registro #2
  l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos, 1);
  IF l_amount < 1 THEN
    p_error := 'No existe Encabezado';
  else
    l_amount := l_amount - l_pos;
    dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
    if lower(vBuffer) <> lower(v_encabezado) then
      p_error := 'Encabezado erroneo';
      return(p_error);
    end if;
  end if;
  l_pos := l_pos + l_amount + length(v_finlinea);

  --Informacion
  WHILE l_pos < l_clob_len - 1 and p_error is null LOOP
    l_amount := dbms_lob.instr(v_cfile, v_finlinea, l_pos + 1, 1);
    IF l_amount < 1 THEN
      p_error := 'Registro ' || i || ' Invalido';
    else
      l_amount := l_amount - l_pos;
      dbms_lob.read(v_cfile, l_amount, l_pos, vBuffer);
      --Instr(char, search_string, startpos, occurrence)
      r.fec_corte      := to_date(fn_token(vBuffer, tk), 'yyyymmdd');
      r.fec_tran       := to_date(fn_token(vBuffer, tk), 'yyyymmdd');
      r.oficina_origen := fn_token(vBuffer, tk);
      r.valor_efectivo := to_number(fn_token(vBuffer, tk), '9999999999.99');
      r.valor_cheque   := to_number(fn_token(vBuffer, tk), '9999999999.99');
      r.valor_total    := to_number(fn_token(vBuffer, tk), '9999999999.99');
      r.nit_m          := Substr(fn_token(vBuffer, tk), -10, 10);
      r.idmunicipio    := Substr(vBuffer, tk + 8, 8);
      r.p_consignado   := 55;
    end if;
    l_pos := l_pos + l_amount + length(v_finlinea);
    i     := i + 1;
    tk    := 1;
    
    select count(*)
      into w_registros
      from recaudo_local_liquidacion l
      where  r.idbanco = l.idbanco and
      r.cta_recaudo = l.cta_recaudo and
      r.fec_corte = l.fec_corte and
      l.oficina_origen like 'RECAV%'; 

      if w_registros > 0 then
         p_error := 'No es posible cargar los depositos. Deposito ya liquidado. Solicitar reproceso recaudo local dia : ' || to_char(r.fec_corte,'yyyy-mm-dd');
         return(p_error);
      end if;

    
    insert into recaudo_local_temp values r;
  END LOOP;
  commit;


  delete from recaudo_local
   where idbanco in
         (select idbanco from recaudo_local_temp group by idbanco)
     and cta_recaudo in
         (select cta_recaudo from recaudo_local_temp group by cta_recaudo)
     and indtipo in
         (select indtipo from recaudo_local_temp group by indtipo)
     and fec_corte in
         (select fec_corte from recaudo_local_temp group by fec_corte)
     and oficina_origen like 'RECAV%';

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
           'RECAV ' || oficina_origen,
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
end fn_divide_archivo_avvillas;
/

