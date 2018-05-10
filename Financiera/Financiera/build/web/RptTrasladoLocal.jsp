<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{RptTrasladoLocal.page1}" id="page1">
            <ui:html binding="#{RptTrasladoLocal.html1}" id="html1">
                <ui:head binding="#{RptTrasladoLocal.head1}" id="head1">
                    <ui:link binding="#{RptTrasladoLocal.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{RptTrasladoLocal.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{RptTrasladoLocal.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{RptTrasladoLocal.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 190px" text="Reporte Traslado Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{RptTrasladoLocal.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni"
                            style="left: 408px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:calendar binding="#{RptTrasladoLocal.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin"
                            style="left: 408px; top: 264px; position: absolute" tabIndex="3"/>
                        <ui:dropDown binding="#{RptTrasladoLocal.ddFormato}" id="ddFormato" items="#{RptTrasladoLocal.ddFormatoDefaultOptions.options}"
                            style="left: 407px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{RptTrasladoLocal.btReport_action}" binding="#{RptTrasladoLocal.btReport}" id="btReport" onClick="btReport_action()"
                            style="left: 431px; top: 720px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{RptTrasladoLocal.label1}" for="cfecIni" id="label1" style="left: 264px; top: 216px; position: absolute" text="Fecha Corte Inicial"/>
                        <ui:label binding="#{RptTrasladoLocal.label2}" for="cfecFin" id="label2" style="left: 264px; top: 264px; position: absolute" text="Fecha Corte Final"/>
                        <ui:label binding="#{RptTrasladoLocal.label3}" id="label3" style="left: 263px; top: 168px; position: absolute" text="Formato"/>
                        <ui:checkbox binding="#{RptTrasladoLocal.checkbox1}" id="checkbox1" label="Totalizada" selectedValue="1"
                            style="left: 432px; top: 672px; position: absolute" tabIndex="5"/>
                        <ui:label binding="#{RptTrasladoLocal.label4}" id="label4" style="position: absolute; left: 264px; top: 312px" text="Autoridad"/>
                        <ui:dropDown binding="#{RptTrasladoLocal.ddTipoRecaudo}" id="ddTipoRecaudo"
                            items="#{RptTrasladoLocal.ddTipoRecaudoDefaultOptions.options}" style="left: 408px; top: 312px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{RptTrasladoLocal.label5}" id="label5" style="left: 264px; top: 528px; position: absolute" text="Banco Recaudador"/>
                        <ui:label binding="#{RptTrasladoLocal.label6}" id="label6" style="left: 264px; top: 360px; position: absolute" text="Concesionario"/>
                        <ui:listbox binding="#{RptTrasladoLocal.listbox1}" id="listbox1" items="#{RptTrasladoLocal.listbox1DefaultOptions.options}"
                            multiple="true" style="height: 144px; left: 408px; top: 360px; position: absolute; width: 264px"/>
                        <ui:listbox binding="#{RptTrasladoLocal.listbox2}" id="listbox2" items="#{RptTrasladoLocal.listbox2DefaultOptions.options}"
                            multiple="true" style="height: 120px; left: 408px; top: 528px; position: absolute; width: 264px"/>
                        <ui:label binding="#{RptTrasladoLocal.label7}" id="label7" style="left: 696px; top: 528px; position: absolute; width: 310px" text="*Para multiple selección utilize CRTL o SHIFT"/>
                        <ui:label binding="#{RptTrasladoLocal.label8}" id="label8" style="left: 696px; top: 360px; position: absolute; width: 310px" text="*Para multiple selección utilize CRTL o SHIFT"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
