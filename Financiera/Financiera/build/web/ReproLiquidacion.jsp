<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReproLiquidacion.page1}" id="page1">
            <ui:html binding="#{ReproLiquidacion.html1}" id="html1">
                <ui:head binding="#{ReproLiquidacion.head1}" id="head1">
                    <ui:link binding="#{ReproLiquidacion.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReproLiquidacion.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReproLiquidacion.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReproLiquidacion.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Días de Dispersión"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ReproLiquidacion.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{ReproLiquidacion.table1}" id="table1" paginateButton="true" paginationControls="true"
                            selectMultipleButton="true" style="left: 264px; top: 432px; position: absolute; width: 997px" tabIndex="12"
                            title="Dias de Dispersion" width="912">
                            <ui:tableRowGroup binding="#{ReproLiquidacion.tableRowGroup1}" emptyDataMsg="No hay registros o Seleccione Municipio"
                                id="tableRowGroup1" rows="10" sourceData="#{ReproLiquidacion.dias_dispersionDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn11}" id="tableColumn11" width="52">
                                    <ui:button action="#{ReproLiquidacion.btEditar_action}" binding="#{ReproLiquidacion.btEditar}" id="btEditar"
                                        imageURL="/resources/edit.GIF" text="Editar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{ReproLiquidacion.beliminar_action}" binding="#{ReproLiquidacion.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn13}" headerText="IDMUNICIPIO" id="tableColumn13" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{ReproLiquidacion.stMunicipio}" id="stMunicipio" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn2}" headerText="IDBANCO" id="tableColumn2" sort="IDBANCO">
                                    <ui:staticText binding="#{ReproLiquidacion.stIdbanco}" id="stIdbanco" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn12}" headerText="BANCO" id="tableColumn12" sort="BANCO">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText11}" id="staticText11" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn7}" headerText="DIAS SIMIT EXTERNO" id="tableColumn7" sort="DIAS_DISPERSION_SE">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText7}" id="staticText7" text="#{currentRow.value['DIAS_DISPERSION_SE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn8}" headerText="FRECUENCIA SIMIT EXTERNO" id="tableColumn8" sort="FREC_DISPERSION_SE">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText8}" id="staticText8" text="#{currentRow.value['FREC_DISPERSION_SE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn3}" headerText="DIAS SIMIT LOCAL" id="tableColumn3" sort="DIAS_DISPERSION_SL">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText3}" id="staticText3" text="#{currentRow.value['DIAS_DISPERSION_SL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn4}" headerText="FRECUENCIA SIMIT LOCAL" id="tableColumn4" sort="FREC_DISPERSION_SL">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText4}" id="staticText4" text="#{currentRow.value['FREC_DISPERSION_SL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn9}" headerText="DIAS POLCA EXTERNO" id="tableColumn9" sort="DIAS_DISPERSION_PE">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText9}" id="staticText9" text="#{currentRow.value['DIAS_DISPERSION_PE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn10}" headerText="FRECUENCIA POLCA EXTERNO" id="tableColumn10" sort="FREC_DISPERSION_PE">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText10}" id="staticText10" text="#{currentRow.value['FREC_DISPERSION_PE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn5}" headerText="DIAS POLCAL OCAL" id="tableColumn5" sort="DIAS_DISPERSION_PL">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText5}" id="staticText5" text="#{currentRow.value['DIAS_DISPERSION_PL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReproLiquidacion.tableColumn6}" headerText="FRECUENCIA POLCA LOCAL" id="tableColumn6" sort="FREC_DISPERSION_PL">
                                    <ui:staticText binding="#{ReproLiquidacion.staticText6}" id="staticText6" text="#{currentRow.value['FREC_DISPERSION_PL']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{ReproLiquidacion.ddBanco}" id="ddBanco" immediate="true"
                            items="#{ReproLiquidacion.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 384px; top: 192px; position: absolute; width: 312px" tabIndex="2"/>
                        <ui:label binding="#{ReproLiquidacion.lbBanco}" id="lbBanco" style="left: 264px; top: 192px; position: absolute" text="Banco Recaudador"/>
                        <ui:label binding="#{ReproLiquidacion.label2}" id="label2" style="left: 264px; top: 240px; position: absolute" text="Días Simit Externo"/>
                        <ui:label binding="#{ReproLiquidacion.label3}" id="label3" style="left: 264px; top: 264px; position: absolute" text="Frecuencia Simit Externo"/>
                        <ui:textField binding="#{ReproLiquidacion.tfDiasSimitExt}" id="tfDiasSimitExt" maxLength="2"
                            style="left: 432px; top: 240px; position: absolute; width: 72px" tabIndex="3"/>
                        <ui:dropDown binding="#{ReproLiquidacion.ddFrecuenciaSimExt}" id="ddFrecuenciaSimExt"
                            items="#{ReproLiquidacion.ddFrecuenciaSimExtDefaultOptions.options}"
                            style="left: 432px; top: 264px; position: absolute; width: 144px" tabIndex="5"/>
                        <ui:label binding="#{ReproLiquidacion.label5}" id="label5" style="left: 264px; top: 312px; position: absolute" text="Días Simit Local"/>
                        <ui:label binding="#{ReproLiquidacion.label6}" id="label6" style="left: 264px; top: 336px; position: absolute" text="Frecuencia Simit Local"/>
                        <ui:textField binding="#{ReproLiquidacion.tfDiasSimitLoc}" id="tfDiasSimitLoc" maxLength="2"
                            style="left: 432px; top: 312px; position: absolute; width: 72px" tabIndex="7"/>
                        <ui:dropDown binding="#{ReproLiquidacion.ddFrecuenciaSimLoc}" id="ddFrecuenciaSimLoc"
                            items="#{ReproLiquidacion.ddFrecuenciaSimLocDefaultOptions.options}"
                            style="left: 432px; top: 336px; position: absolute; width: 144px" tabIndex="9"/>
                        <ui:label binding="#{ReproLiquidacion.label7}" id="label7" style="left: 624px; top: 264px; position: absolute; width: 166px" text="Frecuencia Polca Externo"/>
                        <ui:label binding="#{ReproLiquidacion.label8}" id="label8" style="left: 624px; top: 240px; position: absolute; width: 120px" text="Días Polca Externo"/>
                        <ui:textField binding="#{ReproLiquidacion.tfDiasPolcaExt}" id="tfDiasPolcaExt" maxLength="2"
                            style="left: 792px; top: 240px; position: absolute; width: 72px" tabIndex="4"/>
                        <ui:dropDown binding="#{ReproLiquidacion.ddFrecuenciaPolExt}" id="ddFrecuenciaPolExt"
                            items="#{ReproLiquidacion.ddFrecuenciaPolExtDefaultOptions.options}"
                            style="left: 792px; top: 264px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:label binding="#{ReproLiquidacion.label9}" id="label9" style="left: 624px; top: 336px; position: absolute; width: 166px" text="Frecuencia Polca Local"/>
                        <ui:label binding="#{ReproLiquidacion.label10}" id="label10" style="left: 624px; top: 312px; position: absolute; width: 120px" text="Días Polca Local"/>
                        <ui:textField binding="#{ReproLiquidacion.tfDiasPolcaLoc}" id="tfDiasPolcaLoc" maxLength="2"
                            style="left: 792px; top: 312px; position: absolute; width: 72px" tabIndex="8"/>
                        <ui:dropDown binding="#{ReproLiquidacion.ddFrecuenciaPolLoc}" id="ddFrecuenciaPolLoc"
                            items="#{ReproLiquidacion.ddFrecuenciaPolLocDefaultOptions.options}"
                            style="left: 792px; top: 336px; position: absolute; width: 144px" tabIndex="10"/>
                        <ui:button action="#{ReproLiquidacion.btAdicionar_action}" binding="#{ReproLiquidacion.btAdicionar}" id="btAdicionar"
                            onClick="btActualizar_action()" style="left: 839px; top: 384px; position: absolute; width: 95px" tabIndex="11" text="Adicionar"/>
                        <ui:dropDown binding="#{ReproLiquidacion.ddMunicipio}" id="ddMunicipio"
                            items="#{ReproLiquidacion.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 384px; top: 168px; position: absolute; width: 312px"
                            tabIndex="1" valueChangeListener="#{ReproLiquidacion.ddMunicipio_processValueChange}"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
