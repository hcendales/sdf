create or replace view vw_v_terceromuni as
select municipio.idmunicipio DIVIPO,
       municipio.nombre NOMBREm,
       tercero.num_tercero TERCERO,
       tercero.nombre NOMBREt,
       decode(tercero.ind_base,1,'Vr Municipio 100%',2,'Vr Adicional',3,'Vr Recaudo sin Adicional',4,'Vr Neto Municipio') INDICADOR,
       base_s||'%' BASELIQUIDACION_SIMIT,
       base_p||'%' BASELIQUIDACION_POLCA
  from tercero,
       municipio,
       banco
 where municipio.idmunicipio = tercero.idmunicipio
       and banco.idbanco = tercero.idbanco
ORDER BY 1,3;

