<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteTransferenciaLocal.page1}" id="page1">
            <ui:html binding="#{ReporteTransferenciaLocal.html1}" id="html1">
                <ui:head binding="#{ReporteTransferenciaLocal.head1}" id="head1">
                    <ui:link binding="#{ReporteTransferenciaLocal.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteTransferenciaLocal.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteTransferenciaLocal.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteTransferenciaLocal.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Transferencia Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteTransferenciaLocal.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 360px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{ReporteTransferenciaLocal.ddFormato}" id="ddFormato"
                            items="#{ReporteTransferenciaLocal.ddFormatoDefaultOptions.options}" style="left: 360px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteTransferenciaLocal.btReport_action}" binding="#{ReporteTransferenciaLocal.btReport}" id="btReport"
                            onClick="btReport_action()" style="left: 455px; top: 768px; position: absolute; width: 71px" tabIndex="5" text="Generar"/>
                        <ui:label binding="#{ReporteTransferenciaLocal.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{ReporteTransferenciaLocal.label3}" id="label3" style="left: 264px; top: 168px; position: absolute" text="Formato"/>
                        <ui:label binding="#{ReporteTransferenciaLocal.label4}" id="label4" style="position: absolute; left: 264px; top: 312px" text="Tipo Recaudo"/>
                        <ui:listbox binding="#{ReporteTransferenciaLocal.listbox1}" id="listbox1"
                            items="#{ReporteTransferenciaLocal.listbox1DefaultOptions.options}" multiple="true" style="height: 72px; left: 360px; top: 312px; position: absolute; width: 120px"/>
                        <ui:label binding="#{ReporteTransferenciaLocal.label5}" id="label5" style="left: 264px; top: 408px; position: absolute" text="Cuenta Origen"/>
                        <ui:listbox binding="#{ReporteTransferenciaLocal.listbox2}" id="listbox2"
                            items="#{ReporteTransferenciaLocal.vw_cuentaorigenlocDataProvider.options['ORI_CUENTA,NOMBRE']}" multiple="true" style="height: 144px; left: 360px; top: 408px; position: absolute; width: 408px"/>
                        <ui:label binding="#{ReporteTransferenciaLocal.label6}" id="label6" style="left: 264px; top: 576px; position: absolute" text="Concepto "/>
                        <ui:listbox binding="#{ReporteTransferenciaLocal.listbox3}" id="listbox3"
                            items="#{ReporteTransferenciaLocal.vw_conceptopagolocDataProvider.options['CONCEPTO,CONCEPTO']}" multiple="true" style="height: 144px; left: 360px; top: 576px; position: absolute; width: 408px"/>
                        <ui:label binding="#{ReporteTransferenciaLocal.label7}" id="label7" style="left: 816px; top: 432px; position: absolute; width: 310px" text="*Para multiple selección utilize CRTL o SHIFT"/>
                        <ui:label binding="#{ReporteTransferenciaLocal.label8}" id="label8" style="left: 816px; top: 576px; position: absolute; width: 310px" text="*Para multiple selección utilize CRTL o SHIFT"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
