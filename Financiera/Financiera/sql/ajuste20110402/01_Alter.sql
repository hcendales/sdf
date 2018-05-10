-- Add/modify columns 
alter table RECAUDO_EXTERNO_LIQUIDACION add idbancoMun char(2);
alter table RECAUDO_EXTERNO_LIQUIDACION add tipoCuentaMun char(3);
alter table RECAUDO_EXTERNO_LIQUIDACION add ctaMun varchar2(250);
-- Add comments to the columns 
comment on column RECAUDO_EXTERNO_LIQUIDACION.idbancoMun
  is 'Banco de consignacion del municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.tipoCuentaMun
  is 'Tipo cuenta consignacion municipio';
comment on column RECAUDO_EXTERNO_LIQUIDACION.ctaMun
  is 'Cuenta de consignacion municipio';

-- Add/modify columns 
alter table RECAUDO_LOCAL_AJUSTES add motivo VARCHAR2(500);
-- Add comments to the columns 
comment on column RECAUDO_LOCAL_AJUSTES.motivo
  is 'Motivo del ajuste';

create table REPROCESO
(
  FECHAREG DATE not null,
  FECHA    DATE,
  TIPO     CHAR(1),
  USUARIO  NUMBER,
  MOTIVO   VARCHAR2(500)
)
;
comment on column REPROCESO.FECHAREG
  is 'Fecha en la que se registro el reproceso';
comment on column REPROCESO.FECHA
  is 'Fecha a reprocesar';
comment on column REPROCESO.TIPO
  is 'Tipo de reproceso';
comment on column REPROCESO.USUARIO
  is 'Usuario que autoriza el reproceso';
comment on column REPROCESO.MOTIVO
  is 'Motivo del reproceso';
alter table REPROCESO
  add constraint PK_REPROCESO primary key (FECHAREG);

create table SOPORTEAJUSTESRECLOC
(
  ID_RECAUDO_LOCAL_AJUSTES NUMBER,
  ID_DOCUMENTO             NUMBER not null,
  NOMBREDOCUMENTO          VARCHAR2(500),
  NOMBREARCHIVO            VARCHAR2(1000),
  EXTENSIONARCHIVO         VARCHAR2(10),
  DATOSARCHIVO             BLOB,
  USUARIOCARGUE            NUMBER,
  FECHACARGUE              DATE
)
;
comment on column SOPORTEAJUSTESRECLOC.ID_RECAUDO_LOCAL_AJUSTES
  is 'identificacion Ajsute recaudo local';
comment on column SOPORTEAJUSTESRECLOC.ID_DOCUMENTO
  is 'numero de documento';
comment on column SOPORTEAJUSTESRECLOC.NOMBREDOCUMENTO
  is 'nombre documento';
comment on column SOPORTEAJUSTESRECLOC.NOMBREARCHIVO
  is 'nombre del archivo';
comment on column SOPORTEAJUSTESRECLOC.EXTENSIONARCHIVO
  is 'extencion del archivo';
comment on column SOPORTEAJUSTESRECLOC.DATOSARCHIVO
  is 'contenido del archivo';
comment on column SOPORTEAJUSTESRECLOC.USUARIOCARGUE
  is 'usuario que carga';
comment on column SOPORTEAJUSTESRECLOC.FECHACARGUE
  is 'fecha de carga';
alter table SOPORTEAJUSTESRECLOC
  add constraint PK_SOPORTEAJUSTERECLOC primary key (ID_DOCUMENTO);
alter table SOPORTEAJUSTESRECLOC
  add constraint FK_AJUSTERECLOC foreign key (ID_RECAUDO_LOCAL_AJUSTES)
  references RECAUDO_LOCAL_AJUSTES (ID_RECAUDO_LOCAL_AJUSTES);  
  
create table CONCEPTOSIDENTIFICAR
(
  IDBANCO  CHAR(2),
  CONCEPTO VARCHAR2(500)
)
;
comment on column CONCEPTOSIDENTIFICAR.IDBANCO
  is 'banco';
comment on column CONCEPTOSIDENTIFICAR.CONCEPTO
  is 'concepto a filtrar';

  
create table MVTOAGRARIO
(
  NUMEROCUENTA          VARCHAR2(16),
  PERIODO               CHAR(6),
  FECHA                 DATE,
  CODIGOTRANSACCION     VARCHAR2(50),
  DESCRIPCIONMOVIMIENTO VARCHAR2(250),
  REFERENCIA            VARCHAR2(50),
  DEBITO                NUMBER,
  CREDITO               NUMBER,
  IMPUESTOGMF           NUMBER,
  OFICINA               VARCHAR2(250),
  NUMEROTRX             NUMBER
)
;
comment on column MVTOAGRARIO.NUMEROCUENTA
  is 'numero de cuenta';
comment on column MVTOAGRARIO.PERIODO
  is 'periodo de mvto';
comment on column MVTOAGRARIO.FECHA
  is 'fecha mvtos';
comment on column MVTOAGRARIO.CODIGOTRANSACCION
  is 'codigo transaccion';
comment on column MVTOAGRARIO.DESCRIPCIONMOVIMIENTO
  is 'descripcion movimiento';
comment on column MVTOAGRARIO.REFERENCIA
  is 'referencia';
comment on column MVTOAGRARIO.DEBITO
  is 'valor debito';
comment on column MVTOAGRARIO.CREDITO
  is 'valor credito';
comment on column MVTOAGRARIO.IMPUESTOGMF
  is 'valor gmf';
comment on column MVTOAGRARIO.OFICINA
  is 'nombre oficina mvto';
comment on column MVTOAGRARIO.NUMEROTRX
  is 'numero de transaccion';

create table MVTOAGRARIO_TEMP
(
  NUMEROCUENTA          VARCHAR2(16),
  PERIODO               CHAR(6),
  FECHA                 DATE,
  CODIGOTRANSACCION     VARCHAR2(50),
  DESCRIPCIONMOVIMIENTO VARCHAR2(250),
  REFERENCIA            VARCHAR2(50),
  DEBITO                NUMBER,
  CREDITO               NUMBER,
  IMPUESTOGMF           NUMBER,
  OFICINA               VARCHAR2(250)
)
;

create table MVTOAVVILLAS
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  FECHAAPLICACION  DATE,
  FECHATRANSACCION DATE,
  DESCRIPCION      VARCHAR2(250),
  DOCUMENTO        VARCHAR2(20),
  ORIGEN           VARCHAR2(250),
  VALORTOTAL       NUMBER,
  VALOREFECTIVO    NUMBER,
  VALORCHEQUE      NUMBER,
  DEBITOCREDITO    VARCHAR2(5),
  CODIGOTRN        VARCHAR2(50),
  NUMEROTRX        NUMBER
)
;
comment on column MVTOAVVILLAS.NUMEROCUENTA
  is 'numero cuenta';
comment on column MVTOAVVILLAS.PERIODO
  is 'fecha del periodo';
comment on column MVTOAVVILLAS.FECHAAPLICACION
  is 'fecha de aplicacion';
comment on column MVTOAVVILLAS.FECHATRANSACCION
  is 'fecha de transaccion';
comment on column MVTOAVVILLAS.DESCRIPCION
  is 'descripcion transaccion';
comment on column MVTOAVVILLAS.DOCUMENTO
  is 'documento de la operacion';
comment on column MVTOAVVILLAS.ORIGEN
  is 'oficina origen de la transaccion';
comment on column MVTOAVVILLAS.VALORTOTAL
  is 'valor total';
comment on column MVTOAVVILLAS.VALOREFECTIVO
  is 'valor efectivo';
comment on column MVTOAVVILLAS.VALORCHEQUE
  is 'valor cheque';
comment on column MVTOAVVILLAS.DEBITOCREDITO
  is 'debito o credito';
comment on column MVTOAVVILLAS.CODIGOTRN
  is 'codigo transaccion';
comment on column MVTOAVVILLAS.NUMEROTRX
  is 'numero de transaccion';

create table MVTOAVVILLAS_TEMP
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  FECHAAPLICACION  DATE,
  FECHATRANSACCION DATE,
  DESCRIPCION      VARCHAR2(250),
  DOCUMENTO        VARCHAR2(20),
  ORIGEN           VARCHAR2(250),
  VALORTOTAL       NUMBER,
  VALOREFECTIVO    NUMBER,
  VALORCHEQUE      NUMBER,
  DEBITOCREDITO    VARCHAR2(5),
  CODIGOTRN        VARCHAR2(50)
)
;

create table MVTOBANCAFE
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  TIPODOC          CHAR(1),
  NUMERODOCUMENTO  VARCHAR2(16),
  CODIGOAPLICACION CHAR(1),
  NUMEROCTA        VARCHAR2(16),
  FECHAPROCESO     DATE,
  FECHATRX         DATE,
  CODIGOTRX        CHAR(4),
  DESCRIPCIONTRX   VARCHAR2(250),
  OFICINASEDE      CHAR(5),
  OFICINARECEPTORA CHAR(5),
  NOMBREOFICINA    VARCHAR2(250),
  NRODOCUMENTO     VARCHAR2(16),
  TIPOESPECIE      CHAR(2),
  VALORTRX         NUMBER,
  SALDOANTERIOR    NUMBER,
  TIPORECAUDO      CHAR(1),
  FUENTETRX        VARCHAR2(16),
  CODIGOIAC        VARCHAR2(16),
  REFERENCIA1      VARCHAR2(100),
  REFERENCIA2      VARCHAR2(100),
  SECUENCIA        VARCHAR2(16),
  TIPOTRX          CHAR(1),
  NUMEROTRX        NUMBER
)
;

create table MVTOBANCAFE_TEMP
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  TIPODOC          CHAR(1),
  NUMERODOCUMENTO  VARCHAR2(16),
  CODIGOAPLICACION CHAR(1),
  NUMEROCTA        VARCHAR2(16),
  FECHAPROCESO     DATE,
  FECHATRX         DATE,
  CODIGOTRX        CHAR(4),
  DESCRIPCIONTRX   VARCHAR2(250),
  OFICINASEDE      CHAR(5),
  OFICINARECEPTORA CHAR(5),
  NOMBREOFICINA    VARCHAR2(250),
  NRODOCUMENTO     VARCHAR2(16),
  TIPOESPECIE      CHAR(2),
  VALORTRX         NUMBER,
  SALDOANTERIOR    NUMBER,
  TIPORECAUDO      CHAR(1),
  FUENTETRX        VARCHAR2(16),
  CODIGOIAC        VARCHAR2(16),
  REFERENCIA1      VARCHAR2(100),
  REFERENCIA2      VARCHAR2(100),
  SECUENCIA        VARCHAR2(16),
  TIPOTRX          CHAR(1)
)
;

create table MVTOPOPULAR
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  FECHAAPLICACION  DATE,
  HORA             CHAR(5),
  FECHATRANSACCION DATE,
  TRANSACCION      VARCHAR2(20),
  CAUSAL           VARCHAR2(20),
  DESCRIPCION      VARCHAR2(250),
  DOCUMENTO        VARCHAR2(20),
  ORIGEN           VARCHAR2(250),
  VALORTOTAL       NUMBER,
  VALOREFECTIVO    NUMBER,
  VALORCHEQUE      NUMBER,
  DEBITOCREDITO    CHAR(1),
  NUMEROTRX        NUMBER
)
;
comment on column MVTOPOPULAR.NUMEROCUENTA
  is 'numero cuenta';
comment on column MVTOPOPULAR.PERIODO
  is 'periodo de mvto';
comment on column MVTOPOPULAR.FECHAAPLICACION
  is 'fecha ';
comment on column MVTOPOPULAR.HORA
  is 'hora mvto';
comment on column MVTOPOPULAR.FECHATRANSACCION
  is 'fecha transaccion';
comment on column MVTOPOPULAR.TRANSACCION
  is 'codigo transaccion';
comment on column MVTOPOPULAR.CAUSAL
  is 'causal transaccion';
comment on column MVTOPOPULAR.DESCRIPCION
  is 'descripcion mvto';
comment on column MVTOPOPULAR.DOCUMENTO
  is 'documento';
comment on column MVTOPOPULAR.ORIGEN
  is 'oficina origen';
comment on column MVTOPOPULAR.VALORTOTAL
  is 'valor total';
comment on column MVTOPOPULAR.VALOREFECTIVO
  is 'valor efectivo';
comment on column MVTOPOPULAR.VALORCHEQUE
  is 'valor cheque';
comment on column MVTOPOPULAR.DEBITOCREDITO
  is 'debito credito';
comment on column MVTOPOPULAR.NUMEROTRX
  is 'numero de transaccion';

create table MVTOPOPULAR_TEMP
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  FECHAAPLICACION  DATE,
  HORA             CHAR(5),
  FECHATRANSACCION DATE,
  TRANSACCION      VARCHAR2(20),
  CAUSAL           VARCHAR2(20),
  DESCRIPCION      VARCHAR2(250),
  DOCUMENTO        VARCHAR2(20),
  ORIGEN           VARCHAR2(250),
  VALORTOTAL       NUMBER,
  VALOREFECTIVO    NUMBER,
  VALORCHEQUE      NUMBER,
  DEBITOCREDITO    CHAR(1)
)
;

create table OFICINABANCO
(
  IDBANCO     CHAR(2),
  IDOFICINA   VARCHAR2(250),
  NOMBRE      VARCHAR2(250),
  IDMUNICIPIO CHAR(8)
)
;
comment on column OFICINABANCO.IDBANCO
  is 'codigo de banco';
comment on column OFICINABANCO.IDOFICINA
  is 'codigo de oficina';
comment on column OFICINABANCO.NOMBRE
  is 'nombre de oficina';
comment on column OFICINABANCO.IDMUNICIPIO
  is 'divipo del municipio';
alter table OFICINABANCO
  add constraint FK_OFICINABANCOMUN foreign key (IDMUNICIPIO)
  references MUNICIPIO (IDMUNICIPIO);

create table TRXSINIDENTIFICAR
(
  IDBANCO               CHAR(2),
  CUENTA                VARCHAR2(16),
  PERIODO               CHAR(6),
  NUMEROTRX             NUMBER,
  FECHATRX              DATE,
  DESCRIPCIONTRX        VARCHAR2(250),
  VALORTRX              NUMBER,
  OFICINAORIGEN         VARCHAR2(250),
  INDTIPO               CHAR(5),
  IDMUNICIPIO           CHAR(8),
  P_CONSIGNADO          NUMBER,
  FECHACARGUE           DATE,
  USUARIOCARGUE         NUMBER,
  FECHAIDENTIFICACION   DATE,
  USUARIOIDENTIFICACION NUMBER,
  INDTIPOIDEN           CHAR(5),
  IDMUNICIPIOIDEN       CHAR(8),
  P_CONSIGNADOIDEN      NUMBER,
  OBSERVACIONES         VARCHAR2(500),
  NUMSECUENCIAREG       NUMBER not null,
  ESTADOIDEN            CHAR(2)
)
;
comment on column TRXSINIDENTIFICAR.IDBANCO
  is 'banco';
comment on column TRXSINIDENTIFICAR.CUENTA
  is 'cuenta';
comment on column TRXSINIDENTIFICAR.PERIODO
  is 'periodo';
comment on column TRXSINIDENTIFICAR.NUMEROTRX
  is 'numero de trx';
comment on column TRXSINIDENTIFICAR.FECHATRX
  is 'fecha de transaccion';
comment on column TRXSINIDENTIFICAR.DESCRIPCIONTRX
  is 'descripcion de transaccion';
comment on column TRXSINIDENTIFICAR.VALORTRX
  is 'valor transaccion';
comment on column TRXSINIDENTIFICAR.OFICINAORIGEN
  is 'oficina origen';
comment on column TRXSINIDENTIFICAR.INDTIPO
  is 'indicador tipo';
comment on column TRXSINIDENTIFICAR.IDMUNICIPIO
  is 'divipo propuesto';
comment on column TRXSINIDENTIFICAR.P_CONSIGNADO
  is 'porcentaje consignado';
comment on column TRXSINIDENTIFICAR.FECHACARGUE
  is 'fecha de cargue del registro';
comment on column TRXSINIDENTIFICAR.USUARIOCARGUE
  is 'usuario de cargue del registro';
comment on column TRXSINIDENTIFICAR.FECHAIDENTIFICACION
  is 'fecha de identificacion';
comment on column TRXSINIDENTIFICAR.USUARIOIDENTIFICACION
  is 'usuario que realizo la identificacion';
comment on column TRXSINIDENTIFICAR.INDTIPOIDEN
  is 'indicador tipo identificado';
comment on column TRXSINIDENTIFICAR.IDMUNICIPIOIDEN
  is 'municipio identificado';
comment on column TRXSINIDENTIFICAR.P_CONSIGNADOIDEN
  is 'porcentaje identificado';
comment on column TRXSINIDENTIFICAR.OBSERVACIONES
  is 'observaciones sobre la identificacion';
comment on column TRXSINIDENTIFICAR.NUMSECUENCIAREG
  is 'secuencia de la identificacion';
comment on column TRXSINIDENTIFICAR.ESTADOIDEN
  is 'SI: Sin identificar, ID: Identificado, AN:Anulado';
alter table TRXSINIDENTIFICAR
  add constraint PK_TRXSINIDENTIFICAR primary key (NUMSECUENCIAREG);
  
create sequence SEQ_IDE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

create sequence SEQ_MVTO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

  
update recaudo_externo_liquidacion
set idbancomun = '00',
tipocuentamun = 'AHO',
ctamun = encriptar('SIN DATO');

commit;

  