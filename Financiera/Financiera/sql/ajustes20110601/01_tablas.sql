---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 01/06/2011, 12:03:09 --
---------------------------------------------

spool 01_tablas.log

prompt
prompt Creating table CONCEPTOSIDENTIFICAR
prompt ===================================
prompt
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

prompt
prompt Creating table FUNCIONARIOS_CONCESIONARIO
prompt =========================================
prompt
create table FUNCIONARIOS_CONCESIONARIO
(
  IDCONCESIONARIO CHAR(2),
  IDPERSON        NUMBER,
  ACTIVO          NUMBER
)
;
comment on column FUNCIONARIOS_CONCESIONARIO.IDCONCESIONARIO
  is 'Concesionario';
comment on column FUNCIONARIOS_CONCESIONARIO.IDPERSON
  is 'Funcionario autorizado para identificacion de depositos';
comment on column FUNCIONARIOS_CONCESIONARIO.ACTIVO
  is '1: esta activo 0:inactivo';

prompt
prompt Creating table MOTIVOAJUSTE
prompt ===========================
prompt
create table MOTIVOAJUSTE
(
  IDMOTIVO NUMBER not null,
  MOTIVO   VARCHAR2(200)
)
;
alter table MOTIVOAJUSTE
  add constraint PK_MOTIVO primary key (IDMOTIVO);

prompt
prompt Creating table MVTOAGRARIO
prompt ==========================
prompt
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

prompt
prompt Creating table MVTOAGRARIO_TEMP
prompt ===============================
prompt
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

prompt
prompt Creating table MVTOAVVILLAS
prompt ===========================
prompt
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

prompt
prompt Creating table MVTOAVVILLAS_TEMP
prompt ================================
prompt
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

prompt
prompt Creating table MVTOBANCAFE
prompt ==========================
prompt
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

prompt
prompt Creating table MVTOBANCAFE_TEMP
prompt ===============================
prompt
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

prompt
prompt Creating table MVTODAVIVIENDA
prompt =============================
prompt
create table MVTODAVIVIENDA
(
  NUMEROCUENTA           VARCHAR2(16),
  PERIODO                CHAR(6),
  TIPO                   CHAR(4),
  FECHAPROCESO           DATE,
  CUENTA                 VARCHAR2(16),
  FECHAREAL              DATE,
  HORA                   CHAR(6),
  TERMINAL               CHAR(6),
  TALON                  CHAR(8),
  VALORCHEQUE            NUMBER,
  VALORTOTAL             NUMBER,
  VALORUNIDAD            NUMBER,
  OFICINARECAUDO         CHAR(4),
  MOTIVO                 CHAR(4),
  REFERENCIA1            CHAR(16),
  REFERENCIA2            CHAR(16),
  SALDOANTES             NUMBER,
  INDICADOREXCENTO       CHAR(2),
  VALOREXCENTO           NUMBER,
  CANAL                  CHAR(2),
  CAUSALDEVOLUCION       CHAR(4),
  JORNADA                CHAR(1),
  NOMBRETIPO             VARCHAR2(250),
  NOMBRECAUSALDEVOLUCION VARCHAR2(250),
  NUMEROTRX              NUMBER
)
;

prompt
prompt Creating table MVTODAVIVIENDA_TEMP
prompt ==================================
prompt
create table MVTODAVIVIENDA_TEMP
(
  NUMEROCUENTA     VARCHAR2(16),
  PERIODO          CHAR(6),
  TIPO             CHAR(4),
  FECHAPROCESO     DATE,
  CUENTA           VARCHAR2(16),
  FECHAREAL        DATE,
  HORA             CHAR(6),
  TERMINAL         CHAR(6),
  TALON            CHAR(8),
  VALORCHEQUE      NUMBER,
  VALORTOTAL       NUMBER,
  VALORUNIDAD      NUMBER,
  OFICINARECAUDO   CHAR(4),
  MOTIVO           CHAR(4),
  REFERENCIA1      CHAR(16),
  REFERENCIA2      CHAR(16),
  SALDOANTES       NUMBER,
  INDICADOREXCENTO CHAR(2),
  VALOREXCENTO     NUMBER,
  CANAL            CHAR(2),
  CAUSALDEVOLUCION CHAR(4),
  JORNADA          CHAR(1)
)
;

prompt
prompt Creating table MVTOPOPULAR
prompt ==========================
prompt
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

prompt
prompt Creating table MVTOPOPULAR_TEMP
prompt ===============================
prompt
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

prompt
prompt Creating table OFICINABANCO
prompt ===========================
prompt
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

prompt
prompt Creating table TIPOMVTO
prompt =======================
prompt
create table TIPOMVTO
(
  TIPO        CHAR(4),
  DESCRIPCION VARCHAR2(250)
)
;

prompt
prompt borrar table TRXSINIDENTIFICAR
prompt ================================
prompt
drop table TRXSINIDENTIFICAR;

prompt
prompt Creating table TRXSINIDENTIFICAR
prompt ================================
prompt

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
  ESTADOIDEN            CHAR(2),
  CONCESIONARIOZON      CHAR(2),
  REFERENCIA            VARCHAR2(250)
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
comment on column TRXSINIDENTIFICAR.CONCESIONARIOZON
  is 'Concesionario zonal';
comment on column TRXSINIDENTIFICAR.REFERENCIA
  is 'Referencia de transaccion';
alter table TRXSINIDENTIFICAR
  add constraint PK_TRXSINIDENTIFICAR primary key (NUMSECUENCIAREG);

  
prompt Ajusta TRXSINIDENTIFICAR
-- Add/modify columns 
alter table TRXSINIDENTIFICAR add fechaliq date;
-- Add comments to the columns 
comment on column TRXSINIDENTIFICAR.fechaliq
  is 'fecha de liquidacion';
  
  
prompt
prompt Creating sequence SEQ_IDE
prompt =========================
prompt
create sequence SEQ_IDE
minvalue 1
maxvalue 999999999999999999999999999
start with 7301
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MVTO
prompt ==========================
prompt
create sequence SEQ_MVTO
minvalue 1
maxvalue 999999999999999999999999999
start with 15881
increment by 1
cache 20;

prompt
prompt Creating view VW_CONCESIONARIOTRF
prompt =================================
prompt
create or replace view vw_concesionariotrf as
select '99' as idcon, '  TODOS' as nombre from dual
  union
select '00' as idCon, ' SIN CONCESIONARIO' as nombre from dual
UNION
  select t.concesionariozon as idCon , c.nombre as nombre
  from trxsinidentificar t, concesionario c
  where t.concesionariozon = c.idconcesionario
  group by t.concesionariozon , c.nombre
  order by 2  ASC
/

prompt
prompt Creating view VW_CUENTATRF
prompt ==========================
prompt
create or replace view vw_cuentatrf as
select '999999999' as cta, 'TODOS' as nombre from dual
  union
  select t.cuenta as cta , ( b.nombre || '-' ||  t.indtipo || '-' || t.cuenta) as nombre
  from trxsinidentificar t, banco b
  where t.idbanco = b.idbanco
  group by b.nombre, t.indTipo, t.cuenta
  order by 2  desc
/

prompt
prompt Creating view VW_MUNICIPIOTRF
prompt =============================
prompt
create or replace view vw_municipiotrf as
select 'TODOS' as idMunicipio, '  TODOS' as nombre from dual
  union
  select 'SIN MUNICIPIO' as idMunicipio, ' SIN MUNICIPIO' as nombre from dual
  union
  select t.idmunicipio, ( m.nombre || '-' || d.nombre || '-' || t.idmunicipio ) as nombre
  from trxsinidentificar t, municipio m, departamento d
  where t.idmunicipio = m.idmunicipio
  and m.iddepartamento = d.iddepartamento
  group by t.idmunicipio, m.nombre, d.nombre
order by  2
/

prompt
prompt Creating view VW_PCONSIGANDO
prompt ============================
prompt
create or replace view vw_pconsigando as
select 10 as porcentaje, '10' as nombre
    from dual
union
  select 45 as porcentaje, '45' as nombre
    from dual
union
  select 55 as porcentaje, '55' as nombre
    from dual
/

prompt
prompt Creating view VW_PERIODOTRF
prompt ===========================
prompt
create or replace view vw_periodotrf as
select '999999' as periodo, 'TODOS' as nombre from dual
  union
  select periodo, periodo as nombre
    from trxsinidentificar
     group by periodo
    order by 1 desc
/

prompt
prompt Creating view VW_VALORTRF
prompt =========================
prompt
create or replace view vw_valortrf as
select 0 as valorTrx, 'TODOS' as nombre from dual
  union
  select valortrx, to_char(valortrx,'999,999,999,999,999.99') as nombre
    from trxsinidentificar
    group by valortrx
    order by 1 asc
/

 
spool off
