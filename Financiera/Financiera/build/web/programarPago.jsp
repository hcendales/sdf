<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{programarPago.page1}" id="page1">
            <ui:html binding="#{programarPago.html1}" id="html1">
                <ui:head binding="#{programarPago.head1}" id="head1">
                    <ui:link binding="#{programarPago.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{programarPago.body1}" focus="form1:calendarFecIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{programarPago.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{programarPago.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 238px" text="Programar Pago Recaudo Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{programarPago.calendarFecIni}" dateFormatPattern="yyyy-MM-dd" id="calendarFecIni" label="Fecha Corte Inicial"
                            style="left: 264px; top: 168px; position: absolute" tabIndex="1" validator="#{programarPago.calendarFecIni_validate}"/>
                        <ui:calendar binding="#{programarPago.calendarFecFin}" dateFormatPattern="yyyy-MM-dd" id="calendarFecFin"
                            label="Fecha Corte Final        " style="left: 264px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:button action="#{programarPago.btliquidarRL_action}" binding="#{programarPago.btliquidarRL}" id="btliquidarRL"
                            onClick="btliquidarRL_action()" style="left: 359px; top: 432px; position: absolute; width: 120px" tabIndex="3" text="Programar Pago"/>
                        <ui:dropDown binding="#{programarPago.dropDown1}" id="dropDown1" items="#{programarPago.dropDown1DefaultOptions.options}" style="height: 24px; left: 408px; top: 264px; position: absolute; width: 168px"/>
                        <ui:label binding="#{programarPago.label1}" id="label1" style="height: 24px; left: 264px; top: 264px; position: absolute; width: 118px" text="Banco a distribuir"/>
                        <ui:label binding="#{programarPago.label2}" id="label2" style="height: 24px; left: 264px; top: 312px; position: absolute; width: 118px" text="Autoridad"/>
                        <ui:dropDown binding="#{programarPago.ddAutoridad}" id="ddAutoridad" items="#{programarPago.ddAutoridadDefaultOptions.options}" style="left: 408px; top: 312px; position: absolute; width: 168px"/>
                        <ui:calendar binding="#{programarPago.calendarFecFin1}" dateFormatPattern="yyyy-MM-dd" id="calendarFecFin1" label="Fecha de Pago"
                            style="left: 264px; top: 360px; position: absolute" tabIndex="2"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
