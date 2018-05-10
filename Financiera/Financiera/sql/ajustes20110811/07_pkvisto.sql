---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 30/08/2011, 10:15:11 --
---------------------------------------------

spool 06_pkvisto.log

prompt
prompt Creating table VISTOBUENO
prompt =========================
prompt
create table SIMIT.VISTOBUENO
(
  FECHAREGISTRO   DATE,
  USUARIOREGISTRO NUMBER,
  TIPORECAUDO     CHAR(1),
  TIPOPROCESO     CHAR(1),
  FECHAINICIO     DATE,
  FECHAFIN        DATE,
  BANCO           CHAR(2),
  OBSERVACIONES   VARCHAR2(500),
  INTERVENTORIA   CHAR(1)
)
;
comment on column SIMIT.VISTOBUENO.FECHAREGISTRO
  is 'Fecha de registro';
comment on column SIMIT.VISTOBUENO.USUARIOREGISTRO
  is 'usuario que dio visto bueno';
comment on column SIMIT.VISTOBUENO.TIPORECAUDO
  is 'tipo de recaudo. L: Local, E:Externo';
comment on column SIMIT.VISTOBUENO.TIPOPROCESO
  is 'tipo de proceso. D:Distribucion T:Transferencia';
comment on column SIMIT.VISTOBUENO.FECHAINICIO
  is 'fecha de inicio';
comment on column SIMIT.VISTOBUENO.FECHAFIN
  is 'fecha de fin';
comment on column SIMIT.VISTOBUENO.BANCO
  is 'banco recaudador';
comment on column SIMIT.VISTOBUENO.OBSERVACIONES
  is 'observaciones';
comment on column SIMIT.VISTOBUENO.INTERVENTORIA
  is 'interventoria que da el visto bueno: S:Simit, P:POLCA';

prompt
prompt Creating package PK_VISTO
prompt =========================
prompt
create or replace package simit.PK_VISTO is

  -- Author  : USER
  -- Created : 30/08/2011 7:50:08
  -- Purpose : Manejo de vistos buenos

  PROCEDURE vistoBuenoS      (p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              
                              p_tipoRec varchar2,
                              p_proceso varchar2,
                              p_banco   varchar2,
                              p_observaciones varchar2,
                              
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2);

  PROCEDURE vistoBuenoP      (p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              
                              p_tipoRec varchar2,
                              p_proceso varchar2,
                              p_banco   varchar2,
                              p_observaciones varchar2,
                              
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2);
end PK_VISTO;
/

prompt
prompt Creating package body PK_VISTO
prompt ==============================
prompt
create or replace package body simit.PK_VISTO is

                             

  PROCEDURE vistoBuenoS      (p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              
                              p_tipoRec varchar2,
                              p_proceso varchar2,
                              p_banco   varchar2,
                              p_observaciones varchar2,
                              
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2) as
  
    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    w_desc varchar2(250);
   
  begin
  
    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;
  
    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;
  
    w_desc := '';
  
    if p_tipoRec = 'L' and p_proceso = 'D' then

        w_desc := ' RECAUDO LOCAL - DISTRIBUCION';
      
        SELECT COUNT(*)
        INTO w_registros
        FROM recaudo_local_liquidacion
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and idbanco = p_banco;
      
        if ( w_registros = 0 ) then
           p_error := 'No hay Recaudo local liquidado para el rango de fechas ingresado';
           return;
        end if; 
        
          
    end if;

    if p_tipoRec = 'L' and p_proceso = 'T' then
         w_desc := ' RECAUDO LOCAL - TRANSFERENCIA';
      
        SELECT COUNT(*)
        INTO w_registros
        from recaudo_local_disp_tot
        where fec_dispersion = w_fec_cor_ini
        and ori_idbanco = p_banco;
      
        if ( w_registros = 0 ) then
           p_error := 'No hay Recaudo local para transferir en la fecha ingresada';
           return;
        end if; 
          
    end if;

    insert into vistobueno
          (fecharegistro, usuarioregistro, tiporecaudo, tipoproceso, fechainicio, fechafin, banco, observaciones, interventoria)
    values
          (sysdate, p_usuario, p_tipoRec, p_proceso, w_fec_cor_ini, w_fec_cor_fin, p_banco, p_observaciones, 'S');
    commit;  
  
 
    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Visto Bueno Interventoria SIMIT ' || w_desc ||
                                        ' del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        ' al dia ' ||
                                        to_char(w_fec_cor_fin, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que se dio el visto bueno de la Interventoria SIMIT del ' ||
                                        w_desc || ' del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        ' al dia ' ||
                                        to_char(w_fec_cor_fin, 'yyyy-MM-dd') ||
                                        ' para el banco: ' || p_banco ||
                                        '. Con la siguiente observacion: ' ||
                                        p_observaciones,
                         p_usuario   => p_usuario);
  
    p_error := 'Visto bueno ingresado correctamente ';
  
    sp_log(p_usuario,
           'vistoBuenoS',
           p_tipoRec || '-' || p_proceso || '-' || p_banco || '-' || p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
           p_fec_ini_dia || ' a ' || p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
           p_fec_fin_dia);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [vistoBuenoS] ' || SQLERRM,
            p_error);
    
  end vistoBuenoS;

PROCEDURE vistoBuenoP      (p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_fec_fin_ano number,
                              p_fec_fin_mes number,
                              p_fec_fin_dia number,
                              
                              p_tipoRec varchar2,
                              p_proceso varchar2,
                              p_banco   varchar2,
                              p_observaciones varchar2,
                              
                              p_usuario varchar2,
                              p_error   OUT VARCHAR2) as
  
    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    w_desc varchar2(250);
   
  begin
  
    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;
  
    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;
  
    w_desc := '';
  
    if p_tipoRec = 'L' and p_proceso = 'D' then

        w_desc := ' RECAUDO LOCAL - DISTRIBUCION';
      
        SELECT COUNT(*)
        INTO w_registros
        FROM recaudo_local_liquidacion
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and idbanco = p_banco;
      
        if ( w_registros = 0 ) then
           p_error := 'No hay Recaudo local liquidado para el rango de fechas ingresado';
           return;
        end if; 
        
          
    end if;

    if p_tipoRec = 'L' and p_proceso = 'T' then
         w_desc := ' RECAUDO LOCAL - TRANSFERENCIA';
      
        SELECT COUNT(*)
        INTO w_registros
        from recaudo_local_disp_tot
        where fec_dispersion = w_fec_cor_ini
        and ori_idbanco = p_banco;
      
        if ( w_registros = 0 ) then
           p_error := 'No hay Recaudo local para transferir en la fecha ingresada';
           return;
        end if; 
          
    end if;

    insert into vistobueno
          (fecharegistro, usuarioregistro, tiporecaudo, tipoproceso, fechainicio, fechafin, banco, observaciones, interventoria)
    values
          (sysdate, p_usuario, p_tipoRec, p_proceso, w_fec_cor_ini, w_fec_cor_fin, p_banco, p_observaciones, 'P');
    commit;  
  
 
    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Visto Bueno Interventoria POLCA ' || w_desc ||
                                        ' del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        ' al dia ' ||
                                        to_char(w_fec_cor_fin, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que se dio el visto bueno de la Interventoria POLCA del ' ||
                                        w_desc || ' del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        ' al dia ' ||
                                        to_char(w_fec_cor_fin, 'yyyy-MM-dd') ||
                                        ' para el banco: ' || p_banco ||
                                        '. Con la siguiente observacion: ' ||
                                        p_observaciones,
                         p_usuario   => p_usuario);
  
    p_error := 'Visto bueno ingresado correctamente ';
  
    sp_log(p_usuario,
           'vistoBuenoP',
           p_tipoRec || '-' || p_proceso || '-' || p_banco || '-' || p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
           p_fec_ini_dia || ' a ' || p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
           p_fec_fin_dia);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [vistoBuenoP] ' || SQLERRM,
            p_error);
    
  end vistoBuenoP; 
                                 
end PK_VISTO;
/


spool off
