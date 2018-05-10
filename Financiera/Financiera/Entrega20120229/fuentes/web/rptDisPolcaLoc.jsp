<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{rptDisPolcaLoc.page1}" id="page1">
            <ui:html binding="#{rptDisPolcaLoc.html1}" id="html1">
                <ui:head binding="#{rptDisPolcaLoc.head1}" id="head1">
                    <ui:link binding="#{rptDisPolcaLoc.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{rptDisPolcaLoc.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{rptDisPolcaLoc.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{rptDisPolcaLoc.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Transferencia POLCA Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{rptDisPolcaLoc.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 360px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{rptDisPolcaLoc.ddFormato}" id="ddFormato" items="#{rptDisPolcaLoc.ddFormatoDefaultOptions.options}"
                            style="left: 360px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{rptDisPolcaLoc.btReport_action}" binding="#{rptDisPolcaLoc.btReport}" id="btReport" onClick="btReport_action()"
                            style="left: 479px; top: 312px; position: absolute; width: 71px" tabIndex="4" text="Generar"/>
                        <ui:label binding="#{rptDisPolcaLoc.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{rptDisPolcaLoc.label3}" id="label3" style="left: 264px; top: 168px; position: absolute" text="Formato"/>
                        <ui:calendar binding="#{rptDisPolcaLoc.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 360px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:label binding="#{rptDisPolcaLoc.label2}" for="cfecIni" id="label2" style="left: 264px; top: 264px; position: absolute" text="Fecha Final"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
