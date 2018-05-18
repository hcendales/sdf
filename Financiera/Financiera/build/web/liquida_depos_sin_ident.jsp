<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{liquida_depos_sin_ident.page1}" id="page1">
            <ui:html binding="#{liquida_depos_sin_ident.html1}" id="html1">
                <ui:head binding="#{liquida_depos_sin_ident.head1}" id="head1">
                    <ui:link binding="#{liquida_depos_sin_ident.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{liquida_depos_sin_ident.body1}" focus="form1:calendarFecIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{liquida_depos_sin_ident.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{liquida_depos_sin_ident.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 238px" text="Distribución Depositos Sin Identificar"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{liquida_depos_sin_ident.calendarFecIni}" dateFormatPattern="yyyy-MM-dd" id="calendarFecIni"
                            label="Fechca transaccion inicial" style="left: 264px; top: 168px; position: absolute" tabIndex="1" validator="#{liquida_depos_sin_ident.calendarFecIni_validate}"/>
                        <ui:calendar binding="#{liquida_depos_sin_ident.calendarFecFin}" dateFormatPattern="yyyy-MM-dd" id="calendarFecFin"
                            label="Fecha transaccion final" style="left: 264px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:button action="#{liquida_depos_sin_ident.btliquidarRL_action}" binding="#{liquida_depos_sin_ident.btliquidarRL}" id="btliquidarRL"
                            onClick="btliquidarRL_action()" style="left: 383px; top: 312px; position: absolute; width: 96px" tabIndex="3" text="Distribuir"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
