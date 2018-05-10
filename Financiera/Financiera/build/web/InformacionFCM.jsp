<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{InformacionFCM.page1}" id="page1">
            <ui:html binding="#{InformacionFCM.html1}" id="html1">
                <ui:head binding="#{InformacionFCM.head1}" id="head1">
                    <ui:link binding="#{InformacionFCM.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{InformacionFCM.body1}" focus="form1:tfCorreo" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{InformacionFCM.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{InformacionFCM.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición FCM"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{InformacionFCM.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Nit FCM"/>
                        <ui:textField binding="#{InformacionFCM.tfNitFcm}" id="tfNitFcm" readOnly="true"
                            style="left: 360px; top: 168px; position: absolute; width: 94px" text="8000826650"/>
                        <ui:label binding="#{InformacionFCM.label2}" id="label2" style="left: 264px; top: 192px; position: absolute" text="Correo FCM"/>
                        <ui:textField binding="#{InformacionFCM.tfCorreo}" id="tfCorreo" maxLength="500" style="left: 360px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{InformacionFCM.label8}" for="tfIva" id="label8" style="left: 264px; top: 240px; position: absolute" text="IVA"/>
                        <ui:label binding="#{InformacionFCM.label9}" for="tfRetencion" id="label9" style="left: 264px; top: 264px; position: absolute" text="Retención Fuente"/>
                        <ui:label binding="#{InformacionFCM.label10}" for="tfTimbreTercero" id="label10" style="left: 264px; top: 288px; position: absolute" text="Impuesto Timbre Terceros"/>
                        <ui:label binding="#{InformacionFCM.label11}" for="tfTimbreFCM" id="label11" style="left: 264px; top: 312px; position: absolute" text="Impuesto Timbre FCM"/>
                        <ui:label binding="#{InformacionFCM.label12}" for="tfNitSevial" id="label12" style="left: 264px; top: 384px; position: absolute" text="Nit SEVIAL"/>
                        <ui:label binding="#{InformacionFCM.label13}" for="tfNitPolca" id="label13" style="left: 264px; top: 408px; position: absolute" text="Nit POLCA"/>
                        <ui:textField binding="#{InformacionFCM.tfIva}" id="tfIva" maxLength="7"
                            style="left: 456px; top: 240px; position: absolute; width: 72px" tabIndex="11"/>
                        <ui:textField binding="#{InformacionFCM.tfRetencion}" id="tfRetencion" maxLength="7"
                            style="left: 456px; top: 264px; position: absolute; width: 72px" tabIndex="12"/>
                        <ui:textField binding="#{InformacionFCM.tfTimbreTercero}" id="tfTimbreTercero" maxLength="7"
                            style="left: 456px; top: 288px; position: absolute; width: 72px" tabIndex="13"/>
                        <ui:textField binding="#{InformacionFCM.tfTimbreFCM}" id="tfTimbreFCM" maxLength="7"
                            style="left: 456px; top: 312px; position: absolute; width: 72px" tabIndex="14"/>
                        <ui:textField binding="#{InformacionFCM.tfNitSevial}" id="tfNitSevial" maxLength="10"
                            style="left: 456px; top: 384px; position: absolute; width: 72px" tabIndex="17"/>
                        <ui:textField binding="#{InformacionFCM.tfNitPolca}" id="tfNitPolca" maxLength="10"
                            style="left: 456px; top: 408px; position: absolute; width: 72px" tabIndex="18"/>
                        <ui:label binding="#{InformacionFCM.label14}" for="tfEjecutivo" id="label14"
                            style="left: 624px; top: 240px; position: absolute; width: 142px" text="Director Ejecutivo"/>
                        <ui:label binding="#{InformacionFCM.label15}" for="tfNacional" id="label15"
                            style="left: 624px; top: 300px; position: absolute; width: 142px" text="Director Nacional"/>
                        <ui:label binding="#{InformacionFCM.label16}" for="tfContador" id="label16"
                            style="left: 624px; top: 360px; position: absolute; width: 142px" text="Contador General"/>
                        <ui:label binding="#{InformacionFCM.label17}" for="tfCoodinador" id="label17"
                            style="left: 624px; top: 422px; position: absolute; width: 142px" text="Coodinador Financiero"/>
                        <ui:textField binding="#{InformacionFCM.tfEjecutivo}" id="tfEjecutivo" maxLength="250"
                            style="left: 768px; top: 240px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:textField binding="#{InformacionFCM.tfNacional}" id="tfNacional" maxLength="250"
                            style="left: 768px; top: 300px; position: absolute; width: 144px" tabIndex="21"/>
                        <ui:textField binding="#{InformacionFCM.tfContador}" id="tfContador" maxLength="250"
                            style="left: 768px; top: 360px; position: absolute; width: 144px" tabIndex="23"/>
                        <ui:textField binding="#{InformacionFCM.tfCoodinador}" id="tfCoodinador" maxLength="250"
                            style="left: 768px; top: 422px; position: absolute; width: 144px" tabIndex="25"/>
                        <ui:button action="#{InformacionFCM.btActualizar_action}" binding="#{InformacionFCM.btActualizar}" id="btActualizar"
                            onClick="btActualizar_action()" style="left: 455px; top: 816px; position: absolute; width: 95px" tabIndex="35" text="Actualizar"/>
                        <ui:label binding="#{InformacionFCM.label18}" for="tfPuente" id="label18" style="left: 264px; top: 504px; position: absolute" text="Cuenta por pagar operadores"/>
                        <ui:label binding="#{InformacionFCM.label19}" for="tfFondo" id="label19" style="left: 264px; top: 528px; position: absolute" text="Fondo Cobertura - Simit"/>
                        <ui:label binding="#{InformacionFCM.label20}" for="tfPolca" id="label20" style="left: 264px; top: 552px; position: absolute" text="Simit Polca 39.78%"/>
                        <ui:label binding="#{InformacionFCM.label21}" for="tfFcm" id="label21" style="left: 264px; top: 576px; position: absolute" text="Libre Disposición"/>
                        <ui:label binding="#{InformacionFCM.label22}" for="tfFcmA" id="label22" style="left: 264px; top: 600px; position: absolute" text="FCM 1.8%"/>
                        <ui:label binding="#{InformacionFCM.label23}" for="tfIngreso" id="label23" style="left: 264px; top: 624px; position: absolute" text="FCM (Simit) Ingreso"/>
                        <ui:label binding="#{InformacionFCM.label25}" for="tfPuenteExt" id="label25" style="left: 264px; top: 648px; position: absolute" text="Cuenta puente 4.5% - 19%"/>
                        <ui:textField binding="#{InformacionFCM.tfPuente}" id="tfPuente" maxLength="10"
                            style="left: 457px; top: 505px; position: absolute; width: 120px" tabIndex="27"/>
                        <ui:textField binding="#{InformacionFCM.tfFondo}" id="tfFondo" maxLength="10"
                            style="left: 457px; top: 529px; position: absolute; width: 120px" tabIndex="28"/>
                        <ui:textField binding="#{InformacionFCM.tfPolca}" id="tfPolca" maxLength="10"
                            style="left: 457px; top: 553px; position: absolute; width: 120px" tabIndex="29"/>
                        <ui:textField binding="#{InformacionFCM.textField4}" id="textField4" maxLength="8" style="left: 456px; top: 576px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{InformacionFCM.tfFcmA}" id="tfFcmA" maxLength="10"
                            style="left: 456px; top: 601px; position: absolute; width: 120px" tabIndex="31"/>
                        <ui:textField binding="#{InformacionFCM.tfIngreso}" id="tfIngreso" maxLength="10"
                            style="left: 456px; top: 624px; position: absolute; width: 120px" tabIndex="32"/>
                        <ui:textField binding="#{InformacionFCM.tfFcm}" id="tfFcm" maxLength="10"
                            style="left: 456px; top: 577px; position: absolute; width: 120px" tabIndex="30"/>
                        <ui:label binding="#{InformacionFCM.label26}" for="tfIva" id="label26" style="left: 264px; top: 336px; position: absolute" text="RETEIVA"/>
                        <ui:label binding="#{InformacionFCM.label27}" for="tfIva" id="label27" style="left: 264px; top: 360px; position: absolute" text="Timbre Contravencional"/>
                        <ui:textField binding="#{InformacionFCM.tfRteIva}" id="tfRteIva" maxLength="7"
                            style="left: 456px; top: 336px; position: absolute; width: 72px" tabIndex="15"/>
                        <ui:textField binding="#{InformacionFCM.tfTimCon}" id="tfTimCon" maxLength="7"
                            style="left: 456px; top: 360px; position: absolute; width: 72px" tabIndex="16"/>
                        <ui:textField binding="#{InformacionFCM.tfPuenteExt}" id="tfPuenteExt" maxLength="10"
                            style="left: 456px; top: 648px; position: absolute; width: 120px" tabIndex="34"/>
                        <ui:label binding="#{InformacionFCM.label29}" for="tfCoodinador" id="label29"
                            style="left: 624px; top: 384px; position: absolute; width: 142px" text="e-mail"/>
                        <ui:label binding="#{InformacionFCM.label30}" for="tfCoodinador" id="label30"
                            style="left: 624px; top: 324px; position: absolute; width: 142px" text="e-mail"/>
                        <ui:label binding="#{InformacionFCM.label31}" for="tfCoodinador" id="label31"
                            style="left: 624px; top: 264px; position: absolute; width: 142px" text="e-mail"/>
                        <ui:label binding="#{InformacionFCM.label32}" for="tfCoodinador" id="label32"
                            style="left: 624px; top: 446px; position: absolute; width: 142px" text="e-mail"/>
                        <ui:textField binding="#{InformacionFCM.tfeDirectorEjecutivo}" id="tfeDirectorEjecutivo" maxLength="250"
                            style="left: 768px; top: 264px; position: absolute; width: 144px" tabIndex="20"/>
                        <ui:textField binding="#{InformacionFCM.tfeDirectorNacional}" id="tfeDirectorNacional" maxLength="250"
                            style="left: 768px; top: 324px; position: absolute; width: 144px" tabIndex="22"/>
                        <ui:textField binding="#{InformacionFCM.tfeContadorGeneral}" id="tfeContadorGeneral" maxLength="250"
                            style="left: 768px; top: 384px; position: absolute; width: 144px" tabIndex="24"/>
                        <ui:textField binding="#{InformacionFCM.tfeCoordinadorFinanciero}" id="tfeCoordinadorFinanciero" maxLength="250"
                            style="left: 768px; top: 446px; position: absolute; width: 144px" tabIndex="26"/>
                        <ui:label binding="#{InformacionFCM.label33}" for="tfPuente" id="label33" style="left: 456px; top: 480px; position: absolute" text="Cuentas Contables"/>
                        <ui:checkbox binding="#{InformacionFCM.cbSeguridad}" id="cbSeguridad" label="Seguridad Integrada SIMIT" style="left: 456px; top: 696px; position: absolute; width: 216px"/>
                        <ui:label binding="#{InformacionFCM.label3}" for="tfPuenteExt" id="label3" style="left: 264px; top: 720px; position: absolute" text="Url servicio de autenticacion"/>
                        <ui:textField binding="#{InformacionFCM.turl}" id="turl" maxLength="250"
                            style="left: 456px; top: 720px; position: absolute; width: 456px" tabIndex="26"/>
                        <ui:label binding="#{InformacionFCM.label4}" for="tfPuenteExt" id="label4" style="left: 288px; top: 768px; position: absolute" text="Dias activacion novedades"/>
                        <ui:textField binding="#{InformacionFCM.tfDias}" id="tfDias" maxLength="2"
                            style="left: 456px; top: 768px; position: absolute; width: 120px" tabIndex="34"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
