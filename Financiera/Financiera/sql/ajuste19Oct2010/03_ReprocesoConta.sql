DECLARE

p_fechaIni_ano number := 2010;
p_fechaIni_mes number := 10;
p_fechaIni_dia number := 01;

p_fechaFin_ano number := 2010;
p_fechaFin_mes number := 10;
p_fechaFin_dia number := 18;

p_error varchar2(250) := '';
p_usuario varchar2(250) := '99999999';

w_fechaIni date;
w_fechaFin date;
w_fechaAct date;

w_fechaAct_ano number;
w_fechaAct_mes number;
w_fechaAct_dia number;

  
BEGIN


select TO_DATE(p_fechaIni_ano || '-' || p_fechaIni_mes || '-' ||
               p_fechaIni_dia,
               'YYYY-MM-DD')
  into w_fechaIni
  from DUAL;
  
select TO_DATE(p_fechaFin_ano || '-' || p_fechaFin_mes || '-' ||
               p_fechaFin_dia,
               'YYYY-MM-DD')
  into w_fechaFin
  from DUAL;

w_fechaAct := w_fechaIni;

WHILE ( w_fechaAct <= w_fechaFin ) loop

w_fechaAct_ano := to_number(to_char(w_fechaAct,'yyyy'));
w_fechaAct_mes := to_number(to_char(w_fechaAct,'mm'));
w_fechaAct_dia := to_number(to_char(w_fechaAct,'dd'));


pk_proc.contabiliza_recaudo_externo(w_fechaAct_ano,
                                    w_fechaAct_mes,
                                    w_fechaAct_dia,
                                    p_usuario,
                                    p_error);

DBMS_OUTPUT.PUT_LINE(to_char(w_fechaAct,'yyyy-mm-dd') || ':' || w_fechaAct_ano || '-' || w_fechaAct_mes || '-' || w_fechaAct_dia || '-' ||  p_error);

w_fechaAct := w_fechaAct + 1;


end loop;

                                      


end;
