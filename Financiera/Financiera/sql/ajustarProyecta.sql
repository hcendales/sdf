/* table liquidacion_comparendo;

create table liquidacion_comparendo as (
      select 
        SDLC.COD_LIQUIDACION, sdlc.ORDEN_COMPARENDO, sdlc.id_contraventor, SC.Orden_Comparendo as numComp, SC.FECHA
        from QUIPUX.SIMIT_DET_LIQUIDA_COMPARENDO SDLC,
             QUIPUX.SIMIT_COMPARENDO SC
        where SC.ORDEN_COMPARENDO = sdlc.ORDEN_COMPARENDO
           AND SC.DOCUMENTO_IDENTIDAD = sdlc.id_contraventor 
           and sdlc.secretaria_comparendo = sc.id_secretaria
           );

drop table liquidacion_resolucion;

create table liquidacion_resolucion as (

select SDL.COD_LIQUIDACION, SR.NRO_COMPARENDO, SR.FECHA_COMPARENDO
        from QUIPUX.SIMIT_DETALLE_LIQUIDA SDL, QUIPUX.SIMIT_RESOLUCION SR
       where  
       sdl.consecutivo_cartera > 0
       and SR.CONSECUTIVO_CARTERA = sdl.consecutivo_cartera );
*/

update recaudo_externo r
set ( r.num_comparendo , r.fec_comparendo ) = ( select max(l.numcomp) , max(l.fecha)
                                                from liquidacion_comparendo l
                                               where l.cod_liquidacion = substr(r.num_liquidacion,1,9) );
                                               
commit;
                                               
update recaudo_externo r
set ( r.num_comparendo , r.fec_comparendo ) = ( select max(l.nro_comparendo), max(l.fecha_comparendo)
                                                from liquidacion_resolucion l
                                               where l.cod_liquidacion = substr(r.num_liquidacion,1,9) )
where r.num_comparendo is null;                                               

commit;

update recaudo_externo r
set r.validador_fecha =
           (select v.idvalidador
              from validador_fecha v
             where v.idmunicipio = r.idmunicipio
               and r.fec_comparendo >= v.fecha_ini
               and r.fec_comparendo <= v.fecha_fin
               and substr(r.num_liquidacion, 8, 1) =
                   decode(V.indtipo, 'SIMIT', 0, 'POLCA', 1));

commit;

          update recaudo_externo r
             set r.indfecha2002 = 1
         where trunc(r.fec_comparendo) < to_date('08-11-2002', 'dd-mm-yyyy')
         and trunc(r.fec_comparendo) <> to_date('01-01-1900', 'dd-mm-yyyy');

commit;

update recaudo_externo r
     set r.indfecha2002 = 0
   where r.indfecha2002 is null;

  update recaudo_externo r
     set r.validador_fecha = '000'
   where r.validador_fecha is null;

  commit;

select distinct indfecha2002 from recaudo_externo
