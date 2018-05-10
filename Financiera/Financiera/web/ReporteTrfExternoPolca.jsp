<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteTrfExternoPolca.page1}" id="page1">
            <ui:html binding="#{ReporteTrfExternoPolca.html1}" id="html1">
                <ui:head binding="#{ReporteTrfExternoPolca.head1}" id="head1">
                    <ui:link binding="#{ReporteTrfExternoPolca.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteTrfExternoPolca.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteTrfExternoPolca.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteTrfExternoPolca.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Transferencia Recaudo Externo POLCA"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteTrfExternoPolca.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 504px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{ReporteTrfExternoPolca.ddFormato}" id="ddFormato"
                            items="#{ReporteTrfExternoPolca.ddFormatoDefaultOptions.options}" style="left: 504px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteTrfExternoPolca.btReport_action}" binding="#{ReporteTrfExternoPolca.btReport}" id="btReport"
                            onClick="btReport_action()" style="left: 431px; top: 336px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{ReporteTrfExternoPolca.label1}" for="cfecIni" id="label1" style="left: 311px; top: 216px; position: absolute" text="Fecha Transferencia Inicial"/>
                        <ui:label binding="#{ReporteTrfExternoPolca.label3}" id="label3" style="left: 384px; top: 168px; position: absolute" text="Formato"/>
                        <ui:calendar binding="#{ReporteTrfExternoPolca.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 504px; top: 264px; position: absolute" tabIndex="2"/>
                        <ui:label binding="#{ReporteTrfExternoPolca.label7}" for="cfecIni" id="label7" style="left: 312px; top: 264px; position: absolute" text="Fecha Transferencia Final"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
