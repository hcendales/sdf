<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{EnvioBancoRepro.page1}" id="page1">
            <ui:html binding="#{EnvioBancoRepro.html1}" id="html1">
                <ui:head binding="#{EnvioBancoRepro.head1}" id="head1">
                    <ui:link binding="#{EnvioBancoRepro.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{EnvioBancoRepro.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{EnvioBancoRepro.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{EnvioBancoRepro.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Enviar Transferencia a bancos"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{EnvioBancoRepro.label1}" id="label1" style="left: 336px; top: 192px; position: absolute" text="Fecha Transferencia Inicial"/>
                        <ui:button action="#{EnvioBancoRepro.btLiquidar_action}" binding="#{EnvioBancoRepro.btLiquidar}" id="btLiquidar"
                            style="left: 431px; top: 384px; position: absolute; width: 120px" tabIndex="3" text="Enviar a Banco"/>
                        <ui:calendar binding="#{EnvioBancoRepro.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 504px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{EnvioBancoRepro.label2}" id="label2" style="left: 624px; top: 432px; position: absolute" text="LOG"/>
                        <ui:textArea binding="#{EnvioBancoRepro.logAvvillas}" id="logAvvillas" rows="20" style="height: 432px; left: 336px; top: 456px; position: absolute; width: 624px"/>
                        <ui:dropDown binding="#{EnvioBancoRepro.ddBanco}" id="ddBanco" items="#{EnvioBancoRepro.ddBancoDefaultOptions.options}" style="left: 504px; top: 312px; position: absolute; width: 240px"/>
                        <ui:label binding="#{EnvioBancoRepro.label3}" id="label3" style="left: 360px; top: 312px; position: absolute" text="Banco"/>
                        <ui:button action="#{EnvioBancoRepro.btLog_action}" binding="#{EnvioBancoRepro.btLog}" id="btLog"
                            style="left: 575px; top: 384px; position: absolute; width: 120px" tabIndex="3" text="Consultar LOG"/>
                        <ui:label binding="#{EnvioBancoRepro.label4}" id="label4" style="left: 336px; top: 240px; position: absolute" text="Fecha Transferencia Final"/>
                        <ui:calendar binding="#{EnvioBancoRepro.clFechaFin}" dateFormatPattern="yyyy-MM-dd" id="clFechaFin"
                            style="left: 504px; top: 240px; position: absolute" tabIndex="1"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
