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
