<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ContaPago.page1}" id="page1">
            <ui:html binding="#{ContaPago.html1}" id="html1">
                <ui:head binding="#{ContaPago.head1}" id="head1">
                    <ui:link binding="#{ContaPago.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ContaPago.body1}" focus="form1:calendarFecIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ContaPago.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ContaPago.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 238px" text="Contabilidad Pago Recaudo Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ContaPago.calendarFecIni}" dateFormatPattern="yyyy-MM-dd" id="calendarFecIni" label="Fecha Corte Inicial"
                            style="left: 288px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ContaPago.btliquidarRL_action}" binding="#{ContaPago.btliquidarRL}" id="btliquidarRL"
                            onClick="btliquidarRL_action()" style="height: 24px; left: 431px; top: 408px; position: absolute; width: 96px" tabIndex="3" text="Generar"/>
                        <ui:calendar binding="#{ContaPago.calendarFecFin}" dateFormatPattern="yyyy-MM-dd" id="calendarFecFin" label="Fecha Corte Inicial"
                            style="left: 288px; top: 264px; position: absolute" tabIndex="1"/>
                        <ui:dropDown binding="#{ContaPago.ddBanco}" id="ddBanco" items="#{ContaPago.ddBancoDefaultOptions.options}" style="height: 24px; left: 456px; top: 336px; position: absolute; width: 192px"/>
                        <ui:label binding="#{ContaPago.label1}" id="label1" style="height: 24px; left: 288px; top: 336px; position: absolute; width: 142px" text="Banco recaudador"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
