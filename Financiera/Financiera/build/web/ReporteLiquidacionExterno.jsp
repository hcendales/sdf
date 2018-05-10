<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteLiquidacionExterno.page1}" id="page1">
            <ui:html binding="#{ReporteLiquidacionExterno.html1}" id="html1">
                <ui:head binding="#{ReporteLiquidacionExterno.head1}" id="head1">
                    <ui:link binding="#{ReporteLiquidacionExterno.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteLiquidacionExterno.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteLiquidacionExterno.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteLiquidacionExterno.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte Liquidación  Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteLiquidacionExterno.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" required="true"
                            style="left: 431px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{ReporteLiquidacionExterno.ddFormato}" id="ddFormato"
                            items="#{ReporteLiquidacionExterno.ddFormatoDefaultOptions.options}" style="left: 432px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteLiquidacionExterno.btReport_action}" binding="#{ReporteLiquidacionExterno.btReport}" id="btReport"
                            onClick="btReport_action()" style="left: 431px; top: 576px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{ReporteLiquidacionExterno.label1}" for="cfecIni" id="label1" style="left: 311px; top: 216px; position: absolute" text="Fecha Corte Inicial"/>
                        <ui:label binding="#{ReporteLiquidacionExterno.label3}" id="label3" style="left: 336px; top: 168px; position: absolute" text="Formato"/>
                        <ui:checkbox binding="#{ReporteLiquidacionExterno.checkbox1}" id="checkbox1" label="Totalizada" selectedValue="1"
                            style="left: 432px; top: 552px; position: absolute" tabIndex="5"/>
                        <ui:dropDown binding="#{ReporteLiquidacionExterno.ddTipoRecaudo}" id="ddTipoRecaudo"
                            items="#{ReporteLiquidacionExterno.ddTipoRecaudoDefaultOptions.options}" style="left: 432px; top: 336px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{ReporteLiquidacionExterno.label5}" id="label5" style="left: 312px; top: 336px; position: absolute" text="Tipo Recaudo"/>
                        <ui:label binding="#{ReporteLiquidacionExterno.label2}" id="label2" style="left: 312px; top: 384px; position: absolute" text="Concesionario"/>
                        <ui:dropDown binding="#{ReporteLiquidacionExterno.ddConcesionario}" id="ddConcesionario"
                            items="#{ReporteLiquidacionExterno.ddConcesionarioDefaultOptions.options}"
                            style="left: 432px; top: 384px; position: absolute; width: 240px" tabIndex="4"/>
                        <ui:label binding="#{ReporteLiquidacionExterno.label4}" id="label4" style="left: 288px; top: 432px; position: absolute" text="Banco Recaudador"/>
                        <ui:dropDown binding="#{ReporteLiquidacionExterno.ddBanco}" id="ddBanco"
                            items="#{ReporteLiquidacionExterno.ddBancoDefaultOptions.options}" style="left: 432px; top: 432px; position: absolute; width: 240px" tabIndex="4"/>
                        <ui:dropDown binding="#{ReporteLiquidacionExterno.ddMunicipio1}" id="ddMunicipio1"
                            items="#{ReporteLiquidacionExterno.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}" onChange=""
                            style="left: 432px; top: 480px; position: absolute; width: 288px" tabIndex="24" valueChangeListener="#{ReporteLiquidacionExterno.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ReporteLiquidacionExterno.label6}" id="label6" style="left: 336px; top: 480px; position: absolute" text="Municipio"/>
                        <ui:calendar binding="#{ReporteLiquidacionExterno.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" required="true"
                            style="left: 432px; top: 264px; position: absolute" tabIndex="2"/>
                        <ui:label binding="#{ReporteLiquidacionExterno.label7}" for="cfecIni" id="label7" style="left: 312px; top: 264px; position: absolute" text="Fecha Corte Final"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
