<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{cargueArchivoDev.page1}" id="page1">
            <ui:html binding="#{cargueArchivoDev.html1}" id="html1">
                <ui:head binding="#{cargueArchivoDev.head1}" id="head1">
                    <ui:link binding="#{cargueArchivoDev.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{cargueArchivoDev.body1}" focus="form1:ddtipocargue" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{cargueArchivoDev.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{cargueArchivoDev.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Cargue Archivo Devolucion"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{cargueArchivoDev.label1}" id="label1"
                            style="height: 22px; left: 264px; top: 264px; position: absolute; width: 190px" text="Seleccione el archivo a cargar :"/>
                        <ui:upload binding="#{cargueArchivoDev.fileUpload1}" id="fileUpload1" style="left: 264px; top: 288px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{cargueArchivoDev.label2}" id="label2" style="left: 264px; top: 408px; position: absolute" text="Nombre de Archivo :"/>
                        <ui:label binding="#{cargueArchivoDev.label3}" id="label3" style="left: 264px; top: 432px; position: absolute; width: 120px" text="Tipo de Archivo :"/>
                        <ui:label binding="#{cargueArchivoDev.label4}" id="label4" style="left: 264px; top: 456px; position: absolute" text="Tamaño de Archivo :"/>
                        <ui:staticText binding="#{cargueArchivoDev.fileNameStaticText}" id="fileNameStaticText" style="left: 384px; top: 408px; position: absolute"/>
                        <ui:staticText binding="#{cargueArchivoDev.fileTypeStaticText}" id="fileTypeStaticText" style="left: 384px; top: 432px; position: absolute"/>
                        <ui:staticText binding="#{cargueArchivoDev.fileSizeStaticText}" id="fileSizeStaticText" style="left: 384px; top: 456px; position: absolute"/>
                        <ui:staticText binding="#{cargueArchivoDev.fileSizeStaticText}" id="fileSizeStaticText" style="left: 288px; top: 336px; position: absolute"/>
                        <ui:button action="#{cargueArchivoDev.uploadFileButton_action}" binding="#{cargueArchivoDev.uploadFileButton}" id="uploadFileButton"
                            onClick="uploadFileButton_action()" style="left: 263px; top: 315px; position: absolute; width: 96px" tabIndex="5" text="Cargar Archivo"/>
                        <ui:dropDown binding="#{cargueArchivoDev.ddtipocargue}" id="ddtipocargue" items="#{cargueArchivoDev.ddtipocargueDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddtipocargue');" style="left: 336px; top: 168px; position: absolute; width: 168px"
                            tabIndex="1" valueChangeListener="#{cargueArchivoDev.ddtipocargue_processValueChange}"/>
                        <ui:label binding="#{cargueArchivoDev.label7}" id="label7" style="left: 264px; top: 168px; position: absolute" text="Tipo"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
