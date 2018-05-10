<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{cambioClave.page1}" id="page1">
            <ui:html binding="#{cambioClave.html1}" id="html1">
                <ui:head binding="#{cambioClave.head1}" id="head1">
                    <ui:link binding="#{cambioClave.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{cambioClave.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{cambioClave.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{cambioClave.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Cambio de Clave"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{cambioClave.btActualizar_action}" binding="#{cambioClave.btActualizar}" id="btActualizar"
                            onClick="btActualizar_action()" style="height: 24px; left: 383px; top: 288px; position: absolute; width: 71px" tabIndex="4" text="Actualizar"/>
                        <ui:label binding="#{cambioClave.label1}" id="label1" style="height: 22px; left: 312px; top: 192px; position: absolute; width: 72px" text="Clave Actual"/>
                        <ui:label binding="#{cambioClave.label2}" id="label2" style="height: 22px; left: 312px; top: 216px; position: absolute; width: 72px" text="Clave Nueva"/>
                        <ui:label binding="#{cambioClave.label3}" id="label3" style="height: 22px; left: 312px; top: 240px; position: absolute; width: 72px" text="Confirmacion"/>
                        <ui:passwordField binding="#{cambioClave.tfClaveActual}" id="tfClaveActual" maxLength="16"
                            style="left: 408px; top: 192px; position: absolute; width: 120px" tabIndex="1"/>
                        <ui:passwordField binding="#{cambioClave.tfClaveNueva}" id="tfClaveNueva" maxLength="16"
                            style="left: 408px; top: 216px; position: absolute; width: 120px" tabIndex="2"/>
                        <ui:passwordField binding="#{cambioClave.tfConfirmacion}" id="tfConfirmacion" maxLength="16"
                            style="left: 408px; top: 240px; position: absolute; width: 120px" tabIndex="3"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
