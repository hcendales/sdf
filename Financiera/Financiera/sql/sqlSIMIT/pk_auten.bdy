create or replace package body pk_auten is

  -- Private variable declarations
  v_valida NUMBER;

  -- Function and procedure implementations 
  PROCEDURE i_menu(p_idmenu      varchar2,
                   p_namemenu    varchar2,
                   p_page        varchar2,
                   p_padreid     varchar2,
                   p_enablemenu  varchar2,
                   p_usuario     varchar2,
                   p_error       OUT VARCHAR2) is
  v_idmenu number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_auten');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      select seq_menu.NEXTVAL into v_idmenu from dual;
      insert into menu
        (idmenu, namemenu, page, padreid, enablemenu)
      values
        (v_idmenu, p_namemenu, p_page, p_padreid, p_enablemenu);

      sp_log(p_usuario,
             'i_menu',
             v_idmenu || '-' || p_namemenu || '-' || p_page || '-' || p_padreid || '-' || p_enablemenu);
             
      commit;
      p_error := MSG_INS_OK;
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_menu] ' || SQLERRM, p_error);
  END i_menu;

  PROCEDURE u_menu(p_idmenu      varchar2,
                   p_namemenu    varchar2,
                   p_page        varchar2,
                   p_padreid     varchar2,
                   p_enablemenu  varchar2,
                   p_usuario     varchar2,
                   p_error       OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_auten');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
        update menu
           set namemenu = p_namemenu,
               page = p_page,
               padreid = p_padreid,
               enablemenu = p_enablemenu
         where idmenu = p_idmenu;

          sp_log(p_usuario,
                 'u_menu',
             p_idmenu || '-' || p_namemenu || '-' || p_page || '-' || p_padreid || '-' || p_enablemenu);
             
      commit;
      p_error :=MSG_UPD_OK;
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_menu] ' || SQLERRM, p_error);
  END u_menu;

  PROCEDURE i_rol(p_rolid        varchar2,
                  p_namerol      varchar2,
                  p_enablerol    varchar2,
                  p_enablemod    varchar2,
                  p_usuario      varchar2,
                  p_error        OUT VARCHAR2) is
  v_rolid number;
  begin
    -- VALIDACIONES
    -- sp_v_usuario(p_usuario, p_error,'pk_auten');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      select SEQ_ROL.NEXTVAL into v_rolid from dual;
      insert into rol
        (rolid, namerol, enablerol , enablemod)
      values
        (v_rolid, p_namerol, p_enablerol, p_enablemod);

      sp_log(p_usuario,
             'i_rol',
             v_rolid || '-' || p_namerol || '-' || p_enablerol );
             
      commit;
      p_error := to_char(v_rolid);
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      p_error := 'NOK';
      sp_ex(SQLCODE, p_usuario || ' [i_rol] ' || SQLERRM, p_error);
  END i_rol;

  PROCEDURE u_rol(p_rolid        varchar2,
                  p_namerol      varchar2,
                  p_enablerol    varchar2,
                  p_enablemod    varchar2,
                  
                  p_usuario      varchar2,
                  p_error        OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_auten');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
        update rol
           set namerol = p_namerol,
               enablerol = p_enablerol,
               enablemod = p_enablemod
         where rolid = p_rolid;
          sp_log(p_usuario,
                 'u_rol',
                 p_rolid || '-' || p_namerol || '-' || p_enablerol );
             
      commit;
      p_error := p_rolid;
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      p_error := 'NOK';
      sp_ex(SQLCODE, p_usuario || ' [u_rol] ' || SQLERRM, p_error);
  END u_rol;

PROCEDURE u_rolxusuario(p_personid varchar2,
                          p_rolnew   varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2) is
  v_result varchar2(10);
  v_rolold varchar2(100);
  v_rolnew varchar2(100);
  v_pos number := 1;
  begin

    -- VALIDACIONES
    -- sp_v_usuario(p_usuario, p_error,'pk_auten');
    IF P_ERROR is null THEN
        for c in (select rolid, personid from rolxperson where personid = p_personid)
        loop
            v_rolold := v_rolold || c.rolid || ',';
        end loop;
        
        delete rolxperson where personid = p_personid;
        v_rolnew := p_rolnew;

        v_result := fn_token(c => v_rolnew,x => v_pos);
        while v_result is not null loop
            insert into rolxperson 
              (rolid, personid)
            values
              (v_result, p_personid);
            v_result := fn_token(c => v_rolnew,x => v_pos);
        end loop;

        sp_log(p_usuario, 'u_rolxusuario', p_personid || ' [Delete:' || v_rolold ||  '] [Insert:' || v_rolnew || ']');
        commit;
        p_error := 'Rol(es) de Usuario Asignado(s) Exitosamente. ';
     END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_rolxusuario] ' || SQLERRM, p_error);
  END u_rolxusuario;



  PROCEDURE i_usuario(p_idperson     varchar2,
                      p_nameperson   varchar2,
                      p_jobtitle     varchar2,
                      p_enableperson varchar2,
                      p_mail         varchar2,
                      p_clave      varchar2,
                      p_usuario      varchar2,
                      p_error        OUT VARCHAR2) is
  begin
    -- VALIDACIONES

    select COUNT(*)
      INTO v_valida
      from person t
     WHERE t.idperson = p_idperson;
  
    IF v_valida > 0 THEN
      P_ERROR := 'El usuario ya existe';
    END IF;
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      insert into person
        (idperson, nameperson, jobtitle, enableperson, lastupdate, mail, password )
      values
        (p_idperson,
         p_nameperson,
         p_jobtitle,
         p_enableperson,
         sysdate,
         p_mail,
         TRANSLATE(p_clave,'abcdefghijklmnopqrstuvwxyz0123456789', '0z1y2x3w4v5u6t7s8r9qponmlkjihgfedcba'));
      sp_log(p_usuario,
             'i_usuario',
             p_idperson || '-' || p_nameperson || '-' || p_jobtitle || '-' ||
             p_enableperson || '-' || to_char(sysdate, 'yymmdd_hhmi') || '-' ||
             p_mail);
             
      commit;
      p_error := 'Usuario Creado Exitosamente. ';
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [iu_usuario] ' || SQLERRM, p_error);
  END i_usuario;

  PROCEDURE u_usuario(p_idperson     varchar2,
                      p_nameperson   varchar2,
                      p_jobtitle     varchar2,
                      p_enableperson varchar2,
                      p_mail         varchar2,
                      p_clave        varchar2,
                      p_usuario      varchar2,
                      p_error        OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    select COUNT(*)
      INTO v_valida
      from person t
     WHERE t.idperson = p_idperson;
  
    IF v_valida = 0 THEN
      P_ERROR := 'El usuario NO existe';
    END IF;
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      update person
         set nameperson   = p_nameperson,
             jobtitle     = p_jobtitle,
             enableperson = p_enableperson,
             lastupdate   = sysdate,
             mail         = p_mail,
             password     = TRANSLATE(p_clave,'abcdefghijklmnopqrstuvwxyz0123456789', '0z1y2x3w4v5u6t7s8r9qponmlkjihgfedcba')
       where idperson = p_idperson;
      sp_log(p_usuario,
             'u_usuario',
             p_idperson || '-' || p_nameperson || '-' || p_jobtitle || '-' ||
             p_enableperson || '-' || to_char(sysdate, 'yymmdd_hhmi') || '-' ||
             p_mail);
      commit;
      p_error := 'Usuario Actualizado Exitosamente. ';
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_usuario] ' || SQLERRM, p_error);
  END u_usuario;

PROCEDURE i_rolxusuario(p_personid varchar2,
                          p_rolid    varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_auten');
    select COUNT(*)
      INTO v_valida
      from rolxperson t
     WHERE t.personid = p_personid
       and t.rolid = p_rolid;
  
    IF v_valida > 0 THEN
      P_ERROR := 'El rol por usuario ya existe';
    END IF;
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      insert into rolxperson
        (rolid, personid)
      values
        (p_rolid, p_personid);
      sp_log(p_usuario, 'i_rolxusuario', p_rolid || '-' || p_personid);
      commit;
      p_error := 'Rol de Usuario Asignado Exitosamente. ';
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_rolxusuario] ' || SQLERRM, p_error);
  END i_rolxusuario;

  PROCEDURE d_rolxusuario(p_personid varchar2,
                          p_rolid    varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2) is
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_auten');
    select COUNT(*)
      INTO v_valida
      from rolxperson t
     WHERE t.personid = p_personid
       and t.rolid = p_rolid;
  
    IF v_valida < 0 THEN
      P_ERROR := 'El rol por usuario no existe';
    END IF;
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete rolxperson
      where rolid = p_rolid
        and personid = p_personid;
      sp_log(p_usuario, 'd_rolxusuario', p_rolid || '-' || p_personid);
      commit;
      p_error := 'Rol de Usuario Eliminado Exitosamente. ';
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [d_rolxusuario] ' || SQLERRM, p_error);
  END d_rolxusuario;

  PROCEDURE u_menuxrol(p_rolid varchar2,
                          p_menunew   varchar2,
                          p_usuario  varchar2,
                          p_error    OUT VARCHAR2) is
  v_result varchar2(10);
  v_menuold varchar2(1000);
  v_menunew varchar2(1000);
  v_pos number := 1;
  begin

    -- VALIDACIONES
    --sp_v_usuario(p_usuario, p_error,'pk_auten');
    
    IF P_ERROR is null THEN
        for c in (select rolid, menuid from menuxrol where rolid = p_rolid)
        loop
            v_menuold := v_menuold || c.menuid || ',';
        end loop;
        
        delete menuxrol where rolid = p_rolid;
        v_menunew := p_menunew;

        v_result := fn_token(c => v_menunew,x => v_pos);
        while v_result is not null loop
            insert into menuxrol
              (menuid, rolid)
            values
              (v_result, p_rolid);
            v_result := fn_token(c => v_menunew,x => v_pos);
        end loop;

        sp_log(p_usuario, 'u_menuxrol', p_rolid || ' [Delete:' || v_menuold ||  '] [Insert:' || v_menunew || ']');
        commit;
        p_error := 'Opciones Agregadas Exitosamente';
     END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_menuxrol] ' || SQLERRM, p_error);
  END u_menuxrol;

 FUNCTION darSemilla return varchar2 is
 BEGIN
      return SEMILLA_ENCRIPCION;
 END darSemilla;
 
 
  PROCEDURE q_usuario(p_usuario         number,
                      p_clave            varchar2,
                      p_semilla  varchar2,
                      p_error    OUT VARCHAR2,
                      p_nombre    OUT VARCHAR2) is
    v_valida    NUMBER;
    v_integrada NUMBER;
  begin
   p_error := 'OK';
   
   SEMILLA_ENCRIPCION := p_semilla;
   
   select COUNT(*) INTO v_valida
   from person p
   WHERE p.idperson = p_usuario;
   
   if v_valida = 0 then
      p_error := 'USUARIO NO EXISTE EN SDF';
      return;
   end if;
   
   select f.seguridad_integrada
   into v_integrada
   from fcm f
   where f.nit_fcm = '8000826650';
   
   if (v_integrada = 1) then
      invoca_Seguridad(p_usuario, p_clave, p_error, p_nombre);
      return;
   end if;
   
   select COUNT(*), max(namePerson) INTO v_valida, p_nombre
   from person p
   WHERE p.idperson = p_usuario and
   p.password = TRANSLATE(p_clave,'abcdefghijklmnopqrstuvwxyz0123456789', '0z1y2x3w4v5u6t7s8r9qponmlkjihgfedcba');

   if v_valida = 0 then
      p_error := 'USUARIO CLAVE/INCORRECTA';
      return;
   end if;

   select COUNT(*) INTO v_valida
   from person p
   WHERE p.idperson = p_usuario and
   p.enableperson = 1;

   if v_valida = 0 then
      p_error := 'USUARIO DESACTIVADO. COMUNICARSE CON SU ADMINISTRADOR';
      return;
   end if;

   SELECT COUNT(*) INTO v_valida
   from person p, rolxperson rp, rol r
   where p.idperson = p_usuario and
   rp.personid = p.idperson and
   rp.rolid = r.rolid and
   r.enablerol = 1;

   if v_valida = 0 then
      p_error := 'USUARIO SIN ROL DE TRABAJO. COMUNICARSE CON SU ADMINISTRADOR';
      return;
   end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_usuario] ' || SQLERRM, p_error);
  END q_usuario;


PROCEDURE d_usuario(p_idperson   number, 
                      p_usuario    varchar2,
                      p_error      OUT VARCHAR2) AS

     
  BEGIN
  
  sp_v_usuario(p_usuario, p_error,'pk_auten');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      delete person
      where idperson = p_idperson;  
      commit;
      p_error := MSG_DEL_OK;

    END IF;
    
    EXCEPTION
      WHEN OTHERS THEN
        sp_ex(SQLCODE, p_usuario || ' [eliminar_usuario] ' || SQLERRM, p_error);
    
 
  END  d_usuario; 
  
  PROCEDURE d_rol(p_rolid      number, 
                         p_usuario    varchar2,
                         p_error      OUT VARCHAR2) AS

     
  BEGIN
  
  sp_v_usuario(p_usuario, p_error,'pk_auten');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      
        select COUNT(*) INTO v_valida
        from rolxperson rp
        WHERE rp.rolid = p_rolid;

        if v_valida > 0 then
           p_error := 'ROL ESTA ASIGNADO. FAVOR DESASIGNAR PARA PODER ELIMINARLO';
           return;
        end if;
        
      
      delete rol
      where rolid = p_rolid;  
      commit;
      p_error := MSG_DEL_OK;

    END IF;
    
    EXCEPTION
      WHEN OTHERS THEN
        sp_ex(SQLCODE, p_usuario || ' [eliminar_usuario] ' || SQLERRM, p_error);
    
  END  d_rol; 

PROCEDURE d_menu(p_idmenu      number, 
                         p_usuario    varchar2,
                         p_error      OUT VARCHAR2) AS

     
  BEGIN
  
  sp_v_usuario(p_usuario, p_error,'pk_auten');
  
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      
        select COUNT(*) INTO v_valida
        from menuxrol mr
        WHERE mr.menuid =p_idmenu; 

        if v_valida > 0 then
           p_error := 'MENU ESTA ASIGNADO A UN ROL. FAVOR DESASIGNAR PARA PODER ELIMINARLO';
           return;
        end if;
        
      delete menu
      where idmenu = p_idmenu;  
      
      commit;
      p_error := MSG_DEL_OK;

    END IF;
    
    EXCEPTION
      WHEN OTHERS THEN
        sp_ex(SQLCODE, p_usuario || ' [d_menu] ' || SQLERRM, p_error);
    
  END  d_menu; 
  
PROCEDURE invoca_Seguridad(p_usuario         number,
                      p_clave            varchar2,
                      p_error    OUT VARCHAR2,
                      p_nombre    OUT VARCHAR2) as
    req   UTL_HTTP.req := NULL;
    resp  UTL_HTTP.resp := NULL;
    respVal VARCHAR2(32000);
    reqXML VARCHAR2(32760);
    v_url VARCHAR2(250);
    x number;
    y number;
    
    docRes XMLTYPE;
  
    fault_node xmltype; 
    fault_code VARCHAR2(256); 
    fault_string VARCHAR2(32000);
    
    respuesta varchar2(256);

BEGIN
    
   select f.url_seguridad
   into v_url
   from fcm f
   where f.nit_fcm = '8000826650';
   
   select p.nameperson 
   INTO p_nombre
   from person p
   WHERE p.idperson = p_usuario;
 
    /*Generamos un Request a la URL destino, el método debe ser POST */
    req := UTL_HTTP.begin_request(v_url, 'POST');
 
/*Creamos un mensaje SOAP tal cual se define en el WSDL*/
   reqXML := '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://webServices.qxMultas.quipux.com.co">
   <soapenv:Header/>
   <soapenv:Body>
      <web:getValidaUsuario soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
         <idFuncionario xsi:type="xsd:string">' || to_char(p_usuario) || '</idFuncionario>
         <clave xsi:type="xsd:string">' || p_clave || '</clave>
      </web:getValidaUsuario>
   </soapenv:Body>
</soapenv:Envelope>';
 
/*El contenido que enviamos es XML: */
   UTL_HTTP.set_header(req, 'Content-Type', 'text/xml');
 
/*Establecemos el SOAPAction a invocar: */
   UTL_HTTP.set_header(req, 'SOAPAction', '"rpc/' || v_url || '"');
 
/*Indicamos en el header el tamano del mensaje enviado: */
   UTL_HTTP.set_header(req, 'Content-Length', LENGTH(reqXML));
 
/*Escribimos el body del request */
   UTL_HTTP.write_text(req, reqXML);
 
/*Obtenemos la respuesta */
   resp := UTL_HTTP.get_response(req);
 
/*Cargamos en la variable respVal la devolución del servidor */
   UTL_HTTP.read_text(resp, respVal);

/*Finalizamos la conexión HTTP */
   UTL_HTTP.end_response(resp);

  insert into log
    (fecha, usuario, proceso, accion)
  values
    (sysdate, to_char(p_usuario), 'ConsumoWS', respVal);
    
   commit;
     
   docRes := xmltype.createxml(respVal);
   
   if (docRes.EXTRACT('//faultcode/text()') is null ) then
       p_error := 'Usuario/clave Incorrecto';
      return;
   end if;
  
   p_error := 'OK';
   

EXCEPTION
    WHEN UTL_HTTP.end_of_body THEN
      UTL_HTTP.end_response(resp);
      
   p_error := 'ERROR DE CONEXION CON PLATAFORMA SIMIT';

    
END  invoca_Seguridad;


end pk_auten;
/

