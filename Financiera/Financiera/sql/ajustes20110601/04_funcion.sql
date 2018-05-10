---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 01/06/2011, 12:28:28 --
---------------------------------------------

spool 04_funcion.log

prompt
prompt Creating function FN_DIVIDE_ARCHIVO_SIN
prompt =======================================
prompt
create or replace function fn_divide_archivo_sin(p_uploadid        NUMBER,
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
      r.idbanco        := null;
      r.cta_recaudo    := trim(fn_token(vBuffer, tk));
      r.indtipo        := null;
      r.fec_corte      := null;
      r.fec_tran       := to_date(trim(fn_token(vBuffer, tk)), 'yyyymmdd');
      r.oficina_origen := null;
      r.valor_efectivo := to_number(trim(Substr(vBuffer, tk)),'9999999999999999.99');
      r.valor_cheque   := 0.0;
      r.valor_total    := r.valor_efectivo;
      r.nit_m          := null;
      r.idmunicipio    := null;
      r.p_consignado   := null;

      select count(*)
      into w_registros
      from cta_recaudo_fcm
      where cuenta = r.cta_recaudo;

      if w_registros = 0 then
         p_error := 'Cuenta no Registrada: ' || r.idbanco || '-' || r.indtipo || '-' || r.cta_recaudo;
         return(p_error);
      end if;

      end if;
    l_pos := l_pos + l_amount + length(v_finlinea);
    tk    := 1;
    insert into recaudo_local_temp values r;
  END LOOP;
  commit;

  update recaudo_local_temp r
  set (idbanco,indtipo,p_consignado )  = (select max(idbanco), max(indtipo), max(decode(indtipo,'POLCA',55,10)) from cta_recaudo_fcm c
                            where r.cta_recaudo = c.cuenta );
                             
  delete from trxsinidentificar
  where (cuenta in (select distinct cta_recaudo from recaudo_local_temp ) ) and
        (fechaTrx in (select distinct fec_tran from recaudo_local_temp) ) and
        referencia = 'HISTORICO';
        
  insert into trxsinidentificar
    (idbanco, cuenta, periodo, fechatrx, descripciontrx, valortrx, indtipo, p_consignado, fechacargue, usuariocargue, referencia, numsecuenciareg, estadoIden)
select idbanco, cta_recaudo, to_char(fec_tran,'yyyymm'), fec_tran,'HISTORICO DEPOSITO SIN IDENTIFICAR', valor_total, indtipo, p_consignado, sysdate,p_usuario, 'HISTORICO', seq_ide.nextval, 'SI'  from recaudo_local_temp
            
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
  return (vBuffer);
end fn_divide_archivo_sin;
/


spool off
