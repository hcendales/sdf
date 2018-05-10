create or replace view vw_soportes as
select
ID_RECAUDO_LOCAL_AJUSTES,
ID_DOCUMENTO,
NOMBREDOCUMENTO,
NOMBREARCHIVO,
EXTENSIONARCHIVO
from soporteajustesrecloc;
