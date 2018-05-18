/*
 * Constants.java
 *
 * Created on 29 de octubre de 2007, 01:49
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wasimit;

import java.math.BigDecimal;
import javax.faces.context.FacesContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import javax.sql.DataSource;
/**
 *
 * @author Administrador
 */
public abstract class Constants {
    
    
    public static String MSG_UPD_OK = "Registro Actualizado Correctamente";
    public static String MSG_INS_OK = "Registro Insertado Correctamente";
    public static String MSG_DEL_OK = "Registro Eliminado Correctamente";
    public static String MSG_NOK = "Operacion Incorrecta";
    
    public static String VOBOFINANCIERA = "VOBOFINANCIERA";
    public static String VOBOSIMIT = "VOBOSIMIT";
    public static String VOBOPOLCA = "VOBOPOLCA";
    public static String VALIDADA = "VALIDADA";
    
    //public static String AMBIENTE = "TEST";
    //public static String AMBIENTE = "DESA";
    public static String AMBIENTE = "PROD";
    
    public static String VERSION = "Version 2018.05.16";
    
    public static String menuadd =
            SQLTools.buildProcedureCall("pk_auten", "i_menu", 7);
    
    public static String menumod =
            SQLTools.buildProcedureCall("pk_auten", "u_menu", 7);
    
    public static String menueli =
            SQLTools.buildProcedureCall("pk_auten", "d_menu", 3);
    
    public static String roladd =
            SQLTools.buildProcedureCall("pk_auten", "i_rol", 6);
    
    public static String rolmod =
            SQLTools.buildProcedureCall("pk_auten", "u_rol", 6);
    
    public static String rolxmenuadd =
            SQLTools.buildProcedureCall("pk_auten", "u_menuxrol", 4);
    
    public static String usuarioadd =
            SQLTools.buildProcedureCall("pk_auten", "i_usuario", 8);
    
    public static String usuariomod =
            SQLTools.buildProcedureCall("pk_auten", "u_usuario", 8);
    
    public static String usuarioxroladd =
            SQLTools.buildProcedureCall("pk_auten", "u_rolxusuario", 4);
    
    public static String validaUser =
            SQLTools.buildProcedureCall("pk_auten", "q_usuario", 5);
    
    public static String EliminarUsuario =
            SQLTools.buildProcedureCall("pk_auten", "d_usuario", 3);
    
    public static String EliminarRol =
            SQLTools.buildProcedureCall("pk_auten", "d_rol", 3);
    
    public static String bancoadd =
            SQLTools.buildProcedureCall("pk_param", "i_banco", 9);
    
    public static String bancoupd =
            SQLTools.buildProcedureCall("pk_param", "u_banco", 9);
    
    public static String bancodel =
            SQLTools.buildProcedureCall("pk_param", "d_banco", 3);
    
    public static String bancoque =
            SQLTools.buildProcedureCall("pk_param", "q_banco", 9);
    
    
    public static String salminadd =
            SQLTools.buildProcedureCall("pk_param", "i_salario_minimo", 4);
    
    public static String salmindel =
            SQLTools.buildProcedureCall("pk_param", "d_salario_minimo", 3);
    
    
    public static String fecnohabadd =
            SQLTools.buildProcedureCall("pk_param", "i_fecha_no_habil", 5);
    
    public static String fecnohabdel =
            SQLTools.buildProcedureCall("pk_param", "d_fecha_no_habil", 3);
    
    public static String carguearchivo =
            SQLTools.buildProcedureCall("pk_proc", "i_archivo", 4);
    
    public static String carguearchivoCon =
            SQLTools.buildProcedureCall("PK_RECLOC", "i_archivoCon", 5);

    public static String carguearchivoDev =
            SQLTools.buildProcedureCall("PK_NOVDEV", "i_archivoDev", 5);

    public static String carguearchivoBin =
            SQLTools.buildProcedureCall("pk_proc", "i_archivoBin", 4);
    
    public static String carguearchivoSop =
            SQLTools.buildProcedureCall("pk_proc", "i_archivoSoporte", 7);

    public static String cargueDocSop =
            SQLTools.buildProcedureCall("pk_novdev", "i_archivoSoporte", 7);

    public static String carguearchivoDes =
            SQLTools.buildProcedureCall("pk_desencriptar", "i_archivoDesencriptar", 8);

    public static String carguearchivoDel =
            SQLTools.buildProcedureCall("pk_proc", "d_archivoSoporte", 3);
    
    public static String soporteDevDel =
            SQLTools.buildProcedureCall("pk_novdev", "d_archivoSoporte", 3);

    public static String carguearchivoQue =
            SQLTools.buildProcedureCall("pk_proc", "q_archivoSoporte", 7);
    
    public static String verDocDev =
            SQLTools.buildProcedureCall("pk_novdev", "q_archivoSoporte", 7);

    public static String validaarchivo =
            SQLTools.buildProcedureCall("pk_proc", "v_archivo", 6);
    
    public static String validadorQue =
            SQLTools.buildProcedureCall("pk_param", "q_validador_fecha", 17);
    
    public static String validadorIns =
            SQLTools.buildProcedureCall("pk_param", "i_validador_fecha", 21);
    
    public static String validadorUpd =
            SQLTools.buildProcedureCall("pk_param", "u_validador_fecha", 21);
    
    public static String validadorDel =
            SQLTools.buildProcedureCall("pk_param", "d_validador_fecha", 5);
    
    public static String fcmAdd =
            SQLTools.buildProcedureCall("pk_param", "i_fcm", 40);
    
    public static String fcmQue =
            SQLTools.buildProcedureCall("pk_param", "q_fcm", 40);
    
    public static String fondoQue =
            SQLTools.buildProcedureCall("pk_param", "q_fondo", 6);
    
    public static String fondoAct =
            SQLTools.buildProcedureCall("pk_param", "a_fondo", 6);
    
    public static String FcmCtaRecLocAdd =
            SQLTools.buildProcedureCall("pk_param", "i_cta_recaudo_fcm", 10);
    
    public static String FcmCtaRecLocDel =
            SQLTools.buildProcedureCall("pk_param", "d_cta_recaudo_fcm", 10);
    
    public static String FcmCtaRecLocUpd =
            SQLTools.buildProcedureCall("pk_param", "u_cta_recaudo_fcm", 10);
    
    
    
    
    public static String CtaRecLocQue =
            SQLTools.buildProcedureCall("pk_param", "q_cta_recaudo_fcm", 10);
    
    public static String CtaRecLocDel =
            SQLTools.buildProcedureCall("pk_param", "d_cta_recaudo_fcm", 5);
    
    
    
    public static String MunicipioAdd =
            SQLTools.buildProcedureCall("pk_param", "i_municipio", 25);
    
    public static String MunicipioUpd =
            SQLTools.buildProcedureCall("pk_param", "u_municipio", 25);
    
    public static String MunicipioQue =
            SQLTools.buildProcedureCall("pk_param", "q_municipio", 25);
    
    public static String MunicipioDel =
            SQLTools.buildProcedureCall("pk_param", "d_municipio", 3);
    
    
    
    public static String DiasDispersionAdd =
            SQLTools.buildProcedureCall("pk_param", "i_dias_dispersion", 12);
    
    
    public static String DiasDispersionUpd =
            SQLTools.buildProcedureCall("pk_param", "u_dias_dispersion", 12);
    
    public static String DiasDispersionQue =
            SQLTools.buildProcedureCall("pk_param", "q_dias_dispersion", 12);
    
    public static String DiasDispersionDel =
            SQLTools.buildProcedureCall("pk_param", "d_dias_dispersion", 4);
    
    
    public static String TercerosDel =
            SQLTools.buildProcedureCall("pk_param", "d_tercero", 4);
    
    public static String TercerosQue =
            SQLTools.buildProcedureCall("pk_param", "q_tercero", 13);
    
    public static String Q_TercerOT =
            SQLTools.buildProcedureCall("PK_TERCERO_OT", "q_terceroOt", 16);
    
    public static String D_TercerOT =
            SQLTools.buildProcedureCall("PK_TERCERO_OT", "d_terceroOt", 8);

    public static String U_TercerOT =
            SQLTools.buildProcedureCall("PK_TERCERO_OT", "U_terceroOt", 16);

    public static String TercerosAdd =
            SQLTools.buildProcedureCall("pk_param", "i_tercero", 13);
    
    public static String TercerosUpd =
            SQLTools.buildProcedureCall("pk_param", "u_tercero", 13);
    
    
    public static String ConcesionarioQue =
            SQLTools.buildProcedureCall("pk_param", "q_concesionario", 58);
    
    public static String ConcesionarioAdd =
            SQLTools.buildProcedureCall("pk_param", "i_concesionario", 58);
    
    public static String ConcesionarioUpd =
            SQLTools.buildProcedureCall("pk_param", "u_concesionario", 58);
    
    public static String ConcesionarioDel =
            SQLTools.buildProcedureCall("pk_param", "d_concesionario", 3);
    
    public static String PagoFonAdd =
            SQLTools.buildProcedureCall("pk_param", "a_pago", 6);
    
    public static String PagoFonDel =
            SQLTools.buildProcedureCall("pk_param", "d_pago", 3);

    public static String CtaRecExtAdd =
            SQLTools.buildProcedureCall("pk_param", "i_cta_recaudo_concesionario", 10);
    
    public static String CtaRecExtUpd =
            SQLTools.buildProcedureCall("pk_param", "u_cta_recaudo_concesionario", 10);
    
    public static String CtaRecExtDel =
            SQLTools.buildProcedureCall("pk_param", "d_cta_recaudo_concesionario", 6);
    
    public static String CtaRecExtQue =
            SQLTools.buildProcedureCall("pk_param", "q_cta_recaudo_concesionario", 10);
    
    public static String CtaDisConAdd =
            SQLTools.buildProcedureCall("pk_param", "i_cta_dispersion_concesionario", 44);
    
    public static String CtaDisConQue =
            SQLTools.buildProcedureCall("pk_param", "q_cta_dispersion_concesionario", 44);
    
    public static String RecLocAjuAdd =
            SQLTools.buildProcedureCall("pk_proc", "i_recaudo_local_ajustes", 24);
    
    public static String RecLocAjuDel =
            SQLTools.buildProcedureCall("pk_proc", "d_recaudo_local_ajustes", 3);
    
    public static String RecLocAjuQue =
            SQLTools.buildProcedureCall("pk_proc", "q_recaudo_local_ajustes", 18);
    
    public static String CarRecExt =
            SQLTools.buildProcedureCall("pk_proc", "carga_recaudo_externo", 8);
    
    public static String liquidaRecaudoLocal =
            SQLTools.buildProcedureCall("pk_proc", "l_recaudo_local", 9);

    public static String liquidaDeposSinIdent =
            SQLTools.buildProcedureCall("pk_recloc", "liquidaDeposSinIdent", 8);

    public static String contaSinIde =
            SQLTools.buildProcedureCall("pk_recloc", "contabiliza_trf_siniden", 8);
    
    public static String contaDevAch =
            SQLTools.buildProcedureCall("PK_DEVOLACH", "contabiliza_rechazo_ach", 8);

    public static String LiqRecExt =
            SQLTools.buildProcedureCall("pk_proc", "liquida_recaudo_externo", 5);
    
    public static String dispersaRecaudoLocal =
            SQLTools.buildProcedureCall("pk_proc", "dispersa_recaudo_local", 8);
    
    public static String causaIngRecaudoLocal =
            SQLTools.buildProcedureCall("pk_proc", "causa_ing_recaudo_local", 8);
    
    public static String causaGasRecaudoLocal =
            SQLTools.buildProcedureCall("pk_proc", "causa_gas_recaudo_local", 8);
    
    //Reportes
    public static String generaRep1 =
            SQLTools.buildProcedureCall("pk_proc", "generaRpt1", 8);
    
    
    public static String dispersaRecaudoExterno =
            SQLTools.buildProcedureCall("pk_proc", "dispersa_recaudo_externo", 5);
    
    
    public static String causaGasRecaudoExt =
            SQLTools.buildProcedureCall("pk_proc", "causa_gas_recaudo_externo", 8);
    
    public static String causaIngRecaudoExt =
            SQLTools.buildProcedureCall("pk_proc", "causa_ing_recaudo_externo", 8);
    
    public static String uPerson =
            SQLTools.buildProcedureCall("pk_param", "u_person", 5);
    
    
    public static String FcmCtaDisFCMAdd =
            SQLTools.buildProcedureCall("pk_param", "i_cta_dispersion_fcm", 16);
    
    public static String FcmCtaDisFCMDel =
            SQLTools.buildProcedureCall("pk_param", "d_cta_dispersion_fcm", 4);
    
    public static String FcmCtaDisFCMUpd =
            SQLTools.buildProcedureCall("pk_param", "u_cta_dispersion_fcm", 16);
    
    public static String FcmCtaDisFCMQue =
            SQLTools.buildProcedureCall("pk_param", "q_cta_dispersion_fcm", 16);
    
    public static String FcmValidarFecha =
            SQLTools.buildProcedureCall("pk_param", "validarRangoFecha", 10);
    
    
    public static String trfRecExt =
            SQLTools.buildProcedureCall("pk_proc", "transferir_recaudo_externo", 5);

        public static String trfRecLoc =
            SQLTools.buildProcedureCall("pk_recloc", "transferir_recaudo_local", 5);

    public static String valTrfRecExt =
            SQLTools.buildProcedureCall("pk_proc", "valida_transferencia", 5);

    public static String iDptal =
            SQLTools.buildProcedureCall("pk_param", "i_dptal", 4);

    public static String dDptal =
            SQLTools.buildProcedureCall("pk_param", "d_dptal", 4);
    // procesos envio 
    public static String envioBanco =
            SQLTools.buildProcedureCall("pk_proc", "envio_Banco", 7);
    
    public static String envioBancoRepro =
            SQLTools.buildProcedureCall("pk_proc", "envio_Banco_repro", 10);
    
    public static String reproLiquidacion =
            SQLTools.buildProcedureCall("pk_reproceso", "e_reproceso", 10);

    public static String envioBancoLocal =
            SQLTools.buildProcedureCall("pk_envio", "envio_Banco_local", 7);
        
    public static String desencriptaBanco =
            SQLTools.buildProcedureCall("pk_proc", "desencripta_Banco", 7);
    
    public static String verLogDesencripta =
            SQLTools.buildProcedureCall("pk_proc", "verLogDesencripta", 2);
    
    public static String verLogEnvioAvvillas =
            SQLTools.buildProcedureCall("pk_proc", "verLogEnvioAvvillas", 1);
    
    public static String verLogEnvioDavivienda =
            SQLTools.buildProcedureCall("pk_proc", "verLogEnvioDavivienda", 1);
    
    public static String verLogEnvioAvvillasLoc =
            SQLTools.buildProcedureCall("pk_envio", "verLogEnvioAvvillasLoc", 1);
    
    public static String verLogEnvioDaviviendaLoc =
            SQLTools.buildProcedureCall("pk_envio", "verLogEnvioDaviviendaLoc", 1);
    
    public static String trfRecExtFec =
            SQLTools.buildProcedureCall("pk_proc", "transferir_rec_ext_conFecha", 5);
    
    public static String AprobarRep =
            SQLTools.buildProcedureCall("pk_proc", "aprobar_reproceso", 7);
    
    public static String AprobarRepLoc   =
            SQLTools.buildProcedureCall("pk_recloc", "aprobar_reproceso", 11);
    
    public static String VistoBuenoS =
            SQLTools.buildProcedureCall("pk_Visto", "vistoBuenoS", 12);

    public static String VistoBuenoP =
            SQLTools.buildProcedureCall("pk_Visto", "vistoBuenoP", 12);

    public static String VboSimit =
            SQLTools.buildProcedureCall("pk_Visto", "vboSimit", 12);

    public static String VboPolca =
            SQLTools.buildProcedureCall("pk_Visto", "vboPolca", 12);

    //Novedades Municipio
    public static String NovMunicipioAdd =
            SQLTools.buildProcedureCall("pk_proc", "i_Novmunicipio", 33);
    
    public static String NovMunicipioUpd =
            SQLTools.buildProcedureCall("pk_proc", "u_Novmunicipio", 33);
    
    public static String NovMunicipioUpdEst =
            SQLTools.buildProcedureCall("pk_proc", "u_NovmunicipioEst", 5);
    
    public static String NovMunicipioQue =
            SQLTools.buildProcedureCall("pk_proc", "q_Novmunicipio", 33);
    
    public static String NovMunicipioEQue =
            SQLTools.buildProcedureCall("pk_proc", "q_NovmunicipioE", 5);
    
    
//Novedades Terceros
    public static String NovTercerosAdd =
            SQLTools.buildProcedureCall("pk_proc", "i_Novterceros", 22);
    
    public static String NovTercerosUpdEst =
            SQLTools.buildProcedureCall("pk_proc", "u_NovtercerosEst", 5);
    
    public static String NovTercerosQue =
            SQLTools.buildProcedureCall("pk_proc", "q_Novtercero", 19);
    
    public static String NovTercerosEQue =
            SQLTools.buildProcedureCall("pk_proc", "q_NovterceroE", 5);
    
    //Novedades DiasDispersion
    public static String NovDiasDispersionAdd =
            SQLTools.buildProcedureCall("pk_proc", "i_NovDiasDispersion", 22);
    
    public static String NovDiasDispersionUpdEst =
            SQLTools.buildProcedureCall("pk_proc", "u_NovDiasDispersionEst", 5);
    
    public static String NovDiasDispersionQue =
            SQLTools.buildProcedureCall("pk_proc", "q_NovDiasDispersion", 18);
    
    public static String NovDiasDispersionEQue =
            SQLTools.buildProcedureCall("pk_proc", "q_NovDiasDispersionE", 5);
    
    //Novedades ValidadorFecha
    public static String NovValidadorAdd =
            SQLTools.buildProcedureCall("pk_proc", "i_NovValidador_fecha", 28);
    
    public static String NovValidadorUpdEst =
            SQLTools.buildProcedureCall("pk_proc", "u_NovValidador_fechaEst", 5);
    
    public static String NovValidadorQue =
            SQLTools.buildProcedureCall("pk_proc", "q_NovValidador_fecha", 23);
    
    public static String NovValidadorEQue =
            SQLTools.buildProcedureCall("pk_proc", "q_NovValidador_fechaE", 5);
    
    //Novedades Devolucion
    public static String NovDevolucionAdd =
            SQLTools.buildProcedureCall("PK_NOVDEV", "i_NovDevolucion", 44);

    public static String NovDevolucionUpdEst =
            SQLTools.buildProcedureCall("PK_NOVDEV", "u_NovDevolucionEst", 5);
    
    public static String NovDevolucionQue =
            SQLTools.buildProcedureCall("PK_NOVDEV", "q_NovDevolucion", 39);
    
    public static String NovDevolucionEQue =
            SQLTools.buildProcedureCall("PK_NOVDEV", "q_NovDevolucionE", 5);
    
    public static String NovDevolucionSug =
            SQLTools.buildProcedureCall("PK_NOVDEV", "q_NovDevolucionSug", 25);

    public static String NovDevolucionSugImp =
            SQLTools.buildProcedureCall("PK_NOVDEV", "q_NovDevolucionSugImp", 26);

    public static String q_concesFunc =
            SQLTools.buildProcedureCall("PK_RECLOC", "q_concesFunc", 4);

    public static String u_deposito =
            SQLTools.buildProcedureCall("PK_RECLOC", "u_deposito", 7);

    public static String u_reenviotrf =
            SQLTools.buildProcedureCall("PK_DEV", "u_reenvioTrf", 7);

    public static String g_deudaLocal =
            SQLTools.buildProcedureCall("pk_recloc", "g_deudaLocal", 2);

    public static String a_parConta =
            SQLTools.buildProcedureCall("pk_param", "a_parConta", 6);
    
    public static String m_parConta =
            SQLTools.buildProcedureCall("pk_param", "m_parConta", 6);

    public static String d_parConta =
            SQLTools.buildProcedureCall("pk_param", "d_parConta", 4);

    public static String validaRecaudoLocal =
            SQLTools.buildProcedureCall("pk_recloc", "sp_valida_recaudo_local", 4);
        
    public static String qControlenvio =
            SQLTools.buildProcedureCall("PK_CONTROL", "qControlEnvio", 56);

    public static String regControlenvio =
            SQLTools.buildProcedureCall("PK_CONTROL", "regControlEnvio", 54);

    public static String qRespuestaBanco =
            SQLTools.buildProcedureCall("PK_CONTROL", "qRespuestaBanco", 4);

    //Novedades Reenvio
    public static String NovReenvioAdd =
            SQLTools.buildProcedureCall("PK_NOVREENVIO", "i_NovReenvio", 13);

    public static String NovReenvioDetalleAdd =
            SQLTools.buildProcedureCall("PK_NOVREENVIO", "i_NovReenvioDetalle", 5);

    public static String NovReenvioUpdEst =
            SQLTools.buildProcedureCall("PK_NOVREENVIO", "u_NovReenvioEst", 5);
    
    public static String NovReenvioQue =
            SQLTools.buildProcedureCall("PK_NOVREENVIO", "q_NovReenvio", 18);
    
    public static String NovReenvioEQue =
            SQLTools.buildProcedureCall("PK_NOVREENVIO", "q_NovReenvioE", 5);

// recaudo local x autoridad
    public static String distribuirLocal =
            SQLTools.buildProcedureCall("PK_RECLOC_X_AUT", "distribuirLocal", 7);

    public static String actualizarTecho =
            SQLTools.buildProcedureCall("PK_TECHO", "u_techo", 8);

    public static String consultarTecho =
            SQLTools.buildProcedureCall("PK_TECHO", "q_techo", 8);

    public static String conFondContig =
            SQLTools.buildProcedureCall("PK_TECHO", "q_fondo", 8);

    public static String actFondContig =
            SQLTools.buildProcedureCall("PK_TECHO", "u_fondo", 8);

    public static String actCtaTrfPolca =
            SQLTools.buildProcedureCall("PK_TRFPOLCA", "u_cta", 13);

    public static String delCtaTrfPolca =
            SQLTools.buildProcedureCall("PK_TRFPOLCA", "d_cta", 4);

    public static String modTrfSdf =
            SQLTools.buildProcedureCall("PK_RECLOC", "mod_Trf_Sdf", 6);

    public static String actAcuerdo =
            SQLTools.buildProcedureCall("PK_ACUERDO", "act_acuerdo", 14);
			
    public static String  ServidorAplicaciones() {
        
        String propiedades = System.getProperties().toString();
        if (propiedades.contains("tomcat"))
            return "TOMCAT";
        
        return "OAS";
    }
    
    public static String JndiTomcat = "java:comp/env/jdbc/dataSource";
    public static String JndiOAS = "jdbc/dataSource";
    
    
    public static DataSource getJdbcDataSource() throws NamingException {
        Context initContext  = new InitialContext();
        DataSource ds = null;
        
        if ( Constants.ServidorAplicaciones().equals("TOMCAT") ) {
            //Context envContext  = (Context)initContext.lookup("java:/comp/env");
            ds = (DataSource)initContext.lookup(Constants.JndiTomcat);
        } else {
            ds = (DataSource)initContext.lookup(Constants.JndiOAS);
        }
        return ds;
    }
    
     public static String darPathApp(FacesContext fc) {
        
        HttpServletRequest request = (HttpServletRequest) fc.getExternalContext().getRequest();
        String ruta = request.getContextPath() + "/";
        return ruta;
        
      /*if (AMBIENTE.equals("DESA"))
            return "/financiera/";
        
        if (AMBIENTE.equals("TEST"))
            return "/pruebas-financiera/";
        
        if (AMBIENTE.equals("PROD"))
            return "/financiera/";
        
        return "";
       */
        
    }
    
}
