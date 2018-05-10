<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{RptPagDevAch.page1}" id="page1">
            <ui:html binding="#{RptPagDevAch.html1}" id="html1">
                <ui:head binding="#{RptPagDevAch.head1}" id="head1">
                    <ui:link binding="#{RptPagDevAch.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{RptPagDevAch.body1}" focus="form1:calendarFecIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{RptPagDevAch.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{RptPagDevAch.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 358px" text="Contabilidad Devoluciones usuarios aplicadas"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{RptPagDevAch.calendarFecIni}" dateFormatPattern="yyyy-MM-dd" id="calendarFecIni" label="Fecha Estado Inicial"
                            style="left: 288px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{RptPagDevAch.btliquidarRL_action}" binding="#{RptPagDevAch.btliquidarRL}" id="btliquidarRL"
                            onClick="btliquidarRL_action()" style="height: 24px; left: 431px; top: 336px; position: absolute; width: 96px" tabIndex="3" text="Generar"/>
                        <ui:calendar binding="#{RptPagDevAch.calendarFecFin}" dateFormatPattern="yyyy-MM-dd" id="calendarFecFin" label="Fecha Estado Final   "
                            style="left: 288px; top: 240px; position: absolute" tabIndex="1"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>