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

begin

/* cambiar fecha inicial y final a cargar */
fechaini := to_date('2011-01-01','yyyy-mm-dd');
fechafin := to_date('2012-12-31','yyyy-mm-dd');

while fechaini <= fechafin loop
      p_error := null;
      
      ano_ini := to_number( to_char(fechaini,'yyyy') );
      mes_ini := to_number( to_char(fechaini,'mm') );
      dia_ini := to_number( to_char(fechaini,'dd') );
 
      ano_fin := to_number( to_char(fechaini,'yyyy') );
      mes_fin := to_number( to_char(fechaini,'mm') );
      dia_fin := to_number( to_char(fechaini,'dd') );
      
      pk_proc.carga_recaudo_externo_batch(fechaini,
                                    fechaini,
                                    '11348169',
                                    p_error);
  
      dbms_output.put_line('Proceso fecha ' || to_char(fechaini,'yyyy-mm-dd') || ':' || p_error );
      
      fechaini := fechaini + 1;

end loop;


end;
