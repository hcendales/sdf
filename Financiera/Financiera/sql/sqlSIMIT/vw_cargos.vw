create or replace view vw_cargos as
select ' Seleccione'as Cargo, ' Seleccione' as Nombre
    from fcm f
  union
  select 'Director Ejecutivo'as Cargo, f.director_ejecutivo as Nombre
    from fcm f
  union
  select 'Director Nacional' as Cargo,f.director_nacional as Nombre
    from fcm f
  union
  select 'Contador General' as Cargo,f.contador_general as Nombre
    from fcm f
  union
  select 'Coordinador Financiero' as Cargo,f.coordinador_financiero as Nombre
    from fcm f;

