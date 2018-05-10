create or replace package body pk_proc is

  -- Private variable declarations
  v_valida NUMBER;

  PROCEDURE i_archivo(p_filename varchar2,
                      p_cfile    clob,
                      p_usuario  varchar2,
                      p_error    OUT VARCHAR2) is
    p_uploadid number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      select seq_uploads.nextval into p_uploadid from dual;
      insert into upload
        (uploadid, filename, cfile, usuario, fecha, valida)
      values
        (p_uploadid, p_filename, p_cfile, p_usuario, sysdate, 0);
      p_error := p_uploadid;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_archivo] ' || SQLERRM, p_error);
  END i_archivo;

  PROCEDURE v_archivo(p_tipocargue      varchar2,
                      p_uploadid        number,
                      p_idbanco         char,
                      p_cta_recaudo_fcm varchar2,
                      p_usuario         varchar2,
                      p_error           OUT VARCHAR2) is

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');
    IF P_ERROR is null THEN

      -- Si pasa todas las validaciones
      IF (p_tipocargue = 'REC' and p_idbanco <> '52') THEN
        p_error := 'Formato no soportado';
        return;
      END IF;

      IF (p_tipocargue = 'REC' and p_idbanco = '52') THEN

        p_error := fn_divide_archivo_avvillas(p_uploadid        => p_uploadid,
                                              p_idbanco         => p_idbanco,
                                              p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                                              p_usuario         => p_usuario,
                                              p_error           => p_error);
      END IF;

      IF (p_tipocargue = 'DEP') THEN

        p_error := fn_divide_archivo_dep(p_uploadid        => p_uploadid,
                                         p_idbanco         => p_idbanco,
                                         p_cta_recaudo_fcm => p_cta_recaudo_fcm,
                                         p_usuario         => p_usuario,
                                         p_error           => p_error);
      END IF;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [v_archivo] ' || SQLERRM, p_error);
  END v_archivo;

PROCEDURE i_Novmunicipio(p_idmunicipio              varchar2,
                           p_nit_m                    varchar2,
                           p_nombre                   varchar2,
                           p_idconcesionario          varchar2,
                           p_correo                   varchar2,
                           p_indretroactividad        number,
                           p_indliq_s_ext             number,
                           p_indliq_s_local           number,
                           p_indliq_p_ext             number,
                           p_indliq_p_local           number,
                           p_indAcuerdoPago_2002      number,
                           p_idbanco                  varchar2,
                           p_tipocuenta               varchar2,
                           p_cuenta                   varchar2,
                           p_nit_cta                  varchar2,
                           p_municipio_s              number,
                           p_fcm_contravencional_s    number,
                           p_conces_contravencional_s number,
                           p_acuerdopago_s            number,
                           p_municipio_p              number,
                           p_fcm_contravencional_p    number,
                           p_conces_contravencional_p number,
                           p_acuerdopago_p            number,
                           p_usuario                  varchar2,
                           p_fecha_act_ano            number,
                           p_fecha_act_mes            number,
                           p_fecha_act_dia            number,
                           p_firma1                   varchar2,
                           p_firma2                   varchar2,
                           p_dnsAvvillas              varchar2,
                           p_dnsDavivienda            varchar2,
                           p_error                    OUT VARCHAR2,
                           p_novedad                  OUT varchar2

                           ) AS

    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    select mail
    into correo_usuario
    from person
    where idperson = TO_NUMBER(p_usuario);

    select substr(correo,0,100)
    into correo_fcm
    from fcm
    where nit_fcm = '8000826650';


    select count(*)
      INTO v_valida
      from departamento t
     where iddepartamento = substr(p_idmunicipio, 1, 2);

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    if (v_valida = 0) then
      p_error := 'Departamento no existe';
      return;
    end if;

    select COUNT(*)
      INTO v_valida
      from municipio t
     where idmunicipio = p_idmunicipio;

    IF v_valida <> 0 THEN
      p_error := 'municipio ya existente';
      return;
    else
      select dias_activacion into m_dias_activacion from fcm;
      IF m_dias_activacion is null THEN
        p_error := 'Error en parametrización (días activación)';
        return;
      ELSE
        min_fecha_act := fn_fec_dispersion(to_date(to_char(sysdate,
                                                           'yyyy-mm-dd'),
                                                   'yyyy-mm-dd'),
                                           m_dias_activacion,
                                           0,
                                           '99999999');
        IF min_fecha_act > w_fecha_act then
          p_error := 'Fecha Activación Inválida';
          return;
        ELSE
          select seq_novedad.Nextval into numNovedad from dual;

          insert into novmunicipio
            (idmunicipio,
             nit_m,
             nombre,
             idconcesionario,
             correo,
             indretroactividad,
             idbanco,
             tipocuenta,
             cuenta,
             nit_cta,
             indliq_s_ext,
             indliq_s_local,
             indliq_p_ext,
             indliq_p_local,
             indAcuerdoPago_2002,
             iddepartamento,
             TIPONOV,
             NUMERONOV,
             FECHANOV,
             USUARIONOV,
             FECHAACT,
             ESTADONOV,
             FIRMA1,
             FIRMA2,
             municipio_s,
             fcm_contravencional_s,
             conces_contravencional_s,
             acuerdopago_s,
             municipio_p,
             fcm_contravencional_p,
             conces_contravencional_p,
             acuerdopago_p,
             dnsavvillas,
             dnsgranbanco)
          values
            (p_idmunicipio,
             p_nit_m,
             p_nombre,
             p_idconcesionario,
             p_correo,
             p_indretroactividad,
             p_idbanco,
             p_tipocuenta,
             encriptar(p_cuenta),
             p_nit_cta,
             p_indliq_s_ext,
             p_indliq_s_local,
             p_indliq_p_ext,
             p_indliq_p_local,
             p_indAcuerdoPago_2002,
             substr(p_idmunicipio, 1, 2),
             '01', -- NOVEDAD ADICION MUNICIPIO
             numNovedad,
             sysdate,
             p_usuario,
             w_fecha_act,
             'INGRESADA',
             p_firma1,
             p_firma2,
             p_municipio_s,
             p_fcm_contravencional_s,
             p_conces_contravencional_s,
             p_acuerdopago_s,
             p_municipio_p,
             p_fcm_contravencional_p,
             p_conces_contravencional_p,
             p_acuerdopago_p,
             p_dnsAvvillas,
             p_dnsDavivienda);

          p_error   := MSG_INS_OK;
          p_novedad := '01-' || to_char(numNovedad, '0000000');

          sp_envionotificacion(
                gruporecibe => 4,
                grupocopia => -1,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_novedad,
                mensaje => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' || p_novedad || ' . Muchas gracias',
                p_usuario => p_usuario);
          commit;
        END IF;
      END IF;
    END IF;

    sp_log(p_usuario,
           'i_Novmunicipio',
           p_idmunicipio || '-' || p_nit_m || '-' || p_nombre || '-' ||
           p_idconcesionario || '-' || p_correo || '-' ||
           p_indretroactividad || '-' || p_idbanco || '-' || p_tipocuenta || '-' ||
           p_cuenta || '-' || p_nit_cta || '-' || p_indliq_s_ext || '-' ||
           p_indliq_s_local || '-' || p_indliq_p_ext || '-' || '-' ||
           p_indAcuerdoPago_2002 || '-' || p_indliq_p_local || '-' ||
           p_municipio_s || '-' || p_fcm_contravencional_s || '-' ||
           p_conces_contravencional_s || '-' || p_acuerdopago_s || '-' ||
           p_municipio_p || '-' || p_fcm_contravencional_p || '-' ||
           p_conces_contravencional_p || '-' || p_acuerdopago_p);

    commit;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_Novmunicipio] ' || SQLERRM, p_error);

  END i_Novmunicipio;

  PROCEDURE q_Novmunicipio(p_tiponov                  varchar2,
                           p_numeronov                varchar2,
                           p_usuario                  varchar2,
                           p_idmunicipio              out varchar2,
                           p_nit_m                    out varchar2,
                           p_nombre                   out varchar2,
                           p_idconcesionario          out varchar2,
                           p_correo                   out varchar2,
                           p_indretroactividad        out number,
                           p_indliq_s_ext             out number,
                           p_indliq_s_local           out number,
                           p_indliq_p_ext             out number,
                           p_indliq_p_local           out number,
                           p_indAcuerdoPago_2002      out number,
                           p_idbanco                  out varchar2,
                           p_tipocuenta               out varchar2,
                           p_cuenta                   out varchar2,
                           p_nit_cta                  out varchar2,
                           p_municipio_s              out number,
                           p_fcm_contravencional_s    out number,
                           p_conces_contravencional_s out number,
                           p_acuerdopago_s            out number,
                           p_municipio_p              out number,
                           p_fcm_contravencional_p    out number,
                           p_conces_contravencional_p out number,
                           p_acuerdopago_p            out number,
                           p_fechaact                 out date,
                           p_firma1                   out varchar2,
                           p_firma2                   out varchar2,
                           p_estadonov                out varchar2,
                           p_dnsAvvilas               out varchar2,
                           p_dnsGranbanco             out varchar2,
                           p_error                    OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_idmunicipio              := '';
    p_nit_m                    := '';
    p_nombre                   := '';
    p_idconcesionario          := '00';
    p_correo                   := '';
    p_indretroactividad        := 0;
    p_indliq_s_ext             := 0;
    p_indliq_s_local           := 0;
    p_indliq_p_ext             := 0;
    p_indliq_p_local           := 0;
    p_indAcuerdoPago_2002      := 0;
    p_idbanco                  := '00';
    p_tipocuenta               := '000';
    p_cuenta                   := '';
    p_nit_cta                  := '';
    p_municipio_s              := 0;
    p_fcm_contravencional_s    := 0;
    p_conces_contravencional_s := 0;
    p_acuerdopago_s            := 0;
    p_municipio_p              := 0;
    p_fcm_contravencional_p    := 0;
    p_conces_contravencional_p := 0;
    p_acuerdopago_p            := 0;
    p_fechaact                 := null;
    p_firma1                   := '';
    p_firma2                   := '';
    p_estadonov                := '';
    p_dnsAvvilas               := '';
    p_dnsGranbanco             := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               nit_m,
               nombre,
               idconcesionario,
               correo,
               indretroactividad,
               idbanco,
               tipocuenta,
               desencriptar(cuenta),
               nit_cta,
               indliq_s_ext,
               indliq_s_local,
               indliq_p_ext,
               indliq_p_local,
               indAcuerdoPago_2002,
               municipio_s,
               fcm_contravencional_s,
               conces_contravencional_s,
               acuerdopago_s,
               municipio_p,
               fcm_contravencional_p,
               conces_contravencional_p,
               acuerdopago_p,
               fechaact,
               firma1,
               firma2,
               estadonov,
               dnsAvvillas,
               dnsGranbanco
          into p_idmunicipio,
               p_nit_m,
               p_nombre,
               p_idconcesionario,
               p_correo,
               p_indretroactividad,
               p_idbanco,
               p_tipocuenta,
               p_cuenta,
               p_nit_cta,
               p_indliq_s_ext,
               p_indliq_s_local,
               p_indliq_p_ext,
               p_indliq_p_local,
               p_indacuerdopago_2002,
               p_municipio_s,
               p_fcm_contravencional_s,
               p_conces_contravencional_s,
               p_acuerdopago_s,
               p_municipio_p,
               p_fcm_contravencional_p,
               p_conces_contravencional_p,
               p_acuerdopago_p,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov,
               p_dnsAvvilas,
               p_dnsGranbanco
          from Novmunicipio
         where tiponov = p_tiponov
           and numeronov = to_number(p_numeronov);

        p_error := 'Consulta Exitosa';

        sp_log(p_usuario,
               'q_Novmunicipio',
               p_tiponov || '-' || p_numeronov || '-' || p_idmunicipio || '-' ||
               p_nit_m || '-' || p_nombre || '-' || p_idconcesionario || '-' ||
               p_correo || '-' || p_indretroactividad || '-' || p_idbanco || '-' ||
               p_tipocuenta || '-' || p_cuenta || '-' || p_nit_cta || '-' ||
               p_indliq_s_ext || '-' || p_indliq_s_local || '-' ||
               p_indliq_p_ext || '-' || '-' || p_indAcuerdoPago_2002 || '-' ||
               p_indliq_p_local || '-' || p_municipio_s || '-' ||
               p_fcm_contravencional_s || '-' || p_conces_contravencional_s || '-' ||
               p_acuerdopago_s || '-' || p_municipio_p || '-' ||
               p_fcm_contravencional_p || '-' || p_conces_contravencional_p || '-' ||
               p_acuerdopago_p || '-' || p_firma1 || '-' || p_firma2);

        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_Novmunicipio] ' || SQLERRM, p_error);
  END q_Novmunicipio;

  PROCEDURE q_NovmunicipioE(p_tiponov   varchar2,
                            p_numeronov number,
                            p_usuario   varchar2,
                            p_estadonov out varchar2,
                            p_error     OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from Novmunicipio
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

        sp_log(p_usuario, 'q_NovmunicipioE', p_estadonov);

        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovmunicipioE] ' || SQLERRM,
            p_error);
  END q_NovmunicipioE;

  PROCEDURE u_NovmunicipioEst(p_tiponov   varchar2,
                              p_numeronov varchar2,
                              p_usuario   varchar2,
                              p_estado    varchar2,
                              p_error     OUT VARCHAR2) is

    estado_act varchar2(100);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
          select TRIM(UPPER(estadonov))
            into estado_act
            from Novmunicipio
           where tiponov = p_tiponov
             and numeronov = to_number(p_numeronov);

          IF estado_act = p_estado THEN
            p_error := 'Novedad ya actualizada';
            return;
          END IF;

        IF p_estado = 'VALIDADA' THEN
          update Novmunicipio
             set estadonov  = p_estado,
                 usuarioval = p_usuario,
                 fechaval   = sysdate
           where tiponov = p_tiponov
             and numeronov = to_number(p_numeronov);
        ELSE
          IF p_estado = 'ANULADA' THEN
            update Novmunicipio
               set estadonov   = p_estado,
                   usuarioanul = p_usuario,
                   fechaanul   = sysdate
             where tiponov = p_tiponov
               and numeronov = to_number(p_numeronov);
          ELSE
            update Novmunicipio
               set estadonov = p_estado
             where tiponov = p_tiponov
               and numeronov =to_number(p_numeronov);
          END IF;
        END IF;

        IF p_estado = 'ANULADA' THEN
           insert into hist_vobo
              (idvobo, tipo, accion, usuario, fecha, referencia1, referencia2, referencia3, referencia4)
            values
              (seq_vobo.nextval, 'NOVEDAD MUNICIPIO', 'RECHAZADO', p_usuario, sysdate, p_tiponov || '-' || p_numeronov, p_estado, 0, 0);

        ELSE
            insert into hist_vobo
              (idvobo, tipo, accion, usuario, fecha, referencia1, referencia2, referencia3, referencia4)
            values
              (seq_vobo.nextval, 'NOVEDAD MUNICIPIO', 'APROBADO', p_usuario, sysdate, p_tiponov || '-' || p_numeronov, p_estado, 0, 0);
        END IF;

        commit;

        if (p_estado = 'VOBOFINANCIERA' ) THEN
          sp_envionotificacion(
                gruporecibe => 5,
                grupocopia => -1,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov || ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;

        if (p_estado = 'VOBOSIMIT' ) THEN
          sp_envionotificacion(
                gruporecibe => 6,
                grupocopia => -1,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha creado una novedad financiera de municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov|| ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;

         if (p_estado = 'VALIDADA' ) THEN
          sp_envionotificacion(
                gruporecibe => 7,
                grupocopia => -1,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha aprobado una novedad financiera de municipio. Por favor informar a banco novedad. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov || ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;

         if (p_estado = 'ANULADA' ) THEN
          sp_envionotificacion(
                gruporecibe => 3,
                grupocopia => -1,
                asunto => 'Notificación de ANULACION Novedad de Municipio:  ' || p_tiponov || '-' || p_numeronov,
                mensaje => 'Se ha ANULADO una novedad financiera de municipio. Por favor verificar informacion. NUMERO NOVEDAD ' || p_tiponov || '-' || p_numeronov || ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;


        p_error := 'Actualización Exitosa';

        sp_log(p_usuario,
               'u_NovmunicipioEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado );


        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO' || p_tiponov ||'-' || p_numeronov ;
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [u_NovmunicipioEst] ' || SQLERRM,
            p_error);
  END u_NovmunicipioEst;

  PROCEDURE u_Novmunicipio(p_idmunicipio              varchar2,
                           p_nit_m                    varchar2,
                           p_nombre                   varchar2,
                           p_idconcesionario          varchar2,
                           p_correo                   varchar2,
                           p_indretroactividad        number,
                           p_indliq_s_ext             number,
                           p_indliq_s_local           number,
                           p_indliq_p_ext             number,
                           p_indliq_p_local           number,
                           p_indAcuerdoPago_2002      number,
                           p_idbanco                  varchar2,
                           p_tipocuenta               varchar2,
                           p_cuenta                   varchar2,
                           p_nit_cta                  varchar2,
                           p_municipio_s              number,
                           p_fcm_contravencional_s    number,
                           p_conces_contravencional_s number,
                           p_acuerdopago_s            number,
                           p_municipio_p              number,
                           p_fcm_contravencional_p    number,
                           p_conces_contravencional_p number,
                           p_acuerdopago_p            number,
                           p_usuario                  varchar2,
                           p_fecha_act_ano            number,
                           p_fecha_act_mes            number,
                           p_fecha_act_dia            number,
                           p_firma1                   varchar2,
                           p_firma2                   varchar2,
                           p_dnsAvvillas              varchar2,
                           p_dnsDavivienda            varchar2,
                           p_error                    OUT VARCHAR2,
                           p_novedad                  OUT varchar2) AS

    w_fecha_act       date;
    numNovedad        number;
    m_dias_activacion number;
    min_fecha_act     date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    select mail
    into correo_usuario
    from person
    where idperson = TO_NUMBER(p_usuario);

    select substr(correo,0,100)
    into correo_fcm
    from fcm
    where nit_fcm = '8000826650';

    select count(*)
      INTO v_valida
      from departamento t
     where iddepartamento = substr(p_idmunicipio, 1, 2);

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    if (v_valida = 0) then
      p_error := 'Departamento no existe';
      return;
    end if;

    select COUNT(*)
      INTO v_valida
      from municipio t
     where idmunicipio = p_idmunicipio;

    select seq_novedad.Nextval into numNovedad from dual;

    IF v_valida = 0 THEN
      p_error := 'Municipio No existe';
      return;
    else
      select dias_activacion into m_dias_activacion from fcm;
      IF m_dias_activacion is null THEN
        p_error := 'Error en parametrización (días activación)';
        return;
      ELSE
        min_fecha_act := fn_fec_dispersion(sysdate,
                                           m_dias_activacion,
                                           0,
                                           '99999999');
        IF min_fecha_act > w_fecha_act then
          p_error := 'Fecha Activación Inválida';
          return;
        ELSE

          insert into novmunicipio
            (idmunicipio,
             nit_m,
             nombre,
             idconcesionario,
             correo,
             indretroactividad,
             idbanco,
             tipocuenta,
             cuenta,
             nit_cta,
             indliq_s_ext,
             indliq_s_local,
             indliq_p_ext,
             indliq_p_local,
             indAcuerdoPago_2002,
             iddepartamento,
             TIPONOV,
             NUMERONOV,
             FECHANOV,
             USUARIONOV,
             FECHAACT,
             ESTADONOV,
             FIRMA1,
             FIRMA2,
             municipio_s,
             fcm_contravencional_s,
             conces_contravencional_s,
             acuerdopago_s,
             municipio_p,
             fcm_contravencional_p,
             conces_contravencional_p,
             acuerdopago_p,
             dnsavvillas,
             dnsgranbanco)
          values
            (p_idmunicipio,
             p_nit_m,
             p_nombre,
             p_idconcesionario,
             p_correo,
             p_indretroactividad,
             p_idbanco,
             p_tipocuenta,
             encriptar(p_cuenta),
             p_nit_cta,
             p_indliq_s_ext,
             p_indliq_s_local,
             p_indliq_p_ext,
             p_indliq_p_local,
             p_indAcuerdoPago_2002,
             substr(p_idmunicipio, 1, 2),
             '02', -- NOVEDAD ADICION MUNICIPIO
             numNovedad,
             sysdate,
             p_usuario,
             w_fecha_act,
             'INGRESADA',
             p_firma1,
             p_firma2,
             p_municipio_s,
             p_fcm_contravencional_s,
             p_conces_contravencional_s,
             p_acuerdopago_s,
             p_municipio_p,
             p_fcm_contravencional_p,
             p_conces_contravencional_p,
             p_acuerdopago_p,
             p_dnsAvvillas,
             p_dnsDavivienda );

          p_error   := MSG_UPD_OK;
          p_novedad := '02-' || to_char(numNovedad, '0000000');
          sp_envionotificacion(gruporecibe => 3,
                grupocopia => 2,
                asunto => 'Notificación de Novedad de Municipio:  ' || p_novedad,
                mensaje => 'Se ha creado una novedad financiera de municipio. Por favor verificarla y dar su visto bueno. NUMERO NOVEDAD ' || p_novedad || ' . Muchas gracias',
                p_usuario => p_usuario);

          commit;
        END IF;
      END IF;
    END IF;

    sp_log(p_usuario,
           'u_Novmunicipio',
           p_idmunicipio || '-' || p_nit_m || '-' || p_nombre || '-' ||
           p_idconcesionario || '-' || p_correo || '-' ||
           p_indretroactividad || '-' || p_idbanco || '-' || p_tipocuenta || '-' ||
           p_cuenta || '-' || p_nit_cta || '-' || p_indliq_s_ext || '-' ||
           p_indliq_s_local || '-' || p_indliq_p_ext || '-' || '-' ||
           p_indAcuerdoPago_2002 || '-' || p_indliq_p_local || '-' ||
           p_municipio_s || '-' || p_fcm_contravencional_s || '-' ||
           p_conces_contravencional_s || '-' || p_acuerdopago_s || '-' ||
           p_municipio_p || '-' || p_fcm_contravencional_p || '-' ||
           p_conces_contravencional_p || '-' || p_acuerdopago_p);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_Novmunicipio] ' || SQLERRM, p_error);

  END u_Novmunicipio;

  PROCEDURE i_Novterceros(
                      p_idmunicipio char,
                      p_nit_t       char,
                      p_nombre      varchar2,
                      p_correoTercero varchar2,
                      p_idbanco     char,
                      p_tipocuenta  char,
                      p_cuenta      varchar2,
                      p_base_s      number,
                      p_base_p      number,
                      p_ind_base    number,
                      p_num_tercero number,
                      p_usuario     varchar2,
                      p_tiponov              varchar2,
                      p_fecha_act_ano        number,
                      p_fecha_act_mes        number,
                      p_fecha_act_dia        number,
                      p_firma1               varchar2,
                      p_firma2               varchar2,
                      p_dnsavvillas          varchar2,
                      p_dnsgranbanco         varchar2,
                      p_error                OUT VARCHAR2,
                      p_novedad              OUT varchar2)AS

    w_fecha_act date;
    numNovedad number;
    m_dias_activacion number;
    min_fecha_act date;

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
                   p_fecha_act_dia,
                   'YYYY-MM-DD')
      into w_fecha_act
      from DUAL;

    select dias_activacion
           into m_dias_activacion
           from fcm;
    IF m_dias_activacion is null THEN
       p_error := 'Error en parametrización (días activación)';
       return;
    ELSE
        min_fecha_act := fn_fec_dispersion(sysdate,m_dias_activacion,0,'99999999');
        IF min_fecha_act > w_fecha_act then
           p_error := 'Fecha Activación Inválida';
           return;
        ELSE
          select seq_novedad.Nextval
            into numNovedad
            from dual;

          insert into novtercero
              (idmunicipio,
               nit_t,
               nombre,
               correoTercero,
               idbanco,
               tipocuenta,
               cuenta,
               base_s,
               base_p,
               ind_base,
               num_tercero,
               tiponov,
               numeronov,
               fechanov,
               usuarionov,
               fechaact,
               firma1,
               firma2,
               estadonov,
               dnsavvillas,
               dnsgranbanco
               )
            values
              (p_idmunicipio,
               p_nit_t,
               p_nombre,
               p_correoTercero,
               p_idbanco,
               p_tipocuenta,
               encriptar(p_cuenta),
               p_base_s,
               p_base_p,
               p_ind_base,
               p_num_tercero,
               p_tiponov,
               numNovedad,
               sysdate,
               p_usuario,
               w_fecha_act,
               p_firma1,
               p_firma2,
               'INGRESADA',
               p_dnsavvillas,
               p_dnsgranbanco);

          p_error := MSG_INS_OK;
          p_novedad := p_tiponov || '-' || to_char(numNovedad, '0000000');

          sp_log(p_usuario,
                   'i_Novterceros',
                   p_idmunicipio || '-' || p_nit_t || '-' || p_nombre || '-' ||
                   p_idbanco || '-' || p_tipocuenta || '-' || p_cuenta || '-' ||
                   p_base_s || '-' || p_base_p || '-' || p_ind_base || '-' ||
                   p_num_tercero || '-' || p_tiponov|| '-' || w_fecha_act || '-' ||
                   p_firma1 || '-' || p_firma2);
          commit;

          sp_envionotificacion(
                gruporecibe => 4,
                grupocopia => -1,
                asunto => 'Notificación de Novedad Tercero:  ' || p_novedad,
                mensaje => 'Se ha creado una novedad financiera de Tercero. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' || p_novedad || ' . Muchas gracias',
                p_usuario => p_usuario);

        END IF;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [i_Novterceros] ' || SQLERRM, p_error);
END i_Novterceros;

PROCEDURE u_NovtercerosEst(
                        p_tiponov                  varchar2,
                        p_numeronov                number,
                        p_usuario                  varchar2,
                        p_estado                   varchar2,
                        p_error                    OUT VARCHAR2) is

   BEGIN

   -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
      IF p_estado = 'VALIDADA' THEN
         update  Novtercero
         set estadonov = p_estado,
         usuarioval = p_usuario,
         fechaval = sysdate
         where tiponov = p_tiponov and
               numeronov = p_numeronov;
      ELSE
          IF p_estado = 'ANULADA' THEN
             update  Novtercero
                     set estadonov = p_estado,
                     usuarioanul = p_usuario,
                     fechaanul = sysdate
                     where tiponov = p_tiponov and
                     numeronov = p_numeronov;
          ELSE
              update  Novtercero
                      set estadonov = p_estado
                      where tiponov = p_tiponov and
                      numeronov = p_numeronov;
          END IF;
      END IF;
         p_error := 'Actualización Exitosa';

        sp_log(p_usuario,
               'u_NovtercerosEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado);
        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_NovtercerosEst] ' || SQLERRM, p_error);
  END u_NovtercerosEst;

  PROCEDURE q_Novtercero(p_tiponov       varchar2,
                         p_numeronov     number,
                         p_usuario       varchar2,
                         p_idmunicipio   out varchar2,
                         p_nit_t         out varchar2,
                         p_nombre        out varchar2,
                         p_correoTercero out varchar2,
                         p_idbanco       out varchar2,
                         p_tipocuenta    out varchar2,
                         p_cuenta        out varchar2,
                         p_base_s        out number,
                         p_base_p        out number,
                         p_ind_base      out number,
                         p_num_tercero   out number,
                         p_fechaact      out date,
                         p_firma1        out varchar2,
                         p_firma2        out varchar2,
                         p_estadonov     out varchar2,
                         p_error         OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_nombre        := null;
    p_correoTercero := null;
    p_idbanco       := '00';
    p_tipocuenta    := '000';
    p_cuenta        := null;
    p_base_s        := 0;
    p_base_p        := 0;
    p_ind_base      := 1;
    p_nit_t         := null;
    p_fechaact      := null;
    p_firma1        := '';
    p_firma2        := '';
    p_estadonov     := '';


    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               nombre,
               correoTercero,
               idbanco,
               tipocuenta,
               desencriptar(cuenta),
               base_s,
               base_p,
               ind_base,
               num_tercero,
               nit_t,
               fechaact,
               firma1,
               firma2,
               estadonov

          into p_idmunicipio,
               p_nombre,
               p_correoTercero,
               p_idbanco,
               p_tipocuenta,
               p_cuenta,
               p_base_s,
               p_base_p,
               p_ind_base,
               p_num_tercero,
               p_nit_t,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov
          from novtercero
          where tiponov = p_tiponov and
                numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_Novtercero] ' || SQLERRM, p_error);
  END q_Novtercero;

  PROCEDURE q_NovterceroE(p_tiponov       varchar2,
                         p_numeronov     number,
                         p_usuario       varchar2,
                         p_estadonov     out varchar2,
                         p_error         OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov     := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from novtercero
          where tiponov = p_tiponov and
                numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_NovterceroE] ' || SQLERRM, p_error);
  END q_NovterceroE;

  PROCEDURE i_NovDiasDispersion(p_idmunicipio      char,
                              p_idbanco            char,
                              p_dias_dispersion_se number,
                              p_dias_dispersion_sl number,
                              p_dias_dispersion_pe number,
                              p_dias_dispersion_pl number,
                              p_frec_dispersion_se number,
                              p_frec_dispersion_sl number,
                              p_frec_dispersion_pe number,
                              p_frec_dispersion_pl number,
                              p_usuario            varchar2,
                              p_tiponov            varchar2,
                              p_fecha_act_ano      number,
                              p_fecha_act_mes      number,
                              p_fecha_act_dia      number,
                              p_firma1             varchar2,
                              p_firma2             varchar2,
                              p_nombre             varchar2,
                              p_dnsAvvillas        varchar2,
                              p_dnsGranbanco       varchar2,
                              p_error              OUT VARCHAR2,
                              p_novedad            OUT varchar2)
 AS
    w_fecha_act date;
    numNovedad number;
    m_dias_activacion number;
    min_fecha_act date;
    correo_usuario    varchar(100);
    correo_fcm        varchar(100);
    p_nom varchar2(250);

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    select mail
    into correo_usuario
    from person
    where idperson = TO_NUMBER(p_usuario);

    select substr(correo,0,100)
    into correo_fcm
    from fcm
    where nit_fcm = '8000826650';



    IF p_tiponov = '06' THEN
      select COUNT(*)
        INTO v_valida
        from dias_dispersion t
       where idmunicipio = p_idmunicipio
         and idbanco = p_idbanco;

      IF v_valida <> 0 THEN
        p_error := 'Dias Dispersion Ya existe ';
        return;
      END IF;
    ELSE
      select COUNT(*)
        INTO v_valida
        from dias_dispersion t
       where idmunicipio = p_idmunicipio
         and idbanco = p_idbanco;

      IF v_valida = 0 THEN
        p_error := 'Registro dias dispersion no existe';
        return;
      END IF;
    END IF;


    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
               p_fecha_act_dia,
               'YYYY-MM-DD')
       into w_fecha_act
       from DUAL;

    select dias_activacion
       into m_dias_activacion
       from fcm;
    IF m_dias_activacion is null THEN
       p_error := 'Error en parametrización (días activación)';
       return;
    ELSE
        min_fecha_act := fn_fec_dispersion(sysdate,m_dias_activacion,0,'99999999');
        IF min_fecha_act > w_fecha_act then
           p_error := 'Fecha Activación Inválida';
           return;
        ELSE
          select seq_novedad.Nextval
            into numNovedad
            from dual;

        select COUNT(*)
        INTO v_valida
        from municipio
       where idmunicipio = p_idmunicipio;

       if (v_valida > 0 ) then

          select nombre
          into p_nom
          from municipio
          where idmunicipio = p_idmunicipio;

       end if;

       if (v_valida = 0 ) then

          select max(nombre)
          into p_nom
          from novmunicipio
          where idmunicipio = p_idmunicipio;


       end if;


          insert into novdias_dispersion
            (idmunicipio,
             idbanco,
             dias_dispersion_sl,
             frec_dispersion_sl,
             dias_dispersion_pl,
             frec_dispersion_pl,
             dias_dispersion_se,
             frec_dispersion_se,
             dias_dispersion_pe,
             frec_dispersion_pe,
             tiponov,
             numeronov,
             fechanov,
             usuarionov,
             fechaact,
             firma1,
             firma2,
             estadonov,
             dnsavvillas,
             dnsgranbanco,
             nombre)
          values
            (p_idmunicipio,
             p_idbanco,
             p_dias_dispersion_sl,
             p_frec_dispersion_sl,
             p_dias_dispersion_pl,
             p_frec_dispersion_pl,
             p_dias_dispersion_se,
             p_frec_dispersion_se,
             p_dias_dispersion_pe,
             p_frec_dispersion_pe,
             p_tiponov,
             numNovedad,
             sysdate,
             p_usuario,
             w_fecha_act,
             p_firma1,
             p_firma2,
             'INGRESADA',
             p_dnsAvvillas,
             p_dnsGranbanco,
             p_nom);

       select COUNT(*)
        INTO v_valida
        from municipio
       where idmunicipio = p_idmunicipio;

       if (v_valida = 0 ) then

          insert into municipio
            (idmunicipio, nombre, iddepartamento)
          values
            (p_idmunicipio, p_nom, substr(p_idmunicipio,0,2) );
      end if;



          sp_log(p_usuario,
                 'i_NovDiasDispersion',
                 p_idmunicipio || '-' || p_idbanco || '-' ||
                 p_dias_dispersion_sl || '-' || p_frec_dispersion_sl || '-' ||
                 p_dias_dispersion_pl || '-' || p_frec_dispersion_pl || '-' ||
                 p_dias_dispersion_se || '-' || p_frec_dispersion_se || '-' ||
                 p_dias_dispersion_pe || '-' || p_frec_dispersion_pe || '-' ||
                 p_tiponov || '-' || numNovedad || '-' || p_usuario  || '-' ||
                 w_fecha_act  || '-' || p_firma1  || '-' || p_firma2);
          commit;

          p_error := MSG_INS_OK;
          p_novedad := p_tiponov || '-' || to_char(numNovedad, '0000000');

          sp_envionotificacion(
                gruporecibe => 4,
                grupocopia => -1,
                asunto => 'Notificación de Novedad Dias de Dispersion Municipio:  ' || p_novedad,
                mensaje => 'Se ha creado una novedad financiera de Dias de Dispersion Municipio. Por favor verificar y dar su visto bueno. NUMERO NOVEDAD ' || p_novedad || ' . Muchas gracias',
                p_usuario => p_usuario);


        END IF;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_NovDiasDispersion] ' || SQLERRM,
            p_error);

  END i_NovDiasDispersion;

  PROCEDURE q_NovDiasDispersion(p_tiponov            varchar2,
                                p_numeronov          number,
                                p_usuario            varchar2,
                                p_idmunicipio        out char,
                                p_idbanco            out char,
                                p_dias_dispersion_se out number,
                                p_dias_dispersion_sl out number,
                                p_dias_dispersion_pe out number,
                                p_dias_dispersion_pl out number,
                                p_frec_dispersion_se out number,
                                p_frec_dispersion_sl out number,
                                p_frec_dispersion_pe out number,
                                p_frec_dispersion_pl out number,
                                p_fechaact           out date,
                                p_firma1             out varchar2,
                                p_firma2             out varchar2,
                                p_estadonov          out varchar2,
                                p_error              OUT VARCHAR2) IS
  BEGIN

    -- INICIALIZAR SALIDA
    p_dias_dispersion_se := 0;
    p_dias_dispersion_sl := 0;
    p_dias_dispersion_pe := 0;
    p_dias_dispersion_pl := 0;

    p_frec_dispersion_se := 0;
    p_frec_dispersion_sl := 0;
    p_frec_dispersion_pe := 0;
    p_frec_dispersion_pl := 0;
    p_fechaact      := null;
    p_firma1        := '';
    p_firma2        := '';
    p_estadonov     := '';
    p_idmunicipio   := null;
    p_idbanco       := null;


    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               idbanco,
               dias_dispersion_sl,
               frec_dispersion_sl,
               dias_dispersion_pl,
               frec_dispersion_pl,
               dias_dispersion_se,
               frec_dispersion_se,
               dias_dispersion_pe,
               frec_dispersion_pe,
               fechaact,
               firma1,
               firma2,
               estadonov
          into p_idmunicipio,
               p_idbanco,
               p_dias_dispersion_sl,
               p_frec_dispersion_sl,
               p_dias_dispersion_pl,
               p_frec_dispersion_pl,
               p_dias_dispersion_se,
               p_frec_dispersion_se,
               p_dias_dispersion_pe,
               p_frec_dispersion_pe,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov
          from novdias_dispersion
          where tiponov = p_tiponov and
                numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';

      END;

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovDiasDispersion] ' || SQLERRM,
            p_error);

   END q_NovDiasDispersion;

   PROCEDURE q_NovDiasDispersionE(p_tiponov       varchar2,
                                 p_numeronov     number,
                                 p_usuario       varchar2,
                                 p_estadonov     out varchar2,
                                 p_error         OUT VARCHAR2)is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov     := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from novdias_dispersion
          where tiponov = p_tiponov and
                numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_NovDiasDispersionE] ' || SQLERRM, p_error);
  END q_NovDiasDispersionE;

  PROCEDURE u_NovDiasDispersionEst(
                        p_tiponov                  varchar2,
                        p_numeronov                number,
                        p_usuario                  varchar2,
                        p_estado                   varchar2,
                        p_error                    OUT VARCHAR2) is

   BEGIN

   -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
      IF p_estado = 'VALIDADA' THEN
         update  NovDias_Dispersion
         set estadonov = p_estado,
         usuarioval = p_usuario,
         fechaval = sysdate
         where tiponov = p_tiponov and
               numeronov = p_numeronov;
      ELSE
          IF p_estado = 'ANULADA' THEN
             update  NovDias_Dispersion
                     set estadonov = p_estado,
                     usuarioanul = p_usuario,
                     fechaanul = sysdate
                     where tiponov = p_tiponov and
                     numeronov = p_numeronov;
          ELSE
              update  NovDias_Dispersion
                      set estadonov = p_estado
                      where tiponov = p_tiponov and
                      numeronov = p_numeronov;
          END IF;
      END IF;
         p_error := 'Actualización Exitosa';

        sp_log(p_usuario,
               'u_NovDiasDispersionEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado);
        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_NovDiasDispersionEst] ' || SQLERRM, p_error);
  END u_NovDiasDispersionEst;

  PROCEDURE q_NovValidador_fecha(p_tiponov                  varchar2,
                                 p_numeronov                number,
                                 p_usuario                  varchar2,
                                 p_idmunicipio              out char,
                                 p_idvalidador              out char,
                                 p_indTipo                  out char,
                                 p_fecha_ini                out date,
                                 p_fecha_fin                out date,
                                 p_p_municipio              out number,
                                 p_p_fcm_contravencional    out number,
                                 p_p_conces_contravencional out number,
                                 p_p_acuerdopago            out number,
                                 p_nit_tercero1             out varchar2,
                                 p_base_tercero1            out number,
                                 p_ind_base_tercero1        out number,
                                 p_nit_tercero2             out varchar2,
                                 p_base_tercero2            out number,
                                 p_ind_base_tercero2        out number,
                                 p_fechaact                 out date,
                                 p_firma1                   out varchar2,
                                 p_firma2                   out varchar2,
                                 p_estadonov                out varchar2,
                                 p_error                    OUT VARCHAR2) is
  BEGIN

    -- INICIALIZAR SALIDA
    p_idmunicipio              := '';
    p_idvalidador              := '';
    p_indTipo                  := '';
    p_fecha_ini                := null;
    p_fecha_fin                := null;
    p_p_municipio              := 0;
    p_p_fcm_contravencional    := 0;
    p_p_conces_contravencional := 0;
    p_p_acuerdopago            := 0;
    p_nit_tercero1             := '';
    p_base_tercero1            := 0;
    p_ind_base_tercero1        := 1;
    p_nit_tercero2             := '';
    p_base_tercero2            := 0;
    p_ind_base_tercero2        := 1;

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select idmunicipio,
               idvalidador,
               indTipo,
               fecha_ini,
               fecha_fin,
               p_municipio,
               p_fcm_contravencional,
               p_conces_contravencional,
               p_acuerdopago,
               nit_tercero1,
               base_tercero1,
               ind_base_tercero1,
               nit_tercero2,
               base_tercero2,
               ind_base_tercero2,
               fechaact,
               firma1,
               firma2,
               estadonov
          into p_idmunicipio,
               p_idvalidador,
               p_indTipo,
               p_fecha_ini,
               p_fecha_fin,
               p_p_municipio,
               p_p_fcm_contravencional,
               p_p_conces_contravencional,
               p_p_acuerdopago,
               p_nit_tercero1,
               p_base_tercero1,
               p_ind_base_tercero1,
               p_nit_tercero2,
               p_base_tercero2,
               p_ind_base_tercero2,
               p_fechaact,
               p_firma1,
               p_firma2,
               p_estadonov
          from Novvalidador_fecha
         where tiponov = p_tiponov
           and numeronov = p_numeronov;

        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [q_NovValidador_fecha] ' || SQLERRM,
            p_error);
  END q_NovValidador_fecha;

  PROCEDURE i_NovValidador_fecha(p_idmunicipio           char,
                              p_idvalidador              char,
                              p_indTipo                  char,
                              p_fecha_ini_ano            number,
                              p_fecha_ini_mes            number,
                              p_fecha_ini_dia            number,
                              p_fecha_fin_ano            number,
                              p_fecha_fin_mes            number,
                              p_fecha_fin_dia            number,
                              p_p_municipio              number,
                              p_p_fcm_contravencional    number,
                              p_p_conces_contravencional number,
                              p_p_acuerdopago            number,
                              p_nit_tercero1             varchar2,
                              p_base_tercero1            number,
                              p_ind_base_tercero1        number,
                              p_nit_tercero2             varchar2,
                              p_base_tercero2            number,
                              p_ind_base_tercero2        number,
                              p_usuario                  varchar2,
                              p_tiponov                  varchar2,
                              p_fecha_act_ano            number,
                              p_fecha_act_mes            number,
                              p_fecha_act_dia            number,
                              p_firma1                   varchar2,
                              p_firma2                   varchar2,
                              p_error                    OUT VARCHAR2,
                              p_novedad                  OUT varchar2)AS

    w_fecha_ini validador_fecha.fecha_ini%TYPE;
    w_fecha_fin validador_fecha.fecha_ini%TYPE;
    w_operacion varchar2(250);
    w_fecha_act date;
    numNovedad number;
    m_dias_activacion number;
    min_fecha_act date;

  BEGIN

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    select TO_DATE(p_fecha_ini_ano || '-' || p_fecha_ini_mes || '-' ||
                   p_fecha_ini_dia,
                   'YYYY-MM-DD')
      into w_fecha_ini
      from DUAL;

    select TO_DATE(p_fecha_fin_ano || '-' || p_fecha_fin_mes || '-' ||
                   p_fecha_fin_dia,
                   'YYYY-MM-DD')
      into w_fecha_fin
      from DUAL;

    IF p_tiponov = '09' THEN
      Select COUNT(*)
        INTO v_valida
        from validador_fecha t
        where idMunicipio = p_idmunicipio
         and idValidador = p_idvalidador
         and indTipo = p_indTipo;
      IF v_valida <> 0 THEN
       p_error := 'Validador Ya existente. ';
       return;
      END IF;
    ELSE
      Select COUNT(*)
        INTO v_valida
        from validador_fecha t
        where idMunicipio = p_idmunicipio
         and idValidador = p_idvalidador
         and indTipo = p_indTipo;
      IF v_valida = 0 THEN
       p_error := 'Registro Validador No existe. ';
        return;
      END IF;
    END IF;

    select TO_DATE(p_fecha_act_ano || '-' || p_fecha_act_mes || '-' ||
               p_fecha_act_dia,
               'YYYY-MM-DD')
       into w_fecha_act
       from DUAL;

    select dias_activacion
       into m_dias_activacion
       from fcm;
    IF m_dias_activacion is null THEN
       p_error := 'Error en parametrización (días activación)';
       return;
    ELSE
        min_fecha_act := fn_fec_dispersion(sysdate,m_dias_activacion,0,'99999999');
        IF min_fecha_act > w_fecha_act then
           p_error := 'Fecha Activación Inválida';
           return;
        ELSE
          select seq_novedad.Nextval
            into numNovedad
            from dual;

          insert into Novvalidador_fecha
            (idmunicipio,
             idValidador,
             indTipo,
             fecha_ini,
             fecha_fin,
             p_municipio,
             p_fcm_contravencional,
             p_conces_contravencional,
             p_acuerdopago,
             nit_tercero1,
             base_tercero1,
             ind_base_tercero1,
             nit_tercero2,
             base_tercero2,
             ind_base_tercero2,
             tiponov,
             numeronov,
             fechanov,
             usuarionov,
             fechaact,
             firma1,
             firma2,
             estadonov)
          values
            (p_idmunicipio,
             p_idValidador,
             p_indTipo,
             w_fecha_ini,
             w_fecha_fin,
             p_p_municipio,
             p_p_fcm_contravencional,
             p_p_conces_contravencional,
             p_p_acuerdopago,
             p_nit_tercero1,
             p_base_tercero1,
             p_ind_base_tercero1,
             p_nit_tercero2,
             p_base_tercero2,
             p_ind_base_tercero2,
             p_tiponov,
             numNovedad,
             sysdate,
             p_usuario,
             w_fecha_act,
             p_firma1,
             p_firma2,
             'INGRESADA');

          w_operacion := 'i_NovValidador_fecha';

          p_error := MSG_INS_OK;

          p_novedad := p_tiponov || '-' || to_char(numNovedad, '0000000');

          sp_log(p_usuario,
                 w_operacion,
                 p_idmunicipio || '-' || p_idValidador || '-' || p_indTipo || '-' ||
                 p_fecha_ini_ano || '-' || p_fecha_ini_mes || '-' ||
                 p_fecha_ini_dia || '-' || p_fecha_fin_ano || '-' ||
                 p_fecha_fin_mes || '-' || p_fecha_fin_dia || '-' ||
                 p_p_municipio || '-' || p_p_fcm_contravencional || '-' ||
                 p_p_conces_contravencional || '-' || p_p_acuerdopago || '-' ||
                 p_nit_tercero1 || '-' || p_base_tercero1 || '-' ||
                 p_ind_base_tercero1 || '-' || p_nit_tercero2 || '-' ||
                 p_base_tercero2 || '-' || p_ind_base_tercero2);

          commit;
        END IF;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [i_NovValidador_fecha] ' || SQLERRM,
            p_error);

  END i_NovValidador_fecha;

  PROCEDURE q_NovValidador_fechaE(p_tiponov       varchar2,
                                 p_numeronov     number,
                                 p_usuario       varchar2,
                                 p_estadonov     out varchar2,
                                 p_error         OUT VARCHAR2)is
  BEGIN

    -- INICIALIZAR SALIDA
    p_estadonov     := '';

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
        select estadonov
          into p_estadonov
          from novvalidador_fecha
          where tiponov = p_tiponov and
                numeronov = p_numeronov;
        p_error := 'Consulta Exitosa';

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [q_NovValidador_fechaE] ' || SQLERRM, p_error);
  END q_NovValidador_fechaE;

  PROCEDURE u_NovValidador_fechaEst(
                        p_tiponov                  varchar2,
                        p_numeronov                number,
                        p_usuario                  varchar2,
                        p_estado                   varchar2,
                        p_error                    OUT VARCHAR2) is

   BEGIN

   -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error,'pk_proc');

    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      BEGIN
      IF p_estado = 'VALIDADA' THEN
         update  NovValidador_Fecha
         set estadonov = p_estado,
         usuarioval = p_usuario,
         fechaval = sysdate
         where tiponov = p_tiponov and
               numeronov = p_numeronov;
      ELSE
          IF p_estado = 'ANULADA' THEN
             update  NovValidador_Fecha
                     set estadonov = p_estado,
                     usuarioanul = p_usuario,
                     fechaanul = sysdate
                     where tiponov = p_tiponov and
                     numeronov = p_numeronov;
          ELSE
              update  NovValidador_Fecha
                      set estadonov = p_estado
                      where tiponov = p_tiponov and
                      numeronov = p_numeronov;
          END IF;
      END IF;
         p_error := 'Actualización Exitosa';

        sp_log(p_usuario,
               'u_NovValidador_fechaEst',
               p_tiponov || '-' || p_numeronov || '-' || p_estado);
        commit;

      EXCEPTION
        WHEN OTHERS THEN
          p_error := 'NO EXISTE REGISTRO';
      END;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [u_NovValidador_fechaEst] ' || SQLERRM, p_error);
  END u_NovValidador_fechaEst;

  -- Function and procedure implementations
  PROCEDURE aprobar_reproceso(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_tipo        varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    if p_tipo = 'E' then
      begin

        delete recaudo_externo_causacion
         where fec_corte_ini = w_fec_cor_ini;

        delete recaudo_externo_contabilidad
         where fechadoc = to_char(w_fec_cor_ini, 'yyyyMMdd');

        delete recaudo_externo_disp where fec_corte_ini = w_fec_cor_ini;

        delete recaudo_externo_liquidacion where fec_corte = w_fec_cor_ini;
      end;
    end if;

    if p_tipo = 'L' then
      begin

        delete recaudo_local_causacion where fec_corte_ini = w_fec_cor_ini;

        delete recaudo_local_disp where fec_corte = w_fec_cor_ini;

        delete recaudo_local_liquidacion where fec_corte = w_fec_cor_ini;

      end;
    end if;

    if p_tipo = 'T' then
      begin
        DELETE recaudo_externo_disp_tot
         where fec_dispersion = w_fec_cor_ini;
      end;
    end if;

    if p_tipo = 'B' then
      begin
        update recaudo_externo_disp_tot
           set enviadobanco = 0
         where fec_corte_ini = w_fec_cor_ini;
      end;
    end if;

    commit;

    p_error := 'Aprobacion Correcta';

    sp_log(p_usuario,
           'aprobar_reproceso',
           p_tipo || '-' || p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
           p_fec_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [aprobar_reproceso] ' || SQLERRM,
            p_error);

  end aprobar_reproceso;

  PROCEDURE l_recaudo_local(p_fec_ini_ano number,
                            p_fec_ini_mes number,
                            p_fec_ini_dia number,
                            p_fec_fin_ano number,
                            p_fec_fin_mes number,
                            p_fec_fin_dia number,
                            p_usuario     varchar2,
                            p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF P_ERROR is null THEN
      -- Si pasa todas las validaciones
      select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                     p_fec_ini_dia,
                     'YYYY-MM-DD')
        into w_fec_cor_ini
        from DUAL;

      select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                     p_fec_fin_dia,
                     'YYYY-MM-DD')
        into w_fec_cor_fin
        from DUAL;

      -- obtiene cantidad de registros actualizados
      select count(*)
        into w_registros
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      /*      IF w_registros > 0 THEN
              p_error := 'PROCESO NO EJECUTADO. PROCESO YA LIQUIDADO. SOLICITAR AUTORIZACION';
              RETURN;
            END IF;
      */
      sp_liquida_recaudo_local(w_fec_cor_ini,
                               w_fec_cor_fin,
                               p_usuario,
                               p_error);

    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [l_recaudo_local] ' || SQLERRM,
            p_error);
  END l_recaudo_local;

  procedure sp_liquida_recaudo_local(p_fec_ini date,
                                     p_fec_fin date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) is
    dd dias_dispersion%rowtype;

    w_registros   number;
    w_idmunicipio char(8);
    w_idbanco     char(2);

  BEGIN

    delete recaudo_local_liquidacion
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;

    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado)
      select seq_recaudo_local_liquidacion.Nextval,
             idbanco,
             cta_recaudo,
             indtipo,
             fec_corte,
             fec_tran,
             oficina_origen,
             valor_efectivo,
             valor_cheque,
             valor_total,
             nit_m,
             idmunicipio,
             Substr(idmunicipio, 1, 2),
             'REC',
             p_consignado
        from recaudo_local
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin;

    insert into recaudo_local_liquidacion
      (idrecaudo_local_liquidacion,
       idbanco,
       cta_recaudo,
       indtipo,
       fec_corte,
       fec_tran,
       oficina_origen,
       valor_efectivo,
       valor_cheque,
       valor_total,
       nit_m,
       idmunicipio,
       iddepartamento,
       indorigen,
       p_consignado)
      select SEQ_RECAUDO_LOCAL_LIQUIDACION.Nextval,
             idbanco,
             cta_recaudo,
             indtipo,
             fec_corte,
             fec_tran,
             null, --oficina_origen
             valor_total, --valor_efectivo
             0, --valor_cheque
             valor_total,
             null, --nit_m
             idmunicipio,
             Substr(idmunicipio, 1, 2),
             'AJU',
             p_consignado
        from recaudo_local_ajustes
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin;

    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) =
           (select m.idconcesionario, m.indliq_s_local
              from municipio m
             where m.idmunicipio = l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT';

    update recaudo_local_liquidacion l
       set (l.idconcesionario, l.ind_proceso) =
           (select m.idconcesionario, m.indliq_p_local

              from municipio m
             where m.idmunicipio = l.idmunicipio)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA';
    /* Se elimina porq no se requiere esta validacion para reacaudo local 09/12/15 20:00*/
    -- verifica que todos los municipios esten parametrizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where idconcesionario is null
       and fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin;

    IF w_registros > 0 THEN
      select idmunicipio
        into w_idMunicipio
        from recaudo_local_liquidacion
       where idconcesionario is null
         and fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN PARAMETRIZAR: ' ||
                 w_idMunicipio;
      RETURN;
    END IF;
    /**/
    update recaudo_local_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) =
           (select dd.dias_dispersion_sl, dd.frec_dispersion_sl
              from dias_dispersion dd
             where dd.idmunicipio = l.idmunicipio
               and dd.idbanco = l.idbanco)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'SIMIT'
       and ind_proceso = 1;

    update recaudo_local_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) =
           (select dd.dias_dispersion_pl, dd.frec_dispersion_pl
              from dias_dispersion dd
             where dd.idmunicipio = l.idmunicipio
               and dd.idbanco = l.idbanco)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and l.indtipo = 'POLCA'
       and ind_proceso = 1;

    -- verifica que todos los municipios tengas fechas de dispersion
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where dias_dispersion is null
       and fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select idmunicipio, idbanco
        into w_idMunicipio, w_idbanco
        from recaudo_local_liquidacion
       where dias_dispersion is null
         and fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin
         and ind_proceso = 1
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN DIAS DISPERSION: ' ||
                 w_idMunicipio || ' BANCO: ' || w_idbanco;
      RETURN;
    END IF;

    update recaudo_local_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion(l.fec_corte,
                                                l.dias_dispersion,
                                                l.frec_dispersion,
                                                p_usuario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    update recaudo_local_liquidacion l
       set l.s_valor_0 =
           (select c.comision_recaudo * (1 + (fcm.iva / 100))
              from cta_recaudo_fcm c, fcm
             where l.idbanco = c.idbanco
               and l.cta_recaudo = c.cuenta)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    -- SIMIT

    update recaudo_local_liquidacion l
       set (l.s_valor_1, l.s_valor_2, l.s_valor_3, l.s_valor_4, l.s_valor_5) =
           (select l.valor_total * (p.simit_s / 10),
                   l.valor_total * (p.concesionario_s / 10),
                   l.valor_total * (p.fondo_cob_concesionario_s / 10),
                   l.valor_total * (p.fondo_cob_simit_s / 10),
                   l.valor_total * (p.equilibrio_economico_s / 10)
              from p_dispersion_concesionario p
             where l.idconcesionario = p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT';

    -- redondear a dos decimales todos los calculos
    update recaudo_local_liquidacion l
       set l.s_valor_0 = ROUND(l.s_valor_0, 2),
           l.s_valor_1 = ROUND(l.s_valor_1, 2),
           l.s_valor_2 = ROUND(l.s_valor_2, 2),
           l.s_valor_3 = ROUND(l.s_valor_3, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT';

    -- ajustar decimales
    update recaudo_local_liquidacion l
       set l.s_valor_4 = l.valor_total - l.s_valor_1 - l.s_valor_2 -
                         l.s_valor_3
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 = 0;

    update recaudo_local_liquidacion l
       set l.s_valor_5 = l.valor_total - l.s_valor_1 - l.s_valor_2 -
                         l.s_valor_3
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT'
       and l.s_valor_5 <> 0;

    -- calcular netos
    update recaudo_local_liquidacion l
       set l.s_valor_6 = l.s_valor_2 - l.s_valor_0
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'SIMIT';

    -- POLCA
    update recaudo_local_liquidacion l
       set (l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11,
            l.p_valor_12,
            l.p_valor_13,
            l.p_valor_14,
            l.p_valor_15,
            l.p_valor_16,
            l.p_valor_17,
            l.p_valor_18) =
           (select l.valor_total * (p.simit_pm / 55),
                   l.valor_total * (p.concesionario_pm / 55),
                   l.valor_total * (p.fondo_cob_concesionario_pm / 55),
                   l.valor_total * (p.fondo_cob_simit_pm / 55),
                   l.valor_total * (p.equilibrio_economico_pm / 55),
                   l.valor_total * (p.simit_pp / 55),
                   l.valor_total * (p.sevial_pp / 55),
                   l.valor_total * (p.equilibrio_economico_pp / 55),
                   l.valor_total * (p.polca_cp / 55),
                   l.valor_total * (p.fcm_cp / 55),
                   l.valor_total * (p.sevial_cp / 55),
                   l.valor_total * (p.equilibrio_economico_cp / 55)

              from p_dispersion_concesionario p, fcm
             where l.idconcesionario = p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    -- ajusta municipios que solo consignan el 10%
    update recaudo_local_liquidacion l
       set (l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11,
            l.p_valor_12,
            l.p_valor_13,
            l.p_valor_14,
            l.p_valor_15,
            l.p_valor_16,
            l.p_valor_17,
            l.p_valor_18) =
           (select l.valor_total * (p.simit_pm / 10),
                   l.valor_total * (p.concesionario_pm / 10),
                   l.valor_total * (p.fondo_cob_concesionario_pm / 10),
                   l.valor_total * (p.fondo_cob_simit_pm / 10),
                   l.valor_total * (p.equilibrio_economico_pm / 10),
                   l.valor_total * (p.simit_pp / 10),
                   l.valor_total * (p.sevial_pp / 10),
                   l.valor_total * (p.equilibrio_economico_pp / 10),
                   0.0, --l.valor_total * (p.polca_cp / 55),
                   0.0, -- l.valor_total *(p.fcm_cp / 55),
                   0.0, -- l.valor_total *(p.sevial_cp / 55),
                   0.0 --l.valor_total * (p.equilibrio_economico_cp / 55)
              from p_dispersion_concesionario p, fcm
             where l.idconcesionario = p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and p_consignado = 10
       and l.indtipo = 'POLCA';

    -- ajusta municipios que solo consignan el 45%
    update recaudo_local_liquidacion l
       set (l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11,
            l.p_valor_12,
            l.p_valor_13,
            l.p_valor_14,
            l.p_valor_15,
            l.p_valor_16,
            l.p_valor_17,
            l.p_valor_18) =
           (select 0.0, -- l.valor_total * (p.simit_pm / 10),
                   0.0, -- l.valor_total *(p.concesionario_pm / 10) ,
                   0.0, -- l.valor_total *(p.fondo_cob_concesionario_pm / 10),
                   0.0, -- l.valor_total *(p.fondo_cob_simit_pm / 10),
                   0.0, -- l.valor_total *(p.equilibrio_economico_pm / 10),
                   0.0, -- l.valor_total * (p.simit_pp / 10),
                   0.0, -- l.valor_total *(p.sevial_pp / 10),
                   0.0, -- l.valor_total * (p.equilibrio_economico_pp / 10),
                   l.valor_total * (p.polca_cp / 45),
                   l.valor_total * (p.fcm_cp / 45),
                   l.valor_total * (p.sevial_cp / 45),
                   l.valor_total * (p.equilibrio_economico_cp / 45)
              from p_dispersion_concesionario p, fcm
             where l.idconcesionario = p.idconcesionario)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and p_consignado = 45
       and l.indtipo = 'POLCA';

    -- redondear a dos decimales todos los calculos
    update recaudo_local_liquidacion l
       set l.p_valor_7  = ROUND(l.p_valor_7, 2),
           l.p_valor_8  = ROUND(l.p_valor_8, 2),
           l.p_valor_9  = ROUND(l.p_valor_9, 2),
           l.p_valor_10 = ROUND(l.p_valor_10, 2),
           l.p_valor_11 = ROUND(l.p_valor_11, 2),
           l.p_valor_12 = ROUND(l.p_valor_12, 2),
           l.p_valor_13 = ROUND(l.p_valor_13, 2),
           l.p_valor_14 = ROUND(l.p_valor_14, 2),
           l.p_valor_15 = ROUND(l.p_valor_15, 2),
           l.p_valor_16 = ROUND(l.p_valor_16, 2),
           l.p_valor_17 = ROUND(l.p_valor_17, 2),
           l.p_valor_18 = ROUND(l.p_valor_18, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_7 - l.p_valor_8 -
                         l.p_valor_10 - l.p_valor_11 - l.p_valor_12 -
                         l.p_valor_13 - l.p_valor_14 - l.p_valor_15 -
                         l.p_valor_16 - l.p_valor_17 - l.p_valor_18
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set l.p_valor_10 = ROUND((l.p_valor_9 + l.p_valor_10) / 2, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_7 - l.p_valor_8 -
                         l.p_valor_10 - l.p_valor_11 - l.p_valor_12 -
                         l.p_valor_13 - l.p_valor_14 - l.p_valor_15 -
                         l.p_valor_16 - l.p_valor_17 - l.p_valor_18
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set (l.p_valor_19,
            l.p_valor_20,
            l.p_valor_21,
            l.p_valor_22,
            l.p_valor_23) =
           (select l.p_valor_16 * (fcm.iva / 100),
                   l.p_valor_17 * (fcm.iva / 100),
                   l.p_valor_17 * (fcm.retencion_fuente / 100),
                   l.p_valor_17 * (fcm.impuesto_timbre_tercero / 100),
                   (l.p_valor_16 + l.p_valor_17 + l.p_valor_18) *
                   (fcm.impuesto_timbre_fcm / 100)
              from fcm)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    -- caluclar netos
    update recaudo_local_liquidacion l
       set l.p_valor_24 = l.p_valor_13 + l.p_valor_17 + l.p_valor_20 -
                          l.p_valor_21 - l.p_valor_22,
           l.p_valor_25 = l.p_valor_8 - l.s_valor_0,
           l.p_valor_26 = l.p_valor_16 + l.p_valor_19 + l.p_valor_21 +
                          l.p_valor_22,
           l.p_valor_27 = l.p_valor_7 + l.p_valor_12,
           l.p_valor_28 = l.p_valor_11 + l.p_valor_14 + l.p_valor_18,
           l.p_valor_15 = l.p_valor_15 - l.p_valor_19 - l.p_valor_20
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set l.p_valor_19 = ROUND(l.p_valor_19, 2),
           l.p_valor_20 = ROUND(l.p_valor_20, 2),
           l.p_valor_21 = ROUND(l.p_valor_21, 2),
           l.p_valor_22 = ROUND(l.p_valor_22, 2),
           l.p_valor_23 = ROUND(l.p_valor_23, 2),
           l.p_valor_24 = ROUND(l.p_valor_24, 2),
           l.p_valor_25 = ROUND(l.p_valor_25, 2),
           l.p_valor_26 = ROUND(l.p_valor_26, 2),
           l.p_valor_27 = ROUND(l.p_valor_27, 2),
           l.p_valor_28 = ROUND(l.p_valor_28, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_27 - l.p_valor_10 -
                         l.p_valor_25 - l.p_valor_13 - l.p_valor_17 -
                         l.p_valor_20 - l.p_valor_16 - l.p_valor_19 -
                         l.p_valor_15
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set l.p_valor_10 = ROUND((l.p_valor_9 + l.p_valor_10) / 2, 2)
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    update recaudo_local_liquidacion l
       set l.p_valor_9 = l.valor_total - l.p_valor_27 - l.p_valor_10 -
                         l.p_valor_25 - l.p_valor_13 - l.p_valor_17 -
                         l.p_valor_20 - l.p_valor_16 - l.p_valor_19 -
                         l.p_valor_15
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and l.indtipo = 'POLCA';

    -- actualizar diferencias en el Fon Cobertura de 0.02 para ajustar
    update recaudo_local_liquidacion l
       set l.s_valor_3 = l.s_valor_3 - 0.01,
           l.s_valor_4 = l.s_valor_4 + 0.01
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1
       and (l.s_valor_3 - l.s_valor_4) = 0.02;

    -- actualizar datos del proceso
    update recaudo_local_liquidacion l
       set l.fecha_proceso = sysdate, l.usuario_proceso = p_usuario
     where fec_corte >= p_fec_ini
       and fec_corte <= p_fec_fin
       and ind_proceso = 1;

    commit;

    IF p_error IS NULL THEN

      -- obtiene cantidad de registros actualizados
      select count(*)
        into w_registros
        from recaudo_local_liquidacion
       where fec_corte >= p_fec_ini
         and fec_corte <= p_fec_fin;

      p_error := 'OK ' || w_registros;

    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [sp_liquida_recaudo_local] ' || SQLERRM,
            p_error);
  end sp_liquida_recaudo_local;

  PROCEDURE carga_recaudo_externo(p_feccor_ini_ano number,
                                  p_feccor_ini_mes number,
                                  p_feccor_ini_dia number,
                                  p_feccor_fin_ano number,
                                  p_feccor_fin_mes number,
                                  p_feccor_fin_dia number,
                                  p_usuario        varchar2,
                                  p_error          OUT VARCHAR2) AS

    w_fec_cor_ini     recaudo_externo.fec_corte%TYPE;
    w_fec_cor_fin     recaudo_externo.fec_corte%TYPE;
    w_fecha           recaudo_externo.fec_corte%TYPE;
    w_registros       number;
    w_num_liquidacion recaudo_externo.Num_Liquidacion%TYPE;

  BEGIN

    -- pendiente validador fecha, indfecha2002, cruce de informacion
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');
    IF NOT P_ERROR is null THEN
      RETURN;
    END IF;

    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_feccor_fin_ano || '-' || p_feccor_fin_mes || '-' ||
                   p_feccor_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    -- Cambio: Abril/30
    -- Validar proceso de liquidacion antes de cargar nuevamente

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA LIQUIDADO. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;

    -- elimina liquidaciones y cargues anteriores
    delete recaudo_externo_liquidacion
     where id_recaudo_externo in
           (select id_recaudo_externo
              from recaudo_externo
             where fec_corte >= w_fec_cor_ini
               and fec_corte <= w_fec_cor_fin);

    delete recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    commit; 
    -- inserta recaudo externo cargado por simit
    insert into recaudo_externo
      (id_recaudo_externo,
       idbanco,
       cta_recaudo,
       fec_corte,
       fec_tran,
       valor_efectivo,
       valor_cheque,
       valor_total,
       num_liquidacion,
       identificacion,
       idmunicipio,
       valor_adicional,
       iddepartamento,
       validador_fecha,
       indfecha2002)
      SELECT SEQ_RECAUDO_EXTERNO.NEXTVAL,
             SUBSTR(b.cod_banco, 1, 2) cod_banco,
             SUBSTR(b.cuenta, 1, 12) cuenta,
             trunc(a.fecha_contable),
             trunc(a.fecha_transaccion),
             a.total_recaudo,
             0,
             a.total_recaudo,
             SUBSTR(a.numero_referencia, 1, 10) numero_referencia,
             a.identificacion,
             SUBSTR(a.id_secretaria_origen, 1, 8) id_secretaria_origen,
             a.valor_adicional,
             SUBSTR(a.id_secretaria_origen, 1, 2) iddepartamento,
             SUBSTR(a.validador_fecha, 1, 3),
             a.indicador_fecha
        FROM quipux.simit_recaudo_detalle a, quipux.simit_recaudo b
       where a.id_procedencia_pago = '2'
         and a.consecutivo_recaudo = b.consecutivo_recaudo
         and b.cod_banco in (50, 52)
         and a.fecha_contable >= w_fec_cor_ini
         and a.fecha_contable <= w_fec_cor_fin;
    w_registros := SQL%ROWCOUNT;

    insert into recaudo_externo
      (id_recaudo_externo,
       idbanco,
       cta_recaudo,
       fec_corte,
       fec_tran,
       valor_efectivo,
       valor_cheque,
       valor_total,
       num_liquidacion,
       identificacion,
       idmunicipio,
       valor_adicional,
       iddepartamento,
       validador_fecha,
       indfecha2002)
      SELECT SEQ_RECAUDO_EXTERNO.NEXTVAL,
             SUBSTR(b.cod_banco, 1, 2) cod_banco,
             SUBSTR(b.cuenta, 1, 12) cuenta,
             trunc(c.fecha_carga),
             trunc(a.fecha_transaccion),
             a.total_recaudo,
             0,
             a.total_recaudo,
             SUBSTR(a.numero_referencia, 1, 10) numero_referencia,
             a.identificacion,
             SUBSTR(a.id_secretaria_origen, 1, 8) id_secretaria_origen,
             a.valor_adicional,
             SUBSTR(a.id_secretaria_origen, 1, 2) iddepartamento,
             SUBSTR(a.validador_fecha, 1, 3),
             a.indicador_fecha
        FROM quipux.simit_recaudo_detalle   a,
             quipux.simit_recaudo           b,
             quipux.simit_carga_informacion c
       where a.id_procedencia_pago = '2'
         and a.consecutivo_recaudo = b.consecutivo_recaudo
         and b.cod_banco not in (50, 52)
         and b.id_proceso_carga = c.id_proceso_carga
         and c.id_tipo_archivo in (4, 8)
         and trunc(c.fecha_carga) >= w_fec_cor_ini
         and trunc(c.fecha_carga) <= w_fec_cor_fin;
    w_registros := SQL%ROWCOUNT;

    commit;

    select count(*)
      into w_registros
      from recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and valor_total < valor_adicional;

    IF w_registros > 0 THEN

      select num_liquidacion
        into w_num_liquidacion
        from recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and valor_total < valor_adicional
         and rownum = 1;

      p_error := 'PROCESO NO EJECUTADO. LIQUIDACION ERRADA VTOTAL < VADICIONAL: ' ||
                 w_num_liquidacion;

      delete recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      return;

    END IF;

    -- INICIO Ajuste Hugo C 10/10/13

    SELECT COUNT(*)
      INTO w_registros
      FROM (select NUM_LIQUIDACION
              from recaudo_externo
             where fec_corte >= w_fec_cor_ini
               and fec_corte <= w_fec_cor_fin
             GROUP BY NUM_LIQUIDACION
            HAVING count(*) > 1);

    IF w_registros > 0 THEN

      SELECT NUM_LIQUIDACION
        INTO w_num_liquidacion
        FROM (select NUM_LIQUIDACION
                from recaudo_externo
               where fec_corte >= w_fec_cor_ini
                 and fec_corte <= w_fec_cor_fin
               GROUP BY NUM_LIQUIDACION
              HAVING count(*) > 1)
       WHERE ROWNUM = 1;

      p_error := 'PROCESO NO EJECUTADO.LIQUIDACION DUPLICADA EN SIMIT: ' ||
                 w_num_liquidacion;

      delete recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      return;

    END IF;

    -- FIN Ajuste Hugo C 10/10/13

    -- actualiza cuenta de avvillas para completar datoñ  update recaudo_externo

    update recaudo_externo
       set cta_recaudo = '0' || cta_recaudo
     where substr(cta_recaudo, 1, 2) = '86'
       and fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- actualiza cuenta de bancafe para completar dato
    /*    update recaudo_externo
          set cta_recaudo = '00' || cta_recaudo
        where substr(cta_recaudo, 1, 2) = '18'
          and fec_corte >= w_fec_cor_ini
          and fec_corte <= w_fec_cor_fin;
    */

    -- actualiza banco basado en la cuenta de recaudo
    update recaudo_externo r
       set r.idbanco =
           (select max(c.idbanco)
              from cta_recaudo_concesionario c
             where c.cuenta = r.cta_recaudo)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- actualizar fecha de corte avvillas cuando es fin de mes sab, dom o festivo a d
    -- dia habil anterior
    /*
        update recaudo_externo
        set fec_corte = fn_fec_dispersion(fec_corte,-1,0,p_usuario)
        where idBanco = '52'
           and fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and fec_corte <> fn_fec_dispersion(fec_corte,0,0,p_usuario);
    */

    -- actualiza validador si esta vacio
    update recaudo_externo
       set validador_fecha = '000'
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and validador_fecha is null;

    -- actualiza validador si esta vacio
    update recaudo_externo
       set indfecha2002 = '0'
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indfecha2002 is null;

    -- actualiza datos basado en el comparendo
    /*    update recaudo_externo l
       set (l.fec_comparendo, l.tipo_identificacion, l.nombre_infractor, l.apellido_infractor, l.num_comparendo) = (select c.fecha             fec_comparendo,
                                                                                                                           c.id_tipo_documento tipo_identificacion,
                                                                                                                           c.nombre            nombre_infractor,
                                                                                                                           c.apellido          apellido_infractor,
                                                                                                                           c.orden_comparendo  num_comparendo

                                                                                                                      from quipux.simit_det_liquida_comparendo a,
                                                                                                                           quipux.simit_comparendo             c
                                                                                                                     where a.cod_liquidacion =
                                                                                                                           substr(l.num_liquidacion,1,9)
                                                                                                                       and a.orden_comparendo =
                                                                                                                           c.orden_comparendo
                                                                                                                       and c.id_secretaria =
                                                                                                                           l.idmunicipio
                                                                                                                       and c.documento_identidad =
                                                                                                                           l.identificacion
                                                                                                                       and a.id_tipo_documento = c.id_tipo_documento   )

     where l.fec_corte >= w_fec_cor_ini
       and l.fec_corte <= w_fec_cor_fin;


    -- actualiza datos basado en la resolucion

       update recaudo_externo l
          set (l.num_resolucion, l.fec_resolucion, l.tipo_identificacion, l.nombre_infractor, l.apellido_infractor, l.fec_comparendo, l.num_comparendo) = (select c.nro_resolucion   num_resolucion,
                                                                                                                                                                  c.fecha_resolucion fec_resolucion,
                                                                                                                                                                  c.id_tipo_doc      tipo_identificacion,
                                                                                                                                                                  c.nombres          nombre_infractor,
                                                                                                                                                                  c.apellidos        apellido_infractor,
                                                                                                                                                                  c.fecha_comparendo fec_comparendo,
                                                                                                                                                                  c.nro_comparendo   num_comparendo
                                                                                                                                                             from quipux.simit_detalle_liquida b,
                                                                                                                                                                  quipux.simit_resolucion      c
                                                                                                                                                            where l.num_liquidacion =
                                                                                                                                                                  b.cod_liquidacion
                                                                                                                                                              and b.consecutivo_cartera =
                                                                                                                                                                  c.consecutivo_cartera

                                                                                                                                                           )
        where l.fec_corte >= w_fec_cor_ini
          and l.fec_corte <= w_fec_cor_fin;
    */

    w_fecha := w_fec_cor_ini;
    while (w_fecha <= w_fec_cor_fin) loop
      sp_paralelo_temp(p_fecha => w_fecha);
      w_fecha := w_fecha + 1;
    end loop;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;
    commit;

    p_error := 'Recaudo Externo Cargado exitosamente. Registros: ' ||
               w_registros;

    sp_log(p_usuario,
           'Carga Recaudo Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia || '-' || p_feccor_fin_ano || '-' ||
           p_feccor_fin_mes || '-' || p_feccor_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [carga_recaudo_externo] ' || SQLERRM,
            p_error);

  END carga_recaudo_externo;

  PROCEDURE transferir_recaudo_externo(p_fec_ini_ano number,
                                       p_fec_ini_mes number,
                                       p_fec_ini_dia number,
                                       p_usuario     varchar2,
                                       p_error       OUT VARCHAR2) as

    w_fec_trf_ini date;
    w_registros   number;
    p_ajuste      number;

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_trf_ini
      from DUAL;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion = w_fec_trf_ini;

    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA TRANSFERIDO. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;

    insert into recaudo_externo_disp_tot
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       des_idbanco,
       des_tipocuenta,
       des_cuenta,
       des_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       valor,
       id_concesionario_pro,
       idmunicipio)
      select w_fec_trf_ini,
             w_fec_trf_ini,
             w_fec_trf_ini,
             id_concesionario_liq,
             orden,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             des_cuenta,
             des_nit,
             indtipo,
             p_usuario,
             sysdate,
             sum(valor),
             id_concesionario_pro,
             idmunicipio
        from recaudo_externo_disp
       where fec_dispersion = w_fec_trf_ini
       group by fec_dispersion,
                id_concesionario_liq,
                orden,
                concepto,
                ori_idbanco,
                ori_tipocuenta,
                ori_cuenta,
                ori_nit,
                des_idbanco,
                des_tipocuenta,
                des_cuenta,
                des_nit,
                indtipo,
                id_concesionario_pro,
                idmunicipio;

    update recaudo_externo_disp_tot
       set referenciatrf = seq_transferencia.nextval
     where fec_corte_ini = w_fec_trf_ini;

    update recaudo_externo_disp_tot
       set enviadobanco = 0
     where fec_corte_ini = w_fec_trf_ini;

    commit;

    contabiliza_pago_externo(p_fec_ini_ano,
                             p_fec_ini_mes,
                             p_fec_ini_dia,
                             p_usuario,
                             p_error);

    IF not P_ERROR is null THEN
      delete recaudo_externo_disp_tot where fec_dispersion = w_fec_trf_ini;
      commit;

      return;
    END IF;

    select max(importe)
      into p_ajuste
      from recaudo_externo_contabilidad
     where textocabezera2 = 'AJUSTE PESOS'
       and fechadoc = to_char(w_fec_trf_ini, 'ddMMyyyy')
       and tipocontable = 'PAG';

    -- obtiene cantidad de registros procesados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion = w_fec_trf_ini;

    p_error := 'Transferencia genrada OK. Registros: ' || w_registros;

    if (p_ajuste > 1000) then
      p_error := 'Recuado Externo Liquidado OK. POSIBLE ERROR DE CONTABILIDAD. FAVOR VERIFICAR.Registros: ' ||
                 w_registros;
    end if;

    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Proceso de transferencia del dia ' ||
                                        to_char(w_fec_trf_ini, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que se ha ejecutado el proceso de transferencia, del dia ' ||
                                        to_char(w_fec_trf_ini, 'yyyy-MM-dd') ||
                                        '. Favor verificar y dar su visto bueno. Se genero el siguiente mensaje en el proceso de transferencia ' ||
                                        p_error,
                         p_usuario   => p_usuario);

    sp_log(p_usuario,
           'transferir_recaudo_externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [transferir_recaudo_externo] ' || SQLERRM,
            p_error);

  END transferir_recaudo_externo;

  PROCEDURE liquida_recaudo_externo(p_feccor_ini_ano number,
                                    p_feccor_ini_mes number,
                                    p_feccor_ini_dia number,
                                    p_usuario        varchar2,
                                    p_error          OUT VARCHAR2) AS

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    w_registros   number;
    w_registros1  number;

    w_idMunicipio char(8);
    w_fec_corte   date;
    w_cta_recaudo varchar2(500);
    w_mensaje     varchar2(500);
    p_ajuste      number;

  BEGIN

    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
      IF not P_ERROR is null THEN
        return;
      END IF;
    END IF;

    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. PROCESO YA LIQUIDADO. SOLICITAR AUTORIZACION';
      RETURN;
    END IF;

   -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion > w_fec_cor_ini;

    IF w_registros > 0 THEN
      p_error := 'SE HA REALIZADO YA UN PROCESO DE TRANSFERENCIA SUPERIOR A LA FECHA DE LIQUIDACION. SOLICITAR APROBACION ' ;
      RETURN;
    END IF;

    aplicaNovedadesMunicipio(w_fec_cor_fin);
    aplicaNovedadesDiasMunicipio(w_fec_cor_fin);
    aplicaNovedadesTercero(w_fec_cor_fin);

    --aplicaNovedadesTercero(w_fec_cor_fin);
    -- elimina liquidaciones anteriores
    delete recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- inserta liquidaciones a procesar
    insert into recaudo_externo_liquidacion
      (id_recaudo_externo_liquidacion,
       id_recaudo_externo,
       idmunicipio,
       fec_corte,
       usuario_proceso,
       fecha_proceso,
       num_liquidacion,
       id_concesionario_liq,
       indtipo,
       idbanco,
       valor_total,
       valor_adicional,
       validador_fecha,
       indfecha2002,
       cta_recaudo,
       ind_base_ter1,
       ind_base_ter2,
       ind_base_ter3,
       ind_base_ter4,
       por_base_ter1,
       por_base_ter2,
       por_base_ter3,
       por_base_ter4)
      select seq_recaudo_externo_liq.nextval,
             id_recaudo_externo,
             idmunicipio,
             fec_corte,
             p_usuario,
             sysdate,
             num_liquidacion,
             '0' || SUBSTR(num_liquidacion, 9, 1), -- concesionario liquidador
             decode(SUBSTR(num_liquidacion, 8, 1), '1', 'POLCA', 'SIMIT'), -- tipo comparendo
             idbanco,
             valor_total,
             valor_adicional,
             validador_fecha,
             indfecha2002,
             cta_recaudo,
             0, -- ind_base_ter1,
             0, -- ind_base_ter2,
             0, -- ind_base_ter3,
             0, -- ind_base_ter4,
             0, -- por_base_ter1,
             0, -- por_base_ter2,
             0, -- por_base_ter3,
             0 --por_base_ter4
        from recaudo_externo
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

    -- obtiene concsionario propietario, indicador de proceso y retroactividad
    update recaudo_externo_liquidacion a
       set (a.id_concesionario_pro, a.ind_proceso, a.indretroactividad) =
           (select m.idconcesionario,
                   (case
                     when a.indtipo = 'SIMIT' then
                      m.indliq_s_ext
                     else
                      m.indliq_p_ext
                   end),
                   m.indretroactividad
              from municipio m
             where m.idmunicipio = a.idmunicipio)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- verifica que todos los municipios esten parametrizados

    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and id_concesionario_pro is null;

    IF w_registros > 0 THEN
      select idMunicipio
        into w_idMunicipio
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and id_concesionario_pro is null
         and rownum = 1;

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN PARAMETRIZAR: ' ||
                 w_idMunicipio;
      RETURN;
    END IF;

    -- actualizar informacion de tercero 1
    update recaudo_externo_liquidacion a
       set (ind_base_ter1, por_base_ter1, nom_ter1) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 1)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- actualizar informacion de tercero 2
    update recaudo_externo_liquidacion a
       set (ind_base_ter2, por_base_ter2, nom_ter2) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 2)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- actualizar informacion de tercero 3

    update recaudo_externo_liquidacion a
       set (ind_base_ter3, por_base_ter3, nom_ter3) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 3)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- actualizar informacion de tercero 4

    update recaudo_externo_liquidacion a
       set (ind_base_ter4, por_base_ter4, nom_ter4) =
           (select ind_base,
                   (case
                     when a.indtipo = 'SIMIT' then
                      base_s
                     else
                      base_p
                   end),
                   nombre
              from tercero t
             where a.idmunicipio = t.idmunicipio
               and num_tercero = 4)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin;

    -- verificar datos vacios de terceros
    update recaudo_externo_liquidacion a
       set (a.ind_base_ter1, a.por_base_ter1, a.nom_ter1) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter1 is null;

    update recaudo_externo_liquidacion a
       set (a.ind_base_ter2, a.por_base_ter2, a.nom_ter2) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter2 is null;

    update recaudo_externo_liquidacion a
       set (a.ind_base_ter3, a.por_base_ter3, a.nom_ter3) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter3 is null;

    update recaudo_externo_liquidacion a
       set (a.ind_base_ter4, a.por_base_ter4, a.nom_ter4) =
           (select 0, 0, '' from dual)
     where a.fec_corte >= w_fec_cor_ini
       and a.fec_corte <= w_fec_cor_fin
       and a.ind_proceso = 1
       and a.ind_base_ter4 is null;

    -- obtiene fecha de dispersion
    update recaudo_externo_liquidacion l
       set (l.dias_dispersion, l.frec_dispersion) =
           (select (case
                     when l.indtipo = 'SIMIT' then
                      dd.dias_dispersion_se
                     else
                      dd.dias_dispersion_pe
                   end),
                   (case
                     when l.indtipo = 'SIMIT' then
                      dd.frec_dispersion_se
                     else
                      dd.frec_dispersion_pe
                   end)
              from dias_dispersion dd
             where dd.idmunicipio = l.idmunicipio
               and dd.idbanco = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- verifica que todos los municipios tengan fecha dispersion
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and dias_dispersion is null
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select a.idMunicipio || ' ' || b.nombre || ' Banco: ' || a.idbanco
        into w_mensaje
        from recaudo_externo_liquidacion a, municipio b
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and a.dias_dispersion is null
         and a.idmunicipio = b.idmunicipio
         and a.ind_proceso = 1
         and rownum = 1;

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. MUNICIPIO SIN DIAS DE DISPERSION: ' ||
                 w_mensaje;
      RETURN;
    END IF;

    update recaudo_externo_liquidacion l
       set l.fec_dispersion = fn_fec_dispersion(l.fec_corte,
                                                l.dias_dispersion,
                                                l.frec_dispersion,
                                                p_usuario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza salario minimo
    update recaudo_externo_liquidacion l
       set smdlv =
           (select valor
              from salario_minimo
             where anho = to_char(l.fec_corte, 'yyyy'))
     where l.fec_corte >= w_fec_cor_ini
       and l.fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- verifica que todos los recaudos tengan salario minimo
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and smdlv is null
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select to_char(fec_corte, 'yyyy')
        into w_mensaje
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and smdlv is null
         and ind_proceso = 1
         and rownum = 1;

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. FECHA CORTE SIN SALARIO MINIMO: ' ||
                 w_mensaje;
      RETURN;
    END IF;

    -- calcular comision de recaudo
    update recaudo_externo_liquidacion l
       set l.s_valor_0 =
           (select c.comision_recaudo
              from cta_recaudo_concesionario c
             where l.idbanco = c.idbanco
               and l.indtipo = c.indtipo
               and l.cta_recaudo = c.cuenta
               and l.id_concesionario_liq = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- valida que se tenga comisiones de recaudo
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and s_valor_0 is null
       and ind_proceso = 1;

    IF w_registros > 0 THEN
      select 'Cuenta: ' || cta_recaudo || ' Banco: ' || idbanco ||
             ' Concesionario:' || id_concesionario_liq || ' Tipo:' ||
             indtipo || ' Liquidacion:' || num_liquidacion
        into w_cta_recaudo
        from recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and s_valor_0 is null
         and ind_proceso = 1
         and rownum = 1;

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. CUENTA RECAUDO NO DEFINIDA: ' ||
                 w_cta_recaudo;
      RETURN;
    END IF;

    select count(*)
      into w_registros
      from recaudo_externo_liquidacion l
     where not l.validador_fecha in
            (select distinct idvalidador from validador_fecha)
       and l.validador_fecha <> '000';

    IF w_registros > 0 THEN

      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      p_error := 'PROCESO NO EJECUTADO. VALIDADOR FECHA NO DEFINIDO';
      RETURN;

    END IF;

    ----------------------------------------- SIMIT -----------------------------------
    -- calcular simit base
    update recaudo_externo_liquidacion l
       set s_valor_1 = valor_total - valor_adicional,
           s_valor_2 =
           (valor_total - valor_adicional) / 10
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- ajustar simit base para cumplir ley
    update recaudo_externo_liquidacion l
       set s_valor_2 = (case
                         when s_valor_2 < smdlv and s_valor_1 >= smdlv and
                              indretroactividad = 0 then
                          smdlv
                         when s_valor_2 < smdlv and s_valor_1 < smdlv and
                              indretroactividad = 0 then
                          s_valor_1
                         when s_valor_2 < smdlv and s_valor_1 >= smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          smdlv
                         when s_valor_2 < smdlv and s_valor_1 < smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          s_valor_1
                         else
                          s_valor_2
                       end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular valor simit, concesionario liquidador, fondo concesionario, fondo simit, equilibrio, base ot
    update recaudo_externo_liquidacion l
       set (l.s_valor_3,
            l.s_valor_4,
            l.s_valor_5,
            l.s_valor_6,
            l.s_valor_7,
            l.s_valor_8) =
           (select l.s_valor_2 * (p.simit_s / 10),
                   l.s_valor_2 * (p.concesionario_s / 10),
                   l.s_valor_2 * (p.fondo_cob_concesionario_s / 10),
                   l.s_valor_2 * (p.fondo_cob_simit_s / 10),
                   l.s_valor_2 * (p.equilibrio_economico_s / 10),
                   l.s_valor_1 - s_valor_2
              from p_dispersion_concesionario p
             where p.idconcesionario = l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular base contravencional
    update recaudo_externo_liquidacion l
       set (l.s_valor_9) =
           (select l.s_valor_8 *
                   ((p.fcm_contravencional_s + p.conces_contravencional_s) / 100) / 0.9
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_9) =
           (select l.s_valor_8 *
                   ((v.p_fcm_contravencional + v.p_conces_contravencional) / 100) / 0.9
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'SIMIT')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional
    update recaudo_externo_liquidacion l
       set (l.s_valor_11) =
           (select l.s_valor_8 * ((p.conces_contravencional_s) / 100) / 0.9
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_11) =
           (select l.s_valor_8 * ((v.p_conces_contravencional) / 100) / 0.9
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'SIMIT')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional
    update recaudo_externo_liquidacion l
       set (l.s_valor_12) = l.s_valor_9 - l.s_valor_11
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular acuerdo de pago
    update recaudo_externo_liquidacion l
       set (l.s_valor_10) =
           (select l.s_valor_8 * (p.acuerdopago_s / 100) / 0.9
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_10) =
           (select l.s_valor_8 * ((v.p_acuerdopago) / 100) / 0.9
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'SIMIT')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcula base municipio sin impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_13) =
           (l.s_valor_8 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteiva contravencional
    -- este calculo si el valor del municipio es posible descontar el iva

    update recaudo_externo_liquidacion l
       set (l.s_valor_13,
            l.s_valor_14,
            l.s_valor_15,
            l.s_valor_16,
            l.s_valor_17,
            l.s_valor_30) =
           (select l.s_valor_8 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12 -
                   ((l.s_valor_11 + l.s_valor_12) * fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.timbre_contravencional
                   (l.s_valor_11) * (fcm.retencion_fuente / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva en 0%
                   (l.s_valor_11) * (0 / 100) -- timbre contravencional concesionario en 0.0 debe ser fcm.impuesto_timbre_tercero
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_13 > 0
       and l.ind_proceso = 1;

    -- calcula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteiva contravencional
    -- este calculo si el valor del municipio es 0, se descuenta iva del acuerdo de pago

    update recaudo_externo_liquidacion l
       set (l.s_valor_10,
            l.s_valor_14,
            l.s_valor_15,
            l.s_valor_16,
            l.s_valor_17,
            l.s_valor_30) =
           (select l.s_valor_10 -
                   ((l.s_valor_11 + l.s_valor_12) * fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100),
                   (l.s_valor_11 + l.s_valor_12) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.timbre_contravencional
                   (l.s_valor_11) * (fcm.retencion_fuente / 100),
                   (l.s_valor_11 + l.s_valor_12) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva en 0%
                   (l.s_valor_11) * (0 / 100) -- timbre contravencional concesionario en 0.0 debe ser fcm.impuesto_timbre_tercero
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_13 = 0
       and l.ind_proceso = 1;

    -- para terceros con base de liquidacion el recaudo calcular y descontar el valor de ot
    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter1) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter1 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter1) / 100
       and por_base_ter1 > 0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter2) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter2 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter2) / 100
       and por_base_ter2 > 0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter3) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter3 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter3) / 100
       and por_base_ter3 > 0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_13 = l.s_valor_13 - (s_valor_1 * por_base_ter4) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter4 = 3
       and l.s_valor_13 > (s_valor_1 * por_base_ter4) / 100
       and por_base_ter4 > 0
       and l.ind_proceso = 1;

    -- calcula base para cada tercero
    update recaudo_externo_liquidacion l
       set l.s_valor_18 = (case
                            when ind_base_ter1 = 1 then
                             s_valor_8
                            when ind_base_ter1 = 2 then
                             valor_adicional
                            when ind_base_ter1 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter1 = 4 then
                             s_valor_13
                            else
                             0.0
                          end),
           l.s_valor_20 = (case
                            when ind_base_ter2 = 1 then
                             s_valor_8
                            when ind_base_ter2 = 2 then
                             valor_adicional
                            when ind_base_ter2 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter2 = 4 then
                             s_valor_13
                            else
                             0.0
                          end),
           l.s_valor_22 = (case
                            when ind_base_ter3 = 1 then
                             s_valor_8
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             s_valor_13
                            else
                             0.0
                          end),
           l.s_valor_24 = (case
                            when ind_base_ter1 = 1 then
                             s_valor_8
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             s_valor_13
                            else
                             0.0
                          end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcula valor para cada tercero
    update recaudo_externo_liquidacion l
       set l.s_valor_19 = l.s_valor_18 * por_base_ter1 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_21 = l.s_valor_20 * por_base_ter2 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter2 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_23 = l.s_valor_22 * por_base_ter3 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter3 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_25 = l.s_valor_24 * por_base_ter4 / 90
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter4 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_19 = l.s_valor_18 * por_base_ter1 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter1 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_21 = l.s_valor_20 * por_base_ter2 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter2 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_23 = l.s_valor_22 * por_base_ter3 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter3 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_25 = l.s_valor_24 * por_base_ter4 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and ind_base_ter4 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.s_valor_13) =
           (select l.s_valor_8 - l.s_valor_10 - l.s_valor_11 - l.s_valor_12 -
                   ((l.s_valor_11 + l.s_valor_12) * fcm.iva / 100) -- reteiva 50%
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- verificar que el valor del tercero nosea mayor que el ot
    update recaudo_externo_liquidacion l
       set l.s_valor_19 = l.s_valor_13,
           l.s_valor_20 = 0,
           l.s_valor_21 = 0,
           l.s_valor_22 = 0,
           l.s_valor_23 = 0,
           l.s_valor_24 = 0,
           l.s_valor_25 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_19 > l.s_valor_13
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_21 = l.s_valor_13 - l.s_valor_19,
           l.s_valor_22 = 0,
           l.s_valor_23 = 0,
           l.s_valor_24 = 0,
           l.s_valor_25 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_21 > (l.s_valor_13 - l.s_valor_19)
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_23 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21,
           l.s_valor_24 = 0,
           l.s_valor_25 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_23 > (l.s_valor_13 - l.s_valor_19 - l.s_valor_21)
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_25 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21 -
                          l.s_valor_23
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.s_valor_25 >
           (l.s_valor_13 - l.s_valor_19 - l.s_valor_21 - l.s_valor_23)
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_11) = l.s_valor_11 + l.s_valor_14 / 2 - l.s_valor_30 -
                            l.s_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.s_valor_12) = l.s_valor_12 + l.s_valor_14 / 2 + l.s_valor_30 +
                            l.s_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- ajusta a dos decimales
    update recaudo_externo_liquidacion l
       set l.s_valor_0  = ROUND(l.s_valor_0, 2),
           l.s_valor_1  = ROUND(l.s_valor_1, 2),
           l.s_valor_2  = ROUND(l.s_valor_2, 2),
           l.s_valor_3  = ROUND(l.s_valor_3, 2),
           l.s_valor_4  = ROUND(l.s_valor_4, 2),
           l.s_valor_5  = ROUND(l.s_valor_5, 2),
           l.s_valor_6  = ROUND(l.s_valor_6, 2),
           l.s_valor_7  = ROUND(l.s_valor_7, 2),
           l.s_valor_8  = ROUND(l.s_valor_8, 2),
           l.s_valor_9  = ROUND(l.s_valor_9, 2),
           l.s_valor_10 = ROUND(l.s_valor_10, 2),
           l.s_valor_11 = ROUND(l.s_valor_11, 2),
           l.s_valor_12 = ROUND(l.s_valor_12, 2),
           l.s_valor_13 = ROUND(l.s_valor_13, 2),
           l.s_valor_14 = ROUND(l.s_valor_14, 2),
           l.s_valor_15 = ROUND(l.s_valor_15, 2),
           l.s_valor_16 = ROUND(l.s_valor_16, 2),
           l.s_valor_17 = ROUND(l.s_valor_17, 2),
           l.s_valor_18 = ROUND(l.s_valor_18, 2),
           l.s_valor_19 = ROUND(l.s_valor_19, 2),
           l.s_valor_20 = ROUND(l.s_valor_20, 2),
           l.s_valor_21 = ROUND(l.s_valor_21, 2),
           l.s_valor_22 = ROUND(l.s_valor_22, 2),
           l.s_valor_23 = ROUND(l.s_valor_23, 2),
           l.s_valor_24 = ROUND(l.s_valor_24, 2),
           l.s_valor_25 = ROUND(l.s_valor_25, 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- calcula netos
    update recaudo_externo_liquidacion l
       set l.s_valor_26 = l.s_valor_13 - l.s_valor_19 - l.s_valor_21 -
                          l.s_valor_23 - l.s_valor_25 + l.s_valor_17 +
                          l.valor_adicional,
           l.s_valor_27 = l.s_valor_11 + l.s_valor_14 - l.s_valor_15 -
                          l.s_valor_16 - l.s_valor_17,
           l.s_valor_28 = l.s_valor_4 - l.s_valor_0,
           l.s_valor_29 = l.s_valor_12 + l.s_valor_15 + l.s_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    -- ajusta decimales

    update recaudo_externo_liquidacion l
       set l.s_valor_6 = (case
                           when l.s_valor_7 = 0.0 then
                            l.valor_total - l.s_valor_3 - l.s_valor_4 -
                            l.s_valor_5 - l.s_valor_10 - l.s_valor_11 -
                            l.s_valor_12 - l.s_valor_26 - l.s_valor_19 -
                            l.s_valor_21 - l.s_valor_23 - l.s_valor_25
                           else
                            l.s_valor_6
                         end),
           l.s_valor_7 = (case
                           when l.s_valor_7 <> 0.0 then
                            l.s_valor_1 - l.s_valor_3 - l.s_valor_4 -
                            l.s_valor_5 - l.s_valor_8
                           else
                            l.s_valor_7
                         end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'SIMIT'
       and l.ind_proceso = 1;

    ------------------------------------ POLCA -----------------------------------------------
    -- calcular simit base
    update recaudo_externo_liquidacion l
       set p_valor_1 = valor_total - valor_adicional,
           p_valor_2 =
           (valor_total - valor_adicional) / 10
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- ajustar simit base para cumplir ley
    update recaudo_externo_liquidacion l
       set p_valor_2 = (case
                         when p_valor_2 < smdlv and p_valor_1 >= smdlv and
                              indretroactividad = 0 then
                          smdlv
                         when p_valor_2 < smdlv and p_valor_1 < smdlv and
                              indretroactividad = 0 then
                          p_valor_1
                         when p_valor_2 < smdlv and p_valor_1 >= smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          smdlv
                         when p_valor_2 < smdlv and p_valor_1 < smdlv and
                              indretroactividad = 1 and indfecha2002 = 0 then
                          p_valor_1
                         else
                          p_valor_2
                       end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular valor simit, concesionario liquidador, fondo concesionario, fondo simit, equilibrio,  valor simit, sevial, equilibrio, base polca, base ot
    update recaudo_externo_liquidacion l
       set (l.p_valor_3,
            l.p_valor_4,
            l.p_valor_5,
            l.p_valor_6,
            l.p_valor_7,
            l.p_valor_8,
            l.p_valor_9,
            l.p_valor_10,
            l.p_valor_11,
            l.p_valor_21) =
           (select l.p_valor_2 * (p.simit_pm / 10),
                   l.p_valor_2 * (p.concesionario_pm / 10),
                   l.p_valor_2 * (p.fondo_cob_concesionario_pm / 10),
                   l.p_valor_2 * (p.fondo_cob_simit_pm / 10),
                   l.p_valor_2 * (p.equilibrio_economico_pm / 10),
                   l.p_valor_2 * (p.simit_pp / 10),
                   l.p_valor_2 * (p.sevial_pp / 10),
                   l.p_valor_2 * (p.equilibrio_economico_pp / 10),
                   (l.p_valor_1 - l.p_valor_2) / 2,
                   (l.p_valor_1 - l.p_valor_2) / 2
              from p_dispersion_concesionario p
             where p.idconcesionario = l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular valor polca, fcm polca, sevial polca y equilibrio polca
    update recaudo_externo_liquidacion l
       set (l.p_valor_12, l.p_valor_13, l.p_valor_14, l.p_valor_15) =
           (select l.p_valor_11 * (p.polca_cp / 45),
                   l.p_valor_11 * (p.fcm_cp / 45),
                   l.p_valor_11 * (p.sevial_cp / 45),
                   l.p_valor_11 * (p.equilibrio_economico_cp / 45)
              from p_dispersion_concesionario p, fcm
             where p.idconcesionario = l.id_concesionario_liq)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular impuestos por convenio polca
    update recaudo_externo_liquidacion l
       set (l.p_valor_16,
            l.p_valor_17,
            l.p_valor_18,
            l.p_valor_19,
            l.p_valor_20) =
           (select (l.p_valor_13 + l.p_valor_15) * fcm.iva / 100,
                   (l.p_valor_13 + l.p_valor_14 + l.p_valor_15) *
                   fcm.impuesto_timbre_fcm / 100,
                   l.p_valor_14 * fcm.iva / 100,
                   l.p_valor_14 * fcm.retencion_fuente / 100,
                   l.p_valor_14 * fcm.impuesto_timbre_tercero / 100
              from fcm)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular VSevial27 con impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_14 = p_valor_14 - p_valor_20 - p_valor_19 + p_valor_18
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- actualizar Valor FCM con equilibrio pra simit capital
    update recaudo_externo_liquidacion l
       set l.p_valor_13 = l.p_valor_15
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.id_concesionario_liq = 5
       and l.ind_proceso = 1;

    -- calcular VFCM18 con impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_13 = p_valor_13 + p_valor_20 + p_valor_19 + p_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular base contravencional

    update recaudo_externo_liquidacion l
       set (l.p_valor_22) =
           (select l.p_valor_21 *
                   ((p.fcm_contravencional_p + p.conces_contravencional_p) / 100) / 0.45
              from p_dispersion_municipio P
             where l.idmunicipio = p.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha = '000'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.p_valor_22) =
           (select l.p_valor_21 *
                   ((v.p_fcm_contravencional + v.p_conces_contravencional) / 100) / 0.45
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'POLCA')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional
    update recaudo_externo_liquidacion l
       set (l.p_valor_24) =
           (select l.p_valor_21 * ((p.conces_contravencional_p) / 100) / 0.45
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.p_valor_24) =
           (select l.p_valor_21 * ((v.p_conces_contravencional) / 100) / 0.45
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'POLCA')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional
    update recaudo_externo_liquidacion l
       set (l.p_valor_25) = l.p_valor_22 - l.p_valor_24
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular acuerdo de pago
    update recaudo_externo_liquidacion l
       set (l.p_valor_23) =
           (select (l.p_valor_21) * (p.acuerdopago_p / 100) / 0.45
              from p_dispersion_municipio p
             where p.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set (l.p_valor_23) =
           (select (l.p_valor_21) * (v.p_acuerdopago / 100) / 0.45
              from validador_fecha v
             where v.idmunicipio = l.idmunicipio
               and v.idValidador = l.validador_fecha
               and v.indtipo = 'POLCA')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.validador_fecha <> '000'
       and l.ind_proceso = 1;

    /* cambio autorizado por edwin pena 28/may/2008
        -- calcular base contravencional y acuerdo de pago
        update recaudo_externo_liquidacion l
           set (l.p_valor_22, l.p_valor_23) = (select l.p_valor_1 *
                                                      (p.fcm_contravencional_p +
                                                      p.conces_contravencional_p) / 100,
                                                      l.p_valor_1 *
                                                      p.acuerdopago_p / 100
                                                 from p_dispersion_municipio p
                                                where p.idmunicipio =
                                                      l.idmunicipio)
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and l.indtipo = 'POLCA'
           and l.ind_proceso = 1;

        -- calcula acuerdo pago, contrav concesionario y contrav fcm
        update recaudo_externo_liquidacion l
           set l.p_valor_23 = (case when p_valor_22 <> 0.0 and p_valor_21 <= p_valor_22 then 0.0 else p_valor_23 end),
               l.p_valor_24 = (case when p_valor_22 <> 0.0 and p_valor_21 > p_valor_22 then p_valor_22 / 2 when p_valor_22 <> 0.0 and p_valor_21 <= p_valor_22 then p_valor_21 / 2 else 0.0 end),
               l.p_valor_25 = (case when p_valor_22 <> 0.0 and p_valor_21 > p_valor_22 then p_valor_22 / 2 when p_valor_22 <> 0.0 and p_valor_21 <= p_valor_22 then p_valor_21 / 2 else 0.0 end)
         where fec_corte >= w_fec_cor_ini
           and fec_corte <= w_fec_cor_fin
           and l.indtipo = 'POLCA'
           and l.ind_proceso = 1;

    */

    -- calcula base municipos sin impuestos
    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_21 - p_valor_23 - p_valor_24 -
                          p_valor_25
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteica contravencional
    -- esto si el valor del municipio cubre el iva por contravencional
    update recaudo_externo_liquidacion l
       set (l.p_valor_26,
            l.p_valor_27,
            l.p_valor_28,
            l.p_valor_29,
            l.p_valor_30,
            p_valor_44) =
           (select l.p_valor_21 - l.p_valor_23 - l.p_valor_24 - l.p_valor_25 -
                   ((l.p_valor_24 + l.p_valor_25) * fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.impuesto_timbre_fcm

                   (l.p_valor_24) * (fcm.retencion_fuente / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva 50%

                   (l.p_valor_24) * (0 / 100) --timbre concesionario contravencional en 0 debe ser fcm.impuesto_timbre_tercero

              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_26 > 0
       and l.ind_proceso = 1;

    -- calula base municipio, iva contravencional, timbre contravencional, retefuente contravencional, reteica contravencional
    -- esto si el valor del municipio es o, se descuenta impuestos de acuerdo
    update recaudo_externo_liquidacion l
       set (l.p_valor_23,
            l.p_valor_27,
            l.p_valor_28,
            l.p_valor_29,
            l.p_valor_30,
            p_valor_44) =
           (select l.p_valor_23 -
                   ((l.p_valor_24 + l.p_valor_25) * fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100),

                   (l.p_valor_24 + l.p_valor_25) * (0 / 100), -- timbre contravencional en 0.0 debe ser fcm.impuesto_timbre_fcm

                   (l.p_valor_24) * (fcm.retencion_fuente / 100),

                   (l.p_valor_24 + l.p_valor_25) * (fcm.iva / 100) *
                   (fcm.reteiva / 100), -- reteiva 50%

                   (l.p_valor_24) * (0 / 100) --timbre concesionario contravencional en 0 debe ser fcm.impuesto_timbre_tercero

              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_26 = 0
       and l.ind_proceso = 1;

    -- para terceros con base de liquidacion el recaudo calcular y descontar el valor de ot
    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter1) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter1 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter1) / 100
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter2) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter2 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter2) / 100
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter3) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter3 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter3) / 100
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_26 = l.p_valor_26 - (p_valor_1 * por_base_ter4) / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter4 = 3
       and l.p_valor_26 > (p_valor_1 * por_base_ter4) / 100
       and l.ind_proceso = 1;

    -- calcula base para cada tercero
    update recaudo_externo_liquidacion l
       set l.p_valor_31 = (case
                            when ind_base_ter1 = 1 then
                             p_valor_21
                            when ind_base_ter1 = 2 then
                             valor_adicional
                            when ind_base_ter1 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter1 = 4 then
                             p_valor_26
                            else
                             0.0
                          end),
           l.p_valor_33 = (case
                            when ind_base_ter2 = 1 then
                             p_valor_21
                            when ind_base_ter2 = 2 then
                             valor_adicional
                            when ind_base_ter2 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter2 = 4 then
                             p_valor_26
                            else
                             0.0
                          end),
           l.p_valor_35 = (case
                            when ind_base_ter3 = 1 then
                             p_valor_21
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             p_valor_26
                            else
                             0.0
                          end),
           l.p_valor_37 = (case
                            when ind_base_ter1 = 1 then
                             p_valor_21
                            when ind_base_ter3 = 2 then
                             valor_adicional
                            when ind_base_ter3 = 3 then
                             valor_total - valor_adicional
                            when ind_base_ter3 = 4 then
                             p_valor_26
                            else
                             0.0
                          end)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    commit;

    -- calcula valor para cada tercero
    update recaudo_externo_liquidacion l
       set l.p_valor_32 = l.p_valor_31 * por_base_ter1 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter1 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_34 = l.p_valor_33 * por_base_ter2 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter2 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_36 = l.p_valor_35 * por_base_ter3 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter3 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_38 = l.p_valor_37 * por_base_ter4 / 45
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter4 = 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_32 = l.p_valor_31 * por_base_ter1 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter1 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_34 = l.p_valor_33 * por_base_ter2 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter2 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_36 = l.p_valor_35 * por_base_ter3 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter3 <> 1
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_38 = l.p_valor_37 * por_base_ter4 / 100
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and ind_base_ter4 <> 1
       and l.ind_proceso = 1;

    -- calula base municipio
    update recaudo_externo_liquidacion l
       set (l.p_valor_26) =
           (select l.p_valor_21 - l.p_valor_23 - l.p_valor_24 - l.p_valor_25 -
                   ((l.p_valor_24 + l.p_valor_25) * fcm.iva / 100)
              from fcm) --- Registro Unico
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- verificar que no sea mayor al ot
    update recaudo_externo_liquidacion l
       set p_valor_32   = p_valor_26,
           l.p_valor_33 = 0,
           l.p_valor_34 = 0,
           l.p_valor_35 = 0,
           l.p_valor_36 = 0,
           l.p_valor_37 = 0,
           l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_32 > p_valor_26
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set p_valor_34   = p_valor_26 - p_valor_32,
           l.p_valor_35 = 0,
           l.p_valor_36 = 0,
           l.p_valor_37 = 0,
           l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_34 > (p_valor_26 - p_valor_32)
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set p_valor_36   = p_valor_26 - p_valor_32 - p_valor_34,
           l.p_valor_37 = 0,
           l.p_valor_39 = 0
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_36 > (p_valor_26 - p_valor_32 - p_valor_34)
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set p_valor_38 = p_valor_26 - p_valor_32 - p_valor_34 - p_valor_36
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and p_valor_38 > (p_valor_26 - p_valor_32 - p_valor_34 - p_valor_36)
       and l.ind_proceso = 1;

    -- calcular valor operador contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.p_valor_24) = l.p_valor_24 + l.p_valor_27 / 2 - l.p_valor_44 -
                            l.p_valor_29
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcular valor fcm contravencional con impuestos
    update recaudo_externo_liquidacion l
       set (l.p_valor_25) = l.p_valor_25 + l.p_valor_27 / 2 + l.p_valor_44 +
                            l.p_valor_29
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- ajusta a dos decimales
    update recaudo_externo_liquidacion l
       set l.s_valor_0  = ROUND(l.s_valor_0, 2),
           l.p_valor_1  = ROUND(l.p_valor_1, 2),
           l.p_valor_2  = ROUND(l.p_valor_2, 2),
           l.p_valor_3  = ROUND(l.p_valor_3, 2),
           l.p_valor_4  = ROUND(l.p_valor_4, 2),
           l.p_valor_5  = ROUND(l.p_valor_5, 2),
           l.p_valor_6  = ROUND(l.p_valor_6, 2),
           l.p_valor_7  = ROUND(l.p_valor_7, 2),
           l.p_valor_8  = ROUND(l.p_valor_8, 2),
           l.p_valor_9  = ROUND(l.p_valor_9, 2),
           l.p_valor_10 = ROUND(l.p_valor_10, 2),
           l.p_valor_11 = ROUND(l.p_valor_11, 2),
           l.p_valor_12 = ROUND(l.p_valor_12, 2),
           l.p_valor_13 = ROUND(l.p_valor_13, 2),
           l.p_valor_14 = ROUND(l.p_valor_14, 2),
           l.p_valor_15 = ROUND(l.p_valor_15, 2),
           l.p_valor_16 = ROUND(l.p_valor_16, 2),
           l.p_valor_17 = ROUND(l.p_valor_17, 2),
           l.p_valor_18 = ROUND(l.p_valor_18, 2),
           l.p_valor_19 = ROUND(l.p_valor_19, 2),
           l.p_valor_20 = ROUND(l.p_valor_20, 2),
           l.p_valor_21 = ROUND(l.p_valor_21, 2),
           l.p_valor_22 = ROUND(l.p_valor_22, 2),
           l.p_valor_23 = ROUND(l.p_valor_23, 2),
           l.p_valor_24 = ROUND(l.p_valor_24, 2),
           l.p_valor_25 = ROUND(l.p_valor_25, 2),
           l.p_valor_26 = ROUND(l.p_valor_26, 2),
           l.p_valor_27 = ROUND(l.p_valor_27, 2),
           l.p_valor_28 = ROUND(l.p_valor_28, 2),
           l.p_valor_29 = ROUND(l.p_valor_29, 2),
           l.p_valor_30 = ROUND(l.p_valor_30, 2),
           l.p_valor_31 = ROUND(l.p_valor_31, 2),
           l.p_valor_32 = ROUND(l.p_valor_32, 2),
           l.p_valor_33 = ROUND(l.p_valor_33, 2),
           l.p_valor_34 = ROUND(l.p_valor_34, 2),
           l.p_valor_35 = ROUND(l.p_valor_35, 2),
           l.p_valor_36 = ROUND(l.p_valor_36, 2),
           l.p_valor_37 = ROUND(l.p_valor_37, 2),
           l.p_valor_38 = ROUND(l.p_valor_38, 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- calcula netos
    update recaudo_externo_liquidacion l
       set l.p_valor_39 = l.p_valor_26 - l.p_valor_32 - l.p_valor_34 -
                          l.p_valor_36 - l.p_valor_38 + l.p_valor_30 +
                          valor_adicional,
           l.p_valor_40 = l.p_valor_24 + l.p_valor_27 - l.p_valor_28 -
                          l.p_valor_29 - l.p_valor_30,
           l.p_valor_41 = l.p_valor_4 - l.s_valor_0,
           l.p_valor_42 = l.p_valor_25 + l.p_valor_28 + l.p_valor_29 +
                          l.p_valor_19 + l.p_valor_20 + l.p_valor_16 +
                          l.p_valor_13,
           l.p_valor_43 = l.p_valor_9 + l.p_valor_14 + l.p_valor_18 -
                          l.p_valor_19 - l.p_valor_20 - l.p_valor_16
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.ind_proceso = 1;

    -- ajusta decimales
    update recaudo_externo_liquidacion l
       set l.p_valor_6 = l.p_valor_1 + l.valor_adicional - l.p_valor_3 -
                         l.p_valor_4 - l.p_valor_5 - l.p_valor_8 -
                         decode(l.id_concesionario_liq, 5, 0, l.p_valor_7) -
                         decode(l.id_concesionario_liq, 5, l.p_valor_7, 0) -
                         l.p_valor_9 - l.p_valor_10 - l.p_valor_13 -
                         l.p_valor_14 - l.p_valor_12 + l.p_valor_18 +
                         l.p_valor_16 - l.p_valor_24 - l.p_valor_25 -
                         l.p_valor_23 - l.p_valor_32 - l.p_valor_34 -
                         l.p_valor_36 - l.p_valor_39
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_7 = 0.0
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.p_valor_13 = l.p_valor_1 + l.valor_adicional - l.p_valor_3 -
                          l.p_valor_4 - l.p_valor_5 - l.p_valor_6 -
                          l.p_valor_8 -
                          decode(l.id_concesionario_liq, 5, 0, l.p_valor_7) -
                          decode(l.id_concesionario_liq, 5, l.p_valor_7, 0) -
                          l.p_valor_9 - l.p_valor_10 - l.p_valor_14 -
                          l.p_valor_12 + l.p_valor_18 + l.p_valor_16 -
                          l.p_valor_24 - l.p_valor_25 - l.p_valor_23 -
                          l.p_valor_32 - l.p_valor_34 - l.p_valor_36 -
                          l.p_valor_39
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.indtipo = 'POLCA'
       and l.p_valor_7 <> 0.0
       and l.ind_proceso = 1;

    ------------------------------------------------------------------------------------------

    update recaudo_externo_liquidacion l
       set l.fec_dispersion_con = fn_fec_dispersion(w_fec_cor_ini,
                                                    0,
                                                    3,
                                                    p_usuario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza cuenta municipio
    update recaudo_externo_liquidacion l
       set l.nit_municipio =
           (select nit_cta
              from municipio m
             where m.idmunicipio = l.idmunicipio)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza nit de metrotransito
    update recaudo_externo_liquidacion l
       set l.nit_municipio =
           (select nit_cta from municipio m where m.idmunicipio = '08001001')
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1
       and l.validador_fecha <> '000'
       and l.idmunicipio = '08001000';

    -- actualiza nit BANCO Concesionario
    update recaudo_externo_liquidacion l
       set l.nit_concesionario =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.id_concesionario_liq
               and c.idconcepto = 1
               and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza nit fondo cobertura concesioanrio
    update recaudo_externo_liquidacion l
       set l.nit_fondo =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    -- actualiza nit contravencional
    update recaudo_externo_liquidacion l
       set l.nit_concesionariozon =
           (select nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = l.id_concesionario_pro
               and c.idconcepto = 3
               and c.idbancorec = l.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and l.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set (nit_tercero1, nit_tercero2, nit_tercero3, nit_tercero4) =
           (select '0000000000', '0000000000', '0000000000', '0000000000'
              from dual)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set nit_tercero1 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 1)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter1 > 0
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set nit_tercero2 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter2 > 0
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set nit_tercero3 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 3)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter3 > 0
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion r
       set nit_tercero4 =
           (select nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 4)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and r.ind_base_ter4 > 0
       and r.ind_proceso = 1;

    update recaudo_externo_liquidacion l
       set l.s_valor_5 = round((l.s_valor_5 + l.s_valor_6) -
                               (l.s_valor_5 + l.s_valor_6) / 2,
                               2),
           l.s_valor_6 =
           (l.s_valor_5 + l.s_valor_6) -
           round((l.s_valor_5 + l.s_valor_6) -
                 (l.s_valor_5 + l.s_valor_6) / 2,
                 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and abs(l.s_valor_5 - l.s_valor_6) > 0.01;

    update recaudo_externo_liquidacion l
       set l.p_valor_5 = round((l.p_valor_5 + l.p_valor_6) -
                               (l.p_valor_5 + l.p_valor_6) / 2,
                               2),
           l.p_valor_6 =
           (l.p_valor_5 + l.p_valor_6) -
           round((l.p_valor_5 + l.p_valor_6) -
                 (l.p_valor_5 + l.p_valor_6) / 2,
                 2)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and abs(l.p_valor_5 - l.p_valor_6) > 0.01;

    update recaudo_externo_liquidacion l
       set l.s_valor_5 = l.s_valor_5 - 0.01,
           l.s_valor_6 = l.s_valor_6 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.s_valor_5 - l.s_valor_6) = 0.02;

    update recaudo_externo_liquidacion l
       set l.s_valor_6 = l.s_valor_6 - 0.01,
           l.s_valor_5 = l.s_valor_5 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.s_valor_6 - l.s_valor_5) = 0.02;

    update recaudo_externo_liquidacion l
       set l.s_valor_6 = l.s_valor_5, l.s_valor_5 = l.s_valor_6
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.s_valor_5 - l.s_valor_6) = 0.01;

    update recaudo_externo_liquidacion l
       set l.p_valor_5 = l.p_valor_5 - 0.01,
           l.p_valor_6 = l.p_valor_6 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.p_valor_5 - l.p_valor_6) = 0.02;

    update recaudo_externo_liquidacion l
       set l.p_valor_6 = l.p_valor_6 - 0.01,
           l.p_valor_5 = l.p_valor_5 + 0.01
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.p_valor_6 - l.p_valor_5) = 0.02;

    update recaudo_externo_liquidacion l
       set l.p_valor_6 = l.p_valor_5, l.p_valor_5 = l.p_valor_6
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1
       and (l.p_valor_5 - l.p_valor_6) = 0.01;

    commit;

    contabiliza_recaudo_externo(p_feccor_ini_ano,
                                p_feccor_ini_mes,
                                p_feccor_ini_dia,
                                p_usuario,
                                p_error);

    IF not P_ERROR is null THEN
      -- elimina liquidaciones anteriores
      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      commit;

      return;
    END IF;

    dispersa_recaudo_externo(p_feccor_ini_ano,
                             p_feccor_ini_mes,
                             p_feccor_ini_dia,
                             p_usuario,
                             p_error);

    IF not P_ERROR is null THEN
      -- elimina liquidaciones anteriores
      delete recaudo_externo_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin;

      return;
    END IF;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    p_error := 'Recuado Externo Liquidado OK. Registros: ' || w_registros;

    select max(importe)
      into p_ajuste
      from recaudo_externo_contabilidad
     where textocabezera2 = 'AJUSTE PESOS'
       and fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'REC';

    if (p_ajuste > 100) then
      p_error := 'Recuado Externo Liquidado OK. POSIBLE ERROR DE CONTABILIDAD. FAVOR VERIFICAR.Registros: ' ||
                 w_registros;
    end if;

    sp_envioNotificacion(grupoRecibe => 3,
                         grupoCopia  => 2,
                         asunto      => 'SDF - Proceso de distribucion del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd'),
                         mensaje     => 'El sistema SDF informa que se ha ejecutado el proceso de distribucion, del dia ' ||
                                        to_char(w_fec_cor_ini, 'yyyy-MM-dd') ||
                                        '. Favor verificar y dar su visto bueno. Se genero el siguiente mensaje en el proceso de distribucion ' ||
                                        p_error,
                         p_usuario   => p_usuario);

    sp_log(p_usuario,
           'Liquida Recaudo Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [liquida_recaudo_externo] ' || SQLERRM,
            p_error);

  END liquida_recaudo_externo;

  PROCEDURE dispersa_recaudo_local(p_fec_ini_ano number,
                                   p_fec_ini_mes number,
                                   p_fec_ini_dia number,
                                   p_fec_fin_ano number,
                                   p_fec_fin_mes number,
                                   p_fec_fin_dia number,
                                   p_usuario     varchar2,
                                   p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;

  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    delete from recaudo_local_disp
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    -- obtiene valor simit
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             1, -- orden
             sum(s_valor_1),
             'Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- neto simit por polca
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             1, -- orden
             sum(p_valor_27),
             'Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor concesionario
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             2, -- orden
             sum(s_valor_6),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- neto concesionario por polca
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             2, -- orden
             sum(p_valor_25),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura concesionario
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             3, -- orden
             sum(s_valor_3),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- fondo cobertura concesionario
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             3, -- orden
             sum(p_valor_9),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura simit
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             4, -- orden
             sum(s_valor_4),
             'Fondo Cobertura Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- fondo cobertura simit
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             4, -- orden
             sum(p_valor_10),
             'Fondo Cobertura Simit', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor equilibrio economico
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             5, -- orden
             sum(s_valor_5),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- equilibrio economico
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             5, -- orden
             sum(p_valor_28),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor SEVIAL
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             6, -- orden
             sum(p_valor_24),
             'Sevial', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor SEVIAL
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             7, -- orden
             sum(p_valor_15),
             'Polca', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- obtiene valor FCM
    insert into recaudo_local_disp
      (fec_corte,
       fec_dispersion,
       idconcesionario,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select fec_corte,
             fec_dispersion,
             idconcesionario,
             8, -- orden
             sum(p_valor_26),
             'FCM Polca', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_local_liquidacion
       where fec_corte >= w_fec_cor_ini
         and fec_corte <= w_fec_cor_fin
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by fec_corte,
                idconcesionario,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- actualiza cuenta financiera simit
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_s_banco,
                   c.cta_disp_s_tipo_cta,
                   c.cta_disp_s_cta,
                   c.nit_fcm
              from cta_dispersion_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Simit';

    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_p_banco,
                   c.cta_disp_p_tipo_cta,
                   c.cta_disp_p_cta,
                   c.nit_fcm
              from cta_dispersion_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Simit';

    commit;

    -- actualiza cuenta contable simit
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select ctacon_fcm,
                   '',
                   '',
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre ||
                   ' FCM (2.5%)'
              from fcm f, banco b
             where r.ori_idbanco = b.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Simit';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select ctacon_fcm,
                   '',
                   '',
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre ||
                   ' FCM (3.25%)'
              from fcm f, banco b
             where r.ori_idbanco = b.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Simit';

    commit;

    -- actualiza informacion financiera FCM Polca
    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   c.nit_fcm
              from cta_dispersion_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'FCM Polca';

    -- actualiza cuenta contable FCM POLCA
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select ctacon_fcma,
                   '',
                   '',
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre ||
                   ' FCM (1.8%)'
              from fcm f, banco b
             where r.ori_idbanco = b.idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'FCM Polca';

    -- actualiza cuenta financiera Concesionario
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 1
               and r.ori_idbanco <> '52'
               and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and concepto = 'Concesionario';

    update recaudo_local_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.idbanco, c.tipocuenta, c.cuenta, c.nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 7
               and r.ori_idbanco = '52'
               and c.idbancorec = r.ori_idbanco)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin
       and r.concepto = 'Concesionario';

    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 5
               and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and idconcesionario = '03'
       and concepto = 'Concesionario';

    -- actualiza informacion contable concesionario
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_puente,
                   p.concesionario_s_cc,
                   c.nit_c,
                   ('RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' (6.5%)')
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Concesionario';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_puente,
                   p.concesionario_pm_cc,
                   c.nit_c,
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' (3.25%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Concesionario';

    commit;
    -- actualiza cuenta financiera Fondo Cobertura
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura Concesionario';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_puente,
                   p.fondo_cob_concesionario_s_cc,
                   c.nit_c,
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' Fondo Cobertura (1.0%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Fondo Cobertura Concesionario';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_puente,
                   p.fondo_cob_concesionario_pm_cc,
                   c.nit_c,
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' Fondo Cobertura (0.5%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Fondo Cobertura Concesionario';

    commit;

    -- actualiza cuenta financiera Fondo Cobertura simit
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura Simit';

    -- actualiza cuenta contable fondo cobertura simir
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_fondo_cobertura,
                   p.fondo_cob_simit_s_cc,
                   c.nit_c,
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' Fondo Cobertura (1.0%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Fondo Cobertura Simit';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_fondo_cobertura,
                   p.fondo_cob_simit_pm_cc,
                   c.nit_c,
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' Fondo Cobertura (1.0%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Fondo Cobertura Simit';

    commit;

    -- actualiza cuenta financiera Equilibrio
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Equilibrio Economico';

    -- actualiza cuenta contable Equilibrio
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_puente,
                   p.equilibrio_economico_s_cc,
                   c.nit_c,
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' Equilibrio (2.5%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'SIMIT'
       and concepto = 'Equilibrio Economico';

    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_puente,
                   p.equilibrio_economico_s_cc,
                   c.nit_c,
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' Equilibrio (2.5%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Equilibrio Economico';

    COMMIT;

    -- actualiza cuenta financiera Sevial
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 5
               and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial';

    -- actualiza cuenta contable sevial
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_puente,
                   p.sevial_pp_cc,
                   '8301123291',
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' Sevial (5.7%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Sevial';

    COMMIT;

    -- actualiza cuenta financiera POLCA
    update recaudo_local_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.idconcesionario
               and c.idconcepto = 6
               and c.idbancorec = r.ori_idbanco)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Polca';

    -- actualiza cuenta contable Polca
    update recaudo_local_disp r
       set (deb_cta_con, deb_cen_cos, deb_nit_ter, concepto_con) =
           (select f.ctacon_polca,
                   '',
                   '',
                   'RECAUDO ' || r.indtipo || ' LOCAL ' || b.nombre || ' ' ||
                   c.nombre || ' (39.78%)'
              from fcm                        f,
                   banco                      b,
                   p_dispersion_concesionario p,
                   concesionario              c
             where r.ori_idbanco = b.idbanco
               and r.idconcesionario = p.idconcesionario
               and r.idconcesionario = c.idconcesionario)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Polca';

    -- actualiza el tipo de cuenta origen
    update recaudo_local_disp r
       set r.ori_tipocuenta =
           (select c.tipocuenta
              from cta_recaudo_fcm c
             where c.cuenta = r.ori_cuenta)
     where r.fec_corte >= w_fec_cor_ini
       and r.fec_corte <= w_fec_cor_fin;

    -- actualiza cuenta contable partida credito
    update recaudo_local_disp r
       set (cre_cta_con, cre_cen_cos, cre_nit_ter) =
           (select c.cta_contable, '', ''
              from cta_recaudo_fcm c
             where c.nit_fcm = '8000826650'
               and c.idbanco = r.ori_idbanco
               and c.indtipo = r.indtipo
               and c.tipocuenta = r.ori_tipocuenta
               and c.cuenta = r.ori_cuenta)
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    COMMIT;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin;

    p_error := 'OK ' || w_registros;

    sp_log(p_usuario,
           'Dispersa Recaudo Local',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);
    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [dispersa_recaudo_local] ' || SQLERRM,
            p_error);
  END dispersa_recaudo_local;

  PROCEDURE causa_gas_recaudo_local(p_fec_ini_ano number,
                                    p_fec_ini_mes number,
                                    p_fec_ini_dia number,
                                    p_fec_fin_ano number,
                                    p_fec_fin_mes number,
                                    p_fec_fin_dia number,
                                    p_usuario     varchar2,
                                    p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    delete from recaudo_local_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'GASTO';

    COMMIT;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null,
             sum(s_valor_6),
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(p_valor_25), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null,
             sum(s_valor_3),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null,
             sum(p_valor_9),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(s_valor_6),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_pm_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Local ' || max(c.nombre) ||
             ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(p_valor_25),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_pm_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Local ' || max(c.nombre) ||
             ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(s_valor_3),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             sum(p_valor_9),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Local ' ||
             max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             sum(p_valor_13), -- valor debito
             null, -- valor credito
             max(p.ctacon_gas), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             '',
             '',
             '',
             5, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Local ' || ' (3.05%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion r, p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             null, -- valor debito
             sum(p_valor_13), -- valor credito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             max(f.ctacon_puente), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             6, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Local ' || ' (3.05%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1;

    p_error := 'OK ' || w_registros;

    sp_log(p_usuario,
           'Cuasacion Gasto Recaudo Local',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_gas_recaudo_local] ' || SQLERRM,
            p_error);
  END causa_gas_recaudo_local;

  PROCEDURE causa_ing_recaudo_local(p_fec_ini_ano number,
                                    p_fec_ini_mes number,
                                    p_fec_ini_dia number,
                                    p_fec_fin_ano number,
                                    p_fec_fin_mes number,
                                    p_fec_fin_dia number,
                                    p_usuario     varchar2,
                                    p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    delete from recaudo_local_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'INGRESO';

    COMMIT;

    -- obtener partidas vlr recaudo
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Local ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, cta_recaudo_fcm c, banco b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and c.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr recaudo
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Local ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, cta_recaudo_fcm c, banco b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and c.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(s_valor_6), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             2, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(p_valor_25), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             2, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(s_valor_3), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             3, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.idconcesionario,
             null, -- valor debito
             sum(p_valor_9), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             3, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Local ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             concesionario              c,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idconcesionario = c.idconcesionario
         and r.idconcesionario = p.idconcesionario
       group by r.idconcesionario, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_4), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_s_cc),
             max(f.nit_fcm),
             4, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Local  (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_10), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_pm_cc),
             max(f.nit_fcm),
             4, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Local  (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_1), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_s_cc),
             max(f.nit_fcm),
             5, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) || ' Local  (2.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_27), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_pm_cc),
             max(f.nit_fcm),
             5, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) || ' Local  (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- falta: neto polca, 1,8, 2,7 impuestos, sevial

    -- obtener partidas vlr polca
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_15), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_polca),
             '',
             max(f.nit_polca),
             6, -- orden
             'Ingreso Polca ' || max(r.indtipo) || ' Local  (39.78%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr sevial 2.7
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_17), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.sevial_cp_cc),
             max(f.nit_sevial),
             7, -- orden
             'Ingreso Sevial ' || max(r.indtipo) || ' Local  (2.7%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr sevial 3.0
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_13), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.sevial_pp_cc),
             max(f.nit_sevial),
             7, -- orden
             'Ingreso Sevial ' || max(r.indtipo) || ' Local  (3.0%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fcm 1.8
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_16), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.fcm_cp_cc),
             max(f.nit_fcm),
             8, -- orden
             'Ingreso FCM ' || max(r.indtipo) || ' Local  (1.8%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva 2.7
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_20), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.sevial_cp_cc),
             max(f.nit_sevial),
             9, -- orden
             'Ingreso IVA ' || max(r.indtipo) || ' Local  (2.7%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva 1.8
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_19), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             max(p.fcm_cp_cc),
             max(f.nit_fcm),
             10, -- orden
             'Ingreso IVA ' || max(r.indtipo) || ' Local  (1.8%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion  r,
             fcm                        f,
             p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva impuesto timbre
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_23), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_impuestos),
             '',
             max(f.nit_fcm),
             11, -- orden
             'Ingreso Impuesto Timbre ' || max(r.indtipo) ||
             ' Local (0.75%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlriva impuesto timbre
    insert into recaudo_local_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(p_valor_23), -- valor debito
             null, -- valor credito
             max(f.ctacon_impuestos),
             '',
             max(f.nit_fcm),
             '', -- cuenta credito
             '', -- centro credito
             '', -- nit credito
             12, -- orden
             'Ingreso Impuesto Timbre ' || max(r.indtipo) ||
             ' Local (0.75%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_local_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_local_liquidacion
     where fec_corte >= w_fec_cor_ini
       and fec_corte <= w_fec_cor_fin
       and ind_proceso = 1;

    p_error := 'OK ' || w_registros;

    sp_log(p_usuario,
           'Cuasacion Ingreso Recaudo Local',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_ing_recaudo_local] ' || SQLERRM,
            p_error);
  END causa_ing_recaudo_local;

  PROCEDURE dispersa_recaudo_externo(p_fec_ini_ano number,
                                     p_fec_ini_mes number,
                                     p_fec_ini_dia number,
                                     p_usuario     varchar2,
                                     p_error       OUT VARCHAR2) as

    w_fec_cor_ini    date;
    w_fec_cor_fin    date;
    w_fecmin_cor_ini date;
    w_fecmax_cor_fin date;
    w_registros      number;

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    delete from recaudo_externo_disp
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    commit;

    -- obtiene valor simit
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             5, -- orden
             sum(s_valor_3),
             'Liquidacion SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- neto simit por polca
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             5, -- orden
             sum(p_valor_3 + p_valor_8),
             'Liquidacion SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor concesionario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             7, -- orden
             sum(s_valor_4),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- neto concesionario por polca
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             7, -- orden
             sum(p_valor_4),
             'Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate
        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura concesionario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             8, -- orden
             sum(s_valor_5),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- fondo cobertura concesionario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             8, -- orden
             sum(p_valor_5),
             'Fondo Cobertura Concesionario', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor fondo cobertura simit
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             6, -- orden
             sum(s_valor_6),
             'Fondo Cobertura SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- fondo cobertura simit
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             6, -- orden
             sum(p_valor_6),
             'Fondo Cobertura SIMIT', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- obtiene valor equilibrio economico
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             9, -- orden
             sum(s_valor_7),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- equilibrio economico
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             9, -- orden
             sum(p_valor_7 + p_valor_10 +
                 decode(id_concesionario_liq, 5, p_valor_15, 0)),
             'Equilibrio Economico', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- equilibrio economico
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             9, -- orden
             sum(decode(id_concesionario_liq, 5, p_valor_13 - p_valor_15, 0)),
             'Impuestos SIMIT CAPITAL', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del concecionario porpietario
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       id_concesionario_pro,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             id_concesionario_pro,
             13, -- orden
             sum(s_valor_11),
             'Concesionario Contravencional', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                id_concesionario_pro,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del concesionario contravencional (propietario)
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       id_concesionario_pro,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             id_concesionario_pro,
             13, -- orden
             sum(p_valor_24),
             'Concesionario Contravencional', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                id_concesionario_pro,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del fcm contravencional
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             14, -- orden
             sum(s_valor_12),
             'Contravencional FCM', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del fcm contravencional
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             14, -- orden
             sum(p_valor_25),
             'Contravencional FCM', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- 100218

    -- valor del municipio
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             1, -- orden
             sum(s_valor_26),
             'Municipio', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion r
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and validador_fecha = '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del municipio
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             1, -- orden
             sum(p_valor_39),
             'Municipio', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and validador_fecha = '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del municipio con validador
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             1, -- orden
             sum(s_valor_26),
             'Validador', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion r
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
         and validador_fecha <> '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del municipio
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             2, -- orden
             sum(p_valor_39),
             'Validador', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
         and validador_fecha <> '000'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- 100218

    -- valor del acuerdo pago
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             15, -- orden
             sum(s_valor_10),
             'Acuerdo Pago', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del acuerdo pago
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             15, -- orden
             sum(p_valor_23),
             'Acuerdo Pago', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 1
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             2, -- orden
             sum(s_valor_19),
             'Tercero 1', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 1
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             2, -- orden
             sum(p_valor_32),
             'Tercero 1', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 2
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             3, -- orden
             sum(s_valor_21),
             'Tercero 2', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 2
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             3, -- orden
             sum(p_valor_34),
             'Tercero 2', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 3
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(s_valor_23),
             'Tercero 3', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 3
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(p_valor_36),
             'Tercero 3', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 4
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(s_valor_25),
             'Tercero 4', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'SIMIT'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor del tercero 4
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       idmunicipio,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion,
             id_concesionario_liq,
             idmunicipio,
             4, -- orden
             sum(p_valor_38),
             'Tercero 4', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                idmunicipio,
                fec_dispersion,
                idbanco,
                cta_recaudo;

    -- valor de polca sevial
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             10, -- orden
             sum(p_valor_9 + p_valor_14),
             'POLCA SEVIAL', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor de polca fcm
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             11, -- orden
             sum(decode(id_concesionario_liq, 5, 0, p_valor_13)),
             'POLCA FCM', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor del polca
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             fec_dispersion_con,
             id_concesionario_liq,
             12, -- orden
             sum(p_valor_12 - p_valor_18 - p_valor_16),
             'Liquidacion POLCA', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             max(indtipo),
             p_usuario,
             sysdate

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 1
         and indtipo = 'POLCA'
       group by id_concesionario_liq,
                fec_dispersion_con,
                idbanco,
                cta_recaudo;

    -- valor no dispersados
    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       valor,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       idMunicipio)
      select w_fec_cor_ini,
             w_fec_cor_ini,
             w_fec_cor_ini,
             id_concesionario_liq,
             16, -- orden
             sum(valor_total),
             'Valor no distribuido', -- concepto,
             idbanco,
             'AHO',
             cta_recaudo,
             '8000826650',
             indtipo,
             p_usuario,
             sysdate,
             idmunicipio

        from recaudo_externo_liquidacion
       where fec_corte = w_fec_cor_ini
         and ind_proceso = 0
       group by id_concesionario_liq,
                idbanco,
                cta_recaudo,
                indtipo,
                idmunicipio;

    commit;

    /*
        -- TOTALIZA REGISTROS CON LA MISMA FECHA DE DISPERSION
        -- SE GENERAN VARIOS POR QUE LA FECHA DE DISPERSION ES LA DEL MUNICIIPIO
        -- Y SE CAMBIA A LA FUERZXA POR LA DE ICNICIO DE MES

        insert into recaudo_externo_disp
          (fec_corte_ini,
           fec_corte_fin,
           fec_dispersion,
           id_concesionario_liq,
           orden,
           concepto,
           ori_idbanco,
           ori_tipocuenta,
           ori_cuenta,
           ori_nit,
           des_idbanco,
           des_tipocuenta,
           des_cuenta,
           des_nit,
           indtipo,
           usuario_proceso,
           fecha_proceso,
           valor,
           id_concesionario_pro,
           idmunicipio)
          select w_fec_cor_ini,
                 w_fec_cor_fin,
                 fec_dispersion,
                 id_concesionario_liq,
                 orden,
                 concepto,
                 ori_idbanco,
                 ori_tipocuenta,
                 ori_cuenta,
                 ori_nit,
                 des_idbanco,
                 des_tipocuenta,
                 des_cuenta,
                 des_nit,
                 indtipo,
                 p_usuario,
                 sysdate,
                 sum(valor),
                 '',
                 idmunicipio
            from recaudo_externo_disp
            where fec_corte_ini >= w_fec_cor_ini
            and   fec_corte_fin <= w_fec_cor_fin
            and   id_concesionario_pro = '99'
           group by fec_dispersion,
                    id_concesionario_liq,
                    orden,
                    concepto,
                    ori_idbanco,
                    ori_tipocuenta,
                    ori_cuenta,
                    ori_nit,
                    des_idbanco,
                    des_tipocuenta,
                    des_cuenta,
                    des_nit,
                    indtipo,
                    id_concesionario_pro,
                    idmunicipio;

            delete
            from recaudo_externo_disp
            where fec_corte_ini >= w_fec_cor_ini
            and   fec_corte_fin <= w_fec_cor_fin
            and   id_concesionario_pro = '99';
    */

    -- actualiza cuenta BANCO simit
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_s_banco,
                   c.cta_disp_s_tipo_cta,
                   c.cta_disp_s_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Liquidacion SIMIT';

    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_p_banco,
                   c.cta_disp_p_tipo_cta,
                   c.cta_disp_p_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Liquidacion SIMIT';

    commit;

    -- actualiza cuenta BANCO Concesionario
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 1
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario';

    -- actualiza cuenta BANCO Fondo Cobertura
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura Concesionario';

    -- actualiza cuenta BANCO Fondo Cobertura simit
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Fondo Cobertura SIMIT';

    -- actualiza cuenta BANCO Equilibrio
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 2
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Equilibrio Economico';

    -- actualiza cuenta Impuestos SIMIT CAPITAL
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Impuestos SIMIT CAPITAL';

    -- actualiza cuenta BANCO Municipio
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_cta
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Municipio';

    -- 100929
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_cta
              from municipio m
             where m.idmunicipio = '08001001')
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Validador'
       and r.idmunicipio = '08001000';

    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_cta
              from municipio m
             where m.idmunicipio = '08000000')
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Validador'
       and r.idmunicipio in ('08296000', '08573000');

    -- 100929

    -- actualiza cuenta BANCO Tercero 1
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and num_tercero = 1)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 1';

    -- actualiza cuenta BANCO Tercero 2
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and num_tercero = 2)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 2';

    -- actualiza cuenta BANCO Tercero 3
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and num_tercero = 1)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 3';

    -- actualiza cuenta BANCO Tercero 4
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_t
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and num_tercero = 4)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Tercero 4';

    -- actualiza cuenta BANCO acuerdo de pago
    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_Ac_banco,
                   c.cta_disp_Ac_tipo_cta,
                   c.cta_disp_Ac_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'SIMIT'
       and r.concepto = 'Acuerdo Pago';

    update recaudo_externo_disp r
       set (r.des_idbanco, r.des_tipocuenta, r.des_cuenta, r.des_nit) =
           (select c.cta_disp_ac_banco,
                   c.cta_disp_Ac_tipo_cta,
                   c.cta_disp_Ac_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_fin <= w_fec_cor_fin
       and r.indtipo = 'POLCA'
       and r.concepto = 'Acuerdo Pago';

    -- actualiza cuenta BANCO Concesionario Contravencional
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_pro
               and c.idconcepto = 3
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Concesionario Contravencional';

    -- actualiza cuenta BANCO Fcm Contravencional
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 4
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Contravencional FCM';

    -- actualiza cuenta BANCO POLCA
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 6
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'Liquidacion POLCA';

    -- actualiza cuenta BANCO Sevial
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select idbanco, tipocuenta, cuenta, nit_c
              from cta_dispersion_concesionario c
             where c.idconcesionario = r.id_concesionario_liq
               and c.idconcepto = 5
               and c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'POLCA SEVIAL';

    -- actualiza cuenta BANCO POLCA FCM
    update recaudo_externo_disp r
       set (des_idbanco, des_tipocuenta, des_cuenta, des_nit) =
           (select c.cta_disp_pa_banco,
                   c.cta_disp_pa_tipo_cta,
                   c.cta_disp_pa_cta,
                   '8000826650'
              from cta_dispersion_fcm c
             where c.idbancorec = r.ori_idbanco)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and indtipo = 'POLCA'
       and concepto = 'POLCA FCM';

    -- actualiza el tipo de cuenta origen
    update recaudo_externo_disp r
       set r.ori_tipocuenta =
           (select c.tipocuenta
              from cta_recaudo_concesionario c
             where c.cuenta = r.ori_cuenta
               and c.idconcesionario = r.id_concesionario_liq
               AND r.indtipo = c.indtipo)
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set des_idbanco    = ori_idbanco,
           des_tipocuenta = ori_tipocuenta,
           des_cuenta     = ori_cuenta,
           des_nit        = ori_nit
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and concepto = 'Valor no distribuido';

    commit;

    -- actualiza conceptos

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Liquidacion FCM'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Liquidacion SIMIT'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Fondo Cobertura FCM -' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Fondo Cobertura SIMIT'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Fondo Cobertura' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Fondo Cobertura Concesionario'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = 'Impuestos FCM'
     where r.concepto = 'Impuestos SIMIT CAPITAL'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Equilibrio Economico -' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Equilibrio Economico'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'POLCA SEVIAL'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'POLCA SEVIAL'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'POLCA FCM'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'POLCA FCM'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Liquidacion POLCA'
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Liquidacion POLCA'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Liquidacion ' || ' ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_liq)
     where r.concepto = 'Concesionario'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select m.idmunicipio || ' Municipio ' || m.nombre
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Municipio'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'No distribuido ' || m.idmunicipio || ' Municipio ' ||
                   m.nombre
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Valor no distribuido'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    -- 100929

    update recaudo_externo_disp r
       set r.concepto = 'Metrotransito Barranquilla'
     where r.concepto = 'Validador'
       and r.idmunicipio = '08001000'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = 'Galapa - Dptal Atlantico'
     where r.concepto = 'Validador'
       and r.idmunicipio in ('08296000')
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto = 'Puerto Colombia - Dptal Atlantico'
     where r.concepto = 'Validador'
       and r.idmunicipio in ('08573000')
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    -- 100929

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Acuerdo Pago ' || m.idmunicipio || ' ' || m.nombre
              from municipio m
             where m.idmunicipio = r.idmunicipio)
     where r.concepto = 'Acuerdo Pago'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto =
           (select 'Contravencional ' || c.nombre
              from concesionario c
             where c.idconcesionario = r.id_concesionario_pro)
     where r.concepto = 'Concesionario Contravencional'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto            =
           (select t.nombre
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 1),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 1'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto            =
           (select t.nombre
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 2),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 2'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto            =
           (select t.nombre
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 3),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 3'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    update recaudo_externo_disp r
       set r.concepto            =
           (select t.nombre
              from tercero t
             where t.idmunicipio = r.idmunicipio
               and t.num_tercero = 4),
           r.id_concesionario_pro = '98'
     where r.concepto = 'Tercero 4'
       and fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin;

    commit;

    insert into recaudo_externo_disp
      (fec_corte_ini,
       fec_corte_fin,
       fec_dispersion,
       id_concesionario_liq,
       orden,
       concepto,
       ori_idbanco,
       ori_tipocuenta,
       ori_cuenta,
       ori_nit,
       des_idbanco,
       des_tipocuenta,
       des_cuenta,
       des_nit,
       indtipo,
       usuario_proceso,
       fecha_proceso,
       valor,
       id_concesionario_pro,
       idmunicipio)
      select w_fec_cor_ini,
             w_fec_cor_fin,
             fec_dispersion,
             id_concesionario_liq,
             orden,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             des_cuenta,
             des_nit,
             indtipo,
             p_usuario,
             sysdate,
             sum(valor),
             '',
             '99999999'
        from recaudo_externo_disp
       where fec_corte_ini >= w_fec_cor_ini
         and fec_corte_fin <= w_fec_cor_fin
         and id_concesionario_pro = '98'
       group by fec_dispersion,
                id_concesionario_liq,
                orden,
                concepto,
                ori_idbanco,
                ori_tipocuenta,
                ori_cuenta,
                ori_nit,
                des_idbanco,
                des_tipocuenta,
                des_cuenta,
                des_nit,
                indtipo,
                id_concesionario_pro;

    delete from recaudo_externo_disp
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_fin <= w_fec_cor_fin
       and id_concesionario_pro = '98';

    delete from recaudo_externo_disp where valor = 0;

    -- actualiza datos null
    update recaudo_externo_disp r
       set idmunicipio = '99999999'
     where r.fec_corte_ini >= w_fec_cor_ini
       and r.fec_corte_ini <= w_fec_cor_fin
       and idmunicipio is null;

    update recaudo_externo_disp r
       set des_idbanco = ori_idbanco
     where fec_corte_ini >= w_fec_cor_ini
       and fec_corte_ini <= w_fec_cor_fin
       and des_idbanco is null;

    commit;

    sp_log(p_usuario,
           'Dispersa Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [dispersa_recaudo_externo] ' || SQLERRM,
            p_error);
  END dispersa_recaudo_externo;

  PROCEDURE causa_gas_recaudo_externo(p_fec_ini_ano number,
                                      p_fec_ini_mes number,
                                      p_fec_ini_dia number,
                                      p_fec_fin_ano number,
                                      p_fec_fin_mes number,
                                      p_fec_fin_dia number,
                                      p_usuario     varchar2,
                                      p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin
    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    delete from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'GASTO';

    COMMIT;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             sum(s_valor_28),
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_41), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_puente),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             1, -- orden
             'Por Pagar Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             sum(s_valor_5),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             sum(p_valor_5),
             '',
             '',
             '',
             max(f.ctacon_puente),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             2, -- orden
             'Por Pagar Fondo Cobertura Conces ' || max(indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(s_valor_28),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_s_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_41),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.concesionario_pm_cc), -- centro debito
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             3, -- orden
             'Gasto Recaudo ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(s_valor_5),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_5),
             null,
             max(p.ctacon_gas), -- cuenta debito
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c), -- nit debito
             '',
             '',
             '',
             4, -- orden
             'Gasto Fondo Cobertura Conces ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             sum(p_valor_9), -- valor debito
             null, -- valor credito
             max(p.ctacon_gas), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             '',
             '',
             '',
             5, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Externo ' || ' (3.0%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, p_dispersion_concesionario p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario,
             null, -- valor debito
             sum(p_valor_9), -- valor credito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             max(f.ctacon_puente), -- cuenta debito
             max(p.sevial_pp_cc),
             '8301123291', -- nit debito
             6, -- orden
             'Gasto Sevial ' || max(indtipo) || ' Externo ' || ' (3.0%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = p.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas debito honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(s_valor_11),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             7, -- orden
             'Honorarios ' || max(indtipo) || ' Externo ' || max(c.nombre) ||
             ' (9.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debito honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_24),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             7, -- orden
             'Honorarios ' || max(indtipo) || ' Externo ' || max(c.nombre) ||
             ' (9.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debio iva honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             ROUND(sum(s_valor_11) * (max(f.iva) / 100), 2),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             8, -- orden
             'Iva Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debito iva honorarios contravencional
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             ROUND(sum(p_valor_24) * (max(f.iva) / 100), 2),
             null,
             max(f.ctacon_puente_ext),
             '0532',
             max(c.nit_c),
             '',
             '',
             '',
             8, -- orden
             'Iva Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito retefuente honorarios
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(s_valor_11) * (max(f.retencion_fuente) / 100), 2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             9, -- orden
             'Rfte Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (11%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito retefuente honorarios
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_24) * (max(f.retencion_fuente) / 100), 2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             9, -- orden
             'Rfte Honorarios ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (11%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito cuentas por pagar
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(s_valor_11) + sum(s_valor_11) * (max(f.iva) / 100) -
                   sum(s_valor_11) * (max(f.retencion_fuente) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             10, -- orden
             'CXP Operador ' || max(indtipo) || ' Externo ' ||
             max(c.nombre),
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas credito cuentas por pagar
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_24) + sum(p_valor_24) * (max(f.iva) / 100) -
                   sum(s_valor_24) * (max(f.retencion_fuente) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532',
             max(c.nit_c), -- nit credito
             10, -- orden
             'CXP Operador ' || max(indtipo) || ' Externo ' ||
             max(c.nombre),
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_pro = c.idconcesionario
       group by r.id_concesionario_liq,
                r.id_concesionario_pro,
                r.idbanco,
                r.cta_recaudo;

    -- obtener partidas debito honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             sum(p_valor_14),
             null,
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             '',
             '',
             '',
             11, -- orden
             'Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (2.7%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas debito iva honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             ROUND(sum(p_valor_14) * (max(f.iva) / 100), 2),
             null,
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             '',
             '',
             '',
             12, -- orden
             'Iva Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas credito rfte honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_14) * (max(f.retencion_fuente) / 100), 2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             13, -- orden
             'Rfte Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (11%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas credito timbre honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_14) * (max(f.impuesto_timbre_tercero) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             14, -- orden
             'Timbre Honorarios Sevial ' || max(indtipo) || ' Externo ' ||
             max(c.nombre) || ' (1.5%) ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas credito CXP honorarios sevial
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'GASTO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null,
             ROUND(sum(p_valor_14) + sum(p_valor_14) * (max(f.iva) / 100) -
                   sum(p_valor_14) * (max(f.retencion_fuente) / 100) -
                   sum(p_valor_14) * (max(f.impuesto_timbre_tercero) / 100),
                   2),
             '',
             '',
             '',
             max(f.ctacon_puente_ext),
             '0511',
             '8301123291',
             14, -- orden
             'CXP Honorarios Sevial ' || max(indtipo) || ' Externo ',
             p_usuario,
             sysdate,
             max(indtipo)
        from recaudo_externo_liquidacion r, concesionario c, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'GASTO';

    p_error := 'Causado Gasto Recuado Externo exitosamente. Registros: ' ||
               w_registros;

    sp_log(p_usuario,
           'Cuasacion Gasto Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_gas_recaudo_externo] ' || SQLERRM,
            p_error);
  END causa_gas_recaudo_externo;

  PROCEDURE causa_ing_recaudo_externo(p_fec_ini_ano number,
                                      p_fec_ini_mes number,
                                      p_fec_ini_dia number,
                                      p_fec_fin_ano number,
                                      p_fec_fin_mes number,
                                      p_fec_fin_dia number,
                                      p_usuario     varchar2,
                                      p_error       OUT VARCHAR2) as

    w_fec_cor_ini date;
    w_fec_cor_fin date;
    /*w_fecmin_cor_ini date;*/
    /*w_fecmax_cor_fin date;*/
    w_registros number;
  begin

    -- VALIDACIONES
    sp_v_usuario(p_usuario, p_error, 'pk_proc');

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_fin
      from DUAL;

    delete from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'INGRESO';

    COMMIT;

    -- obtener partidas vlr recaudo
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Externo ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             cta_recaudo_concesionario   c,
             banco                       b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and r.indtipo = c.indtipo
         and r.id_concesionario_liq = c.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr recaudo
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             sum(valor_total), -- valor debito
             null, -- valor credito
             max(c.cta_contable), -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '', -- cuenta credito
             '', -- cc credito
             '', -- nit credito
             1, -- orden
             'Ingreso Recaudo ' || max(r.indtipo) || ' Externo ' ||
             max(b.nombre),
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             cta_recaudo_concesionario   c,
             banco                       b
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.idbanco = b.idbanco
         and r.cta_recaudo = c.cuenta
         and r.idbanco = c.idbanco
         and r.indtipo = c.indtipo
         and r.id_concesionario_liq = c.idconcesionario
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_8 - s_valor_10 - s_valor_11 - s_valor_12 +
                 valor_adicional), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '29059004',
             '',
             '',
             2, -- orden
             'Ingreso Municipio Recaudo ' || max(r.indtipo) ||
             ' Externo (90%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_21 - p_valor_23 - p_valor_24 - p_valor_25 +
                 valor_adicional), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             '29059007',
             '',
             '',
             2, -- orden
             'Ingreso Municipio Recaudo ' || max(r.indtipo) ||
             ' Externo (45%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional x propietario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_11), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0532', -- centro debito
             max(c.nit_c), -- nit debito
             3, -- orden
             'Ingreso Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional x propietario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_24), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0532', -- centro debito
             max(c.nit_c), -- nit debito
             3, -- orden
             'Ingreso Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_12), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0531', -- centro debito
             '8000826650', -- nit debito
             3, -- orden
             'Ingreso FCM Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_25), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta debito
             '0531', -- centro debito
             '8000826650', -- nit debito
             3, -- orden
             'Ingreso FCM Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo (9.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(s_valor_28), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_s_cc),
             max(c.nit_c),
             4, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (6.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr neto concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_41), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.concesionario_pm_cc),
             max(c.nit_c),
             4, -- orden
             'Ingreso Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(s_valor_5), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_s_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_5), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.fondo_cob_concesionario_pm_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Fondo Concesionario Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr equilibrio economico
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(s_valor_7), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.equilibrio_economico_s_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Equilibrio Economico Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (2.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr equilibrio economico
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             r.id_concesionario_liq,
             null, -- valor debito
             sum(p_valor_7 + p_valor_10), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(p.ctacon_ing),
             max(p.equilibrio_economico_pm_cc),
             max(c.nit_c),
             5, -- orden
             'Ingreso Equilibrio Economico Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (3.77%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             concesionario               c,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and r.id_concesionario_liq = c.idconcesionario
         and r.id_concesionario_liq = p.idconcesionario
       group by r.id_concesionario_liq, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_6), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_s_cc),
             max(f.nit_fcm),
             6, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (0.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr fondo cobertura fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_6), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.fondo_cob_simit_pm_cc),
             max(f.nit_fcm),
             6, -- orden
             'Ingreso Fondo FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (0.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(s_valor_3), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_s_cc),
             max(f.nit_fcm),
             7, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (2.5%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr simit
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null, -- idconcesionario
             null, -- valor debito
             sum(p_valor_3 + p_valor_8), -- valor credito
             '', -- cuenta debito
             '', -- centro debito
             '', -- nit debito
             max(f.ctacon_ingreso),
             max(p.simit_pm_cc),
             max(f.nit_fcm),
             7, -- orden
             'Ingreso FCM Recaudo ' || max(r.indtipo) ||
             ' Externo  (3.25%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             sum(s_valor_14), -- valor debito
             null, -- valor credito
             max(f.ctacon_puente_ext), -- cuenta debito
             '', -- centro debito
             max(m.nit_m), -- nit debito
             '',
             '',
             '',
             8, -- orden
             'CXC IVA Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(m.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, municipio m
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
         and m.idmunicipio = r.idmunicipio
       group by r.idmunicipio, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x municipio
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             sum(p_valor_27), -- valor debito
             null, -- valor credito
             max(f.ctacon_puente_ext), -- cuenta debito
             '', -- centro debito
             max(m.nit_m), -- nit debito
             '',
             '',
             '',
             8, -- orden
             'CXC IVA Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(m.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, municipio m
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and m.idmunicipio = r.idmunicipio
       group by r.idmunicipio, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(s_valor_14) - round(sum(s_valor_12) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532', -- centro credito
             max(c.nit_c), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional x concesionario
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_27) - round(sum(p_valor_25) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0532', -- centro credito
             max(c.nit_c), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo ' || max(c.nombre) || ' (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f, concesionario c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and c.idconcesionario = r.id_concesionario_pro
       group by r.id_concesionario_pro, r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             round(sum(s_valor_12) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0531', -- centro credito
             max(f.nit_fcm), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo FCM (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'SIMIT'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva contravencional fcm
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             round(sum(p_valor_25) * max(f.iva) / 100, 2), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0531', -- centro credito
             max(f.nit_fcm), -- nit credito
             9, -- orden
             'IVA por Pagar Contravencional Recaudo ' || max(r.indtipo) ||
             ' Externo FCM (16%) ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 1.8 fcm cp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_13), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.fcm_cp_cc), -- centro credito
             max(f.nit_fcm), -- nit credito
             10, -- orden
             'Ingreso FCM POLCA ' || max(r.indtipo) || ' Externo 1.8% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = r.id_concesionario_liq
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 1.8 fcm cp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_12), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '', -- centro credito
             max(f.nit_polca), -- nit credito
             11, -- orden
             'Ingreso POLCA ' || max(r.indtipo) || ' Externo 39.78% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 2.7 sevial cp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_14), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.sevial_cp_cc), -- centro credito
             max(c.nit_c), -- nit credito
             12, -- orden
             'Ingreso SEVIAL POLCA ' || max(r.indtipo) || ' Externo 2.7% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr 3.0 sevial pp
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_9), -- valor credito
             '',
             '',
             '',
             max(p.ctacon_ing), -- cuenta credito
             max(p.sevial_pp_cc), -- centro credito
             max(c.nit_c), -- nit credito
             13, -- orden
             'Ingreso SEVIAL  ' || max(r.indtipo) || ' Externo 3.0% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva 2.7
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_18), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.sevial_cp_cc), -- centro credito
             max(c.nit_c), -- nit credito
             14, -- orden
             'IVA SEVIAL Recaudo  ' || max(r.indtipo) || ' Externo 2.7% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr iva 1.8
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_16), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             max(p.fcm_cp_cc), -- centro credito
             max(f.nit_fcm), -- nit credito
             15, -- orden
             'IVA FCM Recaudo  ' || max(r.indtipo) || ' Externo 1.8% ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r,
             fcm                         f,
             p_dispersion_concesionario  p,
             concesionario               c
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
         and p.idconcesionario = '03'
         and c.idconcesionario = '03'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas vlr timbre 1.8 + 2.7
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             null, -- valor debito
             sum(p_valor_17), -- valor credito
             '',
             '',
             '',
             max(f.ctacon_puente_ext), -- cuenta credito
             '0533', -- centro credito
             max(f.nit_fcm), -- nit credito
             16, -- orden
             'Timbre FCM Recaudo  ' || max(r.indtipo) ||
             ' Externo 2.7 + 1.8 % ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtener partidas debito vlr timbre 1.8 + 2.7
    insert into recaudo_externo_causacion
      (operacion,
       fec_corte_ini,
       fec_corte_fin,
       ori_idbanco,
       ori_cuenta,
       idconcesionario,
       valor_debito,
       valor_credito,
       deb_cta_con,
       deb_cen_cos,
       deb_nit_ter,
       cre_cta_con,
       cre_cen_cos,
       cre_nit_ter,
       orden,
       concepto_con,
       usuario_proceso,
       fecha_proceso,
       indtipo)
      select 'INGRESO',
             w_fec_cor_ini,
             w_fec_cor_fin,
             r.idbanco,
             r.cta_recaudo,
             null,
             sum(p_valor_17), -- valor debito
             null, -- valor credito
             max(f.ctacon_puente_ext), -- cuenta credito
             '0533', -- centro credito
             max(f.nit_fcm), -- nit credito
             '',
             '',
             '',
             17, -- orden
             'Timbre FCM Recaudo  ' || max(r.indtipo) ||
             ' Externo 2.7 + 1.8 % ',
             p_usuario,
             sysdate,
             max(r.indtipo)
        from recaudo_externo_liquidacion r, fcm f
       where r.fec_corte >= w_fec_cor_ini
         and r.fec_corte <= w_fec_cor_fin
         and r.ind_proceso = 1
         and r.indtipo = 'POLCA'
         and f.nit_fcm = '8000826650'
       group by r.idbanco, r.cta_recaudo;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_causacion
     where fec_corte_ini = w_fec_cor_ini
       and fec_corte_fin = w_fec_cor_fin
       and operacion = 'INGRESO';

    p_error := 'Causado Ingreso Recuado Externo exitosamente. Registros: ' ||
               w_registros;

    sp_log(p_usuario,
           'Cuasacion Ingreso Recaudo Externo',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || '-' ||
           p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [causa_ing_recaudo_local] ' || SQLERRM,
            p_error);
  END causa_ing_recaudo_externo;

  PROCEDURE contabiliza_recaudo_externo(p_feccor_ini_ano number,
                                        p_feccor_ini_mes number,
                                        p_feccor_ini_dia number,
                                        p_usuario        varchar2,
                                        p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_registros   number;

    w_fec_cor_ini_s char(8);
    w_concepto      varchar(250);

  BEGIN
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
      IF not P_ERROR is null THEN
        return;
      END IF;
    END IF;

    -- Obtiene fecha de cierre en formato ddMMyyyy
    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select to_char(w_fec_cor_ini, 'ddMMyyyy')
      into w_fec_cor_ini_s
      from DUAL;

    -- elimina contabilizacion
    delete recaudo_externo_contabilidad
     where fechaDoc = w_fec_cor_ini_s
       and tipoContable = 'REC';

    -- contabilizar valores de recuado simit
    -- and liquidador no sea simit capital
    -- and acuerdo de pago sea 0
    -- and valor contravencional sea 0

    w_concepto := 'REC INGRESO PART CONCESIONARIO CONCESIONARIO  6,5% (6.45%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_4 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20111' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'REC INGRESO FONDO COB CONCESIONARIO ( 0,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_5 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20112' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'REC INGRESO EQUILIBRIO ECO ( 2,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_7 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20113' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING EQUILIBRIO ECO ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'REC INGRESO FCM ( 2,5% 0R 1,05%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_3 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20113' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'REC INGRESO FONDO COB FCM ( 0,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.s_valor_6 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20114' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'NOMBRE BANCO CTA REC';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             cr.cta_contable as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             (b.nombre || ' ' || r.cta_recaudo) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PARTICIPACION MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_26,0) + ROUND(r.s_valor_19,0) + ROUND(r.s_valor_21,0) + ROUND(r.s_valor_23,0) +
             ROUND(r.s_valor_25,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha = '000';

    w_concepto := 'PARTICIPACION MUNICIPIO METROTRANSITO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_26,0) + ROUND(r.s_valor_19,0) + ROUND(r.s_valor_21,0) + ROUND(r.s_valor_23,0) +
             ROUND(r.s_valor_25,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha <> '000';

    w_concepto := 'ACUERDO PAGO MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_10) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha = '000';

    w_concepto := 'ACUERDO PAGO MUNICIPIO METROTRANSITO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (r.s_valor_10) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.validador_fecha <> '000';

    w_concepto := 'REC GASTO PART CONCESIONARIO REMO (6.5%, 6,45%))';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             c.cta_contable_liquidacion as cuenta,
             r.s_valor_4 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'REC GASTO FONDO COB CONCESIONARIO ( 0,5%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             C.CTA_CONTABLE_FONDO as cuenta,
             r.s_valor_5 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'OTRO ACREEDOR CONCESIONARIO ( 6,5% + 0,5%, 6.45%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.s_valor_4, 0) + ROUND(R.s_valor_5, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '01' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_4, 0) + ROUND(r.s_valor_5, 0) +
             ROUND(r.s_valor_7, 0) + ROUND(r.s_valor_3, 0) +
             ROUND(r.s_valor_6, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '11' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_4, 0) + ROUND(r.s_valor_5, 0) +
             ROUND(r.s_valor_7, 0) + ROUND(r.s_valor_3, 0) +
             ROUND(r.s_valor_6, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PARTICIPACION CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_9 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART CONTRAVENCIONAL ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_14 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART IVA CONTRAVENCIONAL  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PARTICIPACION CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_fcm as cuenta,
             (r.s_valor_9 - ROUND(r.s_valor_9 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_impuestos as cuenta,
             (r.s_valor_14 - ROUND(r.s_valor_14 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'CRUCE CXC A SIMIT 19% IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '1470909003' as cuenta,
             (ROUND(r.s_valor_9, 0) + ROUND(r.s_valor_14, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXC A SIMIT') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'CRUCE CXP A SIMIT';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.s_valor_9, 0) + ROUND(r.s_valor_14, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXP A SIMIT') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z002' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905901008' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'SIMIT'
         and r.ind_proceso = 0;

    w_concepto := 'REC INGRESO PART CONCESIONARIO CONCESIONARIO  3,25% (3.23%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_4 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20121' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REC INGRESO FONDO COB CONCESIONARIO ( 0,25%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_5 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20122' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REC INGRESO EQUILIBRIO ECO ( 3,77%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             (ROUND(r.p_valor_7,0) + ROUND(r.p_valor_10,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20123' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING EQUILIBRIO ECO ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REC INGRESO FCM ( 3,25% = 1.25 + 2)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             (ROUND(r.p_valor_3,0) + ROUND(r.p_valor_8,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20123' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REC INGRESO FONDO COB FCM ( 0,25%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_6 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '20124' || substr(r.id_concesionario_liq, 2, 1) as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING FONDO COB FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REC INGRESO PART CONCESIONARIO SEVIAL  3,0%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             b.cuentacontable as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '201213' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC ING PART CONCES SEVIAL 3.0%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'NOMBRE BANCO CTA REC';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             cr.cta_contable as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             (b.nombre || ' ' || r.cta_recaudo) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'OTRO ACREEDOR POLCA 39,78';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             (r.p_valor_12 - r.p_valor_18 - r.p_valor_16) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR POLCA 39,78') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_39,0) + ROUND(r.p_valor_32,0) + ROUND(r.p_valor_34,0) + ROUND(r.p_valor_36,0) +
             ROUND(r.p_valor_38,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha = '000';

    w_concepto := 'PARTICIPACION MUNICIPIO METROTRANSITO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_39,0) + ROUND(r.p_valor_32,0) + ROUND(r.p_valor_34,0) + ROUND(r.p_valor_36,0) +
             ROUND(r.p_valor_38,0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha <> '000';

    w_concepto := 'ACUERDO PAGO MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_23) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha = '000';

    w_concepto := 'ACUERDO PAGO MUNICIPIO METROTRANSITO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(mt.nit_m, 0, 9) as cuenta,
             (r.p_valor_23) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('ACUERDO PAGO MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(mt.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             municipio                      mt
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and mt.idmunicipio = '08001001'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.validador_fecha <> '000';

    w_concepto := 'REC GASTO PART CONCESIONARIO (3.25%, 3,23%))';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             c.cta_contable_liquidacion as cuenta,
             r.p_valor_4 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REC GASTO PART CONCESIONARIO sevial (3.0%))';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             c.cta_contable_liquidacion as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO PART CONCES SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CXP PART SEVIAL 3%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             r.p_valor_9 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXP PART SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REC GASTO FONDO COB CONCESIONARIO ( 0,25%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             C.CTA_CONTABLE_FONDO as cuenta,
             r.p_valor_5 as importe,
             '' as indicadorimpuesto,
             '200102' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('REC GASTO FONDO COB ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'OTRO ACREEDOR CONCESIONARIO ( 3,25% + 0,25%, 3.23% + 0%)';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(C.NIT_C, 0, 9) as cuenta,
             ROUND(R.p_valor_4, 0) + ROUND(R.p_valor_5, 0) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('OTRO ACREEDOR ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(C.NIT_C, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19 - r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901001' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION IVA 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA SEVIAL 2.7 ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901002' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION 1.8%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             '2905901003' as cuenta,
             (r.p_valor_13 - r.p_valor_16 - r.p_valor_20 - r.p_valor_19) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION FCM 1.8') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION IVA 1.8%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             '2905901004' as cuenta,
             (r.p_valor_16) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA FCM 1.8') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '01' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_4, 0) + ROUND(r.p_valor_5, 0) +
             ROUND(r.p_valor_7,0) + round(r.p_valor_10, 0) +
             ROUND(r.p_valor_3,0) + round(r.p_valor_8, 0) + ROUND(r.p_valor_6, 0) +
             ROUND(r.p_valor_9, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CXC 10% AL MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             (R.NUM_LIQUIDACION || 'A') as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '11' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (ROUND(r.p_valor_4, 0) + ROUND(r.p_valor_5, 0) +
             ROUND(r.p_valor_7,0) + round(r.p_valor_10, 0) +
             ROUND(r.p_valor_3,0) + round(r.p_valor_8, 0) + ROUND(r.p_valor_6, 0) +
             ROUND(r.p_valor_9, 0)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXC 10% AL MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '1401020102' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_22 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART CONTRAVENCIONAL ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL concesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_27 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PART IVA CONTRAVENCIONAL  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_fcm as cuenta,
             (r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PARTICIPACION IVA CONTRAVENCIONAL FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '50' as clavecontable,
             f.ctacon_impuestos as cuenta,
             (r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PARTICIPACION IVA CONTRAVENCIONAL FCM') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CRUCE CXC A SIMIT 19%+IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '1470909003' as cuenta,

             -- 9.5 + IVA +9.5 + IVA
             ROUND(ROUND(r.p_valor_22 / 2, 2), 0) +
             ROUND(ROUND(r.p_valor_27 / 2, 2), 0) +
             ROUND((r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)), 0) +
             ROUND((r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)), 0) as importe,

             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXC A SIMIT 19+iva') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CRUCE CXP A SIMIT';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,

             -- 9.5 + IVA +9.5 + IVA
             ROUND(ROUND(r.p_valor_22 / 2, 2), 0) +
             ROUND(ROUND(r.p_valor_27 / 2, 2), 0) +
             ROUND((r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)), 0) +
             ROUND((r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)), 0) as importe,

             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXP A SIMIT 19+iva') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z002' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CXC A SIMIT 2.7%+1.8 + IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '1470909002' as cuenta,

             -- 2.7 + IVA + 1.8 + IVA
             (ROUND(round(r.p_valor_14,0) + round(r.p_valor_20,0) + round(r.p_valor_19,0) -
                    round(r.p_valor_18,0),
                    0) + ROUND(r.p_valor_18, 0) +
             ROUND(round(r.p_valor_13,0) - round(r.p_valor_16,0) - round(r.p_valor_20,0) -
                    round(r.p_valor_19,0),
                    0) + ROUND(r.p_valor_16, 0)) as importe,

             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXC A SIMIT 2.7%+1.8%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CXP A SIMIT 2.7%+1.8 + IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,

             -- 2.7 + IVA + 1.8 + IVA
             (ROUND(round(r.p_valor_14,0) + round(r.p_valor_20,0) + round(r.p_valor_19,0) -
                    round(r.p_valor_18,0),
                    0) + ROUND(r.p_valor_18, 0) +
             ROUND(round(r.p_valor_13,0) - round(r.p_valor_16,0) - round(r.p_valor_20,0) -
                   round(r.p_valor_19,0),
                    0) + ROUND(r.p_valor_16, 0)) as importe,

             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CRUCE CXP A SIMIT 2.7%+1.8%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z002' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'GASTOS SEVIAL 2.7%+IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZE' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '5111110112' as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19) as importe,
             'V5' as indicadorimpuesto,
             '100761' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('GASTOS SEVIAL 2,7%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'CXP SEVIAL 2.7%+IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZE' as clasedoc,
             'FCM1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'S' as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19) as importe,
             'V5' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('CXP SEVIAL 2,7%+IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_corte, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_corte, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_corte, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('REC ' || to_char(r.fec_corte, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '31' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             r.valor_total as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_corte, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('RECAUDO NO DISTRIBUIDO MUNICIPIO SIMIT') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905901008' as cuentadivergente,
             to_char(r.fec_corte, 'ddMMyyyy') as fechabase,
             'Z000' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_corte = w_fec_cor_ini
         and r.indTipo = 'POLCA'
         and r.ind_proceso = 0;

    delete recaudo_externo_contabilidad r
     where r.importe = 0
       and r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'REC';

    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'REC';

    w_concepto := 'AJUSTE PESOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             (case
               when a.importe > 0 then
                '50'
               else
                '40'
             end) as clavecontable,
             (case
               when a.importe > 0 then
                '4810900202'
               else
                '5810900202'
             end) as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from fcm f,
             (select c.referencia,
                     max(c.textocabezera) as textocabezera,
                     max(c.asignacion) as asignacion,
                     sum(case c.clavecontable
                           when '40' then
                            c.importe
                           when '01' then
                            c.importe
                           when '21' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'PFC1'
                 and tipocontable = 'REC'
               group by c.referencia) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;

    w_concepto := 'AJUSTE PESOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZT' as clasedoc,
             'FCM1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             (case
               when a.importe > 0 then
                '50'
               else
                '40'
             end) as clavecontable,
             (case
               when a.importe > 0 then
                '4810900202'
               else
                '5810900202'
             end) as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'REC' as tipocontable
        from fcm f,
             (select c.referencia,
                     max(c.textocabezera) as textocabezera,
                     max(c.asignacion) as asignacion,
                     sum(case c.clavecontable
                           when '40' then
                            c.importe
                           when '01' then
                            c.importe
                           when '21' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'FCM1'
                 and tipocontable = 'REC'
               group by c.referencia) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;

    commit;

    sp_log(p_usuario,
           'Contabiliza Recaudo Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_recaudo_externo] ' || SQLERRM,
            p_error);

  END contabiliza_recaudo_externo;

  PROCEDURE contabiliza_pago_externo(p_feccor_ini_ano number,
                                     p_feccor_ini_mes number,
                                     p_feccor_ini_dia number,
                                     p_usuario        varchar2,
                                     p_error          OUT VARCHAR2) AS
    w_fec_cor_ini date;
    w_registros   number;

    w_fec_cor_ini_s char(8);
    w_concepto      varchar(250);
    aaaa0115        char(8);

  BEGIN
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
      IF not P_ERROR is null THEN
        return;
      END IF;
    END IF;

    aaaa0115 := '1501' || trim(to_char(p_feccor_ini_ano + 1));

    -- Obtiene fecha de cierre en formato ddMMyyyy
    select TO_DATE(p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
                   p_feccor_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_cor_ini
      from DUAL;

    select to_char(w_fec_cor_ini, 'ddMMyyyy')
      into w_fec_cor_ini_s
      from DUAL;

    -- elimina contabilizacion
    delete recaudo_externo_contabilidad
     where fechaDoc = w_fec_cor_ini_s
       and tipoContable = 'PAG';

    w_concepto := 'PAGO PARTICIPACION MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_26) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.nit_municipio, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO PARTICIPACION TERCERO 1';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_19) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO1, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO PARTICIPACION TERCERO 2';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_21) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO2, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO PARTICIPACION TERCERO 3';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_23) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO3, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO PARTICIPACION TERCERO 4';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.s_valor_25) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO4, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO CONTRAV CONCES nomConsecionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_9 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO IVA CONTRAV CONCES nomConsecionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.s_valor_14 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO CONTRAV FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901006' as cuenta,
             (r.s_valor_9 - ROUND(r.s_valor_9 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO IVA CONTRAV FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901010' as cuenta,
             (r.s_valor_14 - ROUND(r.s_valor_14 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO PARTICIPACION MUNICIPIO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_39) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION MUNICIPIO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.nit_municipio, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION TERCERO 1';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_32) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO1, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION TERCERO 2';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_34) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO2, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION TERCERO 3';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_36) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO3, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION TERCERO 4';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(m.nit_m, 0, 9) as cuenta,
             (r.p_valor_38) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION TERCERO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '2905900701' as cuentadivergente,
             to_char(r.Fec_Dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_TERCERO4, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO POLCA 39_78';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_polca, 0, 9) as cuenta,
             (r.p_valor_12 - r.p_valor_18 - r.p_valor_16) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO POLCA') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION SEVIAL 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_14 + r.p_valor_20 + r.p_valor_19 - r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION SEVIAL 2.7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901001' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION SEVIAL IVA 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_18) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION SEVIAL IVA 2.7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '2905901002' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION FCM 1.8%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901003' as cuenta,
             (r.p_valor_13 - r.p_valor_16 - r.p_valor_20 - r.p_valor_19) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION FCM 1.8%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PARTICIPACION FCM IVA 1.8%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901004' as cuenta,
             (r.p_valor_16) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION FCM IVA 1.8%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO CONTRAV CONCES nomConsecionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_22 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901005' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO IVA CONTRAV CONCES nomConsecionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             ROUND(r.p_valor_27 / 2, 2) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '2905901009' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIOZON, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_pro = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO CONTRAV FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901006' as cuenta,
             (r.p_valor_22 - ROUND(r.p_valor_22 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO IVA CONTRAV FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '40' as clavecontable,
             '2905901010' as cuenta,
             (r.p_valor_27 - ROUND(r.p_valor_27 / 2, 2)) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO IVA CONTRAV FCM ') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(f.nit_fcm, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and f.nit_fcm = '8000826650'
         and r.indTipo = 'POLCA';

    w_concepto := 'REG CTA PTE PAS DISP BCOAVVILLAS Y BANCAFE';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901012' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and (textocabezera like '% 086%' or
                     textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;

    w_concepto := 'REG CTA PTE PAS DISP BCO OTROS BANCOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901013' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and not (textocabezera like '% 086%' or
                      textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;

    w_concepto := 'PAGO PART CONCES nomConcesioanrio';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.s_valor_4) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO PART FONDO CONCES nomConcesioanrio';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.s_valor_5) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART FONDO CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'SIMIT';

    w_concepto := 'PAGO PARTICIPACION SEVIAL 3%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.Fec_Dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.Fec_Dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             (r.p_valor_9) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PARTICIPACION SEVIAL 3%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.Fec_Dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr,
             fcm                            f
       where r.idbanco = b.idbanco
         and f.nit_fcm = '8000826650'
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.Fec_Dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PART CONCES nomConcesioanrio';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.p_valor_4) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_CONCESIONARIO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'PAGO PART FONDO CONCES nomConcesioanrio';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechacontable,
             to_char(r.fec_dispersion_con, 'MM') as periodo,
             'COP' as moneda,
             R.NUM_LIQUIDACION || 'G' as referencia,
             ('PAG ' || to_char(r.fec_dispersion_con, 'ddMMyyyy') || ' ' ||
             R.CTA_RECAUDO) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             (r.p_valor_5) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechavalor,
             R.IDMUNICIPIO AS asignacion,
             ('PAGO PART FONDO CONCES ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(r.fec_dispersion_con, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(r.NIT_FONDO, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from vw_recaudo_externo_liquidacion r,
             banco                          b,
             municipio                      m,
             concesionario                  c,
             cta_recaudo_concesionario      cr
       where r.idbanco = b.idbanco
         and r.idmunicipio = m.idmunicipio
         and r.id_concesionario_liq = c.idconcesionario
         and r.cta_recaudo = cr.cuenta
         and r.idbanco = cr.idbanco
         and r.indtipo = cr.indtipo
         and r.id_concesionario_liq = cr.idconcesionario
         and r.fec_dispersion_con = w_fec_cor_ini
         and r.indTipo = 'POLCA';

    w_concepto := 'REG CTA PTE PAS DISP BCO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901012' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and instr(referencia, 'G') > 0
                 and (textocabezera like '% 086%' or
                     textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;

    w_concepto := 'REG CTA PTE PAS DISP BCO OTROS BANCOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '50' as clavecontable,
             '2905901013' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             a.asignacion AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     max(asignacion) as asignacion,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and instr(referencia, 'G') > 0
                 and not (textocabezera like '% 086%' or
                      textocabezera like '% 186%')
               group by referencia, textocabezera) a,
             fcm f;

    -- Contabiliza pago realizado por el banco

    w_concepto := 'divipo MUNICIPIO nombre';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             d.IDMUNICIPIO AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(m.nit_m, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden = 1) d,
             municipio m,
             cta_recaudo_concesionario ct
       where d.idmunicipio = m.idmunicipio
         and d.id_concesionario_liq = ct.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'terceros';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(d.des_nit, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(d.des_nit, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (2, 3, 4)) d,
             cta_recaudo_concesionario ct
       where d.id_concesionario_liq = ct.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'pago concesioanrio';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (7)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'pago fond concesioanrio';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (8)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'pago concesioanrio ZONAL';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (13)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_pro = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'pago FCM contravencional';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (14)) d,
             cta_recaudo_concesionario ct,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and f.nit_fcm = '8000826650'
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'Liquidacion POLCA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_polca, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_polca, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (12)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';

    w_concepto := 'POLCA SEVIAL';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (10)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';

    w_concepto := 'Impuestos FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (9)
                 and concepto = 'Impuestos FCM') d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';

    w_concepto := 'Polca FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (11)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta
         and f.nit_fcm = '8000826650';

    w_concepto := 'pago equlibrio economico';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (9)
                 and concepto <> 'Impuestos FCM') d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'pago equlibrio economico';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '01' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             s.valor * -1 as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('CXC EQUILIBRIO ECONOMICO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '1470901501' as cuentadivergente,
             '08102015' as fechabase,
             'Z000' as condicionpago,
             substr(s.nitPago, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(s_valor_7 + p_valor_7 + p_valor_10) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.id_concesionario_liq = 5
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';

    w_concepto := 'REG CTA PTE PAS DISP BCO avvillas-bancafe';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '40' as clavecontable,
             '2905901012' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and textocabezera like 'BAN PAG%'
                 and not
                      cuenta in
                      ('1110063202', '1110063402', '1110063802', '1110063902')
               group by referencia, textocabezera) a,
             fcm f;

    w_concepto := 'REG CTA PTE PAS DISP BCO otros bancos';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             a.referencia as referencia,
             a.textocabezera as textocabezera,
             '40' as clavecontable,
             '2905901013' as cuenta,
             a.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('REG CTA PTE PAS DISP BCO') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(round(importe, 0)) as valor,
                     referencia,
                     textocabezera
                from recaudo_externo_contabilidad
               where fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and tipocontable = 'PAG'
                 and textocabezera like 'BAN PAG%'
                 and cuenta in
                     ('1110063202', '1110063402', '1110063802', '1110063902')
               group by referencia, textocabezera) a,
             fcm f;

    update recaudo_externo_contabilidad
       set importe = importe * -1
     where importe < 0;

    w_concepto := 'pago fond fcm';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (6)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'pago fond fcm';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '01' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             aaaa0115 as fechabase,
             'Z000' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (6)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'TRANSFERENCIA LIQUIDACION FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (5)) d,
             cta_recaudo_concesionario ct,
             concesionario c,
             fcm f
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'TRANSFERENCIA LIQUIDACION FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_s as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (5)) d,
             cta_dispersion_fcm ct,
             concesionario c,
             fcm f
       where ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco
         and d.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';

    w_concepto := 'TRANSFERENCIA MUN ACUERDO PAGO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             ct.cta_contable_ing as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             d.IDMUNICIPIO AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden = 15) d,
             municipio m,
             cta_recaudo_concesionario ct,
             fcm f
       where d.idmunicipio = m.idmunicipio
         and f.nit_fcm = '8000826650'
         and d.id_concesionario_liq = ct.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'TRANSFERENCIA MUN ACUERDO PAGO';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_ac as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             d.IDMUNICIPIO AS asignacion,
             substr(d.concepto, 0, 50) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden = 15) d,
             municipio m,
             cta_dispersion_fcm ct,
             fcm f
       where d.idmunicipio = m.idmunicipio
         and f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco;

    w_concepto := 'RETE FTE CONTRAV nomConcesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '50' as clavecontable,
             '2905901011' as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('RETE FTE CONTRAV  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.s_valor_16 + r.p_valor_29) as valor,
                     r.id_concesionario_pro as id_concesionario_pro,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
               group by r.id_concesionario_pro, r.cta_recaudo) s,
             concesionario c
       where s.id_concesionario_pro = c.idconcesionario;

    w_concepto := 'RETE FTE CONTRAV nomConcesionario';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             '2905901011' as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('PAG RETE FTE CONTRAV  ' || c.nombre) AS textocabezera2,
             'SIMIT' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.s_valor_16 + r.p_valor_29) as valor,
                     r.id_concesionario_pro as id_concesionario_pro,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
               group by r.id_concesionario_pro, r.cta_recaudo) s,
             concesionario c
       where s.id_concesionario_pro = c.idconcesionario;

    w_concepto := 'RETENCIONES DE SEVIAL DEL 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '50' as clavecontable,
             '2905901007' as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             ('RETENCIONES DE SEVIAL DEL 2,7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_20 + r.p_valor_19) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';

    w_concepto := 'RETENCIONES DE SEVIAL DEL 2.7%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             '2905901007' as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             ('PAG RETENCIONES DE SEVIAL DEL 2,7%') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_20 + r.p_valor_19) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';

    w_concepto := 'CRUCE CXC A SIMIT 2,7% + 1,8% + IVA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '50' as clavecontable,
             '1470909002' as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('CRUCE CXC A SIMIT 2,7% + 1,8% + IVA') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_14 + r.p_valor_13) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';

    w_concepto := 'VALOR CXC SIMIT CAPITAL';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '01' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             ('VALOR CXC SIMIT CAPITAL') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             '08102015' as fechabase,
             'Z000' as condicionpago,
             substr(s.nitPago, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_13 - r.p_valor_16 - r.p_valor_20 -
                         r.p_valor_19) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.id_concesionario_liq = '05'
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';

    w_concepto := 'VALOR SEVIAL 2,7 CON IMPUESTOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '21' as clavecontable,
             substr(f.nit_sevial, 0, 9) as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_sevial, 0, 9) AS asignacion,
             ('VALOR SEVIAL 2,7 CON IMPUESTOS') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_sevial, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_14) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650';

    w_concepto := 'TRANF FCM REC POLCA';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_pa as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('TRANF FCM REC POLCA 1.8 CON IMPUESTOS') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_13) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago,
                     max(r.idbanco) as idbanco
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.id_concesionario_liq <> '05'
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f,
             cta_dispersion_fcm ct
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = s.idbanco;

    w_concepto := 'TRANF FCM REC POLCA  Impuestos FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(s.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(s.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(s.fec_dispersion, 'ddMMyyyy') as referencia,
             ('BAN PAG ' || to_char(s.fec_dispersion, 'ddMMyyyy')) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_pa as cuenta,
             s.valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(s.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('TRANF FCM REC POLCA  Impuestos FCM') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select sum(r.p_valor_13 - r.p_valor_15) as valor,
                     r.id_concesionario_liq as id_concesionario_liq,
                     r.cta_recaudo as cta_recaudo,
                     max(r.fec_dispersion_con) as fec_dispersion,
                     max(r.nit_concesionario) as nitPago,
                     max(r.idbanco) as idbanco
                from vw_recaudo_externo_liquidacion r
               where r.fec_dispersion_con = w_fec_cor_ini
                 and r.id_concesionario_liq = '05'
               group by r.id_concesionario_liq, r.cta_recaudo) s,
             concesionario c,
             fcm f,
             cta_dispersion_fcm ct
       where s.id_concesionario_liq = c.idconcesionario
         and f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = s.idbanco;

    ---

    w_concepto := 'ANT OPER PART CONTRAV';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '21' as clavecontable,
             substr(c.nit_c, 0, 9) as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(c.nit_c, 0, 9) AS asignacion,
             substr('PAG OPER PART CONTRAV' || c.nombre, 0, 9) AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(c.nit_c, 0, 9) as nittercero,
             '' as cuentadivergente,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (13)) d,
             cta_recaudo_concesionario ct,
             concesionario c
       where d.id_concesionario_liq = ct.idconcesionario
         and d.id_concesionario_pro = c.idconcesionario
         and d.ori_idbanco = ct.idbanco
         and d.indtipo = ct.indtipo
         and d.ori_cuenta = ct.cuenta;

    w_concepto := 'TRANF CONTRAV PART FCM';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '40' as clavecontable,
             ct.cta_con_pa as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             'TRANF CONTRAV PART FCM' AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (14)) d,
             cta_dispersion_fcm ct,
             fcm f
       where f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco;

    w_concepto := 'CRUCE CXC SIMIT CONTRAVENCIONA 22,04%';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)

      select to_char(d.fec_dispersion, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechacontable,
             to_char(d.fec_dispersion, 'MM') as periodo,
             'COP' as moneda,
             to_char(d.fec_dispersion, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(d.fec_dispersion, 'ddMMyyyy'),
                    0,
                    25) as textocabezera,
             '50' as clavecontable,
             '1470909003' as cuenta,
             valor as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(d.fec_dispersion, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             'CRUCE CXC SIMIT CONTRAVENCIONA 22,04%' AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             substr(d.des_nit, 0, 9) as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from (select fec_corte_ini,
                     fec_corte_fin,
                     fec_dispersion,
                     id_concesionario_liq,
                     orden,
                     concepto,
                     ori_idbanco,
                     ori_tipocuenta,
                     ori_cuenta,
                     ori_nit,
                     des_idbanco,
                     des_tipocuenta,
                     des_cuenta,
                     des_nit,
                     indtipo,
                     usuario_proceso,
                     fecha_proceso,
                     valor,
                     deb_cta_con,
                     deb_cen_cos,
                     deb_nit_ter,
                     cre_cta_con,
                     cre_cen_cos,
                     cre_nit_ter,
                     concepto_con,
                     id_concesionario_pro,
                     idmunicipio,
                     referenciatrf,
                     enviadobanco
                from vw_recaudo_externo_disp_tot
               where fec_dispersion = w_fec_cor_ini
                 and orden in (13, 14)) d,
             cta_dispersion_fcm ct,
             fcm f
       where f.nit_fcm = '8000826650'
         and ct.nit_fcm = '8000826650'
         and ct.idbancorec = d.ori_idbanco;

    delete recaudo_externo_contabilidad r
     where r.importe = 0
       and r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'PAG';

    update recaudo_externo_contabilidad r
       set r.importe = ROUND(r.importe, 0)
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'PAG';

    update recaudo_externo_contabilidad r
       set r.receptoralternativo = ''
     where r.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
       and tipocontable = 'PAG'
       and substr(r.nittercero, 0, 9) = substr(r.receptoralternativo, 0, 9);

    w_concepto := 'AJUSTE PESOS DETALLE';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe < 0 then
                '50'
               else
                '40'
             end) as clavecontable,
             (case
               when a.importe < 0 then
                '4810900202'
               else
                '5810900202'
             end) as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from fcm f,
             (select max(c.textocabezera) as textocabezera,
                     sum(case c.clavecontable
                           when '40' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'PFC1'
                 and c.tipocontable = 'PAG'
                 and c.cuenta = '2905901012') a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;

    w_concepto := 'AJUSTE PESOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe < 0 then
                '40'
               else
                '50'
             end) as clavecontable,
             '2905901012' as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from fcm f,
             (select max(c.textocabezera) as textocabezera,
                     sum(case c.clavecontable
                           when '40' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'PFC1'
                 and c.tipocontable = 'PAG'
                 and c.cuenta = '2905901012') a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;

---
    w_concepto := 'AJUSTE PESOS OTROS BANCOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe < 0 then
                '50'
               else
                '40'
             end) as clavecontable,
             (case
               when a.importe < 0 then
                '4810900202'
               else
                '5810900202'
             end) as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from fcm f,
             (select max(c.textocabezera) as textocabezera,
                     sum(case c.clavecontable
                           when '40' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'PFC1'
                 and c.tipocontable = 'PAG'
                 and c.cuenta = '2905901013') a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;

    w_concepto := 'AJUSTE PESOS OTROS BANCOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'PFC1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe < 0 then
                '40'
               else
                '50'
             end) as clavecontable,
             '2905901013' as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'SIMIT' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from fcm f,
             (select max(c.textocabezera) as textocabezera,
                     sum(case c.clavecontable
                           when '40' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'PFC1'
                 and c.tipocontable = 'PAG'
                 and c.cuenta = '2905901013') a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;

--

    w_concepto := 'AJUSTE PESOS';
    insert into recaudo_externo_contabilidad
      (fechadoc,
       clasedoc,
       sociedad,
       fechacontable,
       periodo,
       moneda,
       referencia,
       textocabezera,
       clavecontable,
       cuenta,
       importe,
       indicadorimpuesto,
       centrocosto,
       centrobeneficio,
       fechavalor,
       asignacion,
       textocabezera2,
       segmento,
       nittercero,
       cuentadivergente,
       fechabase,
       condicionpago,
       receptoralternativo,
       fechageneracion,
       idperson,
       tipocontable)
      select to_char(w_fec_cor_ini, 'ddMMyyyy') as fechadoc,
             'ZD' as clasedoc,
             'FCM1' as sociedad,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechacontable,
             to_char(w_fec_cor_ini, 'MM') as periodo,
             'COP' as moneda,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as referencia,
             substr('BAN PAG ' || to_char(w_fec_cor_ini, 'ddMMyyyy'), 0, 25) as textocabezera,
             (case
               when a.importe > 0 then
                '50'
               else
                '40'
             end) as clavecontable,
             '1470901106' as cuenta,
             (case
               when a.importe > 0 then
                a.importe
               else
                a.importe * -1
             end) as importe,
             '' as indicadorimpuesto,
             '' as centrocosto,
             '' as centrobeneficio,
             to_char(w_fec_cor_ini, 'ddMMyyyy') as fechavalor,
             substr(f.nit_fcm, 0, 9) AS asignacion,
             ('AJUSTE PESOS') AS textocabezera2,
             'RECURSOPRO' AS segmento,
             substr(f.nit_fcm, 0, 9) as nittercero,
             '' as cuentadivergente,
             '' as fechabase,
             '' as condicionpago,
             '' as receptoralternativo,
             sysdate as fechageneracion,
             to_number(p_usuario) as idperson,
             'PAG' as tipocontable
        from fcm f,
             (select sum(case c.clavecontable
                           when '40' then
                            c.importe
                           when '01' then
                            c.importe
                           when '21' then
                            c.importe
                           else
                            c.importe * -1
                         end) as importe
                from recaudo_externo_contabilidad c
               where c.fechadoc = to_char(w_fec_cor_ini, 'ddMMyyyy')
                 and c.sociedad = 'FCM1'
                 and tipocontable = 'PAG'
               group by c.referencia) a
       where f.nit_fcm = '8000826650'
         and a.importe <> 0;

    commit;

    delete from recaudo_externo_contabilidad r
     where to_char(to_date(r.fechadoc, 'ddMMyyyy'), 'yyyyMMdd') <=
           to_char(w_fec_cor_ini - 90, 'yyyyMMdd');

    commit;

    sp_log(p_usuario,
           'Contabiliza Pago Rec Externo',
           p_feccor_ini_ano || '-' || p_feccor_ini_mes || '-' ||
           p_feccor_ini_dia);

    commit;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [contabiliza_pago_externo] ' || SQLERRM,
            p_error);

  END contabiliza_pago_externo;

  PROCEDURE generarArchivoAvvillas(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);

    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;

    longitud number;

    CURSOR tabla IS
      select fec_dispersion,
             id_concesionario_liq,
             orden,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             desencriptar(des_cuenta) as des_cuenta,
             des_nit,
             indtipo,
             valor,
             idmunicipio,
             referenciatrf
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '52';

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    archivo  := utl_file.fopen('TRFAVVILLAS',
                               'CNJ650D.TRANSFER.' || aaaammdd || '.TXT',
                               'W');
    numreg   := 1;
    vlrTotal := 0;

    for registro in tabla loop
      cadena := '1'; -- tipo registro
      cadena := cadena || aaaammdd; -- fecha generacion

      strValor := trim(to_char(numreg, '00000000'));
      cadena   := cadena || strValor; -- numero registro

      strValor := trim(to_char(registro.referenciatrf, '0000000000000000'));

      cadena := cadena || strValor;
      cadena := cadena || '0' || registro.ori_idbanco; -- banco origen

      if (registro.ori_tipocuenta = 'AHO') then
        cadena := cadena || '1'; -- tipo cuenta origen
      end if;

      if (registro.ori_tipocuenta = 'CTE') then
        cadena := cadena || '2'; -- tipo cuenta origen
      end if;

      cadena := cadena || '0000000' || registro.ori_cuenta; -- cuenta origen

      strValor := trim(to_char(registro.valor * 100, '000000000000000000'));
      cadena   := cadena || strValor; -- valor

      cadena := cadena || '0' || registro.des_idbanco; -- banco destino

      if (registro.des_tipocuenta = 'AHO') then
        cadena := cadena || '1'; -- tipo cuenta destino
      end if;

      if (registro.des_tipocuenta = 'CTE') then
        cadena := cadena || '2'; -- tipo cuenta destino
      end if;

      cadena := cadena || registro.des_cuenta; -- cuenta destino

      longitud := LENGTH(registro.des_cuenta);
      longitud := 16 - longitud;

      if (longitud > 0) then
        for idx in 1 .. longitud loop
          cadena := cadena || ' ';
        end loop;
      end if;

      cadena := cadena || 'N'; -- tipo identificacion destino
      cadena := cadena || '000000' || registro.des_nit; -- identificacion destino

      -- mensaje respuesta
      for idx in 1 .. 100 loop
        cadena := cadena || ' ';
      end loop;

      cadena := cadena || '999'; -- codigo respuesta

      longitud := LENGTH(cadena);
      longitud := 250 - longitud;

      -- filler
      for idx in 1 .. longitud loop
        cadena := cadena || '0';
      end loop;

      utl_file.put_line(archivo, cadena, true);
      numreg   := numreg + 1;
      vlrTotal := vlrTotal + registro.valor;
    end loop;

    cadena := '9'; -- tipo registro
    cadena := cadena || aaaammdd; -- fecha generacion

    strValor := trim(to_char(numreg - 1, '00000000'));
    cadena   := cadena || strValor; -- numero registro

    strValor := trim(to_char(vlrTotal * 100, '000000000000000000'));
    cadena   := cadena || strValor; -- valor

    longitud := LENGTH(cadena);
    longitud := 250 - longitud;

    -- filler
    for idx in 1 .. longitud loop
      cadena := cadena || '0';
    end loop;

    utl_file.put_line(archivo, cadena, true);

    utl_file.fclose(archivo);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoAvvillas;

  PROCEDURE generarArchivoDavivienda(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);

    cadena   varchar(170);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
    numTotal number;

    longitud number;

    CURSOR cuentas is
      select max(tipocuenta) as tipocuenta, cuenta
        from cta_recaudo_concesionario t
       where idbanco = '50'
         AND CUENTA NOT IN ('186992848', '186992830')
       group by cuenta;

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '50'
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion = p_fecha
         and ori_idbanco = '50'
         and ori_cuenta = cta.cuenta;

      archivo := utl_file.fopen('TRFDAVIVIENDA',
                                cta.cuenta || '_' || aaaammdd || '.TXT',
                                'W');

      --crear header
      cadena := 'RC'; -- tipo reg
      cadena := cadena || '000000' || '8000826650'; --nit empresa
      cadena := cadena || '0000'; --codigo-servicio
      cadena := cadena || '0000'; --codigo-subservicio

      strValor := trim(to_char(to_number(cta.cuenta), '0000000000000000'));
      cadena   := cadena || strValor;

      -- tipo cuenta origen
      if (cta.tipocuenta = 'AHO') then
        cadena := cadena || 'CA';
      end if;

      if (cta.tipocuenta = 'CTE') then
        cadena := cadena || 'CC';
      end if;

      -- banco origen
      cadena := cadena || '000050';

      -- valor
      if (vlrTotal is null) then
        vlrTotal := 0;
      end if;

      strValor := trim(to_char(vlrTotal * 100, '000000000000000000'));
      cadena   := cadena || strValor; -- valor

      -- numero registro
      strValor := trim(to_char(numTotal, '000000'));
      cadena   := cadena || strValor; -- valor

      cadena := cadena || aaaammdd; -- fecha proceso

      cadena := cadena || '000000'; -- hora proceso
      cadena := cadena || '0000'; -- codigo-operador
      cadena := cadena || '9999'; -- respuesta-proceso

      cadena := cadena || aaaammdd; -- fech-generacion
      cadena := cadena || '000000'; -- hora generacion
      cadena := cadena || '00'; -- ind-inscripcion
      cadena := cadena || '00'; -- tipo-identificacion
      cadena := cadena || '000000000000'; -- numero-cliente
      cadena := cadena || '0000'; -- oficina-rec-emp
      cadena := cadena || '0000'; -- actu-co
      cadena := cadena || '0'; -- ind-encripcion
      cadena := cadena || '01'; -- long-arch-s
      cadena := cadena || '0000000000000000'; -- cta-empresa-abono
      cadena := cadena || '000000'; -- talon-abono
      cadena := cadena || '00000000000'; -- filler

      utl_file.put_line(archivo, cadena, true);
      for reg in (select fec_dispersion,
                         id_concesionario_liq,
                         orden,
                         concepto,
                         ori_idbanco,
                         ori_tipocuenta,
                         ori_cuenta,
                         ori_nit,
                         des_idbanco,
                         des_tipocuenta,
                         desencriptar(des_cuenta) as des_cuenta,
                         des_nit,
                         indtipo,
                         valor,
                         idmunicipio,
                         referenciatrf
                    from recaudo_externo_disp_tot
                   where fec_dispersion = p_fecha
                     and ori_idbanco = '50'
                     and ori_cuenta = cta.cuenta)

       loop
        cadena := '55000000' || reg.des_nit; -- tipo registro

        -- nro referencia
        strValor := trim(to_char(reg.referenciatrf, '0000000000000000'));
        cadena   := cadena || strValor;

        -- cuenta destino
        strValor := trim(to_char(to_number(reg.des_cuenta),
                                 '0000000000000000'));
        cadena   := cadena || strValor;

        -- tipo cuenta destino
        if (reg.des_tipocuenta = 'AHO') then
          cadena := cadena || 'CA';
        end if;

        if (reg.des_tipocuenta = 'CTE') then
          cadena := cadena || 'CC';
        end if;

        cadena := cadena || '0000' || reg.des_idbanco; --banco destino

        strValor := trim(to_char(reg.valor * 100, '000000000000000000'));
        cadena   := cadena || strValor; -- valor

        cadena := cadena || '000000'; -- numero talon
        cadena := cadena || '03'; -- tipo ide destino
        cadena := cadena || '0'; -- valide ide
        cadena := cadena || '9999'; -- respuesta traslado
        cadena := cadena || '0000000000000000000000000000000000000000'; --mensaje
        cadena := cadena || '000000000000000000'; -- valor acumulado
        cadena := cadena || aaaammdd; --fecha a
        cadena := cadena || '0000'; -- oficina-rec-det
        cadena := cadena || '0000'; -- motivo-det
        cadena := cadena || '0000'; -- nvo-indalt-tarj
        cadena := cadena || '0'; -- indic-emerg
        cadena := cadena || '00'; -- indic-emerg

        utl_file.put_line(archivo, cadena, true);

      end loop;

      utl_file.fclose(archivo);
    end loop;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoDavivienda;

  PROCEDURE envio_Banco(p_fec_ini_ano number,
                        p_fec_ini_mes number,
                        p_fec_ini_dia number,
                        p_idbanco     varchar2,
                        p_usuario     varchar2,
                        p_error       OUT VARCHAR2,
                        p_log         out varchar2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);
    p_fecha     date;

    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;

    longitud number;

  begin

    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into p_fecha
      from DUAL;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_corte_ini = p_fecha
       and enviadobanco = 1
       and ori_idbanco = p_idbanco;

    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. ARCHIVOS YA ENVIADOS A BANCO. SOLICITAR AUTORIZACION';
      -- ver log envio
      if p_idbanco = '52' then
        verLogEnvioAvvillas(p_log);
      end if;
      if p_idbanco = '50' then
        verLogEnvioDavivienda(p_log);
      end if;

      RETURN;
    END IF;

    if p_idbanco = '52' then
      -- generar archivo transferencia avvillas
      generarArchivoAvvillas(p_fecha, p_usuario, p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia davivienda
      ejecutarScriptAvvillas(p_fecha, p_usuario, p_error);

      IF not P_ERROR is null THEN
        p_error := 'Error en script avvillas codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioAvvillas(p_log);
        return;
      END IF;
      -- ver log envio
      verLogEnvioAvvillas(p_log);

      if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Avvillas. Fallo FTP:Login failed';
        return;
      end if;

    end if;

    if p_idbanco = '50' then

      -- generar archivo transferencia avvillas
      generarArchivoDavivienda(p_fecha, p_usuario, p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia davivienda
      ejecutarScriptDavivienda(p_fecha, p_usuario, p_error);

      IF not P_ERROR is null THEN
        p_error := 'Error en script Davivienda codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioDavivienda(p_log);
        return;
      END IF;

      -- ver log envio
      verLogEnvioDavivienda(p_log);

      if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Davivienda. Fallo FTP:Login failed';
        return;
      end if;

    end if;

    update recaudo_externo_disp_tot
       set enviadobanco = 1
     where fec_corte_ini = p_fecha
       and ori_idbanco = p_idbanco;

    commit;

    p_error := 'Archivos enviados a banco OK';

    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_corte_ini = p_fecha
       and ori_idbanco = p_idbanco;

    IF w_registros = 0 THEN
      p_error := p_error ||
                 '.ADVERTENCIA: NO HAY TRANSFERENCIAS PROGRAMADASPARA LA FECHA DADA';
      RETURN;
    END IF;

    sp_log(p_usuario,
           'envio_Banco',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [envio_Banco] ' || SQLERRM, p_error);

  end envio_Banco;

  PROCEDURE generarScriptAvvillas(p_fecha   date,
                                  p_usuario varchar2,
                                  p_error   OUT VARCHAR2) as
    archivo  utl_file.file_type;
    aaaammdd varchar(8);
    cadena   varchar(250);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    archivo := utl_file.fopen('TRFAVVILLAS', 'envioAvvillas.xx', 'W');

    cadena := 'gpg --batch --encrypt-files -r simitpruebas ' ||
              'CNJ650D.TRANSFER.' || aaaammdd || '.TXT';

    cadena := cadena || ' > logEnvioAvvillas.txt';

    utl_file.put_line(archivo, cadena, true);

    utl_file.fclose(archivo);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarScriptAvvillas] ' || SQLERRM,
            p_error);

  end generarScriptAvvillas;

  PROCEDURE generarScriptDavivienda(p_fecha   date,
                                    p_usuario varchar2,
                                    p_error   OUT VARCHAR2) as
    archivo  utl_file.file_type;
    aaaammdd varchar(8);
    cadena   varchar(250);

    CURSOR cuentas is
      select max(tipocuenta) as tipocuenta, cuenta
        from cta_recaudo_concesionario t
       where idbanco = '50'
       group by cuenta;
    --AND CUENTA NOT IN ('186992848','186992830'); ctascon recaudo especial

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    archivo := utl_file.fopen('TRFDAVIVIENDA', 'envioDavivienda.sh', 'W');

    for cta in cuentas loop

      cadena := 'gpg --batch --encrypt-files -r simitpruebas ' ||
                cta.cuenta || '_' || aaaammdd || '.TXT';

      utl_file.put_line(archivo, cadena, true);
    end loop;

    utl_file.fclose(archivo);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarScriptAvvillas] ' || SQLERRM,
            p_error);

  end generarScriptDavivienda;

  PROCEDURE ejecutarScriptAvvillas(p_fecha   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2) as
    aaaammdd varchar(8);
    comando  varchar(250);
    salida   varchar(250);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    comando := '/bin/sh /trfavvillas/envioAvvillas.sh ' || aaaammdd;

    salida := Shell_Run(comando);

    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarScriptAvvillas] ' || SQLERRM,
            p_error);

  end ejecutarScriptAvvillas;

  PROCEDURE ejecutarScriptDavivienda(p_fecha   date,
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) as
    aaaammdd varchar(8);
    comando  varchar(250);
    salida   varchar(250);

  begin

    aaaammdd := to_char(p_fecha, 'yyyymmdd');

    comando := '/bin/sh /trfdavivienda/envioDavivienda.sh ' || aaaammdd;

    salida := Shell_Run(comando);

    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarScriptDavivienda] ' || SQLERRM,
            p_error);

  end ejecutarScriptDavivienda;

  PROCEDURE verLogEnvioAvvillas(salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

  begin

    archivo := utl_file.fopen('TRFAVVILLAS', 'envioAvvillas.sh.log', 'R');

    salida := '';
    LOOP
      BEGIN
        utl_file.get_line(archivo, input_buffer);
        salida := salida || input_buffer || chr(10);
      EXCEPTION
        when no_data_found then
          exit;
      END;
    END LOOP;

    utl_file.fclose(archivo);

  EXCEPTION
    WHEN OTHERS THEN
      salida := 'NO FUE POSIBLE LEER LOG envioAvvillas.sh.log: ' || SQLERRM;

  end verLogEnvioAvvillas;

  PROCEDURE verLogEnvioDavivienda(salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);

  begin

    archivo := utl_file.fopen('TRFDAVIVIENDA',
                              'envioDavivienda.sh.log',
                              'R');

    salida := '';
    LOOP
      BEGIN
        utl_file.get_line(archivo, input_buffer);
        salida := salida || input_buffer || chr(10);
      EXCEPTION
        when no_data_found then
          exit;
      END;
    END LOOP;

    utl_file.fclose(archivo);
  EXCEPTION
    WHEN OTHERS THEN
      salida := 'NO FUE POSIBLE LEER LOG envioDavivienda.sh.log: ' ||
                SQLERRM;

  end verLogEnvioDavivienda;

  procedure aplicaNovedadesMunicipio(p_fecha date) is
    w_registros number;
  BEGIN

    -- aplica novedades de adicion

    select count(*)
      into w_registros
      from novmunicipio n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '01';

    if (w_registros > 0) then

      delete from municipio
       where idmunicipio = (select idmunicipio
                              from novmunicipio
                             where estadonov = 'VALIDADA'
                               and fechaact <= p_fecha
                               and fechaaplicacion is null
                               and tiponov = '01');

      insert into municipio
        (idmunicipio,
         nit_m,
         nombre,
         iddepartamento,
         idconcesionario,
         correo,
         indretroactividad,
         idbanco,
         tipocuenta,
         cuenta,
         nit_cta,
         indliq_s_ext,
         indliq_s_local,
         indliq_p_ext,
         indliq_p_local,
         indacuerdopago_2002)
        select idmunicipio,
               nit_m,
               nombre,
               iddepartamento,
               idconcesionario,
               correo,
               indretroactividad,
               idbanco,
               tipocuenta,
               cuenta,
               nit_cta,
               indliq_s_ext,
               indliq_s_local,
               indliq_p_ext,
               indliq_p_local,
               indacuerdopago_2002
          from novmunicipio
         where estadonov = 'VALIDADA'
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '01';

      insert into p_dispersion_municipio
        (idmunicipio,
         municipio_s,
         fcm_contravencional_s,
         conces_contravencional_s,
         acuerdopago_s,
         municipio_p,
         fcm_contravencional_p,
         conces_contravencional_p,
         acuerdopago_p)
        select idmunicipio,
               municipio_s,
               fcm_contravencional_s,
               conces_contravencional_s,
               acuerdopago_s,
               municipio_p,
               fcm_contravencional_p,
               conces_contravencional_p,
               acuerdopago_p
          from novmunicipio
         where estadonov = 'VALIDADA'
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '01';

      update novmunicipio
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '01';

      commit;

    end if;

    -- aplica novedades de actualizacion

    select count(*)
      into w_registros
      from novmunicipio n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '02';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          Select n.idmunicipio,
                 n.nit_m,
                 n.nombre,
                 n.iddepartamento,
                 n.idconcesionario,
                 n.correo,
                 n.indretroactividad,
                 n.idbanco,
                 n.tipocuenta,
                 n.cuenta,
                 n.nit_cta,
                 n.indliq_s_ext,
                 n.indliq_s_local,
                 n.indliq_p_ext,
                 n.indliq_p_local,
                 n.indacuerdopago_2002
            from novmunicipio n
           where n.estadonov = 'VALIDADA'
             and n.fechaaplicacion is null
             and fechaact <= p_fecha
             and n.tiponov = '02'
           order by n.idmunicipio asc, n.fechanov asc;
        cnov_rec cnov%ROWTYPE;
      BEGIN
        FOR cnov_rec IN cnov LOOP
          update municipio
             set idmunicipio         = cnov_rec.idmunicipio,
                 nit_m               = cnov_rec.nit_m,
                 nombre              = cnov_rec.nombre,
                 iddepartamento      = cnov_rec.iddepartamento,
                 idconcesionario     = cnov_rec.idconcesionario,
                 correo              = cnov_rec.correo,
                 indretroactividad   = cnov_rec.indretroactividad,
                 idbanco             = cnov_rec.idbanco,
                 tipocuenta          = cnov_rec.tipocuenta,
                 cuenta              = cnov_rec.cuenta,
                 nit_cta             = cnov_rec.nit_cta,
                 indliq_s_ext        = cnov_rec.indliq_s_ext,
                 indliq_s_local      = cnov_rec.indliq_s_local,
                 indliq_p_ext        = cnov_rec.indliq_p_ext,
                 indliq_p_local      = cnov_rec.indliq_p_local,
                 indacuerdopago_2002 = cnov_rec.indacuerdopago_2002
           where idmunicipio = cnov_rec.idmunicipio;
        END LOOP;
      END;

      DECLARE
        CURSOR cpor IS
          select n.idmunicipio,
                 n.municipio_s,
                 n.fcm_contravencional_s,
                 n.conces_contravencional_s,
                 n.acuerdopago_s,
                 n.municipio_p,
                 n.fcm_contravencional_p,
                 n.conces_contravencional_p,
                 n.acuerdopago_p
            from novmunicipio n
           where n.estadonov = 'VALIDADA'
             and n.fechaact <= p_fecha
             and n.fechaaplicacion is null
             and n.tiponov = '02'
           order by n.idmunicipio asc, n.fechanov asc;

        cnov_por cpor%ROWTYPE;
      BEGIN
        FOR cnov_por IN cpor LOOP
          update p_dispersion_municipio
             set idmunicipio              = cnov_por.idmunicipio,
                 municipio_s              = cnov_por.municipio_s,
                 fcm_contravencional_s    = cnov_por.fcm_contravencional_s,
                 conces_contravencional_s = cnov_por.conces_contravencional_s,
                 acuerdopago_s            = cnov_por.acuerdopago_s,
                 municipio_p              = cnov_por.municipio_p,
                 fcm_contravencional_p    = cnov_por.fcm_contravencional_p,
                 conces_contravencional_p = cnov_por.conces_contravencional_p,
                 acuerdopago_p            = cnov_por.acuerdopago_p
           where idmunicipio = cnov_por.idmunicipio;
        END LOOP;
      END;

      update novmunicipio
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '02';

      commit;

    end if;

  END aplicaNovedadesMunicipio;

  procedure aplicaNovedadesDiasMunicipio(p_fecha date) is
    w_registros number;
  BEGIN

    -- aplica novedades de adicion

    select count(*)
      into w_registros
      from novdias_dispersion n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '06';

    if (w_registros > 0) then

      insert into dias_dispersion
        (idmunicipio,
         idbanco,
         dias_dispersion_sl,
         frec_dispersion_sl,
         dias_dispersion_pl,
         frec_dispersion_pl,
         dias_dispersion_se,
         frec_dispersion_se,
         dias_dispersion_pe,
         frec_dispersion_pe)

        select idmunicipio,
               idbanco,
               dias_dispersion_sl,
               frec_dispersion_sl,
               dias_dispersion_pl,
               frec_dispersion_pl,
               dias_dispersion_se,
               frec_dispersion_se,
               dias_dispersion_pe,
               frec_dispersion_pe
          from novdias_dispersion
         where estadonov = 'VALIDADA'
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '06';

      update novdias_dispersion
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '06';

      commit;

    end if;

    -- aplica novedades de actualizacion

    select count(*)
      into w_registros
      from novdias_dispersion n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '07';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 idbanco,
                 dias_dispersion_sl,
                 frec_dispersion_sl,
                 dias_dispersion_pl,
                 frec_dispersion_pl,
                 dias_dispersion_se,
                 frec_dispersion_se,
                 dias_dispersion_pe,
                 frec_dispersion_pe
            from novdias_dispersion
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '07'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          update dias_dispersion
             set idmunicipio        = cnov_rec.idmunicipio,
                 idbanco            = cnov_rec.idbanco,
                 dias_dispersion_sl = cnov_rec.dias_dispersion_sl,
                 frec_dispersion_sl = cnov_rec.frec_dispersion_sl,
                 dias_dispersion_pl = cnov_rec.dias_dispersion_pl,
                 frec_dispersion_pl = cnov_rec.frec_dispersion_pl,
                 dias_dispersion_se = cnov_rec.dias_dispersion_se,
                 frec_dispersion_se = cnov_rec.frec_dispersion_se,
                 dias_dispersion_pe = cnov_rec.dias_dispersion_pe,
                 frec_dispersion_pe = cnov_rec.frec_dispersion_pe
           where idmunicipio = cnov_rec.idmunicipio;

        END LOOP;
      END;

      update novdias_dispersion
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '07';

      commit;

    end if;

    -- aplica novedades de eliminacion

    select count(*)
      into w_registros
      from novdias_dispersion n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '08';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 idbanco,
                 dias_dispersion_sl,
                 frec_dispersion_sl,
                 dias_dispersion_pl,
                 frec_dispersion_pl,
                 dias_dispersion_se,
                 frec_dispersion_se,
                 dias_dispersion_pe,
                 frec_dispersion_pe
            from novdias_dispersion
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '08'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          delete from dias_dispersion
           where idmunicipio = cnov_rec.idmunicipio
             and idbanco = cnov_rec.idbanco;

        END LOOP;
      END;

      update novdias_dispersion
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '08';

      commit;

    end if;

  END aplicaNovedadesDiasMunicipio;

  procedure aplicaNovedadesTercero(p_fecha date) is
    w_registros number;
  BEGIN

    -- aplica novedades de adicion

    select count(*)
      into w_registros
      from novTercero n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '03';

    if (w_registros > 0) then

      insert into tercero
        (idmunicipio,
         nit_t,
         nombre,
         idbanco,
         tipocuenta,
         cuenta,
         base_s,
         base_p,
         ind_base,
         num_tercero,
         correotercero)
        select idmunicipio,
               nit_t,
               nombre,
               idbanco,
               tipocuenta,
               cuenta,
               base_s,
               base_p,
               ind_base,
               num_tercero,
               correotercero
          from novTercero
         where estadonov = 'VALIDADA'
           and fechaact <= p_fecha
           and fechaaplicacion is null
           and tiponov = '03';

      update novTercero
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '03';

      commit;

    end if;

    -- aplica novedades de actualizacion

    select count(*)
      into w_registros
      from novTercero n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '04';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 nit_t,
                 nombre,
                 idbanco,
                 tipocuenta,
                 cuenta,
                 base_s,
                 base_p,
                 ind_base,
                 num_tercero,
                 correotercero
            from novTercero
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '04'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          update tercero
             set idmunicipio   = cnov_rec.idmunicipio,
                 nit_t         = cnov_rec.nit_t,
                 nombre        = cnov_rec.nombre,
                 idbanco       = cnov_rec.idbanco,
                 tipocuenta    = cnov_rec.tipocuenta,
                 cuenta        = cnov_rec.cuenta,
                 base_s        = cnov_rec.base_s,
                 base_p        = cnov_rec.base_p,
                 ind_base      = cnov_rec.ind_base,
                 num_tercero   = cnov_rec.num_tercero,
                 correotercero = cnov_rec.correotercero
           where idmunicipio = cnov_rec.idmunicipio
             and num_tercero = cnov_rec.num_tercero;

        END LOOP;
      END;

      update novTercero
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '04';

      commit;

    end if;

    -- aplica novedades de eliminacion

    select count(*)
      into w_registros
      from novTercero n
     where n.estadonov = 'VALIDADA'
       and n.fechaact <= p_fecha
       and n.fechaaplicacion is null
       and n.tiponov = '05';

    if (w_registros > 0) then

      DECLARE
        CURSOR cnov IS
          select idmunicipio,
                 nit_t,
                 nombre,
                 idbanco,
                 tipocuenta,
                 cuenta,
                 base_s,
                 base_p,
                 ind_base,
                 num_tercero,
                 correotercero
            from novTercero
           where estadonov = 'VALIDADA'
             and fechaaplicacion is null
             and fechaact <= p_fecha
             and tiponov = '05'
           order by idmunicipio asc, fechanov asc;

        cnov_rec cnov%ROWTYPE;

      BEGIN
        FOR cnov_rec IN cnov LOOP

          delete from tercero
           where idmunicipio = cnov_rec.idmunicipio
             and num_tercero = cnov_rec.num_tercero;

        END LOOP;
      END;

      update novTercero
         set (fechaaplicacion, estadonov) =
             (select sysdate, 'ACTIVADA' from dual)
       where estadonov = 'VALIDADA'
         and fechaact <= p_fecha
         and fechaaplicacion is null
         and tiponov = '05';

      commit;

    end if;

  END aplicaNovedadesTercero;

  PROCEDURE valida_transferencia(p_fec_ini_ano number,
                                       p_fec_ini_mes number,
                                       p_fec_ini_dia number,
                                       p_usuario     varchar2,
                                       p_error       OUT VARCHAR2) as
    w_fec_trf_ini date;
    w_registros   number;

  begin
    -- VALIDACIONES
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

  select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into w_fec_trf_ini
      from DUAL;

 -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_dispersion = w_fec_trf_ini;

    IF w_registros = 0 THEN
      p_error := 'NO SE HA REALIZADO EL PROCESO DE TRANSFERENCIA DE LA FECHA' ;
      RETURN;
    END IF;

  p_error := 'OK';


  END valida_transferencia;

  PROCEDURE ejecutarDesencripta(p_fecha   date,
                                p_usuario varchar2,
                                p_idbanco varchar2,
                                p_error   OUT VARCHAR2,
                                salida    OUT VARCHAR2) as
    aaaammdd     varchar(8);
    mmdd         varchar(4);
    aammdd       varchar(6);
    comando      varchar(250);
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);
  
  begin
  
    aaaammdd := to_char(p_fecha, 'yyyymmdd');
    mmdd     := to_char(p_fecha, 'mmdd');
    aammdd   := to_char(p_fecha, 'yymmdd');
  
    if (p_idbanco = '52') then
      comando := 'sh /trfavvillas/desencriptar.sh ' || aaaammdd || ' ' || mmdd;
    else
      comando := 'sh /trfdavivienda/desencriptar.sh ' || aaaammdd || ' ' ||
                 aammdd;
    end if;
  
    salida := Shell_Run(comando);
  
    if (substr(salida, 0, 2) <> '0:') then
      p_error := salida;
      return;
    end if;
  
    p_error := 'DESENCRIPCION CORRECTA';
  
    verLogDesencripta(p_idbanco, salida);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [ejecutarDesencripta] ' || SQLERRM,
            p_error);
    
  end ejecutarDesencripta;

  PROCEDURE desencripta_Banco(p_fec_ini_ano number,
                              p_fec_ini_mes number,
                              p_fec_ini_dia number,
                              p_idbanco     varchar2,
                              p_usuario     varchar2,
                              p_error       OUT VARCHAR2,
                              p_log         out varchar2) as
  
    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);
    p_fecha     date;
  
    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
  
    longitud number;
  
  begin
  
    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;
  
    IF not P_ERROR is null THEN
      return;
    END IF;
  
    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into p_fecha
      from DUAL;
  
    ejecutarDesencripta(p_fecha, p_usuario, p_idbanco, p_error, p_log);
  
    verLogDesencripta(p_idbanco, p_log);
  
    p_error := 'Se lanzo proceso OK';
  
    sp_log(p_usuario,
           'desencripta_Banco',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia);
  
  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [desencripta_Banco] ' || SQLERRM,
            p_error);
    
  end desencripta_Banco;

  PROCEDURE verLogDesencripta(p_idbanco varchar2, salida OUT VARCHAR2) as
    archivo      utl_file.file_type;
    input_buffer varchar2(1000);
  
  begin
  
    if (p_idbanco = '52') then
      archivo := utl_file.fopen('TRFAVVILLAS', 'desencriptar.sh.log', 'R');
    else
      archivo := utl_file.fopen('TRFDAVIVIENDA', 'desencriptar.sh.log', 'R');
    end if;
  
    salida := '';
    LOOP
      BEGIN
        utl_file.get_line(archivo, input_buffer);
        salida := salida || input_buffer || chr(10);
      EXCEPTION
        when no_data_found then
          exit;
      END;
    END LOOP;
  
    utl_file.fclose(archivo);
  
  EXCEPTION
    WHEN OTHERS THEN
      salida := 'NO FUE POSIBLE LEER LOG desencriptar.sh.log: ' || SQLERRM;
    
  end verLogDesencripta;


PROCEDURE envio_Banco_repro(p_fec_ini_ano number,
                        p_fec_ini_mes number,
                        p_fec_ini_dia number,
                        p_fec_fin_ano number,
                        p_fec_fin_mes number,
                        p_fec_fin_dia number,
                        p_idbanco     varchar2,
                        p_usuario     varchar2,
                        p_error       OUT VARCHAR2,
                        p_log         out varchar2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);
    p_fecha_ini     date;
    p_fecha_fin     date;

    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;

    longitud number;

  begin

    if (not p_usuario = '99999999') THEN
      sp_v_usuario(p_usuario, p_error, 'pk_proc');
    END IF;

    IF not P_ERROR is null THEN
      return;
    END IF;

    select TO_DATE(p_fec_ini_ano || '-' || p_fec_ini_mes || '-' ||
                   p_fec_ini_dia,
                   'YYYY-MM-DD')
      into p_fecha_ini
      from DUAL;

    select TO_DATE(p_fec_fin_ano || '-' || p_fec_fin_mes || '-' ||
                   p_fec_fin_dia,
                   'YYYY-MM-DD')
      into p_fecha_fin
      from DUAL;

    -- obtiene cantidad de registros actualizados
    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where ( fec_corte_ini >= p_fecha_ini and fec_corte_ini <= p_fecha_fin )
       and enviadobanco = 1
       and ori_idbanco = p_idbanco;

    IF w_registros > 0 THEN
      p_error := 'PROCESO NO EJECUTADO. ARCHIVOS YA ENVIADOS A BANCO. SOLICITAR AUTORIZACION';
      -- ver log envio
      if p_idbanco = '52' then
        verLogEnvioAvvillas(p_log);
      end if;
      if p_idbanco = '50' then
        verLogEnvioDavivienda(p_log);
      end if;

      RETURN;
    END IF;

    if p_idbanco = '52' then
      -- generar archivo transferencia avvillas
      generarArchivoAvvillas_repro(p_fecha_ini,p_fecha_fin , p_usuario, p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia davivienda
      ejecutarScriptAvvillas(p_fecha_fin, p_usuario, p_error);

      IF not P_ERROR is null THEN
        p_error := 'Error en script avvillas codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioAvvillas(p_log);
        return;
      END IF;
      -- ver log envio
      verLogEnvioAvvillas(p_log);

      if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Avvillas. Fallo FTP:Login failed';
        return;
      end if;

    end if;

    if p_idbanco = '50' then

      -- generar archivo transferencia avvillas
      generarArchivoDavivienda_repro(p_fecha_ini,p_fecha_fin, p_usuario, p_error);

      IF not P_ERROR is null THEN
        return;
      END IF;

      -- ejecutar script transferencia davivienda
      ejecutarScriptDavivienda(p_fecha_fin, p_usuario, p_error);

      IF not P_ERROR is null THEN
        p_error := 'Error en script Davivienda codigo ' ||
                   substr(p_error, 0, 3);
        verLogEnvioDavivienda(p_log);
        return;
      END IF;

      -- ver log envio
      verLogEnvioDavivienda(p_log);

      if (instr(p_log, 'Login failed') > 0) then
        p_error := 'Envio Davivienda. Fallo FTP:Login failed';
        return;
      end if;

    end if;

    update recaudo_externo_disp_tot
       set enviadobanco = 1
     where fec_corte_ini >= p_fecha_ini and fec_corte_ini <= p_fecha_fin
       and ori_idbanco = p_idbanco;

    commit;

    p_error := 'Archivos enviados a banco OK';

    select count(*)
      into w_registros
      from recaudo_externo_disp_tot
     where fec_corte_ini >= p_fecha_ini and fec_corte_ini <= p_fecha_fin
       and ori_idbanco = p_idbanco;

    IF w_registros = 0 THEN
      p_error := p_error ||
                 '.ADVERTENCIA: NO HAY TRANSFERENCIAS PROGRAMADASPARA LA FECHA DADA';
      RETURN;
    END IF;

    sp_log(p_usuario,
           'envio_Banco_repro',
           p_fec_ini_ano || '-' || p_fec_ini_mes || '-' || p_fec_ini_dia || ':' || p_fec_fin_ano || '-' || p_fec_fin_mes || '-' || p_fec_fin_dia);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE, p_usuario || ' [envio_Banco_repro] ' || SQLERRM, p_error);

  end envio_Banco_repro;

PROCEDURE generarArchivoAvvillas_repro(p_fecha_ini   date,
                                   p_fecha_fin   date,
                                   p_usuario varchar2,
                                   p_error   OUT VARCHAR2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);

    cadena   varchar(250);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;

    longitud number;

    CURSOR tabla IS
      select fec_dispersion,
             id_concesionario_liq,
             orden,
             concepto,
             ori_idbanco,
             ori_tipocuenta,
             ori_cuenta,
             ori_nit,
             des_idbanco,
             des_tipocuenta,
             desencriptar(des_cuenta) as des_cuenta,
             des_nit,
             indtipo,
             valor,
             idmunicipio,
             referenciatrf
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini and fec_dispersion <= p_fecha_fin
         and ori_idbanco = '52';

  begin

    aaaammdd := to_char(p_fecha_fin, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    archivo  := utl_file.fopen('TRFAVVILLAS',
                               'CNJ650D.TRANSFER.' || aaaammdd || '.TXT',
                               'W');
    numreg   := 1;
    vlrTotal := 0;

    for registro in tabla loop
      cadena := '1'; -- tipo registro
      cadena := cadena || aaaammdd; -- fecha generacion

      strValor := trim(to_char(numreg, '00000000'));
      cadena   := cadena || strValor; -- numero registro

      strValor := trim(to_char(registro.referenciatrf, '0000000000000000'));

      cadena := cadena || strValor;
      cadena := cadena || '0' || registro.ori_idbanco; -- banco origen

      if (registro.ori_tipocuenta = 'AHO') then
        cadena := cadena || '1'; -- tipo cuenta origen
      end if;

      if (registro.ori_tipocuenta = 'CTE') then
        cadena := cadena || '2'; -- tipo cuenta origen
      end if;

      cadena := cadena || '0000000' || registro.ori_cuenta; -- cuenta origen

      strValor := trim(to_char(registro.valor * 100, '000000000000000000'));
      cadena   := cadena || strValor; -- valor

      cadena := cadena || '0' || registro.des_idbanco; -- banco destino

      if (registro.des_tipocuenta = 'AHO') then
        cadena := cadena || '1'; -- tipo cuenta destino
      end if;

      if (registro.des_tipocuenta = 'CTE') then
        cadena := cadena || '2'; -- tipo cuenta destino
      end if;

      cadena := cadena || registro.des_cuenta; -- cuenta destino

      longitud := LENGTH(registro.des_cuenta);
      longitud := 16 - longitud;

      if (longitud > 0) then
        for idx in 1 .. longitud loop
          cadena := cadena || ' ';
        end loop;
      end if;

      cadena := cadena || 'N'; -- tipo identificacion destino
      cadena := cadena || '000000' || registro.des_nit; -- identificacion destino

      -- mensaje respuesta
      for idx in 1 .. 100 loop
        cadena := cadena || ' ';
      end loop;

      cadena := cadena || '999'; -- codigo respuesta

      longitud := LENGTH(cadena);
      longitud := 250 - longitud;

      -- filler
      for idx in 1 .. longitud loop
        cadena := cadena || '0';
      end loop;

      utl_file.put_line(archivo, cadena, true);
      numreg   := numreg + 1;
      vlrTotal := vlrTotal + registro.valor;
    end loop;

    cadena := '9'; -- tipo registro
    cadena := cadena || aaaammdd; -- fecha generacion

    strValor := trim(to_char(numreg - 1, '00000000'));
    cadena   := cadena || strValor; -- numero registro

    strValor := trim(to_char(vlrTotal * 100, '000000000000000000'));
    cadena   := cadena || strValor; -- valor

    longitud := LENGTH(cadena);
    longitud := 250 - longitud;

    -- filler
    for idx in 1 .. longitud loop
      cadena := cadena || '0';
    end loop;

    utl_file.put_line(archivo, cadena, true);

    utl_file.fclose(archivo);

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoAvvillas_repro] ' || SQLERRM,
            p_error);

  end generarArchivoAvvillas_repro;

PROCEDURE generarArchivoDavivienda_repro(p_fecha_ini   date,
                                     p_fecha_fin   date,                     
                                     p_usuario varchar2,
                                     p_error   OUT VARCHAR2) as

    w_registros number;
    archivo     utl_file.file_type;
    aaaammdd    varchar(8);
    hhmmss      varchar(6);

    cadena   varchar(170);
    numreg   number;
    strValor varchar(250);
    vlrTotal number;
    numTotal number;

    longitud number;

    CURSOR cuentas is
      select max(tipocuenta) as tipocuenta, cuenta
        from cta_recaudo_concesionario t
       where idbanco = '50'
         AND CUENTA NOT IN ('186992848', '186992830')
       group by cuenta;

  begin

    aaaammdd := to_char(p_fecha_fin, 'yyyymmdd');
    hhmmss   := to_char(sysdate, 'hhmmss');

    for cta in cuentas loop

      select sum(valor)
        into vlrTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini and fec_dispersion <= p_fecha_fin
         and ori_idbanco = '50'
         and ori_cuenta = cta.cuenta;

      select count(*)
        into numTotal
        from recaudo_externo_disp_tot
       where fec_dispersion >= p_fecha_ini and fec_dispersion <= p_fecha_fin
         and ori_idbanco = '50'
         and ori_cuenta = cta.cuenta;

      archivo := utl_file.fopen('TRFDAVIVIENDA',
                                cta.cuenta || '_' || aaaammdd || '.TXT',
                                'W');

      --crear header
      cadena := 'RC'; -- tipo reg
      cadena := cadena || '000000' || '8000826650'; --nit empresa
      cadena := cadena || '0000'; --codigo-servicio
      cadena := cadena || '0000'; --codigo-subservicio

      strValor := trim(to_char(to_number(cta.cuenta), '0000000000000000'));
      cadena   := cadena || strValor;

      -- tipo cuenta origen
      if (cta.tipocuenta = 'AHO') then
        cadena := cadena || 'CA';
      end if;

      if (cta.tipocuenta = 'CTE') then
        cadena := cadena || 'CC';
      end if;

      -- banco origen
      cadena := cadena || '000050';

      -- valor
      if (vlrTotal is null) then
        vlrTotal := 0;
      end if;

      strValor := trim(to_char(vlrTotal * 100, '000000000000000000'));
      cadena   := cadena || strValor; -- valor

      -- numero registro
      strValor := trim(to_char(numTotal, '000000'));
      cadena   := cadena || strValor; -- valor

      cadena := cadena || aaaammdd; -- fecha proceso

      cadena := cadena || '000000'; -- hora proceso
      cadena := cadena || '0000'; -- codigo-operador
      cadena := cadena || '9999'; -- respuesta-proceso

      cadena := cadena || aaaammdd; -- fech-generacion
      cadena := cadena || '000000'; -- hora generacion
      cadena := cadena || '00'; -- ind-inscripcion
      cadena := cadena || '00'; -- tipo-identificacion
      cadena := cadena || '000000000000'; -- numero-cliente
      cadena := cadena || '0000'; -- oficina-rec-emp
      cadena := cadena || '0000'; -- actu-co
      cadena := cadena || '0'; -- ind-encripcion
      cadena := cadena || '01'; -- long-arch-s
      cadena := cadena || '0000000000000000'; -- cta-empresa-abono
      cadena := cadena || '000000'; -- talon-abono
      cadena := cadena || '00000000000'; -- filler

      utl_file.put_line(archivo, cadena, true);
      for reg in (select fec_dispersion,
                         id_concesionario_liq,
                         orden,
                         concepto,
                         ori_idbanco,
                         ori_tipocuenta,
                         ori_cuenta,
                         ori_nit,
                         des_idbanco,
                         des_tipocuenta,
                         desencriptar(des_cuenta) as des_cuenta,
                         des_nit,
                         indtipo,
                         valor,
                         idmunicipio,
                         referenciatrf
                    from recaudo_externo_disp_tot
                   where fec_dispersion >= p_fecha_ini and fec_dispersion <= p_fecha_fin
                     and ori_idbanco = '50'
                     and ori_cuenta = cta.cuenta)

       loop
        cadena := '55000000' || reg.des_nit; -- tipo registro

        -- nro referencia
        strValor := trim(to_char(reg.referenciatrf, '0000000000000000'));
        cadena   := cadena || strValor;

        -- cuenta destino
        strValor := trim(to_char(to_number(reg.des_cuenta),
                                 '0000000000000000'));
        cadena   := cadena || strValor;

        -- tipo cuenta destino
        if (reg.des_tipocuenta = 'AHO') then
          cadena := cadena || 'CA';
        end if;

        if (reg.des_tipocuenta = 'CTE') then
          cadena := cadena || 'CC';
        end if;

        cadena := cadena || '0000' || reg.des_idbanco; --banco destino

        strValor := trim(to_char(reg.valor * 100, '000000000000000000'));
        cadena   := cadena || strValor; -- valor

        cadena := cadena || '000000'; -- numero talon
        cadena := cadena || '03'; -- tipo ide destino
        cadena := cadena || '0'; -- valide ide
        cadena := cadena || '9999'; -- respuesta traslado
        cadena := cadena || '0000000000000000000000000000000000000000'; --mensaje
        cadena := cadena || '000000000000000000'; -- valor acumulado
        cadena := cadena || aaaammdd; --fecha a
        cadena := cadena || '0000'; -- oficina-rec-det
        cadena := cadena || '0000'; -- motivo-det
        cadena := cadena || '0000'; -- nvo-indalt-tarj
        cadena := cadena || '0'; -- indic-emerg
        cadena := cadena || '00'; -- indic-emerg

        utl_file.put_line(archivo, cadena, true);

      end loop;

      utl_file.fclose(archivo);
    end loop;

  EXCEPTION
    WHEN OTHERS THEN
      sp_ex(SQLCODE,
            p_usuario || ' [generarArchivoAvvillas] ' || SQLERRM,
            p_error);

  end generarArchivoDavivienda_repro;  
end pk_proc;
/

