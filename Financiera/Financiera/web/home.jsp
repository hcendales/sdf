<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{home.page1}" id="page1">
            <ui:html binding="#{home.html1}" id="html1">
                <ui:head binding="#{home.head1}" id="head1" title="SIMIT Home">
                    <ui:link binding="#{home.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{home.body1}" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{home.form1}" id="form1">
                        <div style="left: 0px; top: 0px; position: absolute">
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{home.staticText1}" id="staticText1" style="left: 30px; top: 149px; position: absolute; width: 128px" text="Bienvenido a SIMIT"/>
                        <ui:staticText binding="#{home.staticText1}" id="staticText1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 168px; top: 120px; position: absolute" text="Bienvenido a SIMIT"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
