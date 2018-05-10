update cta_recaudo_concesionario
set cta_contable = substr(cta_contable,1,10);

update fcm
set ctacon_impuestos = '2905901010';

commit;
