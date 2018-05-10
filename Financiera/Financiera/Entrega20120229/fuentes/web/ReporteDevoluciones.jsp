<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteDevoluciones.page1}" id="page1">
            <ui:html binding="#{ReporteDevoluciones.html1}" id="html1">
                <ui:head binding="#{ReporteDevoluciones.head1}" id="head1">
                    <ui:link binding="#{ReporteDevoluciones.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteDevoluciones.body1}" focus="form1:ddtipocargue" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteDevoluciones.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteDevoluciones.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte de resultado de transferencia en bancos"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{ReporteDevoluciones.uploadFileButton_action}" binding="#{ReporteDevoluciones.uploadFileButton}"
                            id="uploadFileButton" onClick="uploadFileButton_action()" style="left: 407px; top: 456px; position: absolute; width: 96px"
                            tabIndex="5" text="Generar"/>
                        <ui:dropDown binding="#{ReporteDevoluciones.dropDownBanco}" id="dropDownBanco"
                            items="#{ReporteDevoluciones.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}" onChange=""
                            style="left: 384px; top: 240px; position: absolute; width: 168px" tabIndex="2"/>
                        <ui:dropDown binding="#{ReporteDevoluciones.ddtipocargue}" id="ddtipocargue"
                            items="#{ReporteDevoluciones.ddtipocargueDefaultOptions.options}" onChange=""
                            style="left: 384px; top: 288px; position: absolute; width: 168px" tabIndex="1"/>
                        <ui:label binding="#{ReporteDevoluciones.label6}" id="label6" style="left: 264px; top: 240px; position: absolute" text="Banco Recaudador"/>
                        <ui:label binding="#{ReporteDevoluciones.label7}" id="label7" style="left: 264px; top: 288px; position: absolute" text="Estado "/>
                        <ui:label binding="#{ReporteDevoluciones.label1}" for="cfecIni" id="label1" style="left: 264px; top: 336px; position: absolute" text="Fecha estado Inicial"/>
                        <ui:calendar binding="#{ReporteDevoluciones.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 384px; top: 336px; position: absolute" tabIndex="2"/>
                        <ui:label binding="#{ReporteDevoluciones.label5}" for="cfecIni" id="label5" style="left: 264px; top: 384px; position: absolute" text="Fecha estado final"/>
                        <ui:calendar binding="#{ReporteDevoluciones.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 384px; top: 384px; position: absolute" tabIndex="2"/>
                        <ui:label binding="#{ReporteDevoluciones.label2}" id="label2" style="left: 264px; top: 192px; position: absolute" text="Formato"/>
                        <ui:dropDown binding="#{ReporteDevoluciones.ddFormato}" id="ddFormato" items="#{ReporteDevoluciones.ddFormatoDefaultOptions.options}"
                            style="left: 384px; top: 192px; position: absolute" tabIndex="1"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
