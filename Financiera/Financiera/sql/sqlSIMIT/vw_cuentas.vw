create or replace view vw_cuentas as
select distinct
'CTA DISPERSION CONCESIONARIO' AS  concepto,
ct.idconcesionario as codigo,
( c.nombre || ' ' ||  cp.nombre) as nombre,
ct.idbanco,
b.nombre as banco,
ct.tipocuenta,
desencriptar(ct.cuenta) as cuenta,
ct.nit_c as nitCuenta
from cta_dispersion_concesionario ct, concesionario c, concepto cp, banco b
where ct.idconcesionario = c.idconcesionario
and ct.idconcepto = cp.idconcepto
and ct.idbanco = b.idbanco
union
select distinct
'CTA DISPERSION FCM' AS  concepto,
ct.idbancorec as codigo,
'FCM DISPERSION LIBRE DISPOSICION SIMIT' as combre,
ct.cta_disp_s_banco,
b.nombre as banco,
CT.CTA_DISP_S_TIPO_CTA,
desencriptar(CT.CTA_DISP_S_CTA),
'8000826650' as nit
FROM cta_dispersion_fcm ct , banco b
where ct.cta_disp_s_banco = b.idbanco
union
select distinct
'CTA DISPERSION FCM' AS  concepto,
ct.idbancorec as codigo,
'FCM DISPERSION LIBRE DISPOSICION POLCA' as combre,
ct.cta_disp_s_banco,
b.nombre as banco,
CT.CTA_DISP_P_TIPO_CTA,
desencriptar(CT.CTA_DISP_P_CTA),
'8000826650' as nit
FROM cta_dispersion_fcm ct , banco b
where ct.cta_disp_p_banco = b.idbanco
union
select distinct
'CTA DISPERSION FCM' AS  concepto,
ct.idbancorec as codigo,
'FCM DISPERSION LIBRE DISPOSICION 1.8 ' as combre,
ct.cta_disp_pa_banco,
b.nombre as banco,
CT.CTA_DISP_PA_TIPO_CTA,
desencriptar(CT.CTA_DISP_PA_CTA),
'8000826650' as nit
FROM cta_dispersion_fcm ct , banco b
where ct.cta_disp_pa_banco = b.idbanco
union
select distinct
'CTA DISPERSION FCM' AS  concepto,
ct.idbancorec as codigo,
'FCM DISPERSION ACUERDO PAGO' as combre,
ct.cta_disp_ac_banco,
b.nombre as banco,
CT.CTA_DISP_ac_TIPO_CTA,
desencriptar(CT.CTA_DISP_ac_CTA),
'8000826650' as nit
FROM cta_dispersion_fcm ct , banco b
where ct.cta_disp_ac_banco = b.idbanco
union
select distinct
'CTA RECAUDO EXTERNO CONCESIONARIO' as concepto,
ct.idconcesionario as codigo,
('CTA RECAUDO ' || c.nombre || ' ' || CT.INDTIPO ) as combre,
ct.idbanco,
b.nombre as banco,
ct.tipocuenta,
ct.cuenta,
c.nit_c as nit
from cta_recaudo_concesionario ct, concesionario c , banco b
where ct.idconcesionario = c.idconcesionario
and ct.idbanco = b.idbanco
union
select distinct
'CTA RECAUDO LOCAL FCM' as concepto,
ct.idbanco as codigo,
'CTA RECAUDO LOCAL FCM ' || ct.indtipo  as combre,
ct.idbanco,
b.nombre as banco,
ct.tipocuenta,
ct.cuenta,
ct.nit_fcm as nit
from cta_recaudo_fcm ct, banco b
where ct.idbanco = b.idbanco
union
select distinct
'CTA DISPERSION MUNICIPIO' as concepto,
m.idmunicipio,
'CTA DISPERSION ' || m.idmunicipio || ' ' || m.nombre as concepto,
m.idbanco,
b.nombre,
m.tipocuenta,
desencriptar(m.cuenta),
m.nit_cta
FROM municipio m, banco b
where m.idbanco = b.idbanco
and m.idmunicipio <> '00000000'
union
select distinct
'CTA DISPERSION TERCERO' as concepto,
t.nit_t,
'CTA DISPERSION ' || t.nombre as concepto,
t.idbanco,
b.nombre,
t.tipocuenta,
desencriptar(t.cuenta),
t.nit_t
FROM TERCERO t, banco b
where t.idbanco = b.idbanco;

