<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteDistOTIde.page1}" id="page1">
            <ui:html binding="#{ReporteDistOTIde.html1}" id="html1">
                <ui:head binding="#{ReporteDistOTIde.head1}" id="head1">
                    <ui:link binding="#{ReporteDistOTIde.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteDistOTIde.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteDistOTIde.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteDistOTIde.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte de Pago a Organismo de Transito por Identificación"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{ReporteDistOTIde.btReport_action}" binding="#{ReporteDistOTIde.btReport}" id="btReport" onClick="btReport_action()"
                            style="left: 455px; top: 264px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{ReporteDistOTIde.label1}" id="label1" style="left: 312px; top: 216px; position: absolute" text="Identificacion"/>
                        <ui:textField binding="#{ReporteDistOTIde.textField1}" id="textField1" maxLength="16" style="left: 432px; top: 216px; position: absolute; width: 120px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ReporteDistOTIde.page1}" id="page1"/>
    <ui:html binding="#{ReporteDistOTIde.html1}" id="html1"/>
    <ui:head binding="#{ReporteDistOTIde.head1}" id="head1"/>
</jsp:root>
