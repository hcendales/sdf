<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadTercero.page1}" id="page1">
            <ui:html binding="#{ConsNovedadTercero.html1}" id="html1">
                <ui:head binding="#{ConsNovedadTercero.head1}" id="head1">
                    <ui:link binding="#{ConsNovedadTercero.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadTercero.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadTercero.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadTercero.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Consulta Novedad Terceros"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{ConsNovedadTercero.ddMunicipio}" disabled="true" id="ddMunicipio"
                            items="#{ConsNovedadTercero.municipioDataProvider.options['IDMUNICIPIO,IDMUNICIPIO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 216px; position: absolute; width: 288px"
                            tabIndex="1" valueChangeListener="#{ConsNovedadTercero.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadTercero.label1}" id="label1" style="left: 264px; top: 216px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{ConsNovedadTercero.label2}" id="label2" style="left: 264px; top: 264px; position: absolute" text="NIT Tercero"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfNitTercero}" disabled="true" id="tfNitTercero" maxLength="10"
                            style="left: 408px; top: 264px; position: absolute; width: 192px" tabIndex="3"/>
                        <ui:label binding="#{ConsNovedadTercero.label3}" id="label3" style="left: 264px; top: 288px; position: absolute" text="Nombre"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfNombre}" disabled="true" id="tfNombre" maxLength="50"
                            style="left: 408px; top: 288px; position: absolute; width: 192px" tabIndex="4"/>
                        <ui:label binding="#{ConsNovedadTercero.label4}" id="label4" style="left: 264px; top: 384px; position: absolute" text="Cuenta Transferencia"/>
                        <ui:label binding="#{ConsNovedadTercero.label6}" id="label6" style="left: 408px; top: 360px; position: absolute" text="Banco"/>
                        <ui:label binding="#{ConsNovedadTercero.label7}" id="label7" style="left: 576px; top: 360px; position: absolute" text="Tipo"/>
                        <ui:dropDown binding="#{ConsNovedadTercero.ddBanco}" disabled="true" id="ddBanco"
                            items="#{ConsNovedadTercero.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 408px; top: 384px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{ConsNovedadTercero.ddTipo}" disabled="true" id="ddTipo"
                            items="#{ConsNovedadTercero.ddTipoDefaultOptions.options}" style="left: 576px; top: 384px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:label binding="#{ConsNovedadTercero.label8}" id="label8" style="left: 720px; top: 360px; position: absolute" text="Cuenta"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfCuenta}" disabled="true" id="tfCuenta" maxLength="16"
                            style="left: 720px; top: 384px; position: absolute; width: 120px" tabIndex="8"/>
                        <ui:label binding="#{ConsNovedadTercero.label9}" id="label9" style="left: 264px; top: 408px; position: absolute" text="% Base SIMIT"/>
                        <ui:label binding="#{ConsNovedadTercero.label10}" id="label10" style="left: 264px; top: 432px; position: absolute" text="% Base  POLCA"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfBaseSimit}" disabled="true" id="tfBaseSimit" maxLength="6"
                            style="left: 408px; top: 408px; position: absolute; width: 72px" tabIndex="9"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfBasePolca}" disabled="true" id="tfBasePolca" maxLength="6"
                            style="left: 408px; top: 432px; position: absolute; width: 72px" tabIndex="10"/>
                        <ui:dropDown binding="#{ConsNovedadTercero.ddIndBase}" disabled="true" id="ddIndBase"
                            items="#{ConsNovedadTercero.ddIndBaseDefaultOptions.options}" style="left: 408px; top: 456px; position: absolute" tabIndex="11"/>
                        <ui:label binding="#{ConsNovedadTercero.label11}" id="label11" style="left: 264px; top: 456px; position: absolute" text="Indicador Base"/>
                        <ui:button action="#{ConsNovedadTercero.btAnular_action}" binding="#{ConsNovedadTercero.btAnular}" id="btAnular"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea rechazar novedad ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}&#xa;"
                            style="left: 743px; top: 504px; position: absolute; width: 95px" tabIndex="15" text="Rechazar"/>
                        <ui:label binding="#{ConsNovedadTercero.label5}" id="label5" style="left: 264px; top: 240px; position: absolute" text="Número Tercero"/>
                        <ui:dropDown binding="#{ConsNovedadTercero.ddNumero}" disabled="true" id="ddNumero"
                            items="#{ConsNovedadTercero.ddNumeroDefaultOptions.options}" style="left: 408px; top: 240px; position: absolute; width: 198px" tabIndex="2"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfcorreoTercero}" disabled="true" id="tfcorreoTercero"
                            style="left: 408px; top: 312px; position: absolute; width: 192px" tabIndex="5"/>
                        <ui:label binding="#{ConsNovedadTercero.label12}" id="label12" style="left: 264px; top: 312px; position: absolute" text="Correo Electrónico"/>
                        <ui:label binding="#{ConsNovedadTercero.label13}" id="label13" style="left: 264px; top: 528px; position: absolute; width: 94px" text="Firma 1"/>
                        <ui:dropDown binding="#{ConsNovedadTercero.ddFirma1}" disabled="true" id="ddFirma1"
                            items="#{ConsNovedadTercero.ddFirma1DefaultOptions.options}" style="left: 408px; top: 528px; position: absolute; width: 240px" tabIndex="12"/>
                        <ui:label binding="#{ConsNovedadTercero.label14}" id="label14" style="left: 264px; top: 552px; position: absolute; width: 94px" text="Firma 2"/>
                        <ui:dropDown binding="#{ConsNovedadTercero.ddFirma2}" disabled="true" id="ddFirma2"
                            items="#{ConsNovedadTercero.ddFirma2DefaultOptions.options}" style="left: 408px; top: 552px; position: absolute; width: 240px" tabIndex="13"/>
                        <ui:calendar binding="#{ConsNovedadTercero.clActivacion}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="clActivacion"
                            style="left: 408px; top: 576px; position: absolute" tabIndex="14"/>
                        <ui:label binding="#{ConsNovedadTercero.label15}" id="label15" style="left: 264px; top: 576px; position: absolute; width: 118px" text="Fecha Activacion"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfNumero}" disabled="true" id="tfNumero" maxLength="10"
                            style="left: 408px; top: 192px; position: absolute; width: 138px" tabIndex="50"/>
                        <ui:label binding="#{ConsNovedadTercero.labelDivipo1}" for="tfDivipo" id="labelDivipo1"
                            style="left: 264px; top: 192px; position: absolute" text="No Novedad"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn2}" id="tableColumn2"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn3}" id="tableColumn3"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn1}" id="tableColumn1"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn11}" id="tableColumn11"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn4}" id="tableColumn4"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn5}" id="tableColumn5"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn6}" id="tableColumn6"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn7}" id="tableColumn7"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn8}" id="tableColumn8"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn9}" id="tableColumn9"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn10}" id="tableColumn10"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn12}" id="tableColumn12"/>
                        <ui:tableColumn binding="#{ConsNovedadTercero.tableColumn13}" id="tableColumn13"/>
                        <ui:button action="#{ConsNovedadTercero.btAprobar_action}" binding="#{ConsNovedadTercero.btAprobar}" id="btAprobar"
                            style="left: 743px; top: 552px; position: absolute; width: 95px" tabIndex="15" text="Aprobar"/>
                        <ui:label binding="#{ConsNovedadTercero.labelDivipo2}" for="tfDivipo" id="labelDivipo2"
                            style="left: 576px; top: 192px; position: absolute; width: 94px" text="Tipo Novedad"/>
                        <ui:textField binding="#{ConsNovedadTercero.tfTipo}" disabled="true" id="tfTipo" maxLength="10"
                            style="left: 696px; top: 192px; position: absolute; width: 240px" tabIndex="50"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
