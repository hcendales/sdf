<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{init.page1}" id="page1">
            <ui:html binding="#{init.html1}" id="html1">
                <ui:head binding="#{init.head1}" id="head1">
                    <ui:link binding="#{init.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{init.body1}" focus="form1:tfuser" id="body1" style="-rave-layout: grid">
                    <br/>
                    <ui:form binding="#{init.form1}" id="form1">
                        <ui:button action="#{init.btLogin_action}" binding="#{init.btLogin}" id="btLogin" imageURL="/resources/Ingresar.gif"
                            style="height: 18px; left: 145px; top: 288px; position: absolute; width: 100px" tabIndex="3" text="Ingresar"/>
                        <ui:textField binding="#{init.tfuser}" id="tfuser" style="left: 120px; top: 192px; position: absolute; width: 120px" tabIndex="1" text="#{SessionBean1.user}"/>
                        <ui:label binding="#{init.label1}" for="tfuser" id="label1" labelLevel="1"
                            style="font-size: 14px; left: 48px; top: 192px; position: absolute" text="Usuario"/>
                        <ui:passwordField binding="#{init.tfpassw}" id="tfpassw" style="left: 120px; top: 230px; position: absolute; width: 120px" tabIndex="2"/>
                        <ui:label binding="#{init.label3}" for="tfpassw" id="label3" labelLevel="1"
                            style="font-size: 14px; left: 48px; top: 230px; position: absolute" text="Clave"/>
                        <ui:image binding="#{init.image1}" id="image1" style="left: 816px; top: 0px; position: absolute" url="/resources/logo_fcm.gif"/>
                        <br/>
                        <ui:image binding="#{init.image2}" height="122" id="image2" style="left: 48px; top: 0px; position: absolute"
                            url="/resources/logo_simit.gif" width="144"/>
                        <ui:messageGroup binding="#{init.messageGroup1}" id="messageGroup1" style="height: 103px; left: 288px; top: 192px; position: absolute; width: 214px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
