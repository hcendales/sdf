CREATE OR REPLACE VIEW VW_SIMIT_VALIDADOR_COMPARENDO AS
SELECT idmunicipio AS divipo, idvalidador AS id_codigo,
          fecha_ini AS fecha_desde, fecha_fin AS fecha_hasta,
          DECODE (indtipo, 'SIMIT', 'N', 'POLCA', 'S') AS polca,
          0 AS participmunicipio, 0 AS participom1, 0 AS participom2,
          0 AS particippcc, 0 AS particippcf
     FROM validador_fecha;

