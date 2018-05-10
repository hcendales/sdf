create or replace package pk_auten is

  -- Author  : Ricardo Buitrago Lizarazo
  -- Created : 28/12/2007 10:14:23 a.m.
  -- Purpose :

  -- Public type declarations
  TYPE cursor_t_salida IS REF CURSOR;

  -- Public variable declarations
  v_error   NUMBER := 0;
  v_message VARCHAR2(255);

  MSG_UPD_OK VARCHAR2(255) := 'Registro Actualizado Correctamente';
  MSG_INS_OK VARCHAR2(255) := 'Registro Insertado Correctamente';
  MSG_DEL_OK VARCHAR2(255) := 'Registro Eliminado Correctamente';

  SEMILLA_ENCRIPCION VARCHAR2(255) := 'FEDERACION COLOMBIANA DE MUNICIPIOS';

  FUNCTION darSemilla return varchar2;

  -- Public function and procedure declarations
  PROCEDURE i_usuario(p_idperson     varchar2,
                      p_nameperson   varchar2,
                      p_jobtitle     varchar2,
                      p_enableperson varchar2,
                      p_mail         varchar2,
                      p_clave        varchar2,
                      p_usuario      varchar2,
                      p_error        OUT VARCHAR2);
  PROCEDURE u_usuario(p_idperson     varchar2,
                      p_nameperson   varchar2,
                      p_jobtitle     varchar2,
                      p_enableperson varchar2,
                      p_mail         varchar2,
                      p_clave        varchar2,
                      p_usuario      varchar2,
                    p_error        OUT VARCHAR2);
  PROCEDURE i_rolxusuario(p_personid varchar2,
                          p_rolid    varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);

  PROCEDURE d_rolxusuario(p_personid varchar2,
                          p_rolid    varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);
  PROCEDURE u_rolxusuario(p_personid varchar2,
                          p_rolnew   varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);

  PROCEDURE i_rol(p_rolid        varchar2,
                  p_namerol      varchar2,
                  p_enablerol    varchar2,
                  p_enablemod    varchar2,

                  p_usuario      varchar2,
                  p_error        OUT VARCHAR2);
  PROCEDURE u_rol(p_rolid        varchar2,
                  p_namerol      varchar2,
                  p_enablerol    varchar2,
                  p_enablemod    varchar2,

                  p_usuario      varchar2,
                  p_error        OUT VARCHAR2);
  PROCEDURE u_menuxrol(p_rolid varchar2,
                          p_menunew   varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2);

  PROCEDURE i_menu(p_idmenu      varchar2,
                   p_namemenu    varchar2,
                   p_page        varchar2,
                   p_padreid     varchar2,
                   p_enablemenu  varchar2,
                   p_usuario     varchar2,
                   p_error       OUT VARCHAR2);
  PROCEDURE u_menu(p_idmenu      varchar2,
                   p_namemenu    varchar2,
                   p_page        varchar2,
                   p_padreid     varchar2,
                   p_enablemenu  varchar2,
                   p_usuario     varchar2,
                   p_error       OUT VARCHAR2);

  PROCEDURE q_usuario(p_usuario         number,
                      p_clave            varchar2,
                      p_semilla         varchar2,
                      p_error    OUT VARCHAR2,
                    p_nombre    OUT VARCHAR2);

  PROCEDURE d_usuario(p_idperson   number,
                      p_usuario    varchar2,
                      p_error      OUT VARCHAR2);

  PROCEDURE d_rol(p_rolid      number,
                         p_usuario    varchar2,
                         p_error      OUT VARCHAR2);

  PROCEDURE d_menu(p_idmenu      number,
                         p_usuario    varchar2,
                         p_error      OUT VARCHAR2);

PROCEDURE invoca_Seguridad(p_usuario         number,
                      p_clave            varchar2,
                      p_error    OUT VARCHAR2,
                      p_nombre    OUT VARCHAR2);

end pk_auten;
/

