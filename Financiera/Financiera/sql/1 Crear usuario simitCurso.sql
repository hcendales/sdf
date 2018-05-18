-- EJECUTAR CON USUARIO SYS

-- borrado de usuario y todos sus objetos
drop user SIMITCURSO cascade;

-- Create the user SIMITCURSO 
create user SIMITCURSO
  identified by "simitcurso123"; 
  
-- Grant/Revoke role privileges 
grant connect to SIMITCURSO;
grant resource to SIMITCURSO;
-- Grant/Revoke system privileges 
grant create any context to SIMITCURSO;
grant create cluster to SIMITCURSO;
grant create dimension to SIMITCURSO;
grant create indextype to SIMITCURSO;
grant create job to SIMITCURSO;
grant create materialized view to SIMITCURSO;
grant create operator to SIMITCURSO;
grant create procedure to SIMITCURSO;
grant create sequence to SIMITCURSO;
grant create session to SIMITCURSO;
grant create synonym to SIMITCURSO;
grant create table to SIMITCURSO;
grant create trigger to SIMITCURSO;
grant create type to SIMITCURSO;
grant create view to SIMITCURSO;
grant debug any procedure to SIMITCURSO;
grant debug connect session to SIMITCURSO;
grant unlimited tablespace to SIMITCURSO;

CREATE TABLESPACE SIMITCURSO_DATA
  DATAFILE 'SIMITCURSO_DATA.dat'
  SIZE 20M AUTOEXTEND ON;
  
  
alter user SIMITCURSO
  default tablespace SIMITCURSO_DATA;

  
grant read, write on directory DATA_PUMP_DIR to SIMITCURSO;

grant execute on utl_file to SIMITCURSO;
grant execute on utl_smtp to SIMITCURSO;
grant execute on utl_http to SIMITCURSO;


  