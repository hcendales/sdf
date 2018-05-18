----------------------------------------------
-- Export file for user SIMITCURSO          --
-- Created by SEVEN on 10/05/2018, 17:07:01 --
----------------------------------------------

set define off
spool simitcurso.log

prompt
prompt Creating table ACUERDOPAGO
prompt ==========================
prompt
create table ACUERDOPAGO
(
  idacuerdo           NUMBER not null,
  idmunicipio         CHAR(8),
  periodoinicial      DATE,
  periodofinal        DATE,
  fecharadicacion     DATE,
  usuarioradicacion   NUMBER,
  estado              CHAR(1),
  primerpago          DATE,
  pagoxexterno        CHAR(1),
  jurisdiccion        CHAR(7),
  diapago             NUMBER,
  valortotal          NUMBER,
  cuota               NUMBER,
  meses               NUMBER,
  informacioncontrato VARCHAR2(1000),
  observaciones       VARCHAR2(1000),
  nombresupervisor    VARCHAR2(250),
  saldopendiente      NUMBER,
  totalpagado         NUMBER,
  porccumplimiento    NUMBER,
  fechacierre         DATE,
  usuariocierre       NUMBER
)
;
comment on column ACUERDOPAGO.estado
  is 'A: Activo C:Cerrado';
comment on column ACUERDOPAGO.pagoxexterno
  is 'S:Si N: No';
comment on column ACUERDOPAGO.jurisdiccion
  is 'SIMIT10, POLCA10, POLCA45, POLCA55';
alter table ACUERDOPAGO
  add constraint PK_ACUERDO primary key (IDACUERDO);

prompt
prompt Creating table CARGEMASIVO
prompt ==========================
prompt
create table CARGEMASIVO
(
  numcomparendo VARCHAR2(20),
  estado        CHAR(1),
  codresultado  NUMBER,
  mensaje       VARCHAR2(250)
)
;

prompt
prompt Creating table CERT_DEUDA
prompt =========================
prompt
create table CERT_DEUDA
(
  idmunicipio  CHAR(8),
  fechainicial DATE,
  fechafinal   DATE,
  indtipo      CHAR(5),
  valor        NUMBER,
  usuario      NUMBER,
  fechaingreso DATE
)
;

prompt
prompt Creating table CIA
prompt ==================
prompt
create table CIA
(
  nit                 VARCHAR2(10) not null,
  codigociarunt       VARCHAR2(16),
  nombre              VARCHAR2(100),
  direccion           VARCHAR2(100),
  telefono1           NUMBER,
  extension1          NUMBER,
  telefono2           NUMBER,
  extension2          NUMBER,
  nombrecontacto      VARCHAR2(100),
  celularcontacto     NUMBER,
  correoelectronico   VARCHAR2(100),
  porcentajeinfractor NUMBER,
  porcentajefondoadm  NUMBER,
  usuarionovedad      NUMBER,
  fechanovedad        DATE,
  fecini              DATE,
  fecfin              DATE
)
;
comment on column CIA.nit
  is 'Nit del CIA';
comment on column CIA.codigociarunt
  is 'Codigo del CIA asignado por el RUNT';
comment on column CIA.nombre
  is 'Nombre del CIA';
comment on column CIA.direccion
  is 'Direccion del CIA';
comment on column CIA.telefono1
  is 'Telefono 1 del CIA';
comment on column CIA.extension1
  is 'Extension 1 del CIA';
comment on column CIA.telefono2
  is 'Telefono 2 del CIA';
comment on column CIA.extension2
  is 'Extencion 2 del CIA';
comment on column CIA.nombrecontacto
  is 'Nombre contacto';
comment on column CIA.celularcontacto
  is 'Celular del contacto';
comment on column CIA.correoelectronico
  is 'Correo electronico del contacto';
comment on column CIA.porcentajeinfractor
  is 'Porcentaje a cobrar a infractor (x defecto 25%)';
comment on column CIA.porcentajefondoadm
  is 'Porcentaje fondo administracion (x defecto 8%)';
comment on column CIA.usuarionovedad
  is 'Usuario que realiza ultima novedad';
comment on column CIA.fechanovedad
  is 'Fecha ultima novedad';
alter table CIA
  add constraint PK_CIA primary key (NIT);

prompt
prompt Creating table COM_ESTADO
prompt =========================
prompt
create table COM_ESTADO
(
  idestado CHAR(1) not null,
  nombre   VARCHAR2(50)
)
;
alter table COM_ESTADO
  add constraint PK_ESTADO primary key (IDESTADO);

prompt
prompt Creating table COM_TIPOINSTITUCION
prompt ==================================
prompt
create table COM_TIPOINSTITUCION
(
  tipoinstitucion CHAR(1) not null,
  nombre          VARCHAR2(250)
)
;
alter table COM_TIPOINSTITUCION
  add constraint PK_TIPINS primary key (TIPOINSTITUCION);

prompt
prompt Creating table COM_INSTITUCION
prompt ==============================
prompt
create table COM_INSTITUCION
(
  idinsticucion   NUMBER not null,
  nombre          VARCHAR2(250),
  rango1          VARCHAR2(8),
  rango2          VARCHAR2(6),
  tipoinstitucion CHAR(1)
)
;
alter table COM_INSTITUCION
  add constraint PK_COM_INSTITUCION primary key (IDINSTICUCION);
alter table COM_INSTITUCION
  add constraint FK_TIPINS foreign key (TIPOINSTITUCION)
  references COM_TIPOINSTITUCION (TIPOINSTITUCION);

prompt
prompt Creating table COM_SECCIONAL
prompt ============================
prompt
create table COM_SECCIONAL
(
  idseccional   NUMBER not null,
  idinstitucion NUMBER,
  nombre        VARCHAR2(250),
  estado        CHAR(1),
  rango1        VARCHAR2(8),
  rango2        VARCHAR2(6)
)
;
alter table COM_SECCIONAL
  add constraint PK_COM_SECCIONAL primary key (IDSECCIONAL);
alter table COM_SECCIONAL
  add constraint FK_COM_INST_SECC foreign key (IDINSTITUCION)
  references COM_INSTITUCION (IDINSTICUCION);

prompt
prompt Creating table COM_TIPOAGENTE
prompt =============================
prompt
create table COM_TIPOAGENTE
(
  idtipo CHAR(1) not null,
  nombre VARCHAR2(50)
)
;
alter table COM_TIPOAGENTE
  add constraint PK_TIPOAGENTE primary key (IDTIPO);

prompt
prompt Creating table COM_TIPOIDENTIFICACION
prompt =====================================
prompt
create table COM_TIPOIDENTIFICACION
(
  tipo   CHAR(1) not null,
  nombre VARCHAR2(50)
)
;
alter table COM_TIPOIDENTIFICACION
  add constraint PK_COM_TIPOIDE primary key (TIPO);

prompt
prompt Creating table COM_AGENTE
prompt =========================
prompt
create table COM_AGENTE
(
  idinstitucion        NUMBER not null,
  tipoidentificacion   CHAR(1) not null,
  numeroidentificacion NUMBER not null,
  nombre               VARCHAR2(250),
  placa                VARCHAR2(10),
  estado               CHAR(1),
  idseccional          NUMBER not null,
  tipoagente           CHAR(1)
)
;
alter table COM_AGENTE
  add constraint PK_COM_AGENTE primary key (IDINSTITUCION, TIPOIDENTIFICACION, NUMEROIDENTIFICACION, IDSECCIONAL);
alter table COM_AGENTE
  add constraint FK_AGEN_ESTADO foreign key (ESTADO)
  references COM_ESTADO (IDESTADO);
alter table COM_AGENTE
  add constraint FK_AGEN_INS foreign key (IDINSTITUCION)
  references COM_INSTITUCION (IDINSTICUCION);
alter table COM_AGENTE
  add constraint FK_AGEN_SEC foreign key (IDSECCIONAL)
  references COM_SECCIONAL (IDSECCIONAL);
alter table COM_AGENTE
  add constraint FK_AGEN_TIPO foreign key (TIPOAGENTE)
  references COM_TIPOAGENTE (IDTIPO);
alter table COM_AGENTE
  add constraint FK_AGEN_TIPOIDE foreign key (TIPOIDENTIFICACION)
  references COM_TIPOIDENTIFICACION (TIPO);

prompt
prompt Creating table COM_COMPARENDO
prompt =============================
prompt
create table COM_COMPARENDO
(
  idmunicipio          CHAR(8) not null,
  nrocomparendo        VARCHAR2(20) not null,
  origen               CHAR(3),
  estado               CHAR(1),
  nombreagente         VARCHAR2(250),
  placaagente          VARCHAR2(10),
  tipoidenticacion     CHAR(1),
  numeroidentificacion NUMBER,
  fecharpt             DATE
)
;
alter table COM_COMPARENDO
  add constraint PK_COMPAR primary key (IDMUNICIPIO, NROCOMPARENDO);

prompt
prompt Creating table COM_CONC_USUARIO
prompt ===============================
prompt
create table COM_CONC_USUARIO
(
  idperson        NUMBER,
  idconcesionario CHAR(2)
)
;

prompt
prompt Creating table COM_ESTADOINVENTARIO
prompt ===================================
prompt
create table COM_ESTADOINVENTARIO
(
  idestado CHAR(1) not null,
  nombre   VARCHAR2(250),
  nivel    NUMBER
)
;
alter table COM_ESTADOINVENTARIO
  add constraint PK_ESTADOINV primary key (IDESTADO);

prompt
prompt Creating table COM_ESTADOORDEN
prompt ==============================
prompt
create table COM_ESTADOORDEN
(
  idestado CHAR(1) not null,
  nombre   VARCHAR2(50)
)
;
alter table COM_ESTADOORDEN
  add constraint PK_COM_ESTORD primary key (IDESTADO);

prompt
prompt Creating table COM_ESTADORANGOAGENTE
prompt ====================================
prompt
create table COM_ESTADORANGOAGENTE
(
  idestado CHAR(1) not null,
  nombre   VARCHAR2(50)
)
;
alter table COM_ESTADORANGOAGENTE
  add constraint PK_ESTRAN primary key (IDESTADO);

prompt
prompt Creating table COM_TIPOCOMPARENDO
prompt =================================
prompt
create table COM_TIPOCOMPARENDO
(
  tipocomparendo CHAR(1) not null,
  nombre         VARCHAR2(50)
)
;
alter table COM_TIPOCOMPARENDO
  add constraint PK_TIPOCOMP primary key (TIPOCOMPARENDO);

prompt
prompt Creating table COM_INVENTARIO
prompt =============================
prompt
create table COM_INVENTARIO
(
  idinstitucion        NUMBER,
  idseccional          NUMBER,
  idorganismo          CHAR(8) not null,
  nrocomparendo        NUMBER not null,
  estado               CHAR(1),
  fechaestado          DATE,
  idinventario         NUMBER,
  tipocomparendo       CHAR(1),
  rango1               VARCHAR2(8),
  rango2               VARCHAR2(6),
  tipoidentificacion   CHAR(1),
  numeroidentificacion NUMBER
)
;
alter table COM_INVENTARIO
  add constraint PK_COM_INVENTARIO primary key (IDORGANISMO, NROCOMPARENDO);
alter table COM_INVENTARIO
  add constraint FK_INV_EST foreign key (ESTADO)
  references COM_ESTADOINVENTARIO (IDESTADO);
alter table COM_INVENTARIO
  add constraint FK_INV_INS foreign key (IDINSTITUCION)
  references COM_INSTITUCION (IDINSTICUCION);
alter table COM_INVENTARIO
  add constraint FK_INV_SEC foreign key (IDSECCIONAL)
  references COM_SECCIONAL (IDSECCIONAL);
alter table COM_INVENTARIO
  add constraint FK_INV_TIPCOM foreign key (TIPOCOMPARENDO)
  references COM_TIPOCOMPARENDO (TIPOCOMPARENDO);

prompt
prompt Creating table COM_PROVEEDOR
prompt ============================
prompt
create table COM_PROVEEDOR
(
  idinstitucion  NUMBER not null,
  nit            VARCHAR2(10) not null,
  nombre         VARCHAR2(250),
  direccion      VARCHAR2(250),
  ciudad         CHAR(8),
  nombrecontacto VARCHAR2(250),
  telefono       VARCHAR2(7),
  extension      VARCHAR2(5),
  correo         VARCHAR2(250),
  celular        VARCHAR2(10),
  estado         CHAR(1)
)
;
alter table COM_PROVEEDOR
  add constraint PK_COM_PROVEEDOR primary key (IDINSTITUCION, NIT);
alter table COM_PROVEEDOR
  add constraint FK_PROV_EST foreign key (ESTADO)
  references COM_ESTADO (IDESTADO);
alter table COM_PROVEEDOR
  add constraint FK_PROV_INS foreign key (IDINSTITUCION)
  references COM_INSTITUCION (IDINSTICUCION);

prompt
prompt Creating table COM_ORDENIMPRESION
prompt =================================
prompt
create table COM_ORDENIMPRESION
(
  idinstitucion  NUMBER not null,
  idseccional    NUMBER not null,
  idorganismo    CHAR(8) not null,
  nitproveedor   VARCHAR2(10) not null,
  comparenderas  NUMBER,
  comparendos    NUMBER,
  rangoinicial   NUMBER not null,
  estado         CHAR(1),
  fechasolicitud DATE,
  idorden        NUMBER,
  fechaentrega   DATE,
  fechaanulacion DATE
)
;
alter table COM_ORDENIMPRESION
  add constraint PK_ORDENIMPR primary key (IDINSTITUCION, IDSECCIONAL, IDORGANISMO, NITPROVEEDOR, RANGOINICIAL);
alter table COM_ORDENIMPRESION
  add constraint FK_ORDEN_EST foreign key (ESTADO)
  references COM_ESTADOORDEN (IDESTADO);
alter table COM_ORDENIMPRESION
  add constraint FK_ORDEN_INS foreign key (IDINSTITUCION)
  references COM_INSTITUCION (IDINSTICUCION);
alter table COM_ORDENIMPRESION
  add constraint FK_ORDEN_PROV foreign key (IDINSTITUCION, NITPROVEEDOR)
  references COM_PROVEEDOR (IDINSTITUCION, NIT);
alter table COM_ORDENIMPRESION
  add constraint FK_ORDEN_SEC foreign key (IDSECCIONAL)
  references COM_SECCIONAL (IDSECCIONAL);

prompt
prompt Creating table COM_ORGANISMOSECCIONAL
prompt =====================================
prompt
create table COM_ORGANISMOSECCIONAL
(
  idseccional NUMBER not null,
  idmunicipio CHAR(8) not null,
  estado      CHAR(1),
  rango1      VARCHAR2(8),
  rango2      VARCHAR2(6)
)
;
alter table COM_ORGANISMOSECCIONAL
  add constraint PK_COM_ORGANISMOSECCIONAL primary key (IDSECCIONAL, IDMUNICIPIO);
alter table COM_ORGANISMOSECCIONAL
  add constraint FK_ORGSECC_SEC foreign key (IDSECCIONAL)
  references COM_SECCIONAL (IDSECCIONAL);

prompt
prompt Creating table COM_OT_USUARIO
prompt =============================
prompt
create table COM_OT_USUARIO
(
  idperson    NUMBER,
  idmunicipio CHAR(8)
)
;

prompt
prompt Creating table COMPARENDODESCUENTO
prompt ==================================
prompt
create table COMPARENDODESCUENTO
(
  numerocomparendo      VARCHAR2(20),
  fechacomparendo       DATE,
  tipocomparendo        CHAR(5),
  codigoinfraccion      CHAR(4),
  descripcioninfraccion VARCHAR2(100),
  valorinfraccion       NUMBER,
  valoradicional        NUMBER,
  valorotros            NUMBER,
  valortotal            NUMBER,
  porcentajedescuento   NUMBER,
  valordescuento        NUMBER,
  valorcia              NUMBER,
  organismotransito     CHAR(8),
  nombreorganismo       VARCHAR2(100),
  referenciadescuento   CHAR(13),
  iddescuento           NUMBER,
  fechadescuento        DATE,
  numeroresolucion      VARCHAR2(20),
  numeroautorizacion    VARCHAR2(16),
  nombreinfractor       VARCHAR2(100),
  diashabiles           NUMBER
)
;
create index INX_COMPARENDODESCUENTO on COMPARENDODESCUENTO (NUMEROAUTORIZACION);

prompt
prompt Creating table COM_RANGOAGENTE
prompt ==============================
prompt
create table COM_RANGOAGENTE
(
  idinstitucion        NUMBER not null,
  idseccional          NUMBER not null,
  tipoidentificacion   CHAR(1) not null,
  numeroidentificacion NUMBER not null,
  idorganismo          CHAR(8) not null,
  rangoinicial         NUMBER,
  rangofinal           NUMBER,
  estado               CHAR(1) not null,
  fechaasignacion      DATE not null,
  idrangoagente        NUMBER,
  tipocomparendo       CHAR(1) not null
)
;
alter table COM_RANGOAGENTE
  add constraint PK_RANGOAGENTE primary key (IDINSTITUCION, IDSECCIONAL, IDORGANISMO, FECHAASIGNACION);
alter table COM_RANGOAGENTE
  add constraint FK_RANAGE_AGE foreign key (IDINSTITUCION, TIPOIDENTIFICACION, NUMEROIDENTIFICACION, IDSECCIONAL)
  references COM_AGENTE (IDINSTITUCION, TIPOIDENTIFICACION, NUMEROIDENTIFICACION, IDSECCIONAL);
alter table COM_RANGOAGENTE
  add constraint FK_RANAGE_EST foreign key (ESTADO)
  references COM_ESTADORANGOAGENTE (IDESTADO);
alter table COM_RANGOAGENTE
  add constraint FK_RANAGE_INS foreign key (IDINSTITUCION)
  references COM_INSTITUCION (IDINSTICUCION);
alter table COM_RANGOAGENTE
  add constraint FK_RANAGE_SEC foreign key (IDSECCIONAL)
  references COM_SECCIONAL (IDSECCIONAL);
alter table COM_RANGOAGENTE
  add constraint FK_RANAGE_TIPCOM foreign key (TIPOCOMPARENDO)
  references COM_TIPOCOMPARENDO (TIPOCOMPARENDO);

prompt
prompt Creating table COM_RANGOINSTITUCION
prompt ===================================
prompt
create table COM_RANGOINSTITUCION
(
  idinstitucion   NUMBER not null,
  tipocomparendo  CHAR(1),
  rangoinicial    NUMBER,
  rangofinal      NUMBER,
  fechaasignacion DATE not null
)
;
alter table COM_RANGOINSTITUCION
  add constraint PK_COM_RANGOINSTITUCION primary key (IDINSTITUCION, FECHAASIGNACION);
alter table COM_RANGOINSTITUCION
  add constraint FK_RANGOINS_INS foreign key (IDINSTITUCION)
  references COM_INSTITUCION (IDINSTICUCION);
alter table COM_RANGOINSTITUCION
  add constraint FK_RANGOINS_TIPCOM foreign key (TIPOCOMPARENDO)
  references COM_TIPOCOMPARENDO (TIPOCOMPARENDO);

prompt
prompt Creating table COM_RANGOORGANISMO
prompt =================================
prompt
create table COM_RANGOORGANISMO
(
  idseccional     NUMBER not null,
  idmunicipio     CHAR(8),
  rangoinicial    NUMBER,
  rangofinal      NUMBER,
  fechaasignacion DATE not null,
  tipocomparendo  CHAR(1)
)
;
alter table COM_RANGOORGANISMO
  add constraint PK_RANGOORGANISMO primary key (IDSECCIONAL, FECHAASIGNACION);
alter table COM_RANGOORGANISMO
  add constraint FK_RANORG_SEC foreign key (IDSECCIONAL)
  references COM_SECCIONAL (IDSECCIONAL);
alter table COM_RANGOORGANISMO
  add constraint FK_RANORG_TIPCOM foreign key (TIPOCOMPARENDO)
  references COM_TIPOCOMPARENDO (TIPOCOMPARENDO);

prompt
prompt Creating table COM_RPTCONSUMOAGENTE
prompt ===================================
prompt
create table COM_RPTCONSUMOAGENTE
(
  idreporte            NUMBER,
  idinstitucion        NUMBER,
  idseccional          NUMBER,
  idorganismo          CHAR(8),
  tipoidentificacion   CHAR(1),
  numeroidentificacion NUMBER,
  asignados            NUMBER,
  utilizados           NUMBER,
  disponibles          NUMBER,
  putilizado           NUMBER,
  pdisponible          NUMBER,
  fechageneracion      DATE
)
;

prompt
prompt Creating table CONCESIONARIO_ZONA
prompt =================================
prompt
create table CONCESIONARIO_ZONA
(
  idzona CHAR(3),
  nombre VARCHAR2(500)
)
;

prompt
prompt Creating table CONCILIACIONCIA
prompt ==============================
prompt
create table CONCILIACIONCIA
(
  periodo                 VARCHAR2(7),
  tipopartida             CHAR(3),
  estadopartida           CHAR(4),
  motivoajuste            VARCHAR2(500),
  tipoidentificacion      CHAR(1),
  idetificacioninfractor  VARCHAR2(16),
  numerocomparendo        VARCHAR2(20),
  organismotransito       CHAR(8),
  referenciadescuento     NUMBER,
  codigocia               VARCHAR2(16),
  idregistrocon           NUMBER,
  fechapagofcm            DATE,
  fechapagocia            DATE,
  valorpagadoinfractorfcm NUMBER,
  valorpagadoinfractorcia NUMBER,
  valorfondofcm           NUMBER,
  valorfondocia           NUMBER,
  fechageneracioncon      DATE,
  usuariocon              NUMBER,
  fechaajuste             DATE,
  usuarioajuste           NUMBER,
  idpago                  NUMBER,
  idregcon                NUMBER not null
)
;
comment on column CONCILIACIONCIA.periodo
  is 'periodo de conciliacion';
comment on column CONCILIACIONCIA.tipopartida
  is 'tipo de partida FCM:esta en fcm y no en CIA, CIA:esta en CIA y no en FCM, VLR: diferencia valor';
comment on column CONCILIACIONCIA.estadopartida
  is 'estado de partida PEND:pendiente AJUS: Ajustada';
comment on column CONCILIACIONCIA.motivoajuste
  is 'motivo del ajuste';
comment on column CONCILIACIONCIA.tipoidentificacion
  is 'tipo identificacion infractor';
comment on column CONCILIACIONCIA.idetificacioninfractor
  is 'identificacion infractor';
comment on column CONCILIACIONCIA.numerocomparendo
  is 'numero de comparendo';
comment on column CONCILIACIONCIA.organismotransito
  is 'organismo de transito';
comment on column CONCILIACIONCIA.referenciadescuento
  is 'referencia de descuento';
comment on column CONCILIACIONCIA.codigocia
  is 'codigo del cia';
comment on column CONCILIACIONCIA.idregistrocon
  is 'id registro en cusroCiaCon';
comment on column CONCILIACIONCIA.fechapagofcm
  is 'fecha de pago en fcm';
comment on column CONCILIACIONCIA.fechapagocia
  is 'fecha de pago en cia';
comment on column CONCILIACIONCIA.valorpagadoinfractorfcm
  is 'valor pagado por infractor reportado en fcm';
comment on column CONCILIACIONCIA.valorpagadoinfractorcia
  is 'valor pagado por infractor reportado en cia';
comment on column CONCILIACIONCIA.valorfondofcm
  is 'valor calculado en FCM correspondiente al fondo de administracion';
comment on column CONCILIACIONCIA.valorfondocia
  is 'valor calculado en CIA correspondiente al fondo de administracion';
comment on column CONCILIACIONCIA.fechageneracioncon
  is 'fecha en que se geenro la conciliacion';
comment on column CONCILIACIONCIA.usuariocon
  is 'usuario que realizo conciliacion';
comment on column CONCILIACIONCIA.fechaajuste
  is 'fecha en la que se realizo ajuste';
comment on column CONCILIACIONCIA.usuarioajuste
  is 'usuario que realizo el ajuste';
comment on column CONCILIACIONCIA.idpago
  is 'numero de registro en la tabla pagoCurso';
comment on column CONCILIACIONCIA.idregcon
  is 'id de registro de conciliacion';
alter table CONCILIACIONCIA
  add constraint PK_CONCILIACIONCIA primary key (IDREGCON);

prompt
prompt Creating table C_TABORDA
prompt ========================
prompt
create table C_TABORDA
(
  cedula     VARCHAR2(20),
  tipo_doc   VARCHAR2(2),
  comparendo VARCHAR2(30) not null,
  fecha      DATE
)
;

prompt
prompt Creating table CURSOCIA
prompt =======================
prompt
create table CURSOCIA
(
  fechaarchivo             DATE,
  fechageneracion          DATE,
  horageneracion           NUMBER,
  numeroregistro           NUMBER,
  tiporegistro             NUMBER,
  tipooperacion            NUMBER,
  codigocia                VARCHAR2(16),
  ciudadcia                CHAR(8),
  codigosedecia            VARCHAR2(10),
  funcionariopago          NUMBER,
  funcionarioregistracurso NUMBER,
  tipoidentificacion       CHAR(1),
  identificacioninfractor  VARCHAR2(16),
  numerocomparendo         VARCHAR2(20),
  numeroresolucion         VARCHAR2(20),
  organismotransito        CHAR(8),
  referenciadescuento      NUMBER,
  valorcia                 NUMBER,
  valorfcm                 NUMBER,
  codigocurso              VARCHAR2(8),
  fechapago                DATE,
  fechaprogcurso           DATE,
  horaprogcurso            NUMBER,
  fecharealizacioncurso    DATE,
  horainiciocurso          NUMBER,
  horafincurso             NUMBER,
  numerocertificado        VARCHAR2(16),
  identificacioninstructor NUMBER,
  id_curso                 NUMBER,
  fechacargue              DATE default sysdate
)
;
create index CURSOCIA_NUMEROCOMPARENDO on CURSOCIA (NUMEROCOMPARENDO);
create index CURSOCIA_NUMERORESOLUCION on CURSOCIA (NUMERORESOLUCION);
create index IN_CURSOCIA_CODIGOCIA on CURSOCIA (CODIGOCIA);
create index IND_CC_NUMCERTIF on CURSOCIA (NUMEROCERTIFICADO);
create index IND_V_CURSO1 on CURSOCIA (TIPOIDENTIFICACION, IDENTIFICACIONINFRACTOR);

prompt
prompt Creating table CURSOCIA_CIATRAN
prompt ===============================
prompt
create table CURSOCIA_CIATRAN
(
  fechaarchivo             DATE,
  fechageneracion          DATE,
  horageneracion           NUMBER,
  numeroregistro           NUMBER,
  tiporegistro             NUMBER,
  tipooperacion            NUMBER,
  codigocia                VARCHAR2(16),
  ciudadcia                CHAR(8),
  codigosedecia            VARCHAR2(10),
  funcionariopago          NUMBER,
  funcionarioregistracurso NUMBER,
  tipoidentificacion       CHAR(1),
  identificacioninfractor  VARCHAR2(16),
  numerocomparendo         VARCHAR2(20),
  numeroresolucion         VARCHAR2(20),
  organismotransito        CHAR(8),
  referenciadescuento      NUMBER,
  valorcia                 NUMBER,
  valorfcm                 NUMBER,
  codigocurso              VARCHAR2(8),
  fechapago                DATE,
  fechaprogcurso           DATE,
  horaprogcurso            NUMBER,
  fecharealizacioncurso    DATE,
  horainiciocurso          NUMBER,
  horafincurso             NUMBER,
  numerocertificado        VARCHAR2(16),
  identificacioninstructor NUMBER
)
;

prompt
prompt Creating table CURSOCIACON
prompt ==========================
prompt
create table CURSOCIACON
(
  periodo                  VARCHAR2(7),
  fechaarchivo             DATE,
  fechageneracion          DATE,
  horageneracion           NUMBER,
  numeroregistro           NUMBER,
  tiporegistro             NUMBER,
  tipooperacion            NUMBER,
  codigocia                VARCHAR2(16),
  ciudadcia                CHAR(8),
  codigosedecia            VARCHAR2(8),
  funcionariopago          NUMBER,
  funcionarioregistracurso NUMBER,
  tipoidentificacion       CHAR(1),
  identificacioninfractor  VARCHAR2(16),
  numerocomparendo         VARCHAR2(20),
  numeroresolucion         VARCHAR2(20),
  organismotransito        CHAR(8),
  referenciadescuento      NUMBER,
  valorcia                 NUMBER,
  valorfcm                 NUMBER,
  codigocurso              VARCHAR2(8),
  fechapago                DATE,
  fechaprogcurso           DATE,
  horaprogcurso            NUMBER,
  fecharealizacioncurso    DATE,
  horainiciocurso          NUMBER,
  horafincurso             NUMBER,
  numerocertificado        VARCHAR2(16),
  identificacioninstructor NUMBER,
  idregistrocon            NUMBER,
  idreg                    NUMBER
)
;

prompt
prompt Creating table CURSOCIA_ORIGINAL
prompt ================================
prompt
create table CURSOCIA_ORIGINAL
(
  fechaarchivo             DATE,
  fechageneracion          DATE,
  horageneracion           NUMBER,
  numeroregistro           NUMBER,
  tiporegistro             NUMBER,
  tipooperacion            NUMBER,
  codigocia                VARCHAR2(16),
  ciudadcia                CHAR(8),
  codigosedecia            VARCHAR2(10),
  funcionariopago          NUMBER,
  funcionarioregistracurso NUMBER,
  tipoidentificacion       CHAR(1),
  identificacioninfractor  VARCHAR2(16),
  numerocomparendo         VARCHAR2(20),
  numeroresolucion         VARCHAR2(20),
  organismotransito        CHAR(8),
  referenciadescuento      NUMBER,
  valorcia                 NUMBER,
  valorfcm                 NUMBER,
  codigocurso              VARCHAR2(8),
  fechapago                DATE,
  fechaprogcurso           DATE,
  horaprogcurso            NUMBER,
  fecharealizacioncurso    DATE,
  horainiciocurso          NUMBER,
  horafincurso             NUMBER,
  numerocertificado        VARCHAR2(16),
  identificacioninstructor NUMBER
)
;

prompt
prompt Creating table CURSOCIARPT
prompt ==========================
prompt
create table CURSOCIARPT
(
  fechatransaccion         DATE,
  horatransaccion          NUMBER,
  numerosecuencia          NUMBER,
  direccionadquiriente     VARCHAR2(20),
  codigotransaccion        NUMBER,
  codigocia                VARCHAR2(16),
  ciudadcia                VARCHAR2(8),
  codigosedecia            VARCHAR2(16),
  codigocurso              VARCHAR2(8),
  funcionarioregistra      NUMBER,
  tipoidentificacion       CHAR(1),
  identificacioninfractor  VARCHAR2(16),
  fecharealizacioncurso    DATE,
  horainiciocurso          NUMBER,
  horafincurso             NUMBER,
  identificacioninstructor NUMBER,
  numerocomparendo         VARCHAR2(20),
  numeroresolucion         VARCHAR2(20),
  fechacomparendon         DATE,
  numerocertificado        VARCHAR2(16),
  tipocomparendo           VARCHAR2(5),
  organismotransito        VARCHAR2(8),
  referenciadescuento      VARCHAR2(13),
  idcurso                  NUMBER not null
)
;
alter table CURSOCIARPT
  add constraint PK_CURSOCIARPT primary key (IDCURSO);

prompt
prompt Creating table CURSOCIA_TEMP
prompt ============================
prompt
create table CURSOCIA_TEMP
(
  fechaarchivo             DATE,
  fechageneracion          DATE,
  horageneracion           NUMBER,
  numeroregistro           NUMBER,
  tiporegistro             NUMBER,
  tipooperacion            NUMBER,
  codigocia                VARCHAR2(16),
  ciudadcia                CHAR(8),
  codigosedecia            VARCHAR2(8),
  funcionariopago          NUMBER,
  funcionarioregistracurso NUMBER,
  tipoidentificacion       CHAR(1),
  identificacioninfractor  VARCHAR2(16),
  numerocomparendo         VARCHAR2(20),
  numeroresolucion         VARCHAR2(20),
  organismotransito        CHAR(8),
  referenciadescuento      NUMBER,
  valorcia                 NUMBER,
  valorfcm                 NUMBER,
  codigocurso              VARCHAR2(8),
  fechapago                DATE,
  fechaprogcurso           DATE,
  horaprogcurso            NUMBER,
  fecharealizacioncurso    DATE,
  horainiciocurso          NUMBER,
  horafincurso             NUMBER,
  numerocertificado        VARCHAR2(16),
  identificacioninstructor NUMBER
)
;

prompt
prompt Creating table CURSOCIA_WS
prompt ==========================
prompt
create table CURSOCIA_WS
(
  fechaarchivo             DATE,
  fechageneracion          DATE,
  horageneracion           NUMBER,
  numeroregistro           NUMBER,
  tiporegistro             NUMBER,
  tipooperacion            NUMBER,
  codigocia                VARCHAR2(16),
  ciudadcia                CHAR(8),
  codigosedecia            VARCHAR2(16),
  funcionariopago          NUMBER,
  funcionarioregistracurso NUMBER,
  tipoidentificacion       CHAR(1),
  identificacioninfractor  VARCHAR2(16),
  numerocomparendo         VARCHAR2(20),
  numeroresolucion         VARCHAR2(20),
  organismotransito        CHAR(8),
  referenciadescuento      NUMBER,
  valorcia                 NUMBER,
  valorfcm                 NUMBER,
  codigocurso              VARCHAR2(8),
  fechapago                DATE,
  fechaprogcurso           DATE,
  horaprogcurso            NUMBER,
  fecharealizacioncurso    DATE,
  horainiciocurso          NUMBER,
  horafincurso             NUMBER,
  numerocertificado        VARCHAR2(16),
  identificacioninstructor NUMBER,
  fechacargue              DATE
)
;

prompt
prompt Creating table DAT_MEDE
prompt =======================
prompt
create table DAT_MEDE
(
  comparenoagregarletra VARCHAR2(20),
  placa                 VARCHAR2(7),
  ceula                 VARCHAR2(15)
)
;

prompt
prompt Creating table DEPARTAMENTAL
prompt ============================
prompt
create table DEPARTAMENTAL
(
  divipodepartamental CHAR(8),
  divipo              CHAR(8),
  fechainicio         DATE,
  fechafin            DATE,
  tipofecha           CHAR(1),
  jurisdiccion        CHAR(5),
  id                  INTEGER
)
;
comment on column DEPARTAMENTAL.divipodepartamental
  is 'Divipo del departamental';
comment on column DEPARTAMENTAL.divipo
  is 'Divipo de autoridad territorial ';
comment on column DEPARTAMENTAL.fechainicio
  is 'Fecha de inicio de ingreso a departamental';
comment on column DEPARTAMENTAL.fechafin
  is 'Fecha de finalizacion de departamental';
comment on column DEPARTAMENTAL.tipofecha
  is 'Fecha de aplicacion C:Contable F:Comparendo';
comment on column DEPARTAMENTAL.jurisdiccion
  is 'Jurisdiccion en la que aplica SIMIT o POLCA o TODAS';
comment on column DEPARTAMENTAL.id
  is 'id del registro';

prompt
prompt Creating table DESCUENTO
prompt ========================
prompt
create table DESCUENTO
(
  valor5         NUMBER,
  valor20        NUMBER,
  valor21        NUMBER,
  valor16mar     NUMBER,
  usuarionovedad NUMBER,
  fechanovedad   DATE,
  fecha16mar     DATE,
  fechafin16mar  DATE,
  fechavendesc   DATE,
  pinfractor     NUMBER,
  dia5           NUMBER,
  dia20          NUMBER
)
;
comment on column DESCUENTO.valor5
  is 'Porcentaje descuento entre 0 y 5 dias';
comment on column DESCUENTO.valor20
  is 'Porcentaje descuento entre 6 y 20 dias';
comment on column DESCUENTO.valor21
  is 'Porcentaje descuento mayor a 21';
comment on column DESCUENTO.valor16mar
  is 'Porcentaje descuento comparendo con fecha <=16/Marzo/2010 y pago <=  16/Marzo/2011';
comment on column DESCUENTO.usuarionovedad
  is 'Usuario ultima novedad';
comment on column DESCUENTO.fechanovedad
  is 'Fecha de ultima novedad';
comment on column DESCUENTO.fecha16mar
  is 'Fecha de no promocion';
comment on column DESCUENTO.fechafin16mar
  is 'Fecha vigencia promocion';
comment on column DESCUENTO.fechavendesc
  is 'fecha de vencimiento de descuento';
comment on column DESCUENTO.pinfractor
  is 'porcentaje infractor';
comment on column DESCUENTO.dia5
  is 'dias habiles primer rango';
comment on column DESCUENTO.dia20
  is 'dias habiles segundo rango';

prompt
prompt Creating table DIRECTORIO
prompt =========================
prompt
create table DIRECTORIO
(
  divipo            CHAR(8) not null,
  nomsecretaria     VARCHAR2(250),
  secretario        VARCHAR2(250),
  celular           VARCHAR2(10),
  fechacumpleanos   VARCHAR2(20),
  asistente         VARCHAR2(250),
  telasistente      VARCHAR2(10),
  direccion         VARCHAR2(250),
  indicativo        VARCHAR2(3),
  telefono1         VARCHAR2(50),
  telefono2         VARCHAR2(50),
  telefono3         VARCHAR2(50),
  telefono4         VARCHAR2(50),
  correo            VARCHAR2(500),
  nit               VARCHAR2(20),
  categoria         VARCHAR2(10),
  softwarecontr     VARCHAR2(250),
  tieneconvenio     CHAR(1),
  fechaconvenio     DATE,
  tiposecretaria    CHAR(1),
  zonaconcesionario CHAR(3),
  naturaleza        VARCHAR2(100),
  manual            VARCHAR2(50),
  sistematizado     VARCHAR2(50),
  nombresistema     VARCHAR2(250),
  proveedor         VARCHAR2(250),
  fechaactainicio   DATE,
  supervisor        VARCHAR2(250),
  coordinador       VARCHAR2(250),
  manual1           VARCHAR2(50),
  sistematizado1    VARCHAR2(50),
  nombresistema1    VARCHAR2(250),
  proveedor1        VARCHAR2(250),
  directa           VARCHAR2(50),
  contratista       VARCHAR2(50),
  objeto            VARCHAR2(250),
  fechainicio       DATE,
  plazo             VARCHAR2(50),
  externo           VARCHAR2(1),
  acuerdo           VARCHAR2(1),
  accion            VARCHAR2(250),
  tipo              VARCHAR2(250),
  apoderado         VARCHAR2(250)
)
;
alter table DIRECTORIO
  add constraint PK_DIR primary key (DIVIPO);

prompt
prompt Creating table DIRECTORIO_TEMP
prompt ==============================
prompt
create table DIRECTORIO_TEMP
(
  divipo          CHAR(8) not null,
  nomsecretaria   VARCHAR2(250),
  secretario      VARCHAR2(250),
  celular         VARCHAR2(10),
  fechacumpleanos VARCHAR2(20),
  asistente       VARCHAR2(250),
  telasistente    VARCHAR2(10),
  direccion       VARCHAR2(250),
  indicativo      VARCHAR2(1),
  telefono1       VARCHAR2(10),
  telefono2       VARCHAR2(10),
  telefono3       VARCHAR2(10),
  telefono4       VARCHAR2(10),
  correo          VARCHAR2(500),
  nit             VARCHAR2(20),
  categoria       VARCHAR2(10),
  softwarecontr   VARCHAR2(250),
  tieneconvenio   CHAR(1),
  fechaconvenio   DATE,
  tiposecretaria  CHAR(1),
  zona            CHAR(3)
)
;

prompt
prompt Creating table DIVIPOFECHACORTE
prompt ===============================
prompt
create table DIVIPOFECHACORTE
(
  divipo         CHAR(8),
  tipofechacorte CHAR(1)
)
;
comment on column DIVIPOFECHACORTE.divipo
  is 'Divipo';
comment on column DIVIPOFECHACORTE.tipofechacorte
  is 'D:Fecha corte igual a la fecha de deposito A:Fecha corte igual al mes anterior a la fecha de deposito';

prompt
prompt Creating table DOCUMENTO_PLANTILLA
prompt ==================================
prompt
create table DOCUMENTO_PLANTILLA
(
  iddocumento NUMBER,
  idrenglon   NUMBER,
  renglon     VARCHAR2(4000)
)
;

prompt
prompt Creating table EJEMPLO
prompt ======================
prompt
create table EJEMPLO
(
  horageneracion NUMBER,
  numeroregistro VARCHAR2(20),
  tiporegistro   NUMBER
)
;

prompt
prompt Creating table ERRORCARGUE
prompt ==========================
prompt
create table ERRORCARGUE
(
  registro VARCHAR2(1000),
  mensaje  VARCHAR2(1000),
  archivo  VARCHAR2(50)
)
;

prompt
prompt Creating table ERRORS
prompt =====================
prompt
create table ERRORS
(
  id_errors NUMBER not null,
  fecha     DATE,
  sqlcode   NUMBER,
  message   VARCHAR2(255)
)
;
comment on table ERRORS
  is 'Contiene los errores presentados en cualquier proceso';
comment on column ERRORS.id_errors
  is 'id error autoincremental';
comment on column ERRORS.fecha
  is 'fecha del error sql';
comment on column ERRORS.sqlcode
  is 'codigo sql del error';
comment on column ERRORS.message
  is 'mensaje del motor de base de datos';
alter table ERRORS
  add constraint PK_ID_ERRORS primary key (ID_ERRORS);

prompt
prompt Creating table EST_ALERTAPRESCRIPCION
prompt =====================================
prompt
create table EST_ALERTAPRESCRIPCION
(
  fechacorte           DATE,
  idmuncipio           CHAR(8),
  nommunicipio         VARCHAR2(200),
  indtipo              VARCHAR2(10),
  numerocomparendo     VARCHAR2(20),
  fechacomparendo      DATE,
  numeroresolucion     VARCHAR2(20),
  fecharesolucion      DATE,
  tipoidentificacion   NUMBER,
  numeroidentificacion VARCHAR2(20),
  nombreinfractor      VARCHAR2(200),
  apellidoinfractor    VARCHAR2(200),
  fechaprescripcion    DATE,
  codzona              VARCHAR2(20),
  nomzona              VARCHAR2(200),
  codoperador          VARCHAR2(20),
  nomoperador          VARCHAR2(200),
  coddepartamento      VARCHAR2(20),
  nomdepartamento      VARCHAR2(200),
  valorcartera         NUMBER
)
;
comment on column EST_ALERTAPRESCRIPCION.idmuncipio
  is 'id municipio';
comment on column EST_ALERTAPRESCRIPCION.indtipo
  is 'SIMIT o POLCA';
comment on column EST_ALERTAPRESCRIPCION.numerocomparendo
  is 'Comparendo';
comment on column EST_ALERTAPRESCRIPCION.fechacomparendo
  is 'fecha comparendo';
comment on column EST_ALERTAPRESCRIPCION.numeroresolucion
  is 'numero de resolucion';
comment on column EST_ALERTAPRESCRIPCION.fecharesolucion
  is 'fecha de resolucion';
comment on column EST_ALERTAPRESCRIPCION.tipoidentificacion
  is 'tipo de identificacion';
comment on column EST_ALERTAPRESCRIPCION.numeroidentificacion
  is 'numero de identificacion';
comment on column EST_ALERTAPRESCRIPCION.nombreinfractor
  is 'nombre Infractor';
comment on column EST_ALERTAPRESCRIPCION.fechaprescripcion
  is 'fecha de la prescripcion';
comment on column EST_ALERTAPRESCRIPCION.valorcartera
  is 'valor de cartera';

prompt
prompt Creating table EST_CADUCIDAD
prompt ============================
prompt
create table EST_CADUCIDAD
(
  fechacorte           DATE,
  idmunicipio          CHAR(8),
  nommunicipio         VARCHAR2(200),
  tipo                 CHAR(3),
  indtipo              VARCHAR2(10),
  comparendo           VARCHAR2(20),
  fechacomparendo      DATE,
  resolucion           VARCHAR2(20),
  fecharesolucion      DATE,
  tipoidentificacion   NUMBER,
  numeroidentificacion VARCHAR2(20),
  nombreinfractor      VARCHAR2(200),
  apellidoinfractor    VARCHAR2(200),
  valorcomparendo      NUMBER,
  valorcartera         NUMBER,
  fechacaducidad       DATE,
  codinfraccion        VARCHAR2(20),
  nominfraccion        VARCHAR2(200),
  codzona              VARCHAR2(20),
  nomzona              VARCHAR2(200),
  codoperador          VARCHAR2(20),
  nomoperador          VARCHAR2(200),
  coddepartamento      VARCHAR2(20),
  nomdepartamento      VARCHAR2(200),
  consecutivo_comp     NUMBER,
  fecha_ejecucion      DATE,
  id_resolucion        NUMBER,
  id_tipo_res          NUMBER,
  nom_tipo_res         VARCHAR2(200),
  consecutivo_cartera  NUMBER,
  estado_cartera       VARCHAR2(2)
)
;
comment on column EST_CADUCIDAD.fechacorte
  is 'Fecha de corte de la informacion';
comment on column EST_CADUCIDAD.idmunicipio
  is 'id municipio';
comment on column EST_CADUCIDAD.nommunicipio
  is 'Nombre municipio';
comment on column EST_CADUCIDAD.tipo
  is 'tipo de caducidad CAD:Comaprendo PRE:Preescripcion';
comment on column EST_CADUCIDAD.indtipo
  is 'SIMIT o POLCA';
comment on column EST_CADUCIDAD.comparendo
  is 'Numero de comparendo';
comment on column EST_CADUCIDAD.fechacomparendo
  is 'fecha comparendo';
comment on column EST_CADUCIDAD.resolucion
  is 'numero resolucion';
comment on column EST_CADUCIDAD.fecharesolucion
  is 'fecha de resolucion';
comment on column EST_CADUCIDAD.tipoidentificacion
  is 'tipo de identificacion';
comment on column EST_CADUCIDAD.numeroidentificacion
  is 'numero de identificacion';
comment on column EST_CADUCIDAD.nombreinfractor
  is 'nombre infractor';
comment on column EST_CADUCIDAD.apellidoinfractor
  is 'Apellido infractor';
comment on column EST_CADUCIDAD.valorcomparendo
  is 'Valor del comparendo';
comment on column EST_CADUCIDAD.valorcartera
  is 'valor de la cartera';
comment on column EST_CADUCIDAD.fechacaducidad
  is 'Fecha de caducidad';
comment on column EST_CADUCIDAD.codinfraccion
  is 'Codigo Infraccion';
comment on column EST_CADUCIDAD.nominfraccion
  is 'Nombre infraccion';
comment on column EST_CADUCIDAD.codzona
  is 'Codigo de zona';
comment on column EST_CADUCIDAD.nomzona
  is 'Nombre de Zona';
comment on column EST_CADUCIDAD.codoperador
  is 'codigo operador';
comment on column EST_CADUCIDAD.nomoperador
  is 'Nombre de operador';
comment on column EST_CADUCIDAD.coddepartamento
  is 'codigo departamento';
comment on column EST_CADUCIDAD.nomdepartamento
  is 'nombre departamento';
comment on column EST_CADUCIDAD.consecutivo_comp
  is 'Consecutivo comparendo';
comment on column EST_CADUCIDAD.fecha_ejecucion
  is 'fecha de ejecucion';
comment on column EST_CADUCIDAD.id_resolucion
  is 'id resolucion';
comment on column EST_CADUCIDAD.id_tipo_res
  is 'Tipo Resolucion';
comment on column EST_CADUCIDAD.nom_tipo_res
  is 'Nombre tipo resolucion';
comment on column EST_CADUCIDAD.consecutivo_cartera
  is 'Consecutivo cartera';
comment on column EST_CADUCIDAD.estado_cartera
  is 'Estado cartera';
create index INX_FECHACADU on EST_CADUCIDAD (FECHACADUCIDAD);
create index INX_IDMUNFEC on EST_CADUCIDAD (IDMUNICIPIO, FECHACADUCIDAD);
create index INX_IDMUNICIPIO on EST_CADUCIDAD (IDMUNICIPIO);

prompt
prompt Creating table EST_NOVEDADES
prompt ============================
prompt
create table EST_NOVEDADES
(
  fechacorte  DATE,
  idmunicipio CHAR(8),
  tiponovedad CHAR(3),
  fechacarga  DATE,
  cantidad    NUMBER
)
;
comment on column EST_NOVEDADES.idmunicipio
  is 'Id municipio';
comment on column EST_NOVEDADES.tiponovedad
  is 'COM:Comparendo, RES:Resolucion, REC: Recaudo';
comment on column EST_NOVEDADES.fechacarga
  is 'fecha novedad';
comment on column EST_NOVEDADES.cantidad
  is 'cantidad de novedades';

prompt
prompt Creating table EST_RESOLUCION
prompt =============================
prompt
create table EST_RESOLUCION
(
  idmunicipio             CHAR(8),
  indtipo                 VARCHAR2(10),
  numresolucion           VARCHAR2(20),
  fecharesolucion         DATE,
  tiporesolucion          CHAR(3),
  tipoidentificacion      NUMBER,
  numeroidentificacion    VARCHAR2(20),
  nombreinfractor         VARCHAR2(200),
  numerocomparendo        VARCHAR2(20),
  fechacomparendo         DATE,
  valorresolucionanterior NUMBER,
  valorcartera            NUMBER,
  fechacorte              DATE,
  nomsecretaria           VARCHAR2(200),
  apellidoinfractor       VARCHAR2(200),
  resolucionanterior      VARCHAR2(20),
  codzona                 VARCHAR2(20),
  nomzona                 VARCHAR2(200),
  codoperador             VARCHAR2(20),
  nomoperador             VARCHAR2(200),
  coddpto                 VARCHAR2(20),
  nomdpto                 VARCHAR2(200),
  vlrresant               NUMBER
)
;
comment on column EST_RESOLUCION.idmunicipio
  is 'Id municipio';
comment on column EST_RESOLUCION.indtipo
  is 'Autoridad DITRA o URBANO';
comment on column EST_RESOLUCION.numresolucion
  is 'Numero de resolucion';
comment on column EST_RESOLUCION.fecharesolucion
  is 'Fecha Resolucion';
comment on column EST_RESOLUCION.tiporesolucion
  is 'PRE:Preescripcion CAD:Caducidad ABS:Absolutorio REV:Revocatoria COA:Coactivo';
comment on column EST_RESOLUCION.tipoidentificacion
  is 'Tipo de identificacion';
comment on column EST_RESOLUCION.numeroidentificacion
  is 'Numero identificacion';
comment on column EST_RESOLUCION.nombreinfractor
  is 'Nombre infractor';
comment on column EST_RESOLUCION.numerocomparendo
  is 'Numero comparendo';
comment on column EST_RESOLUCION.fechacomparendo
  is 'fecha de comparendo';
comment on column EST_RESOLUCION.valorresolucionanterior
  is 'valor resolucion anterior';
comment on column EST_RESOLUCION.valorcartera
  is 'valor de cartera para coactivo';
comment on column EST_RESOLUCION.fechacorte
  is 'fecha de corte';
comment on column EST_RESOLUCION.nomsecretaria
  is 'Nombre secretaria';
comment on column EST_RESOLUCION.apellidoinfractor
  is 'Apellido infractor';
comment on column EST_RESOLUCION.resolucionanterior
  is 'Resolucion anterior';
comment on column EST_RESOLUCION.codzona
  is 'Codigo de zona';
comment on column EST_RESOLUCION.nomzona
  is 'Nombre de zona';
comment on column EST_RESOLUCION.codoperador
  is 'Codigo operador';
comment on column EST_RESOLUCION.nomoperador
  is 'Nombre operador';
comment on column EST_RESOLUCION.coddpto
  is 'Codigo operador';
comment on column EST_RESOLUCION.nomdpto
  is 'Nombre de Dpto';
comment on column EST_RESOLUCION.vlrresant
  is 'Valor Resolucion anterior';

prompt
prompt Creating table FCM
prompt ==================
prompt
create table FCM
(
  nit_fcm             VARCHAR2(10) not null,
  correo              VARCHAR2(500),
  seguridad_integrada NUMBER,
  url_seguridad       VARCHAR2(250),
  servidorsmtp        VARCHAR2(250),
  clasedocumento      CHAR(2),
  sociedad            CHAR(4),
  monedad             CHAR(3),
  cuentadebliq        CHAR(10),
  cuentacreliq        CHAR(10),
  cuentadebcon        CHAR(10),
  cuentacrecon        CHAR(10),
  cuentadebpag        CHAR(10),
  cuentacrepag        CHAR(10),
  cuentapuepag        CHAR(10),
  cuentagasto         CHAR(10),
  cuentaingreso       CHAR(10),
  cuentapasivo        CHAR(10),
  debug               NUMBER
)
;
comment on column FCM.nit_fcm
  is 'Nit FCM';
comment on column FCM.correo
  is 'Correo responsable FCM ';
comment on column FCM.seguridad_integrada
  is 'Seguridad integrada';
comment on column FCM.url_seguridad
  is 'url ws para validacion clave simit';
comment on column FCM.servidorsmtp
  is 'servidor correo';
comment on column FCM.clasedocumento
  is 'clase de documento: ZT';
comment on column FCM.sociedad
  is 'sociedad: PFC1';
comment on column FCM.monedad
  is 'Moneda; COB';
comment on column FCM.cuentadebliq
  is 'Cuenta debito liquidacion cia';
comment on column FCM.cuentacreliq
  is 'Cuenta credito liquidacion cia';
comment on column FCM.cuentadebcon
  is 'cuenta debito conciliacion cia';
comment on column FCM.cuentacrecon
  is 'cuenta credito conciliacion cia';
comment on column FCM.cuentadebpag
  is 'cuenta debito pago cia';
comment on column FCM.cuentacrepag
  is 'cuenta credito pago cia';
comment on column FCM.cuentapuepag
  is 'cuenta puente pago cia';
comment on column FCM.cuentagasto
  is 'cuenta gasto ajuste peso';
comment on column FCM.cuentaingreso
  is 'cuenta ingreso ajuste peso';
comment on column FCM.cuentapasivo
  is 'cuenta pasivo ajuste peso';
comment on column FCM.debug
  is '1:debug activo 0:no activar debug';

prompt
prompt Creating table FECHADAVID
prompt =========================
prompt
create table FECHADAVID
(
  fecha CHAR(4)
)
;

prompt
prompt Creating table GRUPO_CORREO
prompt ===========================
prompt
create table GRUPO_CORREO
(
  idgrupo     NUMBER,
  correo      VARCHAR2(250),
  descripcion VARCHAR2(250)
)
;
comment on column GRUPO_CORREO.idgrupo
  is 'numero del grupo';
comment on column GRUPO_CORREO.correo
  is 'correo electronico';
comment on column GRUPO_CORREO.descripcion
  is 'descripcion del grupo';

prompt
prompt Creating table IPVALIDA
prompt =======================
prompt
create table IPVALIDA
(
  codigocia   VARCHAR2(16) not null,
  ippermitida VARCHAR2(20) not null,
  activo      NUMBER
)
;
comment on column IPVALIDA.codigocia
  is 'codigo del cia';
comment on column IPVALIDA.ippermitida
  is 'direccion ip permitida';
comment on column IPVALIDA.activo
  is '1: permitida, 0:no permitida';
alter table IPVALIDA
  add constraint PK_IPVALIDA primary key (CODIGOCIA, IPPERMITIDA);
alter table IPVALIDA
  add constraint FK_IPVALIDA foreign key (CODIGOCIA)
  references CIA (NIT);

prompt
prompt Creating table LISTAVALOR
prompt =========================
prompt
create table LISTAVALOR
(
  id        VARCHAR2(10),
  nombre    VARCHAR2(50),
  categoria INTEGER
)
;
comment on column LISTAVALOR.id
  is 'identificador';
comment on column LISTAVALOR.nombre
  is 'descripcion de valor';
comment on column LISTAVALOR.categoria
  is 'categoria';

prompt
prompt Creating table LOG
prompt ==================
prompt
create table LOG
(
  fecha   DATE,
  usuario VARCHAR2(100),
  proceso VARCHAR2(100),
  accion  VARCHAR2(1000)
)
;
comment on column LOG.fecha
  is 'fecha de la novedad';
comment on column LOG.usuario
  is 'usuario que realizo la novedad';
comment on column LOG.proceso
  is 'novedad realizada';
comment on column LOG.accion
  is 'accion realizada en la novedad';

prompt
prompt Creating table MEDELLIN_2
prompt =========================
prompt
create table MEDELLIN_2
(
  odigo_dane              VARCHAR2(50),
  identificador_solicitud VARCHAR2(50),
  tipo_documento          VARCHAR2(50),
  comparendo_resolucion   VARCHAR2(50),
  fecha_comparendo        VARCHAR2(50),
  fecha_pago              VARCHAR2(20),
  año_pago                NVARCHAR2(20),
  simit                   NUMBER,
  polca                   NUMBER,
  valor_tarifa            NUMBER,
  tarifa                  VARCHAR2(50),
  autoridad               VARCHAR2(50)
)
;

prompt
prompt Creating table MENU
prompt ===================
prompt
create table MENU
(
  idmenu     NUMBER,
  namemenu   VARCHAR2(100),
  page       VARCHAR2(100),
  padreid    NUMBER,
  enablemenu NUMBER
)
;
comment on column MENU.idmenu
  is 'Id del menu';
comment on column MENU.namemenu
  is 'Nombre del menu';
comment on column MENU.page
  is 'pagina que se invoca en el menu';
comment on column MENU.padreid
  is 'id del padre jerarquico del menu';
comment on column MENU.enablemenu
  is 'menu activo';

prompt
prompt Creating table MENUXROL
prompt =======================
prompt
create table MENUXROL
(
  menuid NUMBER,
  rolid  NUMBER
)
;
comment on column MENUXROL.menuid
  is 'Id del menu';
comment on column MENUXROL.rolid
  is 'Id rol';

prompt
prompt Creating table MUNICIPIOSCONVENIO
prompt =================================
prompt
create table MUNICIPIOSCONVENIO
(
  idmunicipio    CHAR(8) not null,
  nitcia         VARCHAR2(10) not null,
  fechanovedad   DATE,
  usuarionovedad NUMBER
)
;
comment on column MUNICIPIOSCONVENIO.idmunicipio
  is 'Divipo de municipio';
comment on column MUNICIPIOSCONVENIO.nitcia
  is 'Nit del cia que tiene convenio con el municipio';
comment on column MUNICIPIOSCONVENIO.fechanovedad
  is 'Fecha de la ultima novedad';
comment on column MUNICIPIOSCONVENIO.usuarionovedad
  is 'Usuario que realizo la ultima novedad';
alter table MUNICIPIOSCONVENIO
  add constraint PK_MUNICIPIOSCONVENIO primary key (IDMUNICIPIO, NITCIA);
alter table MUNICIPIOSCONVENIO
  add constraint FK_MUNCIPIOSCONVENIO foreign key (NITCIA)
  references CIA (NIT);

prompt
prompt Creating table NITCIA
prompt =====================
prompt
create table NITCIA
(
  nit    VARCHAR2(16) not null,
  nombre VARCHAR2(80) not null
)
;

prompt
prompt Creating table PADRE
prompt ====================
prompt
create table PADRE
(
  idpadre     NUMBER,
  namepadre   VARCHAR2(100),
  enablepadre NUMBER
)
;
comment on column PADRE.idpadre
  is 'identificacion autoincremental';
comment on column PADRE.namepadre
  is 'Nombre del padre de los menus';
comment on column PADRE.enablepadre
  is 'Indicador de activo';

prompt
prompt Creating table PAGOCURSO
prompt ========================
prompt
create table PAGOCURSO
(
  fechatransaccion        DATE,
  horatransaccion         NUMBER,
  numerosecuencia         NUMBER,
  codigotransaccion       NUMBER,
  codigocia               VARCHAR2(16),
  ciudadcia               VARCHAR2(8),
  codigosedecia           VARCHAR2(16),
  codigocurso             VARCHAR2(8),
  funcionariopago         NUMBER,
  tipoidentificacion      CHAR(1),
  identificacioninfractor VARCHAR2(16),
  fechapago               DATE,
  fechaprogcurso          DATE,
  horaprogcurso           NUMBER,
  numerocomparendo        VARCHAR2(20),
  valorcia                NUMBER,
  organismotransito       VARCHAR2(8),
  referenciadescuento     VARCHAR2(13),
  idpago                  NUMBER not null,
  valorfcm                NUMBER,
  fechacomparendo         DATE
)
;
comment on column PAGOCURSO.fechatransaccion
  is 'fecha de la operacion';
comment on column PAGOCURSO.horatransaccion
  is 'hora de la trasaccion';
comment on column PAGOCURSO.numerosecuencia
  is 'numero de secuencia';
comment on column PAGOCURSO.codigotransaccion
  is 'codigo de transaccion';
comment on column PAGOCURSO.codigocia
  is 'codigo del cia';
comment on column PAGOCURSO.ciudadcia
  is 'ciudad del cia';
comment on column PAGOCURSO.codigosedecia
  is 'codigo sede cia';
comment on column PAGOCURSO.codigocurso
  is 'codigo del curso';
comment on column PAGOCURSO.funcionariopago
  is 'funcionario de pago';
comment on column PAGOCURSO.tipoidentificacion
  is 'tipo de identificacion';
comment on column PAGOCURSO.identificacioninfractor
  is 'identificacion infractor';
comment on column PAGOCURSO.fechapago
  is 'fecha pago';
comment on column PAGOCURSO.fechaprogcurso
  is 'fecha programacion de pago';
comment on column PAGOCURSO.horaprogcurso
  is 'hora de programacion curso';
comment on column PAGOCURSO.numerocomparendo
  is 'numero de comparendo';
comment on column PAGOCURSO.valorcia
  is 'valor pagado por el infractor';
comment on column PAGOCURSO.organismotransito
  is 'organismo transito';
comment on column PAGOCURSO.referenciadescuento
  is 'referencia descuento';
comment on column PAGOCURSO.idpago
  is 'consecutivo de pago';
comment on column PAGOCURSO.valorfcm
  is 'valor fondo administracion fcm';
comment on column PAGOCURSO.fechacomparendo
  is 'fecha';
alter table PAGOCURSO
  add constraint PK_PAGOCIA primary key (IDPAGO);

prompt
prompt Creating table PERSON
prompt =====================
prompt
create table PERSON
(
  idperson     NUMBER,
  nameperson   VARCHAR2(100),
  jobtitle     VARCHAR2(100),
  enableperson NUMBER,
  lastupdate   DATE,
  mail         VARCHAR2(100),
  password     VARCHAR2(16)
)
;
comment on column PERSON.idperson
  is 'id del funcionario';
comment on column PERSON.nameperson
  is 'nombre del funcionario';
comment on column PERSON.jobtitle
  is 'cargo del funcinario';
comment on column PERSON.enableperson
  is 'funcionario activo';
comment on column PERSON.lastupdate
  is 'ultima actualizacion';
comment on column PERSON.mail
  is 'correo electronico';
comment on column PERSON.password
  is 'clave';

prompt
prompt Creating table PLANTILLA_DOC
prompt ============================
prompt
create table PLANTILLA_DOC
(
  idplantilla NUMBER,
  nombre      VARCHAR2(250)
)
;

prompt
prompt Creating table PROCESO_ALERTAS
prompt ==============================
prompt
create table PROCESO_ALERTAS
(
  fechaini       DATE,
  fechafin       DATE,
  usuario        NUMBER,
  fechaejecucion DATE,
  id             NUMBER
)
;

prompt
prompt Creating table PROCESO_DEUDA
prompt ============================
prompt
create table PROCESO_DEUDA
(
  fechacorte DATE,
  usuario    NUMBER
)
;

prompt
prompt Creating table PUNTO_ATENCION
prompt =============================
prompt
create table PUNTO_ATENCION
(
  idmunicipio       CHAR(8),
  sector            VARCHAR2(100),
  direccion         VARCHAR2(500),
  horario           VARCHAR2(500),
  contactomovil1    VARCHAR2(20),
  contactomovil2    VARCHAR2(20),
  telefono1         VARCHAR2(20),
  telefono2         VARCHAR2(20),
  correoelectronico VARCHAR2(500),
  idreg             NUMBER,
  usuario           NUMBER,
  fecnov            DATE
)
;
comment on column PUNTO_ATENCION.idmunicipio
  is 'Divipo al que pertenece el punto de atencion';
comment on column PUNTO_ATENCION.sector
  is 'Sector donde se ubica el punto de atencion';
comment on column PUNTO_ATENCION.direccion
  is 'Direccion del punto de atencion';
comment on column PUNTO_ATENCION.horario
  is 'Horario de atencion';
comment on column PUNTO_ATENCION.contactomovil1
  is 'Telefono Contacto para marcacion desde dispositivo movil';
comment on column PUNTO_ATENCION.contactomovil2
  is 'Telefono Contacto para marcacion desde dispositivo movil';
comment on column PUNTO_ATENCION.telefono1
  is 'Telefono';
comment on column PUNTO_ATENCION.telefono2
  is 'Telefono';
comment on column PUNTO_ATENCION.correoelectronico
  is 'Correo electronico';
comment on column PUNTO_ATENCION.idreg
  is 'llave primaria';
comment on column PUNTO_ATENCION.usuario
  is 'usuario ultima novedad';
comment on column PUNTO_ATENCION.fecnov
  is 'fecha de la ultima novedad';
create index INX_PA_IDMUN on PUNTO_ATENCION (IDMUNICIPIO);
create unique index PK_PA on PUNTO_ATENCION (IDREG);

prompt
prompt Creating table RECAUDO_EXTERNO_CONTABILIDAD
prompt ===========================================
prompt
create table RECAUDO_EXTERNO_CONTABILIDAD
(
  fechadoc            CHAR(8),
  clasedoc            CHAR(2),
  sociedad            CHAR(4),
  fechacontable       CHAR(8),
  periodo             CHAR(2),
  moneda              CHAR(3),
  referencia          CHAR(16),
  textocabezera       CHAR(25),
  clavecontable       CHAR(2),
  cuenta              CHAR(17),
  importe             NUMBER,
  indicadorimpuesto   CHAR(2),
  centrocosto         CHAR(10),
  centrobeneficio     CHAR(10),
  fechavalor          CHAR(8),
  asignacion          CHAR(18),
  textocabezera2      CHAR(50),
  segmento            CHAR(10),
  nittercero          CHAR(12),
  cuentadivergente    CHAR(10),
  fechabase           CHAR(8),
  condicionpago       CHAR(4),
  receptoralternativo CHAR(10),
  fechageneracion     DATE,
  idperson            NUMBER,
  tipocontable        CHAR(3)
)
;

prompt
prompt Creating table REC_LOC_HIST_ABRIL
prompt =================================
prompt
create table REC_LOC_HIST_ABRIL
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_01_2014
prompt ===================================
prompt
create table REC_LOC_HIST_01_2014
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_02_2014
prompt ===================================
prompt
create table REC_LOC_HIST_02_2014
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_05_2013
prompt ===================================
prompt
create table REC_LOC_HIST_05_2013
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_06_2013
prompt ===================================
prompt
create table REC_LOC_HIST_06_2013
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_07_2013
prompt ===================================
prompt
create table REC_LOC_HIST_07_2013
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_08_2013
prompt ===================================
prompt
create table REC_LOC_HIST_08_2013
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_09_2013
prompt ===================================
prompt
create table REC_LOC_HIST_09_2013
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_10_2013
prompt ===================================
prompt
create table REC_LOC_HIST_10_2013
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_LOC_HIST_11_2013
prompt ===================================
prompt
create table REC_LOC_HIST_11_2013
(
  consecutivo_recaudo  NUMBER(8) not null,
  id_secretaria_origen VARCHAR2(10),
  id_tipo_doc          VARCHAR2(1),
  identificacion       VARCHAR2(15) not null,
  numero_referencia    VARCHAR2(20),
  fecha_transaccion    DATE,
  fecha_contable       DATE,
  valor_recaudo        NUMBER,
  valor_adicional      NUMBER,
  suma_pagos           NUMBER,
  valor_com            NUMBER,
  fecha_com            DATE,
  cod_infraccion       VARCHAR2(5),
  total_recaudo        NUMBER,
  polca                VARCHAR2(1),
  id_tipo_recaudo      VARCHAR2(2),
  id_estado_recaudo    VARCHAR2(2),
  fecha_mov_desde      DATE,
  fecha_mov_hasta      DATE,
  obs                  VARCHAR2(10),
  fecha_ejecucion      DATE default SYSDATE,
  novedad              VARCHAR2(1),
  fecha_carga          DATE,
  no_comp              VARCHAR2(20),
  x45                  NUMBER,
  xmun                 NUMBER,
  xfcm                 NUMBER,
  x55                  NUMBER,
  id_secretaria_deuda  VARCHAR2(10)
)
;

prompt
prompt Creating table REC_METRO_BARRANQUILLA
prompt =====================================
prompt
create table REC_METRO_BARRANQUILLA
(
  organismo      NUMBER,
  polca          VARCHAR2(2),
  ref_metro      VARCHAR2(20),
  ref_simit      VARCHAR2(20),
  identificacion VARCHAR2(20)
)
;

prompt
prompt Creating table RENGLON_PLANTILLA
prompt ================================
prompt
create table RENGLON_PLANTILLA
(
  idplantilla NUMBER,
  idrenglon   NUMBER,
  renglon     VARCHAR2(4000)
)
;

prompt
prompt Creating table ROL
prompt ==================
prompt
create table ROL
(
  rolid     NUMBER,
  namerol   VARCHAR2(100),
  enablerol NUMBER,
  enablemod NUMBER
)
;
comment on column ROL.rolid
  is 'autonumerico';
comment on column ROL.namerol
  is 'nombre del rol';
comment on column ROL.enablerol
  is 'activo';
comment on column ROL.enablemod
  is 'Modificar datos';

prompt
prompt Creating table ROLXPERSON
prompt =========================
prompt
create table ROLXPERSON
(
  rolid    NUMBER,
  personid NUMBER
)
;
comment on column ROLXPERSON.rolid
  is 'rol';
comment on column ROLXPERSON.personid
  is 'funcionario';

prompt
prompt Creating table RPTUTILIZACION
prompt =============================
prompt
create table RPTUTILIZACION
(
  idinstitucion NUMBER,
  idseccional   NUMBER,
  idmunicipio   CHAR(8),
  com_asi       NUMBER,
  com_asi_imp   NUMBER,
  com_asi_ele   NUMBER,
  com_sol       NUMBER,
  com_rec       NUMBER,
  com_age_imp   NUMBER,
  com_age_ele   NUMBER,
  com_uti       NUMBER,
  com_dis       NUMBER,
  por_uti       NUMBER,
  por_dis       NUMBER,
  idreporte     NUMBER not null
)
;
alter table RPTUTILIZACION
  add constraint PK_RPTASI primary key (IDREPORTE);

prompt
prompt Creating table RUNT20130613
prompt ===========================
prompt
create table RUNT20130613
(
  campo1      VARCHAR2(300),
  descripcion VARCHAR2(300),
  fecha       VARCHAR2(300),
  campo2      VARCHAR2(300),
  placa       VARCHAR2(300),
  tipodoc     VARCHAR2(300),
  documento   VARCHAR2(300),
  campo3      VARCHAR2(300),
  detalle     VARCHAR2(300)
)
;
create index DOCFECHA on RUNT20130613 (TIPODOC, DOCUMENTO, FECHA);

prompt
prompt Creating table SIMIT_ALERTA_CADUCIDADES
prompt =======================================
prompt
create table SIMIT_ALERTA_CADUCIDADES
(
  consecutivo_comp         NUMBER(10),
  nombre_operador          VARCHAR2(30),
  zona_descripcion         VARCHAR2(30),
  departamento_descripcion VARCHAR2(30),
  id_secretaria            VARCHAR2(10),
  secretaria_descripcion   VARCHAR2(30),
  orden_comparendo         VARCHAR2(20),
  fecha                    DATE,
  nombre                   VARCHAR2(50),
  apellido                 VARCHAR2(50),
  id_tipo_doc              NUMBER(2),
  documento_identidad      VARCHAR2(15),
  cod_infraccion           VARCHAR2(5),
  polca                    VARCHAR2(1),
  valor_comparendo         NUMBER(9),
  fecha_ejecucion          DATE,
  fecha_a_caducar          DATE,
  fechaini                 DATE,
  fechafin                 DATE
)
;
comment on table SIMIT_ALERTA_CADUCIDADES
  is 'Control de alerta de caducidades';
comment on column SIMIT_ALERTA_CADUCIDADES.consecutivo_comp
  is 'Consecutivo del comparendo';
comment on column SIMIT_ALERTA_CADUCIDADES.nombre_operador
  is 'Nombre del operador de la zona del OT';
comment on column SIMIT_ALERTA_CADUCIDADES.zona_descripcion
  is 'Descripción de la zona del OT';
comment on column SIMIT_ALERTA_CADUCIDADES.departamento_descripcion
  is 'Descripción del departamento del OT';
comment on column SIMIT_ALERTA_CADUCIDADES.id_secretaria
  is 'Identificador de la secretaria';
comment on column SIMIT_ALERTA_CADUCIDADES.secretaria_descripcion
  is 'Descripción de la secretaria';
comment on column SIMIT_ALERTA_CADUCIDADES.orden_comparendo
  is 'Número del comparendo';
comment on column SIMIT_ALERTA_CADUCIDADES.fecha
  is 'Fecha del comparendo';
comment on column SIMIT_ALERTA_CADUCIDADES.nombre
  is 'Nombre del infractor';
comment on column SIMIT_ALERTA_CADUCIDADES.apellido
  is 'Apellido del infractor';
comment on column SIMIT_ALERTA_CADUCIDADES.id_tipo_doc
  is 'Tipo de documento del infractor';
comment on column SIMIT_ALERTA_CADUCIDADES.documento_identidad
  is 'Documento de identidad del infractor';
comment on column SIMIT_ALERTA_CADUCIDADES.cod_infraccion
  is 'Código de la infracción';
comment on column SIMIT_ALERTA_CADUCIDADES.polca
  is 'Indica si el comparendo es de carreteras o urbano';
comment on column SIMIT_ALERTA_CADUCIDADES.valor_comparendo
  is 'Valor del comparendo';
comment on column SIMIT_ALERTA_CADUCIDADES.fecha_ejecucion
  is 'Fecha de ejecución de la extracción de la información';
comment on column SIMIT_ALERTA_CADUCIDADES.fecha_a_caducar
  is 'Fecha de caducidad del comparendo';
comment on column SIMIT_ALERTA_CADUCIDADES.fechaini
  is 'Fecha inicial del periodo';
comment on column SIMIT_ALERTA_CADUCIDADES.fechafin
  is 'Fecha final del periodo';
create index IDX_IDSECRETARIA_CAD on SIMIT_ALERTA_CADUCIDADES (ID_SECRETARIA);

prompt
prompt Creating table SIMIT_ALERTA_PRESCRIPCIONES
prompt ==========================================
prompt
create table SIMIT_ALERTA_PRESCRIPCIONES
(
  id_resolucion            NUMBER(10),
  id_secretaria            VARCHAR2(10),
  secretaria_descripcion   VARCHAR2(30),
  id_tipo_doc              NUMBER(2),
  id_contraventor          VARCHAR2(15),
  nro_comparendo           VARCHAR2(20),
  fecha_comparendo         DATE,
  id_tipo_res              NUMBER(2),
  nro_resolucion           VARCHAR2(20),
  fecha_resolucion         DATE,
  consecutivo_cartera      NUMBER(10),
  polca                    VARCHAR2(1),
  estado_cartera           VARCHAR2(2),
  fecha_ejecucion          DATE,
  fecha_prescribe          DATE,
  fechaini                 DATE,
  fechafin                 DATE,
  nombre_operador          VARCHAR2(30),
  zona_descripcion         VARCHAR2(30),
  departamento_descripcion VARCHAR2(30),
  total_cartera            NUMBER(10),
  nombres                  VARCHAR2(50),
  apellidos                VARCHAR2(50)
)
;
comment on table SIMIT_ALERTA_PRESCRIPCIONES
  is 'Control de alerta de prescripciones';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.id_resolucion
  is 'Identificador de la resolución';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.id_secretaria
  is 'Identificador de la secretaria';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.secretaria_descripcion
  is 'Descripción de la secretaria';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.id_tipo_doc
  is 'Tipo de documento del infractor';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.id_contraventor
  is 'Documento de identidad del infractor';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.nro_comparendo
  is 'Número del comparendo';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.fecha_comparendo
  is 'Fecha del comparendo';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.id_tipo_res
  is 'Tipo de resolución';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.nro_resolucion
  is 'Número de la resolución';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.fecha_resolucion
  is 'Fecha de la resolución';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.consecutivo_cartera
  is 'Consecutivo de la cartera';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.polca
  is 'Indica si el comparendo es de carreteras o urbano';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.estado_cartera
  is 'Estado de la cartera';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.fecha_ejecucion
  is 'Fecha de ejecución de la extracción de la información';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.fecha_prescribe
  is 'Fecha de caducidad del comparendo';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.fechaini
  is 'Fecha inicial del periodo donde se reporto alerta';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.fechafin
  is 'Fecha final del period donde se reporto alerta';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.nombre_operador
  is 'Nombre del operador de la zona del OT';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.zona_descripcion
  is 'Descripción de la zona del OT';
comment on column SIMIT_ALERTA_PRESCRIPCIONES.departamento_descripcion
  is 'Descripción del departamento del OT';
create index IDX_IDSECRETARIA_PRES on SIMIT_ALERTA_PRESCRIPCIONES (ID_SECRETARIA);

prompt
prompt Creating table SIMIT_CERT_REC_LOC
prompt =================================
prompt
create table SIMIT_CERT_REC_LOC
(
  id_municipio        CHAR(8),
  fecha_transferencia DATE,
  numero_referencia   VARCHAR2(20),
  fecha_comparendo    DATE,
  identificacion      CHAR(15),
  tipo_documento      CHAR(1),
  fecha_pago_com      DATE,
  total_pago          NUMBER,
  polca               CHAR(1)
)
;

prompt
prompt Creating table SIMIT_CERT_REC_LOC_TEM
prompt =====================================
prompt
create table SIMIT_CERT_REC_LOC_TEM
(
  id_municipio        CHAR(8),
  fecha_transferencia DATE,
  numero_referencia   VARCHAR2(20),
  fecha_comparendo    DATE,
  identificacion      CHAR(15),
  tipo_documento      CHAR(1),
  fecha_pago_com      DATE,
  total_pago          NUMBER,
  polca               CHAR(1)
)
;

prompt
prompt Creating table SIMIT_CERT_REC_TEM
prompt =================================
prompt
create table SIMIT_CERT_REC_TEM
(
  id_municipio        CHAR(8),
  fecha_transferencia DATE,
  numero_referencia   NUMBER(20),
  fecha_comparendo    DATE,
  identificacion      CHAR(15),
  tipo_documento      CHAR(1),
  fecha_pago_com      DATE,
  total_pago          NUMBER,
  polca               CHAR(1)
)
;

prompt
prompt Creating table TIPOFECHA
prompt ========================
prompt
create table TIPOFECHA
(
  id        VARCHAR2(10),
  nombre    VARCHAR2(50),
  categoria INTEGER
)
;
comment on column TIPOFECHA.id
  is 'identificador';
comment on column TIPOFECHA.nombre
  is 'descripcion de valor';
comment on column TIPOFECHA.categoria
  is 'categoria';

prompt
prompt Creating table TIPO_SECRETARIA
prompt ==============================
prompt
create table TIPO_SECRETARIA
(
  tipo   CHAR(1),
  nombre VARCHAR2(100)
)
;

prompt
prompt Creating table TOTALES_VIGENCIA
prompt ===============================
prompt
create table TOTALES_VIGENCIA
(
  idmunicipio CHAR(8),
  indtipo     CHAR(5),
  rango       VARCHAR2(500),
  valor       NUMBER,
  fechacorte  DATE,
  vlr45       NUMBER,
  vlr10       NUMBER
)
;

prompt
prompt Creating table TOT_DEUDA
prompt ========================
prompt
create table TOT_DEUDA
(
  id_municipio    CHAR(8) not null,
  vigencia        NUMBER not null,
  total_reportado NUMBER,
  vlr55           NUMBER,
  vlr45           NUMBER,
  vlr10           NUMBER,
  vlr_transferido NUMBER,
  vlr_adeudado    NUMBER,
  indtipo         CHAR(5) not null,
  vlrmun          NUMBER,
  vlr_sdf         NUMBER,
  fechacorte      DATE
)
;
create index INX_TOTDEU_IDMUN on TOT_DEUDA (ID_MUNICIPIO);
create index INX_TOTDEU_POLCA on TOT_DEUDA (INDTIPO);
create unique index PK_TOT_DEUDA on TOT_DEUDA (ID_MUNICIPIO, VIGENCIA, INDTIPO, FECHACORTE);

prompt
prompt Creating table TOT_DEUDA_REC
prompt ============================
prompt
create table TOT_DEUDA_REC
(
  total_reportado NUMBER,
  vlr55           NUMBER,
  vlr45           NUMBER,
  vlr10           NUMBER,
  vlrmun          NUMBER,
  idmunicipio     VARCHAR2(8),
  indtipo         CHAR(1),
  ano             NUMBER,
  fechacorte      DATE
)
;
create index INX_TOTDEUREC_IDM on TOT_DEUDA_REC (IDMUNICIPIO);

prompt
prompt Creating table TOT_DEUDA_VIG
prompt ============================
prompt
create table TOT_DEUDA_VIG
(
  id_municipio    CHAR(8) not null,
  vigencia        VARCHAR2(500),
  total_reportado NUMBER,
  vlr55           NUMBER,
  vlr45           NUMBER,
  vlr10           NUMBER,
  vlr_transferido NUMBER,
  vlr_adeudado    NUMBER,
  indtipo         CHAR(5) not null,
  vlrmun          NUMBER,
  vlr_sdf         NUMBER,
  fechacorte      DATE,
  feccorterec     DATE,
  feccortetrf     DATE,
  vrl45trf        NUMBER,
  vlr10trf        NUMBER,
  vlrdeu45        NUMBER,
  vlrdeu10        NUMBER
)
;
create unique index PK_TOT_DEU_VIG on TOT_DEUDA_VIG (ID_MUNICIPIO, VIGENCIA, FECHACORTE, INDTIPO);

prompt
prompt Creating table TOT_DEUDA_VIG_DPTAL
prompt ==================================
prompt
create table TOT_DEUDA_VIG_DPTAL
(
  id_dptal        CHAR(8) not null,
  id_municipio    CHAR(8) not null,
  vigencia        VARCHAR2(500),
  total_reportado NUMBER,
  vlr55           NUMBER,
  vlr45           NUMBER,
  vlr10           NUMBER,
  vlr_transferido NUMBER,
  vlr_adeudado    NUMBER,
  indtipo         CHAR(5) not null,
  vlrmun          NUMBER,
  vlr_sdf         NUMBER,
  fechacorte      DATE,
  feccorterec     DATE,
  feccortetrf     DATE,
  vrl45trf        NUMBER,
  vlr10trf        NUMBER,
  vlrdeu45        NUMBER,
  vlrdeu10        NUMBER
)
;
create unique index PK_TOT_DEU_VIG_DPTAL on TOT_DEUDA_VIG_DPTAL (ID_DPTAL, ID_MUNICIPIO, VIGENCIA, FECHACORTE, INDTIPO);

prompt
prompt Creating table TRANSFERACUERDO
prompt ==============================
prompt
create table TRANSFERACUERDO
(
  consecutivo       NUMBER,
  divipo1           CHAR(8),
  divipo            CHAR(8),
  fechainicio       DATE,
  fechafin          DATE,
  valortrf          NUMBER,
  valortrf45        NUMBER,
  valortrf10        NUMBER,
  vigencia          VARCHAR2(500),
  polca             CHAR(1),
  fechapago         DATE,
  anotransfer       NUMBER,
  cedulafuncionario NUMBER,
  tipopago          VARCHAR2(500),
  banco             VARCHAR2(500),
  idreg             NUMBER,
  codinconsistencia NUMBER,
  inconsistencia    VARCHAR2(500),
  comentario        VARCHAR2(500),
  remiteot          VARCHAR2(500),
  remiteconc        VARCHAR2(500),
  radicadonro       VARCHAR2(500),
  fecharadicado     VARCHAR2(500),
  observaciones     VARCHAR2(500),
  fechaultimoexp    VARCHAR2(500),
  vigenciadeu       VARCHAR2(500)
)
;

prompt
prompt Creating table TRANSFERENCIAS_SDF
prompt =================================
prompt
create table TRANSFERENCIAS_SDF
(
  idrecaudo_local_liquidacion NUMBER,
  idbanco                     CHAR(2),
  cta_recaudo                 VARCHAR2(16),
  indtipo                     VARCHAR2(5),
  fec_corte                   DATE,
  fec_tran                    DATE,
  oficina_origen              VARCHAR2(250),
  valor_efectivo              NUMBER,
  valor_cheque                NUMBER,
  valor_total                 NUMBER,
  nit_m                       VARCHAR2(10),
  idmunicipio                 CHAR(8),
  iddepartamento              CHAR(2),
  usuario_proceso             VARCHAR2(20),
  fecha_proceso               DATE,
  ind_proceso                 NUMBER,
  indorigen                   CHAR(3),
  idconcesionario             CHAR(2),
  dias_dispersion             NUMBER,
  frec_dispersion             NUMBER,
  fec_dispersion              DATE,
  s_valor_0                   NUMBER default 0,
  s_valor_1                   NUMBER default 0,
  s_valor_2                   NUMBER default 0,
  s_valor_3                   NUMBER default 0,
  s_valor_4                   NUMBER default 0,
  s_valor_5                   NUMBER default 0,
  s_valor_6                   NUMBER default 0,
  p_valor_7                   NUMBER default 0,
  p_valor_8                   NUMBER default 0,
  p_valor_9                   NUMBER default 0,
  p_valor_10                  NUMBER default 0,
  p_valor_11                  NUMBER default 0,
  p_valor_12                  NUMBER default 0,
  p_valor_13                  NUMBER default 0,
  p_valor_14                  NUMBER default 0,
  p_valor_15                  NUMBER default 0,
  p_valor_16                  NUMBER default 0,
  p_valor_17                  NUMBER default 0,
  p_valor_18                  NUMBER default 0,
  p_valor_19                  NUMBER default 0,
  p_valor_20                  NUMBER default 0,
  p_valor_21                  NUMBER default 0,
  p_valor_22                  NUMBER default 0,
  p_valor_23                  NUMBER default 0,
  p_valor_24                  NUMBER default 0,
  p_valor_25                  NUMBER default 0,
  p_valor_26                  NUMBER default 0,
  p_valor_27                  NUMBER default 0,
  p_valor_28                  NUMBER default 0,
  p_consignado                NUMBER,
  idrecaudolocal_liquidacion  NUMBER,
  vigencia                    VARCHAR2(500),
  fechainicio                 DATE,
  fechafin                    DATE,
  valortrf45                  NUMBER,
  valortrf10                  NUMBER,
  vigenciadeu                 VARCHAR2(500),
  idmunicipioori              CHAR(8)
)
;

prompt
prompt Creating table TRANSFERHIST
prompt ===========================
prompt
create table TRANSFERHIST
(
  consecutivo       NUMBER,
  divipo1           CHAR(8),
  divipo            CHAR(8),
  fechainicio       DATE,
  fechafin          DATE,
  valortrf          NUMBER,
  valortrf45        NUMBER,
  valortrf10        NUMBER,
  vigencia          VARCHAR2(500),
  polca             CHAR(1),
  fechapago         DATE,
  anotransfer       NUMBER,
  cedulafuncionario NUMBER,
  tipopago          VARCHAR2(500),
  banco             VARCHAR2(500),
  idreg             NUMBER,
  codinconsistencia NUMBER,
  inconsistencia    VARCHAR2(500),
  comentario        VARCHAR2(500),
  remiteot          VARCHAR2(500),
  remiteconc        VARCHAR2(500),
  radicadonro       VARCHAR2(500),
  fecharadicado     VARCHAR2(500),
  observaciones     VARCHAR2(500),
  fechaultimoexp    VARCHAR2(500),
  vigenciadeu       VARCHAR2(500)
)
;

prompt
prompt Creating table TRANSFERHIST_TEMP
prompt ================================
prompt
create table TRANSFERHIST_TEMP
(
  consecutivo       VARCHAR2(500),
  divipo1           VARCHAR2(500),
  divipo            VARCHAR2(500),
  municipio         VARCHAR2(500),
  departamento      VARCHAR2(500),
  concesionario     VARCHAR2(500),
  valortrf          VARCHAR2(500),
  valortrf45        VARCHAR2(500),
  valortrf10        VARCHAR2(500),
  polca             VARCHAR2(500),
  vigencia          VARCHAR2(500),
  fechainicio       VARCHAR2(500),
  fechafin          VARCHAR2(500),
  fechapago         VARCHAR2(500),
  anotransfer       VARCHAR2(500),
  cedulafuncionario VARCHAR2(500),
  tipopago          VARCHAR2(500),
  banco             VARCHAR2(500),
  comentario        VARCHAR2(500),
  remiteot          VARCHAR2(500),
  remiteconc        VARCHAR2(500),
  radicadonro       VARCHAR2(500),
  fecharadicado     VARCHAR2(500),
  observaciones     VARCHAR2(500),
  fechaultimoexp    VARCHAR2(500)
)
;

prompt
prompt Creating table TRASLADODIV
prompt ==========================
prompt
create table TRASLADODIV
(
  divipo        CHAR(8),
  fechaini      DATE,
  fechafin      DATE,
  divipodestino CHAR(8),
  tipofecha     CHAR(1)
)
;
comment on column TRASLADODIV.divipo
  is 'Divipo origen';
comment on column TRASLADODIV.fechaini
  is 'fecha inicial del rango de comparendo';
comment on column TRASLADODIV.fechafin
  is 'fecha final del rango de comparendo';
comment on column TRASLADODIV.divipodestino
  is 'divipo destino';

prompt
prompt Creating table UPLOAD
prompt =====================
prompt
create table UPLOAD
(
  uploadid INTEGER not null,
  filename VARCHAR2(255),
  usuario  VARCHAR2(100),
  fecha    DATE,
  valida   NUMBER,
  cfile    CLOB
)
;
comment on column UPLOAD.uploadid
  is 'Autonumerico';
comment on column UPLOAD.filename
  is 'archivo';
comment on column UPLOAD.usuario
  is 'usuario';
comment on column UPLOAD.fecha
  is 'fecha';
comment on column UPLOAD.valida
  is 'valida';
comment on column UPLOAD.cfile
  is 'contenido archivo';

prompt
prompt Creating table UPLOADBIN
prompt ========================
prompt
create table UPLOADBIN
(
  idarchivo       NUMBER,
  nombrearchivo   VARCHAR2(250),
  archivo         BLOB,
  archivozip      BLOB,
  usuario         NUMBER,
  fechageneracion DATE,
  estado          VARCHAR2(50)
)
;

prompt
prompt Creating sequence ID_CURSO
prompt ==========================
prompt
create sequence ID_CURSO
minvalue 1
maxvalue 999999999999999999999999999
start with 1346701
increment by 1
cache 20;

prompt
prompt Creating sequence ID_RECAUDO_DEUDA
prompt ==================================
prompt
create sequence ID_RECAUDO_DEUDA
minvalue 1
maxvalue 999999999999999999999999999
start with 15621
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ACUERDO
prompt =============================
prompt
create sequence SEQ_ACUERDO
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ARCHIVO
prompt =============================
prompt
create sequence SEQ_ARCHIVO
minvalue 1
maxvalue 999999999999999999999999999
start with 1981
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_AUTORIZACION
prompt ==================================
prompt
create sequence SEQ_AUTORIZACION
minvalue 1
maxvalue 999999999999999999999999999
start with 80
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_COM_INSTITUCION
prompt =====================================
prompt
create sequence SEQ_COM_INSTITUCION
minvalue 1
maxvalue 999999999999999999999999999
start with 88
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_COM_INVENTARIO
prompt ====================================
prompt
create sequence SEQ_COM_INVENTARIO
minvalue 1
maxvalue 999999999999999999999999999
start with 3373
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_COM_ORDEN
prompt ===============================
prompt
create sequence SEQ_COM_ORDEN
minvalue 1
maxvalue 999999999999999999999999999
start with 120
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_COM_REPORTE
prompt =================================
prompt
create sequence SEQ_COM_REPORTE
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_COM_SECCIONAL
prompt ===================================
prompt
create sequence SEQ_COM_SECCIONAL
minvalue 1
maxvalue 999999999999999999999999999
start with 88
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CONCILIACION
prompt ==================================
prompt
create sequence SEQ_CONCILIACION
minvalue 1
maxvalue 999999999999999999999999999
start with 38141
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CURSO
prompt ===========================
prompt
create sequence SEQ_CURSO
minvalue 1
maxvalue 9999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEPARTAMENTAL
prompt ===================================
prompt
create sequence SEQ_DEPARTAMENTAL
minvalue 1
maxvalue 999999999999999999999999999
start with 91
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DESCUENTO
prompt ===============================
prompt
create sequence SEQ_DESCUENTO
minvalue 1
maxvalue 9999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DOCUMENTO
prompt ===============================
prompt
create sequence SEQ_DOCUMENTO
minvalue 1
maxvalue 999999999999999999999999999
start with 42
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ERRORS
prompt ============================
prompt
create sequence SEQ_ERRORS
minvalue 1
maxvalue 999999999999999999999999999
start with 3810
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MENU
prompt ==========================
prompt
create sequence SEQ_MENU
minvalue 1
maxvalue 999999999999999999999999999
start with 803
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PAGO
prompt ==========================
prompt
create sequence SEQ_PAGO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PLANTILLA
prompt ===============================
prompt
create sequence SEQ_PLANTILLA
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PUNTOATEN
prompt ===============================
prompt
create sequence SEQ_PUNTOATEN
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RANGOAGENTE
prompt =================================
prompt
create sequence SEQ_RANGOAGENTE
minvalue 1
maxvalue 999999999999999999999999999
start with 88
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_REPORTE
prompt =============================
prompt
create sequence SEQ_REPORTE
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROL
prompt =========================
prompt
create sequence SEQ_ROL
minvalue 1
maxvalue 999999999999999999999999999
start with 289
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TRF_HIS
prompt =============================
prompt
create sequence SEQ_TRF_HIS
minvalue 1
maxvalue 999999999999999999999999999
start with 329379
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_UPLOADS
prompt =============================
prompt
create sequence SEQ_UPLOADS
minvalue 1
maxvalue 999999999999999999999999999
start with 4905
increment by 1
cache 20;

prompt
prompt Creating synonym CONCESIONARIO
prompt ==============================
prompt
create or replace synonym CONCESIONARIO
  for SIMIT.CONCESIONARIO;

prompt
prompt Creating synonym DEPARTAMENTO
prompt =============================
prompt
create or replace synonym DEPARTAMENTO
  for SIMIT.DEPARTAMENTO;

prompt
prompt Creating synonym LOG_PROCESO
prompt ============================
prompt
create or replace synonym LOG_PROCESO
  for NODO.LOG_PROCESO;

prompt
prompt Creating synonym LOG_PROCESO_HIST
prompt =================================
prompt
create or replace synonym LOG_PROCESO_HIST
  for NODO.LOG_PROCESO;

prompt
prompt Creating synonym MUNICIPIO
prompt ==========================
prompt
create or replace synonym MUNICIPIO
  for SIMIT.MUNICIPIO;

prompt
prompt Creating synonym REC_LOC_HIST
prompt =============================
prompt
create or replace synonym REC_LOC_HIST
  for NODO.REC_LOC_HIST;

prompt
prompt Creating view VW_ARCHIVOSCARGUE
prompt ===============================
prompt
create or replace force view vw_archivoscargue as
select distinct archivo
    from errorcargue
    order by 1 desc;

prompt
prompt Creating view VW_CARGEMASIVO
prompt ============================
prompt
create or replace force view vw_cargemasivo as
select m.numcomparendo as comparendo, m.estado as IdEstado, e.nombre as Estado,  m.codresultado, m.mensaje from cargemasivo m, com_estadoinventario e
  where m.estado = e.idestado(+)
  order by m.numcomparendo;

prompt
prompt Creating view VW_COM_AGENTE
prompt ===========================
prompt
create or replace force view vw_com_agente as
select 0 idinstitucion, 'C' tipoidentificacion, 0 numeroidentificacion, ' Seleccione' nombre, '' placa, 'A' estado, 0 idseccional from dual
  union
  select idinstitucion, tipoidentificacion, numeroidentificacion, nombre, placa, estado, idseccional from com_agente;

prompt
prompt Creating view VW_COM_INSTITUCION
prompt ================================
prompt
create or replace force view vw_com_institucion as
select 0 idinsticucion, 'Seleccione ' nombre from dual
union
select idinsticucion, nombre from com_institucion;

prompt
prompt Creating view VW_COM_PROVEEDOR
prompt ==============================
prompt
create or replace force view vw_com_proveedor as
select 0 idinstitucion, '0000000000' nit, 'Seleccione' nombre from dual
union
  select idinstitucion, nit, nombre
    from com_proveedor;

prompt
prompt Creating view VW_COM_SECCIONAL
prompt ==============================
prompt
create or replace force view vw_com_seccional as
select 0 as idseccional, 0 as idinstitucion, 'Seleccione' nombre, 'A' estado from dual
union
select idseccional, idinstitucion, nombre, estado from com_seccional;

prompt
prompt Creating view VW_CONCESIONARIO
prompt ==============================
prompt
create or replace force view vw_concesionario as
select "IDCONCESIONARIO","NIT_C","NOMBRE","CORREO","CTA_CONTABLE","CTA_CONTABLE_LIQUIDACION","CTA_CONTABLE_FONDO","CTA_CONT_PERIOD_ANT","CTA_CONT_PERIOD_ANTFCM"
    from CONCESIONARIO;

prompt
prompt Creating view VW_DEPARTAMENTOS
prompt ==============================
prompt
create or replace force view vw_departamentos as
select "IDDEPARTAMENTO","NOMBRE"
    from departamento;

prompt
prompt Creating view VW_DEUDACONTACTO
prompt ==============================
prompt
create or replace force view vw_deudacontacto as
select
(  select max(fechaCorte) from proceso_deuda ) as fechaCorte,
t.id_municipio,
m.nombre as nomMunicipio,
d.nombre as nomDepartamento,
t.vigencia,
t.total_reportado,
t.vlr55,
t.vlr45,
t.vlr10,
t.vlr_transferido,
t.vlr_adeudado,
t.indtipo,
t.vlrmun,
c.nomsecretaria,
c.secretario,
c.direccion,
c.indicativo,
c.telefono1,
c.celular,
c.correo,
m.nit_m
from tot_deuda t, municipio m, departamento d, directorio c
where t.id_municipio = m.idmunicipio
and d.iddepartamento = m.iddepartamento
and m.idmunicipio = +c.divipo;

prompt
prompt Creating view VW_FECCOR_TOTDEU
prompt ==============================
prompt
create or replace force view vw_feccor_totdeu as
select t.fechacorte, to_char(t.fechacorte,'yyyy-mm-dd') as fecCor
   from tot_deuda_vig t
    group by t.fechacorte;

prompt
prompt Creating view VW_LOG_PROCESO
prompt ============================
prompt
create or replace force view vw_log_proceso as
select to_char(fecha,'yyyy-mm-dd hh:mi:ss') as fecha, descripcion  from simitCurso.log_proceso order by secuencia;

prompt
prompt Creating view VW_MUNICIPIO
prompt ==========================
prompt
create or replace force view vw_municipio as
select '00000000' IDMUNICIPIO,' Seleccione' NOMBRE, '0000000000' as nit_m, '00' as idconcesionario
    from dual
union
select '99999999' IDMUNICIPIO,'POLCA' NOMBRE, '0000000000' as nit_m, '99' as idconcesionario
    from dual
union
select IDMUNICIPIO,( NOMBRE  || ' - '  || IDMUNICIPIO ) as NOMBRE , NIT_M, idconcesionario
    from municipio;

prompt
prompt Creating view VW_PERIODO
prompt ========================
prompt
create or replace force view vw_periodo as
select distinct TO_CHAR(FEC_CORTE,'yyyy/mm') as periodo
      from transferencias_sdf;

prompt
prompt Creating view VW_PERIODO_ALERTAS
prompt ================================
prompt
create or replace force view vw_periodo_alertas as
select to_char(fechaIni,'yyyy/mm/dd') || '-' || to_char(fechaFin,'yyyy/mm/dd') as periodo, id as idReg from proceso_alertas;

prompt
prompt Creating view VW_PERSON
prompt =======================
prompt
create or replace force view vw_person as
select idPerson, upper(namePerson)  || ' - ' || idPerson  as nombre from person;

prompt
prompt Creating view VW_PUNTOATENCION
prompt ==============================
prompt
create or replace force view vw_puntoatencion as
select "IDMUNICIPIO","SECTOR","DIRECCION","HORARIO","CONTACTOMOVIL1","CONTACTOMOVIL2","TELEFONO1","TELEFONO2","CORREOELECTRONICO","IDREG"
    from punto_atencion;

prompt
prompt Creating view VW_RPT_CONSUMO_AGE
prompt ================================
prompt
create or replace force view vw_rpt_consumo_age as
select r.idreporte, r.idinstitucion, r.idseccional, r.idorganismo, r.tipoidentificacion, r.numeroidentificacion, r.asignados, r.utilizados, r.disponibles, r.putilizado, r.pdisponible ,
 upper(i.nombre) institucion,
 upper(s.nombre) seccional,
 upper(m.NOMBRE) organismo,
 upper(a.nombre) agente
 from com_rptconsumoagente r, com_institucion i, com_seccional s, vw_municipio m, com_agente a
 where r.idinstitucion = i.idinsticucion and
 r.idinstitucion = s.idinstitucion and
 r.idseccional = s.idseccional and
 r.idorganismo = m.IDMUNICIPIO and
 r.tipoidentificacion = a.tipoidentificacion and
 r.numeroidentificacion = a.numeroidentificacion;

prompt
prompt Creating view VW_SECCIONAL_ORGANISMO
prompt ====================================
prompt
create or replace force view vw_seccional_organismo as
select 0 idseccional, '00000000' idmunicipio, 'A' estado, 'Seleccione' nombre
    from dual
union
select o.idseccional, o.idmunicipio, o.estado, m.nombre
    from com_organismoseccional o, vw_municipio m
   where o.idmunicipio = m.idmunicipio;

prompt
prompt Creating view VW_TIPOFECHA
prompt ==========================
prompt
create or replace force view vw_tipofecha as
select "ID","NOMBRE","CATEGORIA"
    from listaValor
   where categoria = 1;

prompt
prompt Creating view VW_TIPOJURISDICCION
prompt =================================
prompt
create or replace force view vw_tipojurisdiccion as
select "ID","NOMBRE","CATEGORIA"
    from listaValor
   where categoria = 2;

prompt
prompt Creating view VW_TOT_DEUDA_VIG_DPTAL
prompt ====================================
prompt
create or replace force view vw_tot_deuda_vig_dptal as
select id_dptal, id_municipio, vigencia, total_reportado, vlr55, vlr45, vlr10, vlr_transferido, vlr_adeudado, indtipo, vlrmun, vlr_sdf, fechacorte, feccorterec, feccortetrf, vrl45trf, vlr10trf, vlrdeu45, vlrdeu10 from tot_deuda_vig_dptal
union all
select id_municipio as id_dptal, id_municipio, vigencia, total_reportado, vlr55, vlr45, vlr10, vlr_transferido, vlr_adeudado, indtipo, vlrmun, vlr_sdf, fechacorte, feccorterec, feccortetrf, vrl45trf, vlr10trf, vlrdeu45, vlrdeu10 from tot_deuda_vig;

prompt
prompt Creating view VW_TOT_DUEDA_VIG_DPTAL
prompt ====================================
prompt
create or replace force view vw_tot_dueda_vig_dptal as
select id_dptal, id_municipio, vigencia, total_reportado, vlr55, vlr45, vlr10, vlr_transferido, vlr_adeudado, indtipo, vlrmun, vlr_sdf, fechacorte, feccorterec, feccortetrf, vrl45trf, vlr10trf, vlrdeu45, vlrdeu10 from tot_deuda_vig_dptal
union all
select id_municipio as id_dptal, id_municipio, vigencia, total_reportado, vlr55, vlr45, vlr10, vlr_transferido, vlr_adeudado, indtipo, vlrmun, vlr_sdf, fechacorte, feccorterec, feccortetrf, vrl45trf, vlr10trf, vlrdeu45, vlrdeu10 from tot_deuda_vig;

prompt
prompt Creating view VW_TRANSFER
prompt =========================
prompt
create or replace force view vw_transfer as
select
fechainicio, fechafin , valortrf45, valortrf10, vigencia, cedulafuncionario, tipopago, banco,comentario, remiteot, remiteconc, radicadonro, fecharadicado, observaciones, fechaultimoexp,
divipo as idmunicipio, valortrf valor_total, decode(polca,'S','POLCA','SIMIT') as indTipo, anotransfer, 'HIS' origen,'' cta_recaudo, '' idbanco, '' nomBanco, null as fec_tran, fechaPago as fec_corte,  m.nombre as nomMunicipio, t.vigenciadeu,
t.divipo1 as idMunicipioOri, mu.nombre as nomMunicipioOri
from transferhist t, simit.municipio m, simit.municipio mu
where t.divipo = m.idmunicipio
and t.divipo1 = mu.idmunicipio
union all
select
fechainicio, fechafin , valortrf45, valortrf10, vigencia, cedulafuncionario, tipopago, banco,comentario, remiteot, remiteconc, radicadonro, fecharadicado, observaciones, fechaultimoexp,
divipo as idmunicipio, valortrf valor_total, decode(polca,'S','POLCA','SIMIT') as indTipo, anotransfer, 'HIS' origen,'' cta_recaudo, '' idbanco, '' nomBanco, null as fec_tran, fechaPago as fec_corte,  m.nombre as nomMunicipio, t.vigenciadeu,
t.divipo1 as idMunicipioOri, mu.nombre as nomMunicipioOri
from TRANSFERACUERDO t, simit.municipio m, simit.municipio mu
where t.divipo = m.idmunicipio
and t.divipo1 = mu.idmunicipio
union all
select
fechainicio, fechafin, valortrf45, valortrf10, vigencia, 0 as cedulafuncionario, 'NORMAL' as tipopago,  b.nombre as banco,'' as comentario, '' as remiteot, '' as remiteconc, '' as radicadonro, '' as fecharadicado, '' as observaciones, '' as fechaultimoexp,
t.idmunicipio, valor_total,indtipo, to_number(trim(to_char(t.fec_tran,'yyyy'))) as anotransfer ,'SDF' origen, cta_recaudo, t.idbanco,b.nombre as nomBanco, fec_tran , fec_corte,  m.nombre nomMunicipio, t.vigenciadeu,
t.idMunicipioOri as idMunicipioOri, mu.nombre as nomMunicipioOri
from transferencias_sdf t, simit.banco b, simit.municipio m, simit.municipio mu
where t.idbanco = b.idbanco
and t.idmunicipio = m.idmunicipio
and t.idMunicipioOri = mu.idmunicipio;

prompt
prompt Creating view VW_USUARIO_CONCESIONARIO
prompt ======================================
prompt
create or replace force view vw_usuario_concesionario as
select
c.idperson,
p.nameperson as nomFuncionario,
c.idconcesionario,
cn.nombre as nomConcesionario
from COM_CONC_USUARIO c, concesionario cn, person p
where c.idconcesionario = cn.idconcesionario
and p.idperson = c.idperson;

prompt
prompt Creating view VW_USUARIO_OT
prompt ===========================
prompt
create or replace force view vw_usuario_ot as
select
c.idperson,
p.nameperson as nomFuncionario,
c.idmunicipio,
m.nombre as nomConcesionario
from COM_OT_USUARIO c, municipio m, person p
where c.idmunicipio = m.idmunicipio
and p.idperson = c.idperson;

prompt
prompt Creating view VW_VIGENCIA
prompt =========================
prompt
create or replace force view vw_vigencia as
select distinct ( trim('' || anotransfer )) as vigencia
    from transferHist
    where anotransfer > 0;

prompt
prompt Creating package PK_ACUERDO
prompt ===========================
prompt
create or replace package PK_ACUERDO is

  PROCEDURE q_acuerdo(V_DIVIPO            varchar2,
                      V_USUARIO           number,
                      V_IDACUERDO         out number,
                      V_PERIODOINICIAL    out date,
                      V_PERIODOFINAL      out date,
                      V_FECHARADICACION   out date,
                      V_USUARIORADICACION out number,
                      V_PRIMERPAGO          out date,
                      V_PAGOXEXTERNO        out varchar2,
                      V_JURISDICCION        out varchar2,
                      V_DIAPAGO             out number,
                      V_VALORTOTAL          out number,
                      V_CUOTA               out number,
                      V_MESES               out number,
                      V_INFORMACIONCONTRATO out varchar2,
                      V_OBSERVACIONES       out varchar2,
                      V_NOMBRESUPERVISOR    out varchar2,
                      V_SALDOPENDIENTE      out number,
                      V_TOTALPAGADO         out number,
                      V_PORCCUMPLIMIENTO    out number,
                      V_COD_ERROR out number,
                      V_MSG_ERROR out varchar2);
                      
                      
  PROCEDURE u_acuerdo(V_DIVIPO              varchar2,
                      V_USUARIO             number,
                      V_IDACUERDO           number,
                      V_PERIODOINICIAL      date,
                      V_PERIODOFINAL        date,
                      V_PRIMERPAGO          date,
                      V_PAGOXEXTERNO        varchar2,
                      V_JURISDICCION        varchar2,
                      V_DIAPAGO             number,
                      V_VALORTOTAL          number,
                      V_CUOTA               number,
                      V_MESES               number,
                      V_INFORMACIONCONTRATO varchar2,
                      V_OBSERVACIONES       varchar2,
                      V_NOMBRESUPERVISOR    varchar2,
                      V_COD_ERROR           out number,
                      V_MSG_ERROR           out varchar2);

  PROCEDURE cerrar_acuerdo(V_DIVIPO    varchar2,
                           V_USUARIO   number,
                           V_IDACUERDO number,
                           V_COD_ERROR out number,
                           V_MSG_ERROR out varchar2);
end PK_ACUERDO;
/

prompt
prompt Creating package PK_AUTEN
prompt =========================
prompt
create or replace package pk_auten is

  -- Author  : Ricardo Buitrago Lizarazo
  -- Created : 28/12/2007 10:14:23 a.m.
  -- Purpose :

  -- Public type declarations
  TYPE cursor_t_salida IS REF CURSOR;

  -- Public variable declarations
  v_error   NUMBER := 0;
  v_message VARCHAR2(255);

  MSG_UPD_OK VARCHAR2(255) := 'Registro Actualizado Correctamente';
  MSG_INS_OK VARCHAR2(255) := 'Registro Insertado Correctamente';
  MSG_DEL_OK VARCHAR2(255) := 'Registro Eliminado Correctamente';

  SEMILLA_ENCRIPCION VARCHAR2(255) := 'FEDERACION COLOMBIANA DE MUNICIPIOS';

  FUNCTION darSemilla return varchar2;

  -- Public function and procedure declarations
  PROCEDURE i_usuario(p_idperson     varchar2,
                      p_nameperson   varchar2,
                      p_jobtitle     varchar2,
                      p_enableperson varchar2,
                      p_mail         varchar2,
                      p_clave        varchar2,
                      p_usuario      varchar2,
                      p_error        OUT VARCHAR2);
  PROCEDURE u_usuario(p_idperson     varchar2,
                      p_nameperson   varchar2,
                      p_jobtitle     varchar2,
                      p_enableperson varchar2,
                      p_mail         varchar2,
                      p_clave        varchar2,
                      p_usuario      varchar2,
                      p_error        OUT VARCHAR2);
  PROCEDURE i_rolxusuario(p_personid varchar2,
                          p_rolid    varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);

  PROCEDURE d_rolxusuario(p_personid varchar2,
                          p_rolid    varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);
  PROCEDURE u_rolxusuario(p_personid varchar2,
                          p_rolnew   varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);

  PROCEDURE i_rol(p_rolid     varchar2,
                  p_namerol   varchar2,
                  p_enablerol varchar2,
                  p_enablemod varchar2,

                  p_usuario varchar2,
                  p_error   OUT VARCHAR2);
  PROCEDURE u_rol(p_rolid     varchar2,
                  p_namerol   varchar2,
                  p_enablerol varchar2,
                  p_enablemod varchar2,

                  p_usuario varchar2,
                  p_error   OUT VARCHAR2);
  PROCEDURE u_menuxrol(p_rolid   varchar2,
                       p_menunew varchar2,
                       p_usuario varchar2,
                       p_error   OUT VARCHAR2);

  PROCEDURE i_menu(p_idmenu     varchar2,
                   p_namemenu   varchar2,
                   p_page       varchar2,
                   p_padreid    varchar2,
                   p_enablemenu varchar2,
                   p_usuario    varchar2,
                   p_error      OUT VARCHAR2);
  PROCEDURE u_menu(p_idmenu     varchar2,
                   p_namemenu   varchar2,
                   p_page       varchar2,
                   p_padreid    varchar2,
                   p_enablemenu varchar2,
                   p_usuario    varchar2,
                   p_error      OUT VARCHAR2);

  PROCEDURE q_usuario(p_usuario     number,
                      p_clave       varchar2,
                      p_semilla     varchar2,
                      p_error       OUT VARCHAR2,
                      p_nombre      OUT VARCHAR2,
                      p_idmunicipio out varchar2,
                      p_institucion out varchar2);

  PROCEDURE d_usuario(p_idperson number,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);

  PROCEDURE d_rol(p_rolid number, p_usuario varchar2, p_error OUT VARCHAR2);

  PROCEDURE d_menu(p_idmenu  number,
                   p_usuario varchar2,
                   p_error   OUT VARCHAR2);

  PROCEDURE invoca_Seguridad(p_usuario number,
                             p_clave   varchar2,
                             p_error   OUT VARCHAR2,
                             p_nombre  OUT VARCHAR2);

  PROCEDURE u_person(p_idperson     number,
                     p_password_ant varchar,
                     p_password_new varchar,
                     p_usuario      varchar2,
                     p_error        OUT VARCHAR2);

  PROCEDURE asignarOT(p_personid    varchar2,
                      p_idmunicipio varchar2,
                      p_usuario     varchar2,
                      p_error       OUT VARCHAR2);

  PROCEDURE eliminarOT(p_personid    varchar2,
                      p_usuario     varchar2,
                      p_error       OUT VARCHAR2);

  PROCEDURE asignarCon(p_personid        varchar2,
                       p_idconcesionario varchar2,
                       p_usuario         varchar2,
                       p_error           OUT VARCHAR2);

  PROCEDURE eliminarCon(p_personid varchar2,
                        p_usuario  varchar2,
                        p_error    OUT VARCHAR2);

  PROCEDURE validarUsuConc(v_usuario       number,
                           v_municipio     varchar2,
                           v_departamento  varchar2,
                           v_concesionario varchar2,
                           v_indTipo       varchar2,
                           v_cod_error     out number,
                           v_msg_error     out varchar2);
end pk_auten;
/

prompt
prompt Creating package PK_BATCH
prompt =========================
prompt
create or replace package PK_BATCH is

  -- Author  : Hugo Cendales P
  -- Created : 16/11/2011 9:01:36
  -- Purpose : Ejecutar proceso batch de recalculo de deuda local
  procedure inicar_proceso_deuda(v_fechaCorte date,
                                 v_usuario    number,
                                 v_paso       varchar2,
                                 v_cod_error  out number,
                                 v_msg_error  out varchar2);

  PROCEDURE enviar_proceso_deuda(v_fechaCorte date,
                                 v_usuario    number,
                                 v_paso       varchar2,
                                 v_cod_error  out number,
                                 v_msg_error  out varchar2);

  procedure proceso_deuda(v_fechaCorte varchar2,
                          v_usuario    varchar2,
                          v_paso       varchar2);

  PROCEDURE enviar_proceso_deuda_mun(v_fechaCorte  date,
                                     v_usuario     number,
                                     v_idMunicipio varchar2,
                                     v_cod_error   out number,
                                     v_msg_error   out varchar2);

  procedure cal_deuda(v_fechaCorte date,
                      v_usuario    number,
                      v_paso       varchar2,
                      v_cod_error  out number,
                      v_msg_error  out varchar2);

  procedure proceso_deuda_mun(v_fechaCorte  varchar2,
                              v_usuario     varchar2,
                              v_idMunicipio varchar2);

  procedure inicar_proceso_deuda_mun(v_fechaCorte  date,
                                     v_usuario     number,
                                     v_idmunicipio varchar2,
                                     v_cod_error   out number,
                                     v_msg_error   out varchar2);

  procedure verif_proceso_deuda(v_fechaCorte date,
                                v_usuario    number,
                                v_cod_error  out number,
                                v_msg_error  out varchar2,
                                v_paso       out varchar2);

  procedure inicar_proceso_alertas(v_fechaIni  date,
                                   v_fechaFin  date,
                                   v_usuario   number,
                                   v_cod_error out number,
                                   v_msg_error out varchar2);

  procedure proceso_alertas(v_fechaIni varchar2,
                            v_fechaFin varchar2,
                            v_usuario  varchar2);

  PROCEDURE enviar_proceso_alertas(v_fechaIni  date,
                                   v_fechaFin  date,
                                   v_usuario   number,
                                   v_cod_error out number,
                                   v_msg_error out varchar2);

end PK_BATCH;
/

prompt
prompt Creating package PK_COMPARENDOS
prompt ===============================
prompt
create or replace package PK_COMPARENDOS is

  PROCEDURE a_institucion(v_nombre    varchar2,
                          v_rango1    varchar2,
                          v_rango2    varchar2,
                          v_tipo      varchar2,
                          v_usuario   number,
                          v_cod_error out number,
                          v_msg_error out varchar2);

  PROCEDURE m_institucion(v_idinsticucion number,
                          v_nombre        varchar2,
                          v_rango1        varchar2,
                          v_rango2        varchar2,
                          v_tipo          varchar2,
                          v_usuario       number,
                          v_cod_error     out number,
                          v_msg_error     out varchar2);

  PROCEDURE d_institucion(v_idinsticucion number,
                          v_usuario       number,
                          v_cod_error     out number,
                          v_msg_error     out varchar2);

  PROCEDURE a_seccional(v_idinstitucion number,
                        v_nombre        varchar2,
                        v_estado        varchar2,
                        v_rango1        varchar2,
                        v_rango2        varchar2,
                        v_usuario       number,
                        v_cod_error     out number,
                        v_msg_error     out varchar2,
                        v_idReg         out number);

  PROCEDURE m_seccional(v_idinstitucion number,
                        v_idseccional   number,
                        v_nombre        varchar2,
                        v_estado        varchar2,
                        v_rango1        varchar2,
                        v_rango2        varchar2,
                        v_usuario       number,
                        v_cod_error     out number,
                        v_msg_error     out varchar2);

  PROCEDURE d_seccional(v_idseccional number,
                        v_usuario     number,
                        v_cod_error   out number,
                        v_msg_error   out varchar2);

  PROCEDURE a_organismoseccional(v_idmunicipio varchar2,
                                 v_idseccional number,
                                 v_estado      varchar2,
                                 v_rango1      varchar2,
                                 v_rango2      varchar2,
                                 v_usuario     number,
                                 v_cod_error   out number,
                                 v_msg_error   out varchar2);

  PROCEDURE m_organismoseccional(v_idmunicipio varchar2,
                                 v_idseccional number,
                                 v_estado      varchar2,
                                 v_rango1      varchar2,
                                 v_rango2      varchar2,
                                 v_usuario     number,
                                 v_cod_error   out number,
                                 v_msg_error   out varchar2);

  PROCEDURE d_organismoseccional(v_idmunicipio varchar2,
                                 v_idseccional number,
                                 v_usuario     number,
                                 v_cod_error   out number,
                                 v_msg_error   out varchar2);

  PROCEDURE a_rangoinstitucion(v_idinstitucion  number,
                               v_tipocomparendo varchar2,
                               v_rangoinicial   number,
                               v_rangofinal     number,
                               v_usuario        number,
                               v_cod_error      out number,
                               v_msg_error      out varchar2);

  PROCEDURE d_rangoinstitucion(v_idinstitucion  number,
                               v_tipocomparendo varchar2,
                               v_rangoinicial   number,
                               v_rangofinal     number,
                               v_usuario        number,
                               v_cod_error      out number,
                               v_msg_error      out varchar2);

  PROCEDURE a_rangoorganismo(v_idseccional    number,
                             v_tipocomparendo varchar2,
                             v_idmunicipio    varchar2,
                             v_rangoinicial   number,
                             v_rangofinal     number,
                             v_rango1         varchar2,
                             v_rango2         varchar2,
                             v_usuario        number,
                             v_cod_error      out number,
                             v_msg_error      out varchar2);

  PROCEDURE d_rangoorganismo(v_idseccional    number,
                             v_tipocomparendo varchar2,
                             v_idmunicipio    varchar2,
                             v_rangoinicial   number,
                             v_rangofinal     number,
                             v_usuario        number,
                             v_cod_error      out number,
                             v_msg_error      out varchar2);

  PROCEDURE a_proveedor(v_idinstitucion  number,
                        v_nit            varchar2,
                        v_nombre         varchar2,
                        v_direccion      varchar2,
                        v_ciudad         varchar2,
                        v_nombrecontacto varchar2,
                        v_telefono       varchar2,
                        v_extension      varchar2,
                        v_correo         varchar2,
                        v_celular        varchar2,
                        v_estado         varchar2,
                        v_usuario        number,
                        v_cod_error      out number,
                        v_msg_error      out varchar2);

  PROCEDURE m_proveedor(v_idinstitucion  number,
                        v_nit            varchar2,
                        v_nombre         varchar2,
                        v_direccion      varchar2,
                        v_ciudad         varchar2,
                        v_nombrecontacto varchar2,
                        v_telefono       varchar2,
                        v_extension      varchar2,
                        v_correo         varchar2,
                        v_celular        varchar2,
                        v_estado         varchar2,
                        v_usuario        number,
                        v_cod_error      out number,
                        v_msg_error      out varchar2);

  PROCEDURE d_proveedor(v_idinstitucion number,
                        v_nit           varchar2,
                        v_usuario       number,
                        v_cod_error     out number,
                        v_msg_error     out varchar2);

  PROCEDURE q_porc_ot(v_idinstitucion number,
                      v_idseccional   number,
                      v_idmunicipio   varchar2,
                      v_usuario       number,
                      v_cod_error     out number,
                      v_msg_error     out varchar2,
                      v_com_asi       out number,
                      v_com_asi_imp   out number,
                      v_com_asi_ele   out number,
                      v_com_sol       out number,
                      v_com_rec       out number,
                      v_com_age_imp   out number,
                      v_com_age_ele   out number,
                      v_com_uti       out number,
                      v_com_dis       out number,
                      v_por_uti       out number,
                      v_por_dis       out number,
                      v_idReporte     out number);

  PROCEDURE q_porc_sec(v_idinstitucion number,
                       v_idseccional   number,
                       v_usuario       number,
                       v_cod_error     out number,
                       v_msg_error     out varchar2,
                       v_com_asi       out number,
                       v_com_asi_imp   out number,
                       v_com_asi_ele   out number,
                       v_com_sol       out number,
                       v_com_rec       out number,
                       v_com_age_imp   out number,
                       v_com_age_ele   out number,
                       v_com_uti       out number,
                       v_com_dis       out number,
                       v_por_uti       out number,
                       v_por_dis       out number);

  PROCEDURE q_porc_ins(v_idinstitucion number,
                       v_usuario       number,
                       v_cod_error     out number,
                       v_msg_error     out varchar2,
                       v_com_asi       out number,
                       v_com_asi_imp   out number,
                       v_com_asi_ele   out number,
                       v_com_sol       out number,
                       v_com_rec       out number,
                       v_com_age_imp   out number,
                       v_com_age_ele   out number,
                       v_com_uti       out number,
                       v_com_dis       out number,
                       v_por_uti       out number,
                       v_por_dis       out number

                       );

  PROCEDURE q_porc_age(v_idinstitucion number,
                       v_idseccional   number,
                       v_idorganismo   varchar2,
                       v_fecini        date,
                       v_fecfin        date,
                       v_usuario       number,
                       v_cod_error     out number,
                       v_msg_error     out varchar2,
                       v_idreporte     out number);

  PROCEDURE a_agente(v_idinstitucion        number,
                     v_idseccional          number,
                     v_tipoidentificacion   varchar2,
                     v_numeroidentificacion number,
                     v_nombre               varchar2,
                     v_placa                varchar2,
                     v_estado               varchar2,
                     v_tipoAgente           varchar2,
                     v_usuario              number,
                     v_cod_error            out number,
                     v_msg_error            out varchar2);

  PROCEDURE m_agente(v_idinstitucion        number,
                     v_idseccional          number,
                     v_tipoidentificacion   varchar2,
                     v_numeroidentificacion number,
                     v_nombre               varchar2,
                     v_placa                varchar2,
                     v_estado               varchar2,
                     v_tipoAgente           varchar2,
                     v_usuario              number,
                     v_cod_error            out number,
                     v_msg_error            out varchar2);

  PROCEDURE d_agente(v_idinstitucion        number,
                     v_idseccional          number,
                     v_tipoidentificacion   varchar2,
                     v_numeroidentificacion number,
                     v_usuario              number,
                     v_cod_error            out number,
                     v_msg_error            out varchar2);

  PROCEDURE a_ordenimpresion(v_idinstitucion number,
                             v_idseccional   number,
                             v_idorganismo   varchar2,
                             v_nitproveedor  varchar2,
                             v_comparenderas number,
                             v_comparendos   number,
                             v_rangoinicial  number,
                             v_usuario       number,
                             v_cod_error     out number,
                             v_msg_error     out varchar2);

  PROCEDURE d_ordenimpresion(v_idorden   number,
                             v_usuario   number,
                             v_cod_error out number,
                             v_msg_error out varchar2);

  PROCEDURE a_recibirOrden(v_idorden   number,
                           v_usuario   number,
                           v_cod_error out number,
                           v_msg_error out varchar2);

  PROCEDURE a_anularOrden(v_idorden   number,
                          v_usuario   number,
                          v_cod_error out number,
                          v_msg_error out varchar2);

  PROCEDURE a_rangoAgente(v_idinstitucion        number,
                          v_idseccional          number,
                          v_idorganismo          varchar2,
                          v_numeroidentificacion number,
                          v_rangoinicial         number,
                          v_rangofinal           number,
                          v_tipoComparendo       varchar2,
                          v_usuario              number,
                          v_cod_error            out number,
                          v_msg_error            out varchar2);

  PROCEDURE d_rangoAgente(v_idrangoagente number,
                          v_usuario       number,
                          v_cod_error     out number,
                          v_msg_error     out varchar2);

  PROCEDURE r_rangoAgente(v_idrangoagente        number,
                          v_numeroidentificacion number,
                          v_usuario              number,
                          v_cod_error            out number,
                          v_msg_error            out varchar2);

  PROCEDURE q_darRangoIns(v_idinstitucion number,
                          v_usuario       number,
                          v_cod_error     out number,
                          v_msg_error     out varchar2,
                          v_rango1        out varchar2,
                          v_rango2        out varchar2);

  PROCEDURE q_darRangoSec(v_idseccional number,
                          v_usuario     number,
                          v_cod_error   out number,
                          v_msg_error   out varchar2,
                          v_rango1      out varchar2,
                          v_rango2      out varchar2);

  PROCEDURE q_darRangoOt(v_idseccional number,
                         v_idmunicipio varchar2,
                         v_usuario     number,
                         v_cod_error   out number,
                         v_msg_error   out varchar2,
                         v_rango1      out varchar2,
                         v_rango2      out varchar2);

  PROCEDURE m_actEstadoInv(v_idinstitucion number,
                           v_idseccional   number,
                           v_idorganismo   varchar2,
                           v_rangoinicial  number,
                           v_rangofinal    number,
                           v_estado        varchar2,
                           v_usuario       number,
                           v_cod_error     out number,
                           v_msg_error     out varchar2);

  PROCEDURE m_actEstadoInvMas(v_idinstitucion number,
                              v_idseccional   number,
                              v_idorganismo   varchar2,
                              v_rango1 varchar2,
                              v_filename      varchar2,
                              v_cfileIn       clob,
                              v_usuario       number,
                              v_cod_error     out number,
                              v_msg_error     out varchar2);

  PROCEDURE q_porc_ot_rango(v_idmunicipio varchar2,
                            v_rangoIni    number,
                            v_rangoFin    number,
                            v_usuario     number,
                            v_cod_error   out number,
                            v_msg_error   out varchar2,
                            v_com_asi     out number,
                            v_com_uti     out number,
                            v_com_dis     out number,
                            v_por_uti     out number,
                            v_por_dis     out number);

  PROCEDURE q_rango(v_idinstitucion number,
                    v_idseccional   number,
                    v_idorganismo   varchar2,
                    v_rangoinicial  varchar2,
                    v_rangofinal    varchar2,
                    v_usuario       number,
                    v_cod_error     out number,
                    v_msg_error     out varchar2,
                    v_com_asi       out number,
                    v_com_uti       out number,
                    v_com_dis       out number,
                    v_por_uti       out number,
                    v_por_dis       out number);

  PROCEDURE q_institucion(v_idinstitucion number,
                          v_usuario       number,
                          v_tipo          out varchar2,
                          v_rango1        out varchar2,
                          v_cod_error     out number,
                          v_msg_error     out varchar2);

end PK_COMPARENDOS;
/

prompt
prompt Creating package PK_CONTA
prompt =========================
prompt
create or replace package PK_CONTA is

  PROCEDURE contabilizar_liquidacion(v_fecha_ini date,
                                     v_fecha_fin date,
                                     v_usuario   number,
                                     v_cod_error out number,
                                     v_msg_error out varchar2);

  PROCEDURE contabilizar_conciliacion(v_periodo   varchar2,
                                      v_usuario   number,
                                      v_cod_error out number,
                                      v_msg_error out varchar2);

   PROCEDURE contabilizar_pago(v_periodo   varchar2,
                                      v_usuario   number,
                                      v_cod_error out number,
                                      v_msg_error out varchar2);

end PK_CONTA;
/

prompt
prompt Creating package PK_DAVID
prompt =========================
prompt
create or replace package PK_DAVID is

  PROCEDURE arc_comRep(v_municipio  varchar2,
                       v_usuario    number,
                       v_cod_error  out number,
                       v_msg_error  out varchar2,
                       v_nomArchivo out varchar2
                       --v_archivoZip out blob
                       );
end PK_DAVID;
/

prompt
prompt Creating package PK_DEUDA
prompt =========================
prompt
create or replace package PK_DEUDA is

  -- Author  : USER
  -- Created : 06/10/2011 18:26:33
  -- Purpose :

  PROCEDURE v_archivoTrf(p_uploadid number,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);
  PROCEDURE v_archivoAcuerdo(p_uploadid number,
                             p_usuario  varchar2,
                             p_error    OUT VARCHAR2);

  PROCEDURE cargarTrf(p_uploadid NUMBER,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);

  PROCEDURE cargarAcuerdo(p_uploadid NUMBER,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);

  PROCEDURE cargar_sdf(v_fecha_ini date,
                       v_fecha_fin date,
                       v_usuario   number,
                       v_cod_error out number,
                       v_msg_error out varchar2);

  PROCEDURE elim_trf_hist(v_idReg     number,
                          v_usuario   number,
                          v_cod_error out number,
                          v_msg_error out varchar2);

  PROCEDURE add_Trf_Hist(v_idReg             number,
                         v_consecutivo       number,
                         v_divipo1           varchar2,
                         v_fechainicio       date,
                         v_fechafin          date,
                         v_valortrf          number,
                         v_valortrf45        number,
                         v_valortrf10        number,
                         v_vigencia          varchar2,
                         v_polca             varchar2,
                         v_fechapago         date,
                         v_anotransfer       number,
                         v_cedulafuncionario number,
                         v_tipopago          varchar2,
                         v_banco             varchar2,
                         v_COMENTARIO        varchar2,
                         v_REMITEOT          varchar2,
                         v_REMITECONC        varchar2,
                         v_RADICADONRO       varchar2,
                         v_FECHARADICADO     varchar2,
                         v_OBSERVACIONES     varchar2,
                         v_FECHAULTIMOEXP    varchar2,
                         
                         v_usuario   number,
                         v_cod_error out number,
                         v_msg_error out varchar2);

  PROCEDURE mod_Trf_Hist(v_idReg             number,
                         v_consecutivo       number,
                         v_divipo1           varchar2,
                         v_fechainicio       date,
                         v_fechafin          date,
                         v_valortrf          number,
                         v_valortrf45        number,
                         v_valortrf10        number,
                         v_vigencia          varchar2,
                         v_polca             varchar2,
                         v_fechapago         date,
                         v_anotransfer       number,
                         v_cedulafuncionario number,
                         v_tipopago          varchar2,
                         v_banco             varchar2,
                         v_COMENTARIO        varchar2,
                         v_REMITEOT          varchar2,
                         v_REMITECONC        varchar2,
                         v_RADICADONRO       varchar2,
                         v_FECHARADICADO     varchar2,
                         v_OBSERVACIONES     varchar2,
                         v_FECHAULTIMOEXP    varchar2,
                         v_usuario           number,
                         v_cod_error         out number,
                         v_msg_error         out varchar2);

  PROCEDURE mod_Trf_sdf(v_idReg     number,
                        v_fecIni    date,
                        v_fecFin    date,
                        v_usuario   number,
                        v_cod_error out number,
                        v_msg_error out varchar2);

  procedure cal_deuda_global(v_fechaCorte date,
                             v_usuario    number,
                             v_cod_error  out number,
                             v_msg_error  out varchar2);

  PROCEDURE cal_tot_deuda(v_idMunicipio varchar2,
                          v_fechaCorte  date,
                          v_indTipo     varchar2,
                          v_usuario     number,
                          v_cod_error   out number,
                          v_msg_error   out varchar2);

  PROCEDURE cal_tot_deuda_dptal(v_idMunicipio varchar2,
                                v_idMunicipioOri varchar2,
                                v_fechaCorte  date,
                                v_indTipo     varchar2,
                                v_usuario     number,
                                v_cod_error   out number,
                                v_msg_error   out varchar2);

  PROCEDURE generar_doc(v_idMunicipio varchar2,
                        v_indTipo     varchar2,
                        v_idPlantilla number,
                        v_usuario     number,
                        v_cod_error   out number,
                        v_msg_error   out varchar2,
                        v_numDoc      out number);

  PROCEDURE darFechaCorte(v_usuario    number,
                          v_cod_error  out number,
                          v_msg_error  out varchar2,
                          v_fechaCorte out date);

  PROCEDURE darFechaCorteTrf(v_usuario    number,
                             v_cod_error  out number,
                             v_msg_error  out varchar2,
                             v_fechaCorte out date);

  function anoIncluido(ano in number, vigencia in varchar2) return boolean;
  function periodoIni(vigencia in varchar2) return number;
  function periodoFin(vigencia in varchar2) return number;
  function tienePeriodos(vigencia in varchar2) return boolean;
  function vigenciaIncluida(vigencia      in varchar2,
                            rangoVigencia in varchar2) return boolean;

end PK_DEUDA;
/

prompt
prompt Creating package PK_DEUDAPAR
prompt ============================
prompt
create or replace package pk_deudaPar is

  -- Author  : USER
  -- Created : 06/10/2011 15:54:47
  -- Purpose : Manejo de parametros de deuda
  PROCEDURE a_traslado(v_fecha_ini  date,
                       v_fecha_fin  date,
                       v_divipo_ori varchar2,
                       v_divipo_des varchar2,
                       v_tipoFecha  varchar2,
                       v_usuario    number,
                       v_cod_error  out number,
                       v_msg_error  out varchar2);

  PROCEDURE d_traslado(v_fecha_ini  date,
                       v_fecha_fin  date,
                       v_divipo_ori varchar2,
                       v_divipo_des varchar2,
                       v_usuario    number,
                       v_cod_error  out number,
                       v_msg_error  out varchar2);

  PROCEDURE a_departamental(v_divipo_ori varchar2,
                            v_divipo_des varchar2,
                            v_usuario    number,
                            v_cod_error  out number,
                            v_msg_error  out varchar2);

  PROCEDURE d_departamental(v_divipo_ori varchar2,
                            v_divipo_des varchar2,
                            v_usuario    number,
                            v_cod_error  out number,
                            v_msg_error  out varchar2);
  PROCEDURE a_defcorte(v_divipo_ori varchar2,
                       v_defcorte   varchar2,
                       v_usuario    number,
                       v_cod_error  out number,
                       v_msg_error  out varchar2);

  PROCEDURE d_defcorte(v_divipo_ori varchar2,
                       v_defcorte   varchar2,
                       v_usuario    number,
                       v_cod_error  out number,
                       v_msg_error  out varchar2);

  PROCEDURE i_plantilla(v_idplantilla number,
                        v_nombre      varchar2,
                        v_usuario     number,
                        v_cod_error   out number,
                        v_msg_error   out varchar2);

  PROCEDURE u_plantilla(v_idplantilla number,
                        v_nombre      varchar2,
                        v_usuario     number,
                        v_cod_error   out number,
                        v_msg_error   out varchar2);

  PROCEDURE d_plantilla(v_idplantilla number,
                        v_usuario     number,
                        v_cod_error   out number,
                        v_msg_error   out varchar2);

  PROCEDURE i_renglon(v_idplantilla number,
                      v_idrenglon   number,
                      v_renglon     varchar2,
                      v_usuario     number,
                      v_cod_error   out number,
                      v_msg_error   out varchar2);

  PROCEDURE u_renglon(v_idplantilla number,
                      v_idrenglon   number,
                      v_renglon     varchar2,
                      v_usuario     number,
                      v_cod_error   out number,
                      v_msg_error   out varchar2);

  PROCEDURE d_renglon(v_idplantilla number,
                      v_idrenglon   number,
                      v_usuario     number,
                      v_cod_error   out number,
                      v_msg_error   out varchar2);

  PROCEDURE a_certdeuda(v_idmunicipio  varchar2,
                        v_fechainicial date,
                        v_fechafinal   date,
                        v_indTipo      varchar2,
                        v_valor        number,
                        v_usuario      number,
                        v_cod_error    out number,
                        v_msg_error    out varchar2);

  PROCEDURE d_certdeuda(v_idmunicipio  varchar2,
                        v_fechainicial date,
                        v_fechafinal   date,
                        v_indTipo      varchar2,
                        v_usuario      number,
                        v_cod_error    out number,
                        v_msg_error    out varchar2);

  PROCEDURE delete_departamental(v_idReg     number,
                                 v_usuario   number,
                                 v_cod_error out number,
                                 v_msg_error out varchar2);

  PROCEDURE act_departamental(v_idReg        number,
                              v_divipo_ori   varchar2,
                              v_divipo_des   varchar2,
                              v_fechaIni     date,
                              v_fechaFin     date,
                              v_tipoFecha    varchar2,
                              v_jurisdiccion varchar2,
                              v_usuario      number,
                              v_cod_error    out number,
                              v_msg_error    out varchar2);

end pk_deudaPar;
/

prompt
prompt Creating package PK_DIRECTORIO
prompt ==============================
prompt
create or replace package PK_DIRECTORIO is

  PROCEDURE i_archivo(p_filename varchar2,
                      p_cfile    clob,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);
  PROCEDURE v_archivoTrf(p_uploadid number,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);

  PROCEDURE cargarDir(p_uploadid NUMBER,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);

  PROCEDURE q_directorio(V_DIVIPO  varchar2,
                         v_usuario number,
                         
                         V_NOMSECRETARIA   out VARCHAR2,
                         V_SECRETARIO      out VARCHAR2,
                         V_CELULAR         out VARCHAR2,
                         V_FECHACUMPLEANOS out VARCHAR2,
                         V_ASISTENTE       out VARCHAR2,
                         V_TELASISTENTE    out VARCHAR2,
                         V_DIRECCION       out VARCHAR2,
                         V_INDICATIVO      out VARCHAR2,
                         V_TELEFONO1       out VARCHAR2,
                         V_TELEFONO2       out VARCHAR2,
                         V_TELEFONO3       out VARCHAR2,
                         V_TELEFONO4       out VARCHAR2,
                         V_CORREO          out VARCHAR2,
                         V_NIT             out VARCHAR2,
                         V_CATEGORIA       out VARCHAR2,
                         V_SOFTWARECONTR   out VARCHAR2,
                         V_IDCONCESIONARIO out VARCHAR2,
                         V_TIENECONVENIO   out VARCHAR2,
                         V_FECHACONVENIO   out DATE,
                         V_TIPOSECRETARIA  out VARCHAR2,
                         V_ZONA            out VARCHAR2,
                         
                         v_cod_error out number,
                         v_msg_error out varchar2);

  PROCEDURE u_directorio(V_DIVIPO  varchar2,
                         v_usuario number,
                         
                         V_NOMSECRETARIA   VARCHAR2,
                         V_SECRETARIO      VARCHAR2,
                         V_CELULAR         VARCHAR2,
                         V_FECHACUMPLEANOS VARCHAR2,
                         V_ASISTENTE       VARCHAR2,
                         V_TELASISTENTE    VARCHAR2,
                         V_DIRECCION       VARCHAR2,
                         V_INDICATIVO      VARCHAR2,
                         V_TELEFONO1       VARCHAR2,
                         V_TELEFONO2       VARCHAR2,
                         V_TELEFONO3       VARCHAR2,
                         V_TELEFONO4       VARCHAR2,
                         V_CORREO          VARCHAR2,
                         V_NIT             VARCHAR2,
                         V_CATEGORIA       VARCHAR2,
                         V_SOFTWARECONTR   VARCHAR2,
                         V_TIENECONVENIO   VARCHAR2,
                         V_FECHACONVENIO   DATE,
                         V_TIPOSECRETARIA  VARCHAR2,
                         V_ZONA            VARCHAR2,
                         
                         v_cod_error out number,
                         v_msg_error out varchar2);

  PROCEDURE q_ficha(V_DIVIPO          varchar2,
                    V_USUARIO         number,
                    V_DPTO            out VARCHAR2,
                    V_AUTORIDAD       out VARCHAR2,
                    V_DIV             out VARCHAR2,
                    V_RAZON           out VARCHAR2,
                    V_TIPOSECRETARIA  out VARCHAR2,
                    V_NATURALEZA      out VARCHAR2,
                    V_NIT             out VARCHAR2,
                    V_CATEGORIA       out VARCHAR2,
                    V_SECRETARIO      out VARCHAR2,
                    V_CELULAR         out VARCHAR2,
                    V_FECHACUMPLEANOS out VARCHAR2,
                    V_ASISTENTE       out VARCHAR2,
                    V_TELASISTENTE    out VARCHAR2,
                    V_DIRECCION       out VARCHAR2,
                    V_INDICATIVO      out VARCHAR2,
                    V_TELEFONO1       out VARCHAR2,
                    V_TELEFONO2       out VARCHAR2,
                    V_TELEFONO3       out VARCHAR2,
                    V_TELEFONO4       out VARCHAR2,
                    V_CORREO          out VARCHAR2,
                    V_MANUAL          out VARCHAR2,
                    V_SISTEMATIZADO   out VARCHAR2,
                    V_NOMBRESISTEMA   out VARCHAR2,
                    v_PROVEEDOR       out VARCHAR2,
                    
                    V_CONVENIO      out VARCHAR2,
                    V_FECHACONVENIO out DATE,
                    V_ACTAINICIO    out DATE,
                    V_SUPERVISOR    out VARCHAR2,
                    V_COORDINADOR   out VARCHAR2,
                    V_OPERADOR      out VARCHAR2,
                    V_ZONA          out VARCHAR2,
                    
                    V_MANUAL1        out VARCHAR2,
                    V_SISTEMATIZADO1 out VARCHAR2,
                    V_NOMBRESISTEMA1 out VARCHAR2,
                    v_PROVEEDOR1     out VARCHAR2,
                    
                    V_DIRECTA     out VARCHAR2,
                    V_CONTRATISTA out VARCHAR2,
                    V_OBJETO      out VARCHAR2,
                    V_FECHAINICIO out DATE,
                    V_PLAZO       out VARCHAR2,
                    V_EXTERNO     out VARCHAR2,
                    
                    V_ACUERDO   out VARCHAR2,
                    V_ACCION    out VARCHAR2,
                    V_TIPO      out VARCHAR2,
                    V_APODERADO out VARCHAR2,
                    
                    V_COD_ERROR out number,
                    V_MSG_ERROR out varchar2);

  PROCEDURE u_ficha(V_DIVIPO          varchar2,
                    V_USUARIO         number,
                    V_RAZON           VARCHAR2,
                    V_TIPOSECRETARIA  VARCHAR2,
                    V_NATURALEZA      VARCHAR2,
                    V_NIT             VARCHAR2,
                    V_CATEGORIA       VARCHAR2,
                    V_SECRETARIO      VARCHAR2,
                    V_CELULAR         VARCHAR2,
                    V_FECHACUMPLEANOS VARCHAR2,
                    V_ASISTENTE       VARCHAR2,
                    V_TELASISTENTE    VARCHAR2,
                    V_DIRECCION       VARCHAR2,
                    V_INDICATIVO      VARCHAR2,
                    V_TELEFONO1       VARCHAR2,
                    V_TELEFONO2       VARCHAR2,
                    V_TELEFONO3       VARCHAR2,
                    V_TELEFONO4       VARCHAR2,
                    V_CORREO          VARCHAR2,
                    V_MANUAL          VARCHAR2,
                    V_SISTEMATIZADO   VARCHAR2,
                    V_NOMBRESISTEMA   VARCHAR2,
                    v_PROVEEDOR       VARCHAR2,
                    V_CONVENIO        VARCHAR2,
                    V_FECHACONVENIO   DATE,
                    V_ACTAINICIO      DATE,
                    V_SUPERVISOR      VARCHAR2,
                    V_COORDINADOR     VARCHAR2,
                    V_ZONA            VARCHAR2,
                    V_MANUAL1         VARCHAR2,
                    V_SISTEMATIZADO1  VARCHAR2,
                    V_NOMBRESISTEMA1  VARCHAR2,
                    v_PROVEEDOR1      VARCHAR2,
                    V_DIRECTA         VARCHAR2,
                    V_CONTRATISTA     VARCHAR2,
                    V_OBJETO          VARCHAR2,
                    V_FECHAINICIO     DATE,
                    V_PLAZO           VARCHAR2,
                    V_EXTERNO         VARCHAR2,
                    V_ACUERDO         VARCHAR2,
                    V_ACCION          VARCHAR2,
                    V_TIPO            VARCHAR2,
                    V_APODERADO       VARCHAR2,
                    v_cod_error       out number,
                    v_msg_error       out varchar2);

end PK_DIRECTORIO;
/

prompt
prompt Creating package PK_ESTADISTICAS
prompt ================================
prompt
create or replace package PK_ESTADISTICAS is

  -- Author  : Hugo Cendales P
  -- Created : 27/12/2013 11:01:43
  -- Purpose : Calcular estadisticas para operacion concesionada

  procedure est_CaducidadesPrescripciones(v_usuario      number,
                                          v_idmunicipio  varchar2,
                                          v_autoridad    varchar2,
                                          v_idReg        number,
                                          v_cod_error    out number,
                                          v_msg_error    out varchar2,
                                          v_numCaducado  out number,
                                          v_valCaducado  out number,
                                          v_numPrescrito out number,
                                          v_valPrescrito  out number);

  procedure est_Novedades(v_usuario         number,
                          v_idmunicipio     varchar2,
                          v_autoridad       varchar2,
                          v_fecIni          date,
                          v_fecFin          date,
                          v_cod_error       out number,
                          v_msg_error       out varchar2,
                          v_numComparendos  out number,
                          v_numResoluciones out number,
                          v_numRecaudos     out number);

  procedure est_Resoluciones(v_usuario     number,
                             v_idmunicipio varchar2,
                             v_autoridad   varchar2,
                             v_fecIni      date,
                             v_fecFin      date,
                             v_cod_error   out number,
                             v_msg_error   out varchar2,
                             v_numPre      out number,
                             v_numCad      out number,
                             v_numAbs      out number,
                             v_numRev      out number);

  procedure est_ResolucionesCoa(v_usuario     number,
                                v_idmunicipio varchar2,
                                v_autoridad   varchar2,
                                v_fecIni      date,
                                v_fecFin      date,
                                v_cod_error   out number,
                                v_msg_error   out varchar2,
                                v_numCoa      out number);

  procedure est_AlertasPrescripcion(v_usuario     number,
                                    v_idmunicipio varchar2,
                                    v_autoridad   varchar2,
                                    v_cod_error   out number,
                                    v_msg_error   out varchar2,
                                    v_numPres     out number);

  PROCEDURE darFechaCorteCaducidad(v_usuario    number,
                                   v_cod_error  out number,
                                   v_msg_error  out varchar2,
                                   v_fechaCorte out date);

  PROCEDURE darFechaCorteNovedad(v_usuario    number,
                                 v_cod_error  out number,
                                 v_msg_error  out varchar2,
                                 v_fechaCorte out date);

  PROCEDURE darFechaCorteRes(v_usuario    number,
                             v_cod_error  out number,
                             v_msg_error  out varchar2,
                             v_fechaCorte out date);

  PROCEDURE darFechaCorteCoa(v_usuario    number,
                             v_cod_error  out number,
                             v_msg_error  out varchar2,
                             v_fechaCorte out date);

  PROCEDURE darFechaCorteAle(v_usuario    number,
                             v_cod_error  out number,
                             v_msg_error  out varchar2,
                             v_fechaCorte out date);

  PROCEDURE reprocesoCad(v_usuario   number,
                         v_idReg     number,
                         v_cod_error out number,
                         v_msg_error out varchar2);

end PK_ESTADISTICAS;
/

prompt
prompt Creating package PK_EST_BATCH
prompt =============================
prompt
create or replace package PK_EST_BATCH is

  -- Author  : Hugo Cendales P
  -- Created : 27/12/2013 11:01:43
  -- Purpose : Calcular estadisticas para operacion concesionada

  procedure cal_CaducidadesPrescripciones;

  procedure cal_Novedades;

  procedure cal_Resoluciones;

  procedure cal_ResolucionesCoa;

  procedure cal_AlertasPres;

  procedure cal_Alertas(v_fechaIni  date,
                        v_fechaFin  date,
                        v_usuario   number,
                        v_cod_error out number,
                        v_msg_error out varchar2);

end PK_EST_BATCH;
/

prompt
prompt Creating package PK_PARAM
prompt =========================
prompt
create or replace package PK_PARAM is

  -- Author  : USER
  -- Created : 09/02/2011 15:50:24
  -- Purpose : Procedimientos para administracion de parametros
  MSG_UPD_OK VARCHAR2(255) := 'Registro Actualizado Correctamente';
  MSG_INS_OK VARCHAR2(255) := 'Registro Insertado Correctamente';
  MSG_DEL_OK VARCHAR2(255) := 'Registro Eliminado Correctamente';
  MSG_QUE_OK VARCHAR2(255) := 'Registro Consultado Correctamente';

  v_valida number;

  PROCEDURE i_cia(
                  
                  V_NIT                 VARCHAR2,
                  V_CODIGOCIARUNT       VARCHAR2,
                  V_NOMBRE              VARCHAR2,
                  V_DIRECCION           VARCHAR2,
                  V_TELEFONO1           NUMBER,
                  V_EXTENSION1          NUMBER,
                  V_TELEFONO2           NUMBER,
                  V_EXTENSION2          NUMBER,
                  V_NOMBRECONTACTO      VARCHAR2,
                  V_CELULARCONTACTO     NUMBER,
                  V_CORREOELECTRONICO   VARCHAR2,
                  V_PORCENTAJEINFRACTOR NUMBER,
                  V_PORCENTAJEFONDOADM  NUMBER,
                  V_FECINI              DATE,
                  V_FECFIN              DATE,
                  V_USUARIO             number,
                  V_ERROR               OUT VARCHAR2);

  PROCEDURE u_cia(V_NIT                 VARCHAR2,
                  V_CODIGOCIARUNT       VARCHAR2,
                  V_NOMBRE              VARCHAR2,
                  V_DIRECCION           VARCHAR2,
                  V_TELEFONO1           NUMBER,
                  V_EXTENSION1          NUMBER,
                  V_TELEFONO2           NUMBER,
                  V_EXTENSION2          NUMBER,
                  V_NOMBRECONTACTO      VARCHAR2,
                  V_CELULARCONTACTO     NUMBER,
                  V_CORREOELECTRONICO   VARCHAR2,
                  V_PORCENTAJEINFRACTOR NUMBER,
                  V_PORCENTAJEFONDOADM  NUMBER,
                  V_FECINI              DATE,
                  V_FECFIN              DATE,
                  V_USUARIO             number,
                  V_ERROR               OUT VARCHAR2);

  PROCEDURE d_cia(V_NIT VARCHAR2, v_usuario varchar2, v_error OUT VARCHAR2);

  PROCEDURE q_cia(V_NIT                 VARCHAR2,
                  V_CODIGOCIARUNT       OUT VARCHAR2,
                  V_NOMBRE              OUT VARCHAR2,
                  V_DIRECCION           OUT VARCHAR2,
                  V_TELEFONO1           OUT NUMBER,
                  V_EXTENSION1          OUT NUMBER,
                  V_TELEFONO2           OUT NUMBER,
                  V_EXTENSION2          OUT NUMBER,
                  V_NOMBRECONTACTO      OUT VARCHAR2,
                  V_CELULARCONTACTO     OUT NUMBER,
                  V_CORREOELECTRONICO   OUT VARCHAR2,
                  V_PORCENTAJEINFRACTOR OUT NUMBER,
                  V_PORCENTAJEFONDOADM  OUT NUMBER,
                  V_FECINI              OUT DATE,
                  V_FECFIN              OUT DATE,
                  V_USUARIO             number,
                  V_ERROR               OUT VARCHAR2
                  
                  );

  PROCEDURE i_municipioCia(V_IDMUNICIPIO VARCHAR2,
                           V_NITCIA      VARCHAR2,
                           V_USUARIO     number,
                           V_ERROR       OUT VARCHAR2);

  PROCEDURE d_municipioCia(V_IDMUNICIPIO VARCHAR2,
                           V_NITCIA      VARCHAR2,
                           V_USUARIO     number,
                           V_ERROR       OUT VARCHAR2);

  PROCEDURE q_descuento(V_USUARIO       number,
                        v_valor5        out number,
                        v_valor20       out number,
                        v_valor21       out number,
                        v_valor16mar    out number,
                        v_fecha16mar    out date,
                        v_fechafin16mar out date,
                        v_fechavendesc  out date,
                        v_pinfractor    out number,
                        v_dia5          out number,
                        v_dia20         out number,
                        V_ERROR         OUT VARCHAR2);

  PROCEDURE u_descuento(v_valor5        number,
                        v_valor20       number,
                        v_valor21       number,
                        v_valor16mar    number,
                        v_fecha16mar    date,
                        v_fechafin16mar date,
                        v_fechavendesc  date,
                        v_pinfractor    number,
                        v_dia5          number,
                        v_dia20         number,
                        V_USUARIO       number,
                        V_ERROR         OUT VARCHAR2);

  PROCEDURE q_fcm(V_NIT_FCM             OUT VARCHAR2,
                  V_CORREO              OUT VARCHAR2,
                  V_SEGURIDAD_INTEGRADA OUT NUMBER,
                  V_URL_SEGURIDAD       OUT VARCHAR2,
                  V_SERVIDORSMTP        OUT VARCHAR2,
                  V_CLASEDOCUMENTO      OUT VARCHAR2,
                  V_SOCIEDAD            OUT VARCHAR2,
                  V_MONEDAD             OUT VARCHAR2,
                  V_CUENTADEBLIQ        OUT VARCHAR2,
                  V_CUENTACRELIQ        OUT VARCHAR2,
                  V_CUENTADEBCON        OUT VARCHAR2,
                  V_CUENTACRECON        OUT VARCHAR2,
                  V_CUENTADEBPAG        OUT VARCHAR2,
                  V_CUENTACREPAG        OUT VARCHAR2,
                  V_CUENTAPUEPAG        OUT VARCHAR2,
                  V_CUENTAGASTO         OUT VARCHAR2,
                  V_CUENTAINGRESO       OUT VARCHAR2,
                  V_CUENTAPASIVO        OUT VARCHAR2,
                  V_DEBUG               OUT NUMBER,
                  V_USUARIO             NUMBER,
                  V_ERROR               OUT VARCHAR2);

  PROCEDURE u_fcm(V_NIT_FCM             VARCHAR2,
                  V_CORREO              VARCHAR2,
                  V_SEGURIDAD_INTEGRADA NUMBER,
                  V_URL_SEGURIDAD       VARCHAR2,
                  V_SERVIDORSMTP        VARCHAR2,
                  V_CLASEDOCUMENTO      CHAR,
                  V_SOCIEDAD            CHAR,
                  V_MONEDAD             CHAR,
                  V_CUENTADEBLIQ        CHAR,
                  V_CUENTACRELIQ        CHAR,
                  V_CUENTADEBCON        CHAR,
                  V_CUENTACRECON        CHAR,
                  V_CUENTADEBPAG        CHAR,
                  V_CUENTACREPAG        CHAR,
                  V_CUENTAPUEPAG        CHAR,
                  V_CUENTAGASTO         CHAR,
                  V_CUENTAINGRESO       CHAR,
                  V_CUENTAPASIVO        CHAR,
                  V_DEBUG               NUMBER,
                  V_USUARIO             NUMBER,
                  V_ERROR               OUT VARCHAR2);

  PROCEDURE i_ipvalida(V_IPPERMITIDA VARCHAR2,
                       V_CODIGOCIA   VARCHAR2,
                       V_USUARIO     number,
                       V_ERROR       OUT VARCHAR2);

  PROCEDURE d_ipvalida(V_CODIGOCIA   VARCHAR2,
                       V_IPPERMITIDA VARCHAR2,
                       V_USUARIO     number,
                       V_ERROR       OUT VARCHAR2);

end PK_PARAM;
/

prompt
prompt Creating package PK_PROC
prompt ========================
prompt
create or replace package PK_PROC is

  -- Author  : USER
  -- Created : 23/03/2011 17:02:50
  -- Purpose :

  -- Public function and procedure declarations
  PROCEDURE i_archivo(p_filename varchar2,
                      p_cfile    clob,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);
  PROCEDURE v_archivo(p_uploadid number,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);

  PROCEDURE cargarCia(p_uploadid NUMBER,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2);

  PROCEDURE i_archivoCon(p_periodo  varchar2,
                         p_filename varchar2,
                         p_cfile    clob,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);

  PROCEDURE v_archivoCon(p_periodo  varchar2,
                         p_uploadid number,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);

  PROCEDURE cargarCiaCon(p_periodo  varchar2,
                         p_uploadid NUMBER,
                         p_usuario  varchar2,
                         p_error    OUT VARCHAR2);

  PROCEDURE conciliar(p_periodo varchar2,
                      p_usuario varchar2,
                      p_error   OUT VARCHAR2);

end PK_PROC;
/

prompt
prompt Creating package PK_PUNTOATEN
prompt =============================
prompt
create or replace package PK_PUNTOATEN is

  PROCEDURE a_punto(v_idmunicipio       varchar2,
                    v_sector            VARCHAR2,
                    v_direccion         VARCHAR2,
                    v_horario           VARCHAR2,
                    v_contactomovil1    VARCHAR2,
                    v_contactomovil2    VARCHAR2,
                    v_telefono1         VARCHAR2,
                    v_telefono2         VARCHAR2,
                    v_correoelectronico VARCHAR2,
                    v_usuario           number,
                    v_cod_error         out number,
                    v_msg_error         out varchar2);

  PROCEDURE m_punto(v_idmunicipio       varchar2,
                    v_sector            VARCHAR2,
                    v_direccion         VARCHAR2,
                    v_horario           VARCHAR2,
                    v_contactomovil1    VARCHAR2,
                    v_contactomovil2    VARCHAR2,
                    v_telefono1         VARCHAR2,
                    v_telefono2         VARCHAR2,
                    v_correoelectronico VARCHAR2,
                    v_idReg             number,
                    v_usuario           number,
                    v_cod_error         out number,
                    v_msg_error         out varchar2);

  PROCEDURE d_punto(v_idReg     number,
                    v_usuario   number,
                    v_cod_error out number,
                    v_msg_error out varchar2);

end PK_PUNTOATEN;
/

prompt
prompt Creating package PK_RPTDEUDA
prompt ============================
prompt
create or replace package PK_RPTDEUDA is

  LIMITE_REG number := 1000;

  TYPE TOKEN_LIST is varray(500) of varchar2(50);

  PROCEDURE numRecLocRep(v_municipio varchar2,
                         v_indpolca  varchar2,
                         v_feccorte  varchar2,
                         v_fecini    date,
                         v_usuario   number,
                         v_cod_error out number,
                         v_msg_error out varchar2,
                         v_numReg    out number,
                         v_limite    out number);

  PROCEDURE numRecLocRepCargue(v_municipio varchar2,
                               v_indpolca  varchar2,
                               v_feccorte  varchar2,
                               v_fecini    date,
                               v_usuario   number,
                               v_cod_error out number,
                               v_msg_error out varchar2,
                               v_numReg    out number,
                               v_limite    out number);

  PROCEDURE arc_numRecLocRep(v_municipio  varchar2,
                             v_indpolca   varchar2,
                             v_feccorte   varchar2,
                             v_fecini     date,
                             v_usuario    number,
                             v_cod_error  out number,
                             v_msg_error  out varchar2,
                             v_nomArchivo out varchar2,
                             v_archivoZip out blob);

  /*PROCEDURE arc_numRecLocRepFormato(v_municipio  varchar2,
                               v_indpolca   varchar2,
                               v_feccorte   varchar2,
                               v_fecini     date,
                               v_usuario    number,
                               v_cod_error  out number,
                               v_msg_error  out varchar2,
                               v_nomArchivo out varchar2,
                               v_archivoZip out blob);
  */
  PROCEDURE arc_numRecLocRepCargue(v_municipio  varchar2,
                                   v_indpolca   varchar2,
                                   v_feccorte   varchar2,
                                   v_fecini     date,
                                   v_usuario    number,
                                   v_cod_error  out number,
                                   v_msg_error  out varchar2,
                                   v_nomArchivo out varchar2,
                                   v_archivoZip out blob);

  PROCEDURE arc_numRecLocRepCon(v_concesionario varchar2,
                                v_indpolca      varchar2,
                                v_feccorte      varchar2,
                                v_fecini        date,
                                v_usuario       number,
                                v_cod_error     out number,
                                v_msg_error     out varchar2,
                                v_nomArchivo    out varchar2,
                                v_archivoZip    out blob);

  PROCEDURE arc_numRecLocRepConCargue(v_concesionario varchar2,
                                      v_indpolca      varchar2,
                                      v_feccorte      varchar2,
                                      v_fecini        date,
                                      v_usuario       number,
                                      v_cod_error     out number,
                                      v_msg_error     out varchar2,
                                      v_nomArchivo    out varchar2,
                                      v_archivoZip    out blob);

  PROCEDURE arc_numRecLocRepDep(v_departamento varchar2,
                                v_indpolca     varchar2,
                                v_feccorte     varchar2,
                                v_fecini       date,
                                v_usuario      number,
                                v_cod_error    out number,
                                v_msg_error    out varchar2,
                                v_nomArchivo   out varchar2,
                                v_archivoZip   out blob);

  PROCEDURE arc_numRecLocRepDepCargue(v_departamento varchar2,
                                      v_indpolca     varchar2,
                                      v_feccorte     varchar2,
                                      v_fecini       date,
                                      v_usuario      number,
                                      v_cod_error    out number,
                                      v_msg_error    out varchar2,
                                      v_nomArchivo   out varchar2,
                                      v_archivoZip   out blob);

  PROCEDURE numComRep(v_municipio varchar2,
                      v_usuario   number,
                      v_cod_error out number,
                      v_msg_error out varchar2,
                      v_numReg    out number,
                      v_limite    out number);

  PROCEDURE arc_comRep(v_municipio  varchar2,
                       v_usuario    number,
                       v_cod_error  out number,
                       v_msg_error  out varchar2,
                       v_nomArchivo out varchar2,
                       v_archivoZip out blob);

  PROCEDURE numTrfRep(v_municipio varchar2,
                      v_indpolca  varchar2,
                      v_feccorte  varchar2,
                      v_fecini    date,
                      v_usuario   number,
                      v_cod_error out number,
                      v_msg_error out varchar2,
                      v_numReg    out number,
                      v_limite    out number);

  PROCEDURE numTrfRepAll(v_municipio varchar2,
                         v_indpolca  varchar2,
                         v_feccorte  varchar2,
                         v_fecini    date,
                         v_usuario   number,
                         v_cod_error out number,
                         v_msg_error out varchar2,
                         v_numReg    out number,
                         v_limite    out number);

  PROCEDURE numTrfRepVig(v_municipio varchar2,
                         v_indpolca  varchar2,
                         v_feccorte  varchar2,
                         v_fecini    date,
                         v_usuario   number,
                         v_cod_error out number,
                         v_msg_error out varchar2,
                         v_numReg    out number,
                         v_limite    out number);

  PROCEDURE arc_trfRep(v_municipio  varchar2,
                       v_indpolca   varchar2,
                       v_feccorte   varchar2,
                       v_fecini     date,
                       v_usuario    number,
                       v_cod_error  out number,
                       v_msg_error  out varchar2,
                       v_nomArchivo out varchar2,
                       v_archivoZip out blob);

  PROCEDURE arc_trfRepAll(v_municipio  varchar2,
                          v_indpolca   varchar2,
                          v_feccorte   varchar2,
                          v_fecini     date,
                          v_usuario    number,
                          v_cod_error  out number,
                          v_msg_error  out varchar2,
                          v_nomArchivo out varchar2,
                          v_archivoZip out blob);

  PROCEDURE arc_trfRepVig(v_municipio  varchar2,
                          v_indpolca   varchar2,
                          v_feccorte   varchar2,
                          v_fecini     date,
                          v_usuario    number,
                          v_cod_error  out number,
                          v_msg_error  out varchar2,
                          v_nomArchivo out varchar2,
                          v_archivoZip out blob);

  PROCEDURE arc_trfRepDep(v_departamento varchar2,
                          v_indpolca     varchar2,
                          v_feccorte     varchar2,
                          v_fecini       date,
                          v_usuario      number,
                          v_cod_error    out number,
                          v_msg_error    out varchar2,
                          v_nomArchivo   out varchar2,
                          v_archivoZip   out blob);

  PROCEDURE arc_trfRepDepAll(v_departamento varchar2,
                             v_indpolca     varchar2,
                             v_feccorte     varchar2,
                             v_fecini       date,
                             v_usuario      number,
                             v_cod_error    out number,
                             v_msg_error    out varchar2,
                             v_nomArchivo   out varchar2,
                             v_archivoZip   out blob);

  PROCEDURE arc_trfRepDepVig(v_departamento varchar2,
                             v_indpolca     varchar2,
                             v_feccorte     varchar2,
                             v_fecini       date,
                             v_usuario      number,
                             v_cod_error    out number,
                             v_msg_error    out varchar2,
                             v_nomArchivo   out varchar2,
                             v_archivoZip   out blob);

  PROCEDURE arc_trfRepCon(v_concesionario varchar2,
                          v_indpolca      varchar2,
                          v_feccorte      varchar2,
                          v_fecini        date,
                          v_usuario       number,
                          v_cod_error     out number,
                          v_msg_error     out varchar2,
                          v_nomArchivo    out varchar2,
                          v_archivoZip    out blob);

  PROCEDURE arc_trfRepConAll(v_concesionario varchar2,
                             v_indpolca      varchar2,
                             v_feccorte      varchar2,
                             v_fecini        date,
                             v_usuario       number,
                             v_cod_error     out number,
                             v_msg_error     out varchar2,
                             v_nomArchivo    out varchar2,
                             v_archivoZip    out blob);

  PROCEDURE arc_trfRepConVig(v_concesionario varchar2,
                             v_indpolca      varchar2,
                             v_feccorte      varchar2,
                             v_fecini        date,
                             v_usuario       number,
                             v_cod_error     out number,
                             v_msg_error     out varchar2,
                             v_nomArchivo    out varchar2,
                             v_archivoZip    out blob);

  PROCEDURE ajustarDptal(v_municipio      varchar2,
                         v_cod_error      out number,
                         v_msg_error      out varchar2,
                         v_municipioDptal out varchar2);

  FUNCTION TOKENIZE(str varchar2, delim char) return token_list;

  PROCEDURE arc_recLocTotal(v_idConcesionario varchar2,
                            v_indpolca        varchar2,
                            v_feccorte        date,
                            v_usuario         number,
                            v_cod_error       out number,
                            v_msg_error       out varchar2);
  PROCEDURE arc_RecLocMun(v_municipio  varchar2,
                          v_indpolca   varchar2,
                          v_feccorte   varchar2,
                          v_fecini     date,
                          v_usuario    number,
                          v_cod_error  out number,
                          v_msg_error  out varchar2,
                          v_nomArchivo out varchar2,
                          v_archivoZip out blob);

  PROCEDURE arc_RecLocDpt(v_departamento varchar2,
                          v_indpolca     varchar2,
                          v_feccorte     varchar2,
                          v_fecini       date,
                          v_usuario      number,
                          v_cod_error    out number,
                          v_msg_error    out varchar2,
                          v_nomArchivo   out varchar2,
                          v_archivoZip   out blob);

  PROCEDURE arc_RecLocCon(v_concesionario varchar2,
                          v_indpolca      varchar2,
                          v_feccorte      varchar2,
                          v_fecini        date,
                          v_usuario       number,
                          v_cod_error     out number,
                          v_msg_error     out varchar2,
                          v_nomArchivo    out varchar2,
                          v_archivoZip    out blob);

end PK_RPTDEUDA;
/

prompt
prompt Creating package PK_SERVICIOS
prompt =============================
prompt
create or replace package pk_servicios is

  -- Author  : USER
  -- Created : 16/12/2010 18:03:11
  -- Purpose : Soporta los web services Simit - Cia
  TYPE T_CURSOR IS REF CURSOR;

  MSG_OK VARCHAR2(255) := 'Operacion correcta';
  COD_OK number := 0;

  PROCEDURE comparendos_descuento(p_fechaTransaccion        varchar2,
                                  p_horaTransaccion         varchar2,
                                  p_numeroSecuencia         varchar2,
                                  p_codigoTransaccion       varchar2,
                                  p_direccionAdquiriente    varchar2,
                                  p_codigoCia               varchar2,
                                  p_ciudadCia               varchar2,
                                  p_codigoSedeCia           varchar2,
                                  p_funcionarioConsulta     varchar2,
                                  p_tipoIdentificacion      varchar2,
                                  p_identificacionInfractor varchar2,

                                  p_codigoRespuesta  out varchar2,
                                  p_mensajeRespuesta out varchar2,
                                  p_nombreInfractor  out varchar2,
                                  p_numAutorizacion  out varchar2,
                                  p_comparendos      out T_CURSOR);

  PROCEDURE pago_cia(p_fechaTransaccion        varchar2,
                     p_horaTransaccion         varchar2,
                     p_numeroSecuencia         varchar2,
                     p_direccionAdquiriente    varchar2,
                     p_codigoTransaccion       varchar2,
                     p_codigoCia               varchar2,
                     p_ciudadCia               varchar2,
                     p_codigoSedeCia           varchar2,
                     p_codigoCurso             varchar2,
                     p_funcionarioPago         varchar2,
                     p_tipoIdentificacion      varchar2,
                     p_identificacionInfractor varchar2,
                     p_fechaPago               varchar2,
                     p_fechaProgCurso          varchar2,
                     p_horaProgCurso           varchar2,
                     p_numeroComparendo        varchar2,
                     p_numeroResolucion        varchar2,
                     p_fechaComparendo         varchar2,
                     p_tipoComparendo          varchar2,
                     p_valorInfraccion         varchar2,
                     p_porcentajeDescuento     varchar2,
                     p_valorCia                varchar2,
                     p_organismoTransito       varchar2,
                     p_referenciaDescuento     varchar2,

                     p_codigoRespuesta  out varchar2,
                     p_mensajeRespuesta out varchar2,
                     p_numAutorizacion  out varchar2);

  PROCEDURE curso_cia(p_fechaTransaccion         varchar2,
                      p_horaTransaccion          varchar2,
                      p_numeroSecuencia          varchar2,
                      p_direccionAdquiriente     varchar2,
                      p_codigoTransaccion        varchar2,
                      p_codigoCia                varchar2,
                      p_ciudadCia                varchar2,
                      p_codigoSedeCia            varchar2,
                      p_codigoCurso              varchar2,
                      p_funcionarioRegistra      varchar2,
                      p_tipoIdentificacion       varchar2,
                      p_identificacionInfractor  varchar2,
                      p_fechaRealizacionCurso    varchar2,
                      p_horaInicioCurso          varchar2,
                      p_horaFinCurso             varchar2,
                      p_identificacionInstructor varchar2,
                      p_numeroComparendo         varchar2,
                      p_numeroResolucion         varchar2,
                      p_fechaComparendon         varchar2,
                      p_numeroCertificado        varchar2,
                      p_tipoComparendo           varchar2,
                      p_organismoTransito        varchar2,
                      p_referenciaDescuento      varchar2,

                      p_codigoRespuesta  out varchar2,
                      p_mensajeRespuesta out varchar2,
                      p_numAutorizacion  out varchar2);

  PROCEDURE pagoCurso_cia(p_fechaTransaccion     varchar2,
                          p_horaTransaccion      varchar2,
                          p_numeroSecuencia      varchar2,
                          p_direccionAdquiriente varchar2,
                          p_codigoTransaccion    varchar2,

                          p_codigoCia          varchar2,
                          p_ciudadCia          varchar2,
                          p_codigoSedeCia      varchar2,
                          p_funcionarioReporta varchar2,

                          p_tipoIdentificacion      varchar2,
                          p_identificacionInfractor varchar2,

                          p_codigoCurso              varchar2,
                          p_fechaPago                varchar2,
                          p_fechaProgCurso           varchar2,
                          p_horaProgCurso            varchar2,
                          p_fechaRealizacionCurso    varchar2,
                          p_horaInicioCurso          varchar2,
                          p_horaFinCurso             varchar2,
                          p_identificacionInstructor varchar2,
                          p_numeroCertificado        varchar2,

                          p_numeroComparendo    varchar2,
                          p_numeroResolucion    varchar2,
                          p_fechaComparendo     varchar2,
                          p_tipoComparendo      varchar2,
                          p_organismoTransito   varchar2,
                          p_referenciaDescuento varchar2,
                          p_valorInfraccion     varchar2,
                          p_porcentajeDescuento varchar2,
                          p_valorCia            varchar2,

                          p_codigoRespuesta  out varchar2,
                          p_mensajeRespuesta out varchar2,
                          p_numAutorizacion  out varchar2);

end pk_servicios;
/

prompt
prompt Creating type TOKEN_LIST
prompt ========================
prompt
CREATE OR REPLACE TYPE "TOKEN_LIST" is varray(100) of varchar2(1500)
/

prompt
prompt Creating function FN_TOKEN
prompt ==========================
prompt
CREATE OR REPLACE FUNCTION "FN_TOKEN" (c varchar2, x in out int) return varchar2 is
  Result varchar2(32767);
  y int;
begin
  y:= Instr(c, ',', x, 1);

  if ( y = 0    ) then
    y:= Instr(c, ';', x, 1);
  end if;

  Result := Substr(c, x, y-x);
  x:=y+1;
  return(Result);

end fn_token;
/

prompt
prompt Creating function SHELL_RUN
prompt ===========================
prompt
CREATE OR REPLACE FUNCTION "SHELL_RUN" (Command IN STRING)
RETURN VARCHAR2 IS
LANGUAGE JAVA
NAME 'Shell.Run(java.lang.String) return String';
/

prompt
prompt Creating function SPLITTER_COUNT
prompt ================================
prompt
create or replace function splitter_count(str in varchar2, delim in char) return int as
val int;
begin
  val := length(replace(str, delim, delim || ' '));
  return val - length(str);
end;
/

prompt
prompt Creating function TOKENIZE
prompt ==========================
prompt
create or replace function tokenize (str varchar2, delim char) return token_list as
ret token_list;
target int;
i int;
this_delim int;
last_delim int;
cadena varchar2(100);
cadenaOri varchar2(100);
strFin varchar(1000);

BEGIN

  strFin := str;
  target := splitter_count(str, '"');
  i := 1;

  if ( target > 1 ) then
  while i <= target
  loop
      this_delim := instr(str, '"', 1, i);
      last_delim := instr(str, '"', 1, i+1);
      cadena := substr(str,this_delim+1,last_delim - this_delim -1);
      cadenaOri := substr(str,this_delim,last_delim - this_delim + 1);
      cadena := replace(cadena,',','');
      cadena := replace(cadena,'$','');


      strFin := replace(str,cadenaOri, cadena);

      i := i + 2;

  end loop;

  end if;


  ret := token_list();

  i := 1;
  last_delim := 0;
  target := splitter_count(strFin, delim);
  while i <= target
  loop
    ret.extend();
    this_delim := instr(strFin, delim, 1, i);
    ret(i):= substr(strFin, last_delim + 1, this_delim - last_delim -1);
    i := i + 1;
    last_delim := this_delim;
  end loop;
  ret.extend();
  ret(i):= substr(strFin, last_delim + 1);
  return ret;
end;
/

prompt
prompt Creating procedure EJECUTA_PROCESOS
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE "EJECUTA_PROCESOS" IS
begin
 simitcurso.pk_est_batch.cal_caducidadesprescripciones;
 simitcurso.pk_est_batch.cal_novedades;
 simitcurso.pk_est_batch.cal_resoluciones;
 simitcurso.pk_est_batch.cal_resolucionescoa;
 simitcurso.pk_est_batch.cal_alertaspres;
END;
/

prompt
prompt Creating procedure SP_EX
prompt ========================
prompt
CREATE OR REPLACE PROCEDURE "SP_EX" (p_sqlcode number,
                                  p_message varchar2,
                                  p_error   OUT VARCHAR2) is
  v_id_errors NUMBER;
begin
  SELECT seq_errors.NEXTVAL INTO v_id_errors FROM dual;

  p_error := p_message;

  insert into errors
    (id_errors, fecha, sqlcode, message)
  values
    (v_id_errors, sysdate, p_sqlcode, p_message);
  COMMIT;

  if (p_sqlcode = -2292) then
    p_error := 'No se puede eliminar registro por que esta referenciado';
  end if;

  if (p_sqlcode = -1) then
    p_error := 'Registro existente';
  end if;

end sp_EX;
/

prompt
prompt Creating procedure SP_LOG
prompt =========================
prompt
CREATE OR REPLACE PROCEDURE "SP_LOG"(p_usuario varchar2,
                                     p_proceso varchar2,
                                     p_accion  varchar2) is
  v_debug  number;
  v_numreg number;
begin

  select count(*) into v_numreg from fcm;

  if (v_numreg > 0) then

    select debug into v_debug from fcm;

  else
    v_debug := 0;
  end if;

  if (v_debug = 1) then

    insert into log
      (fecha, usuario, proceso, accion)
    values
      (sysdate, p_usuario, p_proceso, p_accion);

  end if;

end sp_log;
/

prompt
prompt Creating procedure SP_V_USUARIO
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE "SP_V_USUARIO" (p_usuario varchar2, p_error OUT VARCHAR2, p_modulo VARCHAR2) is
  v_valida    NUMBER;
  w_usuario  number;
begin
  w_usuario := TO_NUMBER(p_usuario);

   select COUNT(*) INTO v_valida from person p WHERE p.idperson = w_usuario;

   IF v_valida = 0 THEN
     p_error := 'El usuario no existe';
     return;
  end if;

   If upper(p_modulo) = 'PK_PROC' THEN
     RETURN;
     END IF;

   select COUNT(*) INTO v_valida
   from rolxperson rp, rol r
   WHERE rp.personid = w_usuario
     and rp.rolid = r.rolid
     and r.enablemod = 1;


  IF v_valida = 0 THEN
     p_error := 'El usuario no puede realizar la accion';
     return;
  end if;



end sp_v_usuario;
/

prompt
prompt Creating package body PK_ACUERDO
prompt ================================
prompt
/* Source of PACKAGE BODY PK_ACUERDO is not available */

prompt
prompt Creating package body PK_AUTEN
prompt ==============================
prompt
/* Source of PACKAGE BODY PK_AUTEN is not available */

prompt
prompt Creating package body PK_BATCH
prompt ==============================
prompt
/* Source of PACKAGE BODY PK_BATCH is not available */

prompt
prompt Creating package body PK_COMPARENDOS
prompt ====================================
prompt
/* Source of PACKAGE BODY PK_COMPARENDOS is not available */

prompt
prompt Creating package body PK_CONTA
prompt ==============================
prompt
/* Source of PACKAGE BODY PK_CONTA is not available */

prompt
prompt Creating package body PK_DEUDA
prompt ==============================
prompt
/* Source of PACKAGE BODY PK_DEUDA is not available */

prompt
prompt Creating package body PK_DEUDAPAR
prompt =================================
prompt
/* Source of PACKAGE BODY PK_DEUDAPAR is not available */

prompt
prompt Creating package body PK_DIRECTORIO
prompt ===================================
prompt
/* Source of PACKAGE BODY PK_DIRECTORIO is not available */

prompt
prompt Creating package body PK_ESTADISTICAS
prompt =====================================
prompt
/* Source of PACKAGE BODY PK_ESTADISTICAS is not available */

prompt
prompt Creating package body PK_EST_BATCH
prompt ==================================
prompt
/* Source of PACKAGE BODY PK_EST_BATCH is not available */

prompt
prompt Creating package body PK_PARAM
prompt ==============================
prompt
/* Source of PACKAGE BODY PK_PARAM is not available */

prompt
prompt Creating package body PK_PROC
prompt =============================
prompt
/* Source of PACKAGE BODY PK_PROC is not available */

prompt
prompt Creating package body PK_PUNTOATEN
prompt ==================================
prompt
/* Source of PACKAGE BODY PK_PUNTOATEN is not available */

prompt
prompt Creating package body PK_RPTDEUDA
prompt =================================
prompt
/* Source of PACKAGE BODY PK_RPTDEUDA is not available */

prompt
prompt Creating package body PK_SERVICIOS
prompt ==================================
prompt
/* Source of PACKAGE BODY PK_SERVICIOS is not available */


spool off
