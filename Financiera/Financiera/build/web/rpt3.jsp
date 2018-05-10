<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{rpt3.page1}" id="page1">
            <ui:html binding="#{rpt3.html1}" id="html1">
                <ui:head binding="#{rpt3.head1}" id="head1">
                    <ui:link binding="#{rpt3.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{rpt3.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{rpt3.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{rpt3.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 144px; position: absolute" text="Recaudo x Concesionario  x Municipio"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{rpt3.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 408px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:calendar binding="#{rpt3.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 408px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:dropDown binding="#{rpt3.ddFormato}" id="ddFormato" items="#{rpt3.ddFormatoDefaultOptions.options}"
                            style="left: 408px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{rpt3.btReport_action}" binding="#{rpt3.btReport}" id="btReport" onClick="btReport_action()"
                            style="height: 24px; left: 407px; top: 408px; position: absolute; width: 71px" tabIndex="5" text="Generar"/>
                        <ui:label binding="#{rpt3.label1}" for="cfecIni" id="label1" style="left: 288px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{rpt3.label2}" for="cfecFin" id="label2" style="left: 288px; top: 264px; position: absolute" text="Fecha Final"/>
                        <ui:label binding="#{rpt3.label3}" id="label3" style="left: 288px; top: 168px; position: absolute" text="Formato"/>
                        <ui:label binding="#{rpt3.label4}" id="label4" style="left: 288px; top: 312px; position: absolute" text="Tipo Recaudo"/>
                        <ui:label binding="#{rpt3.label5}" id="label5" style="left: 288px; top: 360px; position: absolute" text="Tipo Comparendo"/>
                        <ui:dropDown binding="#{rpt3.ddTipRec}" id="ddTipRec" items="#{rpt3.ddTipRecDefaultOptions.options}" style="left: 408px; top: 312px; position: absolute"/>
                        <ui:dropDown binding="#{rpt3.ddTipCom}" id="ddTipCom" items="#{rpt3.ddTipComDefaultOptions.options}" style="left: 408px; top: 360px; position: absolute; width: 120px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
