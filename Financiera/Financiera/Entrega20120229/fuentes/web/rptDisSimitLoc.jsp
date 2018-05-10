<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{rptDisSimitLoc.page1}" id="page1">
            <ui:html binding="#{rptDisSimitLoc.html1}" id="html1">
                <ui:head binding="#{rptDisSimitLoc.head1}" id="head1">
                    <ui:link binding="#{rptDisSimitLoc.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{rptDisSimitLoc.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{rptDisSimitLoc.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{rptDisSimitLoc.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Transferencia SIMIT Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{rptDisSimitLoc.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 360px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{rptDisSimitLoc.ddFormato}" id="ddFormato" items="#{rptDisSimitLoc.ddFormatoDefaultOptions.options}"
                            style="left: 360px; top: 168px; position: absolute" tabIndex="1" valueChangeListener="#{rptDisSimitLoc.ddFormato_processValueChange}"/>
                        <ui:button action="#{rptDisSimitLoc.btReport_action}" binding="#{rptDisSimitLoc.btReport}" id="btReport" onClick="btReport_action()"
                            style="left: 455px; top: 312px; position: absolute; width: 71px" tabIndex="4" text="Generar"/>
                        <ui:label binding="#{rptDisSimitLoc.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{rptDisSimitLoc.label3}" id="label3" style="left: 264px; top: 168px; position: absolute" text="Formato"/>
                        <ui:calendar binding="#{rptDisSimitLoc.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 360px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:label binding="#{rptDisSimitLoc.label2}" for="cfecIni" id="label2" style="left: 264px; top: 264px; position: absolute" text="Fecha Final"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
