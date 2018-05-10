---------------------------------------------------
-- Export file for user SIMIT                    --
-- Created by linda.campo on 10/11/2010, 9:17:28 --
---------------------------------------------------

spool simit.log

prompt
prompt Creating table BANCO
prompt ====================
prompt
create table BANCO
(
  IDBANCO        CHAR(2) not null,
  NOMBRE         VARCHAR2(50),
  RESPONSABLE    VARCHAR2(100),
  CARGO          VARCHAR2(50),
  CORREO         VARCHAR2(500),
  TELEFONO       VARCHAR2(50),
  DIRCORRES      VARCHAR2(500),
  CUENTACONTABLE VARCHAR2(16)
)
;
comment on column BANCO.IDBANCO
  is 'Codigo del banco';
comment on column BANCO.NOMBRE
  is 'Nombre del banco';
comment on column BANCO.RESPONSABLE
  is 'Responsable principal en el banco';
comment on column BANCO.CARGO
  is 'Cargo del responsable en el banco';
comment on column BANCO.CORREO
  is 'Correo electronico del responsable';
comment on column BANCO.TELEFONO
  is 'Telefono de contacto del responsable';
comment on column BANCO.DIRCORRES
  is 'Direcci¿n de correspondencia';
alter table BANCO
  add constraint PK_IDBANCO primary key (IDBANCO);

prompt
prompt Creating table CONCEPTO
prompt =======================
prompt
create table CONCEPTO
(
  IDCONCEPTO NUMBER not null,
  NOMBRE     VARCHAR2(50)
)
;
comment on column CONCEPTO.IDCONCEPTO
  is 'Id concepto de liquidacion';
comment on column CONCEPTO.NOMBRE
  is 'Nombre del concepto de liquidacion';
alter table CONCEPTO
  add constraint PK_IDCONCEPTO primary key (IDCONCEPTO);

prompt
prompt Creating table CONCESIONARIO
prompt ============================
prompt
create table CONCESIONARIO
(
  IDCONCESIONARIO          CHAR(2) not null,
  NIT_C                    VARCHAR2(10),
  NOMBRE                   VARCHAR2(50),
  CORREO                   VARCHAR2(500),
  CTA_CONTABLE             VARCHAR2(16),
  CTA_CONTABLE_LIQUIDACION VARCHAR2(16),
  CTA_CONTABLE_FONDO       VARCHAR2(16)
)
;
comment on column CONCESIONARIO.IDCONCESIONARIO
  is 'Identificacion del concesionario';
comment on column CONCESIONARIO.NIT_C
  is 'Nit con digito del concesionario';
comment on column CONCESIONARIO.NOMBRE
  is 'Nombre del concesionario';
comment on column CONCESIONARIO.CORREO
  is 'Correo electronico ';
comment on column CONCESIONARIO.CTA_CONTABLE
  is 'Cuenta contable asignada (para futuro)';
comment on column CONCESIONARIO.CTA_CONTABLE_LIQUIDACION
  is 'Cuenta contable para liquidacion';
comment on column CONCESIONARIO.CTA_CONTABLE_FONDO
  is 'Cuenta contable para fondo';
alter table CONCESIONARIO
  add constraint PK_IDCONCESIONARIO primary key (IDCONCESIONARIO);

prompt
prompt Creating table CORREO
prompt =====================
prompt
create table CORREO
(
  TEXTO VARCHAR2(2000)
)
;

prompt
prompt Creating table CTA_DISPERSION_CONCESIONARIO
prompt ===========================================
prompt
create table CTA_DISPERSION_CONCESIONARIO
(
  IDCONCEPTO      NUMBER not null,
  IDCONCESIONARIO CHAR(2) not null,
  IDBANCO         CHAR(2),
  NIT_C           VARCHAR2(10),
  TIPOCUENTA      VARCHAR2(3),
  CUENTA          VARCHAR2(250),
  IDBANCOREC      CHAR(2) not null
)
;
comment on column CTA_DISPERSION_CONCESIONARIO.IDCONCEPTO
  is 'Id del concepto de liquidacion';
comment on column CTA_DISPERSION_CONCESIONARIO.IDCONCESIONARIO
  is 'Id del concesionario';
comment on column CTA_DISPERSION_CONCESIONARIO.IDBANCO
  is 'Id del banco para dispersion';
comment on column CTA_DISPERSION_CONCESIONARIO.NIT_C
  is 'Nit de la cuenta de dispersion';
comment on column CTA_DISPERSION_CONCESIONARIO.TIPOCUENTA
  is 'Tipo de cuenta de dispersion (AHO: Ahorros, CTE:Corriente)';
comment on column CTA_DISPERSION_CONCESIONARIO.CUENTA
  is 'Numero de cuenta de dispersion';
comment on column CTA_DISPERSION_CONCESIONARIO.IDBANCOREC
  is 'id banco recaudador';
alter table CTA_DISPERSION_CONCESIONARIO
  add constraint PK_CTA_DISPERSION_CONCESION primary key (IDCONCEPTO, IDCONCESIONARIO, IDBANCOREC);
alter table CTA_DISPERSION_CONCESIONARIO
  add constraint FK_IDCONCEPTO_CDC foreign key (IDCONCEPTO)
  references CONCEPTO (IDCONCEPTO);
alter table CTA_DISPERSION_CONCESIONARIO
  add constraint FK_IDCONCESIONARIO_CDC foreign key (IDCONCESIONARIO)
  references CONCESIONARIO (IDCONCESIONARIO);
alter table CTA_DISPERSION_CONCESIONARIO
  add constraint CH_TIPOCUENTA_DP
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table CTA_DISPERSION_FCM
prompt =================================
prompt
create table CTA_DISPERSION_FCM
(
  NIT_FCM                 VARCHAR2(10) not null,
  IDBANCOREC              CHAR(2) not null,
  CTA_DISP_S_BANCO        CHAR(2),
  CTA_DISP_S_TIPO_CTA     VARCHAR2(3),
  CTA_DISP_S_CTA          VARCHAR2(250),
  CTA_DISP_P_BANCO        CHAR(2),
  CTA_DISP_P_TIPO_CTA     VARCHAR2(3),
  CTA_DISP_P_CTA          VARCHAR2(250),
  CTA_DISP_PA_BANCO       CHAR(2),
  CTA_DISP_PA_TIPO_CTA    VARCHAR2(3),
  CTA_DISP_PA_CTA         VARCHAR2(250),
  CTA_DISP_AC_BANCO       CHAR(2),
  CTA_DISP_AC_TIPO_CTA    VARCHAR2(3),
  CTA_DISP_AC_CTA         VARCHAR2(250),
  BORRCTA_DISP_C_BANCO    CHAR(2),
  BORRCTA_DISP_C_TIPO_CTA VARCHAR2(3),
  BORRCTA_DISP_C_CTA      VARCHAR2(16),
  CTA_CON_S               VARCHAR2(16),
  CTA_CON_P               VARCHAR2(16),
  CTA_CON_PA              VARCHAR2(16),
  CTA_CON_AC              VARCHAR2(16)
)
;
comment on column CTA_DISPERSION_FCM.NIT_FCM
  is 'Nit FCM';
comment on column CTA_DISPERSION_FCM.IDBANCOREC
  is 'Banco Recaudador';
comment on column CTA_DISPERSION_FCM.CTA_DISP_S_BANCO
  is 'SIMIT Banco dispersion';
comment on column CTA_DISPERSION_FCM.CTA_DISP_S_TIPO_CTA
  is 'SIMIT Tipo de cuenta';
comment on column CTA_DISPERSION_FCM.CTA_DISP_S_CTA
  is 'SIMIT Numero de Cuenta';
comment on column CTA_DISPERSION_FCM.CTA_DISP_P_BANCO
  is 'POLCA Banco dispersion';
comment on column CTA_DISPERSION_FCM.CTA_DISP_P_TIPO_CTA
  is 'POLCA Tipo de cuenta';
comment on column CTA_DISPERSION_FCM.CTA_DISP_P_CTA
  is 'POLCA Numero de Cuenta';
comment on column CTA_DISPERSION_FCM.CTA_DISP_PA_BANCO
  is '1.8 Banco dispersion';
comment on column CTA_DISPERSION_FCM.CTA_DISP_PA_TIPO_CTA
  is '1.8 Tipo de cuenta';
comment on column CTA_DISPERSION_FCM.CTA_DISP_PA_CTA
  is '1.8 Numero de Cuenta';
comment on column CTA_DISPERSION_FCM.CTA_DISP_AC_BANCO
  is 'Banco Acuerdo de pago';
comment on column CTA_DISPERSION_FCM.CTA_DISP_AC_TIPO_CTA
  is 'Tipo Cuenta Acuerdo de Pago';
comment on column CTA_DISPERSION_FCM.CTA_DISP_AC_CTA
  is 'Cuenta Acuerdo de pago';
comment on column CTA_DISPERSION_FCM.BORRCTA_DISP_C_BANCO
  is 'Banco contravencional';
comment on column CTA_DISPERSION_FCM.BORRCTA_DISP_C_TIPO_CTA
  is 'Tipo Cuenta contravencional';
comment on column CTA_DISPERSION_FCM.BORRCTA_DISP_C_CTA
  is 'Cuenta Contravencional';
alter table CTA_DISPERSION_FCM
  add constraint PK_CTA_DISPERSION_FCM primary key (NIT_FCM, IDBANCOREC);
alter table CTA_DISPERSION_FCM
  add constraint CH_DISP_PA_TIPO_CTA
  check (CTA_DISP_pa_TIPO_CTA IN ('AHO','CTE'));
alter table CTA_DISPERSION_FCM
  add constraint CH_DISP_P_TIPO_CTA
  check (CTA_DISP_p_TIPO_CTA IN ('AHO','CTE'));
alter table CTA_DISPERSION_FCM
  add constraint CH_DISP_S_TIPO_CTA
  check (CTA_DISP_S_TIPO_CTA IN ('AHO','CTE'));

prompt
prompt Creating table CTA_DISPERSION_TERCERO
prompt =====================================
prompt
create table CTA_DISPERSION_TERCERO
(
  IDMUNICIPIO CHAR(8) not null,
  NIT_T       VARCHAR2(10) not null,
  IDBANCO     CHAR(2),
  TIPOCUENTA  VARCHAR2(3),
  CUENTA      VARCHAR2(16)
)
;
comment on column CTA_DISPERSION_TERCERO.IDMUNICIPIO
  is 'Divipo del municipio';
comment on column CTA_DISPERSION_TERCERO.NIT_T
  is 'NIT del tercero';
comment on column CTA_DISPERSION_TERCERO.IDBANCO
  is 'Id banco de transferencia de tercero';
comment on column CTA_DISPERSION_TERCERO.TIPOCUENTA
  is 'Tipo de cuenta de transferencia (AHO: Ahorros CTE: Corriente)';
comment on column CTA_DISPERSION_TERCERO.CUENTA
  is 'Numero de cuenta de transferencia';
alter table CTA_DISPERSION_TERCERO
  add constraint PK_CTA_DISPERSION_TERCERO primary key (IDMUNICIPIO, NIT_T);
alter table CTA_DISPERSION_TERCERO
  add constraint CH_TIPOCUENTA_DT
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table CTA_RECAUDO_CONCESIONARIO
prompt ========================================
prompt
create table CTA_RECAUDO_CONCESIONARIO
(
  IDCONCESIONARIO  CHAR(2) not null,
  IDBANCO          CHAR(2) not null,
  INDTIPO          VARCHAR2(5) not null,
  TIPOCUENTA       VARCHAR2(3),
  CUENTA           VARCHAR2(16) not null,
  COMISION_RECAUDO NUMBER,
  COMISION_ACH     NUMBER,
  CTA_CONTABLE     VARCHAR2(16),
  CTA_CONTABLE_ING VARCHAR2(16)
)
;
comment on column CTA_RECAUDO_CONCESIONARIO.IDCONCESIONARIO
  is 'Id concesionario';
comment on column CTA_RECAUDO_CONCESIONARIO.IDBANCO
  is 'Id Banco';
comment on column CTA_RECAUDO_CONCESIONARIO.INDTIPO
  is 'Tipo de recaudo (SIMIT, POLCA)';
comment on column CTA_RECAUDO_CONCESIONARIO.TIPOCUENTA
  is 'Tipo de cuenta (AHO: Ahorros CTE: Corriente)';
comment on column CTA_RECAUDO_CONCESIONARIO.CUENTA
  is 'Numero de cuenta';
comment on column CTA_RECAUDO_CONCESIONARIO.COMISION_RECAUDO
  is 'Comision de recuado con iva incluido';
comment on column CTA_RECAUDO_CONCESIONARIO.COMISION_ACH
  is 'Comision de transferencias ACH con IVA incluido';
comment on column CTA_RECAUDO_CONCESIONARIO.CTA_CONTABLE
  is 'Cuenta contable asignada';
alter table CTA_RECAUDO_CONCESIONARIO
  add constraint PK_CTA_RECAUDO_CONCESIONARIO primary key (IDCONCESIONARIO, IDBANCO, INDTIPO, CUENTA);
alter table CTA_RECAUDO_CONCESIONARIO
  add constraint FK_IDCONCESIONARIO_CRC foreign key (IDCONCESIONARIO)
  references CONCESIONARIO (IDCONCESIONARIO);
alter table CTA_RECAUDO_CONCESIONARIO
  add constraint CH_INDTIPO_R
  check (INDtipo IN ('SIMIT','POLCA'));
alter table CTA_RECAUDO_CONCESIONARIO
  add constraint CH_TIPOCUENTA_R
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table FCM
prompt ==================
prompt
create table FCM
(
  NIT_FCM                  VARCHAR2(10) not null,
  CORREO                   VARCHAR2(500),
  CTA_DISP_S_BANCO         CHAR(2),
  CTA_DISP_S_TIPO_CTA      VARCHAR2(3),
  CTA_DISP_S_CTA           VARCHAR2(16),
  CTA_DISP_P_BANCO         CHAR(2),
  CTA_DISP_P_TIPO_CTA      VARCHAR2(3),
  CTA_DISP_P_CTA           VARCHAR2(16),
  IVA                      NUMBER,
  RETENCION_FUENTE         NUMBER,
  IMPUESTO_TIMBRE_TERCERO  NUMBER,
  IMPUESTO_TIMBRE_FCM      NUMBER,
  DIRECTOR_EJECUTIVO       VARCHAR2(250),
  DIRECTOR_NACIONAL        VARCHAR2(250),
  CONTADOR_GENERAL         VARCHAR2(250),
  COORDINADOR_FINANCIERO   VARCHAR2(250),
  NIT_POLCA                VARCHAR2(10),
  NIT_SEVIAL               VARCHAR2(10),
  CTACON_PUENTE            VARCHAR2(16),
  CTACON_FONDO_COBERTURA   VARCHAR2(16),
  CTACON_POLCA             VARCHAR2(16),
  CTACON_FCM               VARCHAR2(16),
  CTA_DISP_PA_BANCO        CHAR(2),
  CTA_DISP_PA_TIPO_CTA     VARCHAR2(3),
  CTA_DISP_PA_CTA          VARCHAR2(16),
  CTACON_FCMA              VARCHAR2(16),
  CTACON_INGRESO           VARCHAR2(16),
  CTACON_IMPUESTOS         VARCHAR2(16),
  RETEIVA                  NUMBER,
  TIMBRE_CONTRAVENCIONAL   NUMBER,
  CTACON_PUENTE_EXT        VARCHAR2(16),
  M_DIRECTOR_EJECUTIVO     VARCHAR2(250),
  M_DIRECTOR_NACIONAL      VARCHAR2(250),
  M_CONTADOR_GENERAL       VARCHAR2(250),
  M_COORDINADOR_FINANCIERO VARCHAR2(250),
  DIAS_ACTIVACION          NUMBER,
  CTA_DISP_AC_BANCO        CHAR(2),
  CTA_DISP_AC_TIPO_CTA     VARCHAR2(3),
  CTA_DISP_AC_CTA          VARCHAR2(16),
  SEGURIDAD_INTEGRADA      NUMBER,
  URL_SEGURIDAD            VARCHAR2(250),
  SERVIDORSMTP             VARCHAR2(250)
)
;
comment on column FCM.NIT_FCM
  is 'NIt FCM';
comment on column FCM.CORREO
  is 'Correo de responsable FCM';
comment on column FCM.CTA_DISP_S_BANCO
  is 'Banco de transferencias SIMIT';
comment on column FCM.CTA_DISP_S_TIPO_CTA
  is 'Tipo de cuenta de transferencias SIMIT (AHO, CTE)';
comment on column FCM.CTA_DISP_S_CTA
  is 'Numero de cuenta para transferencias SIMIT';
comment on column FCM.CTA_DISP_P_BANCO
  is 'Banco de transferencias POLCA';
comment on column FCM.CTA_DISP_P_TIPO_CTA
  is 'Tipo de cuenta de transferencias POLCA (AHO, CTE)';
comment on column FCM.CTA_DISP_P_CTA
  is 'Numero de cuento para transferencias POLCA';
comment on column FCM.IVA
  is 'porcentaje de IVA ';
comment on column FCM.RETENCION_FUENTE
  is 'porcentaje de retencion en la fuente';
comment on column FCM.IMPUESTO_TIMBRE_TERCERO
  is 'Impuesto de timbre a terceros';
comment on column FCM.IMPUESTO_TIMBRE_FCM
  is 'Impuesto de timbre aplicado a FCM';
comment on column FCM.DIRECTOR_EJECUTIVO
  is 'Nombre del director ejecutivo';
comment on column FCM.DIRECTOR_NACIONAL
  is 'Nombre del director nacional';
comment on column FCM.CONTADOR_GENERAL
  is 'Nombre Contador general';
comment on column FCM.COORDINADOR_FINANCIERO
  is 'Nombre coordinador financiero';
comment on column FCM.NIT_POLCA
  is 'Nit con digito de POLCA';
comment on column FCM.NIT_SEVIAL
  is 'Nit con digito de SEVIAL';
comment on column FCM.CTACON_PUENTE
  is 'Cuenta contable puente';
comment on column FCM.CTACON_FONDO_COBERTURA
  is 'Cuenta contable para fondo de cobertura';
comment on column FCM.CTACON_POLCA
  is 'Cuenta contable asignada a POLCA';
comment on column FCM.CTACON_FCM
  is 'Cuenta contable asignada a FCM';
comment on column FCM.CTA_DISP_PA_BANCO
  is 'Banco de cuenta financiera para transferencias del 1.8';
comment on column FCM.CTA_DISP_PA_TIPO_CTA
  is 'Tipo de cuenta financiera para transferencias del 1.8 (AHO, CTE)';
comment on column FCM.CTA_DISP_PA_CTA
  is 'Numero cuenta financiera para transferencias del 1.8';
comment on column FCM.CTACON_FCMA
  is 'Cuenta contable FCM 1.8';
comment on column FCM.CTACON_INGRESO
  is 'Cuenta contable ingresos';
comment on column FCM.CTACON_IMPUESTOS
  is 'Cuenta contable impuestos';
comment on column FCM.RETEIVA
  is 'Porcentaje de reteiva';
comment on column FCM.TIMBRE_CONTRAVENCIONAL
  is 'Porcentaje timbre contravencional';
comment on column FCM.CTACON_PUENTE_EXT
  is 'Cuenta contable puente par arecuado externo';
comment on column FCM.M_DIRECTOR_EJECUTIVO
  is 'Correo Del Director Ejecutivo';
comment on column FCM.M_DIRECTOR_NACIONAL
  is 'Correo Del Director Ejecutivo';
comment on column FCM.M_CONTADOR_GENERAL
  is 'Correo Del Director Ejecutivo';
comment on column FCM.M_COORDINADOR_FINANCIERO
  is 'Correo Del Director Ejecutivo';
comment on column FCM.DIAS_ACTIVACION
  is 'M¿nimo n¿mero de d¿as para la activaci¿n de una novedad';
comment on column FCM.CTA_DISP_AC_BANCO
  is 'Banco acuerdo pago';
comment on column FCM.CTA_DISP_AC_TIPO_CTA
  is 'Tipo cuenta acuerdo pago';
comment on column FCM.CTA_DISP_AC_CTA
  is 'Cuenta acuerdo pago';
comment on column FCM.SEGURIDAD_INTEGRADA
  is '1: INTEGRADA 0: NO INTEGRADA';
comment on column FCM.URL_SEGURIDAD
  is 'Url del wsdl que soporta la seguridad integrada';
comment on column FCM.SERVIDORSMTP
  is 'ip del servidor smtp';
alter table FCM
  add constraint PK_NIT_FCM primary key (NIT_FCM);
alter table FCM
  add constraint CH_TIPOCTA_P_FCM
  check (CTA_DISP_P_TIPO_CTA IN ('AHO','CTE'));
alter table FCM
  add constraint CH_TIPOCTA_S_FCM
  check (CTA_DISP_S_TIPO_CTA IN ('AHO','CTE'));

prompt
prompt Creating table CTA_RECAUDO_FCM
prompt ==============================
prompt
create table CTA_RECAUDO_FCM
(
  NIT_FCM          VARCHAR2(10) not null,
  IDBANCO          CHAR(2) not null,
  INDTIPO          VARCHAR2(5) not null,
  TIPOCUENTA       VARCHAR2(3),
  CUENTA           VARCHAR2(16),
  COMISION_RECAUDO NUMBER,
  COMISION_ACH     NUMBER,
  CTA_CONTABLE     VARCHAR2(16)
)
;
comment on column CTA_RECAUDO_FCM.NIT_FCM
  is 'NIT de FCM';
comment on column CTA_RECAUDO_FCM.IDBANCO
  is 'Id banco';
comment on column CTA_RECAUDO_FCM.INDTIPO
  is 'Tipo de recuado (SIMIT , POLCA)';
comment on column CTA_RECAUDO_FCM.TIPOCUENTA
  is 'Tipo de cuenta (AHO: Ahorros CTE: Corriente)';
comment on column CTA_RECAUDO_FCM.CUENTA
  is 'Numero de cuenta';
comment on column CTA_RECAUDO_FCM.COMISION_RECAUDO
  is 'Comision de recaudo incluido iva)';
comment on column CTA_RECAUDO_FCM.COMISION_ACH
  is 'Comision de transferencias ACH';
comment on column CTA_RECAUDO_FCM.CTA_CONTABLE
  is 'Cuenta contable asignada';
alter table CTA_RECAUDO_FCM
  add constraint PK_CTA_RECAUDO_FCM primary key (NIT_FCM, IDBANCO, INDTIPO);
alter table CTA_RECAUDO_FCM
  add constraint FK_NIT_FCM_CRF foreign key (NIT_FCM)
  references FCM (NIT_FCM);
alter table CTA_RECAUDO_FCM
  add constraint CH_INDTIPO_FCM
  check (INDtipo IN ('SIMIT','POLCA'));
alter table CTA_RECAUDO_FCM
  add constraint CH_TIPOCUENTA_FCM
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table DEPARTAMENTO
prompt ===========================
prompt
create table DEPARTAMENTO
(
  IDDEPARTAMENTO CHAR(2) not null,
  NOMBRE         VARCHAR2(50)
)
;
comment on column DEPARTAMENTO.IDDEPARTAMENTO
  is 'Digitos asignados al departamento por el DANE';
comment on column DEPARTAMENTO.NOMBRE
  is 'Nombre del departamento';
alter table DEPARTAMENTO
  add constraint PK_IDDEPARTAMENTO primary key (IDDEPARTAMENTO);

prompt
prompt Creating table MUNICIPIO
prompt ========================
prompt
create table MUNICIPIO
(
  IDMUNICIPIO         CHAR(8) not null,
  NIT_M               VARCHAR2(10),
  NOMBRE              VARCHAR2(50),
  IDDEPARTAMENTO      CHAR(2),
  IDCONCESIONARIO     CHAR(2),
  CORREO              VARCHAR2(500),
  INDRETROACTIVIDAD   NUMBER,
  IDBANCO             CHAR(2),
  TIPOCUENTA          VARCHAR2(3),
  CUENTA              VARCHAR2(250),
  NIT_CTA             VARCHAR2(10),
  INDLIQ_S_EXT        NUMBER,
  INDLIQ_S_LOCAL      NUMBER,
  INDLIQ_P_EXT        NUMBER,
  INDLIQ_P_LOCAL      NUMBER,
  INDACUERDOPAGO_2002 NUMBER
)
;
comment on column MUNICIPIO.IDMUNICIPIO
  is 'Divipo del municipio';
comment on column MUNICIPIO.NIT_M
  is 'it del municipio';
comment on column MUNICIPIO.NOMBRE
  is 'Nombre del municipio';
comment on column MUNICIPIO.IDDEPARTAMENTO
  is 'Id del departamento';
comment on column MUNICIPIO.IDCONCESIONARIO
  is 'Id del concesionario asignado al municipio';
comment on column MUNICIPIO.CORREO
  is 'Correo de contacto del municipio';
comment on column MUNICIPIO.INDRETROACTIVIDAD
  is 'Indicador de retroactividad de salario minimo';
comment on column MUNICIPIO.IDBANCO
  is 'Id del banco para transferencias';
comment on column MUNICIPIO.TIPOCUENTA
  is 'Tipo de cuenta para transferecias (AHO, CTE)';
comment on column MUNICIPIO.CUENTA
  is 'Numero de cuenta para transferencias';
comment on column MUNICIPIO.NIT_CTA
  is 'Nit de la cuenta para ransferencias';
comment on column MUNICIPIO.INDLIQ_S_EXT
  is 'Indicador de liquidacion simit externo';
comment on column MUNICIPIO.INDLIQ_S_LOCAL
  is 'Indicador de liquidacion simit local';
comment on column MUNICIPIO.INDLIQ_P_EXT
  is 'Indicador de liquidacion polca externo';
comment on column MUNICIPIO.INDLIQ_P_LOCAL
  is 'Indicador de liquidacion polca local';
comment on column MUNICIPIO.INDACUERDOPAGO_2002
  is 'Indicador de Acuerdo Pago 2002';
alter table MUNICIPIO
  add constraint PK_IDMUNICIPIO primary key (IDMUNICIPIO);
alter table MUNICIPIO
  add constraint FK_IDBANCO_M foreign key (IDBANCO)
  references BANCO (IDBANCO);
alter table MUNICIPIO
  add constraint FK_IDCONCESIONARIO_M foreign key (IDCONCESIONARIO)
  references CONCESIONARIO (IDCONCESIONARIO);
alter table MUNICIPIO
  add constraint FK_IDDEPARTAMENTO_M foreign key (IDDEPARTAMENTO)
  references DEPARTAMENTO (IDDEPARTAMENTO);
alter table MUNICIPIO
  add constraint CH_TIPOCUENTA_M
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table DIAS_DISPERSION
prompt ==============================
prompt
create table DIAS_DISPERSION
(
  IDMUNICIPIO        CHAR(8) not null,
  IDBANCO            CHAR(2) not null,
  DIAS_DISPERSION_SL NUMBER,
  FREC_DISPERSION_SL NUMBER,
  DIAS_DISPERSION_PL NUMBER,
  FREC_DISPERSION_PL NUMBER,
  DIAS_DISPERSION_SE NUMBER,
  FREC_DISPERSION_SE NUMBER,
  DIAS_DISPERSION_PE NUMBER,
  FREC_DISPERSION_PE NUMBER
)
;
comment on column DIAS_DISPERSION.IDMUNICIPIO
  is 'Divipo del municipio';
comment on column DIAS_DISPERSION.IDBANCO
  is 'Id banco';
comment on column DIAS_DISPERSION.DIAS_DISPERSION_SL
  is 'Dias dispersion simit local';
comment on column DIAS_DISPERSION.FREC_DISPERSION_SL
  is 'Frecuencia dispersion simit local';
comment on column DIAS_DISPERSION.DIAS_DISPERSION_PL
  is 'Dias dispersion polca local';
comment on column DIAS_DISPERSION.FREC_DISPERSION_PL
  is 'Frecuencia dispersion polca local';
comment on column DIAS_DISPERSION.DIAS_DISPERSION_SE
  is 'Dias dispersion simit externo';
comment on column DIAS_DISPERSION.FREC_DISPERSION_SE
  is 'Frecuencia dispersion simit externo';
comment on column DIAS_DISPERSION.DIAS_DISPERSION_PE
  is 'Dias dispersion polca externo';
comment on column DIAS_DISPERSION.FREC_DISPERSION_PE
  is 'Frecuencia dispersion polca externo';
alter table DIAS_DISPERSION
  add constraint PK_DIAS_DISPERSION_MUNI_BANCO primary key (IDMUNICIPIO, IDBANCO);
alter table DIAS_DISPERSION
  add constraint FK_IDBANCO_DD foreign key (IDBANCO)
  references BANCO (IDBANCO);
alter table DIAS_DISPERSION
  add constraint FK_IDMUNICIPIO_DD foreign key (IDMUNICIPIO)
  references MUNICIPIO (IDMUNICIPIO);

prompt
prompt Creating table ERRORS
prompt =====================
prompt
create table ERRORS
(
  ID_ERRORS NUMBER not null,
  FECHA     DATE,
  SQLCODE   NUMBER,
  MESSAGE   VARCHAR2(255)
)
;
comment on table ERRORS
  is 'Contiene los errores presentados en cualquier proceso';
comment on column ERRORS.ID_ERRORS
  is 'id error autoincremental';
comment on column ERRORS.FECHA
  is 'fecha del error sql';
comment on column ERRORS.SQLCODE
  is 'codigo sql del error';
comment on column ERRORS.MESSAGE
  is 'mensaje del motor de base de datos';
alter table ERRORS
  add constraint PK_ID_ERRORS primary key (ID_ERRORS);

prompt
prompt Creating table FECHA_NO_HABIL
prompt =============================
prompt
create table FECHA_NO_HABIL
(
  FECHA VARCHAR2(8) not null
)
;
comment on column FECHA_NO_HABIL.FECHA
  is 'Fecha no habil';
alter table FECHA_NO_HABIL
  add constraint PK_FECHA primary key (FECHA);

prompt
prompt Creating table GRUPO_CORREO
prompt ===========================
prompt
create table GRUPO_CORREO
(
  IDGRUPO     NUMBER,
  CORREO      VARCHAR2(250),
  DESCRIPCION VARCHAR2(250)
)
;
comment on column GRUPO_CORREO.IDGRUPO
  is 'numero del grupo';
comment on column GRUPO_CORREO.CORREO
  is 'correo electronico';
comment on column GRUPO_CORREO.DESCRIPCION
  is 'descripcion del grupo';

prompt
prompt Creating table HIST_VOBO
prompt ========================
prompt
create table HIST_VOBO
(
  IDVOBO      NUMBER not null,
  TIPO        VARCHAR2(50),
  ACCION      VARCHAR2(50),
  USUARIO     NUMBER,
  FECHA       DATE,
  REFERENCIA1 VARCHAR2(50),
  REFERENCIA2 VARCHAR2(50),
  REFERENCIA3 NUMBER,
  REFERENCIA4 NUMBER
)
;
comment on column HIST_VOBO.IDVOBO
  is 'numero unico de vobo';
comment on column HIST_VOBO.TIPO
  is 'tipo de vobo';
comment on column HIST_VOBO.ACCION
  is 'APROBO O RECHAZO';
comment on column HIST_VOBO.USUARIO
  is 'usuario del vobo';
comment on column HIST_VOBO.FECHA
  is 'fecha del vobo';
comment on column HIST_VOBO.REFERENCIA1
  is 'referencia 1';
comment on column HIST_VOBO.REFERENCIA2
  is 'referencia 2';
comment on column HIST_VOBO.REFERENCIA3
  is 'referencia 3';
comment on column HIST_VOBO.REFERENCIA4
  is 'referencia 4';
alter table HIST_VOBO
  add constraint PK_HIST_VOBO primary key (IDVOBO);

prompt
prompt Creating table LOG
prompt ==================
prompt
create table LOG
(
  FECHA   DATE,
  USUARIO VARCHAR2(100),
  PROCESO VARCHAR2(100),
  ACCION  VARCHAR2(1000)
)
;
comment on column LOG.FECHA
  is 'fecha de la novedad';
comment on column LOG.USUARIO
  is 'usuario que realizo la novedad';
comment on column LOG.PROCESO
  is 'novedad realizada';
comment on column LOG.ACCION
  is 'accion realizada en la novedad';

prompt
prompt Creating table MENU
prompt ===================
prompt
create table MENU
(
  IDMENU     NUMBER,
  NAMEMENU   VARCHAR2(100),
  PAGE       VARCHAR2(100),
  PADREID    NUMBER,
  ENABLEMENU NUMBER
)
;
comment on column MENU.IDMENU
  is 'Id del menu';
comment on column MENU.NAMEMENU
  is 'Nombre del menu';
comment on column MENU.PAGE
  is 'pagina que se invoca en el menu';
comment on column MENU.PADREID
  is 'id del padre jerarquico del menu';
comment on column MENU.ENABLEMENU
  is 'menu activo';

prompt
prompt Creating table MENUXROL
prompt =======================
prompt
create table MENUXROL
(
  MENUID NUMBER,
  ROLID  NUMBER
)
;
comment on column MENUXROL.MENUID
  is 'Id del menu';
comment on column MENUXROL.ROLID
  is 'Id rol';

prompt
prompt Creating table NOVDIAS_DISPERSION
prompt =================================
prompt
create table NOVDIAS_DISPERSION
(
  IDMUNICIPIO        CHAR(8) not null,
  IDBANCO            CHAR(2) not null,
  DIAS_DISPERSION_SL NUMBER,
  FREC_DISPERSION_SL NUMBER,
  DIAS_DISPERSION_PL NUMBER,
  FREC_DISPERSION_PL NUMBER,
  DIAS_DISPERSION_SE NUMBER,
  FREC_DISPERSION_SE NUMBER,
  DIAS_DISPERSION_PE NUMBER,
  FREC_DISPERSION_PE NUMBER,
  TIPONOV            CHAR(2) not null,
  NUMERONOV          NUMBER not null,
  FECHANOV           DATE not null,
  USUARIONOV         NUMBER not null,
  USUARIOVAL         NUMBER,
  FECHAVAL           DATE,
  FECHAACT           DATE not null,
  ESTADONOV          VARCHAR2(16) not null,
  FIRMA1             VARCHAR2(250) not null,
  FIRMA2             VARCHAR2(250) not null,
  USUARIOANUL        NUMBER,
  FECHAANUL          DATE,
  DNSAVVILLAS        VARCHAR2(16),
  DNSGRANBANCO       VARCHAR2(16),
  FECHAAPLICACION    DATE,
  NOMBRE             VARCHAR2(250)
)
;
comment on column NOVDIAS_DISPERSION.IDMUNICIPIO
  is 'Divipo del municipio';
comment on column NOVDIAS_DISPERSION.IDBANCO
  is 'Id banco';
comment on column NOVDIAS_DISPERSION.DIAS_DISPERSION_SL
  is 'Dias dispersion simit local';
comment on column NOVDIAS_DISPERSION.FREC_DISPERSION_SL
  is 'Frecuencia dispersion simit local';
comment on column NOVDIAS_DISPERSION.DIAS_DISPERSION_PL
  is 'Dias dispersion polca local';
comment on column NOVDIAS_DISPERSION.FREC_DISPERSION_PL
  is 'Frecuencia dispersion polca local';
comment on column NOVDIAS_DISPERSION.DIAS_DISPERSION_SE
  is 'Dias dispersion simit externo';
comment on column NOVDIAS_DISPERSION.FREC_DISPERSION_SE
  is 'Frecuencia dispersion simit externo';
comment on column NOVDIAS_DISPERSION.DIAS_DISPERSION_PE
  is 'Dias dispersion polca externo';
comment on column NOVDIAS_DISPERSION.FREC_DISPERSION_PE
  is 'Frecuencia dispersion polca externo';
comment on column NOVDIAS_DISPERSION.TIPONOV
  is 'Tipo de Novedad 06-Adicionar Dias, 07:Actualizar Dias; 08: Eliminar dias';
comment on column NOVDIAS_DISPERSION.NUMERONOV
  is 'Numero de novedad';
comment on column NOVDIAS_DISPERSION.FECHANOV
  is 'Fecha de novedad';
comment on column NOVDIAS_DISPERSION.USUARIONOV
  is 'Usuario que reporta novedad';
comment on column NOVDIAS_DISPERSION.USUARIOVAL
  is 'Usuario que valida novedad';
comment on column NOVDIAS_DISPERSION.FECHAVAL
  is 'Fecha validacion novedad';
comment on column NOVDIAS_DISPERSION.FECHAACT
  is 'FechaActivacionNovedad';
comment on column NOVDIAS_DISPERSION.ESTADONOV
  is 'Estado Novedad: INGRESADA, VALIDADA, ACTIVA,ANULADA';
comment on column NOVDIAS_DISPERSION.FIRMA1
  is 'Nombre de la primera firma';
comment on column NOVDIAS_DISPERSION.FIRMA2
  is 'Nombre de la segunda firma';
comment on column NOVDIAS_DISPERSION.USUARIOANUL
  is 'Usuario que anula la novedad';
comment on column NOVDIAS_DISPERSION.FECHAANUL
  is 'Fecha anulacion novedad';
comment on column NOVDIAS_DISPERSION.DNSAVVILLAS
  is 'Dns avvillas';
comment on column NOVDIAS_DISPERSION.DNSGRANBANCO
  is 'Dns Granbanco';
comment on column NOVDIAS_DISPERSION.FECHAAPLICACION
  is 'Fecha aplicacion de la novedad';
comment on column NOVDIAS_DISPERSION.NOMBRE
  is 'Nombre municipio';
alter table NOVDIAS_DISPERSION
  add constraint PK_IDNOVDD primary key (IDMUNICIPIO, TIPONOV, NUMERONOV);

prompt
prompt Creating table NOVMUNICIPIO
prompt ===========================
prompt
create table NOVMUNICIPIO
(
  IDMUNICIPIO              CHAR(8) not null,
  NIT_M                    VARCHAR2(10),
  NOMBRE                   VARCHAR2(50),
  IDDEPARTAMENTO           CHAR(2),
  IDCONCESIONARIO          CHAR(2),
  CORREO                   VARCHAR2(500),
  INDRETROACTIVIDAD        NUMBER,
  IDBANCO                  CHAR(2),
  TIPOCUENTA               VARCHAR2(3),
  CUENTA                   VARCHAR2(250),
  NIT_CTA                  VARCHAR2(10),
  INDLIQ_S_EXT             NUMBER,
  INDLIQ_S_LOCAL           NUMBER,
  INDLIQ_P_EXT             NUMBER,
  INDLIQ_P_LOCAL           NUMBER,
  INDACUERDOPAGO_2002      NUMBER,
  TIPONOV                  CHAR(2) not null,
  NUMERONOV                NUMBER not null,
  FECHANOV                 DATE not null,
  USUARIONOV               NUMBER not null,
  USUARIOVAL               NUMBER,
  FECHAVAL                 DATE,
  FECHAACT                 DATE not null,
  ESTADONOV                VARCHAR2(16) not null,
  FIRMA1                   VARCHAR2(250) not null,
  FIRMA2                   VARCHAR2(250) not null,
  MUNICIPIO_S              NUMBER not null,
  FCM_CONTRAVENCIONAL_S    NUMBER not null,
  CONCES_CONTRAVENCIONAL_S NUMBER not null,
  ACUERDOPAGO_S            NUMBER not null,
  MUNICIPIO_P              NUMBER not null,
  FCM_CONTRAVENCIONAL_P    NUMBER not null,
  CONCES_CONTRAVENCIONAL_P NUMBER not null,
  ACUERDOPAGO_P            NUMBER not null,
  USUARIOANUL              NUMBER,
  FECHAANUL                DATE,
  DNSAVVILLAS              VARCHAR2(16),
  DNSGRANBANCO             VARCHAR2(16),
  FECHAAPLICACION          DATE
)
;
comment on column NOVMUNICIPIO.IDMUNICIPIO
  is 'Divipo del NOVMUNICIPIO';
comment on column NOVMUNICIPIO.NIT_M
  is 'it del NOVMUNICIPIO';
comment on column NOVMUNICIPIO.NOMBRE
  is 'Nombre del NOVMUNICIPIO';
comment on column NOVMUNICIPIO.IDDEPARTAMENTO
  is 'Id del departamento';
comment on column NOVMUNICIPIO.IDCONCESIONARIO
  is 'Id del concesionario asignado al NOVMUNICIPIO';
comment on column NOVMUNICIPIO.CORREO
  is 'Correo de contacto del NOVMUNICIPIO';
comment on column NOVMUNICIPIO.INDRETROACTIVIDAD
  is 'Indicador de retroactividad de salario minimo';
comment on column NOVMUNICIPIO.IDBANCO
  is 'Id del banco para transferencias';
comment on column NOVMUNICIPIO.TIPOCUENTA
  is 'Tipo de cuenta para transferecias (AHO, CTE)';
comment on column NOVMUNICIPIO.CUENTA
  is 'Numero de cuenta para transferencias';
comment on column NOVMUNICIPIO.NIT_CTA
  is 'Nit de la cuenta para ransferencias';
comment on column NOVMUNICIPIO.INDLIQ_S_EXT
  is 'Indicador de liquidacion simit externo';
comment on column NOVMUNICIPIO.INDLIQ_S_LOCAL
  is 'Indicador de liquidacion simit local';
comment on column NOVMUNICIPIO.INDLIQ_P_EXT
  is 'Indicador de liquidacion polca externo';
comment on column NOVMUNICIPIO.INDLIQ_P_LOCAL
  is 'Indicador de liquidacion polca local';
comment on column NOVMUNICIPIO.INDACUERDOPAGO_2002
  is 'Indicador de Acuerdo Pago 2002';
comment on column NOVMUNICIPIO.TIPONOV
  is 'Tipo de Novedad 01-Adicionar Municipio, 02:Actualizar Municipio';
comment on column NOVMUNICIPIO.NUMERONOV
  is 'Numero de novedad';
comment on column NOVMUNICIPIO.FECHANOV
  is 'Fecha de novedad';
comment on column NOVMUNICIPIO.USUARIONOV
  is 'Usuario que reporta novedad';
comment on column NOVMUNICIPIO.USUARIOVAL
  is 'Usuario que valida novedad';
comment on column NOVMUNICIPIO.FECHAVAL
  is 'Fecha validacion novedad';
comment on column NOVMUNICIPIO.FECHAACT
  is 'FechaActivacionNovedad';
comment on column NOVMUNICIPIO.ESTADONOV
  is 'Estado Novedad: INGRESADA, VALIDADA, ACTIVA';
comment on column NOVMUNICIPIO.FIRMA1
  is 'Nombre de la primera firma';
comment on column NOVMUNICIPIO.FIRMA2
  is 'Nombre de la segunda firma';
comment on column NOVMUNICIPIO.MUNICIPIO_S
  is 'Porcentaje simit 90%';
comment on column NOVMUNICIPIO.FCM_CONTRAVENCIONAL_S
  is 'Porcentaje fcm contravencional  simit 90%';
comment on column NOVMUNICIPIO.CONCES_CONTRAVENCIONAL_S
  is 'Porcentaje concesionario contravencional  simit 90%';
comment on column NOVMUNICIPIO.ACUERDOPAGO_S
  is 'Porcentaje acuerdo  simit 90%';
comment on column NOVMUNICIPIO.MUNICIPIO_P
  is 'Porcentaje municipio polca 45%';
comment on column NOVMUNICIPIO.FCM_CONTRAVENCIONAL_P
  is 'Porcentaje fcm contravencional  polca 90%';
comment on column NOVMUNICIPIO.CONCES_CONTRAVENCIONAL_P
  is 'Porcentaje concesionario contravencional  polca 90%';
comment on column NOVMUNICIPIO.ACUERDOPAGO_P
  is 'Porcentaje acuerdo polca 90%';
comment on column NOVMUNICIPIO.USUARIOANUL
  is 'Usuario que anula la novedad';
comment on column NOVMUNICIPIO.FECHAANUL
  is 'Fecha anulacion novedad';
alter table NOVMUNICIPIO
  add constraint PK_IDNOVMUNICIPIO primary key (IDMUNICIPIO, TIPONOV, NUMERONOV);
alter table NOVMUNICIPIO
  add constraint FK_IDCONCESIONARIO_NOVM foreign key (IDCONCESIONARIO)
  references CONCESIONARIO (IDCONCESIONARIO);
alter table NOVMUNICIPIO
  add constraint FK_IDDEPARTAMENTO_NOVM foreign key (IDDEPARTAMENTO)
  references DEPARTAMENTO (IDDEPARTAMENTO);
alter table NOVMUNICIPIO
  add constraint CH_TIPOCUENTA_NOVM
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table NOVTERCERO
prompt =========================
prompt
create table NOVTERCERO
(
  IDMUNICIPIO     CHAR(8) not null,
  NIT_T           CHAR(10) not null,
  NOMBRE          VARCHAR2(50),
  IDBANCO         CHAR(2),
  TIPOCUENTA      VARCHAR2(3),
  CUENTA          VARCHAR2(250),
  BASE_S          NUMBER,
  BASE_P          NUMBER,
  IND_BASE        NUMBER,
  NUM_TERCERO     NUMBER not null,
  CORREOTERCERO   VARCHAR2(50),
  TIPONOV         CHAR(2) not null,
  NUMERONOV       NUMBER not null,
  FECHANOV        DATE not null,
  USUARIONOV      NUMBER not null,
  USUARIOVAL      NUMBER,
  FECHAVAL        DATE,
  FECHAACT        DATE not null,
  ESTADONOV       VARCHAR2(16) not null,
  FIRMA1          VARCHAR2(250) not null,
  FIRMA2          VARCHAR2(250) not null,
  USUARIOANUL     NUMBER,
  FECHAANUL       DATE,
  FECHAAPLICACION DATE,
  DNSAVVILLAS     VARCHAR2(16),
  DNSGRANBANCO    VARCHAR2(16)
)
;
comment on column NOVTERCERO.IDMUNICIPIO
  is 'municipio';
comment on column NOVTERCERO.NIT_T
  is 'nit del tercero';
comment on column NOVTERCERO.NOMBRE
  is 'nombre del tercero';
comment on column NOVTERCERO.IDBANCO
  is 'banco ';
comment on column NOVTERCERO.TIPOCUENTA
  is 'tipo de cuenta (AHO; CTE)';
comment on column NOVTERCERO.CUENTA
  is 'cuenta ';
comment on column NOVTERCERO.BASE_S
  is 'porcentaje base simit';
comment on column NOVTERCERO.BASE_P
  is 'porcentaje base polca';
comment on column NOVTERCERO.IND_BASE
  is 'indicador de base';
comment on column NOVTERCERO.NUM_TERCERO
  is 'numero de tercero';
comment on column NOVTERCERO.CORREOTERCERO
  is 'correo tercero';
comment on column NOVTERCERO.TIPONOV
  is 'Tipo de Novedad 03-Adicionar Tercero, 04:Actualizar Tercero; 05:Eliminar Tercero';
comment on column NOVTERCERO.NUMERONOV
  is 'Numero de novedad';
comment on column NOVTERCERO.FECHANOV
  is 'Fecha de novedad';
comment on column NOVTERCERO.USUARIONOV
  is 'Usuario que reporta novedad';
comment on column NOVTERCERO.USUARIOVAL
  is 'Usuario que valida novedad';
comment on column NOVTERCERO.FECHAVAL
  is 'Fecha validacion novedad';
comment on column NOVTERCERO.FECHAACT
  is 'FechaActivacionNovedad';
comment on column NOVTERCERO.ESTADONOV
  is 'Estado Novedad: INGRESADA, VALIDADA, ACTIVA,ANULADA';
comment on column NOVTERCERO.FIRMA1
  is 'Nombre de la primera firma';
comment on column NOVTERCERO.FIRMA2
  is 'Nombre de la segunda firma';
comment on column NOVTERCERO.USUARIOANUL
  is 'Usuario que anula la novedad';
comment on column NOVTERCERO.FECHAANUL
  is 'Fecha anulacion novedad';
comment on column NOVTERCERO.FECHAAPLICACION
  is 'Fecha Aplicacion';
comment on column NOVTERCERO.DNSAVVILLAS
  is 'Dns Avvillas';
comment on column NOVTERCERO.DNSGRANBANCO
  is 'Dns Granbanco';
alter table NOVTERCERO
  add constraint PK_NOVTERCERO primary key (TIPONOV, NUMERONOV);
alter table NOVTERCERO
  add constraint CH_TIPOCUENTA_NOVT
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table NOVVALIDADOR_FECHA
prompt =================================
prompt
create table NOVVALIDADOR_FECHA
(
  IDMUNICIPIO              CHAR(8) not null,
  IDVALIDADOR              CHAR(3) not null,
  FECHA_INI                DATE,
  FECHA_FIN                DATE,
  INDTIPO                  VARCHAR2(5) not null,
  P_MUNICIPIO              NUMBER,
  P_FCM_CONTRAVENCIONAL    NUMBER,
  P_CONCES_CONTRAVENCIONAL NUMBER,
  P_ACUERDOPAGO            NUMBER,
  NIT_TERCERO1             VARCHAR2(10),
  BASE_TERCERO1            NUMBER,
  IND_BASE_TERCERO1        NUMBER,
  NIT_TERCERO2             VARCHAR2(10),
  BASE_TERCERO2            NUMBER,
  IND_BASE_TERCERO2        NUMBER,
  TIPONOV                  CHAR(2) not null,
  NUMERONOV                NUMBER not null,
  FECHANOV                 DATE not null,
  USUARIONOV               NUMBER not null,
  USUARIOVAL               NUMBER,
  FECHAVAL                 DATE,
  FECHAACT                 DATE not null,
  ESTADONOV                CHAR(10) not null,
  FIRMA1                   VARCHAR2(250) not null,
  FIRMA2                   VARCHAR2(250) not null,
  USUARIOANUL              NUMBER,
  FECHAANUL                DATE
)
;
comment on column NOVVALIDADOR_FECHA.IDMUNICIPIO
  is 'Municipio';
comment on column NOVVALIDADOR_FECHA.IDVALIDADOR
  is 'validador';
comment on column NOVVALIDADOR_FECHA.FECHA_INI
  is 'fecha inicial';
comment on column NOVVALIDADOR_FECHA.FECHA_FIN
  is 'fecha final';
comment on column NOVVALIDADOR_FECHA.INDTIPO
  is 'tipo comparendo (SIMIT, POLCA)';
comment on column NOVVALIDADOR_FECHA.P_MUNICIPIO
  is 'porcentaje municipio';
comment on column NOVVALIDADOR_FECHA.P_FCM_CONTRAVENCIONAL
  is 'porcentaje fcm contravencional';
comment on column NOVVALIDADOR_FECHA.P_CONCES_CONTRAVENCIONAL
  is 'porcentaje concesionario contravencional';
comment on column NOVVALIDADOR_FECHA.P_ACUERDOPAGO
  is 'porcentaje de acuerdo de pago';
comment on column NOVVALIDADOR_FECHA.NIT_TERCERO1
  is 'nit tercero 1';
comment on column NOVVALIDADOR_FECHA.BASE_TERCERO1
  is 'base tercero 1';
comment on column NOVVALIDADOR_FECHA.IND_BASE_TERCERO1
  is 'indicador base tercero 1';
comment on column NOVVALIDADOR_FECHA.NIT_TERCERO2
  is 'nit tercero 2';
comment on column NOVVALIDADOR_FECHA.BASE_TERCERO2
  is 'base tercero 2';
comment on column NOVVALIDADOR_FECHA.IND_BASE_TERCERO2
  is 'base tercero 2';
comment on column NOVVALIDADOR_FECHA.TIPONOV
  is 'Tipo de Novedad 01-Adicionar Municipio, 02:Actualizar Municipio';
comment on column NOVVALIDADOR_FECHA.FECHANOV
  is 'Fecha de novedad';
comment on column NOVVALIDADOR_FECHA.USUARIONOV
  is 'Usuario que reporta novedad';
comment on column NOVVALIDADOR_FECHA.USUARIOVAL
  is 'Usuario que valida novedad';
comment on column NOVVALIDADOR_FECHA.FECHAVAL
  is 'Fecha validacion novedad';
comment on column NOVVALIDADOR_FECHA.FECHAACT
  is 'FechaActivacionNovedad';
comment on column NOVVALIDADOR_FECHA.ESTADONOV
  is 'Estado Novedad: INGRESADA, VALIDADA, ACTIVA,ANULADA';
comment on column NOVVALIDADOR_FECHA.FIRMA1
  is 'Nombre de la primera firma';
comment on column NOVVALIDADOR_FECHA.FIRMA2
  is 'Nombre de la segunda firma';
comment on column NOVVALIDADOR_FECHA.USUARIOANUL
  is 'Usuario que anula la novedad';
comment on column NOVVALIDADOR_FECHA.FECHAANUL
  is 'Fecha anulacion novedad';
alter table NOVVALIDADOR_FECHA
  add constraint PK_NOVVALIDADOR_FECHA primary key (TIPONOV, NUMERONOV);
alter table NOVVALIDADOR_FECHA
  add constraint CH_INDTIPO_NOVVF
  check (INDTIPO IN ('SIMIT','POLCA'));

prompt
prompt Creating table PADRE
prompt ====================
prompt
create table PADRE
(
  IDPADRE     NUMBER,
  NAMEPADRE   VARCHAR2(100),
  ENABLEPADRE NUMBER
)
;
comment on column PADRE.IDPADRE
  is 'identificacion autoincremental';
comment on column PADRE.NAMEPADRE
  is 'Nombre del padre de los menus';
comment on column PADRE.ENABLEPADRE
  is 'Indicador de activo';

prompt
prompt Creating table P_DISPERSION_CONCESIONARIO
prompt =========================================
prompt
create table P_DISPERSION_CONCESIONARIO
(
  IDCONCESIONARIO               CHAR(2) not null,
  CONCESIONARIO_S               NUMBER,
  FONDO_COB_CONCESIONARIO_S     NUMBER,
  FONDO_COB_SIMIT_S             NUMBER,
  SIMIT_S                       NUMBER,
  EQUILIBRIO_ECONOMICO_S        NUMBER,
  CONCESIONARIO_PM              NUMBER,
  FONDO_COB_CONCESIONARIO_PM    NUMBER,
  FONDO_COB_SIMIT_PM            NUMBER,
  EQUILIBRIO_ECONOMICO_PM       NUMBER,
  SIMIT_PP                      NUMBER,
  SEVIAL_PP                     NUMBER,
  EQUILIBRIO_ECONOMICO_PP       NUMBER,
  POLCA_CP                      NUMBER,
  FCM_CP                        NUMBER,
  SEVIAL_CP                     NUMBER,
  EQUILIBRIO_ECONOMICO_CP       NUMBER,
  CONCESIONARIO_S_CC            VARCHAR2(16),
  FONDO_COB_CONCESIONARIO_S_CC  VARCHAR2(16),
  FONDO_COB_SIMIT_S_CC          VARCHAR2(16),
  SIMIT_S_CC                    VARCHAR2(16),
  EQUILIBRIO_ECONOMICO_S_CC     VARCHAR2(16),
  CONCESIONARIO_PM_CC           VARCHAR2(16),
  FONDO_COB_CONCESIONARIO_PM_CC VARCHAR2(16),
  FONDO_COB_SIMIT_PM_CC         VARCHAR2(16),
  EQUILIBRIO_ECONOMICO_PM_CC    VARCHAR2(16),
  SIMIT_PP_CC                   VARCHAR2(16),
  SEVIAL_PP_CC                  VARCHAR2(16),
  EQUILIBRIO_ECONOMICO_PP_CC    VARCHAR2(16),
  POLCA_CP_CC                   VARCHAR2(16),
  FCM_CP_CC                     VARCHAR2(16),
  SEVIAL_CP_CC                  VARCHAR2(16),
  EQUILIBRIO_ECONOMICO_CP_CC    VARCHAR2(16),
  SIMIT_PM                      NUMBER,
  SIMIT_PM_CC                   VARCHAR2(16),
  CTACON_GAS                    VARCHAR2(16),
  CTACON_ING                    VARCHAR2(16),
  CONCESIONARIO_S_CC_EXT        VARCHAR2(16),
  FONCOB_CONCES_S_CC_EXT        VARCHAR2(16),
  FONCOB_SIMIT_S_CC_EXT         VARCHAR2(16),
  SIMIT_S_CC_EXT                VARCHAR2(16),
  EQUIL_ECON_S_CC_EXT           VARCHAR2(16),
  CONCESIONARIO_PM_CC_EXT       VARCHAR2(16),
  FONCOB_CONCES_PM_CC_EXT       VARCHAR2(16),
  FONCOB_SIMIT_PM_CC_EXT        VARCHAR2(16),
  EQUIL_ECON_PM_CC_EXT          VARCHAR2(16),
  SIMIT_PP_CC_EXT               VARCHAR2(16),
  SEVIAL_PP_CC_EXT              VARCHAR2(16),
  EQUIL_ECON_PP_CC_EXT          VARCHAR2(16),
  POLCA_CP_CC_EXT               VARCHAR2(16),
  FCM_CP_CC_EXT                 VARCHAR2(16),
  SEVIAL_CP_CC_EXT              VARCHAR2(16),
  EQUIL_ECON_CP_CC_EXT          VARCHAR2(16),
  SIMIT_PM_CC_EXT               VARCHAR2(16)
)
;
comment on column P_DISPERSION_CONCESIONARIO.IDCONCESIONARIO
  is 'id concesionario';
comment on column P_DISPERSION_CONCESIONARIO.CONCESIONARIO_S
  is 'porcentaje  concesionario simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_CONCESIONARIO_S
  is 'porcentaje  fondo cobertura simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_SIMIT_S
  is 'porcentaje  fondo cobertura fcm simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_S
  is 'porcentaje fcm simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_S
  is 'porcentaje equilibrio economico simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.CONCESIONARIO_PM
  is 'porcentaje  concesionario polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_CONCESIONARIO_PM
  is 'porcentaje  fondo concesionario polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_SIMIT_PM
  is 'porcentaje  fondo cobertura polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_PM
  is 'porcentaje  equilibrio economico polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_PP
  is 'porcentaje simit polca polca 5%';
comment on column P_DISPERSION_CONCESIONARIO.SEVIAL_PP
  is 'porcentaje sevial polca polca 5%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_PP
  is 'porcentaje equilibrio economico polca polca 5%';
comment on column P_DISPERSION_CONCESIONARIO.POLCA_CP
  is 'porcentaje polca convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.FCM_CP
  is 'porcentaje fcm convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.SEVIAL_CP
  is 'porcentaje sevial convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_CP
  is 'porcentaje equilibrio ecomico convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.CONCESIONARIO_S_CC
  is 'centro costo  concesionario simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_CONCESIONARIO_S_CC
  is 'centro costo  fondo cobertura simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_SIMIT_S_CC
  is 'centro costo  fondo cobertura fcm simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_S_CC
  is 'centro costo fcm simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_S_CC
  is 'centro costo equilibrio economico simit 10%';
comment on column P_DISPERSION_CONCESIONARIO.CONCESIONARIO_PM_CC
  is 'centro costo  concesionario polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_CONCESIONARIO_PM_CC
  is 'centro costo  fondo cobertura concesionario polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.FONDO_COB_SIMIT_PM_CC
  is 'centro costo  fondo cobertura fcm concesionario polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_PM_CC
  is 'centro costo equilibrio concesionario polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_PP_CC
  is 'centro costo simit polca polca 5%';
comment on column P_DISPERSION_CONCESIONARIO.SEVIAL_PP_CC
  is 'centro costo sevial polca polca 5%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_PP_CC
  is 'centro costo equilibrio polca polca 5%';
comment on column P_DISPERSION_CONCESIONARIO.POLCA_CP_CC
  is 'centro costo polca convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.FCM_CP_CC
  is 'centro costo fcm convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.SEVIAL_CP_CC
  is 'centro costo sevial convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.EQUILIBRIO_ECONOMICO_CP_CC
  is 'centro costo equilibrio convenio polca 45%';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_PM
  is 'porcentaje FCM polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_PM_CC
  is 'centro costo FCM polca municipio 5%';
comment on column P_DISPERSION_CONCESIONARIO.CTACON_GAS
  is 'Cuenta contable gastos';
comment on column P_DISPERSION_CONCESIONARIO.CTACON_ING
  is 'Cuenta contable ingresos';
comment on column P_DISPERSION_CONCESIONARIO.CONCESIONARIO_S_CC_EXT
  is 'centro costo  concesionario simit 10% externo';
comment on column P_DISPERSION_CONCESIONARIO.FONCOB_CONCES_S_CC_EXT
  is 'centro costo  fondo cobertura simit 10% externo';
comment on column P_DISPERSION_CONCESIONARIO.FONCOB_SIMIT_S_CC_EXT
  is 'centro costo  fondo cobertura fcm simit 10% externo';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_S_CC_EXT
  is 'centro costo fcm simit 10% externo';
comment on column P_DISPERSION_CONCESIONARIO.EQUIL_ECON_S_CC_EXT
  is 'centro costo equilibrio economico simit 10% externo';
comment on column P_DISPERSION_CONCESIONARIO.CONCESIONARIO_PM_CC_EXT
  is 'centro costo  concesionario polca municipio 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.FONCOB_CONCES_PM_CC_EXT
  is 'centro costo  fondo cobertura concesionario polca municipio 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.FONCOB_SIMIT_PM_CC_EXT
  is 'centro costo  fondo cobertura fcm concesionario polca municipio 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.EQUIL_ECON_PM_CC_EXT
  is 'centro costo equilibrio concesionario polca municipio 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_PP_CC_EXT
  is 'centro costo simit polca polca 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.SEVIAL_PP_CC_EXT
  is 'centro costo sevial polca polca 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.EQUIL_ECON_PP_CC_EXT
  is 'centro costo equilibrio polca polca 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.POLCA_CP_CC_EXT
  is 'centro costo polca convenio polca 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.FCM_CP_CC_EXT
  is 'centro costo fcm convenio polca 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.SEVIAL_CP_CC_EXT
  is 'centro costo sevial convenio polca 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.EQUIL_ECON_CP_CC_EXT
  is 'centro costo equilibrio convenio polca 5% externo';
comment on column P_DISPERSION_CONCESIONARIO.SIMIT_PM_CC_EXT
  is 'centro costo FCM polca polca 5% externo';
alter table P_DISPERSION_CONCESIONARIO
  add constraint PK_P_DISPERSION_CONCESIONARIO primary key (IDCONCESIONARIO);
alter table P_DISPERSION_CONCESIONARIO
  add constraint FK_IDCONCESIONARIO_PDC foreign key (IDCONCESIONARIO)
  references CONCESIONARIO (IDCONCESIONARIO);

prompt
prompt Creating table P_DISPERSION_MUNICIPIO
prompt =====================================
prompt
create table P_DISPERSION_MUNICIPIO
(
  IDMUNICIPIO              CHAR(8) not null,
  MUNICIPIO_S              NUMBER,
  FCM_CONTRAVENCIONAL_S    NUMBER,
  CONCES_CONTRAVENCIONAL_S NUMBER,
  ACUERDOPAGO_S            NUMBER,
  MUNICIPIO_P              NUMBER,
  FCM_CONTRAVENCIONAL_P    NUMBER,
  CONCES_CONTRAVENCIONAL_P NUMBER,
  ACUERDOPAGO_P            NUMBER
)
;
comment on column P_DISPERSION_MUNICIPIO.IDMUNICIPIO
  is 'id municipio';
comment on column P_DISPERSION_MUNICIPIO.MUNICIPIO_S
  is 'Porcentaje simit 90%';
comment on column P_DISPERSION_MUNICIPIO.FCM_CONTRAVENCIONAL_S
  is 'Porcentaje fcm contravencional  simit 90%';
comment on column P_DISPERSION_MUNICIPIO.CONCES_CONTRAVENCIONAL_S
  is 'Porcentaje concesionario contravencional  simit 90%';
comment on column P_DISPERSION_MUNICIPIO.ACUERDOPAGO_S
  is 'Porcentaje acuerdo  simit 90%';
comment on column P_DISPERSION_MUNICIPIO.MUNICIPIO_P
  is 'Porcentaje municipio polca 45%';
comment on column P_DISPERSION_MUNICIPIO.FCM_CONTRAVENCIONAL_P
  is 'Porcentaje fcm contravencional polca 45%';
comment on column P_DISPERSION_MUNICIPIO.CONCES_CONTRAVENCIONAL_P
  is 'Porcentaje concesionario contravencional polca 45%';
comment on column P_DISPERSION_MUNICIPIO.ACUERDOPAGO_P
  is 'Porcentaje acuerdo polca 45%';
alter table P_DISPERSION_MUNICIPIO
  add constraint PK_P_DISPERSION_MUNICIPIO primary key (IDMUNICIPIO);
alter table P_DISPERSION_MUNICIPIO
  add constraint FK_IDMUNICIPIO_PDM foreign key (IDMUNICIPIO)
  references MUNICIPIO (IDMUNICIPIO);

prompt
prompt Creating table PERSON
prompt =====================
prompt
create table PERSON
(
  IDPERSON     NUMBER,
  NAMEPERSON   VARCHAR2(100),
  JOBTITLE     VARCHAR2(100),
  ENABLEPERSON NUMBER,
  LASTUPDATE   DATE,
  MAIL         VARCHAR2(100),
  PASSWORD     VARCHAR2(16)
)
;
comment on column PERSON.IDPERSON
  is 'id del funcionario';
comment on column PERSON.NAMEPERSON
  is 'nombre del funcionario';
comment on column PERSON.JOBTITLE
  is 'cargo del funcinario';
comment on column PERSON.ENABLEPERSON
  is 'funcionario activo';
comment on column PERSON.LASTUPDATE
  is 'ultima actualizacion';
comment on column PERSON.MAIL
  is 'correo electronico';
comment on column PERSON.PASSWORD
  is 'clave';

prompt
prompt Creating table RECAUDO_EXT_DISP_TOT_CON_FEC
prompt ===========================================
prompt
create table RECAUDO_EXT_DISP_TOT_CON_FEC
(
  FEC_CORTE_INI        DATE,
  FEC_CORTE_FIN        DATE,
  FEC_DISPERSION       DATE,
  ID_CONCESIONARIO_LIQ CHAR(2),
  ORDEN                NUMBER,
  CONCEPTO             VARCHAR2(250),
  ORI_IDBANCO          CHAR(2),
  ORI_TIPOCUENTA       VARCHAR2(3),
  ORI_CUENTA           VARCHAR2(16),
  ORI_NIT              VARCHAR2(10),
  DES_IDBANCO          CHAR(2),
  DES_TIPOCUENTA       VARCHAR2(3),
  DES_CUENTA           VARCHAR2(16),
  DES_NIT              VARCHAR2(10),
  INDTIPO              VARCHAR2(5),
  USUARIO_PROCESO      VARCHAR2(20),
  FECHA_PROCESO        DATE,
  VALOR                NUMBER,
  DEB_CTA_CON          VARCHAR2(16),
  DEB_CEN_COS          VARCHAR2(16),
  DEB_NIT_TER          VARCHAR2(16),
  CRE_CTA_CON          VARCHAR2(16),
  CRE_CEN_COS          VARCHAR2(16),
  CRE_NIT_TER          VARCHAR2(16),
  CONCEPTO_CON         VARCHAR2(250),
  ID_CONCESIONARIO_PRO CHAR(2),
  IDMUNICIPIO          CHAR(8)
)
;

prompt
prompt Creating table RECAUDO_EXTERNO
prompt ==============================
prompt
create table RECAUDO_EXTERNO
(
  ID_RECAUDO_EXTERNO  NUMBER not null,
  IDBANCO             CHAR(2),
  CTA_RECAUDO         VARCHAR2(16),
  FEC_CORTE           DATE,
  FEC_TRAN            DATE,
  OFICINA_ORIGEN      VARCHAR2(250),
  VALOR_EFECTIVO      NUMBER,
  VALOR_CHEQUE        NUMBER,
  VALOR_TOTAL         NUMBER,
  IDMUNICIPIO         CHAR(8),
  VALOR_ADICIONAL     NUMBER,
  VALIDADOR_FECHA     CHAR(3),
  INDFECHA2002        CHAR(1),
  NUM_LIQUIDACION     VARCHAR2(15),
  TIPO_IDENTIFICACION NUMBER,
  IDENTIFICACION      VARCHAR2(15),
  NOMBRE_INFRACTOR    VARCHAR2(100),
  APELLIDO_INFRACTOR  VARCHAR2(100),
  NUM_COMPARENDO      VARCHAR2(20),
  FEC_COMPARENDO      DATE,
  NUM_RESOLUCION      NUMBER,
  FEC_RESOLUCION      DATE,
  IDDEPARTAMENTO      CHAR(2)
)
;
comment on column RECAUDO_EXTERNO.ID_RECAUDO_EXTERNO
  is 'autonumerico';
comment on column RECAUDO_EXTERNO.IDBANCO
  is 'banco recaudador';
comment on column RECAUDO_EXTERNO.CTA_RECAUDO
  is 'cuenta de recaudo';
comment on column RECAUDO_EXTERNO.FEC_CORTE
  is 'fecha de corte';
comment on column RECAUDO_EXTERNO.FEC_TRAN
  is 'fecha de transaccion';
comment on column RECAUDO_EXTERNO.OFICINA_ORIGEN
  is 'oficina origen';
comment on column RECAUDO_EXTERNO.VALOR_EFECTIVO
  is 'valor efectivo';
comment on column RECAUDO_EXTERNO.VALOR_CHEQUE
  is 'valor cheque';
comment on column RECAUDO_EXTERNO.VALOR_TOTAL
  is 'valor total';
comment on column RECAUDO_EXTERNO.IDMUNICIPIO
  is 'divipo del recaudo';
comment on column RECAUDO_EXTERNO.VALOR_ADICIONAL
  is 'valor adicional';
comment on column RECAUDO_EXTERNO.VALIDADOR_FECHA
  is 'validador de fecha';
comment on column RECAUDO_EXTERNO.INDFECHA2002
  is 'indicador de retroactividad';
comment on column RECAUDO_EXTERNO.NUM_LIQUIDACION
  is 'numero liquidacion';
comment on column RECAUDO_EXTERNO.TIPO_IDENTIFICACION
  is 'tipo de identificacion';
comment on column RECAUDO_EXTERNO.IDENTIFICACION
  is 'identificacion';
comment on column RECAUDO_EXTERNO.NOMBRE_INFRACTOR
  is 'nombre infractor';
comment on column RECAUDO_EXTERNO.APELLIDO_INFRACTOR
  is 'apellido infractor';
comment on column RECAUDO_EXTERNO.NUM_COMPARENDO
  is 'numero de comparendo';
comment on column RECAUDO_EXTERNO.FEC_COMPARENDO
  is 'fecha de comparendo';
comment on column RECAUDO_EXTERNO.NUM_RESOLUCION
  is 'numero de resolucion';
comment on column RECAUDO_EXTERNO.FEC_RESOLUCION
  is 'fecha de resolucion';
comment on column RECAUDO_EXTERNO.IDDEPARTAMENTO
  is 'id departamento';
alter table RECAUDO_EXTERNO
  add constraint PK_RECAUDO_EXTERNO primary key (ID_RECAUDO_EXTERNO);

prompt
prompt Creating table RECAUDO_EXTERNO_CAUSACION
prompt ========================================
prompt
create table RECAUDO_EXTERNO_CAUSACION
(
  OPERACION       VARCHAR2(10),
  FEC_CORTE_INI   DATE,
  FEC_CORTE_FIN   DATE,
  ORI_IDBANCO     CHAR(2),
  ORI_CUENTA      VARCHAR2(16),
  IDCONCESIONARIO CHAR(2),
  VALOR_DEBITO    NUMBER,
  VALOR_CREDITO   NUMBER,
  DEB_CTA_CON     VARCHAR2(16),
  DEB_CEN_COS     VARCHAR2(16),
  DEB_NIT_TER     VARCHAR2(16),
  CRE_CTA_CON     VARCHAR2(16),
  CRE_CEN_COS     VARCHAR2(16),
  CRE_NIT_TER     VARCHAR2(16),
  ORDEN           NUMBER,
  CONCEPTO_CON    VARCHAR2(250),
  USUARIO_PROCESO VARCHAR2(20),
  FECHA_PROCESO   DATE,
  INDTIPO         CHAR(5)
)
;
comment on column RECAUDO_EXTERNO_CAUSACION.OPERACION
  is 'Tipo de operacion (Causacion , Ingreso)';
comment on column RECAUDO_EXTERNO_CAUSACION.FEC_CORTE_INI
  is 'Fecha de corte inicial';
comment on column RECAUDO_EXTERNO_CAUSACION.FEC_CORTE_FIN
  is 'Fecha de corte final';
comment on column RECAUDO_EXTERNO_CAUSACION.ORI_IDBANCO
  is 'banco origen';
comment on column RECAUDO_EXTERNO_CAUSACION.ORI_CUENTA
  is 'cuenta de recaudo origen';
comment on column RECAUDO_EXTERNO_CAUSACION.IDCONCESIONARIO
  is 'concesionario del recaudo';
comment on column RECAUDO_EXTERNO_CAUSACION.VALOR_DEBITO
  is 'valor debito';
comment on column RECAUDO_EXTERNO_CAUSACION.VALOR_CREDITO
  is 'valor credito';
comment on column RECAUDO_EXTERNO_CAUSACION.DEB_CTA_CON
  is 'cuenta contable debito';
comment on column RECAUDO_EXTERNO_CAUSACION.DEB_CEN_COS
  is 'centro de costo debito';
comment on column RECAUDO_EXTERNO_CAUSACION.DEB_NIT_TER
  is 'nit tercero debito';
comment on column RECAUDO_EXTERNO_CAUSACION.CRE_CTA_CON
  is 'cuenta contable credito';
comment on column RECAUDO_EXTERNO_CAUSACION.CRE_CEN_COS
  is 'centro de costo credito';
comment on column RECAUDO_EXTERNO_CAUSACION.CRE_NIT_TER
  is 'nit tercero credito';
comment on column RECAUDO_EXTERNO_CAUSACION.ORDEN
  is 'orden en el comprobante';
comment on column RECAUDO_EXTERNO_CAUSACION.CONCEPTO_CON
  is 'concepto contable';
comment on column RECAUDO_EXTERNO_CAUSACION.USUARIO_PROCESO
  is 'usuario que genero la causacion';
comment on column RECAUDO_EXTERNO_CAUSACION.FECHA_PROCESO
  is 'fecha de proceso';
comment on column RECAUDO_EXTERNO_CAUSACION.INDTIPO
  is 'tipo de recaudo (SIMIT,POLCA)';

prompt
prompt Creating table RECAUDO_EXTERNO_CONTABILIDAD
prompt ===========================================
prompt
create table RECAUDO_EXTERNO_CONTABILIDAD
(
  FECHADOC            CHAR(8),
  CLASEDOC            CHAR(2),
  SOCIEDAD            CHAR(4),
  FECHACONTABLE       CHAR(8),
  PERIODO             CHAR(2),
  MONEDA              CHAR(3),
  REFERENCIA          CHAR(16),
  TEXTOCABEZERA       CHAR(25),
  CLAVECONTABLE       CHAR(2),
  CUENTA              CHAR(17),
  IMPORTE             NUMBER,
  INDICADORIMPUESTO   CHAR(2),
  CENTROCOSTO         CHAR(10),
  CENTROBENEFICIO     CHAR(10),
  FECHAVALOR          CHAR(8),
  ASIGNACION          CHAR(18),
  TEXTOCABEZERA2      CHAR(50),
  SEGMENTO            CHAR(10),
  NITTERCERO          CHAR(12),
  CUENTADIVERGENTE    CHAR(10),
  FECHABASE           CHAR(8),
  CONDICIONPAGO       CHAR(4),
  RECEPTORALTERNATIVO CHAR(10),
  FECHAGENERACION     DATE,
  IDPERSON            NUMBER,
  TIPOCONTABLE        CHAR(3)
)
;
comment on column RECAUDO_EXTERNO_CONTABILIDAD.FECHADOC
  is 'Fecha de cierre del recaudo ddMMyyyy';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CLASEDOC
  is 'Valor fijo ZT';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.SOCIEDAD
  is 'Valor PFC1 (FCM1 si es 1.8 o 2.7 mas iva)';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.FECHACONTABLE
  is 'Fecha de cierre del recaudo ddMMyyyy';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.PERIODO
  is 'Mes de la fecha de cierre';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.MONEDA
  is 'Valor fijo COP';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.REFERENCIA
  is 'Numero de liquidacion (Para cuentas 11:Bancos, 24_29:CXP, 14:CXC)';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.TEXTOCABEZERA
  is 'Concepto de partida';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CLAVECONTABLE
  is 'Valor que indica si la partida es debito o credito';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CUENTA
  is 'Cuenta contable';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.IMPORTE
  is 'Valor de la partida';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.INDICADORIMPUESTO
  is 'Valor fijo espacios';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CENTROCOSTO
  is 'Centro de costo (aplica para cuentas 5)';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CENTROBENEFICIO
  is 'Centro de beneficio (aplica para cuentas 4)';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.FECHAVALOR
  is 'Fecha de cierre del recaudo ddMMyyyy';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.ASIGNACION
  is 'Texto fijo: Recaudo ctaRecaudo';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.TEXTOCABEZERA2
  is 'Concepto de partida';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.SEGMENTO
  is 'Valor fijo: SIMIT';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.NITTERCERO
  is 'Nit municipio, Concesionario';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CUENTADIVERGENTE
  is 'Cuenta Divergente';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.FECHABASE
  is 'Fecha de dispersion cuentas 24_29:CXP';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.CONDICIONPAGO
  is 'Valor fijo 0001';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.RECEPTORALTERNATIVO
  is 'Nit de tercero';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.FECHAGENERACION
  is 'Fecha de generacion del registro';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.IDPERSON
  is 'Id funcionario de generacion del registro';
comment on column RECAUDO_EXTERNO_CONTABILIDAD.TIPOCONTABLE
  is 'Tipo de contabilidad REC:Recaudo, DIS:Dispersion';

prompt
prompt Creating table RECAUDO_EXTERNO_DISP
prompt ===================================
prompt
create table RECAUDO_EXTERNO_DISP
(
  FEC_CORTE_INI        DATE,
  FEC_CORTE_FIN        DATE,
  FEC_DISPERSION       DATE,
  ID_CONCESIONARIO_LIQ CHAR(2),
  ORDEN                NUMBER,
  CONCEPTO             VARCHAR2(250),
  ORI_IDBANCO          CHAR(2),
  ORI_TIPOCUENTA       VARCHAR2(3),
  ORI_CUENTA           VARCHAR2(16),
  ORI_NIT              VARCHAR2(10),
  DES_IDBANCO          CHAR(2),
  DES_TIPOCUENTA       VARCHAR2(3),
  DES_CUENTA           VARCHAR2(250),
  DES_NIT              VARCHAR2(10),
  INDTIPO              VARCHAR2(5),
  USUARIO_PROCESO      VARCHAR2(20),
  FECHA_PROCESO        DATE,
  VALOR                NUMBER,
  DEB_CTA_CON          VARCHAR2(16),
  DEB_CEN_COS          VARCHAR2(16),
  DEB_NIT_TER          VARCHAR2(16),
  CRE_CTA_CON          VARCHAR2(16),
  CRE_CEN_COS          VARCHAR2(16),
  CRE_NIT_TER          VARCHAR2(16),
  CONCEPTO_CON         VARCHAR2(250),
  ID_CONCESIONARIO_PRO CHAR(2) default '00',
  IDMUNICIPIO          CHAR(8) default '00000000'
)
;
comment on column RECAUDO_EXTERNO_DISP.FEC_CORTE_INI
  is 'fecha de corte inicial';
comment on column RECAUDO_EXTERNO_DISP.FEC_CORTE_FIN
  is 'fecha de corte final';
comment on column RECAUDO_EXTERNO_DISP.FEC_DISPERSION
  is 'fecha de dispersion';
comment on column RECAUDO_EXTERNO_DISP.ID_CONCESIONARIO_LIQ
  is 'concesionario liquidador';
comment on column RECAUDO_EXTERNO_DISP.ORDEN
  is 'orden en el comprobante';
comment on column RECAUDO_EXTERNO_DISP.CONCEPTO
  is 'concepto contable';
comment on column RECAUDO_EXTERNO_DISP.ORI_IDBANCO
  is 'banco origen';
comment on column RECAUDO_EXTERNO_DISP.ORI_TIPOCUENTA
  is 'tipo de cuenta origen (AHO, CTE)';
comment on column RECAUDO_EXTERNO_DISP.ORI_CUENTA
  is 'cuenta origen';
comment on column RECAUDO_EXTERNO_DISP.ORI_NIT
  is 'nit cuenta origen';
comment on column RECAUDO_EXTERNO_DISP.DES_IDBANCO
  is 'banco destino';
comment on column RECAUDO_EXTERNO_DISP.DES_TIPOCUENTA
  is 'tipo de cuenta destino (AHO, CTE)';
comment on column RECAUDO_EXTERNO_DISP.DES_CUENTA
  is 'cuenta destino';
comment on column RECAUDO_EXTERNO_DISP.DES_NIT
  is 'nit cuenta destino';
comment on column RECAUDO_EXTERNO_DISP.INDTIPO
  is 'tipo de recuado (SIMIT, POLCA)';
comment on column RECAUDO_EXTERNO_DISP.USUARIO_PROCESO
  is 'usuario que proceso';
comment on column RECAUDO_EXTERNO_DISP.FECHA_PROCESO
  is 'fecha de proceso';
comment on column RECAUDO_EXTERNO_DISP.VALOR
  is 'valor transferencia';
comment on column RECAUDO_EXTERNO_DISP.DEB_CTA_CON
  is 'cuenta contable debito';
comment on column RECAUDO_EXTERNO_DISP.DEB_CEN_COS
  is 'centro de costo debito';
comment on column RECAUDO_EXTERNO_DISP.DEB_NIT_TER
  is 'nit tercero debito';
comment on column RECAUDO_EXTERNO_DISP.CRE_CTA_CON
  is 'cuenta contable credito';
comment on column RECAUDO_EXTERNO_DISP.CRE_CEN_COS
  is 'centro de costo credito';
comment on column RECAUDO_EXTERNO_DISP.CRE_NIT_TER
  is 'nit tercero credito';
comment on column RECAUDO_EXTERNO_DISP.CONCEPTO_CON
  is 'concepto contable';
comment on column RECAUDO_EXTERNO_DISP.ID_CONCESIONARIO_PRO
  is 'concecionario propietario';
comment on column RECAUDO_EXTERNO_DISP.IDMUNICIPIO
  is 'municipio';

prompt
prompt Creating table RECAUDO_EXTERNO_DISP_TOT
prompt =======================================
prompt
create table RECAUDO_EXTERNO_DISP_TOT
(
  FEC_CORTE_INI        DATE,
  FEC_CORTE_FIN        DATE,
  FEC_DISPERSION       DATE,
  ID_CONCESIONARIO_LIQ CHAR(2),
  ORDEN                NUMBER,
  CONCEPTO             VARCHAR2(250),
  ORI_IDBANCO          CHAR(2),
  ORI_TIPOCUENTA       VARCHAR2(3),
  ORI_CUENTA           VARCHAR2(16),
  ORI_NIT              VARCHAR2(10),
  DES_IDBANCO          CHAR(2),
  DES_TIPOCUENTA       VARCHAR2(3),
  DES_CUENTA           VARCHAR2(250),
  DES_NIT              VARCHAR2(10),
  INDTIPO              VARCHAR2(5),
  USUARIO_PROCESO      VARCHAR2(20),
  FECHA_PROCESO        DATE,
  VALOR                NUMBER,
  DEB_CTA_CON          VARCHAR2(16),
  DEB_CEN_COS          VARCHAR2(16),
  DEB_NIT_TER          VARCHAR2(16),
  CRE_CTA_CON          VARCHAR2(16),
  CRE_CEN_COS          VARCHAR2(16),
  CRE_NIT_TER          VARCHAR2(16),
  CONCEPTO_CON         VARCHAR2(250),
  ID_CONCESIONARIO_PRO CHAR(2),
  IDMUNICIPIO          CHAR(8),
  ENVIADOBANCO         NUMBER,
  REFERENCIATRF        NUMBER
)
;
comment on column RECAUDO_EXTERNO_DISP_TOT.FEC_CORTE_INI
  is 'fecha de corte inicial';
comment on column RECAUDO_EXTERNO_DISP_TOT.FEC_CORTE_FIN
  is 'fecha de corte final';
comment on column RECAUDO_EXTERNO_DISP_TOT.FEC_DISPERSION
  is 'fecha de dispersion';
comment on column RECAUDO_EXTERNO_DISP_TOT.ID_CONCESIONARIO_LIQ
  is 'concesionario liquidador';
comment on column RECAUDO_EXTERNO_DISP_TOT.ORDEN
  is 'orden en el comprobante';
comment on column RECAUDO_EXTERNO_DISP_TOT.CONCEPTO
  is 'concepto contable';
comment on column RECAUDO_EXTERNO_DISP_TOT.ORI_IDBANCO
  is 'banco origen';
comment on column RECAUDO_EXTERNO_DISP_TOT.ORI_TIPOCUENTA
  is 'tipo de cuenta origen (AHO, CTE)';
comment on column RECAUDO_EXTERNO_DISP_TOT.ORI_CUENTA
  is 'cuenta origen';
comment on column RECAUDO_EXTERNO_DISP_TOT.ORI_NIT
  is 'nit cuenta origen';
comment on column RECAUDO_EXTERNO_DISP_TOT.DES_IDBANCO
  is 'banco destino';
comment on column RECAUDO_EXTERNO_DISP_TOT.DES_TIPOCUENTA
  is 'tipo de cuenta destino (AHO, CTE)';
comment on column RECAUDO_EXTERNO_DISP_TOT.DES_CUENTA
  is 'cuenta destino';
comment on column RECAUDO_EXTERNO_DISP_TOT.DES_NIT
  is 'nit cuenta destino';
comment on column RECAUDO_EXTERNO_DISP_TOT.INDTIPO
  is 'tipo de recuado (SIMIT, POLCA)';
comment on column RECAUDO_EXTERNO_DISP_TOT.USUARIO_PROCESO
  is 'usuario que proceso';
comment on column RECAUDO_EXTERNO_DISP_TOT.FECHA_PROCESO
  is 'fecha de proceso';
comment on column RECAUDO_EXTERNO_DISP_TOT.VALOR
  is 'valor transferencia';
comment on column RECAUDO_EXTERNO_DISP_TOT.DEB_CTA_CON
  is 'cuenta contable debito';
comment on column RECAUDO_EXTERNO_DISP_TOT.DEB_CEN_COS
  is 'centro de costo debito';
comment on column RECAUDO_EXTERNO_DISP_TOT.DEB_NIT_TER
  is 'nit tercero debito';
comment on column RECAUDO_EXTERNO_DISP_TOT.CRE_CTA_CON
  is 'cuenta contable credito';
comment on column RECAUDO_EXTERNO_DISP_TOT.CRE_CEN_COS
  is 'centro de costo credito';
comment on column RECAUDO_EXTERNO_DISP_TOT.CRE_NIT_TER
  is 'nit tercero credito';
comment on column RECAUDO_EXTERNO_DISP_TOT.CONCEPTO_CON
  is 'concepto contable';
comment on column RECAUDO_EXTERNO_DISP_TOT.ID_CONCESIONARIO_PRO
  is 'concecionario propietario';
comment on column RECAUDO_EXTERNO_DISP_TOT.IDMUNICIPIO
  is 'municipio';

prompt
prompt Creating table RECAUDO_EXTERNO_LIQUIDACION
prompt ==========================================
prompt
create table RECAUDO_EXTERNO_LIQUIDACION
(
  ID_RECAUDO_EXTERNO_LIQUIDACION NUMBER not null,
  ID_RECAUDO_EXTERNO             NUMBER,
  ID_CONCESIONARIO_PRO           CHAR(2),
  ID_CONCESIONARIO_LIQ           CHAR(2),
  INDTIPO                        CHAR(5),
  USUARIO_PROCESO                VARCHAR2(20),
  FECHA_PROCESO                  DATE,
  IDMUNICIPIO                    CHAR(8),
  FEC_CORTE                      DATE,
  IND_PROCESO                    NUMBER,
  NUM_LIQUIDACION                VARCHAR2(15),
  DIAS_DISPERSION                NUMBER,
  FREC_DISPERSION                NUMBER,
  FEC_DISPERSION                 DATE,
  IDBANCO                        CHAR(2),
  SMDLV                          NUMBER,
  INDRETROACTIVIDAD              NUMBER,
  VALOR_TOTAL                    NUMBER,
  VALOR_ADICIONAL                NUMBER,
  VALIDADOR_FECHA                CHAR(3),
  INDFECHA2002                   CHAR(1),
  S_VALOR_0                      NUMBER default 0,
  S_VALOR_1                      NUMBER default 0,
  S_VALOR_2                      NUMBER default 0,
  S_VALOR_3                      NUMBER default 0,
  S_VALOR_4                      NUMBER default 0,
  S_VALOR_5                      NUMBER default 0,
  S_VALOR_6                      NUMBER default 0,
  S_VALOR_7                      NUMBER default 0,
  S_VALOR_8                      NUMBER default 0,
  S_VALOR_9                      NUMBER default 0,
  S_VALOR_10                     NUMBER default 0,
  S_VALOR_11                     NUMBER default 0,
  S_VALOR_12                     NUMBER default 0,
  S_VALOR_13                     NUMBER default 0,
  S_VALOR_14                     NUMBER default 0,
  S_VALOR_15                     NUMBER default 0,
  S_VALOR_16                     NUMBER default 0,
  S_VALOR_17                     NUMBER default 0,
  S_VALOR_18                     NUMBER default 0,
  S_VALOR_19                     NUMBER default 0,
  S_VALOR_20                     NUMBER default 0,
  S_VALOR_21                     NUMBER default 0,
  S_VALOR_22                     NUMBER default 0,
  S_VALOR_23                     NUMBER default 0,
  S_VALOR_24                     NUMBER default 0,
  S_VALOR_25                     NUMBER default 0,
  S_VALOR_26                     NUMBER default 0,
  S_VALOR_27                     NUMBER default 0,
  S_VALOR_28                     NUMBER default 0,
  CTA_RECAUDO                    VARCHAR2(16),
  IND_BASE_TER1                  NUMBER,
  IND_BASE_TER2                  NUMBER,
  IND_BASE_TER3                  NUMBER,
  IND_BASE_TER4                  NUMBER,
  POR_BASE_TER1                  NUMBER,
  POR_BASE_TER2                  NUMBER,
  POR_BASE_TER3                  NUMBER,
  POR_BASE_TER4                  NUMBER,
  S_VALOR_29                     NUMBER,
  NOM_TER1                       VARCHAR2(50),
  NOM_TER2                       VARCHAR2(50),
  NOM_TER3                       VARCHAR2(50),
  NOM_TER4                       VARCHAR2(50),
  P_VALOR_1                      NUMBER default 0,
  P_VALOR_2                      NUMBER default 0,
  P_VALOR_3                      NUMBER default 0,
  P_VALOR_4                      NUMBER default 0,
  P_VALOR_5                      NUMBER default 0,
  P_VALOR_6                      NUMBER default 0,
  P_VALOR_7                      NUMBER default 0,
  P_VALOR_8                      NUMBER default 0,
  P_VALOR_9                      NUMBER default 0,
  P_VALOR_10                     NUMBER default 0,
  P_VALOR_11                     NUMBER default 0,
  P_VALOR_12                     NUMBER default 0,
  P_VALOR_13                     NUMBER default 0,
  P_VALOR_14                     NUMBER default 0,
  P_VALOR_15                     NUMBER default 0,
  P_VALOR_16                     NUMBER default 0,
  P_VALOR_17                     NUMBER default 0,
  P_VALOR_18                     NUMBER default 0,
  P_VALOR_19                     NUMBER default 0,
  P_VALOR_20                     NUMBER default 0,
  P_VALOR_21                     NUMBER default 0,
  P_VALOR_22                     NUMBER default 0,
  P_VALOR_23                     NUMBER default 0,
  P_VALOR_24                     NUMBER default 0,
  P_VALOR_25                     NUMBER default 0,
  P_VALOR_26                     NUMBER default 0,
  P_VALOR_27                     NUMBER default 0,
  P_VALOR_28                     NUMBER default 0,
  P_VALOR_29                     NUMBER default 0,
  P_VALOR_30                     NUMBER default 0,
  P_VALOR_31                     NUMBER default 0,
  P_VALOR_32                     NUMBER default 0,
  P_VALOR_33                     NUMBER default 0,
  P_VALOR_34                     NUMBER default 0,
  P_VALOR_35                     NUMBER default 0,
  P_VALOR_36                     NUMBER default 0,
  P_VALOR_37                     NUMBER default 0,
  P_VALOR_38                     NUMBER default 0,
  P_VALOR_39                     NUMBER default 0,
  P_VALOR_40                     NUMBER default 0,
  P_VALOR_41                     NUMBER default 0,
  P_VALOR_42                     NUMBER default 0,
  P_VALOR_43                     NUMBER default 0,
  S_VALOR_30                     NUMBER default 0,
  P_VALOR_44                     NUMBER default 0,
  FEC_DISPERSION_CON             DATE,
  NIT_MUNICIPIO                  VARCHAR2(10),
  NIT_TERCERO1                   VARCHAR2(10),
  NIT_TERCERO2                   VARCHAR2(10),
  NIT_TERCERO3                   VARCHAR2(10),
  NIT_TERCERO4                   VARCHAR2(10),
  NIT_CONCESIONARIO              VARCHAR2(10),
  NIT_FONDO                      VARCHAR2(10),
  NIT_CONCESIONARIOZON           VARCHAR2(10)
)
;
comment on column RECAUDO_EXTERNO_LIQUIDACION.ID_RECAUDO_EXTERNO_LIQUIDACION
  is 'identificador unico';
comment on column RECAUDO_EXTERNO_LIQUIDACION.ID_RECAUDO_EXTERNO
  is 'id recuado externo';
comment on column RECAUDO_EXTERNO_LIQUIDACION.ID_CONCESIONARIO_PRO
  is 'concesionario propietario';
comment on column RECAUDO_EXTERNO_LIQUIDACION.ID_CONCESIONARIO_LIQ
  is 'concesionario liquidador';
comment on column RECAUDO_EXTERNO_LIQUIDACION.INDTIPO
  is 'tipo de comparendo (SIMIT, POLCA)';
comment on column RECAUDO_EXTERNO_LIQUIDACION.USUARIO_PROCESO
  is 'usuario proceso';
comment on column RECAUDO_EXTERNO_LIQUIDACION.FECHA_PROCESO
  is 'fecha de proceso';
comment on column RECAUDO_EXTERNO_LIQUIDACION.IDMUNICIPIO
  is 'municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.FEC_CORTE
  is 'fecha de corte';
comment on column RECAUDO_EXTERNO_LIQUIDACION.IND_PROCESO
  is 'indicador proceso';
comment on column RECAUDO_EXTERNO_LIQUIDACION.NUM_LIQUIDACION
  is 'numero de liquidacion';
comment on column RECAUDO_EXTERNO_LIQUIDACION.DIAS_DISPERSION
  is 'dias de dispersion';
comment on column RECAUDO_EXTERNO_LIQUIDACION.FREC_DISPERSION
  is 'frecuencia de dispersion';
comment on column RECAUDO_EXTERNO_LIQUIDACION.FEC_DISPERSION
  is 'fecha de dispersion';
comment on column RECAUDO_EXTERNO_LIQUIDACION.IDBANCO
  is 'banco recaudo';
comment on column RECAUDO_EXTERNO_LIQUIDACION.SMDLV
  is 'salario minimo diario';
comment on column RECAUDO_EXTERNO_LIQUIDACION.INDRETROACTIVIDAD
  is 'indicador de retroactividad';
comment on column RECAUDO_EXTERNO_LIQUIDACION.VALOR_TOTAL
  is 'valor total del recaudo';
comment on column RECAUDO_EXTERNO_LIQUIDACION.VALOR_ADICIONAL
  is 'valor adicional del recaudo';
comment on column RECAUDO_EXTERNO_LIQUIDACION.VALIDADOR_FECHA
  is 'validador fecha';
comment on column RECAUDO_EXTERNO_LIQUIDACION.INDFECHA2002
  is 'indicador de fecha < nov-2002';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_0
  is 'comison recaudo';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_1
  is 'valor base';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_2
  is 'valor simit base';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_3
  is 'valor simit';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_4
  is 'valor concesionario liquidador';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_5
  is 'valor fondo cobertura concesonario';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_6
  is 'valor fondo cobertura simit';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_7
  is 'equilibrio economico';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_8
  is 'valor base organsmo transito';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_9
  is 'valor base contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_10
  is 'valor acuerdo de pago';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_11
  is 'valor operador contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_12
  is 'valor fcm contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_13
  is 'valor base municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_14
  is 'iva contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_15
  is 'impuesto timbre contravencioanl';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_16
  is 'retencion en la fuente contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_17
  is 'reteiva contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_18
  is 'valor base tercero 1';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_19
  is 'valor tercero 1';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_20
  is 'valor base tercero 2';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_21
  is 'valor tercero 2';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_22
  is 'valor base tercero 3';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_23
  is 'valor tercero 3';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_24
  is 'valor base tercero 4';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_25
  is 'valor tercero 4';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_26
  is 'valor neto municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_27
  is 'valor neto concesionario propietario';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_28
  is 'valor neto concesioanrio liquidador';
comment on column RECAUDO_EXTERNO_LIQUIDACION.CTA_RECAUDO
  is 'cuenta de recaudo';
comment on column RECAUDO_EXTERNO_LIQUIDACION.IND_BASE_TER1
  is 'indicador base tercero 1';
comment on column RECAUDO_EXTERNO_LIQUIDACION.IND_BASE_TER2
  is 'indicador base tercero 2';
comment on column RECAUDO_EXTERNO_LIQUIDACION.IND_BASE_TER3
  is 'indicador base tercero 3';
comment on column RECAUDO_EXTERNO_LIQUIDACION.IND_BASE_TER4
  is 'indicador base tercero 4';
comment on column RECAUDO_EXTERNO_LIQUIDACION.POR_BASE_TER1
  is 'porcentaje base tercero 1';
comment on column RECAUDO_EXTERNO_LIQUIDACION.POR_BASE_TER2
  is 'porcentaje base tercero 2';
comment on column RECAUDO_EXTERNO_LIQUIDACION.POR_BASE_TER3
  is 'porcentaje base tercero 3';
comment on column RECAUDO_EXTERNO_LIQUIDACION.POR_BASE_TER4
  is 'porcentaje base tercero 4';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_29
  is 'valor neto fcm';
comment on column RECAUDO_EXTERNO_LIQUIDACION.NOM_TER1
  is 'nombre tercero 1';
comment on column RECAUDO_EXTERNO_LIQUIDACION.NOM_TER2
  is 'nombre tercero 2';
comment on column RECAUDO_EXTERNO_LIQUIDACION.NOM_TER3
  is 'nombre tercero 3';
comment on column RECAUDO_EXTERNO_LIQUIDACION.NOM_TER4
  is 'nombre tercero 4';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_1
  is 'valor base';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_2
  is 'valor simit base';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_3
  is 'valor simit pm';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_4
  is 'valor concesionario liquidador';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_5
  is 'valor fondo cobertura concesionario';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_6
  is 'valor fondo cobertura simit';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_7
  is 'equilibrio economico pm';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_8
  is 'valor simit pp';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_9
  is 'valor sevial pp';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_10
  is 'equilibrio economico pp';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_11
  is 'valor base polca';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_12
  is 'valor polca';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_13
  is 'valor fcm cp';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_14
  is 'valor sevial cp';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_15
  is 'equilibrio economico cp';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_16
  is 'iva fcm';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_17
  is 'timbre fcm';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_18
  is 'iva sevial';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_19
  is 'retencion sevial';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_20
  is 'timbre sevial';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_21
  is 'valor base ot';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_22
  is 'valor base contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_23
  is 'valor acuerdo pago';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_24
  is 'valor operador contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_25
  is 'valor fcm contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_26
  is 'valor base municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_27
  is 'iva contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_28
  is 'impuesto timbre contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_29
  is 'retencion contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_30
  is 'reteiva contravencional';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_31
  is 'valor base tercero 1';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_32
  is 'valor tercero 1';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_33
  is 'valor base tercero 2';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_34
  is 'valor tercero 2';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_35
  is 'valor base tercero 3';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_36
  is 'valor tercero 3';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_37
  is 'valor base tercero 4';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_38
  is 'valor tercero 4';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_39
  is 'valor neto municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_40
  is 'valor neto concesionario propietario';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_41
  is 'valor neto concesionario liquidador';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_42
  is 'valor neto fcm';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_43
  is 'valor neto sevial';
comment on column RECAUDO_EXTERNO_LIQUIDACION.S_VALOR_30
  is 'valor Timbre Contravenvencional Concesionario';
comment on column RECAUDO_EXTERNO_LIQUIDACION.P_VALOR_44
  is 'Valor timbre contravencional concesionario';
alter table RECAUDO_EXTERNO_LIQUIDACION
  add constraint PK_RECAUDO_EXTERNO_LIQUIDACION primary key (ID_RECAUDO_EXTERNO_LIQUIDACION);

prompt
prompt Creating table RECAUDO_EXTERNO_TEMP
prompt ===================================
prompt
create table RECAUDO_EXTERNO_TEMP
(
  ID_RECAUDO_EXTERNO  NUMBER not null,
  IDBANCO             CHAR(2),
  CTA_RECAUDO         VARCHAR2(16),
  FEC_CORTE           DATE,
  FEC_TRAN            DATE,
  OFICINA_ORIGEN      VARCHAR2(250),
  VALOR_EFECTIVO      NUMBER,
  VALOR_CHEQUE        NUMBER,
  VALOR_TOTAL         NUMBER,
  IDMUNICIPIO         CHAR(8),
  VALOR_ADICIONAL     NUMBER,
  VALIDADOR_FECHA     CHAR(3),
  INDFECHA2002        CHAR(1),
  NUM_LIQUIDACION     VARCHAR2(15),
  TIPO_IDENTIFICACION NUMBER,
  IDENTIFICACION      VARCHAR2(15),
  NOMBRE_INFRACTOR    VARCHAR2(100),
  APELLIDO_INFRACTOR  VARCHAR2(100),
  NUM_COMPARENDO      VARCHAR2(15),
  FEC_COMPARENDO      DATE,
  NUM_RESOLUCION      NUMBER,
  FEC_RESOLUCION      DATE,
  IDDEPARTAMENTO      CHAR(2)
)
;
alter table RECAUDO_EXTERNO_TEMP
  add constraint PK_RECAUDO_EXTERNO_TEMP primary key (ID_RECAUDO_EXTERNO);

prompt
prompt Creating table RECAUDO_LOCAL
prompt ============================
prompt
create table RECAUDO_LOCAL
(
  IDBANCO        CHAR(2),
  CTA_RECAUDO    VARCHAR2(16),
  INDTIPO        VARCHAR2(5),
  FEC_CORTE      DATE,
  FEC_TRAN       DATE,
  OFICINA_ORIGEN VARCHAR2(250),
  VALOR_EFECTIVO NUMBER,
  VALOR_CHEQUE   NUMBER,
  VALOR_TOTAL    NUMBER,
  NIT_M          VARCHAR2(10),
  IDMUNICIPIO    CHAR(8),
  P_CONSIGNADO   NUMBER
)
;
comment on column RECAUDO_LOCAL.IDBANCO
  is 'Banco recaudo';
comment on column RECAUDO_LOCAL.CTA_RECAUDO
  is 'cuenta de recaudo';
comment on column RECAUDO_LOCAL.INDTIPO
  is 'tipo de recaudo (SIMIT, POLCA)';
comment on column RECAUDO_LOCAL.FEC_CORTE
  is 'fecha de corte';
comment on column RECAUDO_LOCAL.FEC_TRAN
  is 'fecha de transaccion';
comment on column RECAUDO_LOCAL.OFICINA_ORIGEN
  is 'oficina origen';
comment on column RECAUDO_LOCAL.VALOR_EFECTIVO
  is 'valor efectivo';
comment on column RECAUDO_LOCAL.VALOR_CHEQUE
  is 'valor cheque';
comment on column RECAUDO_LOCAL.VALOR_TOTAL
  is 'valor total';
comment on column RECAUDO_LOCAL.NIT_M
  is 'nit municipio';
comment on column RECAUDO_LOCAL.IDMUNICIPIO
  is 'municipio recaudo';
comment on column RECAUDO_LOCAL.P_CONSIGNADO
  is 'porcentaje consignado';

prompt
prompt Creating table RECAUDO_LOCAL_AJUSTES
prompt ====================================
prompt
create table RECAUDO_LOCAL_AJUSTES
(
  IDBANCO                  CHAR(2),
  CTA_RECAUDO              VARCHAR2(16),
  INDTIPO                  VARCHAR2(5),
  FEC_CORTE                DATE,
  FEC_TRAN                 DATE,
  VALOR_TOTAL              NUMBER,
  IDMUNICIPIO              CHAR(8),
  PERIODO                  CHAR(6),
  ID_RECAUDO_LOCAL_AJUSTES NUMBER not null,
  P_CONSIGNADO             NUMBER
)
;
comment on column RECAUDO_LOCAL_AJUSTES.IDBANCO
  is 'Banco';
comment on column RECAUDO_LOCAL_AJUSTES.CTA_RECAUDO
  is 'cuenta de recaudo';
comment on column RECAUDO_LOCAL_AJUSTES.INDTIPO
  is 'tipo de recaudo (SIMIT, POLCA)';
comment on column RECAUDO_LOCAL_AJUSTES.FEC_CORTE
  is 'fecha de corte';
comment on column RECAUDO_LOCAL_AJUSTES.FEC_TRAN
  is 'fecha de transaccion';
comment on column RECAUDO_LOCAL_AJUSTES.VALOR_TOTAL
  is 'valor total del ajuste';
comment on column RECAUDO_LOCAL_AJUSTES.IDMUNICIPIO
  is 'municipio del recaudo';
comment on column RECAUDO_LOCAL_AJUSTES.PERIODO
  is 'periodo de consignacion';
comment on column RECAUDO_LOCAL_AJUSTES.ID_RECAUDO_LOCAL_AJUSTES
  is 'autonumerico';
comment on column RECAUDO_LOCAL_AJUSTES.P_CONSIGNADO
  is 'porcentaje consignado';
alter table RECAUDO_LOCAL_AJUSTES
  add constraint PK_IDRECUADO_LOCAL_AJUSTES primary key (ID_RECAUDO_LOCAL_AJUSTES);

prompt
prompt Creating table RECAUDO_LOCAL_CAUSACION
prompt ======================================
prompt
create table RECAUDO_LOCAL_CAUSACION
(
  OPERACION       VARCHAR2(10),
  FEC_CORTE_INI   DATE,
  FEC_CORTE_FIN   DATE,
  ORI_IDBANCO     CHAR(2),
  ORI_CUENTA      VARCHAR2(16),
  IDCONCESIONARIO CHAR(2),
  VALOR_DEBITO    NUMBER,
  VALOR_CREDITO   NUMBER,
  DEB_CTA_CON     VARCHAR2(16),
  DEB_CEN_COS     VARCHAR2(16),
  DEB_NIT_TER     VARCHAR2(16),
  CRE_CTA_CON     VARCHAR2(16),
  CRE_CEN_COS     VARCHAR2(16),
  CRE_NIT_TER     VARCHAR2(16),
  ORDEN           NUMBER,
  CONCEPTO_CON    VARCHAR2(250),
  USUARIO_PROCESO VARCHAR2(20),
  FECHA_PROCESO   DATE,
  INDTIPO         CHAR(5)
)
;
comment on column RECAUDO_LOCAL_CAUSACION.OPERACION
  is 'Operacion realizada (Ingreso, Gasto)';
comment on column RECAUDO_LOCAL_CAUSACION.FEC_CORTE_INI
  is 'Fecha de corte incial';
comment on column RECAUDO_LOCAL_CAUSACION.FEC_CORTE_FIN
  is 'Fecha de corte final';
comment on column RECAUDO_LOCAL_CAUSACION.ORI_IDBANCO
  is 'banco origen';
comment on column RECAUDO_LOCAL_CAUSACION.ORI_CUENTA
  is 'cuenta origen';
comment on column RECAUDO_LOCAL_CAUSACION.IDCONCESIONARIO
  is 'concesioanrio';
comment on column RECAUDO_LOCAL_CAUSACION.VALOR_DEBITO
  is 'valor debito';
comment on column RECAUDO_LOCAL_CAUSACION.VALOR_CREDITO
  is 'valor credito';
comment on column RECAUDO_LOCAL_CAUSACION.DEB_CTA_CON
  is 'cuenta contable debito';
comment on column RECAUDO_LOCAL_CAUSACION.DEB_CEN_COS
  is 'centro de costo debito';
comment on column RECAUDO_LOCAL_CAUSACION.DEB_NIT_TER
  is 'nit tercero debito';
comment on column RECAUDO_LOCAL_CAUSACION.CRE_CTA_CON
  is 'cuenta contable credito';
comment on column RECAUDO_LOCAL_CAUSACION.CRE_CEN_COS
  is 'centro de costo credito';
comment on column RECAUDO_LOCAL_CAUSACION.CRE_NIT_TER
  is 'nit tercero credito';
comment on column RECAUDO_LOCAL_CAUSACION.ORDEN
  is 'orden en el comprobante';
comment on column RECAUDO_LOCAL_CAUSACION.CONCEPTO_CON
  is 'concepto contable';
comment on column RECAUDO_LOCAL_CAUSACION.USUARIO_PROCESO
  is 'usuario proceso';
comment on column RECAUDO_LOCAL_CAUSACION.FECHA_PROCESO
  is 'fecha proceso';
comment on column RECAUDO_LOCAL_CAUSACION.INDTIPO
  is 'tipo comaprendo (SIMIT, POLCA)';

prompt
prompt Creating table RECAUDO_LOCAL_DISP
prompt =================================
prompt
create table RECAUDO_LOCAL_DISP
(
  FEC_CORTE       DATE,
  FEC_DISPERSION  DATE,
  IDCONCESIONARIO CHAR(2),
  ORDEN           NUMBER,
  CONCEPTO        VARCHAR2(250),
  ORI_IDBANCO     CHAR(2),
  ORI_TIPOCUENTA  VARCHAR2(3),
  ORI_CUENTA      VARCHAR2(16),
  ORI_NIT         VARCHAR2(10),
  DES_IDBANCO     CHAR(2),
  DES_TIPOCUENTA  VARCHAR2(3),
  DES_CUENTA      VARCHAR2(250),
  DES_NIT         VARCHAR2(10),
  INDTIPO         VARCHAR2(5),
  USUARIO_PROCESO VARCHAR2(20),
  FECHA_PROCESO   DATE,
  VALOR           NUMBER,
  DEB_CTA_CON     VARCHAR2(16),
  DEB_CEN_COS     VARCHAR2(16),
  DEB_NIT_TER     VARCHAR2(16),
  CRE_CTA_CON     VARCHAR2(16),
  CRE_CEN_COS     VARCHAR2(16),
  CRE_NIT_TER     VARCHAR2(16),
  CONCEPTO_CON    VARCHAR2(250)
)
;
comment on column RECAUDO_LOCAL_DISP.FEC_CORTE
  is 'Fecha corte';
comment on column RECAUDO_LOCAL_DISP.FEC_DISPERSION
  is 'fecha dispersion';
comment on column RECAUDO_LOCAL_DISP.IDCONCESIONARIO
  is 'concesionario liquidador';
comment on column RECAUDO_LOCAL_DISP.ORDEN
  is 'orden del comprobante';
comment on column RECAUDO_LOCAL_DISP.CONCEPTO
  is 'concepto contable';
comment on column RECAUDO_LOCAL_DISP.ORI_IDBANCO
  is 'banco origen';
comment on column RECAUDO_LOCAL_DISP.ORI_TIPOCUENTA
  is 'tipo de cuenta (Aho, Cte)';
comment on column RECAUDO_LOCAL_DISP.ORI_CUENTA
  is 'cuenta origen';
comment on column RECAUDO_LOCAL_DISP.ORI_NIT
  is 'nit cuenta origen';
comment on column RECAUDO_LOCAL_DISP.DES_IDBANCO
  is 'banco destino';
comment on column RECAUDO_LOCAL_DISP.DES_TIPOCUENTA
  is 'tipo de cuenta destino';
comment on column RECAUDO_LOCAL_DISP.DES_CUENTA
  is 'cuenta destino';
comment on column RECAUDO_LOCAL_DISP.DES_NIT
  is 'nit destino';
comment on column RECAUDO_LOCAL_DISP.INDTIPO
  is 'tipo de comaprendo (SIMIT, POLCA)';
comment on column RECAUDO_LOCAL_DISP.USUARIO_PROCESO
  is 'usuario proceso';
comment on column RECAUDO_LOCAL_DISP.FECHA_PROCESO
  is 'fecha proceso';
comment on column RECAUDO_LOCAL_DISP.VALOR
  is 'valor';
comment on column RECAUDO_LOCAL_DISP.DEB_CTA_CON
  is 'cuenta contable debito';
comment on column RECAUDO_LOCAL_DISP.DEB_CEN_COS
  is 'centro de costo debito';
comment on column RECAUDO_LOCAL_DISP.DEB_NIT_TER
  is 'nit tercero debito';
comment on column RECAUDO_LOCAL_DISP.CRE_CTA_CON
  is 'cuenta contable credito';
comment on column RECAUDO_LOCAL_DISP.CRE_CEN_COS
  is 'centro de costo credito';
comment on column RECAUDO_LOCAL_DISP.CRE_NIT_TER
  is 'nit tercero credito';
comment on column RECAUDO_LOCAL_DISP.CONCEPTO_CON
  is 'concepto contable';

prompt
prompt Creating table RECAUDO_LOCAL_LIQ_HIS
prompt ====================================
prompt
create table RECAUDO_LOCAL_LIQ_HIS
(
  CONSECUTIVO_RECAUDO  NUMBER(8) not null,
  ID_ESTADO_RECAUDO    VARCHAR2(2),
  ID_TIPO_RECAUDO      VARCHAR2(2),
  ID_SECRETARIA_ORIGEN VARCHAR2(10),
  FECHA_CONTABLE       DATE,
  TOTAL_RECAUDO        NUMBER(12),
  NUMERO_REFERENCIA    VARCHAR2(15),
  IDENTIFICACION       VARCHAR2(15),
  FECHA_DESDE_MVTO     DATE,
  FECHA_HASTA_MVTO     DATE,
  FECHA_INS_UPT        DATE default SYSDATE,
  P_55                 NUMBER,
  P_FCM                NUMBER,
  P_MUN                NUMBER
)
;
alter table RECAUDO_LOCAL_LIQ_HIS
  add constraint PK_REC_LOC_LIQ_HIS primary key (CONSECUTIVO_RECAUDO);

prompt
prompt Creating table RECAUDO_LOCAL_LIQUIDACION
prompt ========================================
prompt
create table RECAUDO_LOCAL_LIQUIDACION
(
  IDRECAUDO_LOCAL_LIQUIDACION NUMBER,
  IDBANCO                     CHAR(2),
  CTA_RECAUDO                 VARCHAR2(16),
  INDTIPO                     VARCHAR2(5),
  FEC_CORTE                   DATE,
  FEC_TRAN                    DATE,
  OFICINA_ORIGEN              VARCHAR2(250),
  VALOR_EFECTIVO              NUMBER,
  VALOR_CHEQUE                NUMBER,
  VALOR_TOTAL                 NUMBER,
  NIT_M                       VARCHAR2(10),
  IDMUNICIPIO                 CHAR(8),
  IDDEPARTAMENTO              CHAR(2),
  USUARIO_PROCESO             VARCHAR2(20),
  FECHA_PROCESO               DATE,
  IND_PROCESO                 NUMBER,
  INDORIGEN                   CHAR(3),
  IDCONCESIONARIO             CHAR(2),
  DIAS_DISPERSION             NUMBER,
  FREC_DISPERSION             NUMBER,
  FEC_DISPERSION              DATE,
  S_VALOR_0                   NUMBER default 0,
  S_VALOR_1                   NUMBER default 0,
  S_VALOR_2                   NUMBER default 0,
  S_VALOR_3                   NUMBER default 0,
  S_VALOR_4                   NUMBER default 0,
  S_VALOR_5                   NUMBER default 0,
  S_VALOR_6                   NUMBER default 0,
  P_VALOR_7                   NUMBER default 0,
  P_VALOR_8                   NUMBER default 0,
  P_VALOR_9                   NUMBER default 0,
  P_VALOR_10                  NUMBER default 0,
  P_VALOR_11                  NUMBER default 0,
  P_VALOR_12                  NUMBER default 0,
  P_VALOR_13                  NUMBER default 0,
  P_VALOR_14                  NUMBER default 0,
  P_VALOR_15                  NUMBER default 0,
  P_VALOR_16                  NUMBER default 0,
  P_VALOR_17                  NUMBER default 0,
  P_VALOR_18                  NUMBER default 0,
  P_VALOR_19                  NUMBER default 0,
  P_VALOR_20                  NUMBER default 0,
  P_VALOR_21                  NUMBER default 0,
  P_VALOR_22                  NUMBER default 0,
  P_VALOR_23                  NUMBER default 0,
  P_VALOR_24                  NUMBER default 0,
  P_VALOR_25                  NUMBER default 0,
  P_VALOR_26                  NUMBER default 0,
  P_VALOR_27                  NUMBER default 0,
  P_VALOR_28                  NUMBER default 0,
  P_CONSIGNADO                NUMBER
)
;
comment on column RECAUDO_LOCAL_LIQUIDACION.IDRECAUDO_LOCAL_LIQUIDACION
  is 'autonumerico';
comment on column RECAUDO_LOCAL_LIQUIDACION.IDBANCO
  is 'banco';
comment on column RECAUDO_LOCAL_LIQUIDACION.CTA_RECAUDO
  is 'cuenta recaudo';
comment on column RECAUDO_LOCAL_LIQUIDACION.INDTIPO
  is 'tipo de recuado (SIMIT, POLCA)';
comment on column RECAUDO_LOCAL_LIQUIDACION.FEC_CORTE
  is 'fecha de corte';
comment on column RECAUDO_LOCAL_LIQUIDACION.FEC_TRAN
  is 'fecha de transaccion';
comment on column RECAUDO_LOCAL_LIQUIDACION.OFICINA_ORIGEN
  is 'oficina origen';
comment on column RECAUDO_LOCAL_LIQUIDACION.VALOR_EFECTIVO
  is 'valor efectivo';
comment on column RECAUDO_LOCAL_LIQUIDACION.VALOR_CHEQUE
  is 'valor cheque';
comment on column RECAUDO_LOCAL_LIQUIDACION.VALOR_TOTAL
  is 'valor total';
comment on column RECAUDO_LOCAL_LIQUIDACION.NIT_M
  is 'nit municipio';
comment on column RECAUDO_LOCAL_LIQUIDACION.IDMUNICIPIO
  is 'municipio';
comment on column RECAUDO_LOCAL_LIQUIDACION.IDDEPARTAMENTO
  is 'departamento';
comment on column RECAUDO_LOCAL_LIQUIDACION.USUARIO_PROCESO
  is 'usuario proceso';
comment on column RECAUDO_LOCAL_LIQUIDACION.FECHA_PROCESO
  is 'fecha de proceso';
comment on column RECAUDO_LOCAL_LIQUIDACION.IND_PROCESO
  is 'indicador de proceso';
comment on column RECAUDO_LOCAL_LIQUIDACION.INDORIGEN
  is 'indicador origen (REC, AJU)';
comment on column RECAUDO_LOCAL_LIQUIDACION.IDCONCESIONARIO
  is 'concesionario';
comment on column RECAUDO_LOCAL_LIQUIDACION.DIAS_DISPERSION
  is 'dias de dispersion';
comment on column RECAUDO_LOCAL_LIQUIDACION.FREC_DISPERSION
  is 'frecuencia de dispersion';
comment on column RECAUDO_LOCAL_LIQUIDACION.FEC_DISPERSION
  is 'fecha de dispersion';
comment on column RECAUDO_LOCAL_LIQUIDACION.S_VALOR_0
  is 'comsion recaudo';
comment on column RECAUDO_LOCAL_LIQUIDACION.S_VALOR_1
  is 'valor simit';
comment on column RECAUDO_LOCAL_LIQUIDACION.S_VALOR_2
  is 'valor concesionario';
comment on column RECAUDO_LOCAL_LIQUIDACION.S_VALOR_3
  is 'valro fondo cobertura concesionario';
comment on column RECAUDO_LOCAL_LIQUIDACION.S_VALOR_4
  is 'valor fondo cobertura simit';
comment on column RECAUDO_LOCAL_LIQUIDACION.S_VALOR_5
  is 'equilibrio economico';
comment on column RECAUDO_LOCAL_LIQUIDACION.S_VALOR_6
  is 'valor neto concesionario';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_7
  is 'valor simit pm';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_8
  is 'valor concesionario';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_9
  is 'valor fondo cobertura concesioanrio';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_10
  is 'valor fondo cobertura simit';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_11
  is 'equilibrio economico pm';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_12
  is 'valor simit pp';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_13
  is 'valor sevial ';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_14
  is 'equilibrio economico pp';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_15
  is 'polca';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_16
  is 'fcm';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_17
  is 'sevial';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_18
  is 'equilibrio economico cp';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_19
  is 'iva fcm';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_20
  is 'iva sevial';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_21
  is 'retencion sevial';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_22
  is 'timbre sevial';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_23
  is 'timbre fcm';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_24
  is 'valor neto sevial';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_25
  is 'valor neto concesionario';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_26
  is 'valor neto fcm';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_27
  is 'valor neto simit';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_VALOR_28
  is 'valor neto equilibrio economico';
comment on column RECAUDO_LOCAL_LIQUIDACION.P_CONSIGNADO
  is 'porcentaje consignado';

prompt
prompt Creating table RECAUDO_LOCAL_TEMP
prompt =================================
prompt
create table RECAUDO_LOCAL_TEMP
(
  IDBANCO        CHAR(2),
  CTA_RECAUDO    VARCHAR2(16),
  INDTIPO        VARCHAR2(5),
  FEC_CORTE      DATE,
  FEC_TRAN       DATE,
  OFICINA_ORIGEN VARCHAR2(250),
  VALOR_EFECTIVO NUMBER,
  VALOR_CHEQUE   NUMBER,
  VALOR_TOTAL    NUMBER,
  NIT_M          VARCHAR2(10),
  IDMUNICIPIO    CHAR(8),
  P_CONSIGNADO   NUMBER
)
;
comment on column RECAUDO_LOCAL_TEMP.IDBANCO
  is 'banco';
comment on column RECAUDO_LOCAL_TEMP.CTA_RECAUDO
  is 'cuenta de recaudo';
comment on column RECAUDO_LOCAL_TEMP.INDTIPO
  is 'tipo de recaudo (Simit , Polca)';
comment on column RECAUDO_LOCAL_TEMP.FEC_CORTE
  is 'Fecha de corte';
comment on column RECAUDO_LOCAL_TEMP.FEC_TRAN
  is 'fecha de transaccion';
comment on column RECAUDO_LOCAL_TEMP.OFICINA_ORIGEN
  is 'oficina origen';
comment on column RECAUDO_LOCAL_TEMP.VALOR_EFECTIVO
  is 'valor efectivo';
comment on column RECAUDO_LOCAL_TEMP.VALOR_CHEQUE
  is 'valor cheque';
comment on column RECAUDO_LOCAL_TEMP.VALOR_TOTAL
  is 'valor total';
comment on column RECAUDO_LOCAL_TEMP.NIT_M
  is 'nit municipio';
comment on column RECAUDO_LOCAL_TEMP.IDMUNICIPIO
  is 'municipio';
comment on column RECAUDO_LOCAL_TEMP.P_CONSIGNADO
  is 'porcentaje consignado';

prompt
prompt Creating table REC_LOC_HIST
prompt ===========================
prompt
create table REC_LOC_HIST
(
  CONSECUTIVO_RECAUDO  NUMBER(8) not null,
  ID_SECRETARIA_ORIGEN VARCHAR2(10),
  ID_TIPO_DOC          VARCHAR2(1),
  IDENTIFICACION       VARCHAR2(15) not null,
  NUMERO_REFERENCIA    VARCHAR2(15),
  FECHA_TRANSACCION    DATE,
  FECHA_CONTABLE       DATE,
  VALOR_RECAUDO        NUMBER,
  VALOR_ADICIONAL      NUMBER,
  SUMA_PAGOS           NUMBER,
  VALOR_COM            NUMBER,
  FECHA_COM            DATE,
  COD_INFRACCION       VARCHAR2(5),
  TOTAL_RECAUDO        NUMBER,
  POLCA                VARCHAR2(1),
  ID_TIPO_RECAUDO      VARCHAR2(2),
  ID_ESTADO_RECAUDO    VARCHAR2(2),
  FECHA_MOV_DESDE      DATE,
  FECHA_MOV_HASTA      DATE,
  X55                  NUMBER,
  XFCM                 NUMBER,
  XMUN                 NUMBER,
  OBS                  VARCHAR2(10),
  FECHA_EJECUCION      DATE default SYSDATE,
  NOVEDAD              VARCHAR2(1),
  FECHA_CARGA          DATE,
  NO_COMP              VARCHAR2(15),
  ID_SECRETARIA_DEUDA  VARCHAR2(10)
)
;
alter table REC_LOC_HIST
  add primary key (CONSECUTIVO_RECAUDO);

prompt
prompt Creating table REC_LOC_HIST_BQUILLA
prompt ===================================
prompt
create table REC_LOC_HIST_BQUILLA
(
  CONSECUTIVO_RECAUDO  NUMBER(8) not null,
  ID_SECRETARIA_ORIGEN VARCHAR2(10),
  ID_TIPO_DOC          VARCHAR2(1),
  IDENTIFICACION       VARCHAR2(15) not null,
  NUMERO_REFERENCIA    VARCHAR2(15),
  FECHA_TRANSACCION    DATE,
  FECHA_CONTABLE       DATE,
  VALOR_RECAUDO        NUMBER,
  VALOR_ADICIONAL      NUMBER,
  SUMA_PAGOS           NUMBER,
  VALOR_COM            NUMBER,
  FECHA_COM            DATE,
  COD_INFRACCION       VARCHAR2(5),
  TOTAL_RECAUDO        NUMBER,
  POLCA                VARCHAR2(1),
  ID_TIPO_RECAUDO      VARCHAR2(2),
  ID_ESTADO_RECAUDO    VARCHAR2(2),
  FECHA_MOV_DESDE      DATE,
  FECHA_MOV_HASTA      DATE,
  OBS                  VARCHAR2(10),
  FECHA_EJECUCION      DATE,
  NOVEDAD              VARCHAR2(1),
  FECHA_CARGA          DATE,
  NO_COMP              VARCHAR2(15),
  X55                  NUMBER,
  XFCM                 NUMBER,
  XMUN                 NUMBER
)
;

prompt
prompt Creating table REC_LOC_HIST_PAGO
prompt ================================
prompt
create table REC_LOC_HIST_PAGO
(
  CONSECUTIVO        NUMBER not null,
  DIVIPO             VARCHAR2(8),
  VALOR_RECAUDO      NUMBER,
  CEDULA_FUNCIONARIO VARCHAR2(50),
  TIPO_PAGO          VARCHAR2(30),
  POLCA              CHAR(1) not null
)
;
alter table REC_LOC_HIST_PAGO
  add constraint PK_REC_LOC_HIST_PAGO primary key (CONSECUTIVO, POLCA);

prompt
prompt Creating table ROL
prompt ==================
prompt
create table ROL
(
  ROLID     NUMBER,
  NAMEROL   VARCHAR2(100),
  ENABLEROL NUMBER,
  ENABLEMOD NUMBER
)
;
comment on column ROL.ROLID
  is 'autonumerico';
comment on column ROL.NAMEROL
  is 'nombre del rol';
comment on column ROL.ENABLEROL
  is 'activo';
comment on column ROL.ENABLEMOD
  is 'Modificar datos';

prompt
prompt Creating table ROLXPERSON
prompt =========================
prompt
create table ROLXPERSON
(
  ROLID    NUMBER,
  PERSONID NUMBER
)
;
comment on column ROLXPERSON.ROLID
  is 'rol';
comment on column ROLXPERSON.PERSONID
  is 'funcionario';

prompt
prompt Creating table RPT1
prompt ===================
prompt
create table RPT1
(
  IDMUNICIPIO      CHAR(8),
  MUNICIPIO_NOMBRE VARCHAR2(50),
  TIPOREC          VARCHAR2(8),
  IND_TIPO         VARCHAR2(5),
  CONCESIONARIO1   NUMBER,
  CONCESIONARIO2   NUMBER,
  CONCESIONARIO3   NUMBER,
  CONCESIONARIO4   NUMBER,
  CONCESIONARIO5   NUMBER,
  VALOR_TOTAL      NUMBER,
  VALOR_OT         NUMBER
)
;

prompt
prompt Creating table RTATXVILLAS_CTR
prompt ==============================
prompt
create table RTATXVILLAS_CTR
(
  TIPOREGISTRO            VARCHAR2(1),
  FECHAGENERACION         VARCHAR2(8),
  NUMEROREGISTROS         VARCHAR2(8),
  VALORTOTALTRANSFERENCIA VARCHAR2(18),
  FILLER                  VARCHAR2(215)
)
;

prompt
prompt Creating table RTATXVILLAS_DET
prompt ==============================
prompt
create table RTATXVILLAS_DET
(
  TIPOREGISTRO                VARCHAR2(1),
  FECHAGENERACION             VARCHAR2(8),
  NUMEROREGISTRO              VARCHAR2(8),
  REFERENCIA                  VARCHAR2(16),
  BANCOORIGEN                 VARCHAR2(3),
  TIPODECUENTAORIGEN          VARCHAR2(1),
  NUMERODECUENTAORIGEN        VARCHAR2(16),
  VALORTRANSFERENCIA          VARCHAR2(18),
  BANCODESTINO                VARCHAR2(3),
  TIPODECUENTADESTINO         VARCHAR2(1),
  NUMERODECUENTADESTINO       VARCHAR2(16),
  TIPOIDENTIFICACIONDESTINO   VARCHAR2(1),
  NUMEROIDENTIFICACIONDESTINO VARCHAR2(16),
  MENSAJEDERESPUESTA          VARCHAR2(100),
  CODIGODERESPUESTA           VARCHAR2(3),
  FILLER                      VARCHAR2(41)
)
;

prompt
prompt Creating table SALARIO_MINIMO
prompt =============================
prompt
create table SALARIO_MINIMO
(
  ANHO  NUMBER not null,
  VALOR NUMBER
)
;
comment on column SALARIO_MINIMO.ANHO
  is 'ano';
comment on column SALARIO_MINIMO.VALOR
  is 'medio salario minimo diario legal vigente';
alter table SALARIO_MINIMO
  add constraint PK_ANHO primary key (ANHO);
alter table SALARIO_MINIMO
  add constraint CH_VALOR
  check (VALOR > 0);

prompt
prompt Creating table TERCERO
prompt ======================
prompt
create table TERCERO
(
  IDMUNICIPIO   CHAR(8) not null,
  NIT_T         CHAR(10) not null,
  NOMBRE        VARCHAR2(50),
  IDBANCO       CHAR(2),
  TIPOCUENTA    VARCHAR2(3),
  CUENTA        VARCHAR2(250),
  BASE_S        NUMBER,
  BASE_P        NUMBER,
  IND_BASE      NUMBER,
  NUM_TERCERO   NUMBER not null,
  CORREOTERCERO VARCHAR2(50)
)
;
comment on column TERCERO.IDMUNICIPIO
  is 'municipio';
comment on column TERCERO.NIT_T
  is 'nir del tercero';
comment on column TERCERO.NOMBRE
  is 'nombre del tercero';
comment on column TERCERO.IDBANCO
  is 'banco ';
comment on column TERCERO.TIPOCUENTA
  is 'tipo de cuenta (AHO; CTE)';
comment on column TERCERO.CUENTA
  is 'cuenta ';
comment on column TERCERO.BASE_S
  is 'porcentaje base simit';
comment on column TERCERO.BASE_P
  is 'porcentaje base polca';
comment on column TERCERO.IND_BASE
  is 'indicador de base';
comment on column TERCERO.NUM_TERCERO
  is 'numero de tercero';
comment on column TERCERO.CORREOTERCERO
  is 'correo tercero';
alter table TERCERO
  add constraint PK_TERCERO primary key (IDMUNICIPIO, NUM_TERCERO);
alter table TERCERO
  add constraint FK_IDBANCO_T foreign key (IDBANCO)
  references BANCO (IDBANCO);
alter table TERCERO
  add constraint FK_IDMUNICIPIO_T foreign key (IDMUNICIPIO)
  references MUNICIPIO (IDMUNICIPIO);
alter table TERCERO
  add constraint CH_TIPOCUENTA_T
  check (tipocuenta IN ('AHO','CTE'));

prompt
prompt Creating table UPLOAD
prompt =====================
prompt
create table UPLOAD
(
  UPLOADID INTEGER not null,
  FILENAME VARCHAR2(255),
  USUARIO  VARCHAR2(100),
  FECHA    DATE,
  VALIDA   NUMBER,
  CFILE    CLOB
)
;
comment on column UPLOAD.UPLOADID
  is 'Autonumerico';
comment on column UPLOAD.FILENAME
  is 'archivo';
comment on column UPLOAD.USUARIO
  is 'usuario';
comment on column UPLOAD.FECHA
  is 'fecha';
comment on column UPLOAD.VALIDA
  is 'valida';
comment on column UPLOAD.CFILE
  is 'contenido archivo';

prompt
prompt Creating table VALIDADOR_FECHA
prompt ==============================
prompt
create table VALIDADOR_FECHA
(
  IDMUNICIPIO              CHAR(8) not null,
  IDVALIDADOR              CHAR(3) not null,
  FECHA_INI                DATE,
  FECHA_FIN                DATE,
  INDTIPO                  VARCHAR2(5) not null,
  P_MUNICIPIO              NUMBER,
  P_FCM_CONTRAVENCIONAL    NUMBER,
  P_CONCES_CONTRAVENCIONAL NUMBER,
  P_ACUERDOPAGO            NUMBER,
  NIT_TERCERO1             VARCHAR2(10),
  BASE_TERCERO1            NUMBER,
  IND_BASE_TERCERO1        NUMBER,
  NIT_TERCERO2             VARCHAR2(10),
  BASE_TERCERO2            NUMBER,
  IND_BASE_TERCERO2        NUMBER
)
;
comment on column VALIDADOR_FECHA.IDMUNICIPIO
  is 'Municipio';
comment on column VALIDADOR_FECHA.IDVALIDADOR
  is 'validador';
comment on column VALIDADOR_FECHA.FECHA_INI
  is 'fecha inicial';
comment on column VALIDADOR_FECHA.FECHA_FIN
  is 'fecha final';
comment on column VALIDADOR_FECHA.INDTIPO
  is 'tipo comparendo (SIMIT, POLCA)';
comment on column VALIDADOR_FECHA.P_MUNICIPIO
  is 'porcentaje municipio';
comment on column VALIDADOR_FECHA.P_FCM_CONTRAVENCIONAL
  is 'porcentaje fcm contravencional';
comment on column VALIDADOR_FECHA.P_CONCES_CONTRAVENCIONAL
  is 'porcentaje concesionario contravencional';
comment on column VALIDADOR_FECHA.P_ACUERDOPAGO
  is 'porcentaje de acuerdo de pago';
comment on column VALIDADOR_FECHA.NIT_TERCERO1
  is 'nit tercero 1';
comment on column VALIDADOR_FECHA.BASE_TERCERO1
  is 'base tercero 1';
comment on column VALIDADOR_FECHA.IND_BASE_TERCERO1
  is 'indicador base tercero 1';
comment on column VALIDADOR_FECHA.NIT_TERCERO2
  is 'nit tercero 2';
comment on column VALIDADOR_FECHA.BASE_TERCERO2
  is 'base tercero 2';
comment on column VALIDADOR_FECHA.IND_BASE_TERCERO2
  is 'base tercero 2';
alter table VALIDADOR_FECHA
  add constraint PK_VALIDADOR_FECHA primary key (IDMUNICIPIO, IDVALIDADOR, INDTIPO);
alter table VALIDADOR_FECHA
  add constraint CH_INDTIPO_VF
  check (INDTIPO IN ('SIMIT','POLCA'));

prompt
prompt Creating sequence SEQ_ERRORS
prompt ============================
prompt
create sequence SEQ_ERRORS
minvalue 1
maxvalue 999999999999999999999999999
start with 4007
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MENU
prompt ==========================
prompt
create sequence SEQ_MENU
minvalue 1
maxvalue 999999999999999999999999999
start with 346
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NOVEDAD
prompt =============================
prompt
create sequence SEQ_NOVEDAD
minvalue 1
maxvalue 999999999999999999999999999
start with 161
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RECAUDO_EXTERNO
prompt =====================================
prompt
create sequence SEQ_RECAUDO_EXTERNO
minvalue 1
maxvalue 999999999999999999999999999
start with 1442308
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RECAUDO_EXTERNO_LIQ
prompt =========================================
prompt
create sequence SEQ_RECAUDO_EXTERNO_LIQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1321522
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RECAUDO_EXTERNO_TEMP
prompt ==========================================
prompt
create sequence SEQ_RECAUDO_EXTERNO_TEMP
minvalue 1
maxvalue 999999999999999999999999999
start with 23021
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RECAUDO_LOCAL_AJUSTES
prompt ===========================================
prompt
create sequence SEQ_RECAUDO_LOCAL_AJUSTES
minvalue 1
maxvalue 999999999999999999999999999
start with 992
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RECAUDO_LOCAL_LIQUIDACION
prompt ===============================================
prompt
create sequence SEQ_RECAUDO_LOCAL_LIQUIDACION
minvalue 1
maxvalue 999999999999999999999999999
start with 1491604
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROL
prompt =========================
prompt
create sequence SEQ_ROL
minvalue 1
maxvalue 999999999999999999999999999
start with 229
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TRANSFERENCIA
prompt ===================================
prompt
create sequence SEQ_TRANSFERENCIA
minvalue 1
maxvalue 999999999999999999999999999
start with 47701
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_UPLOADS
prompt =============================
prompt
create sequence SEQ_UPLOADS
minvalue 1
maxvalue 999999999999999999999999999
start with 4022
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_VOBO
prompt ==========================
prompt
create sequence SEQ_VOBO
minvalue 1
maxvalue 999999999999999999999999999
start with 161
increment by 1
cache 20;

prompt
prompt Creating view VW_CARGOS
prompt =======================
prompt
create or replace view vw_cargos as
select ' Seleccione'as Cargo, ' Seleccione' as Nombre
    from fcm f
  union
  select 'Director Ejecutivo'as Cargo, f.director_ejecutivo as Nombre
    from fcm f
  union
  select 'Director Nacional' as Cargo,f.director_nacional as Nombre
    from fcm f
  union
  select 'Contador General' as Cargo,f.contador_general as Nombre
    from fcm f
  union
  select 'Coordinador Financiero' as Cargo,f.coordinador_financiero as Nombre
    from fcm f;

prompt
prompt Creating view VW_CAUSAGASPOLCAEXTERNO
prompt =====================================
prompt
create or replace view vw_causagaspolcaexterno as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_externo_causacion r, banco bori
   where OPERACION = 'GASTO'
   and indtipo = 'POLCA'
   and r.ori_idbanco = bori.idbanco
   and ( r.valor_debito <> 0 or r.valor_credito <> 0 )
   order by r.ori_idbanco, r.orden, r.idconcesionario;

prompt
prompt Creating view VW_CAUSAGASPOLCALOCAL
prompt ===================================
prompt
create or replace view vw_causagaspolcalocal as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_LOCAL_causacion r, banco bori
   where OPERACION = 'GASTO'
   and indtipo = 'POLCA'
   and r.ori_idbanco = bori.idbanco
   order by r.ori_idbanco, r.orden, r.idconcesionario;

prompt
prompt Creating view VW_CAUSAGASSIMITEXTERNO
prompt =====================================
prompt
create or replace view vw_causagassimitexterno as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_EXTERNO_causacion r, banco bori
   where OPERACION = 'GASTO'
   and indtipo = 'SIMIT'
   and r.ori_idbanco = bori.idbanco
   and ( r.valor_debito <> 0 or r.valor_credito <> 0 )
   order by r.ori_idbanco, orden, r.idconcesionario;

prompt
prompt Creating view VW_CAUSAGASSIMITLOCAL
prompt ===================================
prompt
create or replace view vw_causagassimitlocal as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_LOCAL_causacion r, banco bori
   where OPERACION = 'GASTO'
   and indtipo = 'SIMIT'
   and r.ori_idbanco = bori.idbanco
   order by r.ori_idbanco, orden, r.idconcesionario;

prompt
prompt Creating view VW_CAUSAINGPOLCAEXTERNO
prompt =====================================
prompt
create or replace view vw_causaingpolcaexterno as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_externo_causacion r, banco bori
   where OPERACION = 'INGRESO'
   and indtipo = 'POLCA'
   and r.ori_idbanco = bori.idbanco
   and ( r.valor_debito <> 0 or r.valor_credito <> 0 )
   order by r.ori_idbanco, r.ori_cuenta, r.orden;

prompt
prompt Creating view VW_CAUSAINGPOLCALOCAL
prompt ===================================
prompt
create or replace view vw_causaingpolcalocal as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_LOCAL_causacion r, banco bori
   where OPERACION = 'INGRESO'
   and indtipo = 'POLCA'
   and r.ori_idbanco = bori.idbanco
   order by r.ori_idbanco, orden;

prompt
prompt Creating view VW_CAUSAINGSIMITEXTERNO
prompt =====================================
prompt
create or replace view vw_causaingsimitexterno as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_externo_causacion r, banco bori
   where OPERACION = 'INGRESO'
   and indtipo = 'SIMIT'
   and r.ori_idbanco = bori.idbanco
   and ( r.valor_debito <> 0 or r.valor_credito <> 0 )
   order by r.ori_idbanco, r.ori_cuenta, r.orden;

prompt
prompt Creating view VW_CAUSAINGSIMITLOCAL
prompt ===================================
prompt
create or replace view vw_causaingsimitlocal as
select
operacion,
fec_corte_ini,
fec_corte_fin,
ori_idbanco,
bori.nombre "banco",
ori_cuenta,
valor_debito,
valor_credito,
deb_cta_con,
deb_cen_cos,
deb_nit_ter,
cre_cta_con,
cre_cen_cos,
cre_nit_ter,
orden,
concepto_con,
usuario_proceso,
fecha_proceso
   from RECAUDO_LOCAL_causacion r, banco bori
   where OPERACION = 'INGRESO'
   and indtipo = 'SIMIT'
   and r.ori_idbanco = bori.idbanco
   order by r.ori_idbanco, orden;

prompt
prompt Creating view VW_CUENTAS
prompt ========================
prompt
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

prompt
prompt Creating view VW_DISPOLCAEXTERNO
prompt ================================
prompt
create or replace view vw_dispolcaexterno as
select
      fec_corte_ini,
      fec_corte_fin,
      fec_dispersion,
      r.id_concesionario_liq "idconcesionario",
      orden,
      concepto,
      ori_idbanco,
      ori_tipocuenta,
      ori_cuenta,
      ori_nit,
      des_idbanco,
      des_tipocuenta,
      des_cuenta,
      des_nit,
      indtipo,
      usuario_proceso,
      fecha_proceso,
      valor,
      c.nombre "Concesionario",
      bdes.nombre "BancoDes",
      bori.nombre "BancoOri",
      deb_cta_con,
      deb_cen_cos,
      deb_nit_ter,
      cre_cta_con,
      cre_cen_cos,
      cre_nit_ter,
      concepto_con
    from RECAUDO_externo_DISP r, concesionario c, banco bdes, banco bori
   where INDTIPO = 'POLCA'
   and r.id_concesionario_liq = c.idconcesionario
   and r.ori_idbanco = bori.idbanco
   and r.des_idbanco = bdes.idbanco
   and r.valor <> 0.0
   order by r.fec_dispersion, r.id_concesionario_liq,orden;

prompt
prompt Creating view VW_DISSIMITEXTERNO
prompt ================================
prompt
create or replace view vw_dissimitexterno as
select
      fec_corte_ini,
      fec_corte_fin,
      fec_dispersion,
      r.id_concesionario_liq,
      orden,
      concepto,
      ori_idbanco,
      ori_tipocuenta,
      ori_cuenta,
      ori_nit,
      des_idbanco,
      des_tipocuenta,
      desencriptar(des_cuenta) as des_cuenta,
      des_nit,
      indtipo,
      usuario_proceso,
      fecha_proceso,
      valor,
      c.nombre as Concesionario,
      bdes.nombre as BancoDes,
      bori.nombre as BancoOri,
      r.idmunicipio
from RECAUDO_externo_DISP r, concesionario c, banco bdes, banco bori
where r.id_concesionario_liq = c.idconcesionario
and r.ori_idbanco = bori.idbanco
and r.des_idbanco = bdes.idbanco;

prompt
prompt Creating view VW_DISTOTDETALLADO
prompt ================================
prompt
create or replace view vw_distotdetallado as
select l."ID_RECAUDO_EXTERNO_LIQUIDACION",l."ID_RECAUDO_EXTERNO",l."ID_CONCESIONARIO_PRO",l."ID_CONCESIONARIO_LIQ",l."INDTIPO",l."USUARIO_PROCESO",l."FECHA_PROCESO",l."IDMUNICIPIO",l."FEC_CORTE",l."IND_PROCESO",l."NUM_LIQUIDACION",l."DIAS_DISPERSION",l."FREC_DISPERSION",l."FEC_DISPERSION",l."IDBANCO",l."SMDLV",l."INDRETROACTIVIDAD",l."VALOR_TOTAL",l."VALOR_ADICIONAL",l."VALIDADOR_FECHA",l."INDFECHA2002",l."S_VALOR_0",l."S_VALOR_1",l."S_VALOR_2",l."S_VALOR_3",l."S_VALOR_4",l."S_VALOR_5",l."S_VALOR_6",l."S_VALOR_7",l."S_VALOR_8",l."S_VALOR_9",l."S_VALOR_10",l."S_VALOR_11",l."S_VALOR_12",l."S_VALOR_13",l."S_VALOR_14",l."S_VALOR_15",l."S_VALOR_16",l."S_VALOR_17",l."S_VALOR_18",l."S_VALOR_19",l."S_VALOR_20",l."S_VALOR_21",l."S_VALOR_22",l."S_VALOR_23",l."S_VALOR_24",l."S_VALOR_25",l."S_VALOR_26",l."S_VALOR_27",l."S_VALOR_28",l."CTA_RECAUDO",l."IND_BASE_TER1",l."IND_BASE_TER2",l."IND_BASE_TER3",l."IND_BASE_TER4",l."POR_BASE_TER1",l."POR_BASE_TER2",l."POR_BASE_TER3",
l."POR_BASE_TER4",l."S_VALOR_29",l."NOM_TER1",l."NOM_TER2",l."NOM_TER3",l."NOM_TER4",l."P_VALOR_1",l."P_VALOR_2",l."P_VALOR_3",l."P_VALOR_4",l."P_VALOR_5",l."P_VALOR_6",l."P_VALOR_7",l."P_VALOR_8",l."P_VALOR_9",l."P_VALOR_10",l."P_VALOR_11",l."P_VALOR_12",l."P_VALOR_13",l."P_VALOR_14",l."P_VALOR_15",l."P_VALOR_16",l."P_VALOR_17",l."P_VALOR_18",l."P_VALOR_19",l."P_VALOR_20",l."P_VALOR_21",l."P_VALOR_22",l."P_VALOR_23",l."P_VALOR_24",l."P_VALOR_25",l."P_VALOR_26",l."P_VALOR_27",l."P_VALOR_28",l."P_VALOR_29",l."P_VALOR_30",l."P_VALOR_31",l."P_VALOR_32",l."P_VALOR_33",l."P_VALOR_34",l."P_VALOR_35",l."P_VALOR_36",l."P_VALOR_37",l."P_VALOR_38",l."P_VALOR_39",l."P_VALOR_40",l."P_VALOR_41",l."P_VALOR_42",l."P_VALOR_43",l."S_VALOR_30",l."P_VALOR_44",l."FEC_DISPERSION_CON",l."NIT_MUNICIPIO",l."NIT_TERCERO1",l."NIT_TERCERO2",l."NIT_TERCERO3",l."NIT_TERCERO4",l."NIT_CONCESIONARIO",l."NIT_FONDO",l."NIT_CONCESIONARIOZON",
b.nombre as nomBanco,
c.nombre as nomConcesionario,
m.nombre as nomMunicipio,
(s_valor_26 + p_valor_39) as v_municipio,
(s_valor_19 + p_valor_32) as VTercero1,
(s_valor_21 + p_valor_34) as VTercero2,
r.identificacion,
r.num_comparendo
from
recaudo_externo_liquidacion l, banco b, concesionario c, municipio m, recaudo_externo r where l.idbanco = b.idbanco and l.ID_CONCESIONARIO_LIQ = c.idconcesionario and l.idmunicipio = m.idmunicipio and l.id_recaudo_externo = r.id_recaudo_externo;

prompt
prompt Creating view VW_RECAUDO_EXTERNO_DISP_TOT
prompt =========================================
prompt
create or replace view vw_recaudo_externo_disp_tot as
select "FEC_CORTE_INI","FEC_CORTE_FIN","FEC_DISPERSION","ID_CONCESIONARIO_LIQ","ORDEN","CONCEPTO","ORI_IDBANCO","ORI_TIPOCUENTA","ORI_CUENTA","ORI_NIT","DES_IDBANCO","DES_TIPOCUENTA","DES_CUENTA","DES_NIT","INDTIPO","USUARIO_PROCESO","FECHA_PROCESO","VALOR","DEB_CTA_CON","DEB_CEN_COS","DEB_NIT_TER","CRE_CTA_CON","CRE_CEN_COS","CRE_NIT_TER","CONCEPTO_CON","ID_CONCESIONARIO_PRO","IDMUNICIPIO","REFERENCIATRF","ENVIADOBANCO"
    from recaudo_externo_disp_tot;

prompt
prompt Creating view VW_DISTRFSIMITEXTERNO
prompt ===================================
prompt
create or replace view vw_distrfsimitexterno as
select
      fec_corte_ini,
      fec_corte_fin,
      fec_dispersion,
      r.id_concesionario_liq,
      orden,
      concepto,
      ori_idbanco,
      ori_tipocuenta,
      ori_cuenta,
      ori_nit,
      des_idbanco,
      des_tipocuenta,
      desencriptar(des_cuenta) as des_cuenta,
      des_nit,
      indtipo,
      usuario_proceso,
      fecha_proceso,
      valor,
      c.nombre as Concesionario,
      bdes.nombre as BancoDes,
      bori.nombre as BancoOri,
      r.idmunicipio
from vw_RECAUDO_externo_DISP_TOT r, concesionario c, banco bdes, banco bori
where r.id_concesionario_liq = c.idconcesionario
and r.ori_idbanco = bori.idbanco
and r.des_idbanco = bdes.idbanco;

prompt
prompt Creating view VW_RECAUDO_EXTERNO_DISP
prompt =====================================
prompt
create or replace view vw_recaudo_externo_disp as
select "FEC_CORTE_INI","FEC_CORTE_FIN","FEC_DISPERSION","ID_CONCESIONARIO_LIQ","ORDEN","CONCEPTO","ORI_IDBANCO","ORI_TIPOCUENTA","ORI_CUENTA","ORI_NIT","DES_IDBANCO","DES_TIPOCUENTA","DES_CUENTA","DES_NIT","INDTIPO","USUARIO_PROCESO","FECHA_PROCESO","VALOR","DEB_CTA_CON","DEB_CEN_COS","DEB_NIT_TER","CRE_CTA_CON","CRE_CEN_COS","CRE_NIT_TER","CONCEPTO_CON","ID_CONCESIONARIO_PRO","IDMUNICIPIO"
    from recaudo_externo_disp;

prompt
prompt Creating view VW_DISTRFSIMITEXTERNOFEC
prompt ======================================
prompt
create or replace view vw_distrfsimitexternofec as
select
      fec_corte_ini,
      fec_corte_fin,
      fec_dispersion,
      r.id_concesionario_liq,
      orden,
      concepto,
      ori_idbanco,
      ori_tipocuenta,
      ori_cuenta,
      ori_nit,
      des_idbanco,
      des_tipocuenta,
      desencriptar(des_cuenta) as des_cuenta ,
      des_nit,
      indtipo,
      usuario_proceso,
      fecha_proceso,
      valor,
      c.nombre as Concesionario,
      bdes.nombre as BancoDes,
      bori.nombre as BancoOri,
      r.idmunicipio
from vw_recaudo_externo_disp r, concesionario c, banco bdes, banco bori
where r.id_concesionario_liq = c.idconcesionario
and r.ori_idbanco = bori.idbanco
and r.des_idbanco = bdes.idbanco;

prompt
prompt Creating view VW_LIQSIMITEXTERNO
prompt ================================
prompt
create or replace view vw_liqsimitexterno as
select
       a.cta_recaudo "CuentaRecaudo",
       b.fec_tran "FechaRecaudo",
       a.fec_corte "FechaProceso",
       a.fec_dispersion "FechaDispersion",
       a.fec_dispersion_con "FecDispCon",
       b.oficina_origen "Oficina",
       a.num_liquidacion "NumeroLiquidacion",
       b.num_comparendo "Comparendo",
       b.fec_comparendo "FechaComp",
       b.identificacion "Identificacion",
       a.idmunicipio "Divipo",
       m.nombre "Municipio",
       d.nombre "Departamento",
       a.indtipo "TipoRecaudo",
       a.id_concesionario_liq "IdConcesionarioLiquidador",
       a.id_concesionario_pro "IdConcesionarioZon",
       a.validador_fecha "Validador",
       a.indfecha2002 "Fecha2002",
       a.valor_total "VRecaudo",
       a.valor_adicional "VAdicional",
       a.s_valor_1 "VBase",
       a.s_valor_2 "VSimitBase",
       a.s_valor_4 "VCLiquidador",
       a.s_valor_3 "VSimit",
       a.s_valor_6 "VFCSimt",
       a.s_valor_5 "VFCConcesionario",
       a.s_valor_7 "VEquilibrio",
       0 "EE18",
       0 "EE2",
       0 "VSevial3",
       0 "VSevial27",
       0 "VIva27",
       0 "VFCM18",
       0 "VIva18",
       0 "VPolca",
       0 "VTimbre27",
       0 "VTimbre27_18",
       0 "VRetencion27",
       a.s_valor_11 "VOperadorCon",
       a.s_valor_12 "VFCMCon",
       a.s_valor_19 "VTercero1",
       a.s_valor_21 "VTercero2",
       a.s_valor_23 "VTercero3",
       a.s_valor_26 "VMunicipio",
       a.s_valor_10 "VAcuerdo",
       a.s_valor_14 "VIVACon",
       a.s_valor_15 "VTimbreCon",
       a.s_valor_16 "VRetencionContConc",
       a.s_valor_30 "VTimbreContConc",
       a.idbanco "BancoRec"
from recaudo_externo_liquidacion a, recaudo_externo b, municipio m, departamento d
where a.id_recaudo_externo = b.id_recaudo_externo
and m.idmunicipio = a.idmunicipio
and m.iddepartamento = d.iddepartamento
and a.indtipo = 'SIMIT'
union
select
       a.cta_recaudo "CuentaRecaudo",
       b.fec_tran "FechaRecaudo",
       a.fec_corte "FechaProceso",
       a.fec_dispersion "FechaDispersion",
       a.fec_dispersion_con "FecDispCon",
       b.oficina_origen "Oficina",
       a.num_liquidacion "NumeroLiquidacion",
       b.num_comparendo "Comparendo",
       b.fec_comparendo "FechaComp",
       b.identificacion "Identificacion",
       a.idmunicipio "Divipo",
       m.nombre "Municipio",
       d.nombre "Departamento",
       a.indtipo "TipoRecaudo",
       a.id_concesionario_liq "IdConcesionarioLiquidador",
       a.id_concesionario_pro "IdConcesionarioZon",
       a.validador_fecha "Validador",
       a.indfecha2002 "Fecha2002",
       a.valor_total "VRecaudo",
       a.valor_adicional "VAdicional",
       a.p_valor_1 "VBase",
       a.p_valor_2 "VSimitBase",
       a.p_valor_4 "VCLiquidador",
       a.p_valor_3 + a.p_valor_8 "VSimit",
       a.p_valor_6 "VFCSimt",
       a.p_valor_5 "VFCConcesionario",
       decode(a.id_concesionario_liq,5, 0, a.p_valor_7 ) "VEquilibrio",
       decode(a.id_concesionario_liq,5, a.p_valor_7,  0 ) "EE18",
       a.p_valor_10 "EE2",
       a.p_valor_9 "VSevial3",
       a.p_valor_14 "VSevial27",
       a.p_valor_18 "VIva27",
       a.p_valor_13 "VFCM18",
       a.p_valor_16 "VIva18",
       a.p_valor_12 - a.p_valor_18 - a.p_valor_16 "VPolca",
       a.p_valor_20 "VTimbre27",
       a.p_valor_17 "VTimbre27_18",
       a.p_valor_19 "VRetencion27",
       a.p_valor_24 "VOperadorCon",
       a.p_valor_25 "VFCMCon",
       a.p_valor_32 "VTercero1",
       a.p_valor_34 "VTercero2",
       a.p_valor_36 "VTercero3",
       a.p_valor_39 "VMunicipio",
       a.p_valor_23 "VAcuerdo",
       a.p_valor_27 "VIVACon",
       a.p_valor_28 "VTimbreCon",
       a.p_valor_29 "VRetencionContConc",
       a.p_valor_44 "VTimbreContConc",
       a.idbanco "BancoRec"
from recaudo_externo_liquidacion a, recaudo_externo b, municipio m, departamento d
where a.id_recaudo_externo = b.id_recaudo_externo
and m.idmunicipio = a.idmunicipio
and m.iddepartamento = d.iddepartamento
and a.indtipo = 'POLCA';

prompt
prompt Creating view VW_LIQSIMITEXTERNO_VOBO
prompt =====================================
prompt
create or replace view vw_liqsimitexterno_vobo as
select "CuentaRecaudo","FechaRecaudo","FechaProceso","FechaDispersion","FecDispCon","Oficina","NumeroLiquidacion","Comparendo","FechaComp","Identificacion","Divipo","Municipio","Departamento","TipoRecaudo","IdConcesionarioLiquidador","IdConcesionarioZon","Validador","Fecha2002","VRecaudo","VAdicional","VBase","VSimitBase","VCLiquidador","VSimit","VFCSimt","VFCConcesionario","VEquilibrio","EE18","EE2","VSevial3","VSevial27","VIva27","VFCM18","VIva18","VPolca","VTimbre27","VTimbre27_18","VRetencion27","VOperadorCon","VFCMCon","VTercero1","VTercero2","VTercero3","VMunicipio","VAcuerdo","VIVACon","VTimbreCon","VRetencionContConc","VTimbreContConc","BancoRec" from vw_liqsimitexterno;

prompt
prompt Creating view VW_MUNICIPIO_NOV
prompt ==============================
prompt
CREATE OR REPLACE VIEW VW_MUNICIPIO_NOV AS
SELECT SIMIT.MUNICIPIO.IDMUNICIPIO,
(  SIMIT.MUNICIPIO.NOMBRE || ' - ' ||  simit.departamento.nombre || ' - ' || SIMIT.MUNICIPIO.IDMUNICIPIO  ) NOMBRE
FROM SIMIT.MUNICIPIO, simit.departamento
where simit.municipio.iddepartamento = simit.departamento.iddepartamento
union
select n.idmunicipio,
(n.nombre || ' - ' ||  d.nombre || ' - ' || n.idmunicipio ) nombre
from novmunicipio n , departamento d
where n.iddepartamento = d.iddepartamento
and n.tiponov = '01'
and n.fechaaplicacion is null
order by nombre;

prompt
prompt Creating view VW_RECAUDO_EXTERNO_LIQUIDACION
prompt ============================================
prompt
create or replace view vw_recaudo_externo_liquidacion as
select "ID_RECAUDO_EXTERNO_LIQUIDACION","ID_RECAUDO_EXTERNO","ID_CONCESIONARIO_PRO","ID_CONCESIONARIO_LIQ","INDTIPO","USUARIO_PROCESO","FECHA_PROCESO","IDMUNICIPIO","FEC_CORTE","IND_PROCESO","NUM_LIQUIDACION","DIAS_DISPERSION","FREC_DISPERSION","FEC_DISPERSION","IDBANCO","SMDLV","INDRETROACTIVIDAD","VALOR_TOTAL","VALOR_ADICIONAL","VALIDADOR_FECHA","INDFECHA2002","S_VALOR_0","S_VALOR_1","S_VALOR_2","S_VALOR_3","S_VALOR_4","S_VALOR_5","S_VALOR_6","S_VALOR_7","S_VALOR_8","S_VALOR_9","S_VALOR_10","S_VALOR_11","S_VALOR_12","S_VALOR_13","S_VALOR_14","S_VALOR_15","S_VALOR_16","S_VALOR_17","S_VALOR_18","S_VALOR_19","S_VALOR_20","S_VALOR_21","S_VALOR_22","S_VALOR_23","S_VALOR_24","S_VALOR_25","S_VALOR_26","S_VALOR_27","S_VALOR_28","CTA_RECAUDO","IND_BASE_TER1","IND_BASE_TER2","IND_BASE_TER3","IND_BASE_TER4","POR_BASE_TER1","POR_BASE_TER2","POR_BASE_TER3","POR_BASE_TER4","S_VALOR_29","NOM_TER1","NOM_TER2","NOM_TER3","NOM_TER4","P_VALOR_1","P_VALOR_2","P_VALOR_3","P_VALOR_4","P_VALOR_5","P_VALOR_6","P_VALOR_7","P_VALOR_8","P_VALOR_9","P_VALOR_10","P_VALOR_11","P_VALOR_12","P_VALOR_13","P_VALOR_14","P_VALOR_15","P_VALOR_16","P_VALOR_17","P_VALOR_18","P_VALOR_19","P_VALOR_20","P_VALOR_21","P_VALOR_22","P_VALOR_23","P_VALOR_24","P_VALOR_25","P_VALOR_26","P_VALOR_27","P_VALOR_28","P_VALOR_29","P_VALOR_30","P_VALOR_31","P_VALOR_32","P_VALOR_33","P_VALOR_34","P_VALOR_35","P_VALOR_36","P_VALOR_37","P_VALOR_38","P_VALOR_39","P_VALOR_40","P_VALOR_41","P_VALOR_42","P_VALOR_43","S_VALOR_30","P_VALOR_44","FEC_DISPERSION_CON","NIT_MUNICIPIO","NIT_TERCERO1","NIT_TERCERO2","NIT_TERCERO3","NIT_TERCERO4","NIT_CONCESIONARIO","NIT_FONDO","NIT_CONCESIONARIOZON"
    from recaudo_externo_liquidacion;

prompt
prompt Creating view VW_REC_LOC_HIST_DEUDA
prompt ===================================
prompt
create or replace view vw_rec_loc_hist_deuda as
select a.ID_SECRETARIA_DEUDA,
       a.polca_s,
       b.divipo,
       b.polca_f,
       a.TOTAL_RECAUDO,
       a.pago_simit,
       b.pago_finan
  from (select ID_SECRETARIA_DEUDA, polca polca_s, sum(TOTAL_RECAUDO) TOTAL_RECAUDO, SUM(xfcm) pago_simit
          from rec_loc_hist
         where POLCA = 'N'
           AND rec_loc_hist.fecha_contable < trunc(Last_day(Add_months(sysdate,-3))+1)
         GROUP BY ID_SECRETARIA_DEUDA, polca
        --ORDER BY id_secretaria_origen, polca
        UNION
        select ID_SECRETARIA_DEUDA, polca polca_s, sum(TOTAL_RECAUDO) TOTAL_RECAUDO, SUM(x55) pago_simit
          from rec_loc_hist
         where POLCA = 'S'
           AND rec_loc_hist.fecha_contable < trunc(Last_day(Add_months(sysdate,-3))+1)
         GROUP BY ID_SECRETARIA_DEUDA, polca
        --ORDER BY id_secretaria_origen, polca
        ) a
  FULL OUTER JOIN (select p.divipo,
                          p.polca polca_f,
                          SUM(p.valor_recaudo) pago_finan
                     from rec_loc_hist_pago p
                    GROUP BY p.divipo, p.polca
                   --ORDER BY p.divipo, p.polca
                   ) b on b.divipo = a.ID_SECRETARIA_DEUDA
                      and b.polca_f = a.polca_s
--where a.id_secretaria_origen = '73449000'
 order by 1, 2, 3, 4;

prompt
prompt Creating view VW_RECLOC_POLCA
prompt =============================
prompt
create or replace view vw_recloc_polca as
select
       recaudo_local_liquidacion.indorigen "Origen",
       recaudo_local_liquidacion.indTipo "Tipo",
       banco.nombre "Banco",
       concesionario.nombre "Operador",
       recaudo_local_liquidacion.idMunicipio "DIVIPO",
       municipio.nombre "Municipio",
       departamento.nombre "Departamento",
       recaudo_local_liquidacion.cta_recaudo "Cuenta Recaudo",
       recaudo_local_liquidacion.fec_corte "Fecha Corte",
       recaudo_local_liquidacion.fec_tran "Fecha Transaccion",
       recaudo_local_liquidacion.oficina_origen "Oficina",
       recaudo_local_liquidacion.valor_total "Vr Recaudo",
       recaudo_local_liquidacion.fec_dispersion "Fecha Dispersion",
       recaudo_local_liquidacion.s_valor_0 "Comision Recaudo",
       recaudo_local_liquidacion.p_valor_7 "Simit PM",
       recaudo_local_liquidacion.p_valor_8 "Concesionario",
       recaudo_local_liquidacion.p_valor_9 "Fondo Concesionario",
       recaudo_local_liquidacion.p_valor_10 "Fondo Simit",
       recaudo_local_liquidacion.p_valor_11 "Equilibrio economico PM",
       recaudo_local_liquidacion.p_valor_12 "Simt PP",
       recaudo_local_liquidacion.p_valor_13 "Sevial PP",
       recaudo_local_liquidacion.p_valor_14 "Equilibrio economico PP",
       recaudo_local_liquidacion.p_valor_15 "Polca",
       recaudo_local_liquidacion.p_valor_16 "Fcm CP",
       recaudo_local_liquidacion.p_valor_17 "Sevial CP",
       recaudo_local_liquidacion.p_valor_18 "Equilibrio economico CP",
       ( recaudo_local_liquidacion.p_valor_13 + recaudo_local_liquidacion.p_valor_17 ) "Sevial",
       recaudo_local_liquidacion.p_valor_19 "IvaFCM",
       recaudo_local_liquidacion.p_valor_20 "IvaSevial",
       recaudo_local_liquidacion.p_valor_21 "Retencion Sevial",
       recaudo_local_liquidacion.p_valor_22 "Timbre sevial",
       recaudo_local_liquidacion.p_valor_23 "Timbre fcm",
       recaudo_local_liquidacion.p_valor_24 "Neto Sevial",
       recaudo_local_liquidacion.p_valor_25 "Neto Concesionario",
       recaudo_local_liquidacion.p_valor_26 "Neto FCM",
       recaudo_local_liquidacion.p_valor_27 "Neto Simit",
       recaudo_local_liquidacion.p_valor_28 "Neto Equilibrio economico",
      recaudo_local_liquidacion.ind_proceso
   from recaudo_local_liquidacion,
       banco,
       municipio,
       departamento,
       concesionario
 where banco.idbanco = recaudo_local_liquidacion.idbanco
       and municipio.idmunicipio = recaudo_local_liquidacion.idmunicipio
       and departamento.iddepartamento = recaudo_local_liquidacion.iddepartamento
       and concesionario.idconcesionario = recaudo_local_liquidacion.idconcesionario
       and recaudo_local_liquidacion.indtipo = 'POLCA'
       and recaudo_local_liquidacion.idbanco = '02'
--       and TO_CHAR(recaudo_local_liquidacion.fec_corte,'YYYY/MM/DD') >= $P{P_FEC_INI}
--       and TO_CHAR(recaudo_local_liquidacion.fec_corte,'YYYY/MM/DD') <= $P{P_FEC_FIN}
 order by  recaudo_local_liquidacion.ind_proceso, recaudo_local_liquidacion.idbanco, recaudo_local_liquidacion.idconcesionario, recaudo_local_liquidacion.fec_corte,  recaudo_local_liquidacion.idmunicipio;

prompt
prompt Creating view VW_RECLOC_POLCA_TOT
prompt =================================
prompt
create or replace view vw_recloc_polca_tot as
select
t.IDBANCO,
max(b.nombre) Banco,
t.IDCONCESIONARIO,
max(c.nombre) Concesionario,
SUM(t.VALOR_TOTAL) VALOR_RECAUDO,
SUM(t.P_VALOR_15) POLCA,
SUM(t.P_VALOR_17) SEVIAL_2_7,
SUM(t.P_VALOR_16) FCM_1_8,
SUM(t.P_VALOR_27) FCM_3_25,
SUM(t.P_VALOR_13) SEVIAL_3_0,
SUM(t.P_VALOR_25) OPERADOR_3_25,
SUM(t.P_VALOR_9 + t.P_VALOR_10 ) FONDO_0_5,
SUM(t.P_VALOR_20) IVA_2_7,
SUM(t.P_VALOR_19) IVA_1_8
from recaudo_local_liquidacion t, banco b, concesionario c
where t.indtipo = 'POLCA'
and t.ind_proceso = 1
and t.idbanco = b.idbanco
and t.idconcesionario = c.idconcesionario
--and to_char(t.fec_corte, 'yyyy/mm/dd') >= $P{P_FEC_INI}
--and to_char(t.fec_corte, 'yyyy/mm/dd') <= $P{P_FEC_FIN}
GROUP BY t.IDBANCO, t.IDCONCESIONARIO
ORDER BY t.IDBANCO, t.IDCONCESIONARIO;

prompt
prompt Creating view VW_RECLOC_SIMIT_TOT
prompt =================================
prompt
create or replace view vw_recloc_simit_tot as
select
       r.idbanco,
       max(b.nombre) banco,
       r.idconcesionario,
       max(c.nombre) concesionario,
       sum(r.valor_total) recuado,
       sum(r.s_valor_0) comision,
       sum(r.s_valor_1) simit25,
       sum(r.s_valor_2) concesionario65,
       sum(r.s_valor_3) fondo_con5,
       sum(r.s_valor_4) fondo_simit5,
       sum(r.s_valor_5) equilibrio,
       sum(r.s_valor_6) neto_concesionario
  from recaudo_local_liquidacion r,
       banco b,
       concesionario c
 where b.idbanco = r.idbanco
       and c.idconcesionario = r.idconcesionario
       and r.indtipo = 'SIMIT'
       and r.ind_proceso = 1
--       and to_char(r.fec_corte, 'yyyy/mm/dd') >= $P{P_FEC_INI}
--       and to_char(r.fec_corte, 'yyyy/mm/dd') <= $P{P_FEC_FIN}
 group by r.idbanco, r.idconcesionario
 order by r.idbanco, r.idconcesionario;

prompt
prompt Creating view VW_RPT_MUNICIPIOS
prompt ===============================
prompt
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

prompt
prompt Creating view VW_RPT1_DETALLE
prompt =============================
prompt
CREATE OR REPLACE VIEW VW_RPT1_DETALLE AS
SELECT
     RECAUDO_EXTERNO_LIQUIDACION."FEC_CORTE" AS FEC_CORTE,
     'EXTERNO' AS TIPOREC,
     RECAUDO_EXTERNO_LIQUIDACION."INDTIPO" AS IND_TIPO,
     RECAUDO_EXTERNO_LIQUIDACION."IDMUNICIPIO" AS IDMUNICIPIO,
     MUNICIPIO."NOMBRE" AS MUNICIPIO_NOMBRE,
     RECAUDO_EXTERNO_LIQUIDACION."ID_CONCESIONARIO_LIQ" AS IDCONCESIONARIO,
     CONCESIONARIO."NOMBRE" AS CONCESIONARIO_NOMBRE,
     RECAUDO_EXTERNO_LIQUIDACION."VALOR_TOTAL" AS VALOR_TOTAL,
     (CASE WHEN RECAUDO_EXTERNO_LIQUIDACION."INDTIPO" = 'SIMIT' THEN RECAUDO_EXTERNO_LIQUIDACION.VALOR_TOTAL
           WHEN RECAUDO_EXTERNO_LIQUIDACION."INDTIPO" = 'POLCA' THEN RECAUDO_EXTERNO_LIQUIDACION.VALOR_TOTAL
           ELSE 0
      END ) AS  VALOR_OT

FROM
     "SIMIT"."MUNICIPIO" MUNICIPIO INNER JOIN "SIMIT"."RECAUDO_EXTERNO_LIQUIDACION" RECAUDO_EXTERNO_LIQUIDACION ON MUNICIPIO."IDMUNICIPIO" = RECAUDO_EXTERNO_LIQUIDACION."IDMUNICIPIO"
     INNER JOIN "SIMIT"."CONCESIONARIO" CONCESIONARIO ON RECAUDO_EXTERNO_LIQUIDACION."ID_CONCESIONARIO_LIQ" = CONCESIONARIO."IDCONCESIONARIO"
     where ind_proceso = 1
UNION
SELECT
     RECAUDO_LOCAL_LIQUIDACION."FEC_CORTE" AS FEC_CORTE,
     'LOCAL' AS TIPOREC,
     RECAUDO_LOCAL_LIQUIDACION."INDTIPO" AS IND_TIPO,
     RECAUDO_LOCAL_LIQUIDACION."IDMUNICIPIO" AS IDMUNICIPIO,
     MUNICIPIO."NOMBRE" AS MUNICIPIO_NOMBRE,
     RECAUDO_LOCAL_LIQUIDACION."IDCONCESIONARIO" AS IDCONCESIONARIO,
     CONCESIONARIO."NOMBRE" AS CONCESIONARIO_NOMBRE,
     RECAUDO_LOCAL_LIQUIDACION."VALOR_TOTAL" AS VALOR_TOTAL,
     0 as VALOR_OT
FROM
     "SIMIT"."MUNICIPIO" MUNICIPIO INNER JOIN "SIMIT"."RECAUDO_LOCAL_LIQUIDACION" RECAUDO_LOCAL_LIQUIDACION ON MUNICIPIO."IDMUNICIPIO" = RECAUDO_LOCAL_LIQUIDACION."IDMUNICIPIO"
     INNER JOIN "SIMIT"."CONCESIONARIO" CONCESIONARIO ON RECAUDO_LOCAL_LIQUIDACION."IDCONCESIONARIO" = CONCESIONARIO."IDCONCESIONARIO"
     where ind_proceso = 1;

prompt
prompt Creating view VW_SIMIT_VALIDADOR_COMPARENDO
prompt ===========================================
prompt
CREATE OR REPLACE VIEW VW_SIMIT_VALIDADOR_COMPARENDO AS
SELECT idmunicipio AS divipo, idvalidador AS id_codigo,
          fecha_ini AS fecha_desde, fecha_fin AS fecha_hasta,
          DECODE (indtipo, 'SIMIT', 'N', 'POLCA', 'S') AS polca,
          0 AS participmunicipio, 0 AS participom1, 0 AS participom2,
          0 AS particippcc, 0 AS particippcf
     FROM validador_fecha;

prompt
prompt Creating view VW_T_CASOBQUILLA
prompt ==============================
prompt
create or replace view vw_t_casobquilla as
select 'Metrotransito - PONAL' Secretaria, count(*) cantidad, sum(b.total_recaudo) total_recaudo, sum(b.XFCM) XFCM, sum(b.X55) X55, sum(b.XMUN) XMUN from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') <= '081224' and b.POLCA = 'N' union
select 'Secretaria Barranquilla - PONAL', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') > '081224' and b.POLCA = 'N'  union
select 'Sin identificar - PONAL', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where b.fecha_com is null and b.POLCA = 'N' UNION
select 'Metrotransito - POLCA' Secretaria, count(*) cantidad, sum(b.total_recaudo) total_recaudo, sum(b.XFCM) XFCM, sum(b.X55) X55, sum(b.XMUN) XMUN from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') <= '081224' and b.POLCA = 'S' union
select 'Secretaria Barranquilla - POLCA', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') > '081224' and b.POLCA = 'S'  union
select 'Sin identificar - POLCA', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where b.fecha_com is null and b.POLCA = 'S';

prompt
prompt Creating view VW_V_DISPERCIONMUNI
prompt =================================
prompt
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

prompt
prompt Creating view VW_V_OT_P_DISTRIBUCION
prompt ====================================
prompt
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

prompt
prompt Creating view VW_V_TERCEROMUNI
prompt ==============================
prompt
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


spool off
