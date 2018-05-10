create or replace view vw_dispolcaexterno as
select
      fec_corte_ini,
      fec_corte_fin,
      fec_dispersion,
      r.id_concesionario_liq "idconcesionario",
      orden,
      concepto,
      ori_idbanco,
      ori_tipocuenta,
      ori_cuenta,
      ori_nit,
      des_idbanco,
      des_tipocuenta,
      des_cuenta,
      des_nit,
      indtipo,
      usuario_proceso,
      fecha_proceso,
      valor,
      c.nombre "Concesionario",
      bdes.nombre "BancoDes",
      bori.nombre "BancoOri",
      deb_cta_con,
      deb_cen_cos,
      deb_nit_ter,
      cre_cta_con,
      cre_cen_cos,
      cre_nit_ter,
      concepto_con
    from RECAUDO_externo_DISP r, concesionario c, banco bdes, banco bori
   where INDTIPO = 'POLCA'
   and r.id_concesionario_liq = c.idconcesionario
   and r.ori_idbanco = bori.idbanco
   and r.des_idbanco = bdes.idbanco
   and r.valor <> 0.0
   order by r.fec_dispersion, r.id_concesionario_liq,orden;

