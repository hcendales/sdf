<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Desencripta.page1}" id="page1">
            <ui:html binding="#{Desencripta.html1}" id="html1">
                <ui:head binding="#{Desencripta.head1}" id="head1">
                    <ui:link binding="#{Desencripta.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Desencripta.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Desencripta.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Desencripta.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Desencriptar archivo Banco"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{Desencripta.btLiquidar_action}" binding="#{Desencripta.btLiquidar}" id="btLiquidar"
                            style="left: 407px; top: 312px; position: absolute; width: 120px" tabIndex="3" text="Desencriptar"/>
                        <ui:label binding="#{Desencripta.label2}" id="label2" style="left: 624px; top: 360px; position: absolute" text="LOG"/>
                        <ui:textArea binding="#{Desencripta.logAvvillas}" id="logAvvillas" rows="20" style="height: 432px; left: 336px; top: 384px; position: absolute; width: 624px"/>
                        <ui:dropDown binding="#{Desencripta.ddBanco}" id="ddBanco" items="#{Desencripta.ddBancoDefaultOptions.options}" style="left: 408px; top: 264px; position: absolute; width: 240px"/>
                        <ui:label binding="#{Desencripta.label3}" id="label3" style="left: 360px; top: 264px; position: absolute" text="Banco"/>
                        <ui:button action="#{Desencripta.btLog_action}" binding="#{Desencripta.btLog}" id="btLog"
                            style="left: 551px; top: 312px; position: absolute; width: 120px" tabIndex="3" text="Consultar LOG"/>
                        <ui:upload binding="#{Desencripta.fileUpload1}" columns="60" id="fileUpload1" style="position: absolute; left: 408px; top: 216px"/>
                        <ui:label binding="#{Desencripta.label1}" id="label1" style="left: 360px; top: 216px; position: absolute" text="Archivo"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
