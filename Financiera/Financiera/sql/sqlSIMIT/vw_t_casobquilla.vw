create or replace view vw_t_casobquilla as
select 'Metrotransito - PONAL' Secretaria, count(*) cantidad, sum(b.total_recaudo) total_recaudo, sum(b.XFCM) XFCM, sum(b.X55) X55, sum(b.XMUN) XMUN from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') <= '081224' and b.POLCA = 'N' union
select 'Secretaria Barranquilla - PONAL', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') > '081224' and b.POLCA = 'N'  union
select 'Sin identificar - PONAL', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where b.fecha_com is null and b.POLCA = 'N' UNION
select 'Metrotransito - POLCA' Secretaria, count(*) cantidad, sum(b.total_recaudo) total_recaudo, sum(b.XFCM) XFCM, sum(b.X55) X55, sum(b.XMUN) XMUN from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') <= '081224' and b.POLCA = 'S' union
select 'Secretaria Barranquilla - POLCA', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where to_char(b.fecha_com,'yymmdd') > '081224' and b.POLCA = 'S'  union
select 'Sin identificar - POLCA', count(*) cantidad, sum(b.total_recaudo), sum(b.XFCM), sum(b.X55), sum(b.XMUN) from rec_loc_hist_bquilla b where b.fecha_com is null and b.POLCA = 'S';

