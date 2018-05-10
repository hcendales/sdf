<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{cargueBanco.page1}" id="page1">
            <ui:html binding="#{cargueBanco.html1}" id="html1">
                <ui:head binding="#{cargueBanco.head1}" id="head1">
                    <ui:link binding="#{cargueBanco.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{cargueBanco.body1}" focus="form1:ddtipocargue" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{cargueBanco.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{cargueBanco.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Cargue Archivo "/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{cargueBanco.label1}" id="label1" style="height: 22px; left: 264px; top: 264px; position: absolute; width: 190px" text="Seleccione el archivo a cargar :"/>
                        <ui:upload binding="#{cargueBanco.fileUpload1}" id="fileUpload1" style="left: 264px; top: 288px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{cargueBanco.label2}" id="label2" style="left: 264px; top: 408px; position: absolute" text="Nombre de Archivo :"/>
                        <ui:label binding="#{cargueBanco.label3}" id="label3" style="left: 264px; top: 432px; position: absolute; width: 120px" text="Tipo de Archivo :"/>
                        <ui:label binding="#{cargueBanco.label4}" id="label4" style="left: 264px; top: 456px; position: absolute" text="Tamaño de Archivo :"/>
                        <ui:staticText binding="#{cargueBanco.fileNameStaticText}" id="fileNameStaticText" style="left: 408px; top: 408px; position: absolute"/>
                        <ui:staticText binding="#{cargueBanco.fileTypeStaticText}" id="fileTypeStaticText" style="left: 408px; top: 432px; position: absolute"/>
                        <ui:staticText binding="#{cargueBanco.fileSizeStaticText}" id="fileSizeStaticText" style="left: 408px; top: 456px; position: absolute"/>
                        <ui:staticText binding="#{cargueBanco.fileSizeStaticText}" id="fileSizeStaticText" style="left: 288px; top: 336px; position: absolute"/>
                        <ui:button action="#{cargueBanco.uploadFileButton_action}" binding="#{cargueBanco.uploadFileButton}" id="uploadFileButton"
                            onClick="uploadFileButton_action()" style="left: 263px; top: 315px; position: absolute; width: 96px" tabIndex="5" text="Cargar Archivo"/>
                        <ui:dropDown binding="#{cargueBanco.dropDownBanco}" id="dropDownBanco"
                            items="#{cargueBanco.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}" onChange=""
                            style="left: 336px; top: 192px; position: absolute; width: 168px" tabIndex="2"/>
                        <ui:dropDown binding="#{cargueBanco.ddtipocargue}" id="ddtipocargue" items="#{cargueBanco.ddtipocargueDefaultOptions.options}"
                            onChange="" style="left: 336px; top: 168px; position: absolute; width: 168px" tabIndex="1"/>
                        <ui:label binding="#{cargueBanco.label6}" id="label6" style="left: 264px; top: 192px; position: absolute" text="Banco"/>
                        <ui:label binding="#{cargueBanco.label7}" id="label7" style="left: 264px; top: 168px; position: absolute" text="Tipo"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
