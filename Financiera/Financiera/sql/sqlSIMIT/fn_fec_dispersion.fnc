create or replace function fn_fec_dispersion(p_fecha           date,
                                             p_dias_dispersion number,
                                             p_frec_dispersion number,
                                             p_usuario         varchar2)
  return date is
  v_fecha   date;
  v_dias    number;
  v_festivo number;
  p_error varchar2(255);
  v_continuar boolean;


BEGIN


  v_dias := p_dias_dispersion;
  v_fecha := p_fecha;
  if p_frec_dispersion = 0 then -- DIAS
      v_fecha := p_fecha;
  elsif p_frec_dispersion = 1 then -- FRECUENCIA - INICIO SEMANA
    v_dias := 1;
    v_fecha := v_fecha + Abs(TO_CHAR(v_fecha, 'D') - 7);
  elsif p_frec_dispersion = 2 then -- FRECUENCIA - INICIO QUINCENA
    v_dias := 1;
    IF TO_CHAR(v_fecha, 'DD') <= 15 THEN
       v_fecha := v_fecha + 15 - TO_CHAR(v_fecha, 'DD');
    else
       v_fecha := Last_day(v_fecha);
    END IF;
  elsif p_frec_dispersion = 3 then -- FRECUENCIA - INICIO MES
    v_dias := 1;
    v_fecha := Last_day(v_fecha);
  else
    p_error := 'El valor de la frecuencia es invalido';
  end if;
    while v_dias > 0 loop
      v_fecha := v_fecha + 1;
      IF UPPER(TO_CHAR(v_fecha, 'DY', 'NLS_DATE_LANGUAGE = American' )) not in ('SAT','SUN') then
        select COUNT(*)
          into v_festivo
          from fecha_no_habil
         where fecha = TO_CHAR(v_fecha, 'YYYYMMDD');
        if v_festivo = 0 then
          v_dias := v_dias - 1;
        end if;
      end if;
    end loop;

-- cambio Abril/2010
-- Devolver proximo dia habil si la fecha no es dia habil, si es habil devuleve la misma fecha

    if (p_dias_dispersion = 0 and p_frec_dispersion = 0) then
      v_continuar := true;
      while v_continuar loop
          if UPPER(TO_CHAR(v_fecha, 'DY', 'NLS_DATE_LANGUAGE = American' )) not in ('SAT','SUN') then
              select COUNT(*)
              into v_festivo
              from fecha_no_habil
              where fecha = TO_CHAR(v_fecha, 'YYYYMMDD');

              if v_festivo = 0 then
                v_continuar := false;
              end if;
          end if;
          if (v_continuar) then
              v_fecha := v_fecha + 1;
          end if;
      end loop;
  end if;

-- Devolver -n dias habil

    if (p_dias_dispersion < 0 and p_frec_dispersion = 0) then
    while v_dias < 0 loop
      v_fecha := v_fecha -1;
      IF UPPER(TO_CHAR(v_fecha, 'DY', 'NLS_DATE_LANGUAGE = American' )) not in ('SAT','SUN') then
        select COUNT(*)
          into v_festivo
          from fecha_no_habil
         where fecha = TO_CHAR(v_fecha, 'YYYYMMDD');
        if v_festivo = 0 then
          v_dias := v_dias +1;
        end if;
      end if;
    end loop;

    end if;

  return(v_fecha);
EXCEPTION
  WHEN OTHERS THEN
    sp_ex(SQLCODE,
          p_usuario || ' [fn_fec_dispersion] ' || SQLERRM,
          p_error);
end fn_fec_dispersion;
/

