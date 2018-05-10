<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{AdmNovedades.page}" id="page">
            <ui:html binding="#{AdmNovedades.html}" id="html">
                <ui:head binding="#{AdmNovedades.head}" id="head">
                    <ui:link binding="#{AdmNovedades.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{AdmNovedades.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{AdmNovedades.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:textField binding="#{AdmNovedades.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{AdmNovedades.page1}" id="page1"/>
    <ui:html binding="#{AdmNovedades.html1}" id="html1"/>
    <ui:head binding="#{AdmNovedades.head1}" id="head1"/>
</jsp:root>
