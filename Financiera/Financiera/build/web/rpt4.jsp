<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{rpt4.page1}" id="page1">
            <ui:html binding="#{rpt4.html1}" id="html1">
                <ui:head binding="#{rpt4.head1}" id="head1">
                    <ui:link binding="#{rpt4.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{rpt4.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{rpt4.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{rpt4.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Formato de Cambio de Informacion Financiera"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{rpt4.ddMunicipio}" id="ddMunicipio" items="#{rpt4.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            style="left: 408px; top: 168px; position: absolute; width: 288px" tabIndex="1"/>
                        <ui:label binding="#{rpt4.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{rpt4.label4}" id="label4" style="left: 264px; top: 192px; position: absolute" text="Banco Recaudador"/>
                        <ui:dropDown binding="#{rpt4.ddBanco}" id="ddBanco" items="#{rpt4.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 408px; top: 192px; position: absolute; width: 144px" tabIndex="5"/>
                        <ui:button action="#{rpt4.btActualizar_action}" binding="#{rpt4.btActualizar}" id="btActualizar" onClick="btActualizar_action()"
                            style="left: 407px; top: 320px; position: absolute; width: 95px" tabIndex="11" text="Generar"/>
                        <ui:dropDown binding="#{rpt4.ddFirma1}" id="ddFirma1" items="#{rpt4.vw_cargosDataProvider.options['NOMBRE,CARGO']}" style="left: 408px; top: 250px; position: absolute"/>
                        <ui:dropDown binding="#{rpt4.ddFirma2}" id="ddFirma2" items="#{rpt4.vw_cargosDataProvider.options['NOMBRE,CARGO']}" style="left: 560px; top: 250px; position: absolute"/>
                        <ui:label binding="#{rpt4.label2}" id="label2" style="left: 408px; top: 230px; position: absolute" text="Firma 1"/>
                        <ui:label binding="#{rpt4.label3}" id="label3" style="left: 560px; top: 230px; position: absolute" text="Firma 2"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
