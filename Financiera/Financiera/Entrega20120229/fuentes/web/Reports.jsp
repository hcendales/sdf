<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Reports.page1}" id="page1">
            <ui:html binding="#{Reports.html1}" id="html1">
                <ui:head binding="#{Reports.head1}" id="head1">
                    <ui:link binding="#{Reports.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Reports.body1}" focus="form1:ddTipo" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Reports.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Reports.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Reportes"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{Reports.cfecIni}" dateFormatPattern="dd/MM/yyyy" id="cfecIni" label="Fecha Inicial"
                            style="left: 288px; top: 216px; position: absolute" tabIndex="3"/>
                        <ui:calendar binding="#{Reports.cfecFin}" dateFormatPattern="dd/MM/yyyy" id="cfecFin" label="Fecha Final"
                            style="left: 288px; top: 264px; position: absolute" tabIndex="4"/>
                        <ui:dropDown binding="#{Reports.ddTipo}" id="ddTipo" items="#{Reports.ddTipoDefaultOptions.options}" label="Recaudo Local"
                            style="left: 288px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:dropDown binding="#{Reports.ddFormato}" id="ddFormato" items="#{Reports.ddFormatoDefaultOptions.options}" label="Formato"
                            style="left: 480px; top: 168px; position: absolute" tabIndex="2"/>
                        <ui:button binding="#{Reports.btReport}" id="btReport" onClick="btReport_action()"
                            style="height: 24px; left: 287px; top: 312px; position: absolute; width: 71px" tabIndex="5" text="Generar"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
