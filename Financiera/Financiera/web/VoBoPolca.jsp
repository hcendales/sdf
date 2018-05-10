<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{VoBoPolca.page}" id="page">
            <ui:html binding="#{VoBoPolca.html}" id="html">
                <ui:head binding="#{VoBoPolca.head}" id="head">
                    <ui:link binding="#{VoBoPolca.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{VoBoPolca.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{VoBoPolca.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:textField binding="#{VoBoPolca.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{VoBoPolca.page1}" id="page1"/>
    <ui:html binding="#{VoBoPolca.html1}" id="html1"/>
    <ui:head binding="#{VoBoPolca.head1}" id="head1"/>
</jsp:root>