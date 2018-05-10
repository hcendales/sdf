<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReproLiq.page1}" id="page1">
            <ui:html binding="#{ReproLiq.html1}" id="html1">
                <ui:head binding="#{ReproLiq.head1}" id="head1">
                    <ui:link binding="#{ReproLiq.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReproLiq.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReproLiq.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReproLiq.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reproceso Liquidacion "/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ReproLiq.label1}" id="label1" style="left: 288px; top: 192px; position: absolute" text="Fecha Corte Incial"/>
                        <ui:button action="#{ReproLiq.btLiquidar_action}" binding="#{ReproLiq.btLiquidar}" id="btLiquidar"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea ejecutar el reproceso ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}&#xa;"
                            style="height: 24px; left: 479px; top: 360px; position: absolute; width: 144px" tabIndex="3" text="Ejecutar Reproceso"/>
                        <ui:calendar binding="#{ReproLiq.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 432px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{ReproLiq.label2}" id="label2" style="left: 576px; top: 408px; position: absolute" text="LOG"/>
                        <ui:textArea binding="#{ReproLiq.logAvvillas}" id="logAvvillas" rows="20" style="height: 432px; left: 336px; top: 432px; position: absolute; width: 624px"/>
                        <ui:dropDown binding="#{ReproLiq.ddBanco}" id="ddBanco" items="#{ReproLiq.ddBancoDefaultOptions.options}" style="left: 432px; top: 312px; position: absolute; width: 240px"/>
                        <ui:label binding="#{ReproLiq.label3}" id="label3" style="left: 360px; top: 312px; position: absolute" text="Banco"/>
                        <ui:label binding="#{ReproLiq.label4}" id="label4" style="left: 288px; top: 240px; position: absolute" text="Fecha Corte Final"/>
                        <ui:calendar binding="#{ReproLiq.clFechaFin}" dateFormatPattern="yyyy-MM-dd" id="clFechaFin"
                            style="left: 432px; top: 240px; position: absolute" tabIndex="1"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
