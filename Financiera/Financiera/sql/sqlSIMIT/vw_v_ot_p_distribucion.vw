create or replace view vw_v_ot_p_distribucion as
select municipio.idmunicipio,
       municipio.nombre nombrem,
       concesionario.idconcesionario,
       concesionario.nombre nombrec,
       p_dispersion_municipio.municipio_s||'%' municipio_sIMIT ,
       p_dispersion_municipio.conces_contravencional_s||'%' conces_contravencional_sIMIT,
       p_dispersion_municipio.fcm_contravencional_s||'%' fcm_contravencional_simit,
       p_dispersion_municipio.acuerdopago_s||'%' acuerdopago_simit,
       p_dispersion_municipio.municipio_p||'%' municipio_polca ,
       p_dispersion_municipio.fcm_contravencional_p||'%' fcm_contravencional_polca ,
       p_dispersion_municipio.conces_contravencional_p||'%' conces_contravencional_polca,
       p_dispersion_municipio.acuerdopago_p||'%' acuerdopago_polca
  from municipio,
       concesionario,
       p_dispersion_municipio
 where concesionario.idconcesionario = municipio.idconcesionario
       and municipio.idmunicipio = p_dispersion_municipio.idmunicipio
order by 1;

