<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{CuentaFondo.page1}" id="page1">
            <ui:html binding="#{CuentaFondo.html1}" id="html1">
                <ui:head binding="#{CuentaFondo.head1}" id="head1">
                    <ui:link binding="#{CuentaFondo.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{CuentaFondo.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{CuentaFondo.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{CuentaFondo.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 336px; top: 144px; position: absolute" text="Definicion Cuenta Fondo Rotatorio POLCA"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{CuentaFondo.btActualizar_action}" binding="#{CuentaFondo.btActualizar}" id="btActualizar"
                            style="left: 455px; top: 384px; position: absolute; width: 120px" tabIndex="3" text="Actualizar"/>
                        <ui:label binding="#{CuentaFondo.label1}" id="label1" style="position: absolute; left: 336px; top: 192px" text="Banco"/>
                        <ui:label binding="#{CuentaFondo.label2}" id="label2" style="left: 336px; top: 240px; position: absolute" text="Tipo de Cuenta"/>
                        <ui:label binding="#{CuentaFondo.label3}" id="label3" style="left: 336px; top: 288px; position: absolute" text="Nit Cuenta"/>
                        <ui:label binding="#{CuentaFondo.label4}" id="label4" style="left: 336px; top: 336px; position: absolute" text="Cuenta"/>
                        <ui:dropDown binding="#{CuentaFondo.ddBanco}" id="ddBanco" items="#{CuentaFondo.bancoDataProvider1.options['IDBANCO,NOMBREBANCO']}" style="left: 456px; top: 192px; position: absolute; width: 288px"/>
                        <ui:dropDown binding="#{CuentaFondo.ddTipo}" id="ddTipo" items="#{CuentaFondo.ddTipoDefaultOptions.options}" style="left: 456px; top: 240px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{CuentaFondo.tnit}" id="tnit" maxLength="10" style="height: 24px; left: 456px; top: 288px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{CuentaFondo.tcuenta}" id="tcuenta" maxLength="16" style="height: 24px; left: 456px; top: 336px; position: absolute; width: 144px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
