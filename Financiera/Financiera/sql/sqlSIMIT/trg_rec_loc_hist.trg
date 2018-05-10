CREATE OR REPLACE TRIGGER "TRG_REC_LOC_HIST" 
  BEFORE INSERT or UPDATE or DELETE on rec_loc_hist
  for each row
declare
  -- local variables here
begin
  :new.fecha_ejecucion := sysdate;
  IF insertING THEN
     :new.novedad := 'I';
     :new.X55 := 0;
     :new.XFCM := 0;
     :new.XMUN := 0;
  ELSIF updatING and :new.novedad = 'U' THEN
     :new.X55 := 0;
     :new.XFCM := 0;
     :new.XMUN := 0;
  ELSIF updatING and :new.novedad = 'D' THEN
     :new.X55 := :old.X55;
     :new.XFCM := :old.XFCM;
     :new.XMUN := :old.XMUN;
  ELSE
     :new.novedad := '?';
     :new.X55 := :old.X55;
     :new.XFCM := :old.XFCM;
     :new.XMUN := :old.XMUN;

  end if;
end trg_REC_LOC_HIST;
/

