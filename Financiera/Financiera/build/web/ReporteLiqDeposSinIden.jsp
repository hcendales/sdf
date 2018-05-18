<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteLiqDeposSinIden.page1}" id="page1">
            <ui:html binding="#{ReporteLiqDeposSinIden.html1}" id="html1">
                <ui:head binding="#{ReporteLiqDeposSinIden.head1}" id="head1">
                    <ui:link binding="#{ReporteLiqDeposSinIden.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteLiqDeposSinIden.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteLiqDeposSinIden.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteLiqDeposSinIden.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 526px" text="Reporte Distribución Depositos sin Identificar"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteLiqDeposSinIden.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni"
                            style="left: 408px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:calendar binding="#{ReporteLiqDeposSinIden.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin"
                            style="left: 408px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:dropDown binding="#{ReporteLiqDeposSinIden.ddFormato}" id="ddFormato"
                            items="#{ReporteLiqDeposSinIden.ddFormatoDefaultOptions.options}" style="left: 407px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteLiqDeposSinIden.btReport_action}" binding="#{ReporteLiqDeposSinIden.btReport}" id="btReport"
                            onClick="btReport_action()" style="left: 431px; top: 528px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{ReporteLiqDeposSinIden.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Transaccion Inicial"/>
                        <ui:label binding="#{ReporteLiqDeposSinIden.label2}" for="cfecFin" id="label2" style="left: 264px; top: 264px; position: absolute" text="Fecha Transaccion Final"/>
                        <ui:label binding="#{ReporteLiqDeposSinIden.label3}" id="label3" style="left: 263px; top: 168px; position: absolute" text="Formato"/>
                        <ui:label binding="#{ReporteLiqDeposSinIden.label4}" id="label4" style="position: absolute; left: 264px; top: 312px" text="Tipo Recaudo"/>
                        <ui:dropDown binding="#{ReporteLiqDeposSinIden.ddTipoRecaudo}" id="ddTipoRecaudo"
                            items="#{ReporteLiqDeposSinIden.ddTipoRecaudoDefaultOptions.options}" style="left: 408px; top: 312px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{ReporteLiqDeposSinIden.label5}" id="label5" style="left: 264px; top: 360px; position: absolute" text="Banco Recaudador"/>
                        <ui:listbox binding="#{ReporteLiqDeposSinIden.listbox2}" id="listbox2" items="#{ReporteLiqDeposSinIden.listbox2DefaultOptions.options}"
                            multiple="true" style="height: 120px; left: 408px; top: 360px; position: absolute; width: 264px"/>
                        <ui:label binding="#{ReporteLiqDeposSinIden.label7}" id="label7" style="left: 696px; top: 360px; position: absolute; width: 310px" text="*Para multiple selección utilize CRTL o SHIFT"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
