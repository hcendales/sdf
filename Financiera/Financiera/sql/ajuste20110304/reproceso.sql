declare

p_error varchar(250);

begin

-- borro registros dummy

delete from recaudo_externo t

where t.idbanco = '40'

and to_char(t.fec_corte,'yyyymmdd') = '20110331';

-- UPDATE_TABLA_RECAUDO_EXT

update recaudo_externo r

set r.fec_corte = to_date ('21/01/2011','dd/mm/yyyy')

where r.num_liquidacion = '2993273149';

-- borro fecha errada de agrario

delete from recaudo_externo_liquidacion t

where t.idbanco = '40'

and to_char(t.fec_corte,'yyyymmdd') = '20110121';

-- borro fecha errada de agrario

delete from recaudo_externo_liquidacion t

where t.idbanco = '40'

and to_char(t.fec_corte,'yyyymmdd') = '20110125';

-- borro fecha de pago de liq erradas

delete from recaudo_externo_disp_tot

where fec_dispersion = to_date('2011-02-01','yyyy-mm-dd');

commit;

 

-- duplico dia 03 con fecha 28 de agrario, con fecha dummy

insert into recaudo_externo

(id_recaudo_externo, idbanco, cta_recaudo, fec_corte, fec_tran, oficina_origen, valor_efectivo, valor_cheque, valor_total, idmunicipio, valor_adicional, validador_fecha, indfecha2002, num_liquidacion, tipo_identificacion, identificacion, nombre_infractor, apellido_infractor, num_comparendo, fec_comparendo, num_resolucion, fec_resolucion, iddepartamento)

select seq_recaudo_externo.nextval , idbanco, cta_recaudo, to_date('2011-03-31','yyyy-mm-dd'), fec_tran, oficina_origen, valor_efectivo, valor_cheque, valor_total, idmunicipio, valor_adicional, validador_fecha, indfecha2002, num_liquidacion, tipo_identificacion, identificacion, nombre_infractor, apellido_infractor, num_comparendo, fec_comparendo, num_resolucion, fec_resolucion, iddepartamento

from recaudo_externo

where idbanco = '40'

and to_char(fec_corte,'yyyymmdd') = '20110121';

commit;

-- liquido fecha dummy

pk_proc.liquida_recaudo_externo(2011,03,31,36454156,p_error);

dbms_output.put_line(p_error);

p_error := null;

 

-- registros de transferencia dummy

delete from recaudo_externo_disp

where fec_corte_ini = to_date('2011-03-31','yyyy-mm-dd');

-- actualizar liquidacion

update recaudo_externo_liquidacion

set fec_corte = to_date('2011-01-21','yyyy-mm-dd'),

fec_dispersion = to_date('2011-02-01','yyyy-mm-dd'),

fec_dispersion_con = to_date('2011-02-01','yyyy-mm-dd')

where to_char(fec_corte,'yyyymmdd') = '20110331';

commit;

pk_proc.dispersa_recaudo_externo(2011,01,21,36454156,p_error);

dbms_output.put_line(p_error);

p_error := null;

commit;

---

delete from recaudo_externo t

where t.idbanco = '40'

and to_char(t.fec_corte,'yyyymmdd') = '20110331';

insert into recaudo_externo

(id_recaudo_externo, idbanco, cta_recaudo, fec_corte, fec_tran, oficina_origen, valor_efectivo, valor_cheque, valor_total, idmunicipio, valor_adicional, validador_fecha, indfecha2002, num_liquidacion, tipo_identificacion, identificacion, nombre_infractor, apellido_infractor, num_comparendo, fec_comparendo, num_resolucion, fec_resolucion, iddepartamento)

select seq_recaudo_externo.nextval , idbanco, cta_recaudo, to_date('2011-03-31','yyyy-mm-dd'), fec_tran, oficina_origen, valor_efectivo, valor_cheque, valor_total, idmunicipio, valor_adicional, validador_fecha, indfecha2002, num_liquidacion, tipo_identificacion, identificacion, nombre_infractor, apellido_infractor, num_comparendo, fec_comparendo, num_resolucion, fec_resolucion, iddepartamento

from recaudo_externo

where idbanco = '40'

and to_char(fec_corte,'yyyymmdd') = '20110125';

commit;

-- liquido fecha dummy

pk_proc.liquida_recaudo_externo(2011,03,31,36454156,p_error);

dbms_output.put_line(p_error);

p_error := null;

-- registros de transferencia dummy

delete from recaudo_externo_disp

where fec_corte_ini = to_date('2011-03-31','yyyy-mm-dd');

-- actualizar liquidacion

update recaudo_externo_liquidacion

set fec_corte = to_date('2011-01-25','yyyy-mm-dd'),

fec_dispersion = to_date('2011-02-01','yyyy-mm-dd'),

fec_dispersion_con = to_date('2011-02-01','yyyy-mm-dd')

where to_char(fec_corte,'yyyymmdd') = '20110331';

commit;

-- recalcula transferencia fecha errada

pk_proc.dispersa_recaudo_externo(2011,01,25,36454156,p_error);

dbms_output.put_line(p_error);

p_error := null;

 

-- recalcula contabilidad de la fecha errada

pk_proc.contabiliza_recaudo_externo(2011,01,21,36454156,p_error);

dbms_output.put_line(p_error);

p_error := null;

pk_proc.contabiliza_recaudo_externo(2011,01,25,36454156,p_error);

dbms_output.put_line(p_error);

p_error := null;

 

pk_proc.transferir_recaudo_externo(2011,02,01,36454156,p_error);

dbms_output.put_line(p_error);

p_error := null;

 

delete from recaudo_externo t

where t.idbanco = '40'

and to_char(t.fec_corte,'yyyymmdd') = '20110331';

 

update recaudo_externo_liquidacion l

set l.id_recaudo_externo = (select r.id_recaudo_externo from recaudo_externo r

where r.num_liquidacion = l.num_liquidacion

and r.idbanco = '40'

and to_char(r.fec_corte,'yyyymmdd') = '20110121')

where l.idbanco = 40 and

to_char(l.fec_corte, 'YYYYMMDD') ='20110121';

 

update recaudo_externo_liquidacion l

set l.id_recaudo_externo = (select r.id_recaudo_externo from recaudo_externo r

where r.num_liquidacion = l.num_liquidacion

and r.idbanco = '40'

and to_char(r.fec_corte,'yyyymmdd') = '20110125')

where l.idbanco = 40 and

to_char(l.fec_corte, 'YYYYMMDD') ='20110125';

 

commit;

 

 

 

end;

 