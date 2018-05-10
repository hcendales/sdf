<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadDiasDispersion.page1}" id="page1">
            <ui:html binding="#{ConsNovedadDiasDispersion.html1}" id="html1">
                <ui:head binding="#{ConsNovedadDiasDispersion.head1}" id="head1">
                    <ui:link binding="#{ConsNovedadDiasDispersion.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadDiasDispersion.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadDiasDispersion.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 192px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadDiasDispersion.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 312px; top: 144px; position: absolute" text="Consulta Novedad Dias de Dispersión"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label1}" id="label1" style="left: 312px; top: 264px; position: absolute" text="Municipio"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddBanco}" disabled="true" id="ddBanco"
                            items="#{ConsNovedadDiasDispersion.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 480px; top: 240px; position: absolute; width: 264px" tabIndex="2"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.lbBanco}" id="lbBanco" style="left: 312px; top: 240px; position: absolute" text="Banco"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label2}" id="label2" style="left: 312px; top: 312px; position: absolute" text="Dias Simit Externo"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label3}" id="label3" style="left: 312px; top: 336px; position: absolute" text="Frecuencia Simit Externo"/>
                        <ui:textField binding="#{ConsNovedadDiasDispersion.tfDiasSimitExt}" disabled="true" id="tfDiasSimitExt" maxLength="2"
                            style="left: 480px; top: 312px; position: absolute; width: 72px" tabIndex="3"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddFrecuenciaSimExt}" disabled="true" id="ddFrecuenciaSimExt"
                            items="#{ConsNovedadDiasDispersion.ddFrecuenciaSimExtDefaultOptions.options}"
                            style="left: 480px; top: 336px; position: absolute; width: 192px" tabIndex="5"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label5}" id="label5" style="left: 312px; top: 384px; position: absolute" text="Dias Simit Local"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label6}" id="label6" style="left: 312px; top: 408px; position: absolute" text="Frecuencia Simit Local"/>
                        <ui:textField binding="#{ConsNovedadDiasDispersion.tfDiasSimitLoc}" disabled="true" id="tfDiasSimitLoc" maxLength="2"
                            style="left: 480px; top: 384px; position: absolute; width: 72px" tabIndex="7"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddFrecuenciaSimLoc}" disabled="true" id="ddFrecuenciaSimLoc"
                            items="#{ConsNovedadDiasDispersion.ddFrecuenciaSimLocDefaultOptions.options}"
                            style="left: 480px; top: 408px; position: absolute; width: 192px" tabIndex="9"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label7}" id="label7" style="left: 720px; top: 336px; position: absolute; width: 166px" text="Frecuencia Polca Externo"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label8}" id="label8" style="left: 720px; top: 312px; position: absolute; width: 120px" text="Dias Polca Externo"/>
                        <ui:textField binding="#{ConsNovedadDiasDispersion.tfDiasPolcaExt}" disabled="true" id="tfDiasPolcaExt" maxLength="2"
                            style="left: 888px; top: 312px; position: absolute; width: 72px" tabIndex="4"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddFrecuenciaPolExt}" disabled="true" id="ddFrecuenciaPolExt"
                            items="#{ConsNovedadDiasDispersion.ddFrecuenciaPolExtDefaultOptions.options}"
                            style="left: 888px; top: 336px; position: absolute; width: 216px" tabIndex="6"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label9}" id="label9" style="left: 720px; top: 408px; position: absolute; width: 166px" text="Frecuencia Polca Local"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label10}" id="label10" style="left: 720px; top: 384px; position: absolute; width: 120px" text="Dias Polca Local"/>
                        <ui:textField binding="#{ConsNovedadDiasDispersion.tfDiasPolcaLoc}" disabled="true" id="tfDiasPolcaLoc" maxLength="2"
                            style="left: 888px; top: 384px; position: absolute; width: 72px" tabIndex="8"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddFrecuenciaPolLoc}" disabled="true" id="ddFrecuenciaPolLoc"
                            items="#{ConsNovedadDiasDispersion.ddFrecuenciaPolLocDefaultOptions.options}"
                            style="left: 888px; top: 408px; position: absolute; width: 216px" tabIndex="10"/>
                        <ui:button action="#{ConsNovedadDiasDispersion.btAnular_action}" binding="#{ConsNovedadDiasDispersion.btAnular}" id="btAnular"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea rechazar novedad ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}"
                            style="left: 935px; top: 504px; position: absolute; width: 95px" tabIndex="14" text="Rechazar"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddMunicipio}" disabled="true" id="ddMunicipio"
                            items="#{ConsNovedadDiasDispersion.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 480px; top: 264px; position: absolute; width: 264px"
                            tabIndex="1" valueChangeListener="#{ConsNovedadDiasDispersion.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label4}" id="label4" style="left: 312px; top: 504px; position: absolute; width: 94px" text="Firma 1"/>
                        <ui:calendar binding="#{ConsNovedadDiasDispersion.clActivacion}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="clActivacion"
                            style="left: 480px; top: 552px; position: absolute" tabIndex="13"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddFirma1}" disabled="true" id="ddFirma1"
                            items="#{ConsNovedadDiasDispersion.ddFirma1DefaultOptions.options}"
                            style="left: 480px; top: 504px; position: absolute; width: 240px" tabIndex="11"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label11}" id="label11" style="left: 312px; top: 528px; position: absolute; width: 94px" text="Firma 2"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.label12}" id="label12" style="left: 312px; top: 552px; position: absolute; width: 118px" text="Fecha Activacion"/>
                        <ui:dropDown binding="#{ConsNovedadDiasDispersion.ddFirma2}" disabled="true" id="ddFirma2"
                            items="#{ConsNovedadDiasDispersion.ddFirma2DefaultOptions.options}"
                            style="left: 480px; top: 528px; position: absolute; width: 240px" tabIndex="12"/>
                        <ui:textField binding="#{ConsNovedadDiasDispersion.tfNumero}" disabled="true" id="tfNumero" maxLength="10"
                            style="left: 480px; top: 216px; position: absolute; width: 138px" tabIndex="50"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.labelDivipo1}" for="tfDivipo" id="labelDivipo1"
                            style="left: 312px; top: 216px; position: absolute" text="No Novedad"/>
                        <ui:button action="#{ConsNovedadDiasDispersion.btAprobar_action}" binding="#{ConsNovedadDiasDispersion.btAprobar}" id="btAprobar"
                            onClick="btActualizar_action()" style="left: 935px; top: 552px; position: absolute; width: 95px" tabIndex="14" text="Aprobar"/>
                        <ui:label binding="#{ConsNovedadDiasDispersion.labelDivipo2}" for="tfDivipo" id="labelDivipo2"
                            style="left: 648px; top: 216px; position: absolute; width: 94px" text="Tipo Novedad"/>
                        <ui:textField binding="#{ConsNovedadDiasDispersion.tfTipo}" disabled="true" id="tfTipo" maxLength="10"
                            style="left: 768px; top: 216px; position: absolute; width: 216px" tabIndex="50"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
