<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{dispersa_recaudo_externo.page1}" id="page1">
            <ui:html binding="#{dispersa_recaudo_externo.html1}" id="html1">
                <ui:head binding="#{dispersa_recaudo_externo.head1}" id="head1">
                    <ui:link binding="#{dispersa_recaudo_externo.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{dispersa_recaudo_externo.body1}" focus="form1:calendarFecIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{dispersa_recaudo_externo.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{dispersa_recaudo_externo.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 382px" text="Generar Transferencia Recaudo Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{dispersa_recaudo_externo.calendarFecIni}" dateFormatPattern="yyyy-MM-dd" id="calendarFecIni"
                            label="Fecha Transferencia" required="true" style="left: 288px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{dispersa_recaudo_externo.btliquidarRL_action}" binding="#{dispersa_recaudo_externo.btliquidarRL}" id="btliquidarRL"
                            onClick="btliquidarRL_action()" style="height: 24px; left: 431px; top: 312px; position: absolute; width: 96px" tabIndex="2" text="Generar"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
