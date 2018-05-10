CREATE OR REPLACE VIEW VW_MUNICIPIO_NOV AS
SELECT SIMIT.MUNICIPIO.IDMUNICIPIO,
(  SIMIT.MUNICIPIO.NOMBRE || ' - ' ||  simit.departamento.nombre || ' - ' || SIMIT.MUNICIPIO.IDMUNICIPIO  ) NOMBRE
FROM SIMIT.MUNICIPIO, simit.departamento
where simit.municipio.iddepartamento = simit.departamento.iddepartamento
union
select n.idmunicipio,
(n.nombre || ' - ' ||  d.nombre || ' - ' || n.idmunicipio ) nombre
from novmunicipio n , departamento d
where n.iddepartamento = d.iddepartamento
and n.tiponov = '01'
and n.fechaaplicacion is null
order by nombre;

