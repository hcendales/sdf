---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 02/03/2012, 15:32:06 --
---------------------------------------------

spool 15_vw.log

prompt
prompt Creating view VW_DEVOLUCIONESACH
prompt ================================
prompt
create or replace view vw_devolucionesach as
select d.fec_dispersion,
       d.concepto,
       d.ori_idbanco,
       bo.nombre bancoOrigen,
       d.ori_cuenta,
       des_idbanco,
       bd.nombre bancoDestino,
       d.des_tipocuenta,
       simit.desencriptar(d.des_cuenta) cuentaDestino,
       d.des_nit,
       d.indtipo,
       d.valor,
       d.idmunicipio,

       (case
         when d.estadotrf is null then
          'ENV'
         else
          d.estadotrf
       end) as estadoTrf,

       d.fechaenvio,
       d.fechaconfirmada,
       d.fechadevolucion,
       d.motivodevolucion,
       d.codigodevolucion,

       (case
         when estadotrf is null then
          'Enviado sin confirmar'
         when estadotrf = 'ENV' then
          'Enviado sin confirmar'
         when estadotrf = 'EXI' then
          'Confirmada exitosamente'
         when estadotrf = 'REC' then
          motivodevolucion
         else
          'estado no definido'
       end) mensajeEstado,

       (case
         when estadotrf is null then
          d.fec_Dispersion
         when estadotrf = 'ENV' then
          d.fechaenvio
         when estadotrf = 'EXI' then
          d.Fechaconfirmada
         when estadotrf = 'REC' then
          d.fechadevolucion
         else
          null
       end) fechaEstado,

       decode(referenciatrfori,null,referenciatrf,referenciatrfori) as referenciatrf

  from recaudo_externo_disp_tot d, banco bo, banco bd
 where --enviadobanco = 1 and
       bo.idbanco = d.ori_idbanco
   and bd.idbanco = d.des_idbanco
union
select fechaproceso as fec_dispersion,
       'OPERACION ACH NO REGISTRADA EN SDF' as concepto,
       bancoorigen as ori_idbanco,
       bo.nombre bancoOrigen,
       numerodecuentaorigen as ori_cuenta,
       bancodestino as des_idbanco,
       bd.nombre bancoDestino,
       tipodecuentadestino as des_tipocuenta,
       numerodecuentadestino as cuentaDestino,
       numeroidentificaciondestino as des_nit,
       '' as indtipo,
       valortransferencia as valor,
       '' as idmunicipio,
       'REC' as estadoTrf,
       null as fechaenvio,
       null as fechaconfirmada,
       fechaproceso as fechadevolucion,
       mensajederespuesta as motivodevolucion,
       codigoderespuesta as codigodevolucion,
       mensajederespuesta as mensajeEstado,
       fechaproceso as fechaEstado,
       0 as referenciatrf
  from resulproctrf, banco bo, banco bd
 where tipocargue = 'ACH'
   and regcruzo is null
   and bo.idbanco = bancoorigen
   and bd.idbanco = bancodestino
/


spool off
