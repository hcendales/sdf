<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{rpt1.page1}" id="page1">
            <ui:html binding="#{rpt1.html1}" id="html1">
                <ui:head binding="#{rpt1.head1}" id="head1">
                    <ui:link binding="#{rpt1.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{rpt1.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{rpt1.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{rpt1.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 144px; position: absolute" text="Recaudo x Concesionario  x Municipio"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{rpt1.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" style="left: 408px; top: 240px; position: absolute" tabIndex="2"/>
                        <ui:calendar binding="#{rpt1.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" style="left: 408px; top: 288px; position: absolute" tabIndex="3"/>
                        <ui:dropDown binding="#{rpt1.ddFormato}" id="ddFormato" items="#{rpt1.ddFormatoDefaultOptions.options}"
                            style="left: 408px; top: 192px; position: absolute; width: 96px" tabIndex="1"/>
                        <ui:button action="#{rpt1.btReport_action}" binding="#{rpt1.btReport}" id="btReport" onClick="btReport_action()"
                            style="height: 24px; left: 407px; top: 432px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{rpt1.label1}" for="cfecIni" id="label1" style="left: 288px; top: 240px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{rpt1.label2}" for="cfecFin" id="label2" style="left: 288px; top: 288px; position: absolute" text="Fecha Final"/>
                        <ui:label binding="#{rpt1.label3}" id="label3" style="left: 288px; top: 192px; position: absolute" text="Formato"/>
                        <ui:label binding="#{rpt1.label4}" id="label4" style="left: 288px; top: 336px; position: absolute" text="Tipo Recaudo"/>
                        <ui:label binding="#{rpt1.label5}" id="label5" style="left: 288px; top: 384px; position: absolute" text="Tipo Comparendo"/>
                        <ui:dropDown binding="#{rpt1.ddTipRec}" id="ddTipRec" items="#{rpt1.ddTipRecDefaultOptions.options}"
                            style="left: 408px; top: 336px; position: absolute; width: 96px" tabIndex="4"/>
                        <ui:dropDown binding="#{rpt1.ddTipCom}" id="ddTipCom" items="#{rpt1.ddTipComDefaultOptions.options}"
                            style="left: 408px; top: 384px; position: absolute; width: 96px" tabIndex="5"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
