<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{rptCauGasPolcaExt.page1}" id="page1">
            <ui:html binding="#{rptCauGasPolcaExt.html1}" id="html1">
                <ui:head binding="#{rptCauGasPolcaExt.head1}" id="head1">
                    <ui:link binding="#{rptCauGasPolcaExt.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{rptCauGasPolcaExt.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{rptCauGasPolcaExt.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{rptCauGasPolcaExt.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 336px" text="Reporte Causacion  Gasto POLCA Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{rptCauGasPolcaExt.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 384px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:calendar binding="#{rptCauGasPolcaExt.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 384px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:dropDown binding="#{rptCauGasPolcaExt.ddFormato}" id="ddFormato" items="#{rptCauGasPolcaExt.ddFormatoDefaultOptions.options}"
                            style="left: 384px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{rptCauGasPolcaExt.btReport_action}" binding="#{rptCauGasPolcaExt.btReport}" id="btReport"
                            onClick="btReport_action()" style="height: 24px; left: 311px; top: 312px; position: absolute; width: 71px" tabIndex="4" text="Generar"/>
                        <ui:label binding="#{rptCauGasPolcaExt.label1}" for="cfecIni" id="label1" style="left: 288px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{rptCauGasPolcaExt.label2}" for="cfecFin" id="label2" style="left: 288px; top: 264px; position: absolute" text="Fecha Final"/>
                        <ui:label binding="#{rptCauGasPolcaExt.label3}" id="label3" style="left: 288px; top: 168px; position: absolute" text="Formato"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
