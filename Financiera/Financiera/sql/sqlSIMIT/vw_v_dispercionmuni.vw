create or replace view vw_v_dispercionmuni as
select municipio.idmunicipio DIVIPO,
       municipio.nombre NOMBRE,
       dias_dispersion.idbanco IDBANCO,
       banco.nombre BANCO,
       dias_dispersion.dias_dispersion_se DiasSIMITExterno,
       decode(dias_dispersion.frec_dispersion_se,0,'Ninguno',1,'Semanal',2,'Quincenal',3,'Mensual') FrecSIMITExterno,
       dias_dispersion.dias_dispersion_pe DiasPOLCAExterno,
       decode(dias_dispersion.frec_dispersion_pe,0,'Ninguno',1,'Semanal',2,'Quincenal',3,'Mensual')  FrecPOLCAExterno
  from municipio,
       dias_dispersion,
       banco
 where municipio.idmunicipio = dias_dispersion.idmunicipio
       and banco.idbanco = dias_dispersion.idbanco
order by 1, 3;

