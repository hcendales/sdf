declare
fechaini date;
fechafin date;
p_error varchar2(250);
ano_ini number;
mes_ini number;
dia_ini number;

ano_fin number;
mes_fin number;
dia_fin number;

numReg number;

begin

/* cambiar fecha inicial y final a cargar */
fechaini := to_date('2008-01-01','yyyy-mm-dd');
fechafin := to_date('2012-01-31','yyyy-mm-dd');

while fechaini <= fechafin loop
      p_error := null;
      
      ano_ini := to_number( to_char(fechaini,'yyyy') );
      mes_ini := to_number( to_char(fechaini,'mm') );
      dia_ini := to_number( to_char(fechaini,'dd') );
 
      ano_fin := to_number( to_char(fechaini,'yyyy') );
      mes_fin := to_number( to_char(fechaini,'mm') );
      dia_fin := to_number( to_char(fechaini,'dd') );
      
/*      pk_proc.aprobar_reproceso(ano_ini,
                                    mes_ini,
                                    dia_ini,
                                    'E',
                                    'CALCULO PROYECTA',
                                    '11348169',
                                    p_error);

      p_error := null;
 */                                   
 
      select count(*) 
      into numReg
      from  recaudo_externo  r
      where r.fec_corte = fechaini;
      
      if (numReg > 0 ) then
      pk_proc.liquida_recaudo_externo(ano_ini,
                                    mes_ini,
                                    dia_ini,
                                    '11348169',
                                    p_error);
  
      dbms_output.put_line('Proceso fecha ' || to_char(fechaini,'yyyy-mm-dd') || ':' || p_error );
      end if;
      
      fechaini := fechaini + 1;

end loop;


end;
