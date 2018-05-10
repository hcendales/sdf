---------------------------------------------
-- Export file for user SIMIT              --
-- Created by user on 01/06/2011, 12:22:17 --
---------------------------------------------

spool 03_pk_recloc.log

prompt
prompt Creating package PK_RECLOC
prompt ==========================
prompt
create or replace package PK_RECLOC is

  PROCEDURE q_concesFunc(p_usuario          varchar2,
                         p_idConcesionario  out varchar2,
                         p_nomConcesionario out varchar2,
                         p_error            out varchar2);

  PROCEDURE u_deposito(p_usuario          varchar2,
                       p_numSecuenciaReg  number,
                       p_indtipoiden      varchar2,
                       p_idmunicipioiden  varchar2,
                       p_p_consignadoiden number,
                       p_observaciones    varchar2,
                       p_error            out varchar2);

end PK_RECLOC;
/

prompt
prompt Creating package body PK_RECLOC
prompt ===============================
prompt
create or replace package body PK_RECLOC is

  PROCEDURE q_concesFunc(p_usuario          varchar2,
                         p_idConcesionario  out varchar2,
                         p_nomConcesionario out varchar2,
                         p_error            out varchar2) is
    num_reg number;
  begin
  
    p_idCOncesionario  := '00';
    p_nomConcesionario := '';
  
    select count(*)
      into num_reg
      from person
     where idperson = to_number(p_usuario);
  
    if (num_reg = 0) then
      p_idCOncesionario  := '00';
      p_nomConcesionario := 'FUNCIONARIO EXISTE';
      return;
    end if;
  
    select count(*)
      into num_reg
      from funcionarios_concesionario
     where idperson = to_number(p_usuario);
  
    if (num_reg = 0) then
      p_idCOncesionario  := '00';
      p_nomConcesionario := 'FUNCIONARIO NO CONCESIONARIO';
      return;
    end if;
  
    select idConcesionario
      into p_idCOncesionario
      from funcionarios_concesionario
     where idperson = to_number(p_usuario);
  
    select count(*)
      into num_reg
      from concesionario
     where idconcesionario = p_idCOncesionario;
  
    if (num_reg = 0) then
      p_idCOncesionario  := '00';
      p_nomConcesionario := 'CONCESIONARIO FUNCIONARIO NO EXISTE';
      return;
    end if;
  
    select nombre
      into p_nomConcesionario
      from concesionario
     where idconcesionario = p_idCOncesionario;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_concesFunc] ' || SQLERRM, p_error);
  END q_concesFunc;

  PROCEDURE u_deposito(p_usuario          varchar2,
                       p_numSecuenciaReg  number,
                       p_indtipoiden      varchar2,
                       p_idmunicipioiden  varchar2,
                       p_p_consignadoiden number,
                       p_observaciones    varchar2,
                       p_error            out varchar2) is
    num_reg number;
  begin
  
    select count(*)
      into num_reg
      from trxsinidentificar
     where numSecuenciaReg = p_numSecuenciaReg;
  
    if (num_reg = 0) then
      p_error := 'No existe registro ' || to_char(p_numSecuenciaReg);
      return;
    end if;
  
    update trxsinidentificar
       set fechaidentificacion   = sysdate,
           usuarioidentificacion = to_number(p_usuario),
           indtipoiden           = p_indtipoiden,
           idmunicipioiden       = p_idmunicipioiden,
           p_consignadoiden      = p_p_consignadoiden,
           observaciones         = p_observaciones,
           estadoiden            = 'ID'
     where numsecuenciareg = p_numsecuenciareg;
  
    commit;
  
    p_error := PK_PROC.MSG_UPD_OK;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_deposito] ' || SQLERRM, p_error);
  END u_deposito;

end PK_RECLOC;
/


spool off
