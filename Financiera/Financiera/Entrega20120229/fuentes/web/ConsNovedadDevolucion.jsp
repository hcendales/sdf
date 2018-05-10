<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadDevolucion.page1}" id="page1">
            <ui:html binding="#{ConsNovedadDevolucion.html1}" id="html1">
                <ui:head binding="#{ConsNovedadDevolucion.head1}" id="head1">
                    <ui:link binding="#{ConsNovedadDevolucion.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadDevolucion.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadDevolucion.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadDevolucion.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Novedad Devolucion de Pago"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ConsNovedadDevolucion.label1}" id="label1" style="color: red; left: 288px; top: 168px; position: absolute" text="DATOS INFRACTOR"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddBanco}" disabled="true" id="ddBanco" immediate="true"
                            items="#{ConsNovedadDevolucion.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 456px; top: 312px; position: absolute; width: 312px" tabIndex="4"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco}" id="lbBanco" style="left: 312px; top: 312px; position: absolute" text="Banco"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddMunicipio}" disabled="true" id="ddMunicipio"
                            items="#{ConsNovedadDevolucion.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            style="left: 456px; top: 528px; position: absolute; width: 312px" tabIndex="7"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label2}" id="label2" style="left: 312px; top: 192px; position: absolute" text="Nombre"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label3}" id="label3" style="left: 312px; top: 216px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label4}" id="label4" style="left: 312px; top: 240px; position: absolute" text="Numero Identificacion"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label5}" id="label5" style="color: red; left: 288px; top: 288px; position: absolute" text="CUENTA PARA DEVOLUCION"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco1}" id="lbBanco1" style="left: 312px; top: 336px; position: absolute" text="Tipo Cuenta"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco2}" id="lbBanco2" style="left: 312px; top: 360px; position: absolute" text="Numero Cuenta"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label6}" id="label6" style="color: red; left: 288px; top: 480px; position: absolute" text="DATOS DEVOLUCION"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco3}" id="lbBanco3" style="left: 312px; top: 528px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco4}" id="lbBanco4" style="left: 312px; top: 552px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco5}" id="lbBanco5" style="left: 312px; top: 576px; position: absolute" text="Tipo Comparendo"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco6}" id="lbBanco6" style="left: 312px; top: 672px; position: absolute" text="Motivo Devolucion"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco7}" id="lbBanco7" style="left: 312px; top: 696px; position: absolute" text="Valor Devolucion"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label7}" id="label7" style="color: red; left: 288px; top: 744px; position: absolute" text="VALORES DEVOLUCION"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco8}" id="lbBanco8" style="left: 312px; top: 768px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco9}" id="lbBanco9" style="left: 312px; top: 792px; position: absolute" text="FCM"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco10}" id="lbBanco10" style="left: 312px; top: 816px; position: absolute" text="Fondo Cobertura Simit"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco11}" id="lbBanco11" style="left: 312px; top: 840px; position: absolute" text="Fondo Cobertura Concesionario"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco12}" id="lbBanco12" style="left: 312px; top: 864px; position: absolute" text="Equilibrio Economico"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco13}" id="lbBanco13" style="left: 312px; top: 960px; position: absolute" text="SEVIAL 2.7%"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco14}" id="lbBanco14" style="left: 312px; top: 912px; position: absolute" text="POLCA"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco15}" id="lbBanco15" style="left: 312px; top: 936px; position: absolute" text="FCM POLCA 1.8%"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco16}" id="lbBanco16" style="left: 312px; top: 1008px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco17}" id="lbBanco17" style="left: 312px; top: 1032px; position: absolute" text="Contravencional  FCM"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco18}" id="lbBanco18" style="left: 312px; top: 1056px; position: absolute" text="Contravencional  Concesionario"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtNombre}" disabled="true" id="txtNombre" maxLength="50"
                            style="left: 456px; top: 192px; position: absolute; width: 432px" tabIndex="1"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtNumIdentificacion}" disabled="true" id="txtNumIdentificacion" maxLength="13"
                            style="left: 456px; top: 240px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddTipoIde}" disabled="true" id="ddTipoIde"
                            items="#{ConsNovedadDevolucion.ddTipoIdeDefaultOptions.options}" style="left: 456px; top: 216px; position: absolute; width: 120px" tabIndex="2"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddTipoCta}" disabled="true" id="ddTipoCta"
                            items="#{ConsNovedadDevolucion.ddTipoCtaDefaultOptions.options}" style="left: 456px; top: 336px; position: absolute; width: 144px" tabIndex="5"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtCuenta}" disabled="true" id="txtCuenta" maxLength="16"
                            style="left: 456px; top: 360px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddTipoCom}" disabled="true" id="ddTipoCom"
                            items="#{ConsNovedadDevolucion.ddTipoComDefaultOptions.options}" style="left: 456px; top: 576px; position: absolute; width: 96px" tabIndex="9"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtMotivo}" disabled="true" id="txtMotivo" maxLength="50"
                            style="left: 456px; top: 672px; position: absolute; width: 432px" tabIndex="10"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorDev}" disabled="true" id="txtValorDev" maxLength="7"
                            style="left: 456px; top: 696px; position: absolute; width: 144px" tabIndex="11"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorConces}" disabled="true" id="txtValorConces" maxLength="10"
                            style="left: 504px; top: 768px; position: absolute; width: 144px" tabIndex="13"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorFcm}" disabled="true" id="txtValorFcm" maxLength="10"
                            style="left: 504px; top: 792px; position: absolute; width: 144px" tabIndex="14"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorFonSim}" disabled="true" id="txtValorFonSim" maxLength="10"
                            style="left: 504px; top: 816px; position: absolute; width: 144px" tabIndex="15"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorFonCon}" disabled="true" id="txtValorFonCon" maxLength="10"
                            style="left: 504px; top: 840px; position: absolute; width: 144px" tabIndex="16"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorEquil}" disabled="true" id="txtValorEquil" maxLength="10"
                            style="left: 504px; top: 864px; position: absolute; width: 144px" tabIndex="17"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorPolca}" disabled="true" id="txtValorPolca" maxLength="10"
                            style="left: 504px; top: 912px; position: absolute; width: 144px" tabIndex="18"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorFcmPolca}" disabled="true" id="txtValorFcmPolca" maxLength="10"
                            style="left: 504px; top: 936px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorsevial}" disabled="true" id="txtValorsevial" maxLength="10"
                            style="left: 504px; top: 888px; position: absolute; width: 144px" tabIndex="20"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorMunicipio}" disabled="true" id="txtValorMunicipio" maxLength="10"
                            style="left: 504px; top: 1008px; position: absolute; width: 144px" tabIndex="21"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorContravFcm}" disabled="true" id="txtValorContravFcm" maxLength="10"
                            style="left: 504px; top: 1032px; position: absolute; width: 144px" tabIndex="22"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorContravCon}" disabled="true" id="txtValorContravCon" maxLength="10"
                            style="left: 504px; top: 1056px; position: absolute; width: 144px" tabIndex="23"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco19}" id="lbBanco19" style="left: 312px; top: 1104px; position: absolute" text="Fecha Activacion"/>
                        <ui:calendar binding="#{ConsNovedadDevolucion.cfechaAct}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="cfechaAct"
                            style="left: 504px; top: 1104px; position: absolute" tabIndex="24"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label8}" id="label8" style="color: red; left: 288px; top: 1080px; position: absolute" text="ACTIVACION"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddConcesionario}" disabled="true" id="ddConcesionario"
                            items="#{ConsNovedadDevolucion.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            style="left: 456px; top: 552px; position: absolute; width: 312px" tabIndex="8"/>
                        <ui:button action="#{ConsNovedadDevolucion.btReimprimir_action}" binding="#{ConsNovedadDevolucion.btReimprimir}" id="btReimprimir"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea aprobar novedad ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}&#xa;"
                            style="left: 455px; top: 1152px; position: absolute; width: 95px" text="Aprobar"/>
                        <ui:button action="#{ConsNovedadDevolucion.btAnular_action}" binding="#{ConsNovedadDevolucion.btAnular}" id="btAnular"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea rechazar novedad ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}&#xa;"
                            style="left: 623px; top: 1152px; position: absolute; width: 95px" tabIndex="15" text="Rechazar"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.tfNumero}" disabled="true" id="tfNumero" maxLength="10"
                            style="left: 456px; top: 144px; position: absolute; width: 138px" tabIndex="50"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label9}" id="label9" style="left: 312px; top: 144px; position: absolute" text="Número Novedad"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco20}" id="lbBanco20" style="left: 312px; top: 504px; position: absolute" text="Cuenta Recaudo"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddCuenta}" disabled="true" id="ddCuenta"
                            items="#{ConsNovedadDevolucion.vw_cuentaorigendevDataProvider.options['CUENTA,NOMCUENTA']}" style="left: 456px; top: 504px; position: absolute; width: 312px"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco21}" id="lbBanco21" style="left: 312px; top: 720px; position: absolute" text="Valor Adicional"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorDev1}" disabled="true" id="txtValorDev1" maxLength="10"
                            style="left: 456px; top: 720px; position: absolute; width: 144px" tabIndex="11"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco21}" id="lbBanco21" style="left: 312px; top: 576px; position: absolute" text="Valor Adicional"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco22}" id="lbBanco22" style="left: 312px; top: 888px; position: absolute" text="SEVIAL 3.0%"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtValorSevial27}" disabled="true" id="txtValorSevial27" maxLength="10"
                            style="left: 504px; top: 960px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco23}" id="lbBanco23" style="left: 312px; top: 600px; position: absolute" text="Numero Liquidacion"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtNumLiq}" disabled="true" id="txtNumLiq" maxLength="7"
                            style="left: 456px; top: 600px; position: absolute; width: 144px" tabIndex="11"/>
                        <ui:label binding="#{ConsNovedadDevolucion.lbBanco24}" id="lbBanco24" style="left: 312px; top: 624px; position: absolute" text="Fecha Liquidacion"/>
                        <ui:calendar binding="#{ConsNovedadDevolucion.cfechaLiq}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="cfechaLiq"
                            style="left: 456px; top: 624px; position: absolute" tabIndex="24"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label10}" id="label10" style="left: 312px; top: 384px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label11}" id="label11" style="left: 312px; top: 408px; position: absolute" text="Numero Identificacion"/>
                        <ui:dropDown binding="#{ConsNovedadDevolucion.ddTipoIde1}" disabled="true" id="ddTipoIde1"
                            items="#{ConsNovedadDevolucion.ddTipoIde1DefaultOptions.options}" style="left: 456px; top: 384px; position: absolute; width: 120px" tabIndex="2"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtNumIdentificacion1}" disabled="true" id="txtNumIdentificacion1" maxLength="13"
                            style="left: 456px; top: 408px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:label binding="#{ConsNovedadDevolucion.label12}" id="label12" style="left: 312px; top: 432px; position: absolute" text="DNS Banco"/>
                        <ui:textField binding="#{ConsNovedadDevolucion.txtDns}" disabled="true" id="txtDns" maxLength="13"
                            style="left: 456px; top: 432px; position: absolute; width: 120px" tabIndex="3"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
