CREATE OR REPLACE TRIGGER trg_tmp_villas_091031
  BEFORE insert or UPDATE on recaudo_externo_liquidacion  
  for each row
declare
  -- local variables here
begin
  if to_char(:new.fec_corte, 'yymmdd') = '091031' and :new.idbanco = 52 then
     :new.fec_corte := to_date('091030','yymmdd');
  end if;
end trg_tmp_villas_091031;
/

