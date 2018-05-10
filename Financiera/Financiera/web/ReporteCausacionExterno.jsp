<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteCausacionExterno.page1}" id="page1">
            <ui:html binding="#{ReporteCausacionExterno.html1}" id="html1">
                <ui:head binding="#{ReporteCausacionExterno.head1}" id="head1">
                    <ui:link binding="#{ReporteCausacionExterno.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteCausacionExterno.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteCausacionExterno.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteCausacionExterno.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Causacion  Gasto SIMIT Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteCausacionExterno.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 360px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:calendar binding="#{ReporteCausacionExterno.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 360px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:dropDown binding="#{ReporteCausacionExterno.ddFormato}" id="ddFormato"
                            items="#{ReporteCausacionExterno.ddFormatoDefaultOptions.options}" style="left: 360px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteCausacionExterno.btReport_action}" binding="#{ReporteCausacionExterno.btReport}" id="btReport"
                            onClick="btReport_action()" style="height: 24px; left: 503px; top: 456px; position: absolute; width: 71px" tabIndex="4" text="Generar"/>
                        <ui:label binding="#{ReporteCausacionExterno.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{ReporteCausacionExterno.label2}" for="cfecFin" id="label2" style="left: 264px; top: 264px; position: absolute" text="Fecha Final"/>
                        <ui:label binding="#{ReporteCausacionExterno.label3}" id="label3" style="left: 264px; top: 168px; position: absolute" text="Formato"/>
                        <ui:label binding="#{ReporteCausacionExterno.tipo_Causación1}" id="tipo_Causación1" style="left: 264px; top: 384px; position: absolute" text="Tipo Causación"/>
                        <ui:dropDown binding="#{ReporteCausacionExterno.ddTipoCausación}" id="ddTipoCausación"
                            items="#{ReporteCausacionExterno.ddTipoCausaciónDefaultOptions.options}"
                            style="left: 360px; top: 384px; position: absolute; width: 120px" tabIndex="5"/>
                        <ui:dropDown binding="#{ReporteCausacionExterno.ddTipoRecaudo}" id="ddTipoRecaudo"
                            items="#{ReporteCausacionExterno.ddTipoRecaudoDefaultOptions.options}"
                            style="left: 360px; top: 336px; position: absolute; width: 120px" tabIndex="4"/>
                        <ui:label binding="#{ReporteCausacionExterno.label4}" id="label4" style="left: 264px; top: 336px; position: absolute" text="Tipo Recaudo"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
