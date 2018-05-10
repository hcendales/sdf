<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReporteDistOTCom.page1}" id="page1">
            <ui:html binding="#{ReporteDistOTCom.html1}" id="html1">
                <ui:head binding="#{ReporteDistOTCom.head1}" id="head1">
                    <ui:link binding="#{ReporteDistOTCom.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReporteDistOTCom.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReporteDistOTCom.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReporteDistOTCom.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reporte de Pago a Organismo de Transito con fecha de programacion"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{ReporteDistOTCom.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni"
                            style="left: 504px; top: 216px; position: absolute" tabIndex="2"/>
                        <ui:dropDown binding="#{ReporteDistOTCom.ddFormato}" id="ddFormato" items="#{ReporteDistOTCom.ddFormatoDefaultOptions.options}"
                            style="left: 504px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{ReporteDistOTCom.btReport_action}" binding="#{ReporteDistOTCom.btReport}" id="btReport" onClick="btReport_action()"
                            style="left: 575px; top: 528px; position: absolute; width: 71px" tabIndex="6" text="Generar"/>
                        <ui:label binding="#{ReporteDistOTCom.label1}" for="cfecIni" id="label1" style="left: 312px; top: 216px; position: absolute" text="Fecha Pago Inicial"/>
                        <ui:label binding="#{ReporteDistOTCom.label3}" id="label3" style="left: 432px; top: 168px; position: absolute" text="Formato"/>
                        <ui:checkbox binding="#{ReporteDistOTCom.checkbox}" id="checkbox" label="Totalizada" selectedValue="1"
                            style="left: 600px; top: 480px; position: absolute" tabIndex="5"/>
                        <ui:label binding="#{ReporteDistOTCom.label6}" id="label6" style="left: 408px; top: 336px; position: absolute" text="Municipio"/>
                        <ui:calendar binding="#{ReporteDistOTCom.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin"
                            style="left: 504px; top: 264px; position: absolute" tabIndex="2"/>
                        <ui:label binding="#{ReporteDistOTCom.label7}" for="cfecIni" id="label7" style="left: 312px; top: 264px; position: absolute" text="Fecha Pago Final"/>
                        <ui:listbox binding="#{ReporteDistOTCom.listbox1}" id="listbox1"
                            items="#{ReporteDistOTCom.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}" multiple="true" style="height: 144px; left: 504px; top: 312px; position: absolute; width: 336px"/>
                        <ui:label binding="#{ReporteDistOTCom.label2}" id="label2" style="left: 864px; top: 312px; position: absolute; width: 310px" text="*Para multiple selección utilize CRTL o SHIFT"/>
                        <ui:label binding="#{ReporteDistOTCom.label4}" id="label4" style="left: 792px; top: 216px; position: absolute; width: 310px" text="La fecha de pago corresponde a la fecha en que se envio al banco, NO NECESARIAMENTE ES LA FECHA DE PROGRAMACION DE LA TRANSFERENCIA"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
