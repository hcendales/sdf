declare
fechaini date;
fechafin date;
p_error varchar2(250);
ano number;
mes number;
dia number;
begin
fechaini := to_date('2010-12-01','yyyy-mm-dd');
fechafin := to_date('2010-12-31','yyyy-mm-dd');


while fechaini <= fechafin loop
      p_error := null;
      
      ano := to_number( to_char(fechaini,'yyyy') );
      mes := to_number( to_char(fechaini,'mm') );
      dia := to_number( to_char(fechaini,'dd') );
      
      pk_proc.contabiliza_recaudo_externo(ano,mes,dia,79938127,p_error);
      dbms_output.put_line('fecha rec ' || ano || mes || dia || ':' || p_error );
      
      p_error := null;
      pk_proc.contabiliza_pago_externo(ano,mes,dia,79938127,p_error);
      
      dbms_output.put_line('fecha pag ' || ano || mes || dia || ':' || p_error );
      fechaini := fechaini + 1;

end loop;


end;