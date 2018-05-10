--------------------------------------------
-- Export file for user SIMIT             --
-- Created by user on 20/09/2011, 9:31:16 --
--------------------------------------------

spool 11_vw_cuentaDev.log

prompt
prompt Creating view VW_CUENTAORIGENDEV
prompt ================================
prompt
create or replace view simit.vw_cuentaorigendev as
select
r.ori_cuenta as cuenta,
r.ori_cuenta || '-' || r.indtipo || '-EXTERNO-' || b.nombre as nomCuenta
from recaudo_externo_disp_tot r, banco b
where r.ori_idbanco = b.idbanco
group by r.ori_idbanco, r.ori_cuenta, r.indtipo, b.nombre

/*
union
select c.cuenta || '-' || c.indtipo || '-LOCAL-' || b.nombre as cuenta
from cta_recaudo_fcm c, banco b
where c.idbanco = b.idbanco
group by c.idbanco, c.cuenta, c.indtipo, b.nombre
*/
order by 1
/


spool off
