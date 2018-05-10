<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{trasladoInterno.page1}" id="page1">
            <ui:html binding="#{trasladoInterno.html1}" id="html1">
                <ui:head binding="#{trasladoInterno.head1}" id="head1">
                    <ui:link binding="#{trasladoInterno.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{trasladoInterno.body1}" focus="form1:calendarFecIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{trasladoInterno.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{trasladoInterno.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 238px" text="Traslado Interno  Recaudo Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{trasladoInterno.calendarFecIni}" dateFormatPattern="yyyy-MM-dd" id="calendarFecIni" label="Fecha Corte Inicial"
                            style="left: 264px; top: 168px; position: absolute" tabIndex="1" validator="#{trasladoInterno.calendarFecIni_validate}"/>
                        <ui:calendar binding="#{trasladoInterno.calendarFecFin}" dateFormatPattern="yyyy-MM-dd" id="calendarFecFin"
                            label="Fecha Corte Final        " style="left: 264px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:button action="#{trasladoInterno.btliquidarRL_action}" binding="#{trasladoInterno.btliquidarRL}" id="btliquidarRL"
                            onClick="btliquidarRL_action()" style="left: 383px; top: 360px; position: absolute; width: 96px" tabIndex="3" text="Trasladar"/>
                        <ui:dropDown binding="#{trasladoInterno.dropDown1}" id="dropDown1" items="#{trasladoInterno.dropDown1DefaultOptions.options}" style="height: 24px; left: 408px; top: 264px; position: absolute; width: 168px"/>
                        <ui:label binding="#{trasladoInterno.label1}" id="label1"
                            style="height: 24px; left: 264px; top: 264px; position: absolute; width: 118px" text="Recaudo a trasladar"/>
                        <ui:label binding="#{trasladoInterno.label2}" id="label2"
                            style="height: 24px; left: 264px; top: 312px; position: absolute; width: 118px" text="Autoridad"/>
                        <ui:dropDown binding="#{trasladoInterno.ddAutoridad}" id="ddAutoridad" items="#{trasladoInterno.ddAutoridadDefaultOptions.options}" style="left: 408px; top: 312px; position: absolute; width: 168px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
