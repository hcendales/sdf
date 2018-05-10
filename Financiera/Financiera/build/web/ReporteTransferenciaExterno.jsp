<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteTransferenciaExterno.page1}" id="page1">
            <ui:html binding="#{ReporteTransferenciaExterno.html1}" id="html1">
                <ui:head binding="#{ReporteTransferenciaExterno.head1}" id="head1">
                    <ui:link binding="#{ReporteTransferenciaExterno.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteTransferenciaExterno.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteTransferenciaExterno.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteTransferenciaExterno.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Transferencia  Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteTransferenciaExterno.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 408px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{ReporteTransferenciaExterno.ddFormato}" id="ddFormato"
                            items="#{ReporteTransferenciaExterno.ddFormatoDefaultOptions.options}" style="left: 408px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteTransferenciaExterno.btReport_action}" binding="#{ReporteTransferenciaExterno.btReport}" id="btReport"
                            onClick="btReport_action()" style="height: 24px; left: 455px; top: 480px; position: absolute; width: 71px" tabIndex="3" text="Generar"/>
                        <ui:label binding="#{ReporteTransferenciaExterno.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Transferencia"/>
                        <ui:label binding="#{ReporteTransferenciaExterno.label3}" id="label3" style="left: 336px; top: 168px; position: absolute" text="Formato"/>
                        <ui:dropDown binding="#{ReporteTransferenciaExterno.ddTipoRecaudo}" id="ddTipoRecaudo"
                            items="#{ReporteTransferenciaExterno.ddTipoRecaudoDefaultOptions.options}" style="left: 408px; top: 264px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{ReporteTransferenciaExterno.label2}" id="label2" style="left: 312px; top: 264px; position: absolute" text="Tipo Recaudo"/>
                        <ui:dropDown binding="#{ReporteTransferenciaExterno.ddConcesionario}" id="ddConcesionario"
                            items="#{ReporteTransferenciaExterno.ddConcesionarioDefaultOptions.options}"
                            style="left: 408px; top: 312px; position: absolute; width: 240px" tabIndex="4"/>
                        <ui:label binding="#{ReporteTransferenciaExterno.label4}" id="label4" style="left: 288px; top: 360px; position: absolute" text="Banco Recaudador"/>
                        <ui:dropDown binding="#{ReporteTransferenciaExterno.ddBanco}" id="ddBanco"
                            items="#{ReporteTransferenciaExterno.ddBancoDefaultOptions.options}"
                            style="left: 408px; top: 360px; position: absolute; width: 240px" tabIndex="4"/>
                        <ui:label binding="#{ReporteTransferenciaExterno.label5}" id="label5" style="left: 312px; top: 312px; position: absolute" text="Concesionario"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
