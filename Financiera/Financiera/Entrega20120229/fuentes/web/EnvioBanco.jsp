<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{EnvioBanco.page1}" id="page1">
            <ui:html binding="#{EnvioBanco.html1}" id="html1">
                <ui:head binding="#{EnvioBanco.head1}" id="head1">
                    <ui:link binding="#{EnvioBanco.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{EnvioBanco.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{EnvioBanco.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{EnvioBanco.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Enviar Transferencia a bancos"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{EnvioBanco.label1}" id="label1" style="left: 288px; top: 192px; position: absolute" text="Fecha Transferencia"/>
                        <ui:button action="#{EnvioBanco.btLiquidar_action}" binding="#{EnvioBanco.btLiquidar}" id="btLiquidar"
                            style="left: 407px; top: 312px; position: absolute; width: 120px" tabIndex="3" text="Enviar a Banco"/>
                        <ui:calendar binding="#{EnvioBanco.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 432px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{EnvioBanco.label2}" id="label2" style="left: 624px; top: 360px; position: absolute" text="LOG"/>
                        <ui:textArea binding="#{EnvioBanco.logAvvillas}" id="logAvvillas" rows="20" style="height: 432px; left: 336px; top: 384px; position: absolute; width: 624px"/>
                        <ui:dropDown binding="#{EnvioBanco.ddBanco}" id="ddBanco" items="#{EnvioBanco.ddBancoDefaultOptions.options}" style="left: 432px; top: 264px; position: absolute; width: 240px"/>
                        <ui:label binding="#{EnvioBanco.label3}" id="label3" style="left: 360px; top: 264px; position: absolute" text="Banco"/>
                        <ui:button action="#{EnvioBanco.btLog_action}" binding="#{EnvioBanco.btLog}" id="btLog"
                            style="left: 551px; top: 312px; position: absolute; width: 120px" tabIndex="3" text="Consultar LOG"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>