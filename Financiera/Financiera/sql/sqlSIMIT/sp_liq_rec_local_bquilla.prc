CREATE OR REPLACE PROCEDURE "SP_LIQ_REC_LOCAL_bquilla" is
begin

dbms_output.put_line('Liquidacion Recaudo Local Historico [' || TO_CHAR(SYSDATE, 'YYMMDD') || ']');
dbms_output.put_line('Inicio [' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');

-- Revoke object privileges
--execute immediate ('revoke select, insert, update on rec_loc_hist_bquilla from NODO');
--execute immediate ('alter trigger trg_rec_loc_hist_bquilla disable');

UPDATE rec_loc_hist_bquilla t
   SET T.X55 = 0,
       T.XFCM = 0,
       T.XMUN = 0
where T.XFCM is null;

for c in (select s.* FROM SALARIO_MINIMO s ORDER BY S.ANHO)
loop
-- POLCA
  UPDATE rec_loc_hist_bquilla t
     SET T.X55 = ((T.TOTAL_RECAUDO - c.valor) / 2) + c.valor,
         T.XFCM = c.valor,
         T.XMUN = (T.TOTAL_RECAUDO - c.valor) / 2
   WHERE T.ID_TIPO_RECAUDO <> 4
     AND T.ID_TIPO_RECAUDO <> 7
     AND T.NOVEDAD <> 'D'
     AND T.XFCM = 0
     AND T.TOTAL_RECAUDO < c.valor * 10
     and t.POLCA = 'S'
     AND TO_CHAR(T.FECHA_CONTABLE, 'YYYY') = c.anho;
dbms_output.put_line('1-'||SQL%ROWCOUNT||'- POLCA  '||c.anho|| '[' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');

  UPDATE rec_loc_hist_bquilla t
     SET T.X55 = T.TOTAL_RECAUDO * .55,
         T.XFCM = T.TOTAL_RECAUDO * .10,
         T.XMUN = T.TOTAL_RECAUDO * .45
   WHERE T.ID_TIPO_RECAUDO <> 4
     AND T.ID_TIPO_RECAUDO <> 7
     AND T.NOVEDAD <> 'D'
     AND T.XFCM = 0
     AND T.TOTAL_RECAUDO >= c.valor * 10
     and t.POLCA = 'S'
     AND TO_CHAR(T.FECHA_CONTABLE, 'YYYY') = c.anho;
dbms_output.put_line('2-'||SQL%ROWCOUNT||'- POLCA  '||c.anho|| '[' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');

  UPDATE rec_loc_hist_bquilla t
     SET T.X55 = T.TOTAL_RECAUDO * .55,
         T.XFCM = T.TOTAL_RECAUDO * .10,
         T.XMUN = T.TOTAL_RECAUDO * .45
   WHERE T.ID_TIPO_RECAUDO in ( 4, 7)
     AND T.NOVEDAD <> 'D'
     AND T.XFCM = 0
     and t.POLCA = 'S'
     AND TO_CHAR(T.FECHA_CONTABLE, 'YYYY') = c.anho;
dbms_output.put_line('3-'||SQL%ROWCOUNT||'- POLCA  '||c.anho|| '[' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');
COMMIT;
-- PONAL
  UPDATE rec_loc_hist_bquilla t
     SET T.XFCM = c.valor,
         T.XMUN = T.TOTAL_RECAUDO - c.valor
   WHERE T.ID_TIPO_RECAUDO <> 4
     AND T.ID_TIPO_RECAUDO <> 7
     AND T.NOVEDAD <> 'D'
     AND T.XFCM = 0
     AND T.TOTAL_RECAUDO < c.valor * 10
     and T.POLCA <> 'S'
     AND TO_CHAR(T.FECHA_CONTABLE, 'YYYY') = c.anho;
dbms_output.put_line('1-'||SQL%ROWCOUNT||'- PONAL  '||c.anho|| '[' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');

  UPDATE rec_loc_hist_bquilla t
     SET T.XFCM = T.TOTAL_RECAUDO * .10,
         T.XMUN = T.TOTAL_RECAUDO * .90
   WHERE T.ID_TIPO_RECAUDO <> 4
     AND T.ID_TIPO_RECAUDO <> 7
     AND T.NOVEDAD <> 'D'
     AND T.XFCM = 0
     AND T.TOTAL_RECAUDO >= c.valor * 10
     and T.POLCA <> 'S'
     AND TO_CHAR(T.FECHA_CONTABLE, 'YYYY') = c.anho;
dbms_output.put_line('2-'||SQL%ROWCOUNT||'- PONAL  '||c.anho|| '[' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');

  UPDATE rec_loc_hist_bquilla t
     SET T.XFCM = T.TOTAL_RECAUDO * .10,
         T.XMUN = T.TOTAL_RECAUDO * .90
   WHERE T.ID_TIPO_RECAUDO in ( 4, 7)
     AND T.NOVEDAD <> 'D'
     AND T.XFCM = 0
     and T.POLCA <> 'S'
     AND TO_CHAR(T.FECHA_CONTABLE, 'YYYY') = c.anho;
dbms_output.put_line('3-'||SQL%ROWCOUNT||'- PONAL  '||c.anho|| '[' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');

COMMIT;
end loop;
-- Grant object privileges
--execute immediate ('alter trigger trg_rec_loc_hist_bquilla enable');
--execute immediate ('grant select, insert, update on rec_loc_hist_bquilla to nodo');

dbms_output.put_line('Finalizo [' || TO_CHAR(SYSDATE, 'HH24:MI:SS') || ']');

/*
select T.IDMUNICIPIO, DECODE(t.POLCA, 'S', 'POLCA', 'PONAL') TIPO, COUNT(*) CANTIDAD, SUM(T.TOTAL_RECAUDO) VALOR_TOTAL, SUM(T.X55) P_55, SUM(T.XFCM) P_fcm, SUM(T.T.XMUN) T.XMUN from rec_loc_hist_bquilla t
GROUP BY T.IDMUNICIPIO, t.POLCA
*/
end SP_LIQ_REC_LOCAL_bquilla;
/

