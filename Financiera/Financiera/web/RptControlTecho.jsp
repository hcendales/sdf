<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{RptControlTecho.page1}" id="page1">
            <ui:html binding="#{RptControlTecho.html1}" id="html1">
                <ui:head binding="#{RptControlTecho.head1}" id="head1">
                    <ui:link binding="#{RptControlTecho.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{RptControlTecho.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{RptControlTecho.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{RptControlTecho.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Reporte de Control de Techo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{RptControlTecho.ddConcesionario1}" id="ddConcesionario1"
                            items="#{RptControlTecho.ddConcesionarioDefaultOptions1.options}" style="left: 432px; top: 192px; position: absolute; width: 240px" tabIndex="4"/>
                        <ui:label binding="#{RptControlTecho.label1}" id="label1" style="left: 312px; top: 192px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{RptControlTecho.label2}" id="label2" style="left: 312px; top: 240px; position: absolute" text="Tipo Recaudo"/>
                        <ui:dropDown binding="#{RptControlTecho.ddTipoRec}" id="ddTipoRec" items="#{RptControlTecho.ddTipoRecDefaultOptions.options}" style="left: 432px; top: 240px; position: absolute; width: 120px"/>
                        <ui:label binding="#{RptControlTecho.label3}" id="label3" style="left: 312px; top: 288px; position: absolute" text="Periodo (AAAA)"/>
                        <ui:textField binding="#{RptControlTecho.textField1}" id="textField1" maxLength="4" style="left: 432px; top: 288px; position: absolute; width: 72px"/>
                        <ui:button action="#{RptControlTecho.button1_action}" binding="#{RptControlTecho.button1}" id="button1"
                            style="left: 431px; top: 336px; position: absolute; width: 168px" text="Generar Reporte"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
