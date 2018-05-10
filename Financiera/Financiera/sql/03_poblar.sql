prompt PL/SQL Developer import file
prompt Created on miércoles, 11 de julio de 2012 by SEVEN
set feedback off
set define off
prompt Disabling triggers for BANCO...
alter table BANCO disable all triggers;
prompt Disabling triggers for CONCEPTO...
alter table CONCEPTO disable all triggers;
prompt Disabling triggers for CONCEPTOSIDENTIFICAR...
alter table CONCEPTOSIDENTIFICAR disable all triggers;
prompt Disabling triggers for CONCESIONARIO...
alter table CONCESIONARIO disable all triggers;
prompt Disabling triggers for CTA_DISPERSION_CONCESIONARIO...
alter table CTA_DISPERSION_CONCESIONARIO disable all triggers;
prompt Disabling triggers for CTA_DISPERSION_FCM...
alter table CTA_DISPERSION_FCM disable all triggers;
prompt Disabling triggers for CTA_DISPERSION_TERCERO...
alter table CTA_DISPERSION_TERCERO disable all triggers;
prompt Disabling triggers for CTA_RECAUDO_CONCESIONARIO...
alter table CTA_RECAUDO_CONCESIONARIO disable all triggers;
prompt Disabling triggers for FCM...
alter table FCM disable all triggers;
prompt Disabling triggers for CTA_RECAUDO_FCM...
alter table CTA_RECAUDO_FCM disable all triggers;
prompt Disabling triggers for DEPARTAMENTO...
alter table DEPARTAMENTO disable all triggers;
prompt Disabling triggers for MUNICIPIO...
alter table MUNICIPIO disable all triggers;
prompt Disabling triggers for DIAS_DISPERSION...
alter table DIAS_DISPERSION disable all triggers;
prompt Disabling triggers for FECHA_NO_HABIL...
alter table FECHA_NO_HABIL disable all triggers;
prompt Disabling triggers for FUNCIONARIOS_CONCESIONARIO...
alter table FUNCIONARIOS_CONCESIONARIO disable all triggers;
prompt Disabling triggers for GRUPO_CORREO...
alter table GRUPO_CORREO disable all triggers;
prompt Disabling triggers for MENU...
alter table MENU disable all triggers;
prompt Disabling triggers for MENUXROL...
alter table MENUXROL disable all triggers;
prompt Disabling triggers for MOTIVOAJUSTE...
alter table MOTIVOAJUSTE disable all triggers;
prompt Disabling triggers for OFICINABANCO...
alter table OFICINABANCO disable all triggers;
prompt Disabling triggers for PADRE...
alter table PADRE disable all triggers;
prompt Disabling triggers for PAR_CONTA...
alter table PAR_CONTA disable all triggers;
prompt Disabling triggers for P_DISPERSION_CONCESIONARIO...
alter table P_DISPERSION_CONCESIONARIO disable all triggers;
prompt Disabling triggers for P_DISPERSION_MUNICIPIO...
alter table P_DISPERSION_MUNICIPIO disable all triggers;
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for ROL...
alter table ROL disable all triggers;
prompt Disabling triggers for ROLXPERSON...
alter table ROLXPERSON disable all triggers;
prompt Disabling triggers for SALARIO_MINIMO...
alter table SALARIO_MINIMO disable all triggers;
prompt Disabling triggers for TERCERO...
alter table TERCERO disable all triggers;
prompt Disabling triggers for TIPOMVTO...
alter table TIPOMVTO disable all triggers;
prompt Disabling triggers for VALIDADOR_FECHA...
alter table VALIDADOR_FECHA disable all triggers;
prompt Disabling foreign key constraints for CTA_DISPERSION_CONCESIONARIO...
alter table CTA_DISPERSION_CONCESIONARIO disable constraint FK_IDCONCEPTO_CDC;
alter table CTA_DISPERSION_CONCESIONARIO disable constraint FK_IDCONCESIONARIO_CDC;
prompt Disabling foreign key constraints for CTA_RECAUDO_CONCESIONARIO...
alter table CTA_RECAUDO_CONCESIONARIO disable constraint FK_IDCONCESIONARIO_CRC;
prompt Disabling foreign key constraints for CTA_RECAUDO_FCM...
alter table CTA_RECAUDO_FCM disable constraint FK_NIT_FCM_CRF;
prompt Disabling foreign key constraints for MUNICIPIO...
alter table MUNICIPIO disable constraint FK_IDBANCO_M;
alter table MUNICIPIO disable constraint FK_IDCONCESIONARIO_M;
alter table MUNICIPIO disable constraint FK_IDDEPARTAMENTO_M;
prompt Disabling foreign key constraints for DIAS_DISPERSION...
alter table DIAS_DISPERSION disable constraint FK_IDBANCO_DD;
alter table DIAS_DISPERSION disable constraint FK_IDMUNICIPIO_DD;
prompt Disabling foreign key constraints for OFICINABANCO...
alter table OFICINABANCO disable constraint FK_OFICINABANCOMUN;
prompt Disabling foreign key constraints for P_DISPERSION_CONCESIONARIO...
alter table P_DISPERSION_CONCESIONARIO disable constraint FK_IDCONCESIONARIO_PDC;
prompt Disabling foreign key constraints for P_DISPERSION_MUNICIPIO...
alter table P_DISPERSION_MUNICIPIO disable constraint FK_IDMUNICIPIO_PDM;
prompt Disabling foreign key constraints for TERCERO...
alter table TERCERO disable constraint FK_IDBANCO_T;
alter table TERCERO disable constraint FK_IDMUNICIPIO_T;
prompt Truncating VALIDADOR_FECHA...
truncate table VALIDADOR_FECHA;
prompt Truncating TIPOMVTO...
truncate table TIPOMVTO;
prompt Truncating TERCERO...
truncate table TERCERO;
prompt Truncating SALARIO_MINIMO...
truncate table SALARIO_MINIMO;
prompt Truncating ROLXPERSON...
truncate table ROLXPERSON;
prompt Truncating ROL...
truncate table ROL;
prompt Truncating PERSON...
truncate table PERSON;
prompt Truncating P_DISPERSION_MUNICIPIO...
truncate table P_DISPERSION_MUNICIPIO;
prompt Truncating P_DISPERSION_CONCESIONARIO...
truncate table P_DISPERSION_CONCESIONARIO;
prompt Truncating PAR_CONTA...
truncate table PAR_CONTA;
prompt Truncating PADRE...
truncate table PADRE;
prompt Truncating OFICINABANCO...
truncate table OFICINABANCO;
prompt Truncating MOTIVOAJUSTE...
truncate table MOTIVOAJUSTE;
prompt Truncating MENUXROL...
truncate table MENUXROL;
prompt Truncating MENU...
truncate table MENU;
prompt Truncating GRUPO_CORREO...
truncate table GRUPO_CORREO;
prompt Truncating FUNCIONARIOS_CONCESIONARIO...
truncate table FUNCIONARIOS_CONCESIONARIO;
prompt Truncating FECHA_NO_HABIL...
truncate table FECHA_NO_HABIL;
prompt Truncating DIAS_DISPERSION...
truncate table DIAS_DISPERSION;
prompt Truncating MUNICIPIO...
truncate table MUNICIPIO;
prompt Truncating DEPARTAMENTO...
truncate table DEPARTAMENTO;
prompt Truncating CTA_RECAUDO_FCM...
truncate table CTA_RECAUDO_FCM;
prompt Truncating FCM...
truncate table FCM;
prompt Truncating CTA_RECAUDO_CONCESIONARIO...
truncate table CTA_RECAUDO_CONCESIONARIO;
prompt Truncating CTA_DISPERSION_TERCERO...
truncate table CTA_DISPERSION_TERCERO;
prompt Truncating CTA_DISPERSION_FCM...
truncate table CTA_DISPERSION_FCM;
prompt Truncating CTA_DISPERSION_CONCESIONARIO...
truncate table CTA_DISPERSION_CONCESIONARIO;
prompt Truncating CONCESIONARIO...
truncate table CONCESIONARIO;
prompt Truncating CONCEPTOSIDENTIFICAR...
truncate table CONCEPTOSIDENTIFICAR;
prompt Truncating CONCEPTO...
truncate table CONCEPTO;
prompt Truncating BANCO...
truncate table BANCO;
prompt Loading BANCO...
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('00', 'Seleccione', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('01', 'BANCO DE BOGOTA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('02', 'BANCO POPULAR', null, null, null, null, null, '4110020401', '4815590102');
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('07', 'BANCOLOMBIA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('08', 'ABN AMRO BANK', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('13', 'BBVA COLOMBIA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('19', 'BANCO COLPATRIA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('22', 'BANCO UNION COLOMBIANO', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('23', 'BANCO DE OCCIDENTE', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('29', 'BANCO TEQUENDAMA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('31', 'BANCOLDEX', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('32', 'BANCO BCSC SA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('34', 'BANCO SUPERIOR', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('36', 'MEGABANCO', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('37', 'BANKBOSTON S.A.', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('40', 'BANCO AGRARIO', null, null, null, null, null, '4110020301', '4815590102');
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('50', 'GRANBANCO S.A.', 'Carolina Arenas', 'Gerente De Cuenta Banca Empresarial', 'cparenas@davivienda.com.co', '6110001', '6110001', '4110020201', '4815590102');
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('51', 'BANCO DAVIVIENDA S.A.', 'Carolina Arenas', 'Carolina Arenas', 'cparenas@davivienda.com.co', '6110001', '6110001', '4110020201', '4815590102');
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('52', 'BANCO AV VILLAS', 'Orlando Trujillo', 'Gerente Cuenta Banca Empresarial', 'trujilloo@bancoavvillas.com.co', '2419600', 'Kr 13 27-07', '4110020101', '4815590102');
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('54', 'BANCO GRANAHORRAR', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('55', 'BANCO CONAVI', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('57', 'BANCO COLMENA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('06', 'BANCO SANTANDER', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('09', 'CITIBANK', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('10', 'BANISTMO COLOMBIA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('12', 'BANCO SUDAMERIS COLOMBIA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('20', 'BANESTADO', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('24', 'BANCO STANDARD CHARTERED COLOMBIA', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('30', 'BANCO CAJA SOCIAL', null, null, null, null, null, null, null);
insert into BANCO (idbanco, nombre, responsable, cargo, correo, telefono, dircorres, cuentacontable, ctacontperiodoant)
values ('14', 'HELM BANK S.A.', 'Miguel Angel Morales', 'Director Administrativo y Financiero Simit_Capital', 'miguel.morales@simitcapital.com.co', '7560707', 'Simit_Capital', null, null);
commit;
prompt 30 records loaded
prompt Loading CONCEPTO...
insert into CONCEPTO (idconcepto, nombre)
values (1, 'Liquidacion');
insert into CONCEPTO (idconcepto, nombre)
values (2, 'Fondo Cobertura');
insert into CONCEPTO (idconcepto, nombre)
values (3, 'Concesionario Contravencional');
insert into CONCEPTO (idconcepto, nombre)
values (4, 'FCM Contravencional');
insert into CONCEPTO (idconcepto, nombre)
values (5, 'Sevial');
insert into CONCEPTO (idconcepto, nombre)
values (6, 'POLCA');
insert into CONCEPTO (idconcepto, nombre)
values (7, 'Avvillas');
insert into CONCEPTO (idconcepto, nombre)
values (8, 'Liquidacion Externo Polca');
insert into CONCEPTO (idconcepto, nombre)
values (9, 'Liquidacion local Simit');
insert into CONCEPTO (idconcepto, nombre)
values (10, 'Liquidacion local Polca');
commit;
prompt 10 records loaded
prompt Loading CONCEPTOSIDENTIFICAR...
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('40', 'NC INTERNET TRANSFERENCIAS ENTRE TERCEROS INTERNET');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('40', 'DEPOSITO AHORROS');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('40', 'NC TES AUT ABONO TRASLADO CENIT');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('52', 'NC TRANS ACH');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('52', 'CRE PAGO PROVEEDOR');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('52', 'NC TRANSF. AVALNET');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('02', 'ABONOS POR A.C.');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('02', 'CONSIGN-AVAL AU');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('02', 'N.C POR TRANSFE');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('02', 'DEPOSITO CUENTA');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('02', 'N.C. OTROS');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('50', 'CONSIGNACION CONVENIO EMPRESARIAL EFECTI');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('50', 'CR MOV RECIBIDO INTERBANCARIO');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('50', 'CREDITO TRASLADO PROPIO TERMI EMPRESARIA');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('50', 'CREDITO PAGO A TERCEROS CTL');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('50', 'CREDITO NOMINA CTL');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('50', 'CR MOV RECIBIDO INTERBANCARIO');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('50', 'CONSIGNACION CONVENIO EMPRESARIAL CANJE');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('52', 'NC TRANSF AUTOMATICA');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('40', 'CREDITO POR TRANSFERENCIA DE CUENTA CORRIENTE');
insert into CONCEPTOSIDENTIFICAR (idbanco, concepto)
values ('02', 'TRANSFERENCIA C');
commit;
prompt 21 records loaded
prompt Loading CONCESIONARIO...
insert into CONCESIONARIO (idconcesionario, nit_c, nombre, correo, cta_contable, cta_contable_liquidacion, cta_contable_fondo, cta_cont_period_ant, cta_cont_period_antfcm)
values ('00', ' ', 'Seleccione', null, null, '5211900101', '5211900102', '5815930102', '5815930101');
insert into CONCESIONARIO (idconcesionario, nit_c, nombre, correo, cta_contable, cta_contable_liquidacion, cta_contable_fondo, cta_cont_period_ant, cta_cont_period_antfcm)
values ('06', '8000826650', 'FCM - SIMIT', null, null, '5211900101', '5211900102', '5815930102', '5815930101');
insert into CONCESIONARIO (idconcesionario, nit_c, nombre, correo, cta_contable, cta_contable_liquidacion, cta_contable_fondo, cta_cont_period_ant, cta_cont_period_antfcm)
values ('01', '8110367922', 'REMO S.A.', null, null, '5211900101', '5211900102', '5815930102', '5815930101');
insert into CONCESIONARIO (idconcesionario, nit_c, nombre, correo, cta_contable, cta_contable_liquidacion, cta_contable_fondo, cta_cont_period_ant, cta_cont_period_antfcm)
values ('02', '8050253454', 'SIMIT OCCIDENTE', null, null, '5211900101', '5211900102', '5815930102', '5815930101');
insert into CONCESIONARIO (idconcesionario, nit_c, nombre, correo, cta_contable, cta_contable_liquidacion, cta_contable_fondo, cta_cont_period_ant, cta_cont_period_antfcm)
values ('03', '8301123291', 'SEVIAL S.A', null, null, '5211900101', '5211900102', '5815930102', '5815930101');
insert into CONCESIONARIO (idconcesionario, nit_c, nombre, correo, cta_contable, cta_contable_liquidacion, cta_contable_fondo, cta_cont_period_ant, cta_cont_period_antfcm)
values ('04', '8110398884', 'SERVIT LTDA', null, null, '5211900101', '5211900102', '5815930102', '5815930101');
insert into CONCESIONARIO (idconcesionario, nit_c, nombre, correo, cta_contable, cta_contable_liquidacion, cta_contable_fondo, cta_cont_period_ant, cta_cont_period_antfcm)
values ('05', '8301280960', 'SIMIT CAPITAL', null, null, '5211900101', '5211900102', '5815930102', '5815930101');
commit;
prompt 7 records loaded
prompt Loading CTA_DISPERSION_CONCESIONARIO...
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '03', '52', '8301123291', 'AHO', 'V0mK+inJ5S6nctcJYo7Zew==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '03', '52', '8301123291', 'AHO', 'RInwmJE7Jby93pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '03', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '03', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '03', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '01', '52', '8110367922', 'AHO', 'O5AuI5oQOzYEMeyrgj8eUA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '01', '52', '8110367922', 'AHO', 'Mp9qfJNp30W93pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '01', '52', '8110367922', 'AHO', 'O5AuI5oQOzYEMeyrgj8eUA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '01', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '01', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '01', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '01', '23', '8110367922', 'CTE', 'j2ryanzDq9J31p4QmU9Mbg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '02', '52', '8050253454', 'AHO', 'B0WTs9CJZlKcVj8FpvPkyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '02', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '02', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '02', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '04', '52', '8110398884', 'AHO', 'Pe3bai1tA+u93pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '04', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '04', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '04', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '05', '14', '8001410211', 'AHO', 'wfaTh6mUSe9pGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '05', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '05', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '05', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '06', '52', '8000826650', 'CTE', '2YaUGtjKMAm93pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '06', '52', '8000826650', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '06', '52', '8000826650', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '06', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '03', '52', '8301123291', 'AHO', 'RInwmJE7Jby93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '03', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '03', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '03', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '01', '52', '8110367922', 'AHO', 'Mp9qfJNp30W93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '01', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '01', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '01', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '02', '52', '8050253454', 'AHO', 'RInwmJE7Jby93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '02', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '02', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '02', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '02', '52', '8050253454', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '04', '52', '8110398884', 'AHO', 'Pe3bai1tA+u93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '04', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '04', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '04', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '05', '52', '8001410211', 'AHO', 'wfaTh6mUSe9pGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '05', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '05', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '05', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '06', '52', '8000826650', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '06', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '03', '52', '8301123291', 'AHO', 'RInwmJE7Jby93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '03', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '03', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '03', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '01', '52', '8110367922', 'AHO', 'Mp9qfJNp30W93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '01', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '01', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '01', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '02', '52', '8050253454', 'AHO', 'RInwmJE7Jby93pIyaR7oyg==', '40');
commit;
prompt 100 records committed...
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '02', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '02', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '02', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '02', '52', '8050253454', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '04', '52', '8110398884', 'AHO', 'Pe3bai1tA+u93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '04', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '04', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '04', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '05', '52', '8001410211', 'AHO', 'wfaTh6mUSe9pGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '05', '52', '8000826650', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '05', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '05', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '06', '52', '8000826650', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '06', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '06', '52', '8000826650', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '01', '51', '8110367922', 'CTE', 'HmEpDtU428rqAjuWEkaWBg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '01', '51', '8110367922', 'AHO', 'zuKhCDkJmBaHXgtRcC2J9w==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '01', '51', '8110367922', 'CTE', 'HmEpDtU428rqAjuWEkaWBg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '01', '50', '8000826650', 'AHO', 'MIgMrkQ9zyRfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '01', '50', '8301123291', 'CTE', 'l/fv8aEyQiEvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '01', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '01', '23', '8110367922', 'CTE', 'N/OAeoQaIEygd9+oLNw7EA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '02', '50', '8050253454', 'CTE', 'f97ad00xV8tfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '02', '50', '8050253454', 'AHO', 'm/ylTuq4OWcvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '02', '50', '8050253454', 'CTE', 'f97ad00xV8tfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '02', '50', '8000826650', 'AHO', 'MIgMrkQ9zyRfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '02', '50', '8301123291', 'CTE', 'l/fv8aEyQiEvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '02', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '02', '50', '8050253454', 'CTE', 'f97ad00xV8tfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '03', '50', '8301123291', 'CTE', 'c+YlUK1bgUWgd9+oLNw7EA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '03', '50', '8301123291', 'AHO', 'KayZzxh7HMBpGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '03', '50', '8301123291', 'CTE', 'l/fv8aEyQiEvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '03', '50', '8000826650', 'AHO', 'MIgMrkQ9zyRfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '03', '50', '8301123291', 'CTE', 'l/fv8aEyQiEvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '03', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '03', '50', '8301123291', 'CTE', 'c+YlUK1bgUWgd9+oLNw7EA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '04', '51', '8110398884', 'CTE', 'HmEpDtU428oJcdpYIrV0mg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '04', '51', '8110398884', 'AHO', 'zuKhCDkJmBZXMSFmp/XOvA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '04', '50', '8110398884', 'CTE', 'HmEpDtU428oJcdpYIrV0mg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '04', '50', '8000826650', 'AHO', 'MIgMrkQ9zyRfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '04', '50', '8301123291', 'CTE', 'l/fv8aEyQiEvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '04', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '04', '07', '8110398884', 'CTE', '8IXQPglbGT3JoxU4QtXcoA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '05', '50', '8000826650', 'AHO', 'MIgMrkQ9zyRfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '05', '50', '8301123291', 'CTE', 'l/fv8aEyQiEvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '05', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '05', '50', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (1, '06', '50', '8000826650', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (2, '06', '50', '8000826650', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (3, '06', '50', '8000826650', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (4, '06', '50', '8000826650', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (5, '06', '50', '8000826650', 'CTE', 'l/fv8aEyQiEvdP4LvWxeeg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (6, '06', '02', '8300904861', 'CTE', 'Y4qM0dYcMklpGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (7, '06', '50', '8000826650', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '01', '52', '8110367922', 'AHO', 'O5AuI5oQOzYEMeyrgj8eUA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '01', '52', '8110367922', 'AHO', 'O5AuI5oQOzYEMeyrgj8eUA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '01', '52', '8110367922', 'AHO', 'O5AuI5oQOzYEMeyrgj8eUA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '01', '51', '8110367922', 'CTE', 'HmEpDtU428rqAjuWEkaWBg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '01', '51', '8110367922', 'CTE', 'HmEpDtU428rqAjuWEkaWBg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '01', '51', '8110367922', 'CTE', 'HmEpDtU428rqAjuWEkaWBg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '01', '52', '8110367922', 'CTE', 'O5AuI5oQOzYEMeyrgj8eUA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '02', '50', '8050253454', 'CTE', 'f97ad00xV8tfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '02', '50', '8050253454', 'CTE', 'f97ad00xV8tfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '02', '50', '8050253454', 'CTE', 'f97ad00xV8tfFT6d+JYx5Q==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '02', '52', '8050253454', 'AHO', 'B1Q2wf+gFSQOBd7xxFa+rw==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '03', '52', '8301123291', 'AHO', 's7SbUoLFb2anctcJYo7Zew==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '03', '52', '8301123291', 'AHO', 'EkHG8CWolZGUNV4jAlFmXg==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '03', '50', '8301123291', 'CTE', 'c+YlUK1bgUWgd9+oLNw7EA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '03', '50', '8301123291', 'CTE', 'c+YlUK1bgUWgd9+oLNw7EA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '03', '50', '8301123291', 'CTE', 'c+YlUK1bgUWgd9+oLNw7EA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '02');
commit;
prompt 200 records committed...
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '03', '52', '8301123291', 'AHO', 'xksqSjdxq5693pIyaR7oyg==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '04', '51', '8110398884', 'CTE', 'HmEpDtU428oJcdpYIrV0mg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '04', '51', '8110398884', 'CTE', 'HmEpDtU428oJcdpYIrV0mg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '04', '51', '8110398884', 'CTE', 'HmEpDtU428oJcdpYIrV0mg==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '04', '52', '8110398884', 'AHO', 'Y38Gpz5uMu3dV+Wtll7QRA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '50');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '52');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '02');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (8, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (9, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '40');
insert into CTA_DISPERSION_CONCESIONARIO (idconcepto, idconcesionario, idbanco, nit_c, tipocuenta, cuenta, idbancorec)
values (10, '05', '14', '8001410211', 'CTE', 'wfaTh6mUSe9pGCozvP9KhA==', '40');
commit;
prompt 228 records loaded
prompt Loading CTA_DISPERSION_FCM...
insert into CTA_DISPERSION_FCM (nit_fcm, idbancorec, cta_disp_s_banco, cta_disp_s_tipo_cta, cta_disp_s_cta, cta_disp_p_banco, cta_disp_p_tipo_cta, cta_disp_p_cta, cta_disp_pa_banco, cta_disp_pa_tipo_cta, cta_disp_pa_cta, cta_disp_ac_banco, cta_disp_ac_tipo_cta, cta_disp_ac_cta, borrcta_disp_c_banco, borrcta_disp_c_tipo_cta, borrcta_disp_c_cta, cta_con_s, cta_con_p, cta_con_pa, cta_con_ac)
values ('8000826650', '52', '52', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52', 'AHO', 'FixQfPnpjdtfFT6d+JYx5Q==', null, null, null, '1110061001', '1110061001', '1110062201', '1110061501');
insert into CTA_DISPERSION_FCM (nit_fcm, idbancorec, cta_disp_s_banco, cta_disp_s_tipo_cta, cta_disp_s_cta, cta_disp_p_banco, cta_disp_p_tipo_cta, cta_disp_p_cta, cta_disp_pa_banco, cta_disp_pa_tipo_cta, cta_disp_pa_cta, cta_disp_ac_banco, cta_disp_ac_tipo_cta, cta_disp_ac_cta, borrcta_disp_c_banco, borrcta_disp_c_tipo_cta, borrcta_disp_c_cta, cta_con_s, cta_con_p, cta_con_pa, cta_con_ac)
values ('8000826650', '50', '50', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '50', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '50', 'AHO', 'MIgMrkQ9zyRfFT6d+JYx5Q==', '50', 'AHO', 'adOLShSbnlhfFT6d+JYx5Q==', null, null, null, '1110065601', '1110065601', '1110065801', '1110065701');
insert into CTA_DISPERSION_FCM (nit_fcm, idbancorec, cta_disp_s_banco, cta_disp_s_tipo_cta, cta_disp_s_cta, cta_disp_p_banco, cta_disp_p_tipo_cta, cta_disp_p_cta, cta_disp_pa_banco, cta_disp_pa_tipo_cta, cta_disp_pa_cta, cta_disp_ac_banco, cta_disp_ac_tipo_cta, cta_disp_ac_cta, borrcta_disp_c_banco, borrcta_disp_c_tipo_cta, borrcta_disp_c_cta, cta_con_s, cta_con_p, cta_con_pa, cta_con_ac)
values ('8000826650', '40', '52', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52', 'AHO', 'FixQfPnpjdtfFT6d+JYx5Q==', null, null, null, '1110061001', '1110061001', '1110062201', '1110061501');
insert into CTA_DISPERSION_FCM (nit_fcm, idbancorec, cta_disp_s_banco, cta_disp_s_tipo_cta, cta_disp_s_cta, cta_disp_p_banco, cta_disp_p_tipo_cta, cta_disp_p_cta, cta_disp_pa_banco, cta_disp_pa_tipo_cta, cta_disp_pa_cta, cta_disp_ac_banco, cta_disp_ac_tipo_cta, cta_disp_ac_cta, borrcta_disp_c_banco, borrcta_disp_c_tipo_cta, borrcta_disp_c_cta, cta_con_s, cta_con_p, cta_con_pa, cta_con_ac)
values ('8000826650', '02', '52', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52', 'AHO', '2YaUGtjKMAm93pIyaR7oyg==', '52', 'AHO', 'MplrsB0mUV6UNV4jAlFmXg==', '52', 'AHO', 'FixQfPnpjdtfFT6d+JYx5Q==', null, null, null, '1110061001', '1110061001', '1110062201', '1110061501');
insert into CTA_DISPERSION_FCM (nit_fcm, idbancorec, cta_disp_s_banco, cta_disp_s_tipo_cta, cta_disp_s_cta, cta_disp_p_banco, cta_disp_p_tipo_cta, cta_disp_p_cta, cta_disp_pa_banco, cta_disp_pa_tipo_cta, cta_disp_pa_cta, cta_disp_ac_banco, cta_disp_ac_tipo_cta, cta_disp_ac_cta, borrcta_disp_c_banco, borrcta_disp_c_tipo_cta, borrcta_disp_c_cta, cta_con_s, cta_con_p, cta_con_pa, cta_con_ac)
values ('8000826650', '51', '51', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '51', 'AHO', 'McW19TWVyOCnctcJYo7Zew==', '51', 'AHO', 'MIgMrkQ9zyRfFT6d+JYx5Q==', '51', 'AHO', 'adOLShSbnlhfFT6d+JYx5Q==', null, null, null, '1110065601', '1110065601', '1110065801', '1110065701');
commit;
prompt 5 records loaded
prompt Loading CTA_DISPERSION_TERCERO...
prompt Table is empty
prompt Loading CTA_RECAUDO_CONCESIONARIO...
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '02', 'SIMIT', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '02', 'POLCA', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '02', 'SIMIT', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '02', 'SIMIT', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '02', 'POLCA', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '02', 'SIMIT', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '02', 'POLCA', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '02', 'SIMIT', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '02', 'POLCA', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '02', 'POLCA', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '50', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', '1110050804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '50', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', '1110050904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '50', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', '1110050904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '50', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', '1110050904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '50', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', '1110050904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '50', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', '1110050904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '50', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', '1110050804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '50', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', '1110050804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '50', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', '1110050804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '52', 'POLCA', 'AHO', '086044443', 0, 0, '1110061801', '1110061802', '1110061804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '52', 'POLCA', 'AHO', '086044443', 0, 0, '1110061801', '1110061802', '1110061804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '52', 'POLCA', 'AHO', '086044443', 0, 0, '1110061801', '1110061802', '1110061804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '52', 'POLCA', 'AHO', '086044443', 0, 0, '1110061801', '1110061802', '1110061804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '52', 'POLCA', 'AHO', '086044443', 0, 0, '1110061801', '1110061802', '1110061804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '52', 'SIMIT', 'AHO', '086041514', 0, 0, '1110061401', '1110061402', '1110061404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '52', 'SIMIT', 'AHO', '086041506', 0, 0, '1110061101', '1110061102', '1110061104');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '52', 'SIMIT', 'AHO', '086041522', 0, 0, '1110061301', '1110061302', '1110061304');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '52', 'SIMIT', 'AHO', '086042108', 0, 0, '1110061601', '1110061602', '1110061604');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '52', 'SIMIT', 'AHO', '086044328', 0, 0, '1110061701', '1110061702', '1110061704');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '40', 'POLCA', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '40', 'POLCA', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '40', 'POLCA', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '40', 'POLCA', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '40', 'POLCA', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '40', 'SIMIT', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '40', 'SIMIT', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '40', 'SIMIT', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '40', 'SIMIT', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '40', 'SIMIT', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '50', 'SIMIT', 'AHO', '186001046', 0, 0, '1110065101', '1110065102', '1110065104');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '50', 'SIMIT', 'AHO', '186001053', 0, 0, '1110065201', '1110065202', '1110065204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '50', 'SIMIT', 'AHO', '186001061', 0, 0, '1110065301', '1110065302', '1110065304');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '50', 'SIMIT', 'AHO', '186001079', 0, 0, '1110065401', '1110065402', '1110065404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '50', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', '1110065504');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '50', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', '1110065504');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '50', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', '1110065504');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '50', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', '1110065504');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '50', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', '1110065504');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '50', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', '1110050804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '50', 'SIMIT', 'AHO', '186001020', 0, 0, '1110065001', '1110065002', '1110065004');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('06', '40', 'SIMIT', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('06', '40', 'POLCA', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '52', 'SIMIT', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '52', 'POLCA', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '52', 'POLCA', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '52', 'SIMIT', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '52', 'POLCA', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '52', 'SIMIT', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '52', 'POLCA', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '52', 'SIMIT', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '52', 'POLCA', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '52', 'SIMIT', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('06', '52', 'POLCA', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('06', '52', 'SIMIT', 'CTE', '059007559', 0, 0, '1110055901', '1110055902', '1110055904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '02', 'SIMIT', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '02', 'POLCA', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '02', 'POLCA', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '02', 'SIMIT', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '02', 'SIMIT', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '02', 'POLCA', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '02', 'SIMIT', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '02', 'POLCA', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '02', 'SIMIT', 'AHO', '220070029350', 0, 0, '1110063401', '1110063402', '1110063404');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '02', 'POLCA', 'AHO', '220070014717', 0, 0, '1110063201', '1110063202', '1110063204');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '40', 'SIMIT', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '40', 'SIMIT', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '40', 'SIMIT', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '40', 'SIMIT', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '40', 'SIMIT', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('06', '40', 'SIMIT', 'AHO', '408203001990', 0, 0, '1110063801', '1110063802', '1110063804');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '40', 'POLCA', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '40', 'POLCA', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '40', 'POLCA', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '40', 'POLCA', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '40', 'POLCA', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('06', '40', 'POLCA', 'AHO', '408203002008', 0, 0, '1110063901', '1110063902', '1110063904');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '52', 'SIMIT', 'CTE', '086041522', 0, 0, '1110055901', null, '04');
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '51', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '51', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '51', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '51', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '51', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '51', 'POLCA', 'AHO', '186992848', 0, 0, '1110050901', '1110050902', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '51', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '51', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '51', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '51', 'SIMIT', 'AHO', '186001046', 0, 0, '1110065101', '1110065102', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '51', 'SIMIT', 'AHO', '186001053', 0, 0, '1110065201', '1110065202', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '51', 'SIMIT', 'AHO', '186001061', 0, 0, '1110065301', '1110065302', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '51', 'SIMIT', 'AHO', '186001079', 0, 0, '1110065401', '1110065402', null);
commit;
prompt 100 records committed...
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('01', '51', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('02', '51', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('03', '51', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '51', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('05', '51', 'POLCA', 'AHO', '186001087', 0, 0, '1110065501', '1110065502', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '51', 'SIMIT', 'AHO', '186992830', 0, 0, '1110050801', '1110050802', null);
insert into CTA_RECAUDO_CONCESIONARIO (idconcesionario, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_ing, cta_contable_dev)
values ('04', '51', 'SIMIT', 'AHO', '186001020', 0, 0, '1110065001', '1110065002', null);
commit;
prompt 107 records loaded
prompt Loading FCM...
insert into FCM (nit_fcm, correo, cta_disp_s_banco, cta_disp_s_tipo_cta, cta_disp_s_cta, cta_disp_p_banco, cta_disp_p_tipo_cta, cta_disp_p_cta, iva, retencion_fuente, impuesto_timbre_tercero, impuesto_timbre_fcm, director_ejecutivo, director_nacional, contador_general, coordinador_financiero, nit_polca, nit_sevial, ctacon_puente, ctacon_fondo_cobertura, ctacon_polca, ctacon_fcm, cta_disp_pa_banco, cta_disp_pa_tipo_cta, cta_disp_pa_cta, ctacon_fcma, ctacon_ingreso, ctacon_impuestos, reteiva, timbre_contravencional, ctacon_puente_ext, m_director_ejecutivo, m_director_nacional, m_contador_general, m_coordinador_financiero, dias_activacion, cta_disp_ac_banco, cta_disp_ac_tipo_cta, cta_disp_ac_cta, seguridad_integrada, url_seguridad, servidorsmtp, enviacorreo)
values ('8000826650', 'linda.campo@fcm.org.co', '00', 'AHO', null, '00', 'AHO', null, 16, 11, 1.5, .75, 'Gilberto Toro Giraldo', 'Sandra Milena Tapias', 'Edin Tello', 'Mauricio Romero', '8300904861', '8301123291', '2425900500', '4110020600', '2905900500', '2905901006', '00', 'AHO', null, '2905901000', '4110020600', '2905901010', 0, 0, '2905901010', 'gilberto.toro@fcm.org.co', 'sandra.tapias@fcm.org.co', 'edin.tello@fcm.org.co', 'mauricio.romero@fcm.org.co', 1, null, null, null, 0, 'http://172.168.100.10:8080/simit/services/WSValidaUsuario', '172.168.100.10', 1);
commit;
prompt 1 records loaded
prompt Loading CTA_RECAUDO_FCM...
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '52', 'SIMIT', 'AHO', '086042058', 0, 0, '1110061501', '1110061502', 'XXXXXXXXXX', '1110061502');
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '50', 'SIMIT', 'CTE', '186992681', 0, 0, '1110050601', '1110050602', 'XXXXXXXXXX', '1110050602');
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '50', 'POLCA', 'CTE', '186992822', 0, 0, '1110050701', '1110050702', 'XXXXXXXXXX', '1110050702');
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '52', 'POLCA', 'AHO', '086044559', 0, 0, '1110061901', '1110061902', 'XXXXXXXXXX', '1110061902');
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '02', 'SIMIT', 'AHO', '220070014501', 0, 0, '1110063001', '1110063002', 'XXXXXXXXXX', '1110063002');
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '02', 'POLCA', 'AHO', '220070023528', 0, 0, '1110063301', '1110063302', 'XXXXXXXXXX', '1110063302');
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '40', 'POLCA', 'AHO', '408203001559', 0, 0, '1110063601', '1110063602', 'XXXXXXXXXX', '1110063602');
insert into CTA_RECAUDO_FCM (nit_fcm, idbanco, indtipo, tipocuenta, cuenta, comision_recaudo, comision_ach, cta_contable, cta_contable_pag, cta_contable_ide, cta_contable_ing)
values ('8000826650', '40', 'SIMIT', 'AHO', '408203001567', 0, 0, '1110063701', '1110063702', 'XXXXXXXXXX', '1110063702');
commit;
prompt 8 records loaded
prompt Loading DEPARTAMENTO...
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('00', '   ');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('05', 'Antioquia');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('08', 'Atlantico');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('15', 'Boyaca');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('11', 'Bogota D.C.');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('13', 'Bolivar');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('23', 'Cordoba');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('19', 'Cauca');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('17', 'Caldas');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('20', 'Cesar');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('25', 'Cundinamarca');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('27', 'Choco');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('44', 'La Guajira');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('41', 'Huila');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('47', 'Magdalena');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('50', 'Meta');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('54', 'Norte de Santander');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('63', 'Quindio');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('66', 'Risaralda');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('70', 'Sucre');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('68', 'Santander');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('73', 'Tolima');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('76', 'Valle del Cauca');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('88', 'San Andres y Providencia');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('18', 'Caqueta');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('81', 'Arauca');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('52', 'Narino');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('91', 'Amazonas');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('86', 'Putumayo');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('94', 'Guainia');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('97', 'Vaupes');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('99', 'Vichada');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('85', 'Casanare');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('95', 'Guaviare');
insert into DEPARTAMENTO (iddepartamento, nombre)
values ('09', 'Polca');
commit;
prompt 35 records loaded
prompt Loading MUNICIPIO...
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25000000', '8999991140', 'DPTAL CUNDINAMARCA', '25', '03', 'alcaldia@dptalcundinamarca-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76834000', '8919002721', 'TULUA', '76', '02', 'alcaldia@tulua-valle del cauca.gov.co', 0, '23', 'AHO', '2SzwL/I3qV1fFT6d+JYx5Q==', '9000592758', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('85010000', '8920992166', 'AGUAZUL', '85', '03', 'alcaldia@aguazul-casanare.gov.co', 0, '52', 'CTE', 'E96UMHlhqlkEMeyrgj8eUA==', '8920992166', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('86001000', '8001028916', 'MOCOA', '86', '04', 'alcaldia@mocoa-putumayo.gov.co', 0, '40', 'CTE', '/k08CPz46nLI8W1nY/UU+Q==', '8001028916', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('86320000', '8001028962', 'ORITO', '86', '04', 'alcaldia@orito-putumayo.gov.co', 0, '40', 'CTE', 'Kzn0mQkfTXR1fh/h3bGXYA==', '8001028962', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('86568000', '8912004613', 'PUERTO ASIS', '86', '04', 'alcaldia@puertoasis-putumayo.gov.co', 0, '13', 'AHO', 'vgmGrBO2zUqgd9+oLNw7EA==', '8600486085', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('86749000', '8912016456', 'SIBUNDOY', '86', '04', 'alcaldia@sibundoy-putumayo.gov.co', 0, '40', 'CTE', 'UmZOWa2LgAJgg/S7GNxaQQ==', '8912016456', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('86865000', '8001029122', 'LA HORMIGA', '86', '04', 'alcaldia@lahormiga-putumayo.gov.co', 0, '40', 'CTE', 'Nb1vb4A1Lnln+QnE2X0SyQ==', '8001029122', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('88001000', '8924000382', 'SAN ANDRES I', '88', '04', 'alcaldia@sanandresi-archipi¿lago de san andr¿s, providencia y santa catalina.gov.co', 0, '52', 'AHO', 'fOz/Sa/HzL6gd9+oLNw7EA==', '8924000382', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('91001000', '8999993029', 'LETICIA', '91', '03', 'alcaldia@leticia-amazonas.gov.co', 0, '01', 'CTE', 'qa0jBk/OaLCgd9+oLNw7EA==', '8999993029', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('94001000', '8920991057', 'INIRIDA', '94', '06', 'alcaldia@inirida-guain¿a.gov.co', 0, '40', 'AHO', 'QXOQmsWV/AQhBpzU5UADNw==', '8300536309', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('99001000', '8000940678', 'PUERTO CARREnO', '99', '06', 'alcaldia@puertocarreno-vichada.gov.co', 0, '13', 'CTE', 'Ir6e9Dcuu/gEMeyrgj8eUA==', '8000940678', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15299000', '8000256088', 'GARAGOA', '15', '03', 'alcaldia@garagoa-huila.gov.co', 0, '01', 'CTE', 'nJJRpAIkQbigd9+oLNw7EA==', '8000256088', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41319000', '8911801779', 'GUADALUPE', '41', '04', 'alcaldia@guadalupe-antioquia.gov.co', 0, '40', 'AHO', 'g/w6GGYRzvRjaHWWJB0h+g==', '8911801779', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05264000', '8909820682', 'ENTRERRIOS', '05', '01', 'alcaldia@entrerrios-antioquia.gov.co', 0, '07', 'CTE', 'OsDMbPzc2+mgYijH4dJHJA==', '8909820682', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05282000', '8909808481', 'FREDONIA', '05', '01', '#N/A', 0, '51', 'AHO', '6CQiM5ULHeSgd9+oLNw7EA==', '8909808481', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('00000000', null, ' Seleccione', '00', '00', null, 0, '00', 'AHO', null, null, 0, 0, 0, 0, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76869000', '8002430227', 'VIJES', '76', '02', 'alcaldia@vijes-valle del cauca.gov.co', 0, '07', 'AHO', 'B3XJhvu0DO+oqRc/spY/Vg==', '8002430227', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76890000', '8001005310', 'YOTOCO', '76', '02', 'alcaldia@yotoco-valle del cauca.gov.co', 0, '13', 'AHO', '361e9KDnY47JPPQmCzX1Uw==', '8001005310', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76892000', '8903990256', 'YUMBO', '76', '02', 'alcaldia@yumbo-valle del cauca.gov.co', 0, '23', 'CTE', 'bpIe2YfXmSfxfvma5wr5pg==', '8903990256', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76895000', '8919006240', 'ZARZAL', '76', '02', 'alcaldia@zarzal-arauca.gov.co', 0, '50', 'CTE', 'vUoAwEzzVt1fFT6d+JYx5Q==', '8919006240', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('81001000', '8001148695', 'ARAUCA ARAUCA', '81', '01', 'alcaldia@araucaarauca-arauca.gov.co', 0, '02', 'AHO', 'PhRkHOnpYaRpGCozvP9KhA==', '8001148695', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('81736000', '8001027996', 'SARAVENA', '81', '01', 'alcaldia@saravena-arauca.gov.co', 0, '50', 'AHO', 'DhiiyVB6KTkEMeyrgj8eUA==', '8001027996', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('85001000', '8918550177', 'YOPAL', '85', '03', 'alcaldia@yopal-casanare.gov.co', 0, '51', 'CTE', 'vlmGxn2TyhFi7K2o7Em3iQ==', '8918550177', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05353000', '8909849868', 'HISPANIA', '05', '01', 'hispania@alcaldia.gov.co', 0, '01', 'CTE', 'AoYfu7LcEcHxfvma5wr5pg==', '8909849868', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05490000', '8909838731', 'NECOCLI', '05', '01', 'necocli@alcaldia.gov.co', 0, '40', 'CTE', 'b0XAP8FeOeZqeRmYs6vbhA==', '8909838731', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05044000', '8909838249', 'ANZA', '05', '01', 'anza@alcaldia.gov.co', 0, '40', 'CTE', 'gzryUWOyIlaZgID6YCH7fw==', '8909838249', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('27245000', '8916800619', 'EL CARMEN DE ATRATO', '27', '01', 'alcaldia@elcarmendeatrato.gov.co', 0, '40', 'CTE', 'gBEOf3SZFyjOs02GfHoq6w==', '8916800919', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41016000', '8911800701', 'AIPE', '41', '04', 'alcaldia@aipe-huila.gov.co', 0, '40', 'CTE', 'LiQdPLGRlMqHNPD3S50kLw==', '8911800701', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41132000', '8911181199', 'CAMPOALEGRE', '41', '04', 'alcaldia@campoalegre-huila.gov.co', 0, '07', 'CTE', 'OXS3UKLQeb2+aynSzBLX0g==', '9002758412', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41298000', '8911800226', 'GARZON', '41', '04', 'alcaldia@garzon-huila.gov.co', 0, '50', 'AHO', 'bhewerdkrhYEMeyrgj8eUA==', '8911800226', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41396000', '8911801557', 'LA PLATA', '41', '04', 'alcaldia@laplata-huila.gov.co', 0, '50', 'AHO', 'Z9UFHNhacX/xfvma5wr5pg==', '8911801557', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41524000', '8001150053', 'PALERMO', '41', '04', 'alcaldia@palermo-huila.gov.co', 0, '50', 'AHO', '7ypfqAcGVTCgd9+oLNw7EA==', '8001150053', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41551000', '8911800770', 'PITALITO', '41', '04', 'alcaldia@pitalito-huila.gov.co', 0, '07', 'AHO', '1fo95K4ZQCIqFD0pLF0K+g==', '8911800770', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41791000', '8001150053', 'TARQUI', '41', '04', 'alcaldia@tarqui-huila.gov.co', 0, '50', 'AHO', '7ypfqAcGVTCgd9+oLNw7EA==', '8001150053', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41807000', '8001150053', 'TIMANA', '41', '04', 'alcaldia@timana-huila.gov.co', 0, '50', 'AHO', '7ypfqAcGVTCgd9+oLNw7EA==', '8001150053', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('44000000', '8921150151', 'DPTAL GUAJIRA', '44', '04', 'alcaldia@dptalguajira-la guajira.gov.co', 0, '52', 'CTE', 'V3YYG3+96yW93pIyaR7oyg==', '8921150151', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('44001000', '8000992226', 'RIOHACHA', '44', '04', 'alcaldia@riohacha-la guajira.gov.co', 0, '52', 'CTE', 'ufRNS0nju+PdV+Wtll7QRA==', '8000992226', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('47001000', '8917800094', 'SANTA MARTA', '47', '04', 'alcaldia@santamarta-magdalena.gov.co', 1, '23', 'CTE', 'LB1JycrTpMyUNV4jAlFmXg==', '8300540762', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('47053000', '8917800410', 'ARACATACA', '47', '04', 'alcaldia@aracataca-magdalena.gov.co', 0, '23', 'CTE', 'lLEaChJ6KPKnctcJYo7Zew==', '8300540762', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('47189000', '8190046467', 'CIENAGA', '47', '04', 'alcaldia@cienaga-magdalena.gov.co', 1, '40', 'AHO', 'ZuKcZ7Jkd8E0JdZK8Yj0Qw==', '8190046467', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('47245000', '8917800442', 'EL BANCO', '47', '04', 'alcaldia@elbanco-magdalena.gov.co', 0, '13', 'AHO', 'QvRmnu7EMHqnctcJYo7Zew==', '9001653387', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('47288000', '8917800451', 'FUNDACION', '47', '04', 'alcaldia@fundacion-magdalena.gov.co', 0, '51', 'AHO', 'lPwpNNqyUs5E8KriUNSGkPKpvidO4cpb', '8190057033', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('47555000', '8917800514', 'PLATO', '47', '04', 'alcaldia@plato-magdalena.gov.co', 0, '13', 'CTE', 'Zn7UH6GfLZGgd9+oLNw7EA==', '8917800514', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('50000000', '8000476351', 'DPTAL META', '50', '04', 'alcaldia@dptalmeta-meta.gov.co', 0, '13', 'AHO', 'Aum7JspX6p+nctcJYo7Zew==', '8000476351', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('50001000', '8920993243', 'VILLAVICENCIO', '50', '04', 'alcaldia@villavicencio-meta.gov.co', 0, '51', 'AHO', 'G0dBiB7Y9Y4PQpNALrK/zQ==', '8920993243', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('50006000', '9000813314', 'ACACIAS', '50', '04', 'alcaldia@acacias-meta.gov.co', 0, '02', 'CTE', 'rzhi+julXFUcIG1h1+TrWA==', '9000813314', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('50313000', '8920992435', 'GRANADA', '50', '04', 'alcaldia@granada-meta.gov.co', 0, '57', 'AHO', '/qvVlEfQWBzDKSgz5l47uw==', '8920992435', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('50606000', '8000476351', 'RESTREPO META', '50', '04', 'alcaldia@restrepometa-meta.gov.co', 0, '01', 'CTE', 'TyhVKBpNSUiulh8F0tZ2GA==', '8000476351', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('52000000', '8001149733', 'DPTAL NARInO', '52', '02', 'alcaldia@dptalnarino-nari¿o.gov.co', 0, '01', 'CTE', 'RXsqnWznvq+UNV4jAlFmXg==', '8001149733', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('52001000', '8912800003', 'PASTO', '52', '02', 'alcaldia@pasto-nari¿o.gov.co', 0, '19', 'AHO', 'dTAqV2Ei+jRSzpz2Bi43Og==', '8002236965', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('52356000', '8000990957', 'IPIALES', '52', '02', 'alcaldia@ipiales-nari¿o.gov.co', 0, '57', 'AHO', '+LMCDgjw2HsgbEE1LYcwww==', '8000990957', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('52480000', '8001149733', 'NARInO NARInO', '52', '02', 'alcaldia@narinonarino-nari¿o.gov.co', 0, '01', 'CTE', 'RXsqnWznvq+UNV4jAlFmXg==', '8001149733', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('52835000', '8912009162', 'TUMACO', '52', '02', 'alcaldia@tumaco-nari¿o.gov.co', 0, '02', 'AHO', 'izEz3jvg5mu93pIyaR7oyg==', '8001412350', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('52838000', '8000991529', 'TUQUERRES', '52', '02', 'alcaldia@tuquerres-nari¿o.gov.co', 0, '07', 'CTE', 'r62dh/0SlV07IIHcetCOug==', '8000991529', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54001000', '8905014342', 'CUCUTA', '54', '01', 'alcaldia@cucuta-norte de santander.gov.co', 0, '01', 'CTE', 'hJ8W8K2m8Ujxfvma5wr5pg==', '8905014342', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54003000', '8905046120', 'ABREGO', '54', '01', 'alcaldia@abrego-norte de santander.gov.co', 0, '40', 'AHO', 'dytNrc3thoFxutoLK4PwXw==', '8905046120', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54206000', '8000992369', 'CONVENCIÓN', '54', '01', 'alcaldia@convencion-norte de santander.gov.co', 0, '40', 'CTE', '5GzuVXfazKslvSR0+C66Tw==', '8000992369', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54261000', '8001039277', 'EL ZULIA', '54', '01', 'alcaldia@elzulia-norte de santander.gov.co', 0, '40', 'CTE', 'TIRIAOFU5bmJuEancFxjxA==', '8001039277', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54405000', '8070036594', 'LOS PATIOS', '54', '01', 'alcaldia@lospatios-norte de santander.gov.co', 0, '23', 'AHO', 'RWNN064ag19fFT6d+JYx5Q==', '8070036594', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54498000', '8905011022', 'OCAÑA', '54', '01', 'alcaldia@ocana-norte de santander.gov.co', 0, '50', 'CTE', 'wNQ22IBTG76nctcJYo7Zew==', '8905011022', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68861000', '8902056776', 'VELEZ', '68', '01', 'alcaldia@velez-santander.gov.co', 0, '07', 'CTE', '3vtc/gRZPyi7C9+Qb8m4iQ==', '8902056776', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('70001000', '8001040626', 'SINCELEJO', '70', '01', 'alcaldia@sincelejo-sucre.gov.co', 0, '02', 'AHO', 'Cg3Om2A7urEvdP4LvWxeeg==', '8001040626', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('70215000', '8922800322', 'COROZAL', '70', '01', 'alcaldia@corozal-sucre.gov.co', 0, '01', 'AHO', 'AHsaVb9gFEndV+Wtll7QRA==', '8230019321', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('70670000', '8922800211', 'SAMPUES', '70', '01', 'alcaldia@sampues-sucre.gov.co', 0, '40', 'CTE', 'xopgrAyLl3svGtKbDUAcTw==', '8922800211', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73000000', '8001136727', 'DPTAL TOLIMA', '73', '04', 'alcaldia@dptaltolima-tolima.gov.co', 0, '01', 'AHO', 'AZjR7cGT00y93pIyaR7oyg==', '8001136727', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73001000', '8090710657', 'IBAGUE', '73', '04', 'alcaldia@ibague-tolima.gov.co', 0, '02', 'AHO', '/KGAp6vuULXWvbfy/pA7IA==', '8090710657', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73026000', '8001136727', 'ALVARADO', '73', '04', 'alcaldia@alvarado-tolima.gov.co', 0, '01', 'AHO', 'AZjR7cGT00y93pIyaR7oyg==', '8001136727', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73055000', '8001136727', 'GUAYABAL', '73', '04', 'alcaldia@guayabal-tolima.gov.co', 0, '01', 'AHO', 'AZjR7cGT00y93pIyaR7oyg==', '8001136727', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73124000', '8907008592', 'CAJAMARCA', '73', '04', 'alcaldia@cajamarca-tolima.gov.co', 0, '40', 'CTE', 'RVr9twvDoZyXER13a24LuA==', '8907008592', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73168000', '8001136727', 'CHAPARRAL', '73', '04', 'alcaldia@chaparral-tolima.gov.co', 0, '01', 'AHO', 'AZjR7cGT00y93pIyaR7oyg==', '8001136727', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73268000', '8907020270', 'ESPINAL', '73', '04', 'alcaldia@espinal-tolima.gov.co', 0, '50', 'AHO', 'UUArIMdMG4zxfvma5wr5pg==', '8907020270', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73283000', '8001000563', 'FRESNO', '73', '04', 'alcaldia@fresno-tolima.gov.co', 0, '50', 'AHO', 'xhx/gUXcd2Txfvma5wr5pg==', '8001000563', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73319000', '8001136727', 'GUAMO TOLIMA', '73', '04', 'alcaldia@guamotolima-tolima.gov.co', 0, '01', 'AHO', 'AZjR7cGT00y93pIyaR7oyg==', '8001136727', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73349000', '8001000588', 'HONDA', '73', '04', 'alcaldia@honda-tolima.gov.co', 0, '02', 'AHO', 'cFPOa9f3/4ZpGCozvP9KhA==', '8001000588', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73411000', '8001000610', 'LIBANO', '73', '04', 'alcaldia@libano-tolima.gov.co', 0, '01', 'AHO', 'VXjhWs96w8Kgd9+oLNw7EA==', '8001000610', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73443000', '8907013421', 'MARIQUITA', '73', '04', 'alcaldia@mariquita-tolima.gov.co', 0, '01', 'AHO', 'OhzN5Ig8BaVfFT6d+JYx5Q==', '8907013421', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73449000', '8907019334', 'MELGAR', '73', '04', 'alcaldia@melgar-tolima.gov.co', 0, '51', 'AHO', 'D34YN1nNCqQxGtiYMNN/YQ==', '8907019334', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73585000', '8001136727', 'PURIFICACIÓN', '73', '04', 'alcaldia@purificacion-tolima.gov.co', 0, '01', 'AHO', 'AZjR7cGT00y93pIyaR7oyg==', '8001136727', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73873000', '8001001475', 'VILLARICA TOLIMA', '73', '04', 'alcaldia@villaricatolima-tolima.gov.co', 0, '40', 'CTE', 'tOTADypfh9pJVD1no8uGLQ==', '8001001475', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76001000', '8903114250', 'CALI', '76', '02', 'alcaldia@cali-valle del cauca.gov.co', 0, '01', 'AHO', '32kj9MZ95NTdV+Wtll7QRA==', '8903114250', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76036000', '8919004434', 'ANDALUCIA', '76', '02', 'alcaldia@andalucia-valle del cauca.gov.co', 0, '23', 'CTE', '62Nbw4FU1gWnctcJYo7Zew==', '8919004434', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76041000', '8001005328', 'ANSERMANUEVA', '76', '02', 'alcaldia@ansermanueva-valle del cauca.gov.co', 0, '07', 'AHO', 'xMwh//jStYQtX/NzNz8Y3Q==', '8001005328', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76109000', '8903990453', 'BUENAVENTURA', '76', '02', 'alcaldia@buenaventura-valle del cauca.gov.co', 0, '23', 'CTE', 'FR6Z3oPoJd0vdP4LvWxeeg==', '8001148466', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76111000', '8913800335', 'BUGA', '76', '02', 'alcaldia@buga-valle del cauca.gov.co', 0, '07', 'CTE', '3ATqjuLbNv/LSB6F2dHKog==', '8300536309', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76113000', '8919003531', 'BUGALAGRANDE', '76', '02', 'alcaldia@bugalagrande-valle del cauca.gov.co', 0, '07', 'AHO', 'PE8ykNLwoRTQTg0oBcZFQg==', '8919003531', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76122000', '8919006606', 'CAICEDONIA', '76', '02', 'alcaldia@caicedonia-valle del cauca.gov.co', 0, '50', 'AHO', 'mGF4oPGnRcbdV+Wtll7QRA==', '8001148480', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76130000', '8913800381', 'CANDELARIA VALLE', '76', '02', 'alcaldia@candelariavalle-valle del cauca.gov.co', 0, '01', 'AHO', '9XYxBn5YnMlfFT6d+JYx5Q==', '8913800381', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76147000', '8919004932', 'CARTAGO', '76', '02', 'alcaldia@cartago-valle del cauca.gov.co', 0, '23', 'CTE', 'NFlfAOov2s6gd9+oLNw7EA==', '9004046499', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76223000', '8001005145', 'DAGUA_DIVIPO_ERRADO', '76', '02', 'alcaldedagua@hotmail.com', 0, '40', 'AHO', 'QLpJEF43MMrRMkVrWsC5Dg==', '8001005145', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76248000', '8001005335', 'EL CERRITO', '76', '02', 'alcaldia@elcerrito-valle del cauca.gov.co', 0, '01', 'CTE', 'b8QXNP2NtOZpGCozvP9KhA==', '8001005335', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76275000', '8001005191', 'FLORIDA', '76', '02', 'alcaldia@florida-valle del cauca.gov.co', 0, '40', 'AHO', 'F5b08OWsn9BmuKdV+zShWw==', '8001005191', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76306000', '8001005201', 'GINEBRA', '76', '02', 'alcaldia@ginebra-valle del cauca.gov.co', 0, '01', 'CTE', 'aSjsE8yn0/1pGCozvP9KhA==', '8001005201', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76318000', '8913800897', 'GUACARI', '76', '02', 'alcaldia@guacari-valle del cauca.gov.co', 0, '01', 'CTE', 'C0wyqUFkmf+gd9+oLNw7EA==', '8913800897', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76364000', '8903990460', 'JAMUNDI', '76', '02', 'alcaldia@jamundi-valle del cauca.gov.co', 0, '23', 'CTE', '3Eu6ham2kandV+Wtll7QRA==', '8903990460', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76377000', '8001005217', 'LA CUMBRE', '76', '02', 'alcaldia@lacumbre-valle del cauca.gov.co', 0, '01', 'CTE', 'gacf1jvDDGmnctcJYo7Zew==', '8001005217', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76400000', '8919011093', 'LA UNION VALLE', '76', '02', 'alcaldia@launionvalle-valle del cauca.gov.co', 0, '07', 'AHO', 'v6d5kLN/RqO7HfBw8T+tlA==', '8919011093', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76520000', '8913800073', 'PALMIRA', '76', '02', 'alcaldia@palmira-valle del cauca.gov.co', 0, '01', 'CTE', 'xug1kQiUEfYEMeyrgj8eUA==', '8913800073', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76563000', '8913801150', 'PRADERA', '76', '02', 'alcaldia@pradera-valle del cauca.gov.co', 0, '07', 'AHO', '/lGk/mM097NRkYbBShDorw==', '8001431573', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76616000', '8919003579', 'RIOFRÍO', '76', '02', 'alcaldia@riofrio-valle del cauca.gov.co', 0, '02', 'CTE', 'nv46Kda2Sd1pGCozvP9KhA==', '8919003579', 1, 1, 1, 1, 0);
commit;
prompt 100 records committed...
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76622000', '8919002896', 'ROLDANILLO', '76', '02', 'alcaldia@roldanillo-valle del cauca.gov.co', 0, '50', 'CTE', '3kvtRvySTuuUNV4jAlFmXg==', '8919002896', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76670000', '8001005263', 'SAN PEDRO VALLE', '76', '02', 'alcaldia@sanpedrovalle-valle del cauca.gov.co', 0, '02', 'CTE', 'g5Z2EgAssGaUNV4jAlFmXg==', '8001005263', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76736000', '8001005270', 'SEVILLA ', '76', '02', 'alcaldia@sevilla-valle del cauca.gov.co', 0, '01', 'CTE', 'EWu+xHWYEcDxfvma5wr5pg==', '8001005270', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76823000', '8919009854', 'TORO', '76', '02', 'alcaldia@toro-valle del cauca.gov.co', 0, '40', 'CTE', '8B/QpVapchxV9hf+bk+80g==', '8919009854', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68255000', '8902081990', 'EL PLAYON', '68', '01', 'alcaldia@elplayon-santander.gov.co', 0, '50', 'CTE', 'og2ik3klXuKgd9+oLNw7EA==', '8902081990', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68276000', '8001151718', 'FLORIDABLANCA', '68', '01', 'alcaldia@floridablanca-santander.gov.co', 0, '51', 'CTE', 'wCoufOoqInIX4gGwoWVKiA==', '8001151718', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68307000', '8902048026', 'GIRON', '68', '01', 'alcaldia@giron-santander.gov.co', 0, '02', 'CTE', 'O0gnslwK+0EvdP4LvWxeeg==', '8902048026', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15204000', '8918010698', 'COMBITA', '15', '03', 'alcaldia@combita-boyac¿.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15238000', '8918551381', 'DUITAMA', '15', '03', 'alcaldia@duitama-boyac¿.gov.co', 0, '52', 'AHO', '1cYS1AzKavIEMeyrgj8eUA==', '8918551381', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15322000', '8918010698', 'GUATEQUE', '15', '03', 'alcaldia@guateque-boyac¿.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15491000', '8918010698', 'NOBSA', '15', '03', 'alcaldia@nobsa-boyac¿.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15516000', '8918012401', 'PAIPA', '15', '03', 'alcaldia@paipa-boyac¿.gov.co', 0, '02', 'AHO', 'emgj64GXL/bHxTAfI9M2LQ==', '8918012401', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15572000', '8918004664', 'PUERTO BOYACA', '15', '03', 'alcaldia@puertoboyaca-boyac¿.gov.co', 0, '07', 'AHO', 'OAOQma8Ts9bV42vcDMnnTw==', '8918004664', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15632000', '8918010698', 'SABOYA', '15', '03', 'alcaldia@saboya-boyac¿.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15693000', '8918010698', 'SANTA ROSA DE VITERBO', '15', '03', 'alcaldia@santarosadeviterbo-boyac¿.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15759000', '8260002264', 'SOGAMOSO', '15', '03', 'alcaldia@sogamoso-boyac¿.gov.co', 0, '51', 'AHO', 'fMzbIwNex+xREwGqGF+Ljg==', '8260002264', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15806000', '8918553616', 'TIBASOSA', '15', '03', 'alcaldia@tibasosa-boyac¿.gov.co', 0, '01', 'CTE', 'ioXuFCwURVSgd9+oLNw7EA==', '8918553616', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17001000', '8908010537', 'MANIZALES', '17', '02', 'alcaldia@manizales-caldas.gov.co', 0, '07', 'CTE', 'sj6x31fH0M0myq2FO8a5zQ==', '8908010537', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17013000', '8908011320', 'AGUADAS', '17', '02', 'alcaldia@aguadas-caldas.gov.co', 0, '40', 'CTE', 'ZgV0ukqoxUgr9sdx1lT2gg==', '8908011320', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17042000', '8908011391', 'ANSERMA', '17', '02', 'alcaldia@anserma-caldas.gov.co', 0, '50', 'AHO', 'NbTqvU9T/RSnctcJYo7Zew==', '8908011391', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17050000', '8908011424', 'ARANZAZU', '17', '02', 'alcaldia@aranzazu-caldas.gov.co', 0, '50', 'CTE', 'MHbQ0OnpDkhfFT6d+JYx5Q==', '8908011424', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17174000', '8908011338', 'CHINCHINA', '17', '02', 'alcaldia@chinchina-caldas.gov.co', 0, '01', 'CTE', '0AwtAAUyk0MvdP4LvWxeeg==', '8908011338', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17380000', '8908011306', 'LA DORADA', '17', '02', 'alcaldia@ladorada-caldas.gov.co', 0, '01', 'CTE', 'MVu13Co46K/xfvma5wr5pg==', '8908011306', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17433000', '8908025059', 'MANZANARES', '17', '02', 'alcaldia@manzanares-caldas.gov.co', 0, '50', 'CTE', 'aDrwmURLIpfdV+Wtll7QRA==', '8908025059', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17486000', '8908011352', 'NEIRA', '17', '02', 'alcaldia@neira-caldas.gov.co', 0, '50', 'CTE', 'czkaZ+u13begd9+oLNw7EA==', '8908011352', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17524000', '8908011417', 'PALESTINA CALDAS', '17', '02', 'alcaldia@palestinacaldas-caldas.gov.co', 0, '01', 'CTE', '+pGyE6ZXvVOUNV4jAlFmXg==', '8908011417', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17614000', '8908011384', 'RIOSUCIO', '17', '02', 'alcaldia@riosucio-caldas.gov.co', 0, '01', 'CTE', 'WDE2abZF8t6nctcJYo7Zew==', '8908011384', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17616000', '8000954611', 'RISARALDA', '17', '02', 'alcaldia@risaralda-caldas.gov.co', 0, '50', 'CTE', 'RsrnTqHcV3rdV+Wtll7QRA==', '8000954611', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17653000', '8908011313', 'SALAMINA CALDAS', '17', '02', 'alcaldia@salaminacaldas-caldas.gov.co', 0, '40', 'CTE', 'I2su0z1+bsFFLB2D6nISAg==', '8908011313', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17665000', '8100019988', 'SAN JOSE', '17', '02', 'alcaldia@sanjose-caldas.gov.co', 0, '50', 'CTE', 'iMg90W7qyAvdV+Wtll7QRA==', '8100019988', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17777000', '8908011503', 'SUPIA', '17', '02', 'alcaldia@supia-caldas.gov.co', 0, '50', 'CTE', 'sL+fF46RWZmUNV4jAlFmXg==', '8908011503', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17873000', '8908010521', 'VILLAMARÍA', '17', '02', 'alcaldia@villamaria-caldas.gov.co', 0, '50', 'CTE', '3M0zX2NNUXOUNV4jAlFmXg==', '8908010521', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17877000', '8000908335', 'VITERBO', '17', '02', 'alcaldia@viterbo-caldas.gov.co', 0, '40', 'CTE', 'Ac/7SQAZ+rgYz1rccarqeQ==', '8000908335', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25151000', '8999991140', 'CAQUEZA', '25', '03', 'alcaldia@caqueza-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25175000', '8999991728', 'CHIA', '25', '03', 'alcaldia@chia-cundinamarca.gov.co', 0, '01', 'AHO', 'x8dE/yJF79jdV+Wtll7QRA==', '8999991728', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25183000', '8999991140', 'CHOCONTA', '25', '03', 'alcaldia@choconta-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25214000', '8999991140', 'COTA', '25', '03', 'alcaldia@cota-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25260000', '8999991140', 'EL ROSAL', '25', '03', 'alcaldia@elrosal-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25269000', '8999993281', 'FACATATIVA', '25', '03', 'alcaldia@facatativa-cundinamarca.gov.co', 0, '50', 'AHO', 'mYb/NUQ3tsGnctcJYo7Zew==', '8999993281', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25290000', '8906800084', 'FUSAGASUGA', '25', '03', 'alcaldia@fusagasuga-cundinamarca.gov.co', 0, '50', 'AHO', 'ZcosWvLNrPugd9+oLNw7EA==', '8906800084', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25307000', '8906803784', 'GIRARDOT ', '25', '03', 'alcaldia@girardot-cundinamarca.gov.co', 0, '02', 'AHO', 'IsUj/w4Af3dokVZ2Teu2FQ==', '8906803784', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25335000', '8000947011', 'GUAYABETAL', '25', '03', 'alcaldia@guayabetal-cundinamarca.gov.co', 0, '02', 'CTE', 'mz54x9n790ZfFT6d+JYx5Q==', '8000947011', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25377000', '8999991140', 'LA CALERA', '25', '03', 'alcaldia@lacalera-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25473000', '8999991140', 'MOSQUERA CUNDINAMARCA', '25', '03', 'alcaldia@mosqueracundinamarca-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25513000', '8999994754', 'PACHO', '25', '03', 'alcaldia@pacho-cundinamarca.gov.co', 0, '07', 'AHO', 'Knfw0KkWp593e4HMRmCN7Q==', '8999994754', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25572000', '8999994138', 'PUERTO SALGAR', '25', '03', 'alcaldia@puertosalgar-cundinamarca.gov.co', 0, '40', 'CTE', 'vK2cwsUU7UXquU72u3sLBA==', '8999994138', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25612000', '8999991140', 'RICAURTE CUNDINAMARCA', '25', '03', 'alcaldia@ricaurtecundinamarca-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25754000', '8999991140', 'SOACHA', '25', '03', 'alcaldia@soacha-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25843000', '8999992812', 'UBATE', '25', '03', 'alcaldia@ubate-cundinamarca.gov.co', 0, '52', 'AHO', 'hIXawe7S31mgd9+oLNw7EA==', '8999992812', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25875000', '8999991140', 'VILLETA', '25', '03', 'alcaldia@villeta-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25899000', '8999991140', 'ZIPAQUIRA', '25', '03', 'alcaldia@zipaquira-cundinamarca.gov.co', 0, '52', 'AHO', 'GMgntDsavSZpGCozvP9KhA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('27000000', '8916800103', 'DPTAL CHOCO', '27', '01', 'alcaldia@dptalchoco-choc¿.gov.co', 0, '01', 'CTE', '7Lu0hN4XVTjxfvma5wr5pg==', '8916800103', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('27001000', '8916800110', 'QUIBDO', '27', '01', 'alcaldia@quibdo-choc¿.gov.co', 0, '52', 'AHO', 'sbSwOCLpcOBpGCozvP9KhA==', '8916800110', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41000000', '8001150053', 'DPTAL HUILA', '41', '04', 'alcaldia@dptalhuila-huila.gov.co', 0, '02', 'AHO', '2jjqDRa4G+Gpga8bRpoWow==', '8001150053', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('18001000', '8000957282', 'FLORENCIA', '18', '04', 'alcaldia@florencia-caquet¿.gov.co', 0, '02', 'AHO', 'gRJ4P+420Fi5Vac5qId3Iw==', '8000957282', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('18094000', '8911902153', 'BELEN ANDAQUIES', '18', '04', 'alcaldia@belenandaquies-caquet¿.gov.co', 0, '07', 'CTE', 'nEKUua6j5qK0M+MADOAjSA==', '8911902153', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('18256000', '8911902153', 'EL PAUJÍL', '18', '04', 'alcaldia@elpaujil-caqueta.gov.co', 0, '07', 'CTE', 'nEKUua6j5qK0M+MADOAjSA==', '8911902153', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('18753000', '8911902153', 'SAN VICENTE DEL CAGUAN', '18', '04', 'alcaldia@sanvicentedelcaguan-caquet¿.gov.co', 0, '07', 'CTE', 'nEKUua6j5qK0M+MADOAjSA==', '8911902153', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19001000', '8915800064', 'POPAYÁN', '19', '02', 'alcaldia@popayan-cauca.gov.co', 0, '07', 'AHO', 'FPgT2bcX7gZyqmUjZYUvhA==', '8915800064', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19100000', '8000959612', 'BOLIVAR CAUCA', '19', '02', 'alcaldia@bolivarcauca-cauca.gov.co', 0, '40', 'CTE', 'AT3dSdV7wn0rIhM7Yl4DTA==', '8000959612', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68397000', '8000966051', 'LA PAZ SANTANDER', '68', '01', 'alcaldia@lapazsantander-santander.gov.co', 0, '40', 'CTE', 'jIYEw+d9DaAeKow12oQlCQ==', '8000966051', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68406000', '8902061107', 'LEBRIJA', '68', '01', 'alcaldia@lebrija-santander.gov.co', 0, '50', 'CTE', 'aojlE3iGWJZpGCozvP9KhA==', '8902061107', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68432000', '8902052291', 'MALAGA', '68', '01', 'alcaldia@malaga-santander.gov.co', 0, '07', 'CTE', 'jnEg/dtUmUZHqeXrFMewXA==', '8902052291', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68500000', '8902100483', 'OIBA', '68', '01', 'alcaldia@oiba-santander.gov.co', 0, '50', 'CTE', 'etV/y748Wj8EMeyrgj8eUA==', '8902109487', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68547000', '8902053836', 'PIEDECUESTA', '68', '01', 'alcaldia@piedecuesta-santander.gov.co', 0, '40', 'CTE', 'jy3zmqSjCBKaqZqL2MmNLA==', '8902053836', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68572000', '8902092993', 'PUENTE NACIONAL', '68', '01', 'alcaldia@puentenacional-santander.gov.co', 0, '02', 'CTE', '9xPjUE7LpeSuN6L15+gZZg==', '8902092993', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68615000', '8902046463', 'RIONEGRO SANTANDER', '68', '01', 'alcaldia@rionegrosantander-santander.gov.co', 0, '50', 'CTE', 'jIvIDxv2rQ5pGCozvP9KhA==', '8902046463', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68655000', '8902046431', 'SABANA DE TORRES', '68', '01', 'alcaldia@sabanadetorres-santander.gov.co', 0, '01', 'CTE', 'ZElPnHP+oMhpGCozvP9KhA==', '8902046431', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68679000', '8000998241', 'SAN GIL', '68', '01', 'alcaldia@sangil-santander.gov.co', 0, '40', 'CTE', 'kWMsXrEjL56yrhDF/sZ4zg==', '8000998241', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68689000', '8000998296', 'SAN VICENTE DE CHUCURI', '68', '01', 'alcaldia@sanvicentedechucuri-santander.gov.co', 0, '50', 'CTE', 'AROq1PSmjNRfFT6d+JYx5Q==', '8000998296', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68755000', '8902036888', 'SOCORRO', '68', '01', 'alcaldia@socorro-santander.gov.co', 0, '50', 'CTE', 'aM5+2K+ivgFpGCozvP9KhA==', '8902036888', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68770000', '8902049855', 'SUAITA', '68', '01', 'alcaldia@suaita-santander.gov.co', 0, '52', 'AHO', 'GEIxKjxl6fSgd9+oLNw7EA==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05001000', '8909052111', 'MEDELLIN', '05', '01', 'alcaldia@medellin-antioquia.gov.co', 0, '52', 'AHO', '5kGUCkJKPOwvdP4LvWxeeg==', '8909052111', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08832000', '8000535523', 'TUBARA', '08', '04', 'alcaldia@tubara.gov.co', 0, '01', 'AHO', 'PEr9NydiD64EMeyrgj8eUA==', '8000535523', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05002000', '8909811955', 'ABEJORRAL', '05', '01', 'alcaldia@abejorral-antioquia.gov.co', 0, '01', 'AHO', 'GeVA02FC6XWgd9+oLNw7EA==', '8909811955', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05030000', '8909817320', 'AMAGA', '05', '01', 'alcaldia@amaga-antioquia.gov.co', 0, '51', 'CTE', 'UsXUiXH2HouJDDUhleNlZQ==', '8909817320', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05031000', '8909815180', 'AMALFI', '05', '01', 'alcaldia@amalfi-antioquia.gov.co', 0, '50', 'CTE', '6dRvI0+WV60EMeyrgj8eUA==', '8909815180', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05034000', '8909803427', 'ANDES', '05', '01', 'alcaldia@andes-antioquia.gov.co', 0, '50', 'CTE', 'z7tsxjUMYhcvdP4LvWxeeg==', '8909803427', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05042000', '8909075691', 'SANTA FE DE ANTIOQUIA', '05', '01', 'alcaldia@santafedeantioquia-antioquia.gov.co', 0, '40', 'CTE', 'g16S1L5+NWo4LH1M1oGy+g==', '8909075691', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05045000', '8909800952', 'APARTADO', '05', '01', 'alcaldia@apartado-antioquia.gov.co', 0, '02', 'AHO', '5R7CXp21zSDq3YQw0ezK4w==', '8909800952', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05051000', '8909856234', 'ARBOLETES', '05', '01', 'alcaldia@arboletes-antioquia.gov.co', 0, '40', 'CTE', 'ri+0jMSJyt4LniOZn0cDpA==', '8909856234', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05079000', '8909804457', 'BARBOSA ANTIOQUIA', '05', '01', 'alcaldia@barbosaantioquia-antioquia.gov.co', 0, '07', 'AHO', 'FjrEJCRk/U4uSttXXCa5Bg==', '8909804457', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05088000', '8909801121', 'BELLO', '05', '01', 'alcaldia@bello-antioquia.gov.co', 0, '52', 'AHO', 'ljSgq1dr0R8EMeyrgj8eUA==', '8909801121', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05101000', '8909803309', 'CIUDAD BOLIVAR', '05', '01', 'alcaldia@ciudadbolivar-antioquia.gov.co', 0, '50', 'AHO', 'zDyEIKhjmm7dV+Wtll7QRA==', '8909803309', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05120000', '8909815671', 'CACERES', '05', '01', 'alcaldia@caceres-antioquia.gov.co', 0, '40', 'CTE', 'JjblJIhuG1FT63zWv+DgcQ==', '8909815671', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05129000', '8909804471', 'CALDAS ANTIOQUIA', '05', '01', 'alcaldia@caldasantioquia-antioquia.gov.co', 0, '07', 'CTE', '4S+R4elfDBxRCP4G6SZeeQ==', '8909804471', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05138000', '8909822388', 'CAÑASGORDAS', '05', '01', 'alcaldia@canasgordas-antioquia.gov.co', 0, '40', 'CTE', 'e+7HvBdJEzUaSjPeDyGIYw==', '8909822388', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05147000', '8909853168', 'CAREPA', '05', '01', 'alcaldia@carepa-antioquia.gov.co', 0, '01', 'CTE', '4vnk98HafaXdV+Wtll7QRA==', '8909853168', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05148000', '8909826169', 'CARMEN DE VIBORAL', '05', '01', 'alcaldia@carmendelviboral-antioquia.gov.co', 0, '01', 'CTE', 'W2lC/ZJZ6+5pGCozvP9KhA==', '8909826169', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05154000', '8909064452', 'CAUCASIA', '05', '01', 'alcaldia@caucasia-antioquia.gov.co', 0, '13', 'CTE', 'mabtR1rsaIigd9+oLNw7EA==', '8909064452', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05172000', '8909809988', 'CHIGORODO', '05', '01', 'alcaldia@chigorodo-antioquia.gov.co', 0, '02', 'CTE', 'lx1KBcIv5aDGTITqbzp0xQ==', '8909809988', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05190000', '8909109133', 'CISNEROS', '05', '01', 'alcaldia@cisneros-antioquia.gov.co', 0, '50', 'CTE', 'r67fNWkIqIOUNV4jAlFmXg==', '8909109133', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05197000', '8909846340', 'COCORNA', '05', '01', 'alcaldia@cocorna-antioquia.gov.co', 0, '40', 'CTE', 'irmyijWb0H0pN7QFp8EdBQ==', '8909846340', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05212000', '8909807673', 'COPACABANA', '05', '01', 'alcaldia@copacabana-antioquia.gov.co', 0, '51', 'AHO', 'NrOp6Mog71r0w+N7hLnPwg==', '8909807673', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05237000', '8909840438', 'DON MATIAS', '05', '01', 'alcaldia@donmatias-antioquia.gov.co', 0, '07', 'CTE', 'V6pLMgcAnDrPvhaS4NEeZA==', '8909840438', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05266000', '8909071065', 'ENVIGADO', '05', '01', 'alcaldia@envigado-antioquia.gov.co', 0, '01', 'AHO', '88YPOrlMaSYvdP4LvWxeeg==', '8909071065', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05284000', '8909837068', 'FRONTINO', '05', '01', 'alcaldia@frontino-antioquia.gov.co', 0, '40', 'CTE', 'JFtu68/wvmozaqZTWQSprA==', '8909837068', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05306000', '8909837867', 'GIRALDO', '05', '01', 'alcaldia@giraldo-antioquia.gov.co', 0, '50', 'CTE', 'WowLp/EBEy8EMeyrgj8eUA==', '8909837867', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05308000', '8909808071', 'GIRARDOTA', '05', '01', 'alcaldia@girardota-antioquia.gov.co', 0, '07', 'AHO', 'aoARAZQOvNzdcH8gRbpY/w==', '8909808071', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05318000', '8909820557', 'GUARNE', '05', '01', 'alcaldia@guarne-antioquia.gov.co', 0, '07', 'AHO', '+uAFpGrFL4m9V+pWcjjWnA==', '8909820557', 1, 1, 1, 1, 0);
commit;
prompt 200 records committed...
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05321000', '8909838303', 'GUATAPE', '05', '01', 'alcaldia@guatape-antioquia.gov.co', 0, '23', 'CTE', 'HDbkIs7x6tRfFT6d+JYx5Q==', '8909838303', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05360000', '8909800938', 'ITAGUI', '05', '01', 'alcaldia@itagui-antioquia.gov.co', 0, '02', 'AHO', '4ucFMKbJscppGCozvP9KhA==', '8909800938', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05368000', '8909810695', 'JERICO ANTIOQUIA', '05', '01', 'alcaldia@jericoantioquia-antioquia.gov.co', 0, '07', 'AHO', 'pjDHLwKzChzckJAtr/N8aw==', '8909810695', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05376000', '8909812075', 'LA CEJA', '05', '01', 'alcaldia@laceja-antioquia.gov.co', 0, '13', 'AHO', '7JmuvQvF91ndV+Wtll7QRA==', '8909812075', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05390000', '8110090178', 'LA PINTADA', '05', '01', 'alcaldia@lapintada-antioquia.gov.co', 0, '07', 'CTE', '5vJg3xFaPZJSOgOllVPDJw==', '8110090178', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05400000', '8909819950', 'LA UNION ANTIOQUIA', '05', '01', 'alcaldia@launionantioquia-antioquia.gov.co', 0, '07', 'CTE', 'umtUEtooF/N8OhHQpXeF/g==', '8909819950', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05425000', '8909809583', 'MACEO', '05', '01', 'alcaldia@maceo-antioquia.gov.co', 0, '23', 'CTE', 'UPND7XFqqDa93pIyaR7oyg==', '8909809583', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05440000', '8909837161', 'MARINILLA', '05', '01', 'alcaldia@marinilla-antioquia.gov.co', 0, '07', 'AHO', 'nyDKbXtcPZmq8jfcUaUPmA==', '8909837161', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05541000', '8909809171', 'PEnOL', '05', '01', 'alcaldia@penol-antioquia.gov.co', 0, '40', 'CTE', '1lJwtbEe9rowDiAfH4bwyg==', '8909809171', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05579000', '8909800493', 'PUERTO BERRIO', '05', '01', 'alcaldia@puertoberrio-antioquia.gov.co', 0, '01', 'AHO', 'Q3gOmNKNeoenctcJYo7Zew==', '8909800493', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05591000', '8909839064', 'PUERTO TRIUNFO', '05', '01', 'alcaldia@puertotriunfo-antioquia.gov.co', 0, '40', 'CTE', 'C34adIIYnXFes69udXRjCw==', '8909839064', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05607000', '8909836740', 'EL RETIRO', '05', '01', 'alcaldia@retiro-antioquia.gov.co', 0, '40', 'AHO', 'fOr6t74uFR4SsKWseFKiMw==', '8909836740', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05615000', '8909073172', 'RIONEGRO ANTIOQUIA', '05', '01', 'alcaldia@rionegroantioquia-antioquia.gov.co', 0, '01', 'CTE', 'F1Y5isA1bsppGCozvP9KhA==', '8001431573', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05631000', '8909803316', 'SABANETA', '05', '01', 'alcaldia@sabaneta-antioquia.gov.co', 0, '07', 'AHO', 'w2dVLR/GfQbVWy1HXVPxzw==', '8909803316', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05656000', '8909208145', 'SAN JERÓNIMO', '05', '01', 'alcaldia@sanjeronimo-antioquia.gov.co', 0, '40', 'CTE', 'oD7Vy+svPnxdq+6v8lsS3A==', '8909208145', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05660000', '8909843765', 'SAN LUIS ANTIOQUIA', '05', '01', 'alcaldia@sanluisantioquia-antioquia.gov.co', 0, '40', 'CTE', 'INU1Cr4cDozRD3P7ohlVsA==', '8909843765', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05664000', '8909839222', 'SAN PEDRO DE LOS MILAGROS. ANT', '05', '01', 'alcaldia@sanpedrodelosm.ant-antioquia.gov.co', 0, '07', 'CTE', 'Gj0Wxk49LHPhrMyTxtwQzg==', '8909839222', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05670000', '8909808507', 'SAN ROQUE', '05', '01', 'alcaldia@sanroque-antioquia.gov.co', 0, '13', 'CTE', 'La7BXibbyCXxfvma5wr5pg==', '8909808507', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05674000', '8909825067', 'SAN VICENTE', '05', '01', 'alcaldia@sanvicente-antioquia.gov.co', 0, '40', 'CTE', 'DbGnqWmRnLBJVD1no8uGLQ==', '8909825067', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05679000', '8909803441', 'SANTA BARBARA ANTIOQUIA', '05', '01', 'alcaldia@santabarbaraantioquia-antioquia.gov.co', 0, '50', 'CTE', 'R3kpfK6K8RHxfvma5wr5pg==', '8909803441', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05686000', '8909815546', 'SANTA ROSA DE OSOS', '05', '01', 'alcaldia@santarosadeosos-antioquia.gov.co', 0, '07', 'CTE', '5Pb8KrqFsRykv3/PoTv2xA==', '8909815546', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05690000', '8909838034', 'SANTO DOMINGO', '05', '01', 'alcaldia@santodomingo-antioquia.gov.co', 0, '50', 'AHO', 'tP8MKe3E+XGgd9+oLNw7EA==', '8909838034', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05697000', '8909838138', 'SANTUARIO ANTIOQUIA', '05', '01', 'alcaldia@santuarioantioquia-antioquia.gov.co', 0, '07', 'AHO', '3/MJI2beVCZ9uGP+ouoGZQ==', '8909838138', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05761000', '8909810807', 'SOPETRAN', '05', '01', 'alcaldia@sopetran-antioquia.gov.co', 0, '40', 'CTE', 'cFlKNY2Gt5FeT82b2WfpOA==', '8909810807', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05756000', '8909803577', 'SONSON', '05', '01', 'alcaldia@sonson-antioquia.gov.co', 0, '50', 'AHO', 'M0z0I2hQlN1pGCozvP9KhA==', '8909803577', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05790000', '8909842957', 'TARAZA', '05', '01', 'alcaldia@taraza-antioquia.gov.co', 0, '40', 'CTE', 'a5d616tpqyVDMkbm/P64tQ==', '8909842957', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05792000', '8909825834', 'TARSO', '05', '01', 'alcaldia@tarso-antioquia.gov.co', 0, '07', 'CTE', 'Z6xixCEl/9zqQYmzFsxacw==', '8909825834', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05809000', '8909807817', 'TITIRIBI', '05', '01', 'alcaldia@titiribi-antioquia.gov.co', 0, '40', 'CTE', 'jCSBbS5yuAbzW8ViJeqM2Q==', '8909807817', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05837000', '8909811385', 'TURBO', '05', '01', 'alcaldia@turbo-antioquia.gov.co', 0, '01', 'CTE', 'CiPqOZ+y1OC93pIyaR7oyg==', '8909811385', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05842000', '8909845754', 'URAMITA', '05', '01', 'alcaldia@uramita-antioquia.gov.co', 0, '01', 'CTE', 'yDlbl2KXcY1fFT6d+JYx5Q==', '8909845754', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05847000', '8909075154', 'URRAO', '05', '01', 'alcaldia@urrao-antioquia.gov.co', 0, '13', 'CTE', 'kZLORqD2w1EEMeyrgj8eUA==', '8909075154', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05854000', '8909811061', 'VALDIVIA', '05', '01', 'alcaldia@valdivia-antioquia.gov.co', 0, '01', 'CTE', '6CmdERls5yppGCozvP9KhA==', '8909811061', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05861000', '8909807641', 'VENECIA', '05', '01', 'alcaldia@venecia-antioquia.gov.co', 0, '50', 'AHO', '68ooElGJ7+IvdP4LvWxeeg==', '8909807641', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05887000', '8909800961', 'YARUMAL', '05', '01', 'alcaldia@yarumal-antioquia.gov.co', 0, '50', 'CTE', 'OK1VsW99+jBpGCozvP9KhA==', '8909800961', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08000000', '8001151021', 'DPTAL ATLANTICO', '08', '04', 'alcaldia@dptalatlantico-atl¿ntico.gov.co', 0, '52', 'AHO', '7P1xgl2LpskvdP4LvWxeeg==', '8001151021', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08001000', '8901020181', 'BARRANQUILLA', '08', '04', 'alcaldia@barranquilla-atl¿ntico.gov.co', 1, '51', 'AHO', 'K67gTkjjdeiMy/uOpShnSg==', '8605251485', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08078000', '8901123718', 'BARANOA', '08', '04', 'alcaldia@baranoa-atl¿ntico.gov.co', 0, '40', 'AHO', 'M4QMC7EeH2Nj4lFM/OvRZg==', '8901123718', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08137000', '8000944624', 'CAMPO DE LA CRUZ', '08', '04', 'alcaldia@campodelacruz-atl¿ntico.gov.co', 0, '40', 'CTE', 'iMvFqXMDTGyXoSn+s/hvSQ==', '8000944624', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08296000', '8901024720', 'GALAPA', '08', '04', 'alcaldia@galapa-atl¿ntico.gov.co', 0, '52', 'AHO', 'FixQfPnpjdtfFT6d+JYx5Q==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08421000', '8901030034', 'LURUACO', '08', '04', 'alcaldia@luruaco-atl¿ntico.gov.co', 0, '40', 'AHO', 'lPRQDKGMKGKjkB2Z9hjuaQ==', '8901030034', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08433000', '8901143351', 'MALAMBO', '08', '04', 'alcaldia@malambo-atl¿ntico.gov.co', 0, '52', 'CTE', 'vuKxbaYMyoqUNV4jAlFmXg==', '8901143351', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08436000', '8000192184', 'MANATI', '08', '04', 'alcaldia@manati-atl¿ntico.gov.co', 0, '40', 'AHO', 'JzjrANFHem5SJ9zGho82Bg==', '8000192184', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08520000', '8000684441', 'PALMAR DE VARELA', '08', '04', 'alcaldia@palmardevarela-atl¿ntico.gov.co', 0, '01', 'AHO', 'N86THM3VoWzxfvma5wr5pg==', '8000944498', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08558000', '8000767511', 'POLONUEVO', '08', '04', 'alcaldia@polonuevo-atl¿ntico.gov.co', 0, '52', 'AHO', 'RtuEcD8sWNqnctcJYo7Zew==', '8000767511', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08560000', '8901162789', 'PONEDERA', '08', '04', 'alcaldia@ponedera-atl¿ntico.gov.co', 0, '01', 'AHO', 'ZJbtG7AtW7K93pIyaR7oyg==', '8901162789', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08573000', '8000943862', 'PUERTO COLOMBIA ATLANTICO', '08', '04', 'alcaldia@puertocolombiaatlantico-atl¿ntico.gov.co', 0, '52', 'CTE', 'NRnqP9OLOJ+nctcJYo7Zew==', '9002629905', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08634000', '8901159821', 'SABANAGRANDE', '08', '04', 'alcaldia@sabanagrande-atl¿ntico.gov.co', 0, '07', 'AHO', 'I6fScpWkLW7jHuK2wm5ewg==', '8901159821', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08638000', '8000948444', 'SABANALARGA ATLANTICO', '08', '04', 'alcaldia@sabanalargaatlantico-atl¿ntico.gov.co', 0, '13', 'AHO', 'PJVWUJVHQ0GnctcJYo7Zew==', '8000948444', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08685000', '8001162846', 'SANTO TOMAS', '08', '04', 'alcaldia@santotomas-atl¿ntico.gov.co', 0, '40', 'AHO', 'MYUn71mWJrObLeEVWejqcw==', '8001162846', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08758000', '8020214518', 'SOLEDAD', '08', '04', 'alcaldia@soledad-atl¿ntico.gov.co', 0, '51', 'AHO', 'CVm1hY2YGl+RHWddHUdZ2Q==', '8020214518', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08770000', '8901161590', 'SUAN', '08', '04', 'alcaldia@suan-atl¿ntico.gov.co', 0, '40', 'CTE', 'iMvFqXMDTGxLXO3QcCERHg==', '8901161590', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08849000', '8000943783', 'USIACURI', '08', '04', 'alcaldia@usiacuri-bogot¿ d.c.gov.co', 0, '40', 'CTE', 'mwbpj7UJUu5VQ7b4+GnBfQ==', '8000943783', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('11001000', '8999990619', 'BOGOTA', '11', '05', 'alcaldia@bogota-bol¿var.gov.co', 0, '01', 'AHO', 'gBbGlQuyz2FpGCozvP9KhA==', '8999990619', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13000000', '8001150963', 'DPTAL BOLIVAR', '13', '04', 'alcaldia@dptalbolivar-bol¿var.gov.co', 0, '40', 'CTE', 'X0y92y5liRBzkwqvUG8T6Q==', '8001150963', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13001000', '8904801844', 'CARTAGENA', '13', '04', 'alcaldia@cartagena-bol¿var.gov.co', 1, '51', 'AHO', 'T2VtItLCWUEvcJ9tYj1DEw==', '8300543577', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13052000', '8904802541', 'ARJONA', '13', '04', 'alcaldia@arjona-bol¿var.gov.co', 0, '13', 'CTE', 'RemebgIAKnzdE/wXwpU1Qw==', '8904802541', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13222000', '8001150963', 'CLEMENCIA', '13', '04', 'alcaldia@clemencia-bol¿var.gov.co', 0, '51', 'CTE', 'xYYe7zppRvHKzB/nGHyGkA==', '8001150963', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13244000', '8904800221', 'CARMEN DE BOLIVAR', '13', '04', 'alcaldia@carmendebolivar-bol¿var.gov.co', 0, '01', 'AHO', 'T5T1NM+eCXJfFT6d+JYx5Q==', '8001150995', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13468000', '8904806433', 'MOMPOX', '13', '04', 'alcaldia@mompox-bol¿var.gov.co', 0, '40', 'AHO', 'BoxYv0SqQ7HQ+8nyzd8tBg==', '8904806433', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13657000', '8999991140', 'SAN JUAN DE NEPOMUCENO', '13', '04', 'alcaldia@sanjuandenepomuceno-bol¿var.gov.co', 0, '51', 'CTE', 'xYYe7zppRvHKzB/nGHyGkA==', '8999991140', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13836000', '8904811490', 'TURBACO', '13', '04', 'alcaldia@turbaco-bol¿var.gov.co', 0, '50', 'CTE', 't9WQ8Cx9Ihzxfvma5wr5pg==', '8904811490', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15000000', '8918010698', 'DPTAL BOYACA', '15', '03', 'alcaldia@dptalboyaca-boyac¿.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15001000', '8918008461', 'TUNJA', '15', '03', 'alcaldia@tunja-boyac¿.gov.co', 0, '51', 'CTE', 'Ioqhoi0YlfV4GRxPJWEj+Q==', '8918008461', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15176000', '8918004750', 'CHIQUINQUIRÁ', '15', '03', 'alcaldia@chiquinquira-boyaca.gov.co', 0, '52', 'AHO', 'lUc8k7/n0rxfFT6d+JYx5Q==', '8918004750', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19743000', '8000959866', 'SILVIA', '19', '02', 'alcaldia@silvia-cauca.gov.co', 0, '23', 'CTE', 'bAh9mFmc6N3dV+Wtll7QRA==', '8000959866', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19807000', '8915007425', 'TIMBIO', '19', '02', 'alcaldia@timbio-cauca.gov.co', 0, '40', 'CTE', 'IsBN4WYmL2EsvzSiFP5O2w==', '8915007425', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19824000', '8000318745', 'TOTORO', '19', '02', 'alcaldia@totoro-cauca.gov.co', 0, '40', 'CTE', '+j+EWIF1ZiD86AQABlkiYA==', '8000318745', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19873000', '8170026754', 'VILLA RICA CAUCA_DIVIPO_ERRADO', '19', '02', 'alcaldia@villaricacauca-cauca.gov.co', 0, '23', 'CTE', 'ntc/lfcBf+Ogd9+oLNw7EA==', '8170026754', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19992000', '8001176875', 'SUAREZ CAUCA_DIVIPO_ERRADO', '19', '02', 'alcaldia@suarezcauca-cesar.gov.co', 0, '40', 'CTE', 'InVWGGADLEEXNh+yILN2cg==', '8001176875', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20001000', '8000989118', 'VALLEDUPAR', '20', '01', 'alcaldia@valledupar-cesar.gov.co', 0, '23', 'CTE', '+3aIWM76s6wvdP4LvWxeeg==', '8300536309', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20011000', '8001248333', 'AGUACHICA', '20', '01', 'alcaldia@aguachica-cesar.gov.co', 0, '01', 'AHO', 'cTuvQVj48OkvdP4LvWxeeg==', '8001248333', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20013000', '8000965581', 'AGUSTÍN CODAZZI', '20', '01', 'alcaldia@agustincodazzi-cesar.gov.co', 0, '50', 'AHO', 'v0AoC40mYG7xfvma5wr5pg==', '8001441641', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20060000', '8923011308', 'BOSCONIA', '20', '01', 'alcaldia@bosconia-cesar.gov.co', 0, '01', 'CTE', 'FxIWTGOtdiLdV+Wtll7QRA==', '8923011308', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20178000', '8000965850', 'CHIRIGUANA', '20', '01', 'alcaldia@chiriguana-cesar.gov.co', 0, '40', 'CTE', 'KgOTKUQ2KgBPDiLC102GCQ==', '8000965850', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20228000', '8000965804', 'CURUMANI', '20', '01', 'alcaldia@curumani-cesar.gov.co', 0, '13', 'CTE', 'D3HWShZ1wH2nctcJYo7Zew==', '8000965804', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20517000', '8000966107', 'PAILITAS', '20', '01', 'alcaldia@pailitas-cesar.gov.co', 0, '13', 'AHO', 'GamfwAN1m91fFT6d+JYx5Q==', '8000966107', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20621000', '8000966051', 'LA PAZ CESAR', '20', '01', 'alcaldia@lapazcesar-cesar.gov.co', 0, '40', 'CTE', 'jIYEw+d9DaAeKow12oQlCQ==', '8000966051', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20710000', '8000966192', 'SAN ALBERTO', '20', '01', 'alcaldia@sanalberto-cesar.gov.co', 0, '01', 'AHO', 'FcFxYGov7xa93pIyaR7oyg==', '8000966192', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('23000000', '8001039356', 'DPTAL CORDOBA', '23', '01', 'alcaldia@dptalcordoba-c¿rdoba.gov.co', 0, '23', 'AHO', 'DFowzX1iJypfFT6d+JYx5Q==', '8001431573', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('23001000', '8000967341', 'MONTERIA', '23', '01', 'alcaldia@monteria-c¿rdoba.gov.co', 0, '23', 'AHO', 'MiiRdYB93iHdV+Wtll7QRA==', '8001431573', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('23162000', '8000967445', 'CERETE', '23', '01', 'alcaldia@cerete-c¿rdoba.gov.co', 0, '01', 'CTE', 'D14XvIZAA7jxfvma5wr5pg==', '9001855934', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('23417000', '8000967588', 'LORICA', '23', '01', 'alcaldia@lorica-c¿rdoba.gov.co', 0, '01', 'AHO', 'PpcpdT9JUYS93pIyaR7oyg==', '8300536309', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('23555000', '8000967651', 'PLANETA RICA', '23', '01', 'alcaldia@planetarica-c¿rdoba.gov.co', 0, '13', 'AHO', 'xy+nnF8WGK7dV+Wtll7QRA==', '8000967651', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('23660000', '8000967778', 'SAHAGUN', '23', '01', 'alcaldia@sahagun-c¿rdoba.gov.co', 0, '07', 'AHO', 'XbLzjJxVvjKz5WIZke6UAw==', '8000967778', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05380000', '8909807824', 'LA ESTRELLA', '05', '01', 'alcaldia@laestrella-antioquia.gov.co', 0, '02', 'CTE', 'ksZu41vTAaPdV+Wtll7QRA==', '8909807824', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54518000', '8000076526', 'PAMPLONA', '54', '01', 'alcaldia@pamplona-norte de santander.gov.co', 0, '51', 'AHO', 'mfTxqe8rWjTUDDYx6U97Rw==', '8000076526', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('54874000', '9000048111', 'VILLA ROSARIO', '54', '01', 'alcaldia@villarosario-norte de santander.gov.co', 0, '01', 'AHO', 'HB+uklk+wy/dV+Wtll7QRA==', '9000048111', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63001000', '8900004643', 'ARMENIA QUINDIO', '63', '02', 'alcaldia@armeniaquindio-quindio.gov.co', 0, '07', 'CTE', 'LE83jU02tb/waAgqYenWug==', '8900004643', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63130000', '8900004414', 'CALARCA', '63', '02', 'alcaldia@calarca-quindio.gov.co', 0, '50', 'AHO', 'XNoOYh6npD4EMeyrgj8eUA==', '8900004414', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63190000', '8900015361', 'CIRCASIA', '63', '02', 'alcaldia@circasia-quindio.gov.co', 0, '50', 'CTE', 'LW6kS1QXkt6nctcJYo7Zew==', '8900015361', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63272000', '8900013395', 'FILANDIA', '63', '02', 'alcaldia@finlandia-quindio.gov.co', 0, '40', 'CTE', '39PXteA4PAXoTyO2D7lnKg==', '8900013395', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63401000', '8900005641', 'LA TEBAIDA', '63', '02', 'alcaldia@latebaida-quindio.gov.co', 0, '40', 'CTE', 'fQWd3qn4W2BQ95Ykl3izBA==', '8900005641', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63470000', '8900008581', 'MONTENEGRO', '63', '02', 'alcaldia@montenegro-quindio.gov.co', 0, '07', 'CTE', 'aRZ1EPpZVCt7arz2S4zBSw==', '8900008581', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63594000', '8900006134', 'QUIMBAYA', '63', '02', 'alcaldia@quimbaya-quindio.gov.co', 0, '51', 'CTE', 'bO7wCSlx+unWT2i5MsL7gg==', '8900006134', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('63690000', '8900011270', 'SALENTO', '63', '02', 'alcaldia@salento-risaralda.gov.co', 0, '40', 'CTE', '7SwhwH+ak+qZ+NrCjWhT/w==', '8900011270', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66001000', '8160005588', 'PEREIRA', '66', '02', 'alcaldia@pereira-risaralda.gov.co', 0, '52', 'AHO', 'UQJtXo+p/y9pGCozvP9KhA==', '8160005588', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66045000', '8914800223', 'APIA', '66', '02', 'alcaldia@apia-risaralda.gov.co', 0, '40', 'AHO', 'jmmG1EQo6G2NgRVwHPn+7Q==', '8914800223', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66075000', '8908011431', 'BALBOA RISARALDA', '66', '02', 'alcaldia@balboarisaralda-risaralda.gov.co', 0, '40', 'CTE', 'q6JOK4mP5L+oqRc/spY/Vg==', '8908011431', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66088000', '8914800248', 'BELEN DE UMBRIA', '66', '02', 'alcaldia@belendeumbria-risaralda.gov.co', 0, '07', 'CTE', 'xUkrpcOzOhF4D8zV/+AzMg==', '8914800248', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66170000', '8000993106', 'DOSQUEBRADAS', '66', '02', 'alcaldia@dosquebradas-risaralda.gov.co', 0, '01', 'AHO', 'A4geQnZkL8/KzB/nGHyGkA==', '8000993106', 1, 1, 1, 1, 0);
commit;
prompt 300 records committed...
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66400000', '8914800271', 'LA VIRGINIA', '66', '02', 'alcaldia@lavirginia-risaralda.gov.co', 0, '50', 'CTE', '+cRXUdD58jygd9+oLNw7EA==', '8914800271', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66594000', '8914800327', 'QUINCHIA', '66', '02', 'alcaldia@quinchia-risaralda.gov.co', 0, '50', 'CTE', 'AIwT4B8X2XxpGCozvP9KhA==', '8914800327', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66682000', '8914800334', 'SANTA ROSA DE CABAL', '66', '02', 'alcaldia@santarosadecabal-risaralda.gov.co', 0, '50', 'CTE', 'QoU8mL8TyI1fFT6d+JYx5Q==', '8914800334', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68001000', '8902041091', 'BUCARAMANGA', '68', '01', 'alcaldia@bucaramanga-santander.gov.co', 0, '51', 'CTE', 'uSdTJrkganUtByz38ZNlEw==', '8902041091', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68051000', '8902053345', 'ARATOCA', '68', '01', 'alcaldia@aratoca-santander.gov.co', 0, '40', 'CTE', 'HlFlR6I+WhqqL8qOuO9Y0A==', '8902053345', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68077000', '8001149385', 'BARBOSA SANTANDER', '68', '01', 'alcaldia@barbosasantander-santander.gov.co', 0, '13', 'AHO', '61LAX1yM4CCUNV4jAlFmXg==', '8001149385', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('99999999', '9999999999', 'municipio', '11', '01', null, null, null, null, null, null, null, null, null, null, null);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15753000', '8918010698', 'SOATA', '15', '03', 'alcaldia@dptalboyaca-boyaca.gov.co', 0, '01', 'AHO', 'D7lkXc+aiG7yqb4nTuHKWw==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15599000', '8918010698', 'RAMIRIQUI', '15', '03', 'alcaldia@dptalboyaca-boyaca.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15455000', '8918010698', 'MIRAFLORES', '15', '03', 'alcaldia@dptalboyaca-boyaca.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15407000', '8918010698', 'VILLA DE LEYVA', '15', '03', 'alcaldia@dptalboyaca-boyaca.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('23675000', '8000968049', 'SAN BERNARDO DEL VIENTO', '23', '01', 'contactenos@sanbernardodelviento-cordoba.gov.co', 0, '36', 'AHO', 'aYBwTO9Waiqyji2EuZHloA==', '8000968049', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76126000', '8903096118', 'CALIMA DEL DARIEN', '76', '02', 'contactenos@calimaeldarien-valle.gov.co', 1, '01', 'AHO', 'tkcG5+rDbIxmMd9ulYY7bw==', '999999999', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05107000', '8909844154', 'BRICEÑO', '05', '01', 'briceño@municipios.gov.co', 0, '40', 'CTE', 'tkcG5+rDbIwvdP4LvWxeeg==', '8909844154', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('73443001', '8907013421', 'MARIQUITA', '73', '04', 'alcaldia@mariquita-tolima.gov.co', 0, '01', 'AHO', 'OhzN5Ig8BaVfFT6d+JYx5Q==', '8907013421', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('00000001', '0000000000', 'DEPOSITO IGNORADO', '00', '01', null, null, null, null, null, null, null, null, null, null, null);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68081000', '8902709483', 'BARRANCABERMEJA', '68', '01', 'alcaldia@barrancabermeja-santander.gov.co', 0, '13', 'AHO', 'YaLzEOU/vYjdV+Wtll7QRA==', '8902709483', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68167000', '8040159930', 'CHARALA', '68', '01', 'alcaldia@charala-santander.gov.co', 0, '50', 'AHO', 'qlyN4gIBlFZpGCozvP9KhA==', '8040159930', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68190000', '8902083632', 'CIMITARRA', '68', '01', 'alcaldia@cimitarra-santander.gov.co', 0, '40', 'CTE', 'H+y3+XEUvh5zWotkykNYxQ==', '8902083632', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('68229000', '8000994895', 'CURITI', '68', '01', 'alcaldia@curiti-santander.gov.co', 0, '40', 'CTE', 'cVuz4cejPnTvWrDgT0iVGg==', '8000994895', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('41001000', '8911800091', 'NEIVA', '41', '04', 'alcaldia@neiva-huila.gov.co', 0, '23', 'CTE', 'ZQuAHtLkcRIEMeyrgj8eUA==', '8911800091', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05604000', '8909843124', 'REMEDIOS', '05', '01', 'remedios.ant@hotmail.com', 0, '40', 'CTE', 'f+AsRonXzq5DEDuHB2cnVQ==', '8909843124', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05150000', '8909840681', 'CAROLINA DEL PRINCIPE', '05', '01', 'alcaldiacarolinadelprincipe@correo.co', 0, '40', 'CTE', '4xo4h84L4KITqwyfowW/Qw==', '8989083447', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('20238000', '9999999999', 'EL COPEY', '20', '01', 'elcopey@alcaldia.gov.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '999999999', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05856000', '8909841862', 'VALPARAISO', '05', '01', 'alcaldia@valparaiso-antioquia.gov.co', 0, '40', 'CTE', '8IOFgexqurwqBzakrTWf/g==', '8909841862', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05093000', '8909823211', 'BETULIA', '05', '01', 'betulia@correo.co', 0, '51', 'CTE', 'VlnLlK/xbMu/tllyD9wy8g==', '8909823211', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('27361000', '8916800103', 'ISTMINA', '27', '01', 'itsmina@hotmail.com', 0, '01', 'CTE', '7Lu0hN4XVTjxfvma5wr5pg==', '8916800103', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76606000', '8000826650', 'RESTREPO VALLE', '76', '02', 'sistemas@simitoccidente.com', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76233000', '8001005145', 'DAGUA', '76', '02', 'alcaldedagua@hotmail.com', 0, '40', 'AHO', 'QLpJEF43MMrRMkVrWsC5Dg==', '8001005145', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19780000', '8001176875', 'SUAREZ CAUCA', '19', '02', 'alcaldia@suarezcauca-cesar.gov.co', 0, '40', 'CTE', 'InVWGGADLEEXNh+yILN2cg==', '8001176875', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19845000', '8170026754', 'VILLA RICA CAUCA', '19', '02', 'alcaldia@villaricacauca-cauca.gov.vo', 0, '23', 'CTE', 'ntc/lfcBf+Ogd9+oLNw7EA==', '8170026754', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19585000', '8915007210', 'PURACE', '19', '02', 'purace@purace.gov.co', 0, '40', 'CTE', 'Jp2QAyo5iO9QMqMWvGZWpA==', '8915007210', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76100000', '8919009451', 'BOLIVAR VALLE', '76', '02', 'alcaldia@bolivar-valle.org.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05091000', '8909808023', 'BETANIA', '05', '01', 'alcaldia@betania-antioquia.gov.co', 0, '40', 'CTE', 'Xqb82TPw8Fv7m4LY7UhvXg==', '8909808023', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05209000', '8909822618', 'CONCORDIA', '05', '01', 'alcaldia@concordia-antioquia.gov.co', 0, '51', 'CTE', '1cQDO3mHJiql1/imO8166Q==', '8909822618', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08141000', '8000944663', 'CANDELARIA ATLANTICO', '08', '04', 'alcaldia@candelaria-atlantico.gov.co', 0, '40', 'AHO', 'dUYaRB/Ecw0px/UrVroozQ==', '8000944663', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13248000', '8904812958', 'GUAMO BOLIVAR', '13', '04', 'alcaldia@guamo-bolivar.gov.co', 0, '01', 'CTE', '9RzC8qhAcbFpGCozvP9KhA==', '8904812958', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('17442000', '8908011456', 'MARMATO', '17', '02', 'alcaldia@marmato-caldas.gov.co', 0, '40', 'CTE', 'Fxk97ycvAegYYyWfa7xq+A==', '8908011456', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('44279000', '8000826650', 'FONSECA', '44', '04', 'alcaldia@fonseca.gov.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('81794000', '9002396588', 'TAME', '81', '01', 'tame.alcaldia@hotmail.com', 0, '51', 'AHO', 'frFb9rtdA1UegSMalwZYiw==', '9002396588', 1, 0, 1, 0, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05667000', '8909821231', 'SAN RAFAEL', '05', '01', 'sanrafael@correo.com', 0, '40', 'CTE', 'dwty+5ckYrud6QJtbQti2g==', '8909821231', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15469000', '8918010698', 'MONIQUIRA', '15', '03', 'alcaldia@moniquira-boyaca.gov.co', 0, '01', 'AHO', 'QgkTS0klJ3svdP4LvWxeeg==', '8918010698', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66440000', '8000993177', 'Marsella', '66', '02', 'alcaldia@marsella-risaralda.gov.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19212000', '8915012830', 'Corinto', '19', '02', 'alcaldia@corinto-cauca.gov.co', 0, '40', 'CTE', 'csW9tjTrBQKHOfxE4HUViA==', '8915012830', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('66318000', '8914800255', 'GUATICA', '66', '02', 'alcaldia@guatica-cauca.gov.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05890000', '8909840302', 'YOLOMBO', '05', '01', 'alcaldiayolombo@corro.co', 0, '02', 'CTE', '612k8Ew1ScZy4SRr+8M0+w==', '8909840302', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('44035000', '8390003600', 'ALBANIA', '44', '04', 'alcaldia@albania_guajira.gov.co', 0, '13', 'CTE', 'pOxyp6B6QyCUNV4jAlFmXg==', '9002218284', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('08001001', '8305092691', 'BARRANQUILLA METROTRANSITO', '08', '04', 'metrotransito@barranquilla-atlantico.org.co', 1, '51', 'AHO', 'CNLGWDQJaoA8NKnW+uHlEA==', '8305092691', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('76497000', '8000826650', 'OBANDO', '76', '02', 'obando@alcaldia.gov.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('27615000', '8000826650', 'RIO SUCIO', '27', '01', 'riosucio@hotmail.com', 0, '52', 'AHO', '3WqL5rVV6i+3lh0xtpuJqg==', '8000826650', 0, 1, 0, 0, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05310000', '8909839381', 'GOMEZ PLATA', '05', '01', 'gomeal01@edatel.net.co', 0, '40', 'CTE', 'hQBCp6wSbTVWmrruBgabYg==', '8909839381', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('13430000', '8000284322', 'MAGANGUE', '13', '04', 'mangangue@correo.com', 0, '13', 'AHO', 'fNqGqIMQgey93pIyaR7oyg==', '8060012621', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('25286000', '8999994335', 'FUNZA', '25', '03', 'alcaldia@funza-cundinamarca.gov.co', 0, '52', 'AHO', 'YJXUC2AesEkEMeyrgj8eUA==', '8999994335', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('95001000', '8001031802', 'SAN JOSE DEL GUAVIARE', '95', '06', 'alcaldia@sanjosedelguaviare-guaviare.gov.co', 0, '02', 'AHO', 'Vks9t00u3sUVt9LjnBJQVw==', '8001031802', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('15131000', '8918017964', 'CALDAS BOYACA', '15', '03', 'alcaldia@caldas-boyaca.org.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05038000', '8909821412', 'ANGOSTURA', '05', '01', 'alcaldia@angostura.com.co', 0, '40', 'CTE', 'drOU8bMxAlD8jCsV1oIZ+Q==', '8909821412', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('44430000', '9002006263', 'MAICAO', '44', '04', 'alcaldia@maicai.com', 0, '40', 'AHO', 'fqUf3hKajC7gM13jfFWtfw==', '9002006263', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19720000', '8000826650', 'SANTANDER', '19', '02', 'alcaldia@santander.gov.co', 0, '52', 'AHO', 'tkcG5+rDbIwvdP4LvWxeeg==', '8000826650', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05652000', '8000227914', 'SAN FRANCISCO', '05', '01', 'sanfrancisco@corro.com', 0, '51', 'CTE', 'LQsdVului4LdV+Wtll7QRA==', '8000227914', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('05642000', '8909805770', 'SALGAR', '05', '01', 'alcaldia@salgar.gov.co', 0, '51', 'CTE', 'YEYYvRlOmdmnctcJYo7Zew==', '8909805770', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19130000', '8915008645', 'CAJIBIO', '19', '02', 'alcaldia@cajibio-cauca.gov.co', 0, '13', 'CTE', '+AIMOb8GyXaUNV4jAlFmXg==', '8915008645', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19137000', '8915017231', 'CALDONO', '19', '02', 'alcaldia@caldono-cauca.gov.co', 0, '40', 'CTE', 'InVWGGADLEHtOIFija7ovQ==', '8915017231', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19142000', '8915012927', 'CALOTO', '19', '02', 'alcaldia@caloto-cauca.gov.co', 0, '07', 'CTE', 'roFWSts6fdM/m/25NOcMPQ==', '8915012927', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19256000', '8915009786', 'EL TAMBO CAUCA', '19', '02', 'alcaldia@eltambocauca-cauca.gov.co', 0, '40', 'CTE', 'uL2W/siwGqfjJkgftZgXoA==', '8915009786', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19450000', '8915023976', 'MERCADERES', '19', '02', 'alcaldia@mercaderes-cauca.gov.co', 0, '40', 'CTE', 'q+jPwxEzZev0wuBZ23uyPA==', '8915023976', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19455000', '8915008416', 'MIRANDA', '19', '02', 'alcaldia@miranda-cauca.gov.co', 0, '40', 'CTE', 'FtXN0eHd3fgri1zujA3ZcA==', '8915008416', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19532000', '8915021948', 'PATIA', '19', '02', 'alcaldia@patia-cauca.gov.co', 0, '13', 'CTE', 'kX3JN9elA6iUNV4jAlFmXg==', '8915021948', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19548000', '8915008566', 'PIENDAMO', '19', '02', 'alcaldia@piendamo-cauca.gov.co', 0, '13', 'CTE', 'i5Te+ZLCOtZpGCozvP9KhA==', '8915008566', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19573000', '8915005809', 'PUERTO TEJADA', '19', '02', 'alcaldia@puertotejada-cauca.gov.co', 0, '01', 'CTE', '7RYBNjR3kAS93pIyaR7oyg==', '8915005809', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19622000', '8000959834', 'ROSAS', '19', '02', 'alcaldia@rosas-cauca.gov.co', 0, '23', 'CTE', 'bgRYf/vrPLHxfvma5wr5pg==', '8000959834', 1, 1, 1, 1, 0);
insert into MUNICIPIO (idmunicipio, nit_m, nombre, iddepartamento, idconcesionario, correo, indretroactividad, idbanco, tipocuenta, cuenta, nit_cta, indliq_s_ext, indliq_s_local, indliq_p_ext, indliq_p_local, indacuerdopago_2002)
values ('19698000', '8915002692', 'SANTANDER DE QUILICHAO', '19', '02', 'alcaldia@santanderdequilichao-cauca.gov.co', 0, '23', 'CTE', 'KRveVgfMfZ1fFT6d+JYx5Q==', '8915002692', 1, 1, 1, 1, 0);
commit;
prompt 371 records loaded
prompt Loading DIAS_DISPERSION...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25572000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25612000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25754000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25843000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25875000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25899000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41016000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41132000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41298000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41319000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41396000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41524000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41551000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41791000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41807000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47001000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47053000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47189000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47245000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08638000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08685000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08758000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08770000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08849000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('11001000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13001000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13052000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13222000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19100000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05044000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19743000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05093000', '50', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05002000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05030000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05031000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05034000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05042000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05044000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05045000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05051000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05079000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05088000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05101000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05120000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05129000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05138000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05147000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05148000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05154000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05172000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05190000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05197000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05212000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05237000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05264000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05266000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05282000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05284000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05306000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05308000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05318000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05321000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05353000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05360000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05368000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05376000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05380000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05390000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05400000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05425000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05440000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05490000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05541000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05579000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05591000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05607000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05615000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05631000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05656000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05660000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05664000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05670000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05674000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05679000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05686000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05690000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05697000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05756000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05761000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05790000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05792000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05809000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 100 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05837000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05842000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05847000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05854000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05861000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05887000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08078000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08137000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08296000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08421000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08433000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08436000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08520000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08558000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08560000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08573000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08634000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08638000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08685000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08758000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08770000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08832000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08849000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('11001000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13052000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13222000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13244000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13468000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13657000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13836000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15176000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15204000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15238000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15299000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15322000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15491000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15516000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15572000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15632000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15693000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15759000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15806000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17013000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17042000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17050000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17174000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17380000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17433000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17486000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17524000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17614000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17616000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17653000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17665000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17777000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17873000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17877000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18094000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18256000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18753000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19100000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19130000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19137000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19142000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19256000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19450000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19455000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19532000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19548000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19573000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19622000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19698000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05002000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27245000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05490000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08832000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47288000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47555000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50006000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50313000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50606000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52356000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52480000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52835000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52838000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54003000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 200 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54206000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54261000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54405000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54498000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54518000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54874000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63130000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63190000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63272000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63401000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63470000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63594000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63690000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66045000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66075000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66088000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66170000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66400000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66594000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66682000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68051000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68077000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68081000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68167000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68190000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68229000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68255000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68276000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68307000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68397000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68406000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68432000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68500000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68547000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68572000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68615000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68655000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68679000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68689000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68755000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68770000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68861000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70215000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70670000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73026000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73055000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73124000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73168000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73268000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73283000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73319000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73349000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73411000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73443000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73449000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73585000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73873000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76036000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76041000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76109000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76111000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76113000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76122000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76130000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76147000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76223000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76248000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76275000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76306000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76318000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76364000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76377000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76400000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76520000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76563000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76616000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76622000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76670000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76736000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76823000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76834000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76869000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76890000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76892000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76895000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81736000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85010000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86320000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86568000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86749000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 300 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86865000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('88001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('91001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('94001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('99001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05030000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05031000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05034000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05042000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05045000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05051000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05079000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05088000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05101000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05120000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05129000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05138000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05147000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05148000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05154000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05172000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05190000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05197000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05212000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05237000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05264000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05266000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05282000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05284000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05306000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05308000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05318000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05321000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05360000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05368000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05376000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05390000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05400000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05425000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05440000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05541000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05579000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05591000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05607000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05615000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05631000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05656000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05660000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05664000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05670000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05674000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05679000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05686000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05690000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05697000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05756000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05761000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05790000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05792000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05809000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05837000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05842000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05847000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05854000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05861000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05887000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08078000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08137000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08296000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08421000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08433000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08436000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08520000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08558000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08560000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08573000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08634000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13244000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13468000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13657000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13836000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15176000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15204000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15238000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15299000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15322000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15491000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20710000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23162000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23417000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23555000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23660000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 400 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25151000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25175000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25183000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25214000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25260000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25269000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25290000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25307000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25335000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25377000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25473000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25513000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25572000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25612000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25754000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25843000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25875000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25899000', '40', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27245000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41016000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41132000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41298000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41319000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41396000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41524000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41551000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41791000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41807000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47053000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47189000', '40', 13, 0, 13, 0, 0, 2, 0, 2);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47245000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47288000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47555000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50006000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50313000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50606000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52356000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52480000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52835000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52838000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54003000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54206000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54261000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54405000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54498000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54518000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54874000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63130000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63190000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63272000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63401000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63470000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63594000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63690000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66075000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66088000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66170000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66400000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66594000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66682000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68051000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68077000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68081000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68167000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68190000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68229000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68255000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68276000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68307000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68397000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68406000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68432000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68500000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68547000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68572000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68615000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68655000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68679000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68689000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68755000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68770000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68861000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70215000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70670000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 500 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73000000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73026000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73055000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73124000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73168000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73268000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73283000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73319000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73349000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73411000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73443000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73449000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73585000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73873000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76036000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76041000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76109000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76111000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76113000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76122000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76130000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76147000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76223000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76248000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76275000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76306000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76318000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76364000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76377000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76400000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76520000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76563000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76616000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76622000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76670000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76736000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76823000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76834000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76869000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76890000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76892000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76895000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81736000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85010000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86320000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86568000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86749000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86865000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('88001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('91001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('94001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('99001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05380000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23660000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25151000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25175000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25183000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25214000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25260000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25269000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25290000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25307000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25335000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25377000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25473000', '52', 5, 0, 5, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25513000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25286000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25286000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25572000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25612000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25754000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25843000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25875000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25899000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41016000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41132000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41298000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41319000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15516000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15572000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15632000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15693000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15759000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15806000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17013000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17042000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17050000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17174000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17380000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 600 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17433000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17486000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17524000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17614000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17616000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17653000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17665000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17777000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17873000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17877000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18094000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18256000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18753000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05353000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19130000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19137000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19142000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19256000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19450000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19455000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19532000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19548000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19573000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19622000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19698000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19743000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19807000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19824000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19873000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19992000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20011000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20013000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20060000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20178000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20228000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20517000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20621000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20710000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23162000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23417000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23555000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23660000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25151000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25175000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25183000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25214000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25260000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25269000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25290000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25307000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25335000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25377000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25473000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25513000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25572000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25612000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25754000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25843000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25875000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25899000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41016000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41132000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41298000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41319000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41396000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41524000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41551000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41791000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41807000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47053000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47189000', '50', 13, 0, 13, 0, 0, 2, 0, 2);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47245000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08638000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08685000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08758000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08770000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08849000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('11001000', '50', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13000000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13052000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13222000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19100000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05044000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05002000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27245000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05490000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
commit;
prompt 700 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08832000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47288000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47555000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50006000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50313000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50606000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52356000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52480000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52835000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52838000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54003000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54206000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54261000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54405000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54498000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54518000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54874000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63130000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63190000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63272000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63401000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63470000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63594000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63690000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66045000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66075000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66088000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66170000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66400000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66594000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66682000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68051000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68077000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68081000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68167000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68190000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68229000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68255000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68276000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68307000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68397000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68406000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68432000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68500000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68547000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68572000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68615000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68655000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68679000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68689000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68755000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68770000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68861000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70215000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70670000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73026000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73055000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73124000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73168000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73268000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73283000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73319000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73349000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73411000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73443000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73449000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73585000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73873000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76036000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76041000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76109000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76111000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76113000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76122000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76130000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76147000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76223000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76248000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76275000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76306000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76318000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76364000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76377000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76400000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76520000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76563000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76616000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76622000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
commit;
prompt 800 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76670000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76736000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76823000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76834000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76869000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76890000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76892000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76895000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81736000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85010000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86320000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86568000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86749000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86865000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('88001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('91001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('94001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('99001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05030000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05031000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05034000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05042000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05045000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05051000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05079000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05088000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05101000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05120000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05129000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05138000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05147000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05148000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05154000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05172000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05190000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05197000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05212000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05237000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05264000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05266000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05282000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05284000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05306000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05308000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05318000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05321000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05360000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05368000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05376000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05390000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05400000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05425000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05440000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05541000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05579000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05591000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05607000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05615000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05631000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05656000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05660000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05664000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05670000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05674000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05679000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05686000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05690000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05697000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05756000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05761000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05790000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05792000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05809000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05837000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05842000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05847000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05854000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05861000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05887000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08000000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08078000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08137000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08296000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08421000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08433000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08436000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08520000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08558000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08560000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08573000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08634000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13244000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13468000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13657000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13836000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
commit;
prompt 900 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15176000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15204000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15238000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15299000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15322000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15491000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15516000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15572000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15632000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15693000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15759000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15806000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17013000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17042000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17050000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17174000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17380000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17433000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17486000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17524000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17614000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17616000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17653000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17665000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17777000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17873000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17877000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18094000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18256000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18753000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05353000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19130000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19137000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19142000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19256000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19450000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19455000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19532000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19548000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19573000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19622000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19698000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19743000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19807000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19824000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19873000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19992000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20011000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20013000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20060000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20178000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20228000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20517000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20621000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20710000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23000000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23162000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23417000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23555000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66045000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05380000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19807000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19824000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19873000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19992000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20011000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20013000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20060000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20178000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20228000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20517000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20621000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08141000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13248000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13248000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13248000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13248000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17442000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17442000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17442000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17442000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13430000', '52', 0, 3, 0, 3, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13430000', '50', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05890000', '50', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19780000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19780000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19780000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19780000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41396000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41524000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41551000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41791000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 1000 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('41807000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47053000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47189000', '02', 13, 0, 13, 0, 0, 2, 0, 2);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47245000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08638000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08685000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08758000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08770000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08849000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('11001000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13052000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13222000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19100000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05044000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05002000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27245000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05490000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08832000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47288000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('47555000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50006000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50313000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('50606000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52356000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52480000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52835000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('52838000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54003000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54206000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54261000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54405000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54498000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54518000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('54874000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63130000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63190000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63272000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63401000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63470000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63594000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63690000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66045000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66075000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66088000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66170000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66400000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66594000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66682000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68051000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68077000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68081000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68167000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68190000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68229000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68255000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68276000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68307000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68397000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68406000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68432000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68500000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68547000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68572000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68615000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68655000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68679000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68689000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68755000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68770000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68861000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70215000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('70670000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73026000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73055000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73124000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73168000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73268000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73283000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73319000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73349000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73411000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73443000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73449000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73585000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 1100 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('73873000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76036000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76041000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76109000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76111000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76113000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76122000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76130000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76147000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76223000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76248000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76275000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76306000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76318000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76364000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76377000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76400000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76520000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76563000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76616000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76622000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76670000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76736000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76823000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76834000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76869000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76890000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76892000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76895000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81736000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('85010000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86320000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86568000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86749000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('86865000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('88001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('91001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('94001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('99001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05030000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05031000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05034000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05042000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05045000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05051000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05079000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05088000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05101000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05120000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05129000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05138000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05147000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05148000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05154000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05172000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05190000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05197000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05212000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05237000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05264000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05266000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05282000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05284000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05306000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05308000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05318000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05321000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05360000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05368000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05376000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05390000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05400000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05425000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05440000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05541000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05579000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05591000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05607000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05615000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05631000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05656000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05660000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05664000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05670000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05674000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05679000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05686000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15000000', '51', 13, 0, 13, 0, 0, 3, 13, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05318000', '51', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('63190000', '51', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76890000', '51', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('68077000', '51', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13000000', '51', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05690000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05697000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 1200 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05756000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05761000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05790000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05792000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05809000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05837000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05842000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05847000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05854000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05861000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05887000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08078000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08137000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08296000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08421000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08433000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08436000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08520000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08558000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08560000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08573000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08634000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13244000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13468000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13657000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('13836000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15176000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15204000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15238000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15299000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15322000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15491000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15516000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15572000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15632000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15693000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15759000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15806000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17013000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17042000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17050000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17174000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17380000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17433000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17486000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17524000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17614000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17616000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17653000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17665000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17777000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17873000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('17877000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18094000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18256000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('18753000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05353000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19130000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19137000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19142000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19256000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19450000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19455000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19532000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19548000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19573000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19622000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19698000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19743000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19807000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19824000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19873000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19992000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20011000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20013000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20060000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20178000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20228000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20517000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20621000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20710000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23162000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23417000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23555000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05380000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('23660000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25000000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25151000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25175000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25183000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
commit;
prompt 1300 records committed...
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25214000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25260000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25269000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25290000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25307000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25335000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25377000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25473000', '02', 13, 0, 13, 0, 0, 1, 0, 1);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25513000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25286000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27361000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27361000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27361000', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('27361000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05091000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05091000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05091000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05091000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001001', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001001', '50', 13, 0, 13, 0, 6, 0, 6, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001001', '52', 5, 0, 5, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08001001', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44430000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19720000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19720000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19720000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19720000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44279000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44279000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05856000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81794000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('81794000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20238000', '50', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20238000', '52', 0, 2, 0, 2, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05604000', '40', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19845000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19845000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19845000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19845000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76233000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76233000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76233000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76233000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44430000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76606000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19212000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19212000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19212000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19212000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66440000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66440000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66440000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66440000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66318000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66318000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66318000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('66318000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76497000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76497000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05856000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05604000', '52', 0, 2, 0, 2, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19585000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05604000', '50', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19585000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19585000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('19585000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15131000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15131000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15131000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15131000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('44430000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20238000', '40', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('20238000', '02', 0, 3, 0, 3, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('95001000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('95001000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('95001000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15469000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15469000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15469000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('15469000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('25286000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05093000', '52', 0, 2, 0, 2, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76100000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76100000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76100000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('76100000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('95001000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05209000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05209000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05209000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('05209000', '02', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08141000', '52', 5, 0, 5, 0, 20, 0, 5, 0);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08141000', '50', 13, 0, 13, 0, 0, 3, 0, 3);
insert into DIAS_DISPERSION (idmunicipio, idbanco, dias_dispersion_sl, frec_dispersion_sl, dias_dispersion_pl, frec_dispersion_pl, dias_dispersion_se, frec_dispersion_se, dias_dispersion_pe, frec_dispersion_pe)
values ('08141000', '40', 13, 0, 13, 0, 0, 3, 0, 3);
commit;
prompt 1394 records loaded
prompt Loading FECHA_NO_HABIL...
insert into FECHA_NO_HABIL (fecha)
values ('20021104');
insert into FECHA_NO_HABIL (fecha)
values ('20021111');
insert into FECHA_NO_HABIL (fecha)
values ('20030101');
insert into FECHA_NO_HABIL (fecha)
values ('20030106');
insert into FECHA_NO_HABIL (fecha)
values ('20030324');
insert into FECHA_NO_HABIL (fecha)
values ('20030417');
insert into FECHA_NO_HABIL (fecha)
values ('20030418');
insert into FECHA_NO_HABIL (fecha)
values ('20030501');
insert into FECHA_NO_HABIL (fecha)
values ('20030602');
insert into FECHA_NO_HABIL (fecha)
values ('20030623');
insert into FECHA_NO_HABIL (fecha)
values ('20030630');
insert into FECHA_NO_HABIL (fecha)
values ('20030807');
insert into FECHA_NO_HABIL (fecha)
values ('20030818');
insert into FECHA_NO_HABIL (fecha)
values ('20031013');
insert into FECHA_NO_HABIL (fecha)
values ('20031103');
insert into FECHA_NO_HABIL (fecha)
values ('20031117');
insert into FECHA_NO_HABIL (fecha)
values ('20031208');
insert into FECHA_NO_HABIL (fecha)
values ('20031225');
insert into FECHA_NO_HABIL (fecha)
values ('20040101');
insert into FECHA_NO_HABIL (fecha)
values ('20040112');
insert into FECHA_NO_HABIL (fecha)
values ('20040322');
insert into FECHA_NO_HABIL (fecha)
values ('20040408');
insert into FECHA_NO_HABIL (fecha)
values ('20040409');
insert into FECHA_NO_HABIL (fecha)
values ('20040524');
insert into FECHA_NO_HABIL (fecha)
values ('20040614');
insert into FECHA_NO_HABIL (fecha)
values ('20040621');
insert into FECHA_NO_HABIL (fecha)
values ('20040705');
insert into FECHA_NO_HABIL (fecha)
values ('20040720');
insert into FECHA_NO_HABIL (fecha)
values ('20040816');
insert into FECHA_NO_HABIL (fecha)
values ('20041018');
insert into FECHA_NO_HABIL (fecha)
values ('20041101');
insert into FECHA_NO_HABIL (fecha)
values ('20041115');
insert into FECHA_NO_HABIL (fecha)
values ('20041208');
insert into FECHA_NO_HABIL (fecha)
values ('20050110');
insert into FECHA_NO_HABIL (fecha)
values ('20050321');
insert into FECHA_NO_HABIL (fecha)
values ('20050324');
insert into FECHA_NO_HABIL (fecha)
values ('20050325');
insert into FECHA_NO_HABIL (fecha)
values ('20050509');
insert into FECHA_NO_HABIL (fecha)
values ('20050530');
insert into FECHA_NO_HABIL (fecha)
values ('20050606');
insert into FECHA_NO_HABIL (fecha)
values ('20050704');
insert into FECHA_NO_HABIL (fecha)
values ('20050720');
insert into FECHA_NO_HABIL (fecha)
values ('20050815');
insert into FECHA_NO_HABIL (fecha)
values ('20051017');
insert into FECHA_NO_HABIL (fecha)
values ('20051107');
insert into FECHA_NO_HABIL (fecha)
values ('20051114');
insert into FECHA_NO_HABIL (fecha)
values ('20051208');
insert into FECHA_NO_HABIL (fecha)
values ('20060109');
insert into FECHA_NO_HABIL (fecha)
values ('20060320');
insert into FECHA_NO_HABIL (fecha)
values ('20060413');
insert into FECHA_NO_HABIL (fecha)
values ('20060414');
insert into FECHA_NO_HABIL (fecha)
values ('20060501');
insert into FECHA_NO_HABIL (fecha)
values ('20060529');
insert into FECHA_NO_HABIL (fecha)
values ('20060619');
insert into FECHA_NO_HABIL (fecha)
values ('20060626');
insert into FECHA_NO_HABIL (fecha)
values ('20060703');
insert into FECHA_NO_HABIL (fecha)
values ('20060720');
insert into FECHA_NO_HABIL (fecha)
values ('20060807');
insert into FECHA_NO_HABIL (fecha)
values ('20060821');
insert into FECHA_NO_HABIL (fecha)
values ('20061016');
insert into FECHA_NO_HABIL (fecha)
values ('20061106');
insert into FECHA_NO_HABIL (fecha)
values ('20061113');
insert into FECHA_NO_HABIL (fecha)
values ('20061208');
insert into FECHA_NO_HABIL (fecha)
values ('20061225');
insert into FECHA_NO_HABIL (fecha)
values ('20070101');
insert into FECHA_NO_HABIL (fecha)
values ('20070108');
insert into FECHA_NO_HABIL (fecha)
values ('20070319');
insert into FECHA_NO_HABIL (fecha)
values ('20070405');
insert into FECHA_NO_HABIL (fecha)
values ('20070406');
insert into FECHA_NO_HABIL (fecha)
values ('20070501');
insert into FECHA_NO_HABIL (fecha)
values ('20070521');
insert into FECHA_NO_HABIL (fecha)
values ('20070611');
insert into FECHA_NO_HABIL (fecha)
values ('20070618');
insert into FECHA_NO_HABIL (fecha)
values ('20070702');
insert into FECHA_NO_HABIL (fecha)
values ('20070720');
insert into FECHA_NO_HABIL (fecha)
values ('20070807');
insert into FECHA_NO_HABIL (fecha)
values ('20070820');
insert into FECHA_NO_HABIL (fecha)
values ('20071015');
insert into FECHA_NO_HABIL (fecha)
values ('20071105');
insert into FECHA_NO_HABIL (fecha)
values ('20071112');
insert into FECHA_NO_HABIL (fecha)
values ('20071225');
insert into FECHA_NO_HABIL (fecha)
values ('20080101');
insert into FECHA_NO_HABIL (fecha)
values ('20080107');
insert into FECHA_NO_HABIL (fecha)
values ('20080320');
insert into FECHA_NO_HABIL (fecha)
values ('20080321');
insert into FECHA_NO_HABIL (fecha)
values ('20080324');
insert into FECHA_NO_HABIL (fecha)
values ('20080501');
insert into FECHA_NO_HABIL (fecha)
values ('20080505');
insert into FECHA_NO_HABIL (fecha)
values ('20080526');
insert into FECHA_NO_HABIL (fecha)
values ('20080602');
insert into FECHA_NO_HABIL (fecha)
values ('20080630');
insert into FECHA_NO_HABIL (fecha)
values ('20080807');
insert into FECHA_NO_HABIL (fecha)
values ('20080818');
insert into FECHA_NO_HABIL (fecha)
values ('20081013');
insert into FECHA_NO_HABIL (fecha)
values ('20081103');
insert into FECHA_NO_HABIL (fecha)
values ('20081117');
insert into FECHA_NO_HABIL (fecha)
values ('20081208');
insert into FECHA_NO_HABIL (fecha)
values ('20081225');
insert into FECHA_NO_HABIL (fecha)
values ('20090101');
insert into FECHA_NO_HABIL (fecha)
values ('20090112');
commit;
prompt 100 records committed...
insert into FECHA_NO_HABIL (fecha)
values ('20090323');
insert into FECHA_NO_HABIL (fecha)
values ('20090405');
insert into FECHA_NO_HABIL (fecha)
values ('20090409');
insert into FECHA_NO_HABIL (fecha)
values ('20090410');
insert into FECHA_NO_HABIL (fecha)
values ('20090412');
insert into FECHA_NO_HABIL (fecha)
values ('20090501');
insert into FECHA_NO_HABIL (fecha)
values ('20090525');
insert into FECHA_NO_HABIL (fecha)
values ('20090615');
insert into FECHA_NO_HABIL (fecha)
values ('20090622');
insert into FECHA_NO_HABIL (fecha)
values ('20090629');
insert into FECHA_NO_HABIL (fecha)
values ('20090720');
insert into FECHA_NO_HABIL (fecha)
values ('20090807');
insert into FECHA_NO_HABIL (fecha)
values ('20090817');
insert into FECHA_NO_HABIL (fecha)
values ('20091012');
insert into FECHA_NO_HABIL (fecha)
values ('20091102');
insert into FECHA_NO_HABIL (fecha)
values ('20091116');
insert into FECHA_NO_HABIL (fecha)
values ('20091208');
insert into FECHA_NO_HABIL (fecha)
values ('20091225');
insert into FECHA_NO_HABIL (fecha)
values ('20100101');
insert into FECHA_NO_HABIL (fecha)
values ('20100111');
insert into FECHA_NO_HABIL (fecha)
values ('20100322');
insert into FECHA_NO_HABIL (fecha)
values ('20100328');
insert into FECHA_NO_HABIL (fecha)
values ('20100401');
insert into FECHA_NO_HABIL (fecha)
values ('20100402');
insert into FECHA_NO_HABIL (fecha)
values ('20100404');
insert into FECHA_NO_HABIL (fecha)
values ('20100501');
insert into FECHA_NO_HABIL (fecha)
values ('20100517');
insert into FECHA_NO_HABIL (fecha)
values ('20100607');
insert into FECHA_NO_HABIL (fecha)
values ('20100614');
insert into FECHA_NO_HABIL (fecha)
values ('20100705');
insert into FECHA_NO_HABIL (fecha)
values ('20100720');
insert into FECHA_NO_HABIL (fecha)
values ('20100807');
insert into FECHA_NO_HABIL (fecha)
values ('20100816');
insert into FECHA_NO_HABIL (fecha)
values ('20101018');
insert into FECHA_NO_HABIL (fecha)
values ('20101101');
insert into FECHA_NO_HABIL (fecha)
values ('20101115');
insert into FECHA_NO_HABIL (fecha)
values ('20101208');
insert into FECHA_NO_HABIL (fecha)
values ('20101225');
insert into FECHA_NO_HABIL (fecha)
values ('20110101');
insert into FECHA_NO_HABIL (fecha)
values ('20110110');
insert into FECHA_NO_HABIL (fecha)
values ('20110321');
insert into FECHA_NO_HABIL (fecha)
values ('20110421');
insert into FECHA_NO_HABIL (fecha)
values ('20110422');
insert into FECHA_NO_HABIL (fecha)
values ('20110606');
insert into FECHA_NO_HABIL (fecha)
values ('20110627');
insert into FECHA_NO_HABIL (fecha)
values ('20110704');
insert into FECHA_NO_HABIL (fecha)
values ('20110720');
insert into FECHA_NO_HABIL (fecha)
values ('20110815');
insert into FECHA_NO_HABIL (fecha)
values ('20111017');
insert into FECHA_NO_HABIL (fecha)
values ('20111107');
insert into FECHA_NO_HABIL (fecha)
values ('20111114');
insert into FECHA_NO_HABIL (fecha)
values ('20111208');
commit;
prompt 152 records loaded
prompt Loading FUNCIONARIOS_CONCESIONARIO...
insert into FUNCIONARIOS_CONCESIONARIO (idconcesionario, idperson, activo)
values ('01', 11348169, null);
commit;
prompt 1 records loaded
prompt Loading GRUPO_CORREO...
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (4, 'martha.zapata@fcm.org.co', 'Correo coordinadora financiera');
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (5, 'hfromero@etb.net.co,msosaa@etb.net.co', 'Correo interventoria SIMIT');
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (6, 'luz.serna@fcm.org.co,sdfpolca@ascontroltech.com,direccionpolca@ascontroltech.com,dmarin@ascontroltech.com,ngonzalez@ascontroltech.com', 'Corrreo interventoria POLCA');
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (7, 'linda.campo@fcm.org.co, luis.parada@fcm.org.co', 'Correo coordinador banco');
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (1, 'rodrigopz11@yahoo.es,linda.campo@fcm.org.co,luis.parada@fcm.org.co', 'Correo oculto para todos los correos enviados por el SDF');
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (2, 'linda.campo@fcm.org.co,luis.parada@fcm.org.co', 'Correo administrador del SDF');
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (3, 'hfromero@etb.net.co,msosaa@etb.net.co,miguel.morales@simitcapital.com.co,martha.zapata@fcm.org.co,mxsevial@etb.net.co,analistacartera@etb.net.co,eduardo.atehortua@remo.com.co,leonilde.perez@fcm.org.co,javier.rivera@fcm.org.co,alejogira@gmail.com,clara.rivas@fcm.org.co,jeimy.marin@fcm.org.co,contabilidad@simitoccidente.com,sdfpolca@ascontroltech.com,direccionpolca@ascontroltech.com,dmarin@ascontroltech.com,ngonzalez@ascontroltech.com', 'Correo con grupo de usuarios que verifican liquidacion');
insert into GRUPO_CORREO (idgrupo, correo, descripcion)
values (0, 'SDF@fcm.org.co', 'Correo origen del SDF');
commit;
prompt 8 records loaded
prompt Loading MENU...
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (45, '04 Cambio de clave', '/faces/cambioClave.jsp', 5, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (43, '02 Roles', '/faces/Rol.jsp', 5, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (2, '02 Salarios Mínimos', '/faces/SalarioMinimo.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (3, '03 Fechas no hábiles', '/faces/FechaNoHabil.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (4, '04 Validador Fechas', '/faces/Validador.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (5, '05 Definición FCM', '/faces/InformacionFCM.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (6, '06 Cuentas Recaudo Local', '/faces/CuentasRecLocal.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (7, '07 Concesionarios', '/faces/Concesionario.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (8, '08 Cuentas Recaudo Externo', '/faces/CtaRecExt.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (9, '09 Cuentas Dispersión', '/faces/CtaConcesionario.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (10, '10 Municipios', '/faces/Municipio.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (11, '11 Días de Dispersión', '/faces/DiasDispersion.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (12, '12 Terceros', '/faces/Terceros.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (27, '01 Cargar Recaudo', '/faces/CargaRecaudoExterno.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (24, '09 Causacion Gasto POLCA', '/faces/rptCauGasPolcaLoc.jsp', 2, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (23, '08 Causacion Gasto SIMIT', '/faces/rptCauGasSimitLoc.jsp', 2, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (22, '07 Transferencia POLCA', '/faces/rptDisPolcaLoc.jsp', 2, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (21, '06 Transferencia SIMIT', '/faces/rptDisSimitLoc.jsp', 2, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (46, '01 Recuado X Conces X Munic', '/faces/rpt1.jsp', 6, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (1, '01 Definición Bancos', '/faces/Bancos.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (13, '01 Cargue archivos', '/faces/cargueArchivo.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (14, '02 Ajustes', '/faces/AjustesLocal.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (15, '03 Distribuir', '/faces/liquida_recaudo_local.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (28, '02 Distribuir', '/faces/LiquidarExterno.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (34, '01 Errores ejecución', '/faces/VisorErrores.jsp', 4, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (35, '02 Log Operaciones', '/faces/VisorLog.jsp', 4, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (19, '04 Reporte Distribución', '/faces/ReporteLiquidacionLocal.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (26, '11 Causacion Ingreso POLCA', '/faces/rptCauIngPolcaLoc.jsp', 2, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (25, '10 Causacion Ingreso SIMIT', '/faces/rptCauIngSimitLoc.jsp', 2, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (29, '03 Transferencia', '/faces/dispersa_recaudo_externo.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (36, '01 Usuarios', '/faces/Usuario.jsp', 5, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (44, '03 Menus', '/faces/Menu.jsp', 5, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (49, '13 Cuentas Dispersión FCM', '/faces/CuentasDispFCM.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (66, '07 Plantilla Depósitos', '/plantillaDepositos.xls', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (68, '05 Reporte Transferencia', 'ReporteTransferenciaLocal.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (69, '06 Reporte Causación', 'ReporteCausacionLocal.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (47, '02 Recaudo X Municipio', '/faces/rpt2.jsp', 6, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (48, '03 Traslados Bancarios', '/faces/rpt3.jsp', 6, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (65, '04 Cambio Informacion Financiera', '/faces/rpt4.jsp', 6, 0);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (86, '06 Reporte Causación', '/faces/ReporteCausacionExterno.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (87, '04 Reporte Distribución', '/faces/ReporteLiquidacionExterno.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (88, '05 Reporte Transferencia', '/faces/ReporteTransferenciaExterno.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (186, '06 Reporte Contabilidad Recaudo', '/faces/RptRecExtContabilidad.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (187, '07 Envio a Bancos', '/faces/EnvioBanco.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (188, '08 Reporte Validacion', '/faces/RptValidacion.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (189, '09 Reporte Contabilidad Pago', '/faces/RptPagExtContabilidad.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (206, '04 Transferir', '/faces/TransferirExterno.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (326, '11 Reproceso envio a Bancos', '/faces/EnvioBancoRepro.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (327, '12 Reporte Pago a OT', '/faces/ReporteDistOT.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (247, '15 Información Financiera', '/faces/RptInfoFinanciera.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (386, '01 Cargue Repuesta Banco', '/faces/cargueBanco.jsp', 7, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (387, '02 Reporte devoluciones ACH', '/faces/ReporteDevoluciones.jsp', 7, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (166, '14 Aprobar Reproceso', '/faces/AprobarReproceso.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (226, '01 Municipio', '/faces/NovMunicipio.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (227, '04  Administrar Novedades', '/faces/AdmNovedades.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (228, '05 VoBo Financiera', '/faces/VoBoFinanciera.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (229, '06 VoBo Interventoria SIMIT', '/faces/VoBoSimit.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (230, '07 VoBo Interventoria POLCA', '/faces/VoBoPolca.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (266, '10 Desencripta Banco', '/faces/Desencripta.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (286, '02 Días de Dispersión', '/faces/NovDiasDispersion.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (287, '03 Terceros', '/faces/NovTerceros.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (306, '03 Manual Usuario', '/Manual_User.pdf', 4, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (347, '13 Reporte Distribucion POLCA', '/faces/ReporteExternoPolca.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (348, '14 Reporte Transferencia POLCA', '/faces/ReporteTrfExternoPolca.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (349, '08 Reporte Distribucion POLCA', '/faces/ReporteLocalPolca.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (406, '09 Consulta Depositos', 'faces/ConsultaDepos.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (426, '15 Reporte Transferencia x Concepto', '/faces/ReporteTrfExterno.jsp', 3, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (447, '16 Transferir', '/faces/TransferirLocal.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (448, '13 Visto bueno SIMIT', '/faces/VistoBuenoS.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (449, '14 Visto bueno POLCA', '/faces/VistoBuenoP.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (450, '10 Identificacion Depositos', '/faces/IdentificacionDepos.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (446, '15 Autorizar reproceso', '/faces/AprobarReprocesoLoc.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (487, '08 Devolucion Usuario', '/faces/novDevolucion.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (466, '17 Contabilidad Recaudo', '/faces/RptRecLocContabilidad.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (488, '19 Contabilida  pago', '/faces/RptPagLocContabilidad.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (467, '18 Contabilida  trx sin identificar', '/faces/contabiliza_trf_siniden.jsp', 2, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (491, '16 Paramtros contabilidad', '/faces/Parconta.jsp', 1, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (511, '03 Contabilidad rechazos ACH', '/faces/RptPagDevAch.jsp', 7, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (489, '09 Contabilidad Devol usu', '/faces/RptPagDevContabilidad.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (490, '10 Devoluciones aplicadas', '/faces/RptDevolAplic.jsp', 6, 1);
insert into MENU (idmenu, namemenu, page, padreid, enablemenu)
values (531, '20 Envio Banco', '/faces/EnvioBancoLocal.jsp', 2, 1);
commit;
prompt 81 records loaded
prompt Loading MENUXROL...
insert into MENUXROL (menuid, rolid)
values (19, 48);
insert into MENUXROL (menuid, rolid)
values (68, 48);
insert into MENUXROL (menuid, rolid)
values (69, 48);
insert into MENUXROL (menuid, rolid)
values (21, 48);
insert into MENUXROL (menuid, rolid)
values (66, 48);
insert into MENUXROL (menuid, rolid)
values (22, 48);
insert into MENUXROL (menuid, rolid)
values (23, 48);
insert into MENUXROL (menuid, rolid)
values (24, 48);
insert into MENUXROL (menuid, rolid)
values (25, 48);
insert into MENUXROL (menuid, rolid)
values (10, 46);
insert into MENUXROL (menuid, rolid)
values (12, 46);
insert into MENUXROL (menuid, rolid)
values (306, 46);
insert into MENUXROL (menuid, rolid)
values (227, 46);
insert into MENUXROL (menuid, rolid)
values (349, 229);
insert into MENUXROL (menuid, rolid)
values (347, 229);
insert into MENUXROL (menuid, rolid)
values (348, 229);
insert into MENUXROL (menuid, rolid)
values (2, 169);
insert into MENUXROL (menuid, rolid)
values (3, 169);
insert into MENUXROL (menuid, rolid)
values (4, 169);
insert into MENUXROL (menuid, rolid)
values (5, 169);
insert into MENUXROL (menuid, rolid)
values (6, 169);
insert into MENUXROL (menuid, rolid)
values (7, 169);
insert into MENUXROL (menuid, rolid)
values (8, 169);
insert into MENUXROL (menuid, rolid)
values (9, 169);
insert into MENUXROL (menuid, rolid)
values (10, 169);
insert into MENUXROL (menuid, rolid)
values (11, 169);
insert into MENUXROL (menuid, rolid)
values (12, 169);
insert into MENUXROL (menuid, rolid)
values (49, 169);
insert into MENUXROL (menuid, rolid)
values (34, 169);
insert into MENUXROL (menuid, rolid)
values (35, 169);
insert into MENUXROL (menuid, rolid)
values (306, 169);
insert into MENUXROL (menuid, rolid)
values (36, 169);
insert into MENUXROL (menuid, rolid)
values (43, 169);
insert into MENUXROL (menuid, rolid)
values (44, 169);
insert into MENUXROL (menuid, rolid)
values (45, 169);
insert into MENUXROL (menuid, rolid)
values (1, 169);
insert into MENUXROL (menuid, rolid)
values (1, 47);
insert into MENUXROL (menuid, rolid)
values (2, 47);
insert into MENUXROL (menuid, rolid)
values (10, 189);
insert into MENUXROL (menuid, rolid)
values (11, 189);
insert into MENUXROL (menuid, rolid)
values (12, 189);
insert into MENUXROL (menuid, rolid)
values (3, 47);
insert into MENUXROL (menuid, rolid)
values (4, 47);
insert into MENUXROL (menuid, rolid)
values (5, 47);
insert into MENUXROL (menuid, rolid)
values (6, 47);
insert into MENUXROL (menuid, rolid)
values (7, 47);
insert into MENUXROL (menuid, rolid)
values (8, 47);
insert into MENUXROL (menuid, rolid)
values (9, 47);
insert into MENUXROL (menuid, rolid)
values (10, 47);
insert into MENUXROL (menuid, rolid)
values (11, 47);
insert into MENUXROL (menuid, rolid)
values (12, 47);
insert into MENUXROL (menuid, rolid)
values (49, 47);
insert into MENUXROL (menuid, rolid)
values (247, 47);
insert into MENUXROL (menuid, rolid)
values (13, 47);
insert into MENUXROL (menuid, rolid)
values (14, 47);
insert into MENUXROL (menuid, rolid)
values (15, 47);
insert into MENUXROL (menuid, rolid)
values (19, 47);
insert into MENUXROL (menuid, rolid)
values (68, 47);
insert into MENUXROL (menuid, rolid)
values (69, 47);
insert into MENUXROL (menuid, rolid)
values (66, 47);
insert into MENUXROL (menuid, rolid)
values (406, 47);
insert into MENUXROL (menuid, rolid)
values (27, 47);
insert into MENUXROL (menuid, rolid)
values (28, 47);
insert into MENUXROL (menuid, rolid)
values (87, 47);
insert into MENUXROL (menuid, rolid)
values (206, 47);
insert into MENUXROL (menuid, rolid)
values (88, 47);
insert into MENUXROL (menuid, rolid)
values (186, 47);
insert into MENUXROL (menuid, rolid)
values (188, 47);
insert into MENUXROL (menuid, rolid)
values (189, 47);
insert into MENUXROL (menuid, rolid)
values (327, 47);
insert into MENUXROL (menuid, rolid)
values (426, 47);
insert into MENUXROL (menuid, rolid)
values (306, 47);
insert into MENUXROL (menuid, rolid)
values (45, 47);
insert into MENUXROL (menuid, rolid)
values (226, 47);
insert into MENUXROL (menuid, rolid)
values (286, 47);
insert into MENUXROL (menuid, rolid)
values (47, 47);
insert into MENUXROL (menuid, rolid)
values (287, 47);
insert into MENUXROL (menuid, rolid)
values (227, 47);
insert into MENUXROL (menuid, rolid)
values (386, 47);
insert into MENUXROL (menuid, rolid)
values (387, 47);
insert into MENUXROL (menuid, rolid)
values (1, 149);
insert into MENUXROL (menuid, rolid)
values (2, 149);
insert into MENUXROL (menuid, rolid)
values (3, 149);
insert into MENUXROL (menuid, rolid)
values (4, 149);
insert into MENUXROL (menuid, rolid)
values (5, 149);
insert into MENUXROL (menuid, rolid)
values (6, 149);
insert into MENUXROL (menuid, rolid)
values (7, 149);
insert into MENUXROL (menuid, rolid)
values (8, 149);
insert into MENUXROL (menuid, rolid)
values (9, 149);
insert into MENUXROL (menuid, rolid)
values (10, 149);
insert into MENUXROL (menuid, rolid)
values (11, 149);
insert into MENUXROL (menuid, rolid)
values (12, 149);
insert into MENUXROL (menuid, rolid)
values (49, 149);
insert into MENUXROL (menuid, rolid)
values (247, 149);
insert into MENUXROL (menuid, rolid)
values (19, 149);
insert into MENUXROL (menuid, rolid)
values (68, 149);
insert into MENUXROL (menuid, rolid)
values (87, 149);
insert into MENUXROL (menuid, rolid)
values (88, 149);
insert into MENUXROL (menuid, rolid)
values (188, 149);
insert into MENUXROL (menuid, rolid)
values (327, 149);
commit;
prompt 100 records committed...
insert into MENUXROL (menuid, rolid)
values (426, 149);
insert into MENUXROL (menuid, rolid)
values (35, 149);
insert into MENUXROL (menuid, rolid)
values (306, 149);
insert into MENUXROL (menuid, rolid)
values (45, 149);
insert into MENUXROL (menuid, rolid)
values (227, 149);
insert into MENUXROL (menuid, rolid)
values (229, 149);
insert into MENUXROL (menuid, rolid)
values (387, 149);
insert into MENUXROL (menuid, rolid)
values (9, 189);
insert into MENUXROL (menuid, rolid)
values (247, 189);
insert into MENUXROL (menuid, rolid)
values (19, 189);
insert into MENUXROL (menuid, rolid)
values (68, 189);
insert into MENUXROL (menuid, rolid)
values (349, 189);
insert into MENUXROL (menuid, rolid)
values (87, 189);
insert into MENUXROL (menuid, rolid)
values (88, 189);
insert into MENUXROL (menuid, rolid)
values (188, 189);
insert into MENUXROL (menuid, rolid)
values (327, 189);
insert into MENUXROL (menuid, rolid)
values (347, 189);
insert into MENUXROL (menuid, rolid)
values (348, 189);
insert into MENUXROL (menuid, rolid)
values (426, 189);
insert into MENUXROL (menuid, rolid)
values (306, 189);
insert into MENUXROL (menuid, rolid)
values (45, 189);
insert into MENUXROL (menuid, rolid)
values (227, 189);
insert into MENUXROL (menuid, rolid)
values (387, 189);
insert into MENUXROL (menuid, rolid)
values (1, 209);
insert into MENUXROL (menuid, rolid)
values (2, 209);
insert into MENUXROL (menuid, rolid)
values (3, 209);
insert into MENUXROL (menuid, rolid)
values (4, 209);
insert into MENUXROL (menuid, rolid)
values (5, 209);
insert into MENUXROL (menuid, rolid)
values (6, 209);
insert into MENUXROL (menuid, rolid)
values (7, 209);
insert into MENUXROL (menuid, rolid)
values (8, 209);
insert into MENUXROL (menuid, rolid)
values (9, 209);
insert into MENUXROL (menuid, rolid)
values (10, 209);
insert into MENUXROL (menuid, rolid)
values (11, 209);
insert into MENUXROL (menuid, rolid)
values (12, 209);
insert into MENUXROL (menuid, rolid)
values (49, 209);
insert into MENUXROL (menuid, rolid)
values (247, 209);
insert into MENUXROL (menuid, rolid)
values (19, 209);
insert into MENUXROL (menuid, rolid)
values (68, 209);
insert into MENUXROL (menuid, rolid)
values (87, 209);
insert into MENUXROL (menuid, rolid)
values (88, 209);
insert into MENUXROL (menuid, rolid)
values (188, 209);
insert into MENUXROL (menuid, rolid)
values (327, 209);
insert into MENUXROL (menuid, rolid)
values (426, 209);
insert into MENUXROL (menuid, rolid)
values (35, 209);
insert into MENUXROL (menuid, rolid)
values (306, 209);
insert into MENUXROL (menuid, rolid)
values (227, 209);
insert into MENUXROL (menuid, rolid)
values (230, 209);
insert into MENUXROL (menuid, rolid)
values (387, 209);
insert into MENUXROL (menuid, rolid)
values (9, 249);
insert into MENUXROL (menuid, rolid)
values (10, 249);
insert into MENUXROL (menuid, rolid)
values (11, 249);
insert into MENUXROL (menuid, rolid)
values (12, 249);
insert into MENUXROL (menuid, rolid)
values (247, 249);
insert into MENUXROL (menuid, rolid)
values (19, 249);
insert into MENUXROL (menuid, rolid)
values (68, 249);
insert into MENUXROL (menuid, rolid)
values (349, 249);
insert into MENUXROL (menuid, rolid)
values (87, 249);
insert into MENUXROL (menuid, rolid)
values (88, 249);
insert into MENUXROL (menuid, rolid)
values (188, 249);
insert into MENUXROL (menuid, rolid)
values (327, 249);
insert into MENUXROL (menuid, rolid)
values (347, 249);
insert into MENUXROL (menuid, rolid)
values (348, 249);
insert into MENUXROL (menuid, rolid)
values (426, 249);
insert into MENUXROL (menuid, rolid)
values (306, 249);
insert into MENUXROL (menuid, rolid)
values (45, 249);
insert into MENUXROL (menuid, rolid)
values (227, 249);
insert into MENUXROL (menuid, rolid)
values (387, 249);
insert into MENUXROL (menuid, rolid)
values (1, 1);
insert into MENUXROL (menuid, rolid)
values (2, 1);
insert into MENUXROL (menuid, rolid)
values (3, 1);
insert into MENUXROL (menuid, rolid)
values (4, 1);
insert into MENUXROL (menuid, rolid)
values (5, 1);
insert into MENUXROL (menuid, rolid)
values (6, 1);
insert into MENUXROL (menuid, rolid)
values (7, 1);
insert into MENUXROL (menuid, rolid)
values (8, 1);
insert into MENUXROL (menuid, rolid)
values (9, 1);
insert into MENUXROL (menuid, rolid)
values (10, 1);
insert into MENUXROL (menuid, rolid)
values (11, 1);
insert into MENUXROL (menuid, rolid)
values (12, 1);
insert into MENUXROL (menuid, rolid)
values (49, 1);
insert into MENUXROL (menuid, rolid)
values (166, 1);
insert into MENUXROL (menuid, rolid)
values (247, 1);
insert into MENUXROL (menuid, rolid)
values (491, 1);
insert into MENUXROL (menuid, rolid)
values (13, 1);
insert into MENUXROL (menuid, rolid)
values (14, 1);
insert into MENUXROL (menuid, rolid)
values (15, 1);
insert into MENUXROL (menuid, rolid)
values (19, 1);
insert into MENUXROL (menuid, rolid)
values (68, 1);
insert into MENUXROL (menuid, rolid)
values (66, 1);
insert into MENUXROL (menuid, rolid)
values (22, 1);
insert into MENUXROL (menuid, rolid)
values (349, 1);
insert into MENUXROL (menuid, rolid)
values (406, 1);
insert into MENUXROL (menuid, rolid)
values (450, 1);
insert into MENUXROL (menuid, rolid)
values (448, 1);
insert into MENUXROL (menuid, rolid)
values (449, 1);
insert into MENUXROL (menuid, rolid)
values (446, 1);
insert into MENUXROL (menuid, rolid)
values (447, 1);
insert into MENUXROL (menuid, rolid)
values (466, 1);
insert into MENUXROL (menuid, rolid)
values (467, 1);
commit;
prompt 200 records committed...
insert into MENUXROL (menuid, rolid)
values (488, 1);
insert into MENUXROL (menuid, rolid)
values (531, 1);
insert into MENUXROL (menuid, rolid)
values (27, 1);
insert into MENUXROL (menuid, rolid)
values (28, 1);
insert into MENUXROL (menuid, rolid)
values (87, 1);
insert into MENUXROL (menuid, rolid)
values (206, 1);
insert into MENUXROL (menuid, rolid)
values (88, 1);
insert into MENUXROL (menuid, rolid)
values (186, 1);
insert into MENUXROL (menuid, rolid)
values (187, 1);
insert into MENUXROL (menuid, rolid)
values (188, 1);
insert into MENUXROL (menuid, rolid)
values (189, 1);
insert into MENUXROL (menuid, rolid)
values (266, 1);
insert into MENUXROL (menuid, rolid)
values (326, 1);
insert into MENUXROL (menuid, rolid)
values (327, 1);
insert into MENUXROL (menuid, rolid)
values (347, 1);
insert into MENUXROL (menuid, rolid)
values (348, 1);
insert into MENUXROL (menuid, rolid)
values (426, 1);
insert into MENUXROL (menuid, rolid)
values (34, 1);
insert into MENUXROL (menuid, rolid)
values (35, 1);
insert into MENUXROL (menuid, rolid)
values (306, 1);
insert into MENUXROL (menuid, rolid)
values (36, 1);
insert into MENUXROL (menuid, rolid)
values (43, 1);
insert into MENUXROL (menuid, rolid)
values (44, 1);
insert into MENUXROL (menuid, rolid)
values (45, 1);
insert into MENUXROL (menuid, rolid)
values (226, 1);
insert into MENUXROL (menuid, rolid)
values (286, 1);
insert into MENUXROL (menuid, rolid)
values (287, 1);
insert into MENUXROL (menuid, rolid)
values (227, 1);
insert into MENUXROL (menuid, rolid)
values (228, 1);
insert into MENUXROL (menuid, rolid)
values (229, 1);
insert into MENUXROL (menuid, rolid)
values (230, 1);
insert into MENUXROL (menuid, rolid)
values (487, 1);
insert into MENUXROL (menuid, rolid)
values (489, 1);
insert into MENUXROL (menuid, rolid)
values (490, 1);
insert into MENUXROL (menuid, rolid)
values (386, 1);
insert into MENUXROL (menuid, rolid)
values (387, 1);
insert into MENUXROL (menuid, rolid)
values (511, 1);
commit;
prompt 237 records loaded
prompt Loading MOTIVOAJUSTE...
insert into MOTIVOAJUSTE (idmotivo, motivo)
values (1, 'Consignacion errada municipio');
insert into MOTIVOAJUSTE (idmotivo, motivo)
values (2, 'Ajuste por transferencia errada');
commit;
prompt 2 records loaded
prompt Loading OFICINABANCO...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN JERÓNIMO', '05656000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN LUIS ANTIOQUIA', '05660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN PEDRO DE LOS MILAGROS. ANT', '05664000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN ROQUE', '05670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN VICENTE', '05674000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTA BARBARA ANTIOQUIA', '05679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTA ROSA DE OSOS', '05686000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTO DOMINGO', '05690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTUARIO ANTIOQUIA', '05697000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SOPETRAN', '05761000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SONSON', '05756000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TARAZA', '05790000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TARSO', '05792000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TITIRIBI', '05809000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TURBO', '05837000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'URAMITA', '05842000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'URRAO', '05847000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VALDIVIA', '05854000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VENECIA', '05861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'YARUMAL', '05887000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL ATLANTICO', '08000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BARRANQUILLA', '08001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BARANOA', '08078000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAMPO DE LA CRUZ', '08137000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GALAPA', '08296000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LURUACO', '08421000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MALAMBO', '08433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MANATI', '08436000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PALMAR DE VARELA', '08520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'POLONUEVO', '08558000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PONEDERA', '08560000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO COLOMBIA ATLANTICO', '08573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SABANAGRANDE', '08634000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SABANALARGA ATLANTICO', '08638000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTO TOMAS', '08685000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SOLEDAD', '08758000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SUAN', '08770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'USIACURI', '08849000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BOGOTA', '11001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL BOLIVAR', '13000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CARTAGENA', '13001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ARJONA', '13052000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CLEMENCIA', '13222000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CARMEN DE BOLIVAR', '13244000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MOMPOX', '13468000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN JUAN DE NEPOMUCENO', '13657000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TURBACO', '13836000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL BOYACA', '15000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TUNJA', '15001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHIQUINQUIRÁ', '15176000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'COMBITA', '15204000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DUITAMA', '15238000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUATEQUE', '15322000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'NOBSA', '15491000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PAIPA', '15516000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO BOYACA', '15572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SABOYA', '15632000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTA ROSA DE VITERBO', '15693000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SOGAMOSO', '15759000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TIBASOSA', '15806000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MANIZALES', '17001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'AGUADAS', '17013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ANSERMA', '17042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ARANZAZU', '17050000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHINCHINA', '17174000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA DORADA', '17380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MANZANARES', '17433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'NEIRA', '17486000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PALESTINA CALDAS', '17524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RIOSUCIO', '17614000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RISARALDA', '17616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SALAMINA CALDAS', '17653000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN JOSE', '17665000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SUPIA', '17777000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VILLAMARÍA', '17873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VITERBO', '17877000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAQUEZA', '25151000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHIA', '25175000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHOCONTA', '25183000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'COTA', '25214000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL ROSAL', '25260000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FACATATIVA', '25269000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FUSAGASUGA', '25290000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GIRARDOT ', '25307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUAYABETAL', '25335000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA CALERA', '25377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MOSQUERA CUNDINAMARCA', '25473000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PACHO', '25513000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO SALGAR', '25572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RICAURTE CUNDINAMARCA', '25612000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SOACHA', '25754000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'UBATE', '25843000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VILLETA', '25875000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ZIPAQUIRA', '25899000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL CHOCO', '27000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'QUIBDO', '27001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL HUILA', '41000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FLORENCIA', '18001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BELEN ANDAQUIES', '18094000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL PAUJÍL', '18256000');
commit;
prompt 100 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN VICENTE DEL CAGUAN', '18753000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'POPAYÁN', '19001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BOLIVAR CAUCA', '19100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAJIBIO', '19130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CALDONO', '19137000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CALOTO', '19142000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL TAMBO CAUCA', '19256000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MERCADERES', '19450000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MIRANDA', '19455000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PATIA', '19532000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PIENDAMO', '19548000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO TEJADA', '19573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ROSAS', '19622000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTANDER DE QUILICHAO', '19698000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SILVIA', '19743000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TIMBIO', '19807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TOTORO', '19824000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VILLA RICA CAUCA', '19873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SUAREZ CAUCA', '19992000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VALLEDUPAR', '20001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'AGUACHICA', '20011000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'AGUSTÍN CODAZZI', '20013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BOSCONIA', '20060000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHIRIGUANA', '20178000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CURUMANI', '20228000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PAILITAS', '20517000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA PAZ CESAR', '20621000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN ALBERTO', '20710000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL CORDOBA', '23000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MONTERIA', '23001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CERETE', '23162000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LORICA', '23417000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PLANETA RICA', '23555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAHAGUN', '23660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA ESTRELLA', '05380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PAMPLONA', '54518000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VILLA ROSARIO', '54874000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ARMENIA QUINDIO', '63001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CALARCA', '63130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CIRCASIA', '63190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FILANDIA', '63272000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA TEBAIDA', '63401000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MONTENEGRO', '63470000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'QUIMBAYA', '63594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SALENTO', '63690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PEREIRA', '66001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'APIA', '66045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BALBOA RISARALDA', '66075000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BELEN DE UMBRIA', '66088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DOSQUEBRADAS', '66170000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA VIRGINIA', '66400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'QUINCHIA', '66594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTA ROSA DE CABAL', '66682000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BUCARAMANGA', '68001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ARATOCA', '68051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BARBOSA SANTANDER', '68077000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BARRANCABERMEJA', '68081000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHARALA', '68167000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CIMITARRA', '68190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CURITI', '68229000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'NEIVA', '41001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'REMEDIOS', '05604000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VALPARAISO', '05856000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ITSMINA', '27361000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RESTREPO VALLE', '76606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BOLIVAR VALLE', '76100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BETANIA', '05091000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CONCORDIA', '05209000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CANDELARIA ATLANTICO', '08141000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUAMO BOLIVAR', '13248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MARMATO', '17442000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FONSECA', '44279000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TAME', '81794000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MONIQUIRA', '15469000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'Marsella', '66440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'Corinto', '19212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUATICA', '66318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BARRANQUILLA METROTRANSITO', '08001001');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'OBANDO', '76497000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RIO SUCIO', '27615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GOMEZ PLATA', '05310000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FUNZA', '25286000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN JOSE DEL GUAVIARE', '95001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CALDAS BOYACA', '15131000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ANGOSTURA', '05038000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MAICAO', '44430000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTANDER', '19720000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, '66666666', '20238000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL CUNDINAMARCA', '25000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TULUA', '76834000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'AGUAZUL', '85010000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MOCOA', '86001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ORITO', '86320000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO ASIS', '86568000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SIBUNDOY', '86749000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA HORMIGA', '86865000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN ANDRES I', '88001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LETICIA', '91001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'INIRIDA', '94001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO CARREnO', '99001000');
commit;
prompt 200 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GARAGOA', '15299000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUADALUPE', '41319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ENTRERRIOS', '05264000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FREDONIA', '05282000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, ' Seleccione', '00000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VIJES', '76869000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'YOTOCO', '76890000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'YUMBO', '76892000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ZARZAL', '76895000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ARAUCA ARAUCA', '81001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SARAVENA', '81736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'YOPAL', '85001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'HISPANIA', '05353000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'NECOCLI', '05490000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ANZA', '05044000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL CARMEN DE ATRATO', '27245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'AIPE', '41016000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAMPOALEGRE', '41132000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GARZON', '41298000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA PLATA', '41396000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PALERMO', '41524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PITALITO', '41551000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TARQUI', '41791000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TIMANA', '41807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL GUAJIRA', '44000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RIOHACHA', '44001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTA MARTA', '47001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ARACATACA', '47053000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CIENAGA', '47189000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL BANCO', '47245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FUNDACION', '47288000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PLATO', '47555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL META', '50000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VILLAVICENCIO', '50001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ACACIAS', '50006000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GRANADA', '50313000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RESTREPO META', '50606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL NARInO', '52000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PASTO', '52001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'IPIALES', '52356000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'NARInO NARInO', '52480000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TUMACO', '52835000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TUQUERRES', '52838000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CUCUTA', '54001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ABREGO', '54003000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CONVENCIÓN', '54206000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL ZULIA', '54261000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LOS PATIOS', '54405000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'OCAÑA', '54498000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VELEZ', '68861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SINCELEJO', '70001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'COROZAL', '70215000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAMPUES', '70670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MANIZALES', '17001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL TOLIMA', '73000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'IBAGUE', '73001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ALVARADO', '73026000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUAYABAL', '73055000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAJAMARCA', '73124000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHAPARRAL', '73168000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ESPINAL', '73268000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FRESNO', '73283000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUAMO TOLIMA', '73319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'HONDA', '73349000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LIBANO', '73411000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MARIQUITA', '73443000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MELGAR', '73449000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PURIFICACIÓN', '73585000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VILLARICA TOLIMA', '73873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CALI', '76001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ANDALUCIA', '76036000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ANSERMANUEVA', '76041000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BUENAVENTURA', '76109000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BUGA', '76111000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BUGALAGRANDE', '76113000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAICEDONIA', '76122000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CANDELARIA VALLE', '76130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CARTAGO', '76147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DAGUA', '76223000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL CERRITO', '76248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FLORIDA', '76275000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GINEBRA', '76306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUACARI', '76318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'JAMUNDI', '76364000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA CUMBRE', '76377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA UNION VALLE', '76400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PALMIRA', '76520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PRADERA', '76563000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RIOFRÍO', '76616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ROLDANILLO', '76622000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN PEDRO VALLE', '76670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SEVILLA ', '76736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TORO', '76823000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL PLAYON', '68255000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FLORIDABLANCA', '68276000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GIRON', '68307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA PAZ SANTANDER', '68397000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LEBRIJA', '68406000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MALAGA', '68432000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'OIBA', '68500000');
commit;
prompt 300 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PIEDECUESTA', '68547000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUENTE NACIONAL', '68572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RIONEGRO SANTANDER', '68615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SABANA DE TORRES', '68655000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN GIL', '68679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN VICENTE DE CHUCURI', '68689000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SOCORRO', '68755000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SUAITA', '68770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MEDELLIN', '05001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TUBARA', '08832000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ABEJORRAL', '05002000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'AMAGA', '05030000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'AMALFI', '05031000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ANDES', '05034000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTA FE DE ANTIOQUIA', '05042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'APARTADO', '05045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ARBOLETES', '05051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BARBOSA ANTIOQUIA', '05079000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BELLO', '05088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CIUDAD BOLIVAR', '05101000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CACERES', '05120000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CALDAS ANTIOQUIA', '05129000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAÑASGORDAS', '05138000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAREPA', '05147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CARMEN DEL VIBORAL', '05148000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAUCASIA', '05154000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHIGORODO', '05172000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CISNEROS', '05190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'COCORNA', '05197000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'COPACABANA', '05212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DON MATIAS', '05237000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ENVIGADO', '05266000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FRONTINO', '05284000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GIRALDO', '05306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GIRARDOTA', '05308000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUARNE', '05318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUATAPE', '05321000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ITAGUI', '05360000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'JERICO ANTIOQUIA', '05368000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA CEJA', '05376000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA PINTADA', '05390000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA UNION ANTIOQUIA', '05400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MACEO', '05425000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MARINILLA', '05440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PEnOL', '05541000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO BERRIO', '05579000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO TRIUNFO', '05591000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RETIRO', '05607000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RIONEGRO ANTIOQUIA', '05615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SABANETA', '05631000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN JERÓNIMO', '05656000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN LUIS ANTIOQUIA', '05660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN PEDRO DE LOS MILAGROS. ANT', '05664000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN ROQUE', '05670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN VICENTE', '05674000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTA BARBARA ANTIOQUIA', '05679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTA ROSA DE OSOS', '05686000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTO DOMINGO', '05690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTUARIO ANTIOQUIA', '05697000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SOPETRAN', '05761000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SONSON', '05756000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TARAZA', '05790000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TARSO', '05792000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TITIRIBI', '05809000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TURBO', '05837000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'URAMITA', '05842000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'URRAO', '05847000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VALDIVIA', '05854000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VENECIA', '05861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'YARUMAL', '05887000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL ATLANTICO', '08000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BARRANQUILLA', '08001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BARANOA', '08078000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAMPO DE LA CRUZ', '08137000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GALAPA', '08296000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LURUACO', '08421000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MALAMBO', '08433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MANATI', '08436000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PALMAR DE VARELA', '08520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'POLONUEVO', '08558000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PONEDERA', '08560000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO COLOMBIA ATLANTICO', '08573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SABANAGRANDE', '08634000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SABANALARGA ATLANTICO', '08638000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTO TOMAS', '08685000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SOLEDAD', '08758000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SUAN', '08770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'USIACURI', '08849000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BOGOTA', '11001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL BOLIVAR', '13000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CARTAGENA', '13001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ARJONA', '13052000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CLEMENCIA', '13222000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CARMEN DE BOLIVAR', '13244000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MOMPOX', '13468000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN JUAN DE NEPOMUCENO', '13657000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TURBACO', '13836000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL BOYACA', '15000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TUNJA', '15001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHIQUINQUIRÁ', '15176000');
commit;
prompt 400 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'COMBITA', '15204000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DUITAMA', '15238000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUATEQUE', '15322000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'NOBSA', '15491000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PAIPA', '15516000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO BOYACA', '15572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SABOYA', '15632000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTA ROSA DE VITERBO', '15693000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SOGAMOSO', '15759000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TIBASOSA', '15806000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MANIZALES', '17001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'AGUADAS', '17013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ANSERMA', '17042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ARANZAZU', '17050000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHINCHINA', '17174000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA DORADA', '17380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MANZANARES', '17433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'NEIRA', '17486000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PALESTINA CALDAS', '17524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RIOSUCIO', '17614000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RISARALDA', '17616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SALAMINA CALDAS', '17653000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN JOSE', '17665000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SUPIA', '17777000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VILLAMARÍA', '17873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VITERBO', '17877000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAQUEZA', '25151000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHIA', '25175000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHOCONTA', '25183000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'COTA', '25214000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL ROSAL', '25260000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FACATATIVA', '25269000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FUSAGASUGA', '25290000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GIRARDOT ', '25307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUAYABETAL', '25335000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA CALERA', '25377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MOSQUERA CUNDINAMARCA', '25473000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PACHO', '25513000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO SALGAR', '25572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RICAURTE CUNDINAMARCA', '25612000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SOACHA', '25754000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'UBATE', '25843000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VILLETA', '25875000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ZIPAQUIRA', '25899000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL CHOCO', '27000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'QUIBDO', '27001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL HUILA', '41000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FLORENCIA', '18001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BELEN ANDAQUIES', '18094000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL PAUJÍL', '18256000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN VICENTE DEL CAGUAN', '18753000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'POPAYÁN', '19001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BOLIVAR CAUCA', '19100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CAJIBIO', '19130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CALDONO', '19137000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CALOTO', '19142000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'EL TAMBO CAUCA', '19256000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MERCADERES', '19450000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MIRANDA', '19455000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PATIA', '19532000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PIENDAMO', '19548000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PUERTO TEJADA', '19573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ROSAS', '19622000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTANDER DE QUILICHAO', '19698000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SILVIA', '19743000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TIMBIO', '19807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TOTORO', '19824000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VILLA RICA CAUCA', '19873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SUAREZ CAUCA', '19992000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VALLEDUPAR', '20001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'AGUACHICA', '20011000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'AGUSTÍN CODAZZI', '20013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BOSCONIA', '20060000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHIRIGUANA', '20178000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CURUMANI', '20228000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PAILITAS', '20517000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA PAZ CESAR', '20621000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN ALBERTO', '20710000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DPTAL CORDOBA', '23000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MONTERIA', '23001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CERETE', '23162000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LORICA', '23417000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PLANETA RICA', '23555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAHAGUN', '23660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA ESTRELLA', '05380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PAMPLONA', '54518000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VILLA ROSARIO', '54874000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ARMENIA QUINDIO', '63001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CALARCA', '63130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CIRCASIA', '63190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FILANDIA', '63272000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA TEBAIDA', '63401000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MONTENEGRO', '63470000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'QUIMBAYA', '63594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SALENTO', '63690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'PEREIRA', '66001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'APIA', '66045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BALBOA RISARALDA', '66075000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BELEN DE UMBRIA', '66088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'DOSQUEBRADAS', '66170000');
commit;
prompt 500 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'LA VIRGINIA', '66400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'QUINCHIA', '66594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTA ROSA DE CABAL', '66682000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BUCARAMANGA', '68001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ARATOCA', '68051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL CHOCO', '27000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'QUIBDO', '27001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL HUILA', '41000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FLORENCIA', '18001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BELEN ANDAQUIES', '18094000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL PAUJÍL', '18256000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN VICENTE DEL CAGUAN', '18753000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'POPAYÁN', '19001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BOLIVAR CAUCA', '19100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAJIBIO', '19130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CALDONO', '19137000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CALOTO', '19142000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL TAMBO CAUCA', '19256000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MERCADERES', '19450000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MIRANDA', '19455000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PATIA', '19532000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PIENDAMO', '19548000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO TEJADA', '19573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ROSAS', '19622000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTANDER DE QUILICHAO', '19698000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SILVIA', '19743000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TIMBIO', '19807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TOTORO', '19824000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VILLA RICA CAUCA', '19873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SUAREZ CAUCA', '19992000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VALLEDUPAR', '20001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'AGUACHICA', '20011000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'AGUSTÍN CODAZZI', '20013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BOSCONIA', '20060000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHIRIGUANA', '20178000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CURUMANI', '20228000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PAILITAS', '20517000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA PAZ CESAR', '20621000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN ALBERTO', '20710000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL CORDOBA', '23000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MONTERIA', '23001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CERETE', '23162000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LORICA', '23417000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PLANETA RICA', '23555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAHAGUN', '23660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA ESTRELLA', '05380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PAMPLONA', '54518000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VILLA ROSARIO', '54874000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ARMENIA QUINDIO', '63001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CALARCA', '63130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CIRCASIA', '63190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FILANDIA', '63272000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA TEBAIDA', '63401000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MONTENEGRO', '63470000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'QUIMBAYA', '63594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SALENTO', '63690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PEREIRA', '66001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'APIA', '66045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BALBOA RISARALDA', '66075000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BELEN DE UMBRIA', '66088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DOSQUEBRADAS', '66170000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA VIRGINIA', '66400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'QUINCHIA', '66594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTA ROSA DE CABAL', '66682000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BUCARAMANGA', '68001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ARATOCA', '68051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BARBOSA SANTANDER', '68077000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BARRANCABERMEJA', '68081000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHARALA', '68167000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CIMITARRA', '68190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CURITI', '68229000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'NEIVA', '41001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'REMEDIOS', '05604000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VALPARAISO', '05856000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ITSMINA', '27361000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RESTREPO VALLE', '76606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BOLIVAR VALLE', '76100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BETANIA', '05091000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CONCORDIA', '05209000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CANDELARIA ATLANTICO', '08141000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUAMO BOLIVAR', '13248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MARMATO', '17442000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FONSECA', '44279000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TAME', '81794000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MONIQUIRA', '15469000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'Marsella', '66440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'Corinto', '19212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUATICA', '66318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BARRANQUILLA METROTRANSITO', '08001001');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'OBANDO', '76497000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RIO SUCIO', '27615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GOMEZ PLATA', '05310000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FUNZA', '25286000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN JOSE DEL GUAVIARE', '95001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CALDAS BOYACA', '15131000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ANGOSTURA', '05038000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MAICAO', '44430000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTANDER', '19720000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, '66666666', '20238000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL CUNDINAMARCA', '25000000');
commit;
prompt 600 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TULUA', '76834000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'AGUAZUL', '85010000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MOCOA', '86001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ORITO', '86320000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO ASIS', '86568000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SIBUNDOY', '86749000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA HORMIGA', '86865000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN ANDRES I', '88001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LETICIA', '91001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'INIRIDA', '94001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO CARREnO', '99001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GARAGOA', '15299000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUADALUPE', '41319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ENTRERRIOS', '05264000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FREDONIA', '05282000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, ' Seleccione', '00000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VIJES', '76869000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'YOTOCO', '76890000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'YUMBO', '76892000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ZARZAL', '76895000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ARAUCA ARAUCA', '81001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SARAVENA', '81736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'YOPAL', '85001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'HISPANIA', '05353000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'NECOCLI', '05490000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ANZA', '05044000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL CARMEN DE ATRATO', '27245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'AIPE', '41016000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAMPOALEGRE', '41132000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GARZON', '41298000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA PLATA', '41396000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PALERMO', '41524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PITALITO', '41551000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TARQUI', '41791000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TIMANA', '41807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL GUAJIRA', '44000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RIOHACHA', '44001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTA MARTA', '47001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ARACATACA', '47053000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CIENAGA', '47189000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL BANCO', '47245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FUNDACION', '47288000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PLATO', '47555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL META', '50000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VILLAVICENCIO', '50001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ACACIAS', '50006000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GRANADA', '50313000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RESTREPO META', '50606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL NARInO', '52000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PASTO', '52001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'IPIALES', '52356000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'NARInO NARInO', '52480000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TUMACO', '52835000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TUQUERRES', '52838000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CUCUTA', '54001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ABREGO', '54003000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CONVENCIÓN', '54206000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL ZULIA', '54261000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LOS PATIOS', '54405000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'OCAÑA', '54498000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VELEZ', '68861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SINCELEJO', '70001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'COROZAL', '70215000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAMPUES', '70670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DPTAL TOLIMA', '73000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'IBAGUE', '73001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ALVARADO', '73026000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUAYABAL', '73055000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAJAMARCA', '73124000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHAPARRAL', '73168000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ESPINAL', '73268000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FRESNO', '73283000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUAMO TOLIMA', '73319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'HONDA', '73349000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LIBANO', '73411000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MARIQUITA', '73443000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MELGAR', '73449000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PURIFICACIÓN', '73585000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'VILLARICA TOLIMA', '73873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CALI', '76001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ANDALUCIA', '76036000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ANSERMANUEVA', '76041000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BUENAVENTURA', '76109000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BUGA', '76111000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BUGALAGRANDE', '76113000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAICEDONIA', '76122000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CANDELARIA VALLE', '76130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CARTAGO', '76147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DAGUA', '76223000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL CERRITO', '76248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FLORIDA', '76275000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GINEBRA', '76306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUACARI', '76318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'JAMUNDI', '76364000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA CUMBRE', '76377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA UNION VALLE', '76400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PALMIRA', '76520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PRADERA', '76563000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RIOFRÍO', '76616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ROLDANILLO', '76622000');
commit;
prompt 700 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN PEDRO VALLE', '76670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SEVILLA ', '76736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TORO', '76823000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'EL PLAYON', '68255000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FLORIDABLANCA', '68276000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GIRON', '68307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA PAZ SANTANDER', '68397000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LEBRIJA', '68406000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MALAGA', '68432000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'OIBA', '68500000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PIEDECUESTA', '68547000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUENTE NACIONAL', '68572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RIONEGRO SANTANDER', '68615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SABANA DE TORRES', '68655000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN GIL', '68679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SAN VICENTE DE CHUCURI', '68689000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SOCORRO', '68755000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SUAITA', '68770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MEDELLIN', '05001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'TUBARA', '08832000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ABEJORRAL', '05002000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'AMAGA', '05030000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'AMALFI', '05031000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ANDES', '05034000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SANTA FE DE ANTIOQUIA', '05042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'APARTADO', '05045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ARBOLETES', '05051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BARBOSA ANTIOQUIA', '05079000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'BELLO', '05088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CIUDAD BOLIVAR', '05101000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CACERES', '05120000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CALDAS ANTIOQUIA', '05129000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAÑASGORDAS', '05138000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAREPA', '05147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CARMEN DEL VIBORAL', '05148000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CAUCASIA', '05154000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CHIGORODO', '05172000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'CISNEROS', '05190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'COCORNA', '05197000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'COPACABANA', '05212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'DON MATIAS', '05237000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ENVIGADO', '05266000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'FRONTINO', '05284000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GIRALDO', '05306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GIRARDOTA', '05308000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUARNE', '05318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'GUATAPE', '05321000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'ITAGUI', '05360000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'JERICO ANTIOQUIA', '05368000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA CEJA', '05376000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA PINTADA', '05390000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'LA UNION ANTIOQUIA', '05400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MACEO', '05425000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'MARINILLA', '05440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PEnOL', '05541000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO BERRIO', '05579000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'PUERTO TRIUNFO', '05591000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RETIRO', '05607000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'RIONEGRO ANTIOQUIA', '05615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('52', null, 'SABANETA', '05631000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'AGUADAS', '17013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BARBOSA SANTANDER', '68077000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BARRANCABERMEJA', '68081000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CHARALA', '68167000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CIMITARRA', '68190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CURITI', '68229000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'NEIVA', '41001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'REMEDIOS', '05604000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'VALPARAISO', '05856000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ITSMINA', '27361000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RESTREPO VALLE', '76606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BOLIVAR VALLE', '76100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BETANIA', '05091000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CONCORDIA', '05209000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CANDELARIA ATLANTICO', '08141000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUAMO BOLIVAR', '13248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MARMATO', '17442000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FONSECA', '44279000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'TAME', '81794000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MONIQUIRA', '15469000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'Marsella', '66440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'Corinto', '19212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GUATICA', '66318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'BARRANQUILLA METROTRANSITO', '08001001');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'OBANDO', '76497000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'RIO SUCIO', '27615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'GOMEZ PLATA', '05310000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'FUNZA', '25286000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SAN JOSE DEL GUAVIARE', '95001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'CALDAS BOYACA', '15131000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'ANGOSTURA', '05038000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'MAICAO', '44430000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, 'SANTANDER', '19720000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('40', null, '66666666', '20238000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL CUNDINAMARCA', '25000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TULUA', '76834000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'AGUAZUL', '85010000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MOCOA', '86001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ORITO', '86320000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO ASIS', '86568000');
commit;
prompt 800 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SIBUNDOY', '86749000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA HORMIGA', '86865000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN ANDRES I', '88001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LETICIA', '91001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'INIRIDA', '94001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO CARREnO', '99001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GARAGOA', '15299000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUADALUPE', '41319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ENTRERRIOS', '05264000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FREDONIA', '05282000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, ' Seleccione', '00000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VIJES', '76869000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'YOTOCO', '76890000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'YUMBO', '76892000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ZARZAL', '76895000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ARAUCA ARAUCA', '81001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SARAVENA', '81736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'YOPAL', '85001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'HISPANIA', '05353000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'NECOCLI', '05490000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ANZA', '05044000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL CARMEN DE ATRATO', '27245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'AIPE', '41016000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAMPOALEGRE', '41132000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GARZON', '41298000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA PLATA', '41396000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PALERMO', '41524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PITALITO', '41551000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TARQUI', '41791000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TIMANA', '41807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL GUAJIRA', '44000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RIOHACHA', '44001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTA MARTA', '47001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ARACATACA', '47053000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CIENAGA', '47189000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL BANCO', '47245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FUNDACION', '47288000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PLATO', '47555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL META', '50000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VILLAVICENCIO', '50001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ACACIAS', '50006000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GRANADA', '50313000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RESTREPO META', '50606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL NARInO', '52000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PASTO', '52001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'IPIALES', '52356000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'NARInO NARInO', '52480000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TUMACO', '52835000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TUQUERRES', '52838000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CUCUTA', '54001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ABREGO', '54003000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CONVENCIÓN', '54206000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL ZULIA', '54261000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LOS PATIOS', '54405000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'OCAÑA', '54498000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VELEZ', '68861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SINCELEJO', '70001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'COROZAL', '70215000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAMPUES', '70670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL TOLIMA', '73000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'IBAGUE', '73001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ALVARADO', '73026000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUAYABAL', '73055000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAJAMARCA', '73124000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHAPARRAL', '73168000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ESPINAL', '73268000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FRESNO', '73283000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUAMO TOLIMA', '73319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'HONDA', '73349000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LIBANO', '73411000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MARIQUITA', '73443000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MELGAR', '73449000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PURIFICACIÓN', '73585000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VILLARICA TOLIMA', '73873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CALI', '76001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ANDALUCIA', '76036000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ANSERMANUEVA', '76041000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BUENAVENTURA', '76109000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BUGA', '76111000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BUGALAGRANDE', '76113000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAICEDONIA', '76122000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CANDELARIA VALLE', '76130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CARTAGO', '76147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DAGUA', '76223000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL CERRITO', '76248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FLORIDA', '76275000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GINEBRA', '76306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUACARI', '76318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'JAMUNDI', '76364000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA CUMBRE', '76377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA UNION VALLE', '76400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PALMIRA', '76520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PRADERA', '76563000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RIOFRÍO', '76616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ROLDANILLO', '76622000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN PEDRO VALLE', '76670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SEVILLA ', '76736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TORO', '76823000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL PLAYON', '68255000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FLORIDABLANCA', '68276000');
commit;
prompt 900 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GIRON', '68307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA PAZ SANTANDER', '68397000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LEBRIJA', '68406000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MALAGA', '68432000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'OIBA', '68500000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PIEDECUESTA', '68547000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUENTE NACIONAL', '68572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RIONEGRO SANTANDER', '68615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SABANA DE TORRES', '68655000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN GIL', '68679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN VICENTE DE CHUCURI', '68689000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SOCORRO', '68755000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SUAITA', '68770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MEDELLIN', '05001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TUBARA', '08832000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ABEJORRAL', '05002000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'AMAGA', '05030000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'AMALFI', '05031000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ANDES', '05034000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTA FE DE ANTIOQUIA', '05042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'APARTADO', '05045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ARBOLETES', '05051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BARBOSA ANTIOQUIA', '05079000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BELLO', '05088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CIUDAD BOLIVAR', '05101000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CACERES', '05120000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CALDAS ANTIOQUIA', '05129000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAÑASGORDAS', '05138000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAREPA', '05147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CARMEN DEL VIBORAL', '05148000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAUCASIA', '05154000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHIGORODO', '05172000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CISNEROS', '05190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'COCORNA', '05197000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'COPACABANA', '05212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DON MATIAS', '05237000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ENVIGADO', '05266000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FRONTINO', '05284000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GIRALDO', '05306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GIRARDOTA', '05308000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUARNE', '05318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUATAPE', '05321000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ITAGUI', '05360000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'JERICO ANTIOQUIA', '05368000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA CEJA', '05376000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA PINTADA', '05390000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA UNION ANTIOQUIA', '05400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MACEO', '05425000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MARINILLA', '05440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PEnOL', '05541000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO BERRIO', '05579000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO TRIUNFO', '05591000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RETIRO', '05607000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RIONEGRO ANTIOQUIA', '05615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SABANETA', '05631000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN JERÓNIMO', '05656000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN LUIS ANTIOQUIA', '05660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN PEDRO DE LOS MILAGROS. ANT', '05664000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN ROQUE', '05670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN VICENTE', '05674000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTA BARBARA ANTIOQUIA', '05679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTA ROSA DE OSOS', '05686000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTO DOMINGO', '05690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTUARIO ANTIOQUIA', '05697000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SOPETRAN', '05761000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SONSON', '05756000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TARAZA', '05790000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TARSO', '05792000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TITIRIBI', '05809000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TURBO', '05837000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'URAMITA', '05842000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'URRAO', '05847000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VALDIVIA', '05854000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VENECIA', '05861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'YARUMAL', '05887000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL ATLANTICO', '08000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BARRANQUILLA', '08001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BARANOA', '08078000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAMPO DE LA CRUZ', '08137000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GALAPA', '08296000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LURUACO', '08421000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MALAMBO', '08433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MANATI', '08436000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PALMAR DE VARELA', '08520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'POLONUEVO', '08558000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PONEDERA', '08560000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO COLOMBIA ATLANTICO', '08573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SABANAGRANDE', '08634000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SABANALARGA ATLANTICO', '08638000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTO TOMAS', '08685000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SOLEDAD', '08758000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SUAN', '08770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'USIACURI', '08849000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BOGOTA', '11001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL BOLIVAR', '13000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CARTAGENA', '13001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ARJONA', '13052000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CLEMENCIA', '13222000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CARMEN DE BOLIVAR', '13244000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MOMPOX', '13468000');
commit;
prompt 1000 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN JUAN DE NEPOMUCENO', '13657000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TURBACO', '13836000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL BOYACA', '15000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TUNJA', '15001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHIQUINQUIRÁ', '15176000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'COMBITA', '15204000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DUITAMA', '15238000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUATEQUE', '15322000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'NOBSA', '15491000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PAIPA', '15516000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO BOYACA', '15572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SABOYA', '15632000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTA ROSA DE VITERBO', '15693000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SOGAMOSO', '15759000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TIBASOSA', '15806000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL CUNDINAMARCA', '25000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TULUA', '76834000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'AGUAZUL', '85010000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MOCOA', '86001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ORITO', '86320000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO ASIS', '86568000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SIBUNDOY', '86749000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA HORMIGA', '86865000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN ANDRES I', '88001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LETICIA', '91001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'INIRIDA', '94001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO CARREnO', '99001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GARAGOA', '15299000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUADALUPE', '41319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ENTRERRIOS', '05264000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FREDONIA', '05282000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, ' Seleccione', '00000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VIJES', '76869000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'YOTOCO', '76890000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'YUMBO', '76892000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ZARZAL', '76895000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ARAUCA ARAUCA', '81001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SARAVENA', '81736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'YOPAL', '85001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'HISPANIA', '05353000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'NECOCLI', '05490000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ANZA', '05044000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL CARMEN DE ATRATO', '27245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'AIPE', '41016000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAMPOALEGRE', '41132000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GARZON', '41298000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA PLATA', '41396000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PALERMO', '41524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PITALITO', '41551000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TARQUI', '41791000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TIMANA', '41807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL GUAJIRA', '44000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RIOHACHA', '44001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTA MARTA', '47001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ARACATACA', '47053000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CIENAGA', '47189000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL BANCO', '47245000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FUNDACION', '47288000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PLATO', '47555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL META', '50000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VILLAVICENCIO', '50001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ACACIAS', '50006000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GRANADA', '50313000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RESTREPO META', '50606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL NARInO', '52000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PASTO', '52001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'IPIALES', '52356000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'NARInO NARInO', '52480000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TUMACO', '52835000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TUQUERRES', '52838000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CUCUTA', '54001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ABREGO', '54003000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CONVENCIÓN', '54206000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL ZULIA', '54261000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LOS PATIOS', '54405000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'OCAÑA', '54498000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VELEZ', '68861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SINCELEJO', '70001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'COROZAL', '70215000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAMPUES', '70670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL TOLIMA', '73000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'IBAGUE', '73001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ALVARADO', '73026000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUAYABAL', '73055000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAJAMARCA', '73124000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHAPARRAL', '73168000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ESPINAL', '73268000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FRESNO', '73283000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUAMO TOLIMA', '73319000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'HONDA', '73349000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LIBANO', '73411000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MARIQUITA', '73443000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MELGAR', '73449000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PURIFICACIÓN', '73585000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VILLARICA TOLIMA', '73873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CALI', '76001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ANDALUCIA', '76036000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ANSERMANUEVA', '76041000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BUENAVENTURA', '76109000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BUGA', '76111000');
commit;
prompt 1100 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BUGALAGRANDE', '76113000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAICEDONIA', '76122000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CANDELARIA VALLE', '76130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CARTAGO', '76147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DAGUA', '76223000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL CERRITO', '76248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FLORIDA', '76275000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GINEBRA', '76306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUACARI', '76318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'JAMUNDI', '76364000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA CUMBRE', '76377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA UNION VALLE', '76400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PALMIRA', '76520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PRADERA', '76563000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RIOFRÍO', '76616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ROLDANILLO', '76622000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN PEDRO VALLE', '76670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SEVILLA ', '76736000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TORO', '76823000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL PLAYON', '68255000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FLORIDABLANCA', '68276000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GIRON', '68307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA PAZ SANTANDER', '68397000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LEBRIJA', '68406000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MALAGA', '68432000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'OIBA', '68500000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PIEDECUESTA', '68547000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUENTE NACIONAL', '68572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RIONEGRO SANTANDER', '68615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SABANA DE TORRES', '68655000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN GIL', '68679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN VICENTE DE CHUCURI', '68689000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SOCORRO', '68755000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SUAITA', '68770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MEDELLIN', '05001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TUBARA', '08832000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ABEJORRAL', '05002000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'AMAGA', '05030000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'AMALFI', '05031000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ANDES', '05034000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTA FE DE ANTIOQUIA', '05042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'APARTADO', '05045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ARBOLETES', '05051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BARBOSA ANTIOQUIA', '05079000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BELLO', '05088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CIUDAD BOLIVAR', '05101000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CACERES', '05120000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CALDAS ANTIOQUIA', '05129000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAÑASGORDAS', '05138000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAREPA', '05147000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CARMEN DEL VIBORAL', '05148000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAUCASIA', '05154000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHIGORODO', '05172000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CISNEROS', '05190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'COCORNA', '05197000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'COPACABANA', '05212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DON MATIAS', '05237000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ENVIGADO', '05266000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FRONTINO', '05284000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GIRALDO', '05306000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GIRARDOTA', '05308000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUARNE', '05318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUATAPE', '05321000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ITAGUI', '05360000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'JERICO ANTIOQUIA', '05368000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA CEJA', '05376000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA PINTADA', '05390000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA UNION ANTIOQUIA', '05400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MACEO', '05425000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MARINILLA', '05440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PEnOL', '05541000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO BERRIO', '05579000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO TRIUNFO', '05591000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RETIRO', '05607000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RIONEGRO ANTIOQUIA', '05615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SABANETA', '05631000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN JERÓNIMO', '05656000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN LUIS ANTIOQUIA', '05660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN PEDRO DE LOS MILAGROS. ANT', '05664000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN ROQUE', '05670000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN VICENTE', '05674000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTA BARBARA ANTIOQUIA', '05679000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTA ROSA DE OSOS', '05686000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTO DOMINGO', '05690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTUARIO ANTIOQUIA', '05697000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SOPETRAN', '05761000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SONSON', '05756000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TARAZA', '05790000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TARSO', '05792000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TITIRIBI', '05809000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TURBO', '05837000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'URAMITA', '05842000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'URRAO', '05847000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VALDIVIA', '05854000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VENECIA', '05861000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'YARUMAL', '05887000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL ATLANTICO', '08000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BARRANQUILLA', '08001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BARANOA', '08078000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAMPO DE LA CRUZ', '08137000');
commit;
prompt 1200 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GALAPA', '08296000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LURUACO', '08421000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MALAMBO', '08433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MANATI', '08436000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PALMAR DE VARELA', '08520000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'POLONUEVO', '08558000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PONEDERA', '08560000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO COLOMBIA ATLANTICO', '08573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SABANAGRANDE', '08634000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SABANALARGA ATLANTICO', '08638000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTO TOMAS', '08685000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SOLEDAD', '08758000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SUAN', '08770000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'USIACURI', '08849000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'BOGOTA', '11001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL BOLIVAR', '13000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CARTAGENA', '13001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ARJONA', '13052000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CLEMENCIA', '13222000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CARMEN DE BOLIVAR', '13244000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MOMPOX', '13468000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN JUAN DE NEPOMUCENO', '13657000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TURBACO', '13836000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DPTAL BOYACA', '15000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TUNJA', '15001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHIQUINQUIRÁ', '15176000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'COMBITA', '15204000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'DUITAMA', '15238000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUATEQUE', '15322000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'NOBSA', '15491000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PAIPA', '15516000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO BOYACA', '15572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SABOYA', '15632000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SANTA ROSA DE VITERBO', '15693000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SOGAMOSO', '15759000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'TIBASOSA', '15806000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MANIZALES', '17001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'AGUADAS', '17013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ANSERMA', '17042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ARANZAZU', '17050000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHINCHINA', '17174000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA DORADA', '17380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MANZANARES', '17433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'NEIRA', '17486000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PALESTINA CALDAS', '17524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RIOSUCIO', '17614000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RISARALDA', '17616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SALAMINA CALDAS', '17653000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SAN JOSE', '17665000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SUPIA', '17777000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VILLAMARÍA', '17873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VITERBO', '17877000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CAQUEZA', '25151000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHIA', '25175000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'CHOCONTA', '25183000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'COTA', '25214000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'EL ROSAL', '25260000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FACATATIVA', '25269000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'FUSAGASUGA', '25290000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GIRARDOT ', '25307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'GUAYABETAL', '25335000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'LA CALERA', '25377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'MOSQUERA CUNDINAMARCA', '25473000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PACHO', '25513000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'PUERTO SALGAR', '25572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'RICAURTE CUNDINAMARCA', '25612000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'SOACHA', '25754000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'UBATE', '25843000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'VILLETA', '25875000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('02', null, 'ZIPAQUIRA', '25899000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ANSERMA', '17042000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ARANZAZU', '17050000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHINCHINA', '17174000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA DORADA', '17380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MANZANARES', '17433000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'NEIRA', '17486000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PALESTINA CALDAS', '17524000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RIOSUCIO', '17614000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RISARALDA', '17616000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SALAMINA CALDAS', '17653000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN JOSE', '17665000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SUPIA', '17777000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VILLAMARÍA', '17873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VITERBO', '17877000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAQUEZA', '25151000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHIA', '25175000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHOCONTA', '25183000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'COTA', '25214000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL ROSAL', '25260000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FACATATIVA', '25269000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FUSAGASUGA', '25290000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GIRARDOT ', '25307000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUAYABETAL', '25335000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA CALERA', '25377000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MOSQUERA CUNDINAMARCA', '25473000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PACHO', '25513000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO SALGAR', '25572000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RICAURTE CUNDINAMARCA', '25612000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SOACHA', '25754000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'UBATE', '25843000');
commit;
prompt 1300 records committed...
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VILLETA', '25875000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ZIPAQUIRA', '25899000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL CHOCO', '27000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'QUIBDO', '27001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL HUILA', '41000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FLORENCIA', '18001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BELEN ANDAQUIES', '18094000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL PAUJÍL', '18256000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN VICENTE DEL CAGUAN', '18753000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'POPAYÁN', '19001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BOLIVAR CAUCA', '19100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CAJIBIO', '19130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CALDONO', '19137000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CALOTO', '19142000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'EL TAMBO CAUCA', '19256000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MERCADERES', '19450000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MIRANDA', '19455000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PATIA', '19532000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PIENDAMO', '19548000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PUERTO TEJADA', '19573000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ROSAS', '19622000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTANDER DE QUILICHAO', '19698000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SILVIA', '19743000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TIMBIO', '19807000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TOTORO', '19824000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VILLA RICA CAUCA', '19873000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SUAREZ CAUCA', '19992000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VALLEDUPAR', '20001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'AGUACHICA', '20011000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'AGUSTÍN CODAZZI', '20013000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BOSCONIA', '20060000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHIRIGUANA', '20178000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CURUMANI', '20228000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PAILITAS', '20517000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA PAZ CESAR', '20621000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN ALBERTO', '20710000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DPTAL CORDOBA', '23000000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MONTERIA', '23001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CERETE', '23162000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LORICA', '23417000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PLANETA RICA', '23555000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAHAGUN', '23660000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA ESTRELLA', '05380000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PAMPLONA', '54518000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VILLA ROSARIO', '54874000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ARMENIA QUINDIO', '63001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CALARCA', '63130000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CIRCASIA', '63190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FILANDIA', '63272000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA TEBAIDA', '63401000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MONTENEGRO', '63470000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'QUIMBAYA', '63594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SALENTO', '63690000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'PEREIRA', '66001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'APIA', '66045000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BALBOA RISARALDA', '66075000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BELEN DE UMBRIA', '66088000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'DOSQUEBRADAS', '66170000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'LA VIRGINIA', '66400000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'QUINCHIA', '66594000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTA ROSA DE CABAL', '66682000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BUCARAMANGA', '68001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ARATOCA', '68051000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BARBOSA SANTANDER', '68077000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BARRANCABERMEJA', '68081000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CHARALA', '68167000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CIMITARRA', '68190000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CURITI', '68229000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'NEIVA', '41001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'REMEDIOS', '05604000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'VALPARAISO', '05856000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ITSMINA', '27361000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RESTREPO VALLE', '76606000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BOLIVAR VALLE', '76100000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BETANIA', '05091000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CONCORDIA', '05209000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CANDELARIA ATLANTICO', '08141000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUAMO BOLIVAR', '13248000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MARMATO', '17442000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FONSECA', '44279000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'TAME', '81794000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MONIQUIRA', '15469000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'Marsella', '66440000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'Corinto', '19212000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GUATICA', '66318000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'BARRANQUILLA METROTRANSITO', '08001001');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'OBANDO', '76497000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'RIO SUCIO', '27615000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'GOMEZ PLATA', '05310000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'FUNZA', '25286000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SAN JOSE DEL GUAVIARE', '95001000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'CALDAS BOYACA', '15131000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'ANGOSTURA', '05038000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'MAICAO', '44430000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, 'SANTANDER', '19720000');
insert into OFICINABANCO (idbanco, idoficina, nombre, idmunicipio)
values ('50', null, '66666666', '20238000');
commit;
prompt 1396 records loaded
prompt Loading PADRE...
insert into PADRE (idpadre, namepadre, enablepadre)
values (5, 'Usuarios', 1);
insert into PADRE (idpadre, namepadre, enablepadre)
values (1, 'Parámetros', 1);
insert into PADRE (idpadre, namepadre, enablepadre)
values (2, 'Recaudo Local', 1);
insert into PADRE (idpadre, namepadre, enablepadre)
values (3, 'Recaudo Externo', 1);
insert into PADRE (idpadre, namepadre, enablepadre)
values (4, 'Utilidades', 1);
insert into PADRE (idpadre, namepadre, enablepadre)
values (6, 'Novedades', 1);
insert into PADRE (idpadre, namepadre, enablepadre)
values (7, 'Devoluciones Bancos', 1);
commit;
prompt 7 records loaded
prompt Loading PAR_CONTA...
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901006', '2905901006', 'Descripcion 2905901006');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901014', '2905901014', 'Descripcion 2905901014');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905900402', '2905900402', 'Descripcion 2905900402');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905900702', '2905900702', 'Descripcion 2905900702');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905900502', '2905900502', 'Descripcion 2905900502');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('ZT', 'ZT', 'Descripcion ZT');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('ZE', 'ZE', 'Descripcion ZE');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('PFC1', 'PFC1', 'Descripcion PFC1');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('FCM1', 'FCM1', 'Descripcion FCM1');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('COP', 'COP', 'Descripcion COP');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('50', '50', 'Descripcion 50');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('40', '40', 'Descripcion 40');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('31', '31', 'Descripcion 31');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('01', '01', 'Descripcion 01');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('11', '11', 'Descripcion 11');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('21', '21', 'Descripcion 21');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('V5', 'V5', 'Descripcion V5');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20111', '20111', 'Descripcion 20111');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20112', '20112', 'Descripcion 20112');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20113', '20113', 'Descripcion 20113');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20114', '20114', 'Descripcion 20114');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20211', '20211', 'Descripcion 20211');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20212', '20212', 'Descripcion 20212');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20213', '20213', 'Descripcion 20213');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20214', '20214', 'Descripcion 20214');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20121', '20121', 'Descripcion 20121');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20122', '20122', 'Descripcion 20122');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20123', '20123', 'Descripcion 20123');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20124', '20124', 'Descripcion 20124');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20221', '20221', 'Descripcion 20221');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20222', '20222', 'Descripcion 20222');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20223', '20223', 'Descripcion 20223');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('20224', '20224', 'Descripcion 20224');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('200101', '200101', 'Descripcion 200101');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('200102', '200102', 'Descripcion 200102');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('202213', '202213', 'Descripcion 202213');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('201213', '201213', 'Descripcion 201213');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('201111', '201111', 'Descripcion 201111');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('201121', '201121', 'Descripcion 201121');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('201215', '201215', 'Descripcion 201215');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('201221', '201221', 'Descripcion 201221');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('100761', '100761', 'Descripcion 100761');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('Z000', 'Z000', 'Descripcion Z000');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('Z002', 'Z002', 'Descripcion Z002');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('Z005', 'Z005', 'Descripcion Z005');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('1401020102', '1401020102', 'Descripcion 1401020102');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('8000826650', '8000826650', 'Descripcion 8000826650');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('5810900202', '5810900202', 'Descripcion 5810900202');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('4810900202', '4810900202', 'Descripcion 4810900202');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901001', '2905901001', 'Descripcion 2905901001');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901002', '2905901002', 'Descripcion 2905901002');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901003', '2905901003', 'Descripcion 2905901003');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901004', '2905901004', 'Descripcion 2905901004');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('1470909002', '1470909002', 'Descripcion 1470909002');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('5111110112', '5111110112', 'Descripcion 5111110112');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('5815930102', '5815930102', 'Descripcion 5815930102');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('5815930101', '5815930101', 'Descripcion 5815930101');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('4815590102', '4815590102', 'Descripcion 4815590102');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('1470900601', '1470900601', 'Descripcion 1470900601');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901005', '2905901005', 'Descripcion 2905901005');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901009', '2905901009', 'Descripcion 2905901009');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('1470909003', '1470909003', 'Descripcion 1470909003');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('YYYYYYYYYY', 'YYYYYYYYYY', 'Descripcion YYYYYYYYYY');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('ZD', 'ZD', 'Descripcion ZD');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901012', '2905901012', 'Descripcion 2905901012');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2425900502', '2425900502', 'Descripcion 2425900502');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901015', '2905901015', 'Descripcion 2905901015');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('1470901502', '1470901502', 'Descripcion 1470901502');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('1470901002', '1470901002', 'Descripcion 1470901002');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901016', '2905901016', 'Descripcion 2905901016');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901017', '2905901017', 'Descripcion 2905901017');
insert into PAR_CONTA (idparametro, parametro, descripcion)
values ('2905901010', '2905901010', 'Descripcion 2905901010');
commit;
prompt 72 records loaded
prompt Loading P_DISPERSION_CONCESIONARIO...
insert into P_DISPERSION_CONCESIONARIO (idconcesionario, concesionario_s, fondo_cob_concesionario_s, fondo_cob_simit_s, simit_s, equilibrio_economico_s, concesionario_pm, fondo_cob_concesionario_pm, fondo_cob_simit_pm, equilibrio_economico_pm, simit_pp, sevial_pp, equilibrio_economico_pp, polca_cp, fcm_cp, sevial_cp, equilibrio_economico_cp, concesionario_s_cc, fondo_cob_concesionario_s_cc, fondo_cob_simit_s_cc, simit_s_cc, equilibrio_economico_s_cc, concesionario_pm_cc, fondo_cob_concesionario_pm_cc, fondo_cob_simit_pm_cc, equilibrio_economico_pm_cc, simit_pp_cc, sevial_pp_cc, equilibrio_economico_pp_cc, polca_cp_cc, fcm_cp_cc, sevial_cp_cc, equilibrio_economico_cp_cc, simit_pm, simit_pm_cc, ctacon_gas, ctacon_ing, concesionario_s_cc_ext, foncob_conces_s_cc_ext, foncob_simit_s_cc_ext, simit_s_cc_ext, equil_econ_s_cc_ext, concesionario_pm_cc_ext, foncob_conces_pm_cc_ext, foncob_simit_pm_cc_ext, equil_econ_pm_cc_ext, simit_pp_cc_ext, sevial_pp_cc_ext, equil_econ_pp_cc_ext, polca_cp_cc_ext, fcm_cp_cc_ext, sevial_cp_cc_ext, equil_econ_cp_cc_ext, simit_pm_cc_ext)
values ('01', 6.5, .5, .5, 2.5, 0, 3.25, .25, .25, 0, 2, 3, 0, 40.5, 1.8, 2.7, 0, '0522', '0523', '0504', '0505', '0506', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0511', '0518', 1.25, '0516', '52110908', '41100201', '0501', '0503', '0504', '0505', '0518', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0517', '0518', '0516');
insert into P_DISPERSION_CONCESIONARIO (idconcesionario, concesionario_s, fondo_cob_concesionario_s, fondo_cob_simit_s, simit_s, equilibrio_economico_s, concesionario_pm, fondo_cob_concesionario_pm, fondo_cob_simit_pm, equilibrio_economico_pm, simit_pp, sevial_pp, equilibrio_economico_pp, polca_cp, fcm_cp, sevial_cp, equilibrio_economico_cp, concesionario_s_cc, fondo_cob_concesionario_s_cc, fondo_cob_simit_s_cc, simit_s_cc, equilibrio_economico_s_cc, concesionario_pm_cc, fondo_cob_concesionario_pm_cc, fondo_cob_simit_pm_cc, equilibrio_economico_pm_cc, simit_pp_cc, sevial_pp_cc, equilibrio_economico_pp_cc, polca_cp_cc, fcm_cp_cc, sevial_cp_cc, equilibrio_economico_cp_cc, simit_pm, simit_pm_cc, ctacon_gas, ctacon_ing, concesionario_s_cc_ext, foncob_conces_s_cc_ext, foncob_simit_s_cc_ext, simit_s_cc_ext, equil_econ_s_cc_ext, concesionario_pm_cc_ext, foncob_conces_pm_cc_ext, foncob_simit_pm_cc_ext, equil_econ_pm_cc_ext, simit_pp_cc_ext, sevial_pp_cc_ext, equil_econ_pp_cc_ext, polca_cp_cc_ext, fcm_cp_cc_ext, sevial_cp_cc_ext, equil_econ_cp_cc_ext, simit_pm_cc_ext)
values ('02', 6.5, .5, .5, 2.5, 0, 3.25, .25, .25, 0, 2, 3, 0, 40.5, 1.8, 2.7, 0, '0522', '0523', '0504', '0505', '0506', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0511', '0518', 1.25, '0512', '52110909', '41100202', '0501', '0503', '0504', '0505', '0518', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0517', '0518', '0516');
insert into P_DISPERSION_CONCESIONARIO (idconcesionario, concesionario_s, fondo_cob_concesionario_s, fondo_cob_simit_s, simit_s, equilibrio_economico_s, concesionario_pm, fondo_cob_concesionario_pm, fondo_cob_simit_pm, equilibrio_economico_pm, simit_pp, sevial_pp, equilibrio_economico_pp, polca_cp, fcm_cp, sevial_cp, equilibrio_economico_cp, concesionario_s_cc, fondo_cob_concesionario_s_cc, fondo_cob_simit_s_cc, simit_s_cc, equilibrio_economico_s_cc, concesionario_pm_cc, fondo_cob_concesionario_pm_cc, fondo_cob_simit_pm_cc, equilibrio_economico_pm_cc, simit_pp_cc, sevial_pp_cc, equilibrio_economico_pp_cc, polca_cp_cc, fcm_cp_cc, sevial_cp_cc, equilibrio_economico_cp_cc, simit_pm, simit_pm_cc, ctacon_gas, ctacon_ing, concesionario_s_cc_ext, foncob_conces_s_cc_ext, foncob_simit_s_cc_ext, simit_s_cc_ext, equil_econ_s_cc_ext, concesionario_pm_cc_ext, foncob_conces_pm_cc_ext, foncob_simit_pm_cc_ext, equil_econ_pm_cc_ext, simit_pp_cc_ext, sevial_pp_cc_ext, equil_econ_pp_cc_ext, polca_cp_cc_ext, fcm_cp_cc_ext, sevial_cp_cc_ext, equil_econ_cp_cc_ext, simit_pm_cc_ext)
values ('03', 6.5, .5, .5, 2.5, 0, 3.25, .25, .25, 0, 2, 3, 0, 40.5, 1.8, 2.7, 0, '0522', '0523', '0504', '0505', '0506', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0511', '0518', 1.25, '0512', '52110910', '41100203', '0501', '0503', '0504', '0505', '0518', '0513', '0514', '0515', '0518', '0516', '0515', '0518', '0000', '0512', '0517', '0518', '0516');
insert into P_DISPERSION_CONCESIONARIO (idconcesionario, concesionario_s, fondo_cob_concesionario_s, fondo_cob_simit_s, simit_s, equilibrio_economico_s, concesionario_pm, fondo_cob_concesionario_pm, fondo_cob_simit_pm, equilibrio_economico_pm, simit_pp, sevial_pp, equilibrio_economico_pp, polca_cp, fcm_cp, sevial_cp, equilibrio_economico_cp, concesionario_s_cc, fondo_cob_concesionario_s_cc, fondo_cob_simit_s_cc, simit_s_cc, equilibrio_economico_s_cc, concesionario_pm_cc, fondo_cob_concesionario_pm_cc, fondo_cob_simit_pm_cc, equilibrio_economico_pm_cc, simit_pp_cc, sevial_pp_cc, equilibrio_economico_pp_cc, polca_cp_cc, fcm_cp_cc, sevial_cp_cc, equilibrio_economico_cp_cc, simit_pm, simit_pm_cc, ctacon_gas, ctacon_ing, concesionario_s_cc_ext, foncob_conces_s_cc_ext, foncob_simit_s_cc_ext, simit_s_cc_ext, equil_econ_s_cc_ext, concesionario_pm_cc_ext, foncob_conces_pm_cc_ext, foncob_simit_pm_cc_ext, equil_econ_pm_cc_ext, simit_pp_cc_ext, sevial_pp_cc_ext, equil_econ_pp_cc_ext, polca_cp_cc_ext, fcm_cp_cc_ext, sevial_cp_cc_ext, equil_econ_cp_cc_ext, simit_pm_cc_ext)
values ('04', 6.5, .5, .5, 2.5, 0, 3.25, .25, .25, 0, 2, 3, 0, 40.5, 1.8, 2.7, 0, '0522', '0523', '0504', '0505', '0506', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0511', '0518', 1.25, '0512', '52110911', '41100204', '0501', '0503', '0504', '0505', '0505', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0517', '0518', '0516');
insert into P_DISPERSION_CONCESIONARIO (idconcesionario, concesionario_s, fondo_cob_concesionario_s, fondo_cob_simit_s, simit_s, equilibrio_economico_s, concesionario_pm, fondo_cob_concesionario_pm, fondo_cob_simit_pm, equilibrio_economico_pm, simit_pp, sevial_pp, equilibrio_economico_pp, polca_cp, fcm_cp, sevial_cp, equilibrio_economico_cp, concesionario_s_cc, fondo_cob_concesionario_s_cc, fondo_cob_simit_s_cc, simit_s_cc, equilibrio_economico_s_cc, concesionario_pm_cc, fondo_cob_concesionario_pm_cc, fondo_cob_simit_pm_cc, equilibrio_economico_pm_cc, simit_pp_cc, sevial_pp_cc, equilibrio_economico_pp_cc, polca_cp_cc, fcm_cp_cc, sevial_cp_cc, equilibrio_economico_cp_cc, simit_pm, simit_pm_cc, ctacon_gas, ctacon_ing, concesionario_s_cc_ext, foncob_conces_s_cc_ext, foncob_simit_s_cc_ext, simit_s_cc_ext, equil_econ_s_cc_ext, concesionario_pm_cc_ext, foncob_conces_pm_cc_ext, foncob_simit_pm_cc_ext, equil_econ_pm_cc_ext, simit_pp_cc_ext, sevial_pp_cc_ext, equil_econ_pp_cc_ext, polca_cp_cc_ext, fcm_cp_cc_ext, sevial_cp_cc_ext, equil_econ_cp_cc_ext, simit_pm_cc_ext)
values ('05', 6.45, 0, 0, 1.05, 2.5, 3.23, 0, 0, 1.77, 0, 3, 2, 40.5, 0, 2.7, 1.8, '0522', '0523', '0504', '0505', '0506', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0511', '0518', 0, '0512', '52110912', '41100205', '0501', '0503', '0504', '0505', '0518', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0517', '0518', '0516');
insert into P_DISPERSION_CONCESIONARIO (idconcesionario, concesionario_s, fondo_cob_concesionario_s, fondo_cob_simit_s, simit_s, equilibrio_economico_s, concesionario_pm, fondo_cob_concesionario_pm, fondo_cob_simit_pm, equilibrio_economico_pm, simit_pp, sevial_pp, equilibrio_economico_pp, polca_cp, fcm_cp, sevial_cp, equilibrio_economico_cp, concesionario_s_cc, fondo_cob_concesionario_s_cc, fondo_cob_simit_s_cc, simit_s_cc, equilibrio_economico_s_cc, concesionario_pm_cc, fondo_cob_concesionario_pm_cc, fondo_cob_simit_pm_cc, equilibrio_economico_pm_cc, simit_pp_cc, sevial_pp_cc, equilibrio_economico_pp_cc, polca_cp_cc, fcm_cp_cc, sevial_cp_cc, equilibrio_economico_cp_cc, simit_pm, simit_pm_cc, ctacon_gas, ctacon_ing, concesionario_s_cc_ext, foncob_conces_s_cc_ext, foncob_simit_s_cc_ext, simit_s_cc_ext, equil_econ_s_cc_ext, concesionario_pm_cc_ext, foncob_conces_pm_cc_ext, foncob_simit_pm_cc_ext, equil_econ_pm_cc_ext, simit_pp_cc_ext, sevial_pp_cc_ext, equil_econ_pp_cc_ext, polca_cp_cc_ext, fcm_cp_cc_ext, sevial_cp_cc_ext, equil_econ_cp_cc_ext, simit_pm_cc_ext)
values ('06', 0, 0, 0, 10, 0, 0, 0, 0, 0, 5, 0, 0, 40.5, 1.8, 2.7, 0, '0522', '0523', '0504', '0505', '0506', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0511', '0518', 5, '0516', null, null, '0501', '0503', '0504', '0505', '0518', '0513', '0514', '0515', '0518', '0516', '0517', '0518', '0000', '0512', '0517', '0518', '0516');
commit;
prompt 6 records loaded
prompt Loading P_DISPERSION_MUNICIPIO...
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('27245000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05490000', 0, 0, 0, 90, 0, 0, 0, 45);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08832000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66075000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66088000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66170000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66400000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66594000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66682000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68051000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68077000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68081000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68167000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68190000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68229000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68255000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68276000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68307000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68397000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68406000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68432000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68500000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68547000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68572000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68615000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68655000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68679000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68689000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68755000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68770000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('68861000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('70001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('70215000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('70670000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73026000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73055000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73124000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73168000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73268000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73283000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73319000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73349000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73411000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73443000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73449000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73585000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('73873000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76036000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76041000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76109000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76111000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76113000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76122000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76130000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76147000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76223000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76248000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76275000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76306000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76318000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76364000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76377000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76400000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76520000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76563000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76616000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76622000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76670000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76736000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76823000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76834000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76869000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76890000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76892000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76895000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('81001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('81736000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('85001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('85010000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('86001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('86320000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('86568000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('86749000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('86865000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('88001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('91001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('94001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('99001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05002000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05030000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05031000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05034000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05042000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05045000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05051000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05079000', 90, 0, 0, 0, 45, 0, 0, 0);
commit;
prompt 100 records committed...
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05088000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05101000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05120000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05129000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05138000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05147000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05148000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05154000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05172000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05190000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05197000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05212000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05237000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05264000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05266000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05282000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05284000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05306000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05308000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05318000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05321000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05360000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05368000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05376000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05390000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05400000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05425000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05440000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05541000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05579000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05591000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05607000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05615000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05631000', 71, 9.5, 9.5, 0, 26, 9.5, 9.5, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05656000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05660000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05664000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05670000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05674000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05679000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05686000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05690000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05697000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05756000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05761000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05790000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05792000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05809000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05837000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05842000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05847000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05854000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05861000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05887000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08078000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08137000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08296000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08421000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08433000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08436000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08520000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08558000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08560000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08573000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08634000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08638000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08685000', 0, 0, 0, 90, 0, 0, 0, 45);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08758000', 0, 0, 0, 90, 0, 0, 0, 45);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08770000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08849000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('11001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13000000', 0, 0, 0, 90, 0, 0, 0, 45);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13052000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13222000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13244000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13468000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13657000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13836000', 0, 0, 0, 90, 0, 0, 0, 45);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15176000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15204000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15238000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15299000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15322000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15491000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15516000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15572000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15632000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15693000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15759000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15806000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17013000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17042000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17050000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17174000', 90, 0, 0, 0, 45, 0, 0, 0);
commit;
prompt 200 records committed...
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17380000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17433000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17486000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17524000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17614000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17616000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17653000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17665000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17777000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17873000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17877000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('18001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('18094000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('18256000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('18753000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19100000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19130000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19137000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19142000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19256000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19450000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19455000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19532000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19548000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19573000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19622000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19698000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19743000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54498000', 71, 9.5, 9.5, 0, 26, 9.5, 9.5, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54518000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54874000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63130000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63190000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63272000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63401000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63470000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63594000', 0, 0, 0, 90, 0, 0, 0, 45);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('63690000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66045000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05044000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05353000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19807000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19824000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19873000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19992000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20011000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20013000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20060000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20178000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20228000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20517000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20621000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20710000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('23000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('23001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('23162000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('23417000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('23555000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('23660000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25151000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25175000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25183000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25214000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25260000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25269000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25290000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25307000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25335000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25377000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25473000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25513000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25572000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25612000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25754000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25843000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25875000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25899000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('27000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('27001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41001000', 0, 0, 0, 90, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41016000', 0, 0, 0, 90, 0, 0, 0, 45);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41132000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41298000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41319000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41396000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41524000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41551000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41791000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('41807000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('44000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('44001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('47001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('47053000', 90, 0, 0, 0, 45, 0, 0, 0);
commit;
prompt 300 records committed...
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('47189000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('47245000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('47288000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('47555000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('50000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('50001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('50006000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('50313000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('50606000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('52000000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('52001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('52356000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('52480000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('52835000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('52838000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54003000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54206000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54261000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('54405000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15469000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66440000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19212000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('66318000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('15131000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08001001', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05038000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('81794000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('44430000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('44279000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05604000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05093000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05652000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05642000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05667000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05380000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('27361000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76100000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('27615000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13430000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05890000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05150000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19720000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('44035000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76233000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19780000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19845000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('25286000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('95001000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05091000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05209000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('08141000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('13248000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('17442000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05856000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76606000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('76497000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('05310000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('20238000', 90, 0, 0, 0, 45, 0, 0, 0);
insert into P_DISPERSION_MUNICIPIO (idmunicipio, municipio_s, fcm_contravencional_s, conces_contravencional_s, acuerdopago_s, municipio_p, fcm_contravencional_p, conces_contravencional_p, acuerdopago_p)
values ('19585000', 90, 0, 0, 0, 45, 0, 0, 0);
commit;
prompt 360 records loaded
prompt Loading PERSON...
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (51830521, 'Leonilde Perez', 'Asesora Financiera', 1, to_date('03-07-2012 16:32:02', 'dd-mm-yyyy hh24:mi:ss'), 'leonilde.perez@fcm.org.co', 'eibgjehi');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (60318659, 'Marta Zapata', 'Coordinadora Financiera', 0, to_date('28-07-2011 16:39:23', 'dd-mm-yyyy hh24:mi:ss'), 'martha.zapata@fcm.org.co', '8p2r4ihy7');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (79558733, 'Javier Rivera', 'Asesor Financiero', 0, to_date('28-07-2011 16:39:28', 'dd-mm-yyyy hh24:mi:ss'), 'javier.rivera@fcm.org.co', 'JUANESihhj');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (79356292, 'Hector Fernando Romero Cárdenas', 'Coordinador Financiero', 0, to_date('28-07-2011 16:39:35', 'dd-mm-yyyy hh24:mi:ss'), 'hfromero@etb.net.co', 'cagedhah');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (16936171, 'Diego Hernán Trujillo Díaz', 'Jefe de Tecnología e Informática', 0, to_date('28-07-2011 16:39:43', 'dd-mm-yyyy hh24:mi:ss'), 'sistemas@simitoccidente.com', '16936171');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (26428628, 'Maria Ximena Correa Rojas', 'Directora Administrativa Y Financiera - Sevial', 0, to_date('28-07-2011 16:39:50', 'dd-mm-yyyy hh24:mi:ss'), 'mxsevial@etb.net.co', 'ADMONji');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (70503484, 'Eduardo Atehortua Escobar', 'Director Contabilidad - REMO & SERVIT', 0, to_date('28-07-2011 16:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'eduardo.atehortua@remo.com.co', 'cjejgfbf');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (94381393, 'Antonio Cerón Torres', 'Gerente General - SIMIT OCCIDENTE', 0, to_date('28-07-2011 16:40:03', 'dd-mm-yyyy hh24:mi:ss'), 'act@simitoccidente.com', '94381393');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (79047955, 'Miguel Angel Morales', 'Director Administrativo y Financiero - SIMIT CAPITAL', 0, to_date('28-07-2011 16:40:09', 'dd-mm-yyyy hh24:mi:ss'), 'miguel.morales@simitcapital.com.co', 'cajfcaee');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (96359982, 'Rodrigo Puentes Zúñiga', 'DBA Concesionarios Simit', 0, to_date('28-07-2011 16:40:15', 'dd-mm-yyyy hh24:mi:ss'), 'rodrigo_pz@hotmail.com', 'adgeaabh');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (51624352, 'Sara Elizabeth Gonzalez', 'Directora Tecnológica', 0, to_date('28-07-2011 16:40:24', 'dd-mm-yyyy hh24:mi:ss'), 'sara.gonzalez@simitcapital.com.co', '51624352');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (52821280, 'MILENA SOSA ALFONSO', 'AUX. FINANCIERO', 0, to_date('28-07-2011 16:40:30', 'dd-mm-yyyy hh24:mi:ss'), 'msosaa@etb.net.co', 'ehbhihbj9790');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (756093, 'Jhon Zapata', 'Polca', 0, to_date('26-04-2011 08:49:03', 'dd-mm-yyyy hh24:mi:ss'), 'infopolca@gmail.com', 's7u10ji');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (52502100, 'Jeimy Alejandra Marin Baquero', 'Asesora Financiera', 0, to_date('28-07-2011 16:40:36', 'dd-mm-yyyy hh24:mi:ss'), 'jeimy.marin@fcm.org.co', '4tqr0acj');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (72252690, 'Alcibiades Navas', 'Ingeniero SIstemas SIMIT', 0, to_date('02-05-2011 10:22:59', 'dd-mm-yyyy hh24:mi:ss'), 'alcibiades.navas@fcm.org.co', 'chhehdaj');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (91258174, 'John Jairo Duarte Dominguez', 'Contador SEVIAL', 0, to_date('08-10-2010 08:56:15', 'dd-mm-yyyy hh24:mi:ss'), 'mxsevial@etb.net.co', 'deijijfighhgf');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (43922859, 'Natalia Martínez Vargas', 'Analista Cartera SEVIAL', 0, to_date('28-07-2011 16:40:46', 'dd-mm-yyyy hh24:mi:ss'), 'analistacartera@etb.net.co', 't0q0u40jg');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (66980838, 'Janeth Patricia Ramírez', 'Contadora SIMIT OCCIDENTE', 0, to_date('28-07-2011 16:40:52', 'dd-mm-yyyy hh24:mi:ss'), 'contabilidad@simitoccidente.com', 'ddabjbgb');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (19402370, 'Guillermo Pinzón', 'Director Interventoria SIMIT', 0, to_date('28-07-2011 16:40:57', 'dd-mm-yyyy hh24:mi:ss'), 'gpinzon@visiontech.com.co', 'iafjhgcj');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (36454156, 'Linda Rosa Campo Rodriguez', 'Sistemas', 1, to_date('02-05-2011 12:23:08', 'dd-mm-yyyy hh24:mi:ss'), 'linda.campo@fcm.com.co', 'gdfefiedu');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (52829247, 'Alexandra Castro Cala', 'Contadora - Sevial', 0, to_date('28-07-2011 16:41:08', 'dd-mm-yyyy hh24:mi:ss'), 'contabilidadsevial@etb.net.co', 'jajeiijg');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (98665143, 'FERLEY HERNANDEZ', 'Asesor Remo', 0, to_date('28-07-2011 16:41:14', 'dd-mm-yyyy hh24:mi:ss'), 'ferley.hernandez@remo.com.co', '490r0ja');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (52271104, 'Luz Dary Serna Zuluaga', 'Ingeniera de Sistemas de Informacion', 0, to_date('28-07-2011 16:41:23', 'dd-mm-yyyy hh24:mi:ss'), 'luz.serna@fcm.org.co', 'ehhciijf');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (5217910, 'Sandra Milena Tapias Mena', 'Directora Nacional Simit', 0, to_date('10-02-2011 14:39:20', 'dd-mm-yyyy hh24:mi:ss'), 'sandra.tapias@fcm.org.co', 'ehicaij');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (52179710, 'Sandra Milena Tapias Mena', 'Directora Nacional Simit', 0, to_date('28-07-2011 16:41:33', 'dd-mm-yyyy hh24:mi:ss'), 'sandra.tapias@fcm.org.co', 'ehicaij');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (1057463424, 'Juan Felipe Vargas Mosquera', 'Auxiliar Adminsitrativo - Sevial S.A', 0, to_date('28-07-2011 16:41:39', 'dd-mm-yyyy hh24:mi:ss'), 'fvsevial@etb.net.co', 'ijecfdgfhf');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (79292028, 'Nelson Julian Gonzalez Castellanos', 'Interventor Polca', 0, to_date('28-07-2011 16:41:45', 'dd-mm-yyyy hh24:mi:ss'), 'ngonzalez@ascontroltech.com', 'cahahjhb');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (94415494, 'DAnilo Marin Duque', 'Intervnetor Polca', 0, to_date('28-07-2011 16:41:51', 'dd-mm-yyyy hh24:mi:ss'), 'dmarin@ascontroltech.com', 'affiefaf');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (41703406, 'Nancy Galvez', 'Analista Financiera FCM', 1, to_date('06-05-2011 09:36:31', 'dd-mm-yyyy hh24:mi:ss'), 'nancy.galvez@fcm.org.co', 'ficjgfjd30uo2k');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (76318008, 'Carlos Eduardo Diaz Gomez', 'Superintendente POLCA', 0, to_date('28-07-2011 16:42:03', 'dd-mm-yyyy hh24:mi:ss'), 'ditra.gucon@policia.gov.co', 'cdgibjjb');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (79291064, 'Luis Enrique Parada Roa', 'Ingeniero de Sistemas de Informacion Simit', 1, to_date('03-07-2012 16:32:24', 'dd-mm-yyyy hh24:mi:ss'), 'luis.parada@fcm.org.co', 'up49iadg');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (52505412, 'Milena Fonseca', 'Administrador SDF Proyecta', 1, to_date('28-07-2011 16:30:52', 'dd-mm-yyyy hh24:mi:ss'), 'milenafonseca6@hotmail.com', 'ehejefih');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (79529763, 'Jhon Jairo Espejo', 'Usurio Operador_1', 1, to_date('28-07-2011 16:34:17', 'dd-mm-yyyy hh24:mi:ss'), 'jespejo@proyecta-sa.com', 'caehacdg');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (11348169, 'hugo cendales p', '11348169', 1, to_date('12-08-2011 16:11:39', 'dd-mm-yyyy hh24:mi:ss'), 'hugo.cendales@fasoftcol.com', 'iigfbida');
insert into PERSON (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password)
values (79894658, 'Yecid Duitama Muñoz', 'Usurio Operador_1', 1, to_date('14-05-2012 11:23:32', 'dd-mm-yyyy hh24:mi:ss'), 'yduitama@proyecta-sa.com', 'cabafdeb');
commit;
prompt 35 records loaded
prompt Loading ROL...
insert into ROL (rolid, namerol, enablerol, enablemod)
values (1, 'Administrador', 1, 1);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (46, 'Sistemas', 1, 0);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (47, 'Financiero', 1, 0);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (169, 'Autorización', 1, 0);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (149, 'Interventoría SIMIT', 1, 0);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (189, 'Concesionario SIMIT', 1, 0);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (209, 'Interventoría POLCA', 1, 0);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (229, 'POLCA', 1, 0);
insert into ROL (rolid, namerol, enablerol, enablemod)
values (249, 'Concesionario POLCA', 1, 0);
commit;
prompt 9 records loaded
prompt Loading ROLXPERSON...
insert into ROLXPERSON (rolid, personid)
values (47, 20995860);
insert into ROLXPERSON (rolid, personid)
values (209, 756093);
insert into ROLXPERSON (rolid, personid)
values (189, 79749775);
insert into ROLXPERSON (rolid, personid)
values (189, 41703406);
insert into ROLXPERSON (rolid, personid)
values (1, 5217910);
insert into ROLXPERSON (rolid, personid)
values (1, 79938127);
insert into ROLXPERSON (rolid, personid)
values (46, 72252690);
insert into ROLXPERSON (rolid, personid)
values (189, 91258174);
insert into ROLXPERSON (rolid, personid)
values (1, 36454156);
insert into ROLXPERSON (rolid, personid)
values (1, 52505412);
insert into ROLXPERSON (rolid, personid)
values (47, 79529763);
insert into ROLXPERSON (rolid, personid)
values (47, 79387035);
insert into ROLXPERSON (rolid, personid)
values (47, 53894138);
insert into ROLXPERSON (rolid, personid)
values (47, 53081510);
insert into ROLXPERSON (rolid, personid)
values (47, 79214899);
insert into ROLXPERSON (rolid, personid)
values (47, 51830521);
insert into ROLXPERSON (rolid, personid)
values (1, 60318659);
insert into ROLXPERSON (rolid, personid)
values (47, 79558733);
insert into ROLXPERSON (rolid, personid)
values (149, 79356292);
insert into ROLXPERSON (rolid, personid)
values (189, 16936171);
insert into ROLXPERSON (rolid, personid)
values (249, 26428628);
insert into ROLXPERSON (rolid, personid)
values (189, 70503484);
insert into ROLXPERSON (rolid, personid)
values (189, 94381393);
insert into ROLXPERSON (rolid, personid)
values (189, 79047955);
insert into ROLXPERSON (rolid, personid)
values (1, 96359982);
insert into ROLXPERSON (rolid, personid)
values (189, 51624352);
insert into ROLXPERSON (rolid, personid)
values (149, 52821280);
insert into ROLXPERSON (rolid, personid)
values (47, 52502100);
insert into ROLXPERSON (rolid, personid)
values (189, 43922859);
insert into ROLXPERSON (rolid, personid)
values (189, 66980838);
insert into ROLXPERSON (rolid, personid)
values (149, 19402370);
insert into ROLXPERSON (rolid, personid)
values (249, 52829247);
insert into ROLXPERSON (rolid, personid)
values (189, 98665143);
insert into ROLXPERSON (rolid, personid)
values (46, 52271104);
insert into ROLXPERSON (rolid, personid)
values (1, 52179710);
insert into ROLXPERSON (rolid, personid)
values (249, 1057463424);
insert into ROLXPERSON (rolid, personid)
values (209, 79292028);
insert into ROLXPERSON (rolid, personid)
values (209, 94415494);
insert into ROLXPERSON (rolid, personid)
values (229, 76318008);
insert into ROLXPERSON (rolid, personid)
values (1, 11348169);
insert into ROLXPERSON (rolid, personid)
values (1, 79291064);
insert into ROLXPERSON (rolid, personid)
values (47, 79894658);
commit;
prompt 42 records loaded
prompt Loading SALARIO_MINIMO...
insert into SALARIO_MINIMO (anho, valor)
values (2000, 4500);
insert into SALARIO_MINIMO (anho, valor)
values (2001, 4900);
insert into SALARIO_MINIMO (anho, valor)
values (2003, 5533);
insert into SALARIO_MINIMO (anho, valor)
values (2007, 7228);
insert into SALARIO_MINIMO (anho, valor)
values (2006, 6800);
insert into SALARIO_MINIMO (anho, valor)
values (2004, 5967);
insert into SALARIO_MINIMO (anho, valor)
values (2002, 5150);
insert into SALARIO_MINIMO (anho, valor)
values (2005, 6358);
insert into SALARIO_MINIMO (anho, valor)
values (2008, 7692);
insert into SALARIO_MINIMO (anho, valor)
values (2009, 8282);
insert into SALARIO_MINIMO (anho, valor)
values (2010, 8583);
insert into SALARIO_MINIMO (anho, valor)
values (2011, 8927);
commit;
prompt 12 records loaded
prompt Loading TERCERO...
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('05088000', '9000643638', 'Transito Moderno Bello Ltda', '02', 'AHO', 'POFsJRkRhYw8GGGb1WUCyg==', 54, 27, 1, 1, 'TransitoModernoBello@gmail.com');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('05615000', '8110227004', 'Cintra Rionegro', '02', 'AHO', 'UkoX2+JMnXFfFT6d+JYx5Q==', 36, 18, 1, 1, 'CintraRionegro@gmail.com');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('20011000', '8305124517', 'MICROSHIF E.U.', '01', 'AHO', 'RiZMv1JrOXm93pIyaR7oyg==', 100, 100, 2, 1, 'microshifeu@correo.com');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('17001000', '9000687961', 'Infomanizales', '02', 'CTE', 'Z5tu+MM6OAFfcAIPb3bLQw==', 63, 31.5, 1, 1, 'Infomanizales@gmail.com');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('13001000', '9001752675', 'Circulemos Cartagena', '52', 'CTE', 'BbKxXmW+clFfFT6d+JYx5Q==', 28.5, 28.5, 1, 1, 'CirculemosCartagena@gmail.com');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('70670000', '9000463577', 'CONSERCAR LTDA', '40', 'AHO', 'LrEp6yGY008CGGgR+dpUpA==', 100, 100, 2, 1, 'consercar@sampues.com.co');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('47189000', '9003652362', 'SERVICE GENERALI COMPANY S.A.S.', '01', 'CTE', 'BfGCKuOXXOZpGCozvP9KhA==', 100, 100, 2, 1, 'tercero1@servicegeneralicompany.gov.co');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('54001000', '8305124517', 'MICROSHIF E.U.', '01', 'AHO', 'RiZMv1JrOXm93pIyaR7oyg==', 100, 100, 2, 1, 'microshifeu@net.com');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('08001000', '8605251485', 'VENTAS DE SERVICIO Y TRANSITO Y TRANSPORTE', '51', 'AHO', 'K67gTkjjdejvi5DOylhDow==', 100, 100, 2, 1, 'alcaldiabarranquilla@com.co');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('25290000', '9000750711', 'INVERSIONES PROAS', '07', 'CTE', 'xn+/pUXtrgqO2m42ppHDKw==', 100, 100, 2, 1, 'alcaldiafusagasuga@gov.co');
insert into TERCERO (idmunicipio, nit_t, nombre, idbanco, tipocuenta, cuenta, base_s, base_p, ind_base, num_tercero, correotercero)
values ('54405000', '8305124517', 'MICROSHIF E.U.', '01', 'AHO', 'RiZMv1JrOXm93pIyaR7oyg==', 100, 100, 2, 1, 'microshif_eu@hotmail.com');
commit;
prompt 11 records loaded
prompt Loading TIPOMVTO...
insert into TIPOMVTO (tipo, descripcion)
values ('0034', 'NOTA CREDITO');
insert into TIPOMVTO (tipo, descripcion)
values ('0035', 'DEPOSITO NORMAL');
insert into TIPOMVTO (tipo, descripcion)
values ('0036', 'DEPOSITO ESPECIAL');
insert into TIPOMVTO (tipo, descripcion)
values ('0039', 'DEPOSITO PLAZA');
insert into TIPOMVTO (tipo, descripcion)
values ('0045', 'RETIRO NORMAL');
insert into TIPOMVTO (tipo, descripcion)
values ('0046', 'RETIRO ESPECIAL');
insert into TIPOMVTO (tipo, descripcion)
values ('0055', 'NOTA DEBITO');
commit;
prompt 7 records loaded
prompt Loading VALIDADOR_FECHA...
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08001000', '001', to_date('01-01-1900', 'dd-mm-yyyy'), to_date('07-11-2002', 'dd-mm-yyyy'), 'SIMIT', 80, 0, 0, 10, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08001000', '002', to_date('01-01-1900', 'dd-mm-yyyy'), to_date('07-11-2002', 'dd-mm-yyyy'), 'POLCA', 35, 0, 0, 10, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08573000', '005', to_date('01-01-1900', 'dd-mm-yyyy'), to_date('30-11-2005', 'dd-mm-yyyy'), 'SIMIT', 90, 0, 0, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08573000', '006', to_date('01-01-1900', 'dd-mm-yyyy'), to_date('30-11-2005', 'dd-mm-yyyy'), 'POLCA', 45, 0, 0, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08296000', '007', to_date('01-01-1900', 'dd-mm-yyyy'), to_date('30-11-2005', 'dd-mm-yyyy'), 'SIMIT', 90, 0, 0, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08296000', '008', to_date('01-01-1900', 'dd-mm-yyyy'), to_date('30-11-2005', 'dd-mm-yyyy'), 'POLCA', 45, 0, 0, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08001000', '003', to_date('08-11-2002', 'dd-mm-yyyy'), to_date('24-12-2008', 'dd-mm-yyyy'), 'SIMIT', 90, 0, 0, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('08001000', '004', to_date('08-11-2002', 'dd-mm-yyyy'), to_date('24-12-2008', 'dd-mm-yyyy'), 'POLCA', 45, 0, 0, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('20011000', '001', to_date('18-07-2007', 'dd-mm-yyyy'), to_date('31-12-2007', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('76109000', '001', to_date('03-05-2006', 'dd-mm-yyyy'), to_date('30-06-2007', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('76111000', '001', to_date('01-07-2009', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 10, 0, 0, 80, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('05120000', '001', to_date('09-03-2007', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('05120000', '002', to_date('09-03-2007', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'POLCA', 0, 0, 0, 45, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('63130000', '001', to_date('01-08-2006', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 60, 0, 0, 30, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('63130000', '002', to_date('01-08-2006', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'POLCA', 15, 0, 0, 30, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('05147000', '001', to_date('26-10-2003', 'dd-mm-yyyy'), to_date('31-08-2009', 'dd-mm-yyyy'), 'SIMIT', 71, 9.5, 9.5, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('25290000', '001', to_date('15-05-2009', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('25290000', '002', to_date('15-05-2009', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'POLCA', 0, 0, 0, 45, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('68276000', '001', to_date('14-12-2007', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 45, 0, 0, 45, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('15000000', '001', to_date('21-05-2008', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'POLCA', 0, 0, 0, 45, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('15000000', '002', to_date('21-05-2008', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('54405000', '001', to_date('26-02-2008', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('73411000', '001', to_date('26-04-2008', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('41001000', '001', to_date('12-09-2003', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('41001000', '002', to_date('12-09-2003', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'POLCA', 0, 0, 0, 45, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('73449000', '001', to_date('02-01-2006', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('52001000', '001', to_date('15-04-2009', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('76520000', '001', to_date('01-10-2009', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('05686000', '001', to_date('01-10-2007', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('70001000', '001', to_date('29-05-2009', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('76834000', '001', to_date('25-01-2005', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 0, 0, 90, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('63594000', '001', to_date('31-10-2003', 'dd-mm-yyyy'), to_date('18-02-2010', 'dd-mm-yyyy'), 'SIMIT', 0, 9.5, 9.5, 71, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('63594000', '002', to_date('15-06-2007', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'POLCA', 0, 0, 0, 45, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('54498000', '001', to_date('17-10-2004', 'dd-mm-yyyy'), to_date('31-10-2010', 'dd-mm-yyyy'), 'SIMIT', 71, 9.5, 9.5, 0, null, 0, 0, null, 0, 0);
insert into VALIDADOR_FECHA (idmunicipio, idvalidador, fecha_ini, fecha_fin, indtipo, p_municipio, p_fcm_contravencional, p_conces_contravencional, p_acuerdopago, nit_tercero1, base_tercero1, ind_base_tercero1, nit_tercero2, base_tercero2, ind_base_tercero2)
values ('05631000', '001', to_date('28-04-2003', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 'SIMIT', 71, 9.5, 9.5, 0, null, 0, 0, null, 0, 0);
commit;
prompt 35 records loaded
prompt Enabling foreign key constraints for CTA_DISPERSION_CONCESIONARIO...
alter table CTA_DISPERSION_CONCESIONARIO enable constraint FK_IDCONCEPTO_CDC;
alter table CTA_DISPERSION_CONCESIONARIO enable constraint FK_IDCONCESIONARIO_CDC;
prompt Enabling foreign key constraints for CTA_RECAUDO_CONCESIONARIO...
alter table CTA_RECAUDO_CONCESIONARIO enable constraint FK_IDCONCESIONARIO_CRC;
prompt Enabling foreign key constraints for CTA_RECAUDO_FCM...
alter table CTA_RECAUDO_FCM enable constraint FK_NIT_FCM_CRF;
prompt Enabling foreign key constraints for MUNICIPIO...
alter table MUNICIPIO enable constraint FK_IDBANCO_M;
alter table MUNICIPIO enable constraint FK_IDCONCESIONARIO_M;
alter table MUNICIPIO enable constraint FK_IDDEPARTAMENTO_M;
prompt Enabling foreign key constraints for DIAS_DISPERSION...
alter table DIAS_DISPERSION enable constraint FK_IDBANCO_DD;
alter table DIAS_DISPERSION enable constraint FK_IDMUNICIPIO_DD;
prompt Enabling foreign key constraints for OFICINABANCO...
alter table OFICINABANCO enable constraint FK_OFICINABANCOMUN;
prompt Enabling foreign key constraints for P_DISPERSION_CONCESIONARIO...
alter table P_DISPERSION_CONCESIONARIO enable constraint FK_IDCONCESIONARIO_PDC;
prompt Enabling foreign key constraints for P_DISPERSION_MUNICIPIO...
alter table P_DISPERSION_MUNICIPIO enable constraint FK_IDMUNICIPIO_PDM;
prompt Enabling foreign key constraints for TERCERO...
alter table TERCERO enable constraint FK_IDBANCO_T;
alter table TERCERO enable constraint FK_IDMUNICIPIO_T;
prompt Enabling triggers for BANCO...
alter table BANCO enable all triggers;
prompt Enabling triggers for CONCEPTO...
alter table CONCEPTO enable all triggers;
prompt Enabling triggers for CONCEPTOSIDENTIFICAR...
alter table CONCEPTOSIDENTIFICAR enable all triggers;
prompt Enabling triggers for CONCESIONARIO...
alter table CONCESIONARIO enable all triggers;
prompt Enabling triggers for CTA_DISPERSION_CONCESIONARIO...
alter table CTA_DISPERSION_CONCESIONARIO enable all triggers;
prompt Enabling triggers for CTA_DISPERSION_FCM...
alter table CTA_DISPERSION_FCM enable all triggers;
prompt Enabling triggers for CTA_DISPERSION_TERCERO...
alter table CTA_DISPERSION_TERCERO enable all triggers;
prompt Enabling triggers for CTA_RECAUDO_CONCESIONARIO...
alter table CTA_RECAUDO_CONCESIONARIO enable all triggers;
prompt Enabling triggers for FCM...
alter table FCM enable all triggers;
prompt Enabling triggers for CTA_RECAUDO_FCM...
alter table CTA_RECAUDO_FCM enable all triggers;
prompt Enabling triggers for DEPARTAMENTO...
alter table DEPARTAMENTO enable all triggers;
prompt Enabling triggers for MUNICIPIO...
alter table MUNICIPIO enable all triggers;
prompt Enabling triggers for DIAS_DISPERSION...
alter table DIAS_DISPERSION enable all triggers;
prompt Enabling triggers for FECHA_NO_HABIL...
alter table FECHA_NO_HABIL enable all triggers;
prompt Enabling triggers for FUNCIONARIOS_CONCESIONARIO...
alter table FUNCIONARIOS_CONCESIONARIO enable all triggers;
prompt Enabling triggers for GRUPO_CORREO...
alter table GRUPO_CORREO enable all triggers;
prompt Enabling triggers for MENU...
alter table MENU enable all triggers;
prompt Enabling triggers for MENUXROL...
alter table MENUXROL enable all triggers;
prompt Enabling triggers for MOTIVOAJUSTE...
alter table MOTIVOAJUSTE enable all triggers;
prompt Enabling triggers for OFICINABANCO...
alter table OFICINABANCO enable all triggers;
prompt Enabling triggers for PADRE...
alter table PADRE enable all triggers;
prompt Enabling triggers for PAR_CONTA...
alter table PAR_CONTA enable all triggers;
prompt Enabling triggers for P_DISPERSION_CONCESIONARIO...
alter table P_DISPERSION_CONCESIONARIO enable all triggers;
prompt Enabling triggers for P_DISPERSION_MUNICIPIO...
alter table P_DISPERSION_MUNICIPIO enable all triggers;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for ROL...
alter table ROL enable all triggers;
prompt Enabling triggers for ROLXPERSON...
alter table ROLXPERSON enable all triggers;
prompt Enabling triggers for SALARIO_MINIMO...
alter table SALARIO_MINIMO enable all triggers;
prompt Enabling triggers for TERCERO...
alter table TERCERO enable all triggers;
prompt Enabling triggers for TIPOMVTO...
alter table TIPOMVTO enable all triggers;
prompt Enabling triggers for VALIDADOR_FECHA...
alter table VALIDADOR_FECHA enable all triggers;
set feedback on
set define on
prompt Done.
