<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{EnvioBancoLocal.page1}" id="page1">
            <ui:html binding="#{EnvioBancoLocal.html1}" id="html1">
                <ui:head binding="#{EnvioBancoLocal.head1}" id="head1">
                    <ui:link binding="#{EnvioBancoLocal.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{EnvioBancoLocal.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{EnvioBancoLocal.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{EnvioBancoLocal.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Enviar Transferencia a bancos Recaudo Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{EnvioBancoLocal.label1}" id="label1" style="left: 288px; top: 192px; position: absolute" text="Fecha Transferencia"/>
                        <ui:button action="#{EnvioBancoLocal.btLiquidar_action}" binding="#{EnvioBancoLocal.btLiquidar}" id="btLiquidar"
                            style="left: 407px; top: 336px; position: absolute; width: 120px" tabIndex="3" text="Enviar a Banco"/>
                        <ui:calendar binding="#{EnvioBancoLocal.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 432px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{EnvioBancoLocal.label2}" id="label2" style="left: 624px; top: 408px; position: absolute" text="LOG"/>
                        <ui:textArea binding="#{EnvioBancoLocal.logAvvillas}" id="logAvvillas" rows="20" style="height: 432px; left: 336px; top: 432px; position: absolute; width: 624px"/>
                        <ui:dropDown binding="#{EnvioBancoLocal.ddBanco}" id="ddBanco" items="#{EnvioBancoLocal.ddBancoDefaultOptions.options}" style="left: 432px; top: 264px; position: absolute; width: 240px"/>
                        <ui:label binding="#{EnvioBancoLocal.label3}" id="label3" style="left: 288px; top: 264px; position: absolute" text="Banco"/>
                        <ui:button action="#{EnvioBancoLocal.btLog_action}" binding="#{EnvioBancoLocal.btLog}" id="btLog"
                            style="left: 623px; top: 336px; position: absolute; width: 120px" tabIndex="3" text="Consultar LOG"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
