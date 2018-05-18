-- EJECUTAR CON USUARIO SYS

-- borrado de usuario y todos sus objetos
drop user QUIPUX cascade;

-- Create the user QUIPUX 
create user QUIPUX
  identified by "quipux123"; 
  
-- Grant/Revoke role privileges 
grant connect to QUIPUX;
grant resource to QUIPUX;
-- Grant/Revoke system privileges 
grant create any context to QUIPUX;
grant create cluster to QUIPUX;
grant create dimension to QUIPUX;
grant create indextype to QUIPUX;
grant create job to QUIPUX;
grant create materialized view to QUIPUX;
grant create operator to QUIPUX;
grant create procedure to QUIPUX;
grant create sequence to QUIPUX;
grant create session to QUIPUX;
grant create synonym to QUIPUX;
grant create table to QUIPUX;
grant create trigger to QUIPUX;
grant create type to QUIPUX;
grant create view to QUIPUX;
grant debug any procedure to QUIPUX;
grant debug connect session to QUIPUX;
grant unlimited tablespace to QUIPUX;

CREATE TABLESPACE QUIPUX_DATA
  DATAFILE 'QUIPUX_DATA.dat'
  SIZE 20M AUTOEXTEND ON;
  
  
alter user QUIPUX
  default tablespace QUIPUX_DATA;

  
grant read, write on directory DATA_PUMP_DIR to QUIPUX;

grant execute on utl_file to QUIPUX;
grant execute on utl_smtp to QUIPUX;
grant execute on utl_http to QUIPUX;


  