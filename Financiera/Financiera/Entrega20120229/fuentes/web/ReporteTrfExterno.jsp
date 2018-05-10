<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteTrfExterno.page1}" id="page1">
            <ui:html binding="#{ReporteTrfExterno.html1}" id="html1">
                <ui:head binding="#{ReporteTrfExterno.head1}" id="head1">
                    <ui:link binding="#{ReporteTrfExterno.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteTrfExterno.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteTrfExterno.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteTrfExterno.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Transferencia  Externo Acumulado"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteTrfExterno.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni"
                            style="left: 456px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{ReporteTrfExterno.ddFormato}" id="ddFormato" items="#{ReporteTrfExterno.ddFormatoDefaultOptions.options}"
                            style="left: 408px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteTrfExterno.btReport_action}" binding="#{ReporteTrfExterno.btReport}" id="btReport"
                            onClick="btReport_action()" style="height: 24px; left: 431px; top: 768px; position: absolute; width: 71px" tabIndex="3" text="Generar"/>
                        <ui:label binding="#{ReporteTrfExterno.label1}" for="cfecIni" id="label1" style="left: 312px; top: 216px; position: absolute" text="Fecha Pago Inicial"/>
                        <ui:label binding="#{ReporteTrfExterno.label3}" id="label3" style="left: 336px; top: 168px; position: absolute" text="Formato"/>
                        <ui:dropDown binding="#{ReporteTrfExterno.ddTipoRecaudo}" id="ddTipoRecaudo"
                            items="#{ReporteTrfExterno.ddTipoRecaudoDefaultOptions.options}" style="left: 456px; top: 336px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{ReporteTrfExterno.label2}" id="label2" style="left: 312px; top: 336px; position: absolute" text="Tipo Recaudo"/>
                        <ui:label binding="#{ReporteTrfExterno.label6}" for="cfecFin" id="label6" style="left: 312px; top: 264px; position: absolute" text="Fecha Pago Final"/>
                        <ui:calendar binding="#{ReporteTrfExterno.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin"
                            style="left: 456px; top: 264px; position: absolute" tabIndex="2"/>
                        <ui:listbox binding="#{ReporteTrfExterno.lbConcepto}" id="lbConcepto"
                            items="#{ReporteTrfExterno.vw_conceptopagoDataProvider.options['CONCEPTO,CONCEPTO']}" multiple="true" style="height: 168px; left: 456px; top: 384px; position: absolute; width: 504px"/>
                        <ui:label binding="#{ReporteTrfExterno.label4}" id="label4" style="left: 312px; top: 384px; position: absolute" text="Concepto Pago"/>
                        <ui:label binding="#{ReporteTrfExterno.label5}" id="label5" style="left: 312px; top: 576px; position: absolute" text="Cuenta Origen"/>
                        <ui:listbox binding="#{ReporteTrfExterno.lbcuenta}" id="lbcuenta"
                            items="#{ReporteTrfExterno.vw_cuentaorigenDataProvider.options['ORI_CUENTA,ORI_CUENTA']}" multiple="true" style="height: 144px; left: 456px; top: 576px; position: absolute; width: 504px"/>
                        <ui:label binding="#{ReporteTrfExterno.label7}" id="label7" style="left: 864px; top: 744px; position: absolute; width: 310px" text="*Para multiple selección utilize CRTL o SHIFT"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
