<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{CargaRecaudoExterno.page1}" id="page1">
            <ui:html binding="#{CargaRecaudoExterno.html1}" id="html1">
                <ui:head binding="#{CargaRecaudoExterno.head1}" id="head1">
                    <ui:link binding="#{CargaRecaudoExterno.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{CargaRecaudoExterno.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{CargaRecaudoExterno.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{CargaRecaudoExterno.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 312px; top: 120px; position: absolute" text="Carga Recaudo Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{CargaRecaudoExterno.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 432px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{CargaRecaudoExterno.label1}" id="label1" style="left: 336px; top: 192px; position: absolute" text="Fecha Inicial"/>
                        <ui:calendar binding="#{CargaRecaudoExterno.clFechaFin}" dateFormatPattern="yyyy-MM-dd" id="clFechaFin"
                            style="left: 432px; top: 240px; position: absolute" tabIndex="2"/>
                        <ui:label binding="#{CargaRecaudoExterno.label2}" id="label2" style="left: 336px; top: 240px; position: absolute" text="Fecha Final"/>
                        <ui:button action="#{CargaRecaudoExterno.btCargar_action}" binding="#{CargaRecaudoExterno.btCargar}" id="btCargar"
                            style="left: 455px; top: 312px; position: absolute; width: 143px" tabIndex="3" text="Cargar Recaudo"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>