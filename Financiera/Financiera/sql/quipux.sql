----------------------------------------------
-- Export file for user QUIPUX              --
-- Created by SEVEN on 10/05/2018, 17:06:21 --
----------------------------------------------

set define off
spool quipux.log

prompt
prompt Creating table SIMIT_OPERADOR
prompt =============================
prompt
create table SIMIT_OPERADOR
(
  id_operador             VARCHAR2(10) not null,
  nombre_operador         VARCHAR2(30) not null,
  id_entidad_distribucion NUMBER(6),
  codigobarra             VARCHAR2(13),
  ean                     VARCHAR2(13)
)
;
alter table SIMIT_OPERADOR
  add constraint PK_SIMIT_OPERADOR primary key (ID_OPERADOR);

prompt
prompt Creating table SIMIT_ZONA
prompt =========================
prompt
create table SIMIT_ZONA
(
  id_zona                 VARCHAR2(2) not null,
  descripcion             VARCHAR2(30),
  id_operador             VARCHAR2(10),
  id_entidad_distribucion NUMBER(6)
)
;
create index I_SIMITZONA_IDENTIDADDIS on SIMIT_ZONA (ID_ENTIDAD_DISTRIBUCION);
create index I_SIMITZONA_IDOPERADOR on SIMIT_ZONA (ID_OPERADOR);
alter table SIMIT_ZONA
  add primary key (ID_ZONA);
alter table SIMIT_ZONA
  add foreign key (ID_OPERADOR)
  references SIMIT_OPERADOR (ID_OPERADOR);

prompt
prompt Creating table SIMIT_DEPARTAMENTO
prompt =================================
prompt
create table SIMIT_DEPARTAMENTO
(
  id_departamento VARCHAR2(8) not null,
  descripcion     VARCHAR2(30),
  id_zona         VARCHAR2(2)
)
;
create index I_SIMITDEPARTAMENTO_IDZONA on SIMIT_DEPARTAMENTO (ID_ZONA);
alter table SIMIT_DEPARTAMENTO
  add primary key (ID_DEPARTAMENTO);
alter table SIMIT_DEPARTAMENTO
  add foreign key (ID_ZONA)
  references SIMIT_ZONA (ID_ZONA);

prompt
prompt Creating table SIMIT_CIUDAD
prompt ===========================
prompt
create table SIMIT_CIUDAD
(
  id_ciudad       VARCHAR2(10) not null,
  descripcion     VARCHAR2(30) not null,
  id_departamento VARCHAR2(8) not null
)
;
create index I_SIMITCIUDAD_IDDEPARTAMENTO on SIMIT_CIUDAD (ID_DEPARTAMENTO);
alter table SIMIT_CIUDAD
  add constraint PK_SIMIT_CIUDAD primary key (ID_CIUDAD);
alter table SIMIT_CIUDAD
  add foreign key (ID_DEPARTAMENTO)
  references SIMIT_DEPARTAMENTO (ID_DEPARTAMENTO);

prompt
prompt Creating table SIMIT_SECRETARIA
prompt ===============================
prompt
create table SIMIT_SECRETARIA
(
  id_secretaria           VARCHAR2(10) not null,
  descripcion             VARCHAR2(30) not null,
  id_operador             VARCHAR2(10) not null,
  id_ciudad               VARCHAR2(10) not null,
  id_entidad_distribucion NUMBER(6),
  tipo_polca              VARCHAR2(1) default 'S'
)
;
create index I_SIMITSECRETARIA_IDCIUDAD on SIMIT_SECRETARIA (ID_CIUDAD);
create index I_SIMITSECRETARIA_IDENTIDADDIS on SIMIT_SECRETARIA (ID_ENTIDAD_DISTRIBUCION);
create index I_SIMITSECRETARIA_IDOPERADO on SIMIT_SECRETARIA (ID_OPERADOR);
alter table SIMIT_SECRETARIA
  add constraint PK_SIMIT_SECRETARIA primary key (ID_SECRETARIA);
alter table SIMIT_SECRETARIA
  add foreign key (ID_CIUDAD)
  references SIMIT_CIUDAD (ID_CIUDAD);
alter table SIMIT_SECRETARIA
  add foreign key (ID_OPERADOR)
  references SIMIT_OPERADOR (ID_OPERADOR);

prompt
prompt Creating table SIMIT_TIPO_ARCHIVO
prompt =================================
prompt
create table SIMIT_TIPO_ARCHIVO
(
  id_tipo_archivo NUMBER(2) not null,
  descripcion     VARCHAR2(30) not null
)
;
alter table SIMIT_TIPO_ARCHIVO
  add primary key (ID_TIPO_ARCHIVO);

prompt
prompt Creating table SIMIT_CARGA_INFORMACION
prompt ======================================
prompt
create table SIMIT_CARGA_INFORMACION
(
  id_proceso_carga NUMBER(10) not null,
  id_tipo_archivo  NUMBER(2) not null,
  fecha_carga      DATE not null,
  id_secretaria    VARCHAR2(10) not null,
  id_usuario_qx    VARCHAR2(15) not null,
  carga_exitosa    VARCHAR2(1),
  tamano           NUMBER(14),
  cant_registros   NUMBER(8) not null,
  valor_registros  NUMBER(14) not null,
  registros_ok     NUMBER(8) not null,
  valor_ok         NUMBER(14) not null,
  id_estado_carga  NUMBER(2) not null,
  numero_oficio    VARCHAR2(15),
  cant_duplicados  NUMBER(5) default 0 not null,
  valor_duplicados NUMBER(14) default 0 not null,
  encabezado       VARCHAR2(50),
  observaciones    VARCHAR2(150),
  id_operador      VARCHAR2(2)
)
;
create index INDX_FECHACARGA on SIMIT_CARGA_INFORMACION (FECHA_CARGA);
create index INDX_PC on SIMIT_CARGA_INFORMACION (ID_PROCESO_CARGA);
alter table SIMIT_CARGA_INFORMACION
  add primary key (ID_PROCESO_CARGA, ID_TIPO_ARCHIVO);
alter table SIMIT_CARGA_INFORMACION
  add foreign key (ID_OPERADOR)
  references SIMIT_OPERADOR (ID_OPERADOR);
alter table SIMIT_CARGA_INFORMACION
  add foreign key (ID_SECRETARIA)
  references SIMIT_SECRETARIA (ID_SECRETARIA);
alter table SIMIT_CARGA_INFORMACION
  add foreign key (ID_TIPO_ARCHIVO)
  references SIMIT_TIPO_ARCHIVO (ID_TIPO_ARCHIVO);

prompt
prompt Creating table SIMIT_CARTERA
prompt ============================
prompt
create table SIMIT_CARTERA
(
  consecutivo_cartera NUMBER(10) not null,
  valor_cartera       NUMBER(9) not null,
  estado_cartera      VARCHAR2(2) not null,
  fecha_carga         DATE not null,
  fecha_descarga      DATE,
  valor_adicional     NUMBER(9),
  total_cartera       NUMBER(9),
  numero_cuotas       NUMBER(3)
)
;
create index I_SIMIT_CARTERA_ESTADO on SIMIT_CARTERA (ESTADO_CARTERA);
create index I_SIMITCARTERA_FECHACARGA on SIMIT_CARTERA (FECHA_CARGA);
create index I_SIMITCARTERA_FECHADESCAR on SIMIT_CARTERA (FECHA_DESCARGA);
alter table SIMIT_CARTERA
  add constraint PK_SIMIT_CARTERA primary key (CONSECUTIVO_CARTERA);

prompt
prompt Creating table SIMIT_COMPARENDO
prompt ===============================
prompt
create table SIMIT_COMPARENDO
(
  consecutivo_comp           NUMBER(10) not null,
  orden_comparendo           VARCHAR2(20) not null,
  fecha                      DATE not null,
  hora                       DATE,
  direccion                  VARCHAR2(80),
  placa                      VARCHAR2(8),
  tipo_vehiculo              NUMBER(2) not null,
  clase_servicio             NUMBER(2) not null,
  documento_identidad        VARCHAR2(15) not null,
  id_tipo_documento          NUMBER(2) not null,
  nombre                     VARCHAR2(18),
  apellido                   VARCHAR2(25),
  licencia_conduccion        VARCHAR2(15),
  categoria                  VARCHAR2(2),
  id_secretaria_exp_licencia VARCHAR2(10),
  fecha_vence_lic            DATE,
  direccion_infractor        VARCHAR2(40),
  telefono_infractor         VARCHAR2(15),
  id_ciudad                  VARCHAR2(10) not null,
  tipo_infractor             VARCHAR2(2) not null,
  licencia_transito          VARCHAR2(16),
  placa_agente               VARCHAR2(10) not null,
  observaciones              VARCHAR2(100),
  reporta_fuga               VARCHAR2(1),
  accidente                  VARCHAR2(1) not null,
  inmoviliza_vehiculo        VARCHAR2(1),
  valor_comparendo           NUMBER(9) not null,
  id_secretaria              VARCHAR2(10) not null,
  id_proceso_carga           NUMBER(10) not null,
  id_estado                  VARCHAR2(2),
  valor_adicional            NUMBER(9),
  polca                      VARCHAR2(1),
  impreso                    VARCHAR2(1),
  divipo_muni                VARCHAR2(8),
  localidad_comuna           VARCHAR2(30),
  divipo_matri               VARCHAR2(8),
  codigo_radio               NUMBER(1),
  codigo_modalidad           NUMBER(1),
  codigo_pasajeros           NUMBER(1),
  edad_infractor             NUMBER(2),
  email                      VARCHAR2(40),
  divipo_licen               VARCHAR2(8),
  identificacion             VARCHAR2(15),
  id_tipo_doc_prop           NUMBER(1),
  nombre_prop                VARCHAR2(50),
  nombre_empresa             VARCHAR2(30),
  nit_empresa                VARCHAR2(15),
  tarjeta_operacion          VARCHAR2(10),
  patio_inmoviliza           VARCHAR2(30),
  dir_patio_inmovi           VARCHAR2(30),
  grua_numero                VARCHAR2(10),
  placa_grua                 VARCHAR2(6),
  consecuti_inmovi           NUMBER(15),
  identificaciontest         VARCHAR2(15),
  nombre_testi               VARCHAR2(50),
  direc_testi                VARCHAR2(40),
  tele_testigo               VARCHAR2(15),
  comparendos_electronicos   VARCHAR2(2),
  fecha_notificacion         DATE,
  grado_alcohol              VARCHAR2(10)
)
;
create index IDX$$_02B30002 on SIMIT_COMPARENDO (ID_SECRETARIA, DOCUMENTO_IDENTIDAD, ID_TIPO_DOCUMENTO, ORDEN_COMPARENDO);
create index IDX$$_07C70001 on SIMIT_COMPARENDO (ORDEN_COMPARENDO, DOCUMENTO_IDENTIDAD);
create index IDX$$_3F17D0001 on SIMIT_COMPARENDO (ORDEN_COMPARENDO, ID_SECRETARIA);
create index IDX$$_3F8990001 on SIMIT_COMPARENDO (ID_SECRETARIA, POLCA, FECHA);
create index I_SIMITCOMPARENDO_CARGA on SIMIT_COMPARENDO (ID_PROCESO_CARGA);
create index I_SIMITCOMPARENDO_DOCUMENTO on SIMIT_COMPARENDO (DOCUMENTO_IDENTIDAD);
create index I_SIMITCOMPARENDO_FECHA on SIMIT_COMPARENDO (FECHA);
create index I_SIMITCOMPARENDO_IDESTADO on SIMIT_COMPARENDO (ID_ESTADO, POLCA);
create index I_SIMITCOMPARENDO_ORDENCOMPA on SIMIT_COMPARENDO (ORDEN_COMPARENDO);
create index I_SIMITCOMPARENDO_PLACA on SIMIT_COMPARENDO (PLACA);
create index REF_1135_FK on SIMIT_COMPARENDO (ID_SECRETARIA);
alter table SIMIT_COMPARENDO
  add constraint PK_SIMIT_COMPARENDO primary key (CONSECUTIVO_COMP);
alter table SIMIT_COMPARENDO
  add constraint IND_COMP_DUP unique (ORDEN_COMPARENDO, DOCUMENTO_IDENTIDAD, ID_TIPO_DOCUMENTO, ID_SECRETARIA, ID_ESTADO);
alter table SIMIT_COMPARENDO
  add foreign key (ID_SECRETARIA)
  references SIMIT_SECRETARIA (ID_SECRETARIA);
alter table SIMIT_COMPARENDO
  add foreign key (ID_CIUDAD)
  references SIMIT_CIUDAD (ID_CIUDAD)
  disable;

prompt
prompt Creating table SIMIT_DETALLE_LIQUIDA
prompt ====================================
prompt
create table SIMIT_DETALLE_LIQUIDA
(
  cod_liquidacion      NUMBER(10) not null,
  consecutivo_cartera  NUMBER(10) not null,
  valor_liquidado      NUMBER(9) not null,
  id_secretaria_expide VARCHAR2(10),
  descuento            VARCHAR2(2)
)
;
create index I_SIMITDETALLELIQ_CONSECTUIV on SIMIT_DETALLE_LIQUIDA (CONSECUTIVO_CARTERA);
alter table SIMIT_DETALLE_LIQUIDA
  add constraint PK_SIMIT_DETALLE_LIQUIDA primary key (COD_LIQUIDACION);

prompt
prompt Creating table SIMIT_DET_LIQUIDA_COMPARENDO
prompt ===========================================
prompt
create table SIMIT_DET_LIQUIDA_COMPARENDO
(
  cod_liquidacion       NUMBER(10) not null,
  orden_comparendo      VARCHAR2(20),
  secretaria_comparendo VARCHAR2(10),
  valor_liquidado       NUMBER(9),
  fecha_liquida         DATE,
  id_contraventor       VARCHAR2(15),
  id_tipo_documento     NUMBER(2),
  id_usuario_qx         VARCHAR2(15),
  numero_forma          VARCHAR2(15),
  id_secretaria_expide  VARCHAR2(10),
  codigo_validador      VARCHAR2(4),
  descuento             VARCHAR2(2),
  valor_descuento_simit NUMBER(9),
  codigobarras          VARCHAR2(150)
)
;
alter table SIMIT_DET_LIQUIDA_COMPARENDO
  add primary key (COD_LIQUIDACION);

prompt
prompt Creating table SIMIT_ESTADO_CARTERA
prompt ===================================
prompt
create table SIMIT_ESTADO_CARTERA
(
  id_estado   VARCHAR2(2) not null,
  descripcion VARCHAR2(30)
)
;
alter table SIMIT_ESTADO_CARTERA
  add constraint PK_SIMIT_ESTADO_CARTERA primary key (ID_ESTADO);

prompt
prompt Creating table SIMIT_ESTADO_COMPARENDO
prompt ======================================
prompt
create table SIMIT_ESTADO_COMPARENDO
(
  id_estado   VARCHAR2(2) not null,
  descripcion VARCHAR2(30),
  visualizar  VARCHAR2(1) default 'N'
)
;
alter table SIMIT_ESTADO_COMPARENDO
  add primary key (ID_ESTADO);

prompt
prompt Creating table SIMIT_TIPO_INFRACCION
prompt ====================================
prompt
create table SIMIT_TIPO_INFRACCION
(
  id_infraccion        NUMBER(5) not null,
  cod_infraccion       VARCHAR2(5),
  desc_infraccion      VARCHAR2(1000) not null,
  abrev_infraccion     VARCHAR2(50) not null,
  articulo             VARCHAR2(40) not null,
  articulo_modificador VARCHAR2(40) not null,
  valor_smd_desde      FLOAT not null,
  valor_smd_hasta      FLOAT not null,
  vigente              VARCHAR2(1),
  retiene_vehiculo     VARCHAR2(1),
  tiempo_suspension    NUMBER(3),
  amonestacion         VARCHAR2(1),
  proce_cobra_publico  NUMBER(3,2),
  infraccion_municipal VARCHAR2(1) not null,
  id_secretaria        VARCHAR2(10),
  fecha_desde          DATE,
  fecha_hasta          DATE
)
;
create index I_SIMITTIPOINFRA_CODINFRA on SIMIT_TIPO_INFRACCION (COD_INFRACCION);
alter table SIMIT_TIPO_INFRACCION
  add constraint PK_TIPO_INFRACCION primary key (ID_INFRACCION);
alter table SIMIT_TIPO_INFRACCION
  add foreign key (ID_SECRETARIA)
  references SIMIT_SECRETARIA (ID_SECRETARIA);

prompt
prompt Creating table SIMIT_INFRACCION_COMPARENDO
prompt ==========================================
prompt
create table SIMIT_INFRACCION_COMPARENDO
(
  consecutivo_comp NUMBER(10) not null,
  id_infraccion    FLOAT not null,
  vaor_infraccion  NUMBER(9) not null
)
;
create index I_INFRACCIONCOMPARENDO on SIMIT_INFRACCION_COMPARENDO (CONSECUTIVO_COMP);
create index I_INFRACCIONCOMPARENDO_1 on SIMIT_INFRACCION_COMPARENDO (ID_INFRACCION);
alter table SIMIT_INFRACCION_COMPARENDO
  add foreign key (CONSECUTIVO_COMP)
  references SIMIT_COMPARENDO (CONSECUTIVO_COMP) on delete cascade
  disable;
alter table SIMIT_INFRACCION_COMPARENDO
  add foreign key (ID_INFRACCION)
  references SIMIT_TIPO_INFRACCION (ID_INFRACCION);

prompt
prompt Creating table SIMIT_RECAUDO
prompt ============================
prompt
create table SIMIT_RECAUDO
(
  consecutivo_recaudo NUMBER(8) not null,
  cuenta              VARCHAR2(30),
  fecha_desde_mvto    DATE,
  fecha_hasta_mvto    DATE,
  total               NUMBER(12),
  id_proceso_carga    NUMBER(10),
  cod_banco           VARCHAR2(15)
)
;
create index I_SRECAUDO_FECHADESDEMVTO on SIMIT_RECAUDO (FECHA_DESDE_MVTO);
create index I_SRECAUDO_FECHAHASTAMVTO on SIMIT_RECAUDO (FECHA_HASTA_MVTO);
create index I_SRECAUDO_IDPROCESOCARGA on SIMIT_RECAUDO (ID_PROCESO_CARGA);
alter table SIMIT_RECAUDO
  add primary key (CONSECUTIVO_RECAUDO);

prompt
prompt Creating table SIMIT_RECAUDO_DETALLE
prompt ====================================
prompt
create table SIMIT_RECAUDO_DETALLE
(
  consecutivo_detalle   NUMBER(8) not null,
  consecutivo_recaudo   NUMBER(8) not null,
  id_estado_recaudo     VARCHAR2(2),
  id_tipo_distribucion  NUMBER(2),
  id_tipo_recaudo       VARCHAR2(2),
  id_secretaria_origen  VARCHAR2(10),
  id_procedencia_pago   VARCHAR2(2),
  numero_consignacion   VARCHAR2(30),
  fecha_transaccion     DATE,
  fecha_contable        DATE,
  valor_efectivo        NUMBER(12),
  valor_cheque          NUMBER(12),
  total_recaudo         NUMBER(12),
  numero_referencia     VARCHAR2(20),
  identificacion        VARCHAR2(15),
  observaciones         VARCHAR2(100),
  distribuido           VARCHAR2(1) default 'N' not null,
  valor_recaudo         NUMBER(14,2),
  valor_adicional       NUMBER(14,2),
  consecutivo_aplica    NUMBER(10),
  tipo_aplica           VARCHAR2(1),
  polca                 VARCHAR2(1),
  numero_corte          NUMBER(8),
  codigo_banco          VARCHAR2(15),
  indicador_fecha       VARCHAR2(1),
  validador_fecha       VARCHAR2(4),
  tipo_recaudo_externo  VARCHAR2(2),
  visualiza_reporte     VARCHAR2(1),
  id_tipo_doc           NUMBER(2),
  valor_descuento_simit NUMBER(9),
  valor_interes         NUMBER(9)
)
;
create index IDX$$_02C80001 on SIMIT_RECAUDO_DETALLE (NUMERO_REFERENCIA, IDENTIFICACION, ID_SECRETARIA_ORIGEN);
create index I_RECAUDODETALLE_1 on SIMIT_RECAUDO_DETALLE (FECHA_CONTABLE, IDENTIFICACION, NUMERO_REFERENCIA, ID_TIPO_RECAUDO);
create index I_RECAUDODET_NROCORTE on SIMIT_RECAUDO_DETALLE (NUMERO_CORTE);
create index I_SRECAUDODETALLE_CONSEDETALLE on SIMIT_RECAUDO_DETALLE (CONSECUTIVO_DETALLE);
create index I_SRECAUDODETALLE_CONSERECAUDO on SIMIT_RECAUDO_DETALLE (CONSECUTIVO_RECAUDO);
create index I_SRECAUDODETALLE_DISTRIBUIDO on SIMIT_RECAUDO_DETALLE (DISTRIBUIDO);
create index I_SRECAUDODETALLE_FECHACONTAB on SIMIT_RECAUDO_DETALLE (FECHA_CONTABLE);
create index I_SRECAUDODETALLE_FECHATRANSA on SIMIT_RECAUDO_DETALLE (FECHA_TRANSACCION);
create index I_SRECAUDODETALLE_IDENTIFICACI on SIMIT_RECAUDO_DETALLE (IDENTIFICACION);
create index I_SRECAUDODETALLE_IDESTADORECA on SIMIT_RECAUDO_DETALLE (ID_ESTADO_RECAUDO);
create index I_SRECAUDODETALLE_IDPROCEDPAGO on SIMIT_RECAUDO_DETALLE (ID_PROCEDENCIA_PAGO);
create index I_SRECAUDODETALLE_IDSECORIGEN on SIMIT_RECAUDO_DETALLE (ID_SECRETARIA_ORIGEN);
create index I_SRECAUDODETALLE_IDTIPODISTRI on SIMIT_RECAUDO_DETALLE (ID_TIPO_DISTRIBUCION);
create index I_SRECAUDODETALLE_IDTIPORECAU on SIMIT_RECAUDO_DETALLE (ID_TIPO_RECAUDO);
create index I_SRECAUDODETALLE_NUMEROREFERE on SIMIT_RECAUDO_DETALLE (NUMERO_REFERENCIA, IDENTIFICACION);
create index L_SRECAUDODETALLE_NUMREF on SIMIT_RECAUDO_DETALLE (NUMERO_REFERENCIA);
alter table SIMIT_RECAUDO_DETALLE
  add primary key (CONSECUTIVO_DETALLE, CONSECUTIVO_RECAUDO);
alter table SIMIT_RECAUDO_DETALLE
  add foreign key (CONSECUTIVO_RECAUDO)
  references SIMIT_RECAUDO (CONSECUTIVO_RECAUDO)
  disable;

prompt
prompt Creating table SIMIT_RESOLUCION
prompt ===============================
prompt
create table SIMIT_RESOLUCION
(
  id_resolucion            NUMBER(10) not null,
  id_secretaria            VARCHAR2(10) not null,
  id_tipo_doc              NUMBER(2) not null,
  id_contraventor          VARCHAR2(15) not null,
  nombres                  VARCHAR2(40),
  apellidos                VARCHAR2(40),
  direccion                VARCHAR2(40),
  telefono                 VARCHAR2(20),
  id_ciudad                VARCHAR2(10),
  nro_comparendo           VARCHAR2(20),
  fecha_comparendo         DATE,
  id_tipo_res              NUMBER(2) not null,
  nro_resolucion           VARCHAR2(20) not null,
  fecha_resolucion         DATE not null,
  fecha_hasta              DATE,
  consecutivo_cartera      NUMBER(10),
  id_proceso_carga         NUMBER(10) not null,
  procesado                VARCHAR2(1) not null,
  nro_resant               VARCHAR2(20),
  numero_registros         NUMBER(3),
  polca                    VARCHAR2(1),
  impreso                  VARCHAR2(1),
  comparendos_electronicos VARCHAR2(1),
  pendiente_ejecucion      VARCHAR2(2),
  fecha_coactivo           DATE,
  nro_coactivo             VARCHAR2(20),
  horas_comunitarias       VARCHAR2(10),
  grado_alcohol            VARCHAR2(10)
)
;
create index IDX$$_02BA0001 on SIMIT_RESOLUCION (ID_CONTRAVENTOR, NRO_RESOLUCION);
create index IDX$$_02B90001 on SIMIT_RESOLUCION (ID_CONTRAVENTOR, ID_SECRETARIA);
create index IDX$$_03420001 on SIMIT_RESOLUCION (ID_CONTRAVENTOR, NRO_COMPARENDO);
create index IND_RESOL_PRUE1 on SIMIT_RESOLUCION (NRO_RESOLUCION, FECHA_RESOLUCION, NRO_RESANT, NRO_COMPARENDO, FECHA_COMPARENDO, ID_CONTRAVENTOR, ID_TIPO_DOC, ID_TIPO_RES, ID_SECRETARIA);
create index IND_TEMPORAL1 on SIMIT_RESOLUCION (CONSECUTIVO_CARTERA);
create index I_SIMITRESOLUCION_CARGA on SIMIT_RESOLUCION (ID_PROCESO_CARGA);
create index I_SIMITRESOLUCION_CONS on SIMIT_RESOLUCION (CONSECUTIVO_CARTERA, ID_TIPO_RES, ID_SECRETARIA);
create index I_SIMITRESOLUCION_FECHACOMP on SIMIT_RESOLUCION (FECHA_COMPARENDO);
create index I_SIMITRESOLUCION_FECHARESO on SIMIT_RESOLUCION (FECHA_RESOLUCION);
create index I_SIMITRESOLUCION_IDCIUDAD on SIMIT_RESOLUCION (ID_CIUDAD);
create index I_SIMITRESOLUCION_IDCONTRAV on SIMIT_RESOLUCION (ID_CONTRAVENTOR);
create index I_SIMITRESOLUCION_NROCOMPAR on SIMIT_RESOLUCION (NRO_COMPARENDO);
create index I_SIMITRESOLUCION_NRORESOLU on SIMIT_RESOLUCION (NRO_RESOLUCION);
create index I_SIMITRESOLUCION_PROCESADO on SIMIT_RESOLUCION (PROCESADO);
create index I_SIMITRESOLUCION_1 on SIMIT_RESOLUCION (CONSECUTIVO_CARTERA, ID_SECRETARIA, NRO_RESOLUCION, ID_CONTRAVENTOR, ID_TIPO_DOC, ID_TIPO_RES);
create index REF_2919_FK on SIMIT_RESOLUCION (ID_SECRETARIA);
alter table SIMIT_RESOLUCION
  add constraint PK_SIMIT_RESOLUCION primary key (ID_RESOLUCION);
alter table SIMIT_RESOLUCION
  add constraint IND_RESOL_PRUE unique (NRO_RESOLUCION, FECHA_RESOLUCION, NRO_RESANT, NRO_COMPARENDO, FECHA_COMPARENDO, ID_CONTRAVENTOR, ID_TIPO_DOC, ID_TIPO_RES, ID_SECRETARIA);
alter table SIMIT_RESOLUCION
  add foreign key (ID_SECRETARIA)
  references SIMIT_SECRETARIA (ID_SECRETARIA);
alter table SIMIT_RESOLUCION
  add foreign key (ID_CIUDAD)
  references SIMIT_CIUDAD (ID_CIUDAD)
  disable;

prompt
prompt Creating table SIMIT_RES_INFRACCIONES
prompt =====================================
prompt
create table SIMIT_RES_INFRACCIONES
(
  id_resolucion NUMBER(10) not null,
  id_infraccion NUMBER(5) not null,
  valor_multa   NUMBER(10) not null,
  valor_pagar   NUMBER(10) not null
)
;
create index I_RESINFRACCIONES on SIMIT_RES_INFRACCIONES (ID_RESOLUCION);
create index I_RESINFRACCIONES_1 on SIMIT_RES_INFRACCIONES (ID_INFRACCION);
alter table SIMIT_RES_INFRACCIONES
  add constraint FK_RESOLUCION foreign key (ID_RESOLUCION)
  references SIMIT_RESOLUCION (ID_RESOLUCION) on delete cascade
  disable;
alter table SIMIT_RES_INFRACCIONES
  add foreign key (ID_INFRACCION)
  references SIMIT_TIPO_INFRACCION (ID_INFRACCION) on delete cascade;

prompt
prompt Creating table SIMIT_TIPO_DOCUMENTO
prompt ===================================
prompt
create table SIMIT_TIPO_DOCUMENTO
(
  id_tipo_doc            NUMBER(2) not null,
  descripcion            VARCHAR2(30) not null,
  tipo_documento_capital NUMBER(2)
)
;
alter table SIMIT_TIPO_DOCUMENTO
  add constraint PK_SIMIT_TIPO_DOCUMENTO primary key (ID_TIPO_DOC);

prompt
prompt Creating table SIMIT_TIPO_RECAUDO
prompt =================================
prompt
create table SIMIT_TIPO_RECAUDO
(
  id_tipo_recaudo VARCHAR2(2) not null,
  descripcion     VARCHAR2(30)
)
;
alter table SIMIT_TIPO_RECAUDO
  add primary key (ID_TIPO_RECAUDO);

prompt
prompt Creating table SIMIT_TIPO_RESOLUCION
prompt ====================================
prompt
create table SIMIT_TIPO_RESOLUCION
(
  id_tipo_res       NUMBER(2) not null,
  id_estado         VARCHAR2(2) not null,
  des_resolucion    VARCHAR2(40) not null,
  inserta_actualiza VARCHAR2(1) not null,
  visualizar        VARCHAR2(1) default 'N'
)
;
alter table SIMIT_TIPO_RESOLUCION
  add constraint PK_SIMIT_TIPO_RESOLUCION primary key (ID_TIPO_RES);

prompt
prompt Creating table VALOR_SMD_ANO
prompt ============================
prompt
create table VALOR_SMD_ANO
(
  ano   VARCHAR2(4) not null,
  valor NUMBER(7) not null
)
;
alter table VALOR_SMD_ANO
  add constraint PK_VALOR_SMD_ANO primary key (ANO);


spool off
