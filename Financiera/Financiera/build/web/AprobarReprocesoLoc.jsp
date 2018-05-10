<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{AprobarReprocesoLoc.page1}" id="page1">
            <ui:html binding="#{AprobarReprocesoLoc.html1}" id="html1">
                <ui:head binding="#{AprobarReprocesoLoc.head1}" id="head1">
                    <ui:link binding="#{AprobarReprocesoLoc.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{AprobarReprocesoLoc.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{AprobarReprocesoLoc.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{AprobarReprocesoLoc.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Aprobar reproceso Distribucion"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{AprobarReprocesoLoc.label1}" id="label1" style="left: 264px; top: 192px; position: absolute" text="Fecha Corte Inicial"/>
                        <ui:button action="#{AprobarReprocesoLoc.btLiquidar_action}" binding="#{AprobarReprocesoLoc.btLiquidar}" id="btLiquidar"
                            style="left: 407px; top: 528px; position: absolute; width: 120px" tabIndex="3" text="Aprobar"/>
                        <ui:calendar binding="#{AprobarReprocesoLoc.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 384px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:radioButtonGroup binding="#{AprobarReprocesoLoc.rbTipo}" id="rbTipo" items="#{AprobarReprocesoLoc.rbTipoDefaultOptions.options}" style="left: 408px; top: 336px; position: absolute"/>
                        <ui:textArea binding="#{AprobarReprocesoLoc.tmotivo}" id="tmotivo" style="height: 72px; left: 408px; top: 432px; position: absolute; width: 360px"/>
                        <ui:label binding="#{AprobarReprocesoLoc.label2}" id="label2" style="left: 264px; top: 432px; position: absolute" text="Motivo Reproceso"/>
                        <ui:dropDown binding="#{AprobarReprocesoLoc.dropDown1}" id="dropDown1" items="#{AprobarReprocesoLoc.dropDown1DefaultOptions.options}" style="height: 24px; left: 408px; top: 288px; position: absolute; width: 168px"/>
                        <ui:label binding="#{AprobarReprocesoLoc.label3}" id="label3"
                            style="height: 24px; left: 264px; top: 288px; position: absolute; width: 118px" text="Banco recaudo"/>
                        <ui:calendar binding="#{AprobarReprocesoLoc.clFechaIni1}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni1"
                            style="left: 384px; top: 240px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{AprobarReprocesoLoc.label4}" id="label4" style="left: 264px; top: 240px; position: absolute" text="Fecha Corte Final"/>
                        <ui:label binding="#{AprobarReprocesoLoc.label5}" id="label5"
                            style="height: 24px; left: 264px; top: 360px; position: absolute; width: 118px" text="Proceso"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
