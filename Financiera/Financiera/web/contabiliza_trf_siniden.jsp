<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{contabiliza_trf_siniden.page1}" id="page1">
            <ui:html binding="#{contabiliza_trf_siniden.html1}" id="html1">
                <ui:head binding="#{contabiliza_trf_siniden.head1}" id="head1">
                    <ui:link binding="#{contabiliza_trf_siniden.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{contabiliza_trf_siniden.body1}" focus="form1:calendarFecIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{contabiliza_trf_siniden.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{contabiliza_trf_siniden.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 382px" text="Contabilizar recaudo local sin identificar"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{contabiliza_trf_siniden.calendarFecIni}" dateFormatPattern="yyyy-MM-dd" id="calendarFecIni"
                            label="Fecha Corte Inicial" style="left: 264px; top: 168px; position: absolute" tabIndex="1" validator="#{contabiliza_trf_siniden.calendarFecIni_validate}"/>
                        <ui:calendar binding="#{contabiliza_trf_siniden.calendarFecFin}" dateFormatPattern="yyyy-MM-dd" id="calendarFecFin"
                            label="Fecha Corte Final        " style="left: 264px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:button action="#{contabiliza_trf_siniden.btliquidarRL_action}" binding="#{contabiliza_trf_siniden.btliquidarRL}" id="btliquidarRL"
                            onClick="btliquidarRL_action()" style="left: 383px; top: 312px; position: absolute; width: 168px" tabIndex="3" text="Generar Contabilidad"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
