--------------------------------------------------------------
-- Export file for user SIMIT                               --
-- Created by ricardo.buitrago on 10/11/2010, 08:41:53 a.m. --
--------------------------------------------------------------

spool PROD_SIMIT_101110.log

prompt
prompt Creating package PK_PARAM
prompt =========================
prompt
@@pk_param.spc
prompt
prompt Creating package PK_PROC
prompt ========================
prompt
@@pk_proc.spc
prompt
prompt Creating package TYPES
prompt ======================
prompt
@@types.spc
prompt
prompt Creating function SEGURIDAD_ENCRIPTAR
prompt =====================================
prompt
@@seguridad_encriptar.fnc
prompt
prompt Creating function ENCRIPTAR
prompt ===========================
prompt
@@encriptar.fnc
prompt
prompt Creating function FN
prompt ====================
prompt
@@fn.fnc
prompt
prompt Creating function FN_TOKEN
prompt ==========================
prompt
@@fn_token.fnc
prompt
prompt Creating procedure SP_EX
prompt ========================
prompt
@@sp_ex.prc
prompt
prompt Creating function FN_DIVIDE_ARCHIVO_AVVILLAS
prompt ============================================
prompt
@@fn_divide_archivo_avvillas.fnc
prompt
prompt Creating function FN_DIVIDE_ARCHIVO_DEP
prompt =======================================
prompt
@@fn_divide_archivo_dep.fnc
prompt
prompt Creating function FN_FEC_DISPERSION
prompt ===================================
prompt
@@fn_fec_dispersion.fnc
prompt
prompt Creating function SHELL_RUN
prompt ===========================
prompt
@@shell_run.fnc
prompt
prompt Creating procedure LOAD_FILE
prompt ============================
prompt
@@load_file.prc
prompt
prompt Creating procedure SP_CREACION_ASOBANCARIA2001
prompt ==============================================
prompt
@@sp_creacion_asobancaria2001.prc
prompt
prompt Creating procedure SP_LOG
prompt =========================
prompt
@@sp_log.prc
prompt
prompt Creating procedure SP_ENVIARCORREO
prompt ==================================
prompt
@@sp_enviarcorreo.prc
prompt
prompt Creating procedure SP_ENVIONOTIFICACION
prompt =======================================
prompt
@@sp_envionotificacion.prc
prompt
prompt Creating procedure SP_LIQ_REC_LOCAL
prompt ===================================
prompt
@@sp_liq_rec_local.prc
prompt
prompt Creating procedure SP_LIQ_REC_LOCAL_BQUILLA
prompt ===========================================
prompt
@@sp_liq_rec_local_bquilla.prc
prompt
prompt Creating procedure SP_LIQ_REC_LOCAL_bquilla
prompt ===========================================
prompt
@@sp_liq_rec_local_bquilla.prc
prompt
prompt Creating procedure SP_PARALELO_TEMP
prompt ===================================
prompt
@@sp_paralelo_temp.prc
prompt
prompt Creating procedure SP_V_USUARIO
prompt ===============================
prompt
@@sp_v_usuario.prc
prompt
prompt Creating package body PK_AUTEN
prompt ==============================
prompt
@@pk_auten.bdy
prompt
prompt Creating package body PK_PARAM
prompt ==============================
prompt
@@pk_param.bdy
prompt
prompt Creating package body PK_PROC
prompt =============================
prompt
@@pk_proc.bdy
prompt
prompt Creating trigger TRG_REC_LOC_HIST
prompt =================================
prompt
@@trg_rec_loc_hist.trg
prompt
prompt Creating trigger TRG_RECLOC_LIQHIS
prompt ==================================
prompt
@@trg_recloc_liqhis.trg
prompt
prompt Creating trigger TRG_TMP_VILLAS_091031
prompt ======================================
prompt
@@trg_tmp_villas_091031.trg

spool off
