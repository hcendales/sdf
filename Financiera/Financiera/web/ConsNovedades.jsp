<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedades.page}" id="page">
            <ui:html binding="#{ConsNovedades.html}" id="html">
                <ui:head binding="#{ConsNovedades.head}" id="head">
                    <ui:link binding="#{ConsNovedades.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedades.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedades.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedades.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 262px" text="Consulta Novedades"/>
                        <ui:textField binding="#{ConsNovedades.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:label binding="#{ConsNovedades.label4}" id="label4" style="left: 288px; top: 192px; position: absolute; width: 94px" text="Novedad"/>
                        <ui:dropDown binding="#{ConsNovedades.ddTipoNov}" id="ddTipoNov" items="#{ConsNovedades.ddTipoNovDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddTipoNov');" style="left: 432px; top: 192px; position: absolute; width: 144px"
                            tabIndex="13" valueChangeListener="#{ConsNovedades.ddTipoNov_processValueChange}"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ConsNovedades.page1}" id="page1"/>
    <ui:html binding="#{ConsNovedades.html1}" id="html1"/>
    <ui:head binding="#{ConsNovedades.head1}" id="head1"/>
</jsp:root>
