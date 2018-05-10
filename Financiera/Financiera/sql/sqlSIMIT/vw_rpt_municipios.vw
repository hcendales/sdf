create or replace view vw_rpt_municipios as
select m.idmunicipio,
       m.nit_m,
       m.nombre,
       m.iddepartamento,
       m.idconcesionario,
       m.correo,
       m.indretroactividad,
       m.idbanco,
       m.tipocuenta,
       m.cuenta,
       m.nit_cta,
       m.indliq_s_ext,
       m.indliq_s_local,
       m.indliq_p_ext,
       m.indliq_p_local,
       m.indacuerdopago_2002,
       pm.municipio_s,
       pm.fcm_contravencional_s,
       pm.conces_contravencional_s,
       pm.acuerdopago_s,
       pm.municipio_p,
       pm.fcm_contravencional_p,
       pm.conces_contravencional_p,
       pm.acuerdopago_p
 from p_dispersion_municipio pm, municipio m
 where pm.idmunicipio = m.idmunicipio;

