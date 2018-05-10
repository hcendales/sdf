/*
 * SessionBean1.java
 *
 * Created on 29 de octubre de 2007, 12:13 PM
 * Copyright DSOFTFIN
 */
package wasimit;


import com.sun.rave.web.ui.appbase.AbstractSessionBean;
import com.sun.sql.rowset.CachedRowSetXImpl;
import javax.faces.FacesException;

/**
 * <p>Session scope data bean for your application.  Create properties
 *  here to represent cached data that should be made available across
 *  multiple HTTP requests for an individual user.</p>
 *
 * <p>An instance of this class will be created for you automatically,
 * the first time your application evaluates a value binding expression
 * or method binding expression that references a managed bean using
 * this class.</p>
 */
public class SessionBean1 extends AbstractSessionBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        bancoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        bancoRowSet.setCommand("SELECT ALL SIMIT.BANCO.IDBANCO, \n                    SIMIT.BANCO.NOMBRE, \n                    SIMIT.BANCO.RESPONSABLE, \n                    SIMIT.BANCO.CARGO, \n                    SIMIT.BANCO.CORREO, \n                    SIMIT.BANCO.TELEFONO, \n                    SIMIT.BANCO.DIRCORRES \nFROM SIMIT.BANCO\nWHERE SIMIT.BANCO.IDBANCO <> '00'\nORDER BY SIMIT.BANCO.IDBANCO ASC ");
        bancoRowSet.setTableName("BANCO");
        salario_minimoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        salario_minimoRowSet.setCommand("select anho,'$ ' || TO_CHAR(VALOR, 'FM999,999,999') as valor from salario_minimo order by anho");
        salario_minimoRowSet.setTableName("SALARIO_MINIMO");
        fecha_no_habilRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        fecha_no_habilRowSet.setCommand("SELECT * FROM SIMIT.FECHA_NO_HABIL");
        fecha_no_habilRowSet.setTableName("FECHA_NO_HABIL");
        logRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        logRowSet.setCommand("SELECT * FROM SIMIT.LOG");
        logRowSet.setTableName("LOG");
        
        municipioRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        municipioRowSet.setTableName("MUNICIPIO");
        municipioRowSet.setConcurrency(java.sql.ResultSet.CONCUR_READ_ONLY);
        
        validador_fechaRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        validador_fechaRowSet.setCommand("SELECT ALL SIMIT.VALIDADOR_FECHA.IDMUNICIPIO, \n                    SIMIT.VALIDADOR_FECHA.IDVALIDADOR, \n                    SIMIT.VALIDADOR_FECHA.FECHA_INI, \n                    SIMIT.VALIDADOR_FECHA.FECHA_FIN, \n                    SIMIT.VALIDADOR_FECHA.INDTIPO, \n                    SIMIT.VALIDADOR_FECHA.P_MUNICIPIO, \n                    SIMIT.VALIDADOR_FECHA.P_FCM_CONTRAVENCIONAL, \n                    SIMIT.VALIDADOR_FECHA.P_CONCES_CONTRAVENCIONAL, \n                    SIMIT.VALIDADOR_FECHA.P_ACUERDOPAGO, \n                    SIMIT.VALIDADOR_FECHA.NIT_TERCERO1, \n                    SIMIT.VALIDADOR_FECHA.BASE_TERCERO1, \n                    SIMIT.VALIDADOR_FECHA.IND_BASE_TERCERO1, \n                    SIMIT.VALIDADOR_FECHA.NIT_TERCERO2, \n                    SIMIT.VALIDADOR_FECHA.BASE_TERCERO2, \n                    SIMIT.VALIDADOR_FECHA.IND_BASE_TERCERO2 \nFROM SIMIT.VALIDADOR_FECHA\nWHERE SIMIT.VALIDADOR_FECHA.IDMUNICIPIO = ?\nORDER BY SIMIT.VALIDADOR_FECHA.IDVALIDADOR ASC ");
        validador_fechaRowSet.setTableName("VALIDADOR_FECHA");
        errorsRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        errorsRowSet.setCommand("SELECT ALL SIMIT.ERRORS.ID_ERRORS, \n                    SIMIT.ERRORS.FECHA, \n                    SIMIT.ERRORS.SQLCODE, \n                    SIMIT.ERRORS.MESSAGE \nFROM SIMIT.ERRORS\nORDER BY SIMIT.ERRORS.ID_ERRORS DESC ");
        errorsRowSet.setTableName("ERRORS");
        bancoRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        bancoRowSet1.setCommand("SELECT ALL SIMIT.BANCO.IDBANCO, \n                    ( SIMIT.BANCO.IDBANCO || ' - '  || SIMIT.BANCO.NOMBRE ) AS NOMBREBANCO\nFROM SIMIT.BANCO\nORDER BY SIMIT.BANCO.IDBANCO ASC ");
        bancoRowSet1.setTableName("BANCO");
        cta_recaudo_fcmRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        cta_recaudo_fcmRowSet.setCommand("SELECT ALL SIMIT.CTA_RECAUDO_FCM.NIT_FCM, \n                    SIMIT.CTA_RECAUDO_FCM.IDBANCO, \n                    SIMIT.CTA_RECAUDO_FCM.INDTIPO, \n                    SIMIT.CTA_RECAUDO_FCM.TIPOCUENTA, \n                    SIMIT.CTA_RECAUDO_FCM.CUENTA, \n                    SIMIT.CTA_RECAUDO_FCM.COMISION_RECAUDO, \n                    SIMIT.CTA_RECAUDO_FCM.COMISION_ACH, \n                    SIMIT.CTA_RECAUDO_FCM.CTA_CONTABLE, \n                    SIMIT.BANCO.NOMBRE AS NOMBREBANCO \nFROM SIMIT.CTA_RECAUDO_FCM\n          INNER JOIN SIMIT.BANCO ON SIMIT.CTA_RECAUDO_FCM.IDBANCO = SIMIT.BANCO.IDBANCO\nORDER BY SIMIT.CTA_RECAUDO_FCM.IDBANCO ASC, \n                    SIMIT.CTA_RECAUDO_FCM.INDTIPO ASC ");
        cta_recaudo_fcmRowSet.setTableName("CTA_RECAUDO_FCM");
        municipioRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        municipioRowSet1.setCommand("SELECT ALL SIMIT.MUNICIPIO.IDMUNICIPIO, \n                    SIMIT.MUNICIPIO.NOMBRE, \n                    SIMIT.MUNICIPIO.TIPOCUENTA, \n                    desencriptar(SIMIT.MUNICIPIO.CUENTA), \n                    SIMIT.MUNICIPIO.NIT_CTA, \n                    SIMIT.MUNICIPIO.NIT_M, \n                    SIMIT.MUNICIPIO.IDBANCO, \n                    SIMIT.BANCO.NOMBRE AS BANCO, \n                    SIMIT.CONCESIONARIO.NOMBRE AS CONCESIONARIO, \n                    SIMIT.DEPARTAMENTO.NOMBRE AS DEPARTAMENTO \nFROM SIMIT.MUNICIPIO, SIMIT.BANCO, SIMIT.CONCESIONARIO, SIMIT.DEPARTAMENTO\nWHERE SIMIT.MUNICIPIO.IDBANCO = SIMIT.BANCO.IDBANCO\n          AND SIMIT.MUNICIPIO.IDCONCESIONARIO = SIMIT.CONCESIONARIO.IDCONCESIONARIO\n          AND SIMIT.MUNICIPIO.IDDEPARTAMENTO = SIMIT.DEPARTAMENTO.IDDEPARTAMENTO\nORDER BY SIMIT.MUNICIPIO.IDMUNICIPIO ASC ");
        municipioRowSet1.setTableName("MUNICIPIO");
        concesionarioRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        concesionarioRowSet.setCommand("SELECT ALL SIMIT.CONCESIONARIO.IDCONCESIONARIO, \n                    ( SIMIT.CONCESIONARIO.IDCONCESIONARIO || ' - ' ||  SIMIT.CONCESIONARIO.NOMBRE ) AS NOMBRECONCESIOANRIO \nFROM SIMIT.CONCESIONARIO   \norder by SIMIT.CONCESIONARIO.IDCONCESIONARIO");
        concesionarioRowSet.setTableName("CONCESIONARIO");
        cta_recaudo_concesionarioRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        cta_recaudo_concesionarioRowSet.setCommand("SELECT ALL SIMIT.CTA_RECAUDO_CONCESIONARIO.IDCONCESIONARIO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.IDBANCO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.INDTIPO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.TIPOCUENTA, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.CUENTA, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.COMISION_RECAUDO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.COMISION_ACH, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.CTA_CONTABLE \nFROM SIMIT.CTA_RECAUDO_CONCESIONARIO ");
        cta_recaudo_concesionarioRowSet.setTableName("CTA_RECAUDO_CONCESIONARIO");
        cta_recaudo_fcmRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        cta_recaudo_fcmRowSet1.setCommand("SELECT ALL SIMIT.CTA_RECAUDO_FCM.NIT_FCM, \n                    SIMIT.CTA_RECAUDO_FCM.IDBANCO, \n                    SIMIT.CTA_RECAUDO_FCM.INDTIPO, \n                    SIMIT.CTA_RECAUDO_FCM.TIPOCUENTA, \n                    SIMIT.CTA_RECAUDO_FCM.CUENTA, \n                    SIMIT.CTA_RECAUDO_FCM.COMISION_RECAUDO, \n                    SIMIT.CTA_RECAUDO_FCM.COMISION_ACH, \n                    SIMIT.CTA_RECAUDO_FCM.CTA_CONTABLE \nFROM SIMIT.CTA_RECAUDO_FCM\nWHERE SIMIT.CTA_RECAUDO_FCM.NIT_FCM = ?\n          AND SIMIT.CTA_RECAUDO_FCM.IDBANCO = ? ");
        cta_recaudo_fcmRowSet1.setTableName("CTA_RECAUDO_FCM");
        dias_dispersionRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        dias_dispersionRowSet.setCommand("SELECT ALL SIMIT.DIAS_DISPERSION.IDMUNICIPIO, \n                    SIMIT.DIAS_DISPERSION.IDBANCO, \n                    SIMIT.DIAS_DISPERSION.DIAS_DISPERSION_SL, \n                    SIMIT.DIAS_DISPERSION.FREC_DISPERSION_SL, \n                    SIMIT.DIAS_DISPERSION.DIAS_DISPERSION_PL, \n                    SIMIT.DIAS_DISPERSION.FREC_DISPERSION_PL, \n                    SIMIT.DIAS_DISPERSION.DIAS_DISPERSION_SE, \n                    SIMIT.DIAS_DISPERSION.FREC_DISPERSION_SE, \n                    SIMIT.DIAS_DISPERSION.DIAS_DISPERSION_PE, \n                    SIMIT.DIAS_DISPERSION.FREC_DISPERSION_PE, \n                    SIMIT.BANCO.IDBANCO, \n                    SIMIT.BANCO.NOMBRE AS BANCO \nFROM SIMIT.DIAS_DISPERSION\n          INNER JOIN SIMIT.BANCO ON SIMIT.DIAS_DISPERSION.IDBANCO = SIMIT.BANCO.IDBANCO\nWHERE SIMIT.DIAS_DISPERSION.IDMUNICIPIO = ? \norder by SIMIT.DIAS_DISPERSION.IDBANCO");
        dias_dispersionRowSet.setTableName("DIAS_DISPERSION");
        municipioRowSet.setCommand("SELECT ALL SIMIT.MUNICIPIO.IDMUNICIPIO, (  SIMIT.MUNICIPIO.NOMBRE || ' - ' ||  simit.departamento.nombre || ' - ' || SIMIT.MUNICIPIO.IDMUNICIPIO  ) NOMBRE \nFROM SIMIT.MUNICIPIO, simit.departamento  \nwhere simit.municipio.iddepartamento = simit.departamento.iddepartamento\norder by  SIMIT.MUNICIPIO.NOMBRE");
        municipioRowSet2.setDataSourceName("java:comp/env/jdbc/dataSource");
        municipioRowSet2.setCommand("SELECT ALL SIMIT.MUNICIPIO.IDMUNICIPIO, \n                    SIMIT.MUNICIPIO.NIT_M, \n                    SIMIT.MUNICIPIO.NOMBRE, \n                    SIMIT.MUNICIPIO.IDDEPARTAMENTO, \n                    SIMIT.MUNICIPIO.IDCONCESIONARIO, \n                    SIMIT.MUNICIPIO.CORREO, \n                    SIMIT.MUNICIPIO.INDRETROACTIVIDAD, \n                    SIMIT.MUNICIPIO.IDBANCO, \n                    SIMIT.MUNICIPIO.TIPOCUENTA, \n                    SIMIT.MUNICIPIO.CUENTA, \n                    SIMIT.MUNICIPIO.NIT_CTA, \n                    SIMIT.MUNICIPIO.INDLIQ_S_EXT, \n                    SIMIT.MUNICIPIO.INDLIQ_S_LOCAL, \n                    SIMIT.MUNICIPIO.INDLIQ_P_EXT, \n                    SIMIT.MUNICIPIO.INDLIQ_P_LOCAL \nFROM SIMIT.MUNICIPIO ");
        municipioRowSet2.setTableName("MUNICIPIO");
        terceroRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        terceroRowSet.setCommand("SELECT ALL SIMIT.TERCERO.IDMUNICIPIO, \n                    SIMIT.TERCERO.NIT_T, \n                    SIMIT.TERCERO.NOMBRE, \n                    SIMIT.TERCERO.IDBANCO, \n                    SIMIT.TERCERO.TIPOCUENTA, \n                    desencriptar(SIMIT.TERCERO.CUENTA) as CUENTA, \n                    SIMIT.TERCERO.BASE_S, \n                    SIMIT.TERCERO.BASE_P, \n                    SIMIT.TERCERO.IND_BASE, \n                    SIMIT.TERCERO.NUM_TERCERO, \n                    SIMIT.BANCO.IDBANCO, \n                    SIMIT.BANCO.NOMBRE AS BANCO \nFROM SIMIT.TERCERO\n          INNER JOIN SIMIT.BANCO ON SIMIT.TERCERO.IDBANCO = SIMIT.BANCO.IDBANCO\nWHERE SIMIT.TERCERO.IDMUNICIPIO = ? ");
        terceroRowSet.setTableName("TERCERO");
        cta_recaudo_concesionarioRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        cta_recaudo_concesionarioRowSet1.setCommand("SELECT ALL SIMIT.CTA_RECAUDO_CONCESIONARIO.IDCONCESIONARIO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.IDBANCO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.INDTIPO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.TIPOCUENTA, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.CUENTA, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.COMISION_RECAUDO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.COMISION_ACH, \n                    SIMIT.BANCO.NOMBRE AS BANCO, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.CTA_CONTABLE \nFROM SIMIT.CTA_RECAUDO_CONCESIONARIO\n          INNER JOIN SIMIT.BANCO ON SIMIT.CTA_RECAUDO_CONCESIONARIO.IDBANCO = SIMIT.BANCO.IDBANCO\nWHERE SIMIT.CTA_RECAUDO_CONCESIONARIO.IDCONCESIONARIO = ?\nORDER BY SIMIT.CTA_RECAUDO_CONCESIONARIO.IDBANCO ASC, \n                    SIMIT.CTA_RECAUDO_CONCESIONARIO.INDTIPO ASC ");
        cta_recaudo_concesionarioRowSet1.setTableName("CTA_RECAUDO_CONCESIONARIO");
        
        recaudo_local_ajustesRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        recaudo_local_ajustesRowSet.setCommand("SELECT ALL SIMIT.RECAUDO_LOCAL_AJUSTES.IDBANCO, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.CTA_RECAUDO, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.INDTIPO, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.FEC_CORTE, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.FEC_TRAN, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.VALOR_TOTAL, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.IDMUNICIPIO, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.PERIODO, \n                    SIMIT.RECAUDO_LOCAL_AJUSTES.ID_RECAUDO_LOCAL_AJUSTES, \n                    SIMIT.BANCO.NOMBRE AS BANCO, \n                    SIMIT.MUNICIPIO.IDMUNICIPIO, \n                    SIMIT.MUNICIPIO.NOMBRE AS MUNICIPIO \nFROM SIMIT.RECAUDO_LOCAL_AJUSTES, SIMIT.BANCO, SIMIT.MUNICIPIO\nWHERE SIMIT.RECAUDO_LOCAL_AJUSTES.IDBANCO = SIMIT.BANCO.IDBANCO\n          AND SIMIT.RECAUDO_LOCAL_AJUSTES.IDMUNICIPIO = SIMIT.MUNICIPIO.IDMUNICIPIO\n          AND SIMIT.RECAUDO_LOCAL_AJUSTES.PERIODO = ? AND SIMIT.RECAUDO_LOCAL_AJUSTES.QUINCENA = ? ");
        recaudo_local_ajustesRowSet.setTableName("RECAUDO_LOCAL_AJUSTES");

        cta_recaudo_fcmRowSet2.setDataSourceName("java:comp/env/jdbc/dataSource");
        cta_recaudo_fcmRowSet2.setCommand("SELECT ALL SIMIT.CTA_RECAUDO_FCM.NIT_FCM, \n                    SIMIT.CTA_RECAUDO_FCM.IDBANCO, \n                    SIMIT.CTA_RECAUDO_FCM.INDTIPO, \n                    SIMIT.CTA_RECAUDO_FCM.TIPOCUENTA, \n                    SIMIT.CTA_RECAUDO_FCM.CUENTA, \n                    SIMIT.CTA_RECAUDO_FCM.COMISION_RECAUDO, \n                    SIMIT.CTA_RECAUDO_FCM.COMISION_ACH, \n                    SIMIT.CTA_RECAUDO_FCM.CTA_CONTABLE,\n                    (SIMIT.CTA_RECAUDO_FCM.INDTIPO || '-' ||SIMIT.CTA_RECAUDO_FCM.TIPOCUENTA|| '-' || SIMIT.CTA_RECAUDO_FCM.CUENTA) CTA_GRAL\nFROM SIMIT.CTA_RECAUDO_FCM\nWHERE SIMIT.CTA_RECAUDO_FCM.NIT_FCM = ?\n          AND SIMIT.CTA_RECAUDO_FCM.IDBANCO = ? ");
        cta_recaudo_fcmRowSet2.setTableName("CTA_RECAUDO_FCM");
        municipioRowSet3.setDataSourceName("java:comp/env/jdbc/dataSource");
        municipioRowSet3.setCommand("SELECT ALL SIMIT.MUNICIPIO.IDMUNICIPIO, \n                    SIMIT.MUNICIPIO.NIT_M, \n                    SIMIT.MUNICIPIO.NOMBRE, \n                    SIMIT.MUNICIPIO.IDDEPARTAMENTO, \n                    SIMIT.MUNICIPIO.IDCONCESIONARIO, \n                    SIMIT.MUNICIPIO.CORREO, \n                    SIMIT.MUNICIPIO.INDRETROACTIVIDAD, \n                    SIMIT.MUNICIPIO.IDBANCO, \n                    SIMIT.MUNICIPIO.TIPOCUENTA, \n                   desencriptar(SIMIT.MUNICIPIO.CUENTA), \n                    SIMIT.MUNICIPIO.NIT_CTA, \n                    SIMIT.MUNICIPIO.INDLIQ_S_EXT, \n                    SIMIT.MUNICIPIO.INDLIQ_S_LOCAL, \n                    SIMIT.MUNICIPIO.INDLIQ_P_EXT, \n                    SIMIT.MUNICIPIO.INDLIQ_P_LOCAL \nFROM SIMIT.MUNICIPIO\nWHERE SIMIT.MUNICIPIO.IDMUNICIPIO <> '00000000'\nORDER BY SIMIT.MUNICIPIO.IDMUNICIPIO ASC \n");
        municipioRowSet3.setTableName("MUNICIPIO");
        menuRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        menuRowSet.setCommand("SELECT *   " +
            "    FROM SIMIT.MENU,   " +
            "         SIMIT.MENUXROL,   " +
            "         SIMIT.ROL,   " +
            "         SIMIT.ROLXPERSON,   " +
            "         SIMIT.PERSON,   " +
            "         SIMIT.PADRE   " +
            "   WHERE SIMIT.MENU.IDMENU (+) = SIMIT.MENUXROL.MENUID   " +
            "     AND SIMIT.ROL.ROLID  = SIMIT.MENUXROL.ROLID   " +
            "     AND SIMIT.ROLXPERSON.ROLID = SIMIT.ROL.ROLID " +
            "     AND SIMIT.PERSON.IDPERSON  = SIMIT.ROLXPERSON.PERSONID  " +
            "     AND SIMIT.MENU.PADREID = SIMIT.PADRE.IDPADRE  " +
            "     AND SIMIT.ROL.ENABLEROL  = 1 " +
            "     AND SIMIT.MENU.ENABLEMENU  = 1 " +
            "     AND SIMIT.PADRE.ENABLEPADRE  = 1 " +
            "     AND SIMIT.PERSON.ENABLEPERSON = 1 " +
            "     AND SIMIT.PERSON.IDPERSON = ? " +
            "  ORDER BY SIMIT.PADRE.IDPADRE, SIMIT.MENU.NAMEMENU ");
        menuRowSet.setTableName("MENU");
        personRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        personRowSet.setCommand("SELECT ALL PERSON.IDPERSON, \n                    PERSON.NAMEPERSON, \n                    PERSON.JOBTITLE, \n                    PERSON.ENABLEPERSON, \n                    PERSON.LASTUPDATE, \n                    PERSON.MAIL, TRANSLATE(PERSON.PASSWORD,'0z1y2x3w4v5u6t7s8r9qponmlkjihgfedcba', 'abcdefghijklmnopqrstuvwxyz0123456789') as PASSWORD \nFROM PERSON ");
        personRowSet.setTableName("PERSON");
        rolxpersonRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        //rolxpersonRowSet.setCommand("SELECT ALL SIMIT.ROLXPERSON.ROLID, \n                    SIMIT.ROLXPERSON.PERSONID \nFROM SIMIT.ROLXPERSON\nWHERE SIMIT.ROLXPERSON.PERSONID = ? ");
        rolxpersonRowSet.setCommand("SELECT * FROM SIMIT.ROLXPERSON WHERE SIMIT.ROLXPERSON.PERSONID = ? ");
        rolxpersonRowSet.setTableName("ROLXPERSON");
        rolRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        rolRowSet.setCommand("SELECT ALL SIMIT.ROL.ROLID, \n                    SIMIT.ROL.NAMEROL, \n                    SIMIT.ROL.ENABLEROL, \n SIMIT.ROL.ENABLEMOD \n FROM SIMIT.ROL\n WHERE SIMIT.ROL.ENABLEROL = 1 ");
        rolRowSet.setTableName("ROL");
        menuRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        menuRowSet1.setCommand("SELECT ALL SIMIT.MENU.IDMENU, \n                    SIMIT.MENU.NAMEMENU, \n                    SIMIT.MENU.PAGE, \n                    SIMIT.MENU.PADREID, \n                    SIMIT.MENU.ENABLEMENU, \n                    SIMIT.PADRE.IDPADRE, \n                    SIMIT.PADRE.NAMEPADRE, \n                    SIMIT.PADRE.ENABLEPADRE \nFROM SIMIT.MENU, SIMIT.PADRE\nWHERE SIMIT.PADRE.IDPADRE = SIMIT.MENU.PADREID\nORDER BY SIMIT.PADRE.IDPADRE ASC, \n                    SIMIT.MENU.NAMEMENU ASC ");
        menuRowSet1.setTableName("MENU");
        rolRowSet2.setDataSourceName("java:comp/env/jdbc/dataSource");
        rolRowSet2.setCommand("SELECT ALL SIMIT.ROL.ROLID, \n                    SIMIT.ROL.NAMEROL, \n                    SIMIT.ROL.ENABLEROL, \n SIMIT.ROL.ENABLEMOD \nFROM SIMIT.ROL ");
        rolRowSet2.setTableName("ROL");
        menuxrolRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        menuxrolRowSet.setCommand("SELECT * FROM SIMIT.MENUXROL WHERE SIMIT.MENUXROL.ROLID = ? ");
        menuxrolRowSet.setTableName("MENUXROL");
        padreRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        padreRowSet.setCommand("SELECT * FROM SIMIT.PADRE");
        padreRowSet.setTableName("PADRE");
        municipioRowSet4.setDataSourceName("java:comp/env/jdbc/dataSource");
        municipioRowSet4.setCommand("SELECT * FROM SIMIT.MUNICIPIO");
        municipioRowSet4.setTableName("MUNICIPIO");
        concesionarioRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        concesionarioRowSet1.setCommand("SELECT * FROM SIMIT.CONCESIONARIO\nwhere idconcesionario <> '00'\norder by idconcesionario");
        concesionarioRowSet1.setTableName("CONCESIONARIO");
        cta_dispersion_fcmRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        cta_dispersion_fcmRowSet.setCommand("SELECT ALL SIMIT.CTA_DISPERSION_FCM.NIT_FCM, \n                    SIMIT.CTA_DISPERSION_FCM.IDBANCOREC, \n                    SIMIT.CTA_DISPERSION_FCM.CTA_DISP_S_BANCO, \n                    SIMIT.CTA_DISPERSION_FCM.CTA_DISP_S_TIPO_CTA, \n                    desencriptar(SIMIT.CTA_DISPERSION_FCM.CTA_DISP_S_CTA) as CTA_DISP_S_CTA , \n                    SIMIT.CTA_DISPERSION_FCM.CTA_DISP_P_BANCO, \n                    SIMIT.CTA_DISPERSION_FCM.CTA_DISP_P_TIPO_CTA, \n                    desencriptar(SIMIT.CTA_DISPERSION_FCM.CTA_DISP_P_CTA) as CTA_DISP_P_CTA, \n                    SIMIT.CTA_DISPERSION_FCM.CTA_DISP_PA_BANCO, \n                    SIMIT.CTA_DISPERSION_FCM.CTA_DISP_PA_TIPO_CTA, \n                    desencriptar(SIMIT.CTA_DISPERSION_FCM.CTA_DISP_PA_CTA) as CTA_DISP_PA_CTA, \n                    SIMIT.BANCO.IDBANCO, \n                    SIMIT.BANCO.NOMBRE AS BANCONOMBRE \nFROM SIMIT.CTA_DISPERSION_FCM, SIMIT.BANCO\nWHERE SIMIT.CTA_DISPERSION_FCM.IDBANCOREC = SIMIT.BANCO.IDBANCO ");
        cta_dispersion_fcmRowSet.setTableName("CTA_DISPERSION_FCM");
        bancoRowSet2.setDataSourceName("java:comp/env/jdbc/dataSource");
        bancoRowSet2.setCommand("SELECT * FROM SIMIT.BANCO");
        bancoRowSet2.setTableName("BANCO");
        fcmRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        fcmRowSet.setCommand("SELECT * FROM SIMIT.FCM");
        fcmRowSet.setTableName("FCM");
        vw_cargosRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_cargosRowSet.setCommand("SELECT * FROM SIMIT.VW_CARGOS");
        vw_cargosRowSet.setTableName("VW_CARGOS");
        municipioRowSet5.setDataSourceName("java:comp/env/jdbc/dataSource");
        municipioRowSet5.setCommand("SELECT * FROM SIMIT.MUNICIPIO");
        municipioRowSet5.setTableName("MUNICIPIO");
        concesionarioRowSet2.setDataSourceName("java:comp/env/jdbc/dataSource");
        concesionarioRowSet2.setCommand("SELECT * FROM SIMIT.CONCESIONARIO");
        concesionarioRowSet2.setTableName("CONCESIONARIO");
        
        municipioRowSet6.setDataSourceName("java:comp/env/jdbc/dataSource");
        municipioRowSet6.setTableName("MUNICIPIO");
        municipioRowSet6.setConcurrency(java.sql.ResultSet.CONCUR_READ_ONLY);
        municipioRowSet6.setCommand("SELECT '00000000' AS IDMUNICIPIO, ' TODOS' AS NOMBRE FROM DUAL UNION SELECT ALL SIMIT.MUNICIPIO.IDMUNICIPIO, (  SIMIT.MUNICIPIO.NOMBRE || ' - ' ||  simit.departamento.nombre || ' - ' || SIMIT.MUNICIPIO.IDMUNICIPIO  ) NOMBRE FROM SIMIT.MUNICIPIO, simit.departamento  where simit.municipio.iddepartamento = simit.departamento.iddepartamento AND SIMIT.MUNICIPIO.IDMUNICIPIO <> '00000000' order by  NOMBRE");
        
        novmunicipioRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        novmunicipioRowSet.setCommand("SELECT * FROM NOVMUNICIPIO order by NOVMUNICIPIO.FECHAACT desc");
        novmunicipioRowSet.setTableName("NOVMUNICIPIO");
        
        novmunicipioGenRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        novmunicipioGenRowSet.setCommand("SELECT ALL ( TIPONOV || '-' || trim(to_char(NUMERONOV, '0000000'))) as NOVEDAD,           NOVMUNICIPIO.NOMBRE || '-' ||  NOVMUNICIPIO.IDMUNICIPIO AS MUNICIPIO,            NOVMUNICIPIO.FECHAVAL,           NOVMUNICIPIO.FECHAACT,            NOVMUNICIPIO.ESTADONOV FROM NOVMUNICIPIO WHERE NOVMUNICIPIO.ESTADONOV = ? order by NOVMUNICIPIO.FECHANOV DESC ");
        novmunicipioGenRowSet.setTableName("NOVMUNICIPIO");
        novmunicipioGenRowSet.setString(1,"INGRESADA");
        
        novterceroRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        novterceroRowSet.setCommand("SELECT ALL TIPONOV || '-' || trim(to_char(NUMERONOV, '0000000')) as NOVEDAD,\n                    MUNICIPIO.NOMBRE || '-' || MUNICIPIO.IDMUNICIPIO AS IDMUNICIPIO,\n                    NOVTERCERO.NIT_T || '-' || NOVTERCERO.NOMBRE AS TERCERO, \n                    NOVTERCERO.FECHAVAL, \n                    NOVTERCERO.FECHAACT, NOVTERCERO.FECHAANUL, NOVTERCERO.ESTADONOV, NOVTERCERO.FECHANOV \nFROM NOVTERCERO   INNER JOIN MUNICIPIO \nON NOVTERCERO.IDMUNICIPIO = MUNICIPIO.IDMUNICIPIO\n  WHERE NOVTERCERO.ESTADONOV = DECODE(?,'TODOS',NOVTERCERO.ESTADONOV,?)\nAND NOVTERCERO.IDMUNICIPIO = DECODE(?,'00000000',NOVTERCERO.IDMUNICIPIO,?) order by NOVTERCERO.fechanov desc");
        novterceroRowSet.setTableName("NOVTERCERO");
        
        novdias_dispersionRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        novdias_dispersionRowSet.setCommand("SELECT ALL TIPONOV || '-' || trim(to_char(NUMERONOV, '0000000')) as NOVEDAD, \n                    MUNICIPIO.NOMBRE || '-' || NOVDIAS_DISPERSION.IDMUNICIPIO AS MUNICIPIO, NOVDIAS_DISPERSION.IDMUNICIPIO,  \n                    NOVDIAS_DISPERSION.IDBANCO || '-' || BANCO.NOMBRE AS BANCO, \n                    NOVDIAS_DISPERSION.FECHAVAL, NOVDIAS_DISPERSION.FECHAANUL, \n                    NOVDIAS_DISPERSION.FECHAACT, \n                    NOVDIAS_DISPERSION.ESTADONOV, NOVDIAS_DISPERSION.FECHANOV \nFROM NOVDIAS_DISPERSION INNER JOIN MUNICIPIO ON NOVDIAS_DISPERSION.IDMUNICIPIO = MUNICIPIO.IDMUNICIPIO\nINNER JOIN BANCO ON NOVDIAS_DISPERSION.IDBANCO = BANCO.IDBANCO WHERE NOVDIAS_DISPERSION.ESTADONOV = DECODE(?,'TODOS',NOVDIAS_DISPERSION.ESTADONOV,?)\nAND NOVDIAS_DISPERSION.IDMUNICIPIO = DECODE(?,'00000000',NOVDIAS_DISPERSION.IDMUNICIPIO,?) order by NOVDIAS_DISPERSION.FECHANOV desc");
        novdias_dispersionRowSet.setTableName("NOVDIAS_DISPERSION");
        
        novvalidador_fechaRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        novvalidador_fechaRowSet.setCommand("SELECT  TIPONOV || '-' || trim(to_char(NUMERONOV, '0000000')) as NOVEDAD,\n             MUNICIPIO.NOMBRE || '-' || MUNICIPIO.IDMUNICIPIO AS Municipio,\n             IDVALIDADOR as Validador,\n             INDTIPO as Tipo_Validador,\n             FECHAACT as Activacion,\n             FECHAVAL  as Validacion,\n             ESTADONOV AS Estado\nFROM   NOVVALIDADOR_FECHA INNER JOIN MUNICIPIO ON \nNOVVALIDADOR_FECHA.IDMUNICIPIO = MUNICIPIO.IDMUNICIPIO  order by NOVVALIDADOR_FECHA.fechaact desc ");
        novvalidador_fechaRowSet.setTableName("NOVVALIDADOR_FECHA");
        
        novDevolucionRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        novDevolucionRowSet.setCommand("select TIPONOV || '-' || trim(to_char(NUMERONOV, '0000000')) as NOVEDAD, tipoidentificacion, identificacion, nombre, idbanco, tipocuenta, cuenta, idconcesionario, indtipo, idmunicipio, motivo, vdevolucion, vconcesionario, vfcm, vfondocoberturafcm, vfondocoberturaliq, vequilibrioeconomico, vsevial, vfcmpolca, vmunicipio, vfcmcontravencional, vconcontravencional, tiponov, numeronov, fechanov, usuarionov, usuarioval, fechaval, fechaact, estadonov, firma1, firma2, usuarioanul, fechaanul, fechaaplicacion, vpolca from novdevolucion order by fechaact desc ");
        novDevolucionRowSet.setTableName("NOVDEVOLUCION");
        
        novmunicipioRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        novmunicipioRowSet1.setCommand("SELECT ALL \n( SIMIT.NOVMUNICIPIO.TIPONOV || '-' || trim(to_char(SIMIT.NOVMUNICIPIO.NUMERONOV, '0000000'))) as NOVEDAD,\nSIMIT.NOVMUNICIPIO.IDMUNICIPIO, \n                    SIMIT.NOVMUNICIPIO.NIT_M, \n                    SIMIT.NOVMUNICIPIO.NOMBRE, \n                    SIMIT.NOVMUNICIPIO.IDDEPARTAMENTO, \n                    SIMIT.NOVMUNICIPIO.IDCONCESIONARIO, \n                    SIMIT.NOVMUNICIPIO.CORREO, \n                    SIMIT.NOVMUNICIPIO.INDRETROACTIVIDAD, \n                    SIMIT.NOVMUNICIPIO.IDBANCO, \n                    SIMIT.NOVMUNICIPIO.TIPOCUENTA, \n                    SIMIT.NOVMUNICIPIO.CUENTA, \n                    SIMIT.NOVMUNICIPIO.NIT_CTA, \n                    SIMIT.NOVMUNICIPIO.INDLIQ_S_EXT, \n                    SIMIT.NOVMUNICIPIO.INDLIQ_S_LOCAL, \n                    SIMIT.NOVMUNICIPIO.INDLIQ_P_EXT, \n                    SIMIT.NOVMUNICIPIO.INDLIQ_P_LOCAL, \n                    SIMIT.NOVMUNICIPIO.INDACUERDOPAGO_2002, \n                    SIMIT.NOVMUNICIPIO.TIPONOV, \n                    SIMIT.NOVMUNICIPIO.NUMERONOV, \n                    SIMIT.NOVMUNICIPIO.FECHANOV, \n                    SIMIT.NOVMUNICIPIO.USUARIONOV, \n                    SIMIT.NOVMUNICIPIO.USUARIOVAL, \n                    SIMIT.NOVMUNICIPIO.FECHAVAL, \n                    SIMIT.NOVMUNICIPIO.FECHAACT, \n                    SIMIT.NOVMUNICIPIO.ESTADONOV, \n                    SIMIT.NOVMUNICIPIO.FIRMA1, \n                    SIMIT.NOVMUNICIPIO.FIRMA2, \n                    SIMIT.NOVMUNICIPIO.MUNICIPIO_S, \n                    SIMIT.NOVMUNICIPIO.FCM_CONTRAVENCIONAL_S, \n                    SIMIT.NOVMUNICIPIO.CONCES_CONTRAVENCIONAL_S, \n                    SIMIT.NOVMUNICIPIO.ACUERDOPAGO_S, \n                    SIMIT.NOVMUNICIPIO.MUNICIPIO_P, \n                    SIMIT.NOVMUNICIPIO.FCM_CONTRAVENCIONAL_P, \n                    SIMIT.NOVMUNICIPIO.CONCES_CONTRAVENCIONAL_P, \n                    SIMIT.NOVMUNICIPIO.ACUERDOPAGO_P, \n                    SIMIT.NOVMUNICIPIO.USUARIOANUL, \n                    SIMIT.NOVMUNICIPIO.FECHAANUL, \n                    SIMIT.NOVMUNICIPIO.DNSAVVILLAS, \n                    SIMIT.NOVMUNICIPIO.DNSGRANBANCO \nFROM SIMIT.NOVMUNICIPIO\nWHERE SIMIT.NOVMUNICIPIO.ESTADONOV = DECODE(?,'TODOS',SIMIT.NOVMUNICIPIO.ESTADONOV,?)\nAND SIMIT.NOVMUNICIPIO.IDMUNICIPIO = DECODE(?,'00000000',SIMIT.NOVMUNICIPIO.IDMUNICIPIO,?)\nORDER BY SIMIT.NOVMUNICIPIO.FECHANOV DESC    ");
        novmunicipioRowSet1.setTableName("NOVMUNICIPIO");
        
        vw_municipio_novRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_municipio_novRowSet.setCommand("SELECT * FROM SIMIT.VW_MUNICIPIO_NOV");
        vw_municipio_novRowSet.setTableName("VW_MUNICIPIO_NOV");
        
        vw_conceptopagoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_conceptopagoRowSet.setCommand("SELECT * FROM SIMIT.VW_CONCEPTOPAGO");
        vw_conceptopagoRowSet.setTableName("VW_CONCEPTOPAGO");
        
        vw_cuentaorigenRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_cuentaorigenRowSet.setCommand("SELECT * FROM SIMIT.VW_CUENTAORIGEN");
        vw_cuentaorigenRowSet.setTableName("VW_CUENTAORIGEN");
        
        vw_soportesRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_soportesRowSet.setCommand("SELECT * FROM SIMIT.VW_SOPORTES WHERE id_recaudo_local_ajustes = ?");
        vw_soportesRowSet.setTableName("VW_SOPORTES");
        
        trxsinidentificarRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        trxsinidentificarRowSet.setCommand("select t.numSecuenciaReg, '0' as actualizar, nvl(t.idmunicipio,'SIN MUNICIPIO') as idMunicipioNew, nvl(t.idmunicipio,'SIN MUNICIPIO') as idMunicipioAct, t.indtipo as indTipoNew, t.indTipo as idTipoAct, t.p_consignado as pConsignadoNew, t.p_Consignado as pConsignadoAct, '' as observaciones, b.nombre as banco, t.cuenta, t.periodo, t.fechaTrx, t.descripcionTrx,  TO_CHAR(t.valorTrx,'999,999,999,999.99') AS valorTrx , t.oficinaOrigen from trxsinidentificar t, banco b, municipio m where t.idbanco = b.idbanco (+) and t.idmunicipio = m.idmunicipio (+) and  t.periodo = decode(?,'999999',t.periodo, ?) and t.cuenta = decode(?,'999999999',t.cuenta,?) and decode(t.idmunicipio,null,0,t.idmunicipio) = decode (?,'TODOS',decode(t.idmunicipio,null,0,t.idmunicipio),'SIN MUNICIPIO',0,?) and t.estadoiden = decode(?,'TO',t.estadoiden, ?)  and t.valorTrx = decode(?,0,t.valorTrx,?) and decode(t.concesionariozon,null,0,t.concesionariozon) = decode (?,'99',decode(t.concesionariozon,null,0,t.concesionariozon),'00',0,?)");
        trxsinidentificarRowSet.setTableName("TRXSINIDENTIFICAR");
        
        trxsinidentificarRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        trxsinidentificarRowSet1.setCommand("select t.numSecuenciaReg, '0' as actualizar, nvl(t.idmunicipio,'SIN MUNICIPIO') as idMunicipioNew, nvl(t.idmunicipio,'SIN MUNICIPIO') as idMunicipioAct, t.indtipo as indTipoNew, t.indTipo as idTipoAct, t.p_consignado as pConsignadoNew, t.p_Consignado as pConsignadoAct, '' as observaciones, b.nombre as banco, t.cuenta, t.periodo, t.fechaTrx, t.descripcionTrx,  TO_CHAR(t.valorTrx,'999,999,999,999.99') AS valorTrx , t.oficinaOrigen from trxsinidentificar t, banco b, municipio m where t.idbanco = b.idbanco (+) and t.idmunicipio = m.idmunicipio (+) and  t.periodo = decode(?,'999999',t.periodo, ?) and t.cuenta = decode(?,'999999999',t.cuenta,?) and decode(t.idmunicipio,null,0,t.idmunicipio) = decode (?,'TODOS',decode(t.idmunicipio,null,0,t.idmunicipio),'SIN MUNICIPIO',0,?) and t.estadoiden = decode(?,'TO',t.estadoiden, ?)  and t.valorTrx = decode(?,0,t.valorTrx,?) and decode(t.concesionariozon,null,0,t.concesionariozon) = decode (?,'99',decode(t.concesionariozon,null,0,t.concesionariozon),'00',0,?)");
        trxsinidentificarRowSet1.setTableName("TRXSINIDENTIFICAR");
        
        trxsinidentificarRowSet2.setDataSourceName("java:comp/env/jdbc/dataSource");
        trxsinidentificarRowSet2.setCommand("select t.numSecuenciaReg, '0' as actualizar, nvl(t.idmunicipioIden,'SIN MUNICIPIO') as idMunicipioNew, nvl(t.idmunicipio,'SIN MUNICIPIO') as idMunicipioAct, t.indtipoIden as indTipoNew, t.indTipo as idTipoAct, t.p_consignadoIden as pConsignadoNew, t.p_Consignado as pConsignadoAct, '' as observaciones, b.nombre as banco, t.cuenta, t.periodo, t.fechaTrx, t.descripcionTrx,  TO_CHAR(t.valorTrx,'999,999,999,999.99') AS valorTrx , t.oficinaOrigen, t.estadoiden estado from trxsinidentificar t, banco b, municipio m where t.idbanco = b.idbanco (+) and t.idmunicipio = m.idmunicipio (+) and  t.periodo = decode(?,'999999',t.periodo, ?) and t.cuenta = decode(?,'999999999',t.cuenta,?) and decode(t.idmunicipio,null,0,t.idmunicipio) = decode (?,'TODOS',decode(t.idmunicipio,null,0,t.idmunicipio),'SIN MUNICIPIO',0,?) and t.estadoiden = decode(?,'TO',t.estadoiden, ?)  and t.valorTrx = decode(?,0,t.valorTrx,?) and decode(t.concesionariozon,null,0,t.concesionariozon) = decode (?,'99',decode(t.concesionariozon,null,0,t.concesionariozon),'00',0,?)");
        trxsinidentificarRowSet2.setTableName("TRXSINIDENTIFICAR");
        
       
        trxsinidentificarRowSet3.setDataSourceName("java:comp/env/jdbc/dataSource");
        trxsinidentificarRowSet3.setCommand("select t.numSecuenciaReg, '0' as actualizar, nvl(t.idmunicipioIden,'SIN MUNICIPIO') as idMunicipioNew, nvl(t.idmunicipio,'SIN MUNICIPIO') as idMunicipioAct, t.indtipoiden as indTipoNew, t.indTipo as idTipoAct, t.p_consignadoiden as pConsignadoNew, t.p_Consignado as pConsignadoAct, '' as observaciones, b.nombre as banco, t.cuenta, t.periodo, t.fechaTrx, t.descripcionTrx,  TO_CHAR(t.valorTrx,'999,999,999,999.99') AS valorTrx , t.oficinaOrigen from trxsinidentificar t, banco b, municipio m where t.idbanco = b.idbanco (+) and t.idmunicipio = m.idmunicipio (+) and  t.periodo = decode(?,'999999',t.periodo, ?) and t.cuenta = decode(?,'999999999',t.cuenta,?) and decode(t.idmunicipio,null,0,t.idmunicipio) = decode (?,'TODOS',decode(t.idmunicipio,null,0,t.idmunicipio),'SIN MUNICIPIO',0,?) and t.estadoiden = decode(?,'TO',t.estadoiden, ?)  and t.valorTrx = decode(?,0,t.valorTrx,?) and decode(t.concesionariozon,null,0,t.concesionariozon) = decode (?,'99',decode(t.concesionariozon,null,0,t.concesionariozon),'00',0,?)");
        trxsinidentificarRowSet3.setTableName("TRXSINIDENTIFICAR");
        
        vw_periodotrfRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_periodotrfRowSet.setCommand("SELECT *  FROM SIMIT.VW_PERIODOTRF");
        vw_periodotrfRowSet.setTableName("VW_PERIODOTRF");
        
        vw_cuentatrfRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_cuentatrfRowSet.setCommand("SELECT * FROM SIMIT.VW_CUENTATRF");
        vw_cuentatrfRowSet.setTableName("VW_CUENTATRF");
        
        vw_municipiotrfRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_municipiotrfRowSet.setCommand("SELECT * FROM SIMIT.VW_MUNICIPIOTRF");
        vw_municipiotrfRowSet.setTableName("VW_MUNICIPIOTRF");
        
        vw_valortrfRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_valortrfRowSet.setCommand("SELECT * FROM SIMIT.VW_VALORTRF");
        vw_valortrfRowSet.setTableName("VW_VALORTRF");
        
        vw_concesionariotrfRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_concesionariotrfRowSet.setCommand("SELECT * FROM SIMIT.VW_CONCESIONARIOTRF");
        vw_concesionariotrfRowSet.setTableName("VW_CONCESIONARIOTRF");
        
        vw_indtipoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_indtipoRowSet.setCommand("SELECT * FROM SIMIT.VW_INDTIPO");
        vw_indtipoRowSet.setTableName("VW_INDTIPO");
        
        vw_pconsigandoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_pconsigandoRowSet.setCommand("SELECT * FROM SIMIT.VW_PCONSIGANDO");
        vw_pconsigandoRowSet.setTableName("VW_PCONSIGANDO");
        
        vw_cuentaorigendevRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_cuentaorigendevRowSet.setCommand("SELECT * FROM SIMIT.VW_CUENTAORIGENDEV");
        vw_cuentaorigendevRowSet.setTableName("VW_CUENTAORIGENDEV");
        
        novdevolucionRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        novdevolucionRowSet1.setCommand("SELECT ALL ( TIPONOV || '-' || trim(to_char(NUMERONOV, '0000000'))) as NOVEDAD,tipoidentificacion, identificacion, nombre, idbanco, tipocuenta, cuenta, idmunicipio, idconcesionario, indtipo, motivo, vdevolucion, vconcesionario, vfcm, vfondocoberturafcm, vfondocoberturaliq, vequilibrioeconomico, vpolca, vfcmpolca, vsevial, vmunicipio, vfcmcontravencional, vconcontravencional , tiponov, numeronov, fechanov, usuarionov, usuarioval, fechaval, fechaact, estadonov, firma1, firma2, usuarioanul, fechaanul, dnsavvillas, dnsgranbanco, fechaaplicacion, cuentarec FROM NOVDEVOLUCION wHERE ESTADONOV = DECODE(?,'TODOS',ESTADONOV,?) AND IDENTIFICACION = DECODE(?,'0',IDENTIFICACION,?) ORDER BY FECHANOV DESC ");
        novdevolucionRowSet1.setTableName("NOVDEVOLUCION");
        
        vw_identdevRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_identdevRowSet.setCommand("SELECT * FROM SIMIT.VW_IDENTDEV");
        vw_identdevRowSet.setTableName("VW_IDENTDEV");
        
        vw_reenvio_trfRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_reenvio_trfRowSet.setCommand("SELECT * FROM SIMIT.VW_REENVIO_TRF");
        vw_reenvio_trfRowSet.setTableName("VW_REENVIO_TRF");
        
        tipoctaRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        tipoctaRowSet.setCommand("SELECT * FROM SIMIT.TIPOCTA");
        tipoctaRowSet.setTableName("TIPOCTA");
        
        departamentalRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        departamentalRowSet.setCommand("SELECT d.*, m.nombre FROM SIMIT.DEPARTAMENTAL d,simit.municipio m where d.idmunicipio = m.idmunicipio and d.idDptal = ? ");
        departamentalRowSet.setTableName("DEPARTAMENTAL");
        
        
        vw_cobrosdevRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_cobrosdevRowSet.setCommand("SELECT * FROM SIMIT.VW_COBROSDEV where IDMUNICIPIO = decode(?,'00000000',IDMUNICIPIO,?) and indCobro = decode(?,'9',indCobro,?)");
        vw_cobrosdevRowSet.setTableName("VW_COBROSDEV");
        
        vw_cuentaorigenlocRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_cuentaorigenlocRowSet.setCommand("SELECT ori_cuenta, nombre FROM SIMIT.VW_CUENTAORIGENLOC");
        vw_cuentaorigenlocRowSet.setTableName("VW_CUENTAORIGENLOC");
        
        vw_cuentaorigenlocRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_cuentaorigenlocRowSet1.setCommand("SELECT * FROM SIMIT.VW_CUENTAORIGENFON");
        vw_cuentaorigenlocRowSet1.setTableName("VW_CUENTAORIGENLOC");
        
        vw_conceptopagolocRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_conceptopagolocRowSet.setCommand("SELECT * FROM SIMIT.VW_CONCEPTOPAGOLOC");
        vw_conceptopagolocRowSet.setTableName("VW_CONCEPTOPAGOLOC");
        bancoRowSet3.setDataSourceName("java:comp/env/jdbc/dataSource");
        bancoRowSet3.setCommand("SELECT * FROM SIMIT.BANCO");
        bancoRowSet3.setTableName("BANCO");
        
        par_contaRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        par_contaRowSet.setCommand("SELECT * FROM SIMIT.PAR_CONTA");
        par_contaRowSet.setTableName("PAR_CONTA");
        
        vw_municipiotrfRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_municipiotrfRowSet1.setCommand("SELECT * FROM SIMIT.VW_MUNICIPIOTRF");
        vw_municipiotrfRowSet1.setTableName("VW_MUNICIPIOTRF");
        vw_municipiotrfRowSet2.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_municipiotrfRowSet2.setCommand("SELECT * FROM SIMIT.VW_MUNICIPIOTRF");
        vw_municipiotrfRowSet2.setTableName("VW_MUNICIPIOTRF");
        bancoRowSet4.setDataSourceName("java:comp/env/jdbc/dataSource");
        bancoRowSet4.setCommand("SELECT * FROM SIMIT.BANCO");
        bancoRowSet4.setTableName("BANCO");
        pagofondoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        pagofondoRowSet.setCommand("select * from vw_pagofondo order by fechaaplicacion desc");
        pagofondoRowSet.setTableName("PAGOFONDO");
        
        vw_soportedevolucionRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_soportedevolucionRowSet.setCommand("SELECT * FROM SIMIT.VW_SOPORTEDEVOLUCION where numeronov = to_number(?)");
        vw_soportedevolucionRowSet.setTableName("VW_SOPORTEDEVOLUCION");
        
        vw_control_rptaRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_control_rptaRowSet.setCommand("SELECT * FROM SIMIT.VW_CONTROL_RPTA where idBanco = ?");
        vw_control_rptaRowSet.setTableName("VW_CONTROL_RPTA");
        
        // Ajustes Novedad reenvio ACH
        vw_conceptodevachRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_conceptodevachRowSet.setCommand("SELECT * FROM SIMIT.VW_CONCEPTODEVACH");
        vw_conceptodevachRowSet.setTableName("VW_CONCEPTODEVACH");
        
        vw_devolucionesachRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_devolucionesachRowSet.setCommand("SELECT '0' as actualizar, v.* FROM SIMIT.VW_DEVOLUCIONESACH V WHERE v.estadoTrf = 'REC' and V.CONCEPTO = ? ");
        vw_devolucionesachRowSet.setTableName("VW_DEVOLUCIONESACH");
        
        bancoRowSet5.setDataSourceName("java:comp/env/jdbc/dataSource");
        bancoRowSet5.setCommand("SELECT * FROM SIMIT.BANCO");
        bancoRowSet5.setTableName("BANCO");
        
        ajusteachRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        ajusteachRowSet.setCommand("SELECT * FROM SIMIT.AJUSTEACH");
        ajusteachRowSet.setTableName("AJUSTEACH");
        
        vw_conceptonovreenRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_conceptonovreenRowSet.setCommand("SELECT * FROM SIMIT.VW_CONCEPTONOVREEN order by 1");
        vw_conceptonovreenRowSet.setTableName("VW_CONCEPTONOVREEN");
        
        novreenvioRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        novreenvioRowSet.setCommand("SELECT ( TIPONOV || '-' || trim(to_char(NUMERONOV, '0000000'))) as NOVEDAD, n.* FROM SIMIT.NOVREENVIO N WHERE N.ESTADONOV = DECODE(?,'TODOS',N.ESTADONOV,?) AND N.CONCEPTO = DECODE(?,'TODOS',N.CONCEPTO,?) order by N.FECHANOV DESC ");
        novreenvioRowSet.setTableName("NOVREENVIO");
        
        vw_detallenovreenvioRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_detallenovreenvioRowSet.setCommand("SELECT * FROM SIMIT.VW_DETALLENOVREENVIO WHERE NOVEDAD = ? AND AUTORIDAD = DECODE(?,'TODOS',AUTORIDAD,?) ORDER BY referenciaTrf ");
        vw_detallenovreenvioRowSet.setTableName("VW_DETALLENOVREENVIO");
        
        vw_controltechoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_controltechoRowSet.setCommand("SELECT * FROM SIMIT.VW_CONTROLTECHO where substr(periodo,1,4) = ? and idConcesionario = ?");
        vw_controltechoRowSet.setTableName("VW_CONTROLTECHO");
        
        concesionarioRowSet3.setDataSourceName("java:comp/env/jdbc/dataSource");
        concesionarioRowSet3.setCommand("SELECT ALL SIMIT.CONCESIONARIO.IDCONCESIONARIO, \n                    ( SIMIT.CONCESIONARIO.IDCONCESIONARIO || ' - ' ||  SIMIT.CONCESIONARIO.NOMBRE ) AS NOMBRECONCESIOANRIO \nFROM SIMIT.CONCESIONARIO   \norder by SIMIT.CONCESIONARIO.IDCONCESIONARIO");
        concesionarioRowSet3.setTableName("CONCESIONARIO");
        
        tercero_otRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        tercero_otRowSet.setCommand("SELECT ALL SIMIT.TERCERO_OT.IDMUNICIPIO, \n                    SIMIT.TERCERO_OT.NIT_T, \n                    SIMIT.TERCERO_OT.NOMBRE, \n                    SIMIT.TERCERO_OT.CORREO, \n                    SIMIT.TERCERO_OT.IDBANCO, \n                    SIMIT.TERCERO_OT.TIPOCUENTA, \n                    SIMIT.TERCERO_OT.CUENTA, \n                    SIMIT.TERCERO_OT.JURISDICCION, \n                    SIMIT.TERCERO_OT.MEDIOIMPOSICION, \n                    SIMIT.TERCERO_OT.BASELIQUIDACION, \n                    SIMIT.TERCERO_OT.METODOBASE, \n                    SIMIT.TERCERO_OT.VALORBASE, \n                    SIMIT.TERCERO_OT.NUMTERCERO \nFROM SIMIT.TERCERO_OT\nWHERE SIMIT.TERCERO_OT.IDMUNICIPIO = ? ");
        tercero_otRowSet.setTableName("TERCERO_OT");
        
        trfpolcaRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        trfpolcaRowSet.setCommand("select to_char(fechatrf, 'yyyy-mm-dd') fechatrf , idbanco, tipocuenta, cuenta, metodotrf, valor, nit from simit.trfpolca order by fechatrf desc");
        trfpolcaRowSet.setTableName("TRFPOLCA");
        
        vw_histmunRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_histmunRowSet.setCommand("SELECT * FROM SIMIT.VW_HISTMUN");
        vw_histmunRowSet.setTableName("VW_HISTMUN");
        vw_terceroRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_terceroRowSet.setCommand("SELECT * FROM SIMIT.VW_TERCERO order by IDMUNICIPIO");
        vw_terceroRowSet.setTableName("VW_TERCERO");
        
        vw_tercero_otRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_tercero_otRowSet.setCommand("SELECT * FROM SIMIT.VW_TERCERO_OT WHERE IDMUNICIPIO = ? ORDER BY JURISDICCION, MEDIOIMPOSICION DESC, NUMTERCERO");
        vw_tercero_otRowSet.setTableName("VW_TERCERO_OT");
        
        vw_tercero_otRowSet1.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_tercero_otRowSet1.setCommand("SELECT * FROM SIMIT.VW_TERCERO_OT ORDER BY IDMUNICIPIO, JURISDICCION, MEDIOIMPOSICION DESC, NUMTERCERO");
        vw_tercero_otRowSet1.setTableName("VW_TERCERO_OT");

        transferencias_sdfRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        transferencias_sdfRowSet.setCommand("SELECT '0' as actualizar, t.* FROM SIMIT.TRANSFERENCIAS_SDF t where t.idmunicipio = ? and decode(?, 'SIN', nvl(t.fechainicio, to_date('19500101','yyyymmdd')), to_date('19510101','yyyymmdd') )  =  decode(?, 'SIN', to_date('19500101','yyyymmdd'), to_date('19510101','yyyymmdd')) and t.fec_corte >=  decode(?, 'COR', to_date(?,'yyyymmdd'), t.fec_corte ) and t.fec_corte <=  decode(?, 'COR', to_date(?,'yyyymmdd'), t.fec_corte )");
        transferencias_sdfRowSet.setTableName("TRANSFERENCIAS_SDF");

        vw_acuerdopagoperiodoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_acuerdopagoperiodoRowSet.setCommand("SELECT * FROM SIMIT.VW_ACUERDOPAGOPERIODO");
        vw_acuerdopagoperiodoRowSet.setTableName("VW_ACUERDOPAGOPERIODO");
        
        vw_acuerdopagoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_acuerdopagoRowSet.setCommand("SELECT * FROM SIMIT.VW_ACUERDOPAGO");
        vw_acuerdopagoRowSet.setTableName("VW_ACUERDOPAGO");
        
        vw_acuerdopago_consultaRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_acuerdopago_consultaRowSet.setCommand("SELECT * FROM SIMIT.VW_ACUERDOPAGO_CONSULTA where periodo = ?");
        vw_acuerdopago_consultaRowSet.setTableName("VW_ACUERDOPAGO_CONSULTA");
        
        vw_acuerdopagoestadoRowSet.setDataSourceName("java:comp/env/jdbc/dataSource");
        vw_acuerdopagoestadoRowSet.setCommand("SELECT * FROM SIMIT.VW_ACUERDOPAGOESTADO");
        vw_acuerdopagoestadoRowSet.setTableName("VW_ACUERDOPAGOESTADO");

    }

    private CachedRowSetXImpl transferencias_sdfRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTransferencias_sdfRowSet() {
        return transferencias_sdfRowSet;
    }

    public void setTransferencias_sdfRowSet(CachedRowSetXImpl crsxi) {
        this.transferencias_sdfRowSet = crsxi;
    }
  
    private CachedRowSetXImpl bancoRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getBancoRowSet() {
        return bancoRowSet;
    }
    
    public void setBancoRowSet(CachedRowSetXImpl crsxi) {
        this.bancoRowSet = crsxi;
    }
    
    private CachedRowSetXImpl salario_minimoRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getSalario_minimoRowSet() {
        return salario_minimoRowSet;
    }
    
    public void setSalario_minimoRowSet(CachedRowSetXImpl crsxi) {
        this.salario_minimoRowSet = crsxi;
    }
    
    private CachedRowSetXImpl fecha_no_habilRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getFecha_no_habilRowSet() {
        return fecha_no_habilRowSet;
    }
    
    public void setFecha_no_habilRowSet(CachedRowSetXImpl crsxi) {
        this.fecha_no_habilRowSet = crsxi;
    }
    
    private CachedRowSetXImpl logRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getLogRowSet() {
        return logRowSet;
    }
    
    public void setLogRowSet(CachedRowSetXImpl crsxi) {
        this.logRowSet = crsxi;
    }
    
    private CachedRowSetXImpl municipioRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMunicipioRowSet() {
        return municipioRowSet;
    }
    
    public void setMunicipioRowSet(CachedRowSetXImpl crsxi) {
        this.municipioRowSet = crsxi;
    }
    
    private CachedRowSetXImpl municipioRowSet6 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMunicipioRowSet6() {
        return municipioRowSet6;
    }
    
    public void setMunicipioRowSet6(CachedRowSetXImpl crsxi) {
        this.municipioRowSet6 = crsxi;
    }
    
    private CachedRowSetXImpl validador_fechaRowSet = new CachedRowSetXImpl();
    
    public com.sun.sql.rowset.CachedRowSetXImpl getValidador_fechaRowSet() {
        return validador_fechaRowSet;
    }
    
    public void setValidador_fechaRowSet(com.sun.sql.rowset.CachedRowSetXImpl crsxi) {
        this.validador_fechaRowSet = crsxi;
    }
    
    private CachedRowSetXImpl errorsRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getErrorsRowSet() {
        return errorsRowSet;
    }
    
    public void setErrorsRowSet(CachedRowSetXImpl crsxi) {
        this.errorsRowSet = crsxi;
    }
    
    private CachedRowSetXImpl bancoRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getBancoRowSet1() {
        return bancoRowSet1;
    }
    
    public void setBancoRowSet1(CachedRowSetXImpl crsxi) {
        this.bancoRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl cta_recaudo_fcmRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getCta_recaudo_fcmRowSet() {
        return cta_recaudo_fcmRowSet;
    }
    
    public void setCta_recaudo_fcmRowSet(CachedRowSetXImpl crsxi) {
        this.cta_recaudo_fcmRowSet = crsxi;
    }
    
    private CachedRowSetXImpl municipioRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMunicipioRowSet1() {
        return municipioRowSet1;
    }
    
    public void setMunicipioRowSet1(CachedRowSetXImpl crsxi) {
        this.municipioRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl concesionarioRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getConcesionarioRowSet() {
        return concesionarioRowSet;
    }
    
    public void setConcesionarioRowSet(CachedRowSetXImpl crsxi) {
        this.concesionarioRowSet = crsxi;
    }
    
    private CachedRowSetXImpl cta_recaudo_concesionarioRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getCta_recaudo_concesionarioRowSet() {
        return cta_recaudo_concesionarioRowSet;
    }
    
    public void setCta_recaudo_concesionarioRowSet(CachedRowSetXImpl crsxi) {
        this.cta_recaudo_concesionarioRowSet = crsxi;
    }
    
    private CachedRowSetXImpl cta_recaudo_fcmRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getCta_recaudo_fcmRowSet1() {
        return cta_recaudo_fcmRowSet1;
    }
    
    public void setCta_recaudo_fcmRowSet1(CachedRowSetXImpl crsxi) {
        this.cta_recaudo_fcmRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl dias_dispersionRowSet = new CachedRowSetXImpl();
    
    
    public CachedRowSetXImpl getDias_dispersionRowSet() {
        return dias_dispersionRowSet;
    }
    
    public void setDias_dispersionRowSet(CachedRowSetXImpl crsxi) {
        this.dias_dispersionRowSet = crsxi;
    }
    
    private CachedRowSetXImpl municipioRowSet2 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMunicipioRowSet2() {
        return municipioRowSet2;
    }
    
    public void setMunicipioRowSet2(CachedRowSetXImpl crsxi) {
        this.municipioRowSet2 = crsxi;
    }
    
    private CachedRowSetXImpl terceroRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getTerceroRowSet() {
        return terceroRowSet;
    }
    
    public void setTerceroRowSet(CachedRowSetXImpl crsxi) {
        this.terceroRowSet = crsxi;
    }
    
    private CachedRowSetXImpl cta_recaudo_concesionarioRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getCta_recaudo_concesionarioRowSet1() {
        return cta_recaudo_concesionarioRowSet1;
    }
    
    public void setCta_recaudo_concesionarioRowSet1(CachedRowSetXImpl crsxi) {
        this.cta_recaudo_concesionarioRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl recaudo_local_ajustesRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getRecaudo_local_ajustesRowSet() {
        return recaudo_local_ajustesRowSet;
    }
    
    public void setRecaudo_local_ajustesRowSet(CachedRowSetXImpl crsxi) {
        this.recaudo_local_ajustesRowSet = crsxi;
    }
    
    private CachedRowSetXImpl cta_recaudo_fcmRowSet2 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getCta_recaudo_fcmRowSet2() {
        return cta_recaudo_fcmRowSet2;
    }
    
    public void setCta_recaudo_fcmRowSet2(CachedRowSetXImpl crsxi) {
        this.cta_recaudo_fcmRowSet2 = crsxi;
    }
    
    private CachedRowSetXImpl municipioRowSet3 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMunicipioRowSet3() {
        return municipioRowSet3;
    }
    
    public void setMunicipioRowSet3(CachedRowSetXImpl crsxi) {
        this.municipioRowSet3 = crsxi;
    }
    private CachedRowSetXImpl menuRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMenuRowSet() {
        return menuRowSet;
    }
    
    public void setMenuRowSet(CachedRowSetXImpl crsxi) {
        this.menuRowSet = crsxi;
    }
    
    private CachedRowSetXImpl personRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getPersonRowSet() {
        return personRowSet;
    }
    
    public void setPersonRowSet(CachedRowSetXImpl crsxi) {
        this.personRowSet = crsxi;
    }
    
    private CachedRowSetXImpl rolRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getRolRowSet() {
        return rolRowSet;
    }
    
    public void setRolRowSet(CachedRowSetXImpl crsxi) {
        this.rolRowSet = crsxi;
    }
    
    private CachedRowSetXImpl rolxpersonRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getRolxpersonRowSet() {
        return rolxpersonRowSet;
    }
    
    public void setRolxpersonRowSet(CachedRowSetXImpl crsxi) {
        this.rolxpersonRowSet = crsxi;
    }
    
    private CachedRowSetXImpl rolRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getRolRowSet1() {
        return rolRowSet1;
    }
    
    public void setRolRowSet1(CachedRowSetXImpl crsxi) {
        this.rolRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl menuRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMenuRowSet1() {
        return menuRowSet1;
    }
    
    public void setMenuRowSet1(CachedRowSetXImpl crsxi) {
        this.menuRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl rolRowSet2 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getRolRowSet2() {
        return rolRowSet2;
    }
    
    public void setRolRowSet2(CachedRowSetXImpl crsxi) {
        this.rolRowSet2 = crsxi;
    }
    
    private CachedRowSetXImpl menuxrolRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMenuxrolRowSet() {
        return menuxrolRowSet;
    }
    
    public void setMenuxrolRowSet(CachedRowSetXImpl crsxi) {
        this.menuxrolRowSet = crsxi;
    }
    
    private CachedRowSetXImpl padreRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getPadreRowSet() {
        return padreRowSet;
    }
    
    public void setPadreRowSet(CachedRowSetXImpl crsxi) {
        this.padreRowSet = crsxi;
    }
    
    private CachedRowSetXImpl municipioRowSet4 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMunicipioRowSet4() {
        return municipioRowSet4;
    }
    
    public void setMunicipioRowSet4(CachedRowSetXImpl crsxi) {
        this.municipioRowSet4 = crsxi;
    }
    
    private CachedRowSetXImpl concesionarioRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getConcesionarioRowSet1() {
        return concesionarioRowSet1;
    }
    
    public void setConcesionarioRowSet1(CachedRowSetXImpl crsxi) {
        this.concesionarioRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl cta_dispersion_fcmRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getCta_dispersion_fcmRowSet() {
        return cta_dispersion_fcmRowSet;
    }
    
    public void setCta_dispersion_fcmRowSet(CachedRowSetXImpl crsxi) {
        this.cta_dispersion_fcmRowSet = crsxi;
    }
    
    private CachedRowSetXImpl bancoRowSet2 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getBancoRowSet2() {
        return bancoRowSet2;
    }
    
    public void setBancoRowSet2(CachedRowSetXImpl crsxi) {
        this.bancoRowSet2 = crsxi;
    }
    
    private CachedRowSetXImpl fcmRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getFcmRowSet() {
        return fcmRowSet;
    }
    
    public void setFcmRowSet(CachedRowSetXImpl crsxi) {
        this.fcmRowSet = crsxi;
    }
    
    private CachedRowSetXImpl vw_cargosRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getVw_cargosRowSet() {
        return vw_cargosRowSet;
    }
    
    public void setVw_cargosRowSet(CachedRowSetXImpl crsxi) {
        this.vw_cargosRowSet = crsxi;
    }
    
    private CachedRowSetXImpl municipioRowSet5 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getMunicipioRowSet5() {
        return municipioRowSet5;
    }
    
    public void setMunicipioRowSet5(CachedRowSetXImpl crsxi) {
        this.municipioRowSet5 = crsxi;
    }
    
    private CachedRowSetXImpl concesionarioRowSet2 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getConcesionarioRowSet2() {
        return concesionarioRowSet2;
    }
    
    public void setConcesionarioRowSet2(CachedRowSetXImpl crsxi) {
        this.concesionarioRowSet2 = crsxi;
    }
    
    private CachedRowSetXImpl novmunicipioRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovmunicipioRowSet1() {
        return novmunicipioRowSet1;
    }
    
    public void setNovmunicipioRowSet1(CachedRowSetXImpl crsxi) {
        this.novmunicipioRowSet1 = crsxi;
    }
    
    private CachedRowSetXImpl novdevolucionRowSet1 = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovdevolucionRowSet1() {
        return novdevolucionRowSet1;
    }
    
    public void setNovdevolucionRowSet1(CachedRowSetXImpl crsxi) {
        this.novdevolucionRowSet1 = crsxi;
    }

    private CachedRowSetXImpl vw_municipio_novRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getVw_municipio_novRowSet() {
        return vw_municipio_novRowSet;
    }
    
    public void setVw_municipio_novRowSet(CachedRowSetXImpl crsxi) {
        this.vw_municipio_novRowSet = crsxi;
    }
    
    private CachedRowSetXImpl vw_conceptopagoRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getVw_conceptopagoRowSet() {
        return vw_conceptopagoRowSet;
    }
    
    public void setVw_conceptopagoRowSet(CachedRowSetXImpl crsxi) {
        this.vw_conceptopagoRowSet = crsxi;
    }
    
    private CachedRowSetXImpl vw_cuentaorigenRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getVw_cuentaorigenRowSet() {
        return vw_cuentaorigenRowSet;
    }
    
    public void setVw_cuentaorigenRowSet(CachedRowSetXImpl crsxi) {
        this.vw_cuentaorigenRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_soportesRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_soportesRowSet() {
        return vw_soportesRowSet;
    }

    public void setVw_soportesRowSet(CachedRowSetXImpl crsxi) {
        this.vw_soportesRowSet = crsxi;
    }

    private CachedRowSetXImpl trxsinidentificarRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTrxsinidentificarRowSet() {
        return trxsinidentificarRowSet;
    }

    public void setTrxsinidentificarRowSet(CachedRowSetXImpl crsxi) {
        this.trxsinidentificarRowSet = crsxi;
    }

    private CachedRowSetXImpl trxsinidentificarRowSet1 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTrxsinidentificarRowSet1() {
        return trxsinidentificarRowSet1;
    }

    public void setTrxsinidentificarRowSet1(CachedRowSetXImpl crsxi) {
        this.trxsinidentificarRowSet1 = crsxi;
    }

    private CachedRowSetXImpl trxsinidentificarRowSet2 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTrxsinidentificarRowSet2() {
        return trxsinidentificarRowSet2;
    }

    public void setTrxsinidentificarRowSet2(CachedRowSetXImpl crsxi) {
        this.trxsinidentificarRowSet2 = crsxi;
    }

    private CachedRowSetXImpl trxsinidentificarRowSet3 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTrxsinidentificarRowSet3() {
        return trxsinidentificarRowSet3;
    }

    public void setTrxsinidentificarRowSet3(CachedRowSetXImpl crsxi) {
        this.trxsinidentificarRowSet3 = crsxi;
    }

    private CachedRowSetXImpl vw_periodotrfRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_periodotrfRowSet() {
        return vw_periodotrfRowSet;
    }

    public void setVw_periodotrfRowSet(CachedRowSetXImpl crsxi) {
        this.vw_periodotrfRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_cuentatrfRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_cuentatrfRowSet() {
        return vw_cuentatrfRowSet;
    }

    public void setVw_cuentatrfRowSet(CachedRowSetXImpl crsxi) {
        this.vw_cuentatrfRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_municipiotrfRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_municipiotrfRowSet() {
        return vw_municipiotrfRowSet;
    }

    public void setVw_municipiotrfRowSet(CachedRowSetXImpl crsxi) {
        this.vw_municipiotrfRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_valortrfRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_valortrfRowSet() {
        return vw_valortrfRowSet;
    }

    public void setVw_valortrfRowSet(CachedRowSetXImpl crsxi) {
        this.vw_valortrfRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_concesionariotrfRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_concesionariotrfRowSet() {
        return vw_concesionariotrfRowSet;
    }

    public void setVw_concesionariotrfRowSet(CachedRowSetXImpl crsxi) {
        this.vw_concesionariotrfRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_indtipoRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_indtipoRowSet() {
        return vw_indtipoRowSet;
    }

    public void setVw_indtipoRowSet(CachedRowSetXImpl crsxi) {
        this.vw_indtipoRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_pconsigandoRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_pconsigandoRowSet() {
        return vw_pconsigandoRowSet;
    }

    public void setVw_pconsigandoRowSet(CachedRowSetXImpl crsxi) {
        this.vw_pconsigandoRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_cuentaorigendevRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_cuentaorigendevRowSet() {
        return vw_cuentaorigendevRowSet;
    }

    public void setVw_cuentaorigendevRowSet(CachedRowSetXImpl crsxi) {
        this.vw_cuentaorigendevRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_identdevRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_identdevRowSet() {
        return vw_identdevRowSet;
    }

    public void setVw_identdevRowSet(CachedRowSetXImpl crsxi) {
        this.vw_identdevRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_reenvio_trfRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_reenvio_trfRowSet() {
        return vw_reenvio_trfRowSet;
    }

    public void setVw_reenvio_trfRowSet(CachedRowSetXImpl crsxi) {
        this.vw_reenvio_trfRowSet = crsxi;
    }

    private CachedRowSetXImpl tipoctaRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTipoctaRowSet() {
        return tipoctaRowSet;
    }

    public void setTipoctaRowSet(CachedRowSetXImpl crsxi) {
        this.tipoctaRowSet = crsxi;
    }

    
    private CachedRowSetXImpl departamentalRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getDepartamentalRowSet() {
        return departamentalRowSet;
    }

    public void setDepartamentalRowSet(CachedRowSetXImpl crsxi) {
        this.departamentalRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_cobrosdevRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_cobrosdevRowSet() {
        return vw_cobrosdevRowSet;
    }

    public void setVw_cobrosdevRowSet(CachedRowSetXImpl crsxi) {
        this.vw_cobrosdevRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_cuentaorigenlocRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_cuentaorigenlocRowSet() {
        return vw_cuentaorigenlocRowSet;
    }

    public void setVw_cuentaorigenlocRowSet(CachedRowSetXImpl crsxi) {
        this.vw_cuentaorigenlocRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_cuentaorigenlocRowSet1 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_cuentaorigenlocRowSet1() {
        return vw_cuentaorigenlocRowSet1;
    }

    public void setVw_cuentaorigenlocRowSet1(CachedRowSetXImpl crsxi) {
        this.vw_cuentaorigenlocRowSet1 = crsxi;
    }

    private CachedRowSetXImpl vw_conceptopagolocRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_conceptopagolocRowSet() {
        return vw_conceptopagolocRowSet;
    }

    public void setVw_conceptopagolocRowSet(CachedRowSetXImpl crsxi) {
        this.vw_conceptopagolocRowSet = crsxi;
    }

    private CachedRowSetXImpl bancoRowSet3 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getBancoRowSet3() {
        return bancoRowSet3;
    }

    public void setBancoRowSet3(CachedRowSetXImpl crsxi) {
        this.bancoRowSet3 = crsxi;
    }

    private CachedRowSetXImpl par_contaRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getPar_contaRowSet() {
        return par_contaRowSet;
    }

    public void setPar_contaRowSet(CachedRowSetXImpl crsxi) {
        this.par_contaRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_municipiotrfRowSet1 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_municipiotrfRowSet1() {
        return vw_municipiotrfRowSet1;
    }

    public void setVw_municipiotrfRowSet1(CachedRowSetXImpl crsxi) {
        this.vw_municipiotrfRowSet1 = crsxi;
    }

    private CachedRowSetXImpl vw_municipiotrfRowSet2 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_municipiotrfRowSet2() {
        return vw_municipiotrfRowSet2;
    }

    public void setVw_municipiotrfRowSet2(CachedRowSetXImpl crsxi) {
        this.vw_municipiotrfRowSet2 = crsxi;
    }

    private CachedRowSetXImpl bancoRowSet4 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getBancoRowSet4() {
        return bancoRowSet4;
    }

    public void setBancoRowSet4(CachedRowSetXImpl crsxi) {
        this.bancoRowSet4 = crsxi;
    }

    private CachedRowSetXImpl pagofondoRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getPagofondoRowSet() {
        return pagofondoRowSet;
    }

    public void setPagofondoRowSet(CachedRowSetXImpl crsxi) {
        this.pagofondoRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_soportedevolucionRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_soportedevolucionRowSet() {
        return vw_soportedevolucionRowSet;
    }

    public void setVw_soportedevolucionRowSet(CachedRowSetXImpl crsxi) {
        this.vw_soportedevolucionRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_control_rptaRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_control_rptaRowSet() {
        return vw_control_rptaRowSet;
    }

    public void setVw_control_rptaRowSet(CachedRowSetXImpl crsxi) {
        this.vw_control_rptaRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_conceptodevachRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_conceptodevachRowSet() {
        return vw_conceptodevachRowSet;
    }

    public void setVw_conceptodevachRowSet(CachedRowSetXImpl crsxi) {
        this.vw_conceptodevachRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_devolucionesachRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_devolucionesachRowSet() {
        return vw_devolucionesachRowSet;
    }

    public void setVw_devolucionesachRowSet(CachedRowSetXImpl crsxi) {
        this.vw_devolucionesachRowSet = crsxi;
    }

    private CachedRowSetXImpl bancoRowSet5 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getBancoRowSet5() {
        return bancoRowSet5;
    }

    public void setBancoRowSet5(CachedRowSetXImpl crsxi) {
        this.bancoRowSet5 = crsxi;
    }

    private CachedRowSetXImpl ajusteachRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getAjusteachRowSet() {
        return ajusteachRowSet;
    }

    public void setAjusteachRowSet(CachedRowSetXImpl crsxi) {
        this.ajusteachRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_conceptonovreenRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_conceptonovreenRowSet() {
        return vw_conceptonovreenRowSet;
    }

    public void setVw_conceptonovreenRowSet(CachedRowSetXImpl crsxi) {
        this.vw_conceptonovreenRowSet = crsxi;
    }

    private CachedRowSetXImpl novreenvioRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getNovreenvioRowSet() {
        return novreenvioRowSet;
    }

    public void setNovreenvioRowSet(CachedRowSetXImpl crsxi) {
        this.novreenvioRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_detallenovreenvioRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_detallenovreenvioRowSet() {
        return vw_detallenovreenvioRowSet;
    }

    public void setVw_detallenovreenvioRowSet(CachedRowSetXImpl crsxi) {
        this.vw_detallenovreenvioRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_controltechoRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_controltechoRowSet() {
        return vw_controltechoRowSet;
    }

    public void setVw_controltechoRowSet(CachedRowSetXImpl crsxi) {
        this.vw_controltechoRowSet = crsxi;
    }

    private CachedRowSetXImpl concesionarioRowSet3 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getConcesionarioRowSet3() {
        return concesionarioRowSet3;
    }

    public void setConcesionarioRowSet3(CachedRowSetXImpl crsxi) {
        this.concesionarioRowSet3 = crsxi;
    }

    private CachedRowSetXImpl cachedRowSetXImpl1 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getCachedRowSetXImpl1() {
        return cachedRowSetXImpl1;
    }

    public void setCachedRowSetXImpl1(CachedRowSetXImpl crsxi) {
        this.cachedRowSetXImpl1 = crsxi;
    }

    private CachedRowSetXImpl tercero_otRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTercero_otRowSet() {
        return tercero_otRowSet;
    }

    public void setTercero_otRowSet(CachedRowSetXImpl crsxi) {
        this.tercero_otRowSet = crsxi;
    }

    private CachedRowSetXImpl trfpolcaRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getTrfpolcaRowSet() {
        return trfpolcaRowSet;
    }

    public void setTrfpolcaRowSet(CachedRowSetXImpl crsxi) {
        this.trfpolcaRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_histmunRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_histmunRowSet() {
        return vw_histmunRowSet;
    }

    public void setVw_histmunRowSet(CachedRowSetXImpl crsxi) {
        this.vw_histmunRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_terceroRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_terceroRowSet() {
        return vw_terceroRowSet;
    }

    public void setVw_terceroRowSet(CachedRowSetXImpl crsxi) {
        this.vw_terceroRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_tercero_otRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_tercero_otRowSet() {
        return vw_tercero_otRowSet;
    }

    public void setVw_tercero_otRowSet(CachedRowSetXImpl crsxi) {
        this.vw_tercero_otRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_tercero_otRowSet1 = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_tercero_otRowSet1() {
        return vw_tercero_otRowSet1;
    }

    public void setVw_tercero_otRowSet1(CachedRowSetXImpl crsxi) {
        this.vw_tercero_otRowSet1 = crsxi;
    }

	    private CachedRowSetXImpl vw_acuerdopagoperiodoRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_acuerdopagoperiodoRowSet() {
        return vw_acuerdopagoperiodoRowSet;
    }

    public void setVw_acuerdopagoperiodoRowSet(CachedRowSetXImpl crsxi) {
        this.vw_acuerdopagoperiodoRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_acuerdopagoRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_acuerdopagoRowSet() {
        return vw_acuerdopagoRowSet;
    }

    public void setVw_acuerdopagoRowSet(CachedRowSetXImpl crsxi) {
        this.vw_acuerdopagoRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_acuerdopago_consultaRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_acuerdopago_consultaRowSet() {
        return vw_acuerdopago_consultaRowSet;
    }

    public void setVw_acuerdopago_consultaRowSet(CachedRowSetXImpl crsxi) {
        this.vw_acuerdopago_consultaRowSet = crsxi;
    }

    private CachedRowSetXImpl vw_acuerdopagoestadoRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getVw_acuerdopagoestadoRowSet() {
        return vw_acuerdopagoestadoRowSet;
    }

    public void setVw_acuerdopagoestadoRowSet(CachedRowSetXImpl crsxi) {
        this.vw_acuerdopagoestadoRowSet = crsxi;
    }


       
    // </editor-fold>
    
    /**
     * <p>Construct a new session data bean instance.</p>
     */
    public SessionBean1() {
    }
    
    /**
     * <p>This method is called when this bean is initially added to
     * session scope.  Typically, this occurs as a result of evaluating
     * a value binding or method binding expression, which utilizes the
     * managed bean facility to instantiate this bean and store it into
     * session scope.</p>
     *
     * <p>You may customize this method to initialize and cache data values
     * or resources that are required for the lifetime of a particular
     * user session.</p>
     */
    public void init() {
        // Perform initializations inherited from our superclass
        super.init();
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("SessionBean1 Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
        
        // </editor-fold>
        // Perform application initialization that must complete
        // *after* managed components are initialized
        // TODO - add your own initialization code here
    }
    
    /**
     * <p>This method is called when the session containing it is about to be
     * passivated.  Typically, this occurs in a distributed servlet container
     * when the session is about to be transferred to a different
     * container instance, after which the <code>activate()</code> method
     * will be called to indicate that the transfer is complete.</p>
     *
     * <p>You may customize this method to release references to session data
     * or resources that can not be serialized with the session itself.</p>
     */
    public void passivate() {
    }
    
    /**
     * <p>This method is called when the session containing it was
     * reactivated.</p>
     *
     * <p>You may customize this method to reacquire references to session
     * data or resources that could not be serialized with the
     * session itself.</p>
     */
    public void activate() {
    }
    
    /**
     * <p>This method is called when this bean is removed from
     * session scope.  Typically, this occurs as a result of
     * the session timing out or being terminated by the application.</p>
     *
     * <p>You may customize this method to clean up resources allocated
     * during the execution of the <code>init()</code> method, or
     * at any later time during the lifetime of the application.</p>
     */
    public void destroy() {
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }
    
    /**
     * Conserva el valor de la propiedad user.
     */
    private String user;
    
    /**
     * Getter para la propiedad user.
     * @return Valor de la propiedad user.
     */
    public String getUser() {
        return this.user;
    }
    
    /**
     * Setter para la propiedad user.
     * @param user Nuevo valor de la propiedad user.
     */
    public void setUser(String user) {
        this.user = user;
    }
    
    /**
     * Holds value of property tipoRecaudo.
     */
    private String tipoRecaudo;
    
    /**
     * Getter for property tipoRecaudo.
     * @return Value of property tipoRecaudo.
     */
    public String getTipoRecaudo() {
        return this.tipoRecaudo;
    }
    
    /**
     * Setter for property tipoRecaudo.
     * @param tipoRecaudo New value of property tipoRecaudo.
     */
    public void setTipoRecaudo(String tipoRecaudo) {
        this.tipoRecaudo = tipoRecaudo;
    }
    
    private String nameUser;
    
    public String getnameUser() {
        return this.nameUser;
    }
    
    /**
     * Setter para la propiedad user.
     * @param user Nuevo valor de la propiedad user.
     */
    public void setnameUser(String nameUser) {
        this.nameUser = nameUser;
    }
    
    private String novedad;
    
    public String getnovedad() {
        return this.novedad;
    }
    
    /**
     * Setter para la propiedad novedad.
     * @param user Nuevo valor de la propiedad novedad.
     */
    public void setnovedad(String novedad) {
        this.novedad = novedad;
    }
    
    private String tipoVoBo;
    
    public String getTipoVoBo() {
        return this.tipoVoBo;
    }
    
    /**
     * Setter para la propiedad user.
     * @param user Nuevo valor de la propiedad user.
     */
    public void setTipoVoBo(String tipoVoBo) {
        this.tipoVoBo = tipoVoBo;
    }
    
    private String numAjuste;
    
    public String getNumAjuste() {
        return this.numAjuste;
    }
    
    public void setNumAjuste(String numAjuste) {
        this.numAjuste = numAjuste;
    }
    
    private CachedRowSetXImpl novmunicipioRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovmunicipioRowSet() {
        return novmunicipioRowSet;
    }
    
    public void setNovmunicipioRowSet(CachedRowSetXImpl crsxi) {
        this.novmunicipioRowSet = crsxi;
    }
    
    private CachedRowSetXImpl novmunicipioGenRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovmunicipioGenRowSet() {
        return novmunicipioGenRowSet;
    }
    
    public void setNovmunicipioGenRowSet(CachedRowSetXImpl crsxi) {
        this.novmunicipioGenRowSet = crsxi;
    }
    
    private CachedRowSetXImpl novterceroRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovterceroRowSet() {
        return novterceroRowSet;
    }
    
    public void setNovterceroRowSet(CachedRowSetXImpl crsxi) {
        this.novterceroRowSet = crsxi;
    }
    
    private CachedRowSetXImpl novdias_dispersionRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovdias_dispersionRowSet() {
        return novdias_dispersionRowSet;
    }
    
    public void setNovdias_dispersionRowSet(CachedRowSetXImpl crsxi) {
        this.novdias_dispersionRowSet = crsxi;
    }
    
    private CachedRowSetXImpl novvalidador_fechaRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovvalidador_fechaRowSet() {
        return novvalidador_fechaRowSet;
    }
    
    public void setNovvalidador_fechaRowSet(CachedRowSetXImpl crsxi) {
        this.novvalidador_fechaRowSet = crsxi;
    }
    
    private CachedRowSetXImpl novDevolucionRowSet = new CachedRowSetXImpl();
    
    public CachedRowSetXImpl getNovDevolucionRowSet() {
        return novDevolucionRowSet;
    }
    
    public void setNovDevolucionRowSet(CachedRowSetXImpl crsxi) {
        this.novDevolucionRowSet = crsxi;
    }
    
    
}
