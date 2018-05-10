<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{RptInfoFinanciera.page1}" id="page1">
            <ui:html binding="#{RptInfoFinanciera.html1}" id="html1">
                <ui:head binding="#{RptInfoFinanciera.head1}" id="head1">
                    <ui:link binding="#{RptInfoFinanciera.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{RptInfoFinanciera.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{RptInfoFinanciera.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{RptInfoFinanciera.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Informacion Financiera"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{RptInfoFinanciera.ddFormato}" id="ddFormato" items="#{RptInfoFinanciera.ddFormatoDefaultOptions.options}"
                            style="left: 360px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{RptInfoFinanciera.btReport_action}" binding="#{RptInfoFinanciera.btReport}" id="btReport"
                            onClick="btReport_action()" style="height: 24px; left: 335px; top: 216px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{RptInfoFinanciera.label3}" id="label3" style="left: 264px; top: 168px; position: absolute" text="Formato"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
