-- EJECUTAR CON USUARIO DBA

-- borrado de usuario y todos sus objetos
drop user simit cascade;

-- Create the user SIMIT 
create user simit
  identified by "simit123" default tablespace FINANCIERA; 
-- Grant/Revoke role privileges 
grant connect to simit;
grant resource to simit;
grant create view to simit;
grant unlimited tablespace to simit;
grant create SYNONYM TO simit;
