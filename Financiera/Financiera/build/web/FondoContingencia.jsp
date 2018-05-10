<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{FondoContingencia.page1}" id="page1">
            <ui:html binding="#{FondoContingencia.html1}" id="html1">
                <ui:head binding="#{FondoContingencia.head1}" id="head1">
                    <ui:link binding="#{FondoContingencia.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{FondoContingencia.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{FondoContingencia.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{FondoContingencia.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Fondo de Contingencia"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{FondoContingencia.label1}" id="label1" style="left: 336px; top: 168px; position: absolute" text="Banco"/>
                        <ui:label binding="#{FondoContingencia.label2}" id="label2" style="left: 336px; top: 192px; position: absolute" text="Tipo Cuenta"/>
                        <ui:label binding="#{FondoContingencia.label3}" id="label3" style="left: 336px; top: 216px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{FondoContingencia.label4}" id="label4" style="left: 336px; top: 240px; position: absolute" text="Identificacion"/>
                        <ui:label binding="#{FondoContingencia.label5}" id="label5" style="left: 336px; top: 264px; position: absolute" text="Numero cuenta"/>
                        <ui:textField binding="#{FondoContingencia.tidentificacion}" id="tidentificacion" maxLength="16" style="left: 456px; top: 240px; position: absolute; width: 168px"/>
                        <ui:textField binding="#{FondoContingencia.tcuenta}" id="tcuenta" maxLength="16" style="left: 456px; top: 264px; position: absolute; width: 168px"/>
                        <ui:button action="#{FondoContingencia.button1_action}" binding="#{FondoContingencia.button1}" id="button1"
                            style="left: 479px; top: 312px; position: absolute; width: 96px" text="Actualizar"/>
                        <ui:dropDown binding="#{FondoContingencia.ddBanco}" id="ddBanco"
                            items="#{FondoContingencia.bancoDataProvider1.options['IDBANCO,NOMBREBANCO']}" style="left: 456px; top: 168px; position: absolute; width: 168px"/>
                        <ui:dropDown binding="#{FondoContingencia.ddTipo}" id="ddTipo" items="#{FondoContingencia.ddTipoDefaultOptions.options}" style="position: absolute; left: 456px; top: 192px"/>
                        <ui:dropDown binding="#{FondoContingencia.ddNit}" id="ddNit" items="#{FondoContingencia.ddNitDefaultOptions.options}" style="position: absolute; left: 456px; top: 216px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
