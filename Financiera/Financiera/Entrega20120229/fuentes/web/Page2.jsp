<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Page2.page1}" id="page1">
            <ui:html binding="#{Page2.html1}" id="html1">
                <ui:head binding="#{Page2.head1}" id="head1">
                    <ui:link binding="#{Page2.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Page2.body1}" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Page2.form1}" id="form1"/>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
