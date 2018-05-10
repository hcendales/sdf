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

update recaudo_externo_liquidacion
set idbancomun = '00',
tipocuentamun = 'AHO',
ctamun = encriptar('SIN DATO');
  