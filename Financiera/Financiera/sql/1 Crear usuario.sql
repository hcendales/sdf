-- EJECUTAR CON USUARIO SYS

-- borrado de usuario y todos sus objetos
drop user SIMIT cascade;

-- Create the user SIMIT 
create user SIMIT
  identified by "simit123"; 
  
-- Grant/Revoke role privileges 
grant connect to SIMIT;
grant resource to SIMIT;
-- Grant/Revoke system privileges 
grant create any context to SIMIT;
grant create cluster to SIMIT;
grant create dimension to SIMIT;
grant create indextype to SIMIT;
grant create job to SIMIT;
grant create materialized view to SIMIT;
grant create operator to SIMIT;
grant create procedure to SIMIT;
grant create sequence to SIMIT;
grant create session to SIMIT;
grant create synonym to SIMIT;
grant create table to SIMIT;
grant create trigger to SIMIT;
grant create type to SIMIT;
grant create view to SIMIT;
grant debug any procedure to SIMIT;
grant debug connect session to SIMIT;
grant unlimited tablespace to SIMIT;

CREATE TABLESPACE SIMIT_DATA
  DATAFILE 'SIMIT_DATA.dat'
  SIZE 20M AUTOEXTEND ON;
  
  
alter user SIMIT
  default tablespace SIMIT_DATA;

  
grant read, write on directory DATA_PUMP_DIR to SIMIT;

grant execute on utl_file to SIMIT;
grant execute on utl_smtp to SIMIT;
grant execute on utl_http to SIMIT;


  