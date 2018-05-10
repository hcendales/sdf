<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{rptCauIngPolcaLoc.page1}" id="page1">
            <ui:html binding="#{rptCauIngPolcaLoc.html1}" id="html1">
                <ui:head binding="#{rptCauIngPolcaLoc.head1}" id="head1">
                    <ui:link binding="#{rptCauIngPolcaLoc.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{rptCauIngPolcaLoc.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{rptCauIngPolcaLoc.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{rptCauIngPolcaLoc.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 384px" text="Reporte Causacion Ingreso POLCA Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{rptCauIngPolcaLoc.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 360px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:calendar binding="#{rptCauIngPolcaLoc.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 360px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:dropDown binding="#{rptCauIngPolcaLoc.ddFormato}" id="ddFormato" items="#{rptCauIngPolcaLoc.ddFormatoDefaultOptions.options}"
                            style="left: 360px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{rptCauIngPolcaLoc.btReport_action}" binding="#{rptCauIngPolcaLoc.btReport}" id="btReport"
                            onClick="btReport_action()" style="height: 24px; left: 287px; top: 312px; position: absolute; width: 71px" tabIndex="4" text="Generar"/>
                        <ui:label binding="#{rptCauIngPolcaLoc.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{rptCauIngPolcaLoc.label2}" for="cfecFin" id="label2" style="left: 264px; top: 264px; position: absolute" text="Fecha Final"/>
                        <ui:label binding="#{rptCauIngPolcaLoc.label3}" id="label3" style="left: 264px; top: 168px; position: absolute" text="Formato"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
