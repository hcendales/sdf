CREATE OR REPLACE TRIGGER TRG_recloc_liqhis
BEFORE INSERT OR DELETE OR UPDATE
ON RECAUDO_LOCAL_LIQ_HIS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE

  vVALORLLAVE  number(8);
  vOPERACION   VARCHAR2(20);
  vIPMAQUINA   VARCHAR2(20):='1.1.1.1';


BEGIN

   vVALORLLAVE:=:old.consecutivo_recaudo;

IF INSERTING or UPDATING THEN
   VOPERACION:='Insert/Update';
   :new.fecha_ins_upt := sysdate;
   :new.p_55 := null;
   :new.p_fcm := null;
   :new.p_mun := null;

else
   VOPERACION:='Delete';

end if;

--select SYS_CONTEXT('USERENV', 'IP_ADDRESS', 15) into vipmaquina from dual;

   EXCEPTION
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END TRG_recloc_liqhis;
/

