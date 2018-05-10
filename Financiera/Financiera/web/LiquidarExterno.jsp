<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{LiquidarExterno.page1}" id="page1">
            <ui:html binding="#{LiquidarExterno.html1}" id="html1">
                <ui:head binding="#{LiquidarExterno.head1}" id="head1">
                    <ui:link binding="#{LiquidarExterno.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{LiquidarExterno.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{LiquidarExterno.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{LiquidarExterno.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Liquidar Recaudo Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{LiquidarExterno.label1}" id="label1" style="left: 264px; top: 192px; position: absolute" text="Fecha Corte"/>
                        <ui:button action="#{LiquidarExterno.btLiquidar_action}" binding="#{LiquidarExterno.btLiquidar}" id="btLiquidar"
                            style="left: 383px; top: 264px; position: absolute; width: 120px" tabIndex="3" text="Liquidar Recaudo"/>
                        <ui:calendar binding="#{LiquidarExterno.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 360px; top: 192px; position: absolute" tabIndex="1"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
