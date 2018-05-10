<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{cargueArchivo.page1}" id="page1">
            <ui:html binding="#{cargueArchivo.html1}" id="html1">
                <ui:head binding="#{cargueArchivo.head1}" id="head1">
                    <ui:link binding="#{cargueArchivo.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{cargueArchivo.body1}" focus="form1:ddtipocargue" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{cargueArchivo.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{cargueArchivo.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Cargue Archivo "/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{cargueArchivo.label1}" id="label1" style="height: 22px; left: 264px; top: 264px; position: absolute; width: 190px" text="Seleccione el archivo a cargar :"/>
                        <ui:upload binding="#{cargueArchivo.fileUpload1}" id="fileUpload1" style="left: 264px; top: 288px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{cargueArchivo.label2}" id="label2" style="left: 264px; top: 408px; position: absolute" text="Nombre de Archivo :"/>
                        <ui:label binding="#{cargueArchivo.label3}" id="label3" style="left: 264px; top: 432px; position: absolute; width: 120px" text="Tipo de Archivo :"/>
                        <ui:label binding="#{cargueArchivo.label4}" id="label4" style="left: 264px; top: 456px; position: absolute" text="Tamaño de Archivo :"/>
                        <ui:staticText binding="#{cargueArchivo.fileNameStaticText}" id="fileNameStaticText" style="left: 384px; top: 408px; position: absolute"/>
                        <ui:staticText binding="#{cargueArchivo.fileTypeStaticText}" id="fileTypeStaticText" style="left: 384px; top: 432px; position: absolute"/>
                        <ui:staticText binding="#{cargueArchivo.fileSizeStaticText}" id="fileSizeStaticText" style="left: 384px; top: 456px; position: absolute"/>
                        <ui:staticText binding="#{cargueArchivo.fileSizeStaticText}" id="fileSizeStaticText" style="left: 288px; top: 336px; position: absolute"/>
                        <ui:button action="#{cargueArchivo.uploadFileButton_action}" binding="#{cargueArchivo.uploadFileButton}" id="uploadFileButton"
                            onClick="uploadFileButton_action()" style="left: 263px; top: 315px; position: absolute; width: 96px" tabIndex="5" text="Cargar Archivo"/>
                        <ui:dropDown binding="#{cargueArchivo.dropDownBanco}" id="dropDownBanco"
                            items="#{cargueArchivo.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'dropDownBanco');" style="left: 336px; top: 192px; position: absolute; width: 264px"
                            tabIndex="2" valueChangeListener="#{cargueArchivo.dropDownBanco_processValueChange}"/>
                        <ui:dropDown binding="#{cargueArchivo.dropDownCuenta}" id="dropDownCuenta"
                            items="#{cargueArchivo.cta_recaudo_fcmDataProvider.options['CTA_GRAL,CTA_GRAL']}"
                            style="left: 336px; top: 216px; position: absolute; width: 264px" tabIndex="3"/>
                        <ui:dropDown binding="#{cargueArchivo.ddtipocargue}" id="ddtipocargue" items="#{cargueArchivo.ddtipocargueDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddtipocargue');" style="left: 336px; top: 168px; position: absolute; width: 168px"
                            tabIndex="1" valueChangeListener="#{cargueArchivo.ddtipocargue_processValueChange}"/>
                        <ui:label binding="#{cargueArchivo.label6}" id="label6" style="left: 264px; top: 192px; position: absolute" text="Banco"/>
                        <ui:label binding="#{cargueArchivo.label7}" id="label7" style="left: 264px; top: 168px; position: absolute" text="Tipo"/>
                        <ui:label binding="#{cargueArchivo.label5}" id="label5" style="left: 264px; top: 216px; position: absolute" text="Cuenta"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
