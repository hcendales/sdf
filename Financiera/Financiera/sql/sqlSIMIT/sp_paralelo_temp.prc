create or replace procedure sp_paralelo_temp (p_fecha date) is
  v_liquidacion       varchar2(10);
  v_fecha             date;
  v_comparendo        varchar2(20);
  v_validador         CHAR(3);
  v_indretroactividad number;
  v_contador          number := 0;
begin
  for c in (select r.* from recaudo_externo r where r.fec_corte = p_fecha) loop
    v_liquidacion := c.num_liquidacion;
    
    analisis.recaudo_externo_compl_ricardo(p_liquidacion => v_liquidacion,
                                           p_fecha       => v_fecha,
                                           p_comparendo => v_comparendo);
  
    update recaudo_externo r
       set r.validador_fecha =
           (select v.idvalidador
              from validador_fecha v
             where v.idmunicipio = c.idmunicipio
               and v_fecha >= v.fecha_ini 
               and v_fecha <= v.fecha_fin 
               and r.num_liquidacion = c.num_liquidacion
               and substr(r.num_liquidacion, 8, 1) =
                   decode(V.indtipo, 'SIMIT', 0, 'POLCA', 1))
     where r.num_liquidacion = c.num_liquidacion;
     
    update recaudo_externo r
    set r.num_comparendo = v_comparendo,
    r.fec_comparendo = v_fecha
    where r.num_liquidacion = c.num_liquidacion;
     
     
    v_contador := v_contador + SQL%ROWCOUNT;
    -- dbms_output.put_line(v_contador);
  
    if v_fecha is not null then
      if to_char(v_fecha, 'ddmmyyyy') <> '01011900' then
        if v_fecha < to_date('081102', 'ddmmyy') then
          update recaudo_externo r
             set r.indfecha2002 = 1 /* (select m.indretroactividad
                                                  from municipio m
                                                 where m.idmunicipio = c.idmunicipio
                                                   and m.indretroactividad = 1
                                                   AND r.num_liquidacion = c.num_liquidacion)*/
           where r.num_liquidacion = c.num_liquidacion;
          v_contador := v_contador + SQL%ROWCOUNT;
          -- dbms_output.put_line(v_contador);
        end if;
      end if;
    end if;
  
  end loop;
  update recaudo_externo r
     set r.indfecha2002 = 0
   where r.indfecha2002 is null;
  update recaudo_externo r
     set r.validador_fecha = '000'
   where r.validador_fecha is null;
  commit;
  -- dbms_output.put_line(v_contador);
end sp_paralelo_temp;
/

