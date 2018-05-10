create or replace view vw_rec_loc_hist_deuda as
select a.ID_SECRETARIA_DEUDA,
       a.polca_s,
       b.divipo,
       b.polca_f,
       a.TOTAL_RECAUDO,
       a.pago_simit,
       b.pago_finan
  from (select ID_SECRETARIA_DEUDA, polca polca_s, sum(TOTAL_RECAUDO) TOTAL_RECAUDO, SUM(xfcm) pago_simit
          from rec_loc_hist
         where POLCA = 'N'
           AND rec_loc_hist.fecha_contable < trunc(Last_day(Add_months(sysdate,-3))+1)
         GROUP BY ID_SECRETARIA_DEUDA, polca
        --ORDER BY id_secretaria_origen, polca
        UNION
        select ID_SECRETARIA_DEUDA, polca polca_s, sum(TOTAL_RECAUDO) TOTAL_RECAUDO, SUM(x55) pago_simit
          from rec_loc_hist
         where POLCA = 'S'
           AND rec_loc_hist.fecha_contable < trunc(Last_day(Add_months(sysdate,-3))+1)
         GROUP BY ID_SECRETARIA_DEUDA, polca
        --ORDER BY id_secretaria_origen, polca
        ) a
  FULL OUTER JOIN (select p.divipo,
                          p.polca polca_f,
                          SUM(p.valor_recaudo) pago_finan
                     from rec_loc_hist_pago p
                    GROUP BY p.divipo, p.polca
                   --ORDER BY p.divipo, p.polca
                   ) b on b.divipo = a.ID_SECRETARIA_DEUDA
                      and b.polca_f = a.polca_s
--where a.id_secretaria_origen = '73449000'
 order by 1, 2, 3, 4;

