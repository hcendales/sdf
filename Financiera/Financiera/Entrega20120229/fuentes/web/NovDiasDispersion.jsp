<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{NovDiasDispersion.page1}" id="page1">
            <ui:html binding="#{NovDiasDispersion.html1}" id="html1">
                <ui:head binding="#{NovDiasDispersion.head1}" id="head1">
                    <ui:link binding="#{NovDiasDispersion.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{NovDiasDispersion.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{NovDiasDispersion.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 192px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{NovDiasDispersion.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 312px; top: 144px; position: absolute" text="Novedad Dias de Dispersión"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{NovDiasDispersion.label1}" id="label1" style="left: 312px; top: 216px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{NovDiasDispersion.table1}" id="table1"
                            style="left: 312px; top: 528px; position: absolute; width: 997px" tabIndex="12" title="Dias de Dispersion" width="997">
                            <ui:tableRowGroup binding="#{NovDiasDispersion.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="10"
                                sourceData="#{NovDiasDispersion.dias_dispersionDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn11}" id="tableColumn11" width="52">
                                    <ui:button action="#{NovDiasDispersion.btEditar_action}" binding="#{NovDiasDispersion.btEditar}" id="btEditar"
                                        imageURL="/resources/edit.GIF"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea generar Novedad de actualización para el registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="Editar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{NovDiasDispersion.beliminar_action}" binding="#{NovDiasDispersion.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea generar Novedad de eliminación para el registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn2}" headerText="IDBANCO" id="tableColumn2" sort="IDBANCO">
                                    <ui:staticText binding="#{NovDiasDispersion.stIdbanco}" id="stIdbanco" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn12}" headerText="BANCO" id="tableColumn12" sort="BANCO">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText11}" id="staticText11" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn7}" headerText="DIAS SIMIT EXTERNO" id="tableColumn7" sort="DIAS_DISPERSION_SE">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText7}" id="staticText7" text="#{currentRow.value['DIAS_DISPERSION_SE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn8}" headerText="FRECUENCIA SIMIT EXTERNO" id="tableColumn8" sort="FREC_DISPERSION_SE">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText8}" id="staticText8" text="#{currentRow.value['FREC_DISPERSION_SE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn3}" headerText="DIAS SIMIT LOCAL" id="tableColumn3" sort="DIAS_DISPERSION_SL">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText3}" id="staticText3" text="#{currentRow.value['DIAS_DISPERSION_SL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn4}" headerText="FRECUENCIA SIMIT LOCAL" id="tableColumn4" sort="FREC_DISPERSION_SL">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText4}" id="staticText4" text="#{currentRow.value['FREC_DISPERSION_SL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn9}" headerText="DIAS POLCA EXTERNO" id="tableColumn9" sort="DIAS_DISPERSION_PE">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText9}" id="staticText9" text="#{currentRow.value['DIAS_DISPERSION_PE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn10}" headerText="FRECUENCIA POLCA EXTERNO" id="tableColumn10" sort="FREC_DISPERSION_PE">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText10}" id="staticText10" text="#{currentRow.value['FREC_DISPERSION_PE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn5}" headerText="DIAS POLCAL OCAL" id="tableColumn5" sort="DIAS_DISPERSION_PL">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText5}" id="staticText5" text="#{currentRow.value['DIAS_DISPERSION_PL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovDiasDispersion.tableColumn6}" headerText="FRECUENCIA POLCA LOCAL" id="tableColumn6" sort="FREC_DISPERSION_PL">
                                    <ui:staticText binding="#{NovDiasDispersion.staticText6}" id="staticText6" text="#{currentRow.value['FREC_DISPERSION_PL']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{NovDiasDispersion.ddBanco}" id="ddBanco"
                            items="#{NovDiasDispersion.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 408px; top: 192px; position: absolute; width: 264px" tabIndex="2"/>
                        <ui:label binding="#{NovDiasDispersion.lbBanco}" id="lbBanco" style="left: 312px; top: 192px; position: absolute" text="Banco"/>
                        <ui:label binding="#{NovDiasDispersion.label2}" id="label2" style="left: 312px; top: 264px; position: absolute" text="Dias Simit Externo"/>
                        <ui:label binding="#{NovDiasDispersion.label3}" id="label3" style="left: 312px; top: 288px; position: absolute" text="Frecuencia Simit Externo"/>
                        <ui:textField binding="#{NovDiasDispersion.tfDiasSimitExt}" id="tfDiasSimitExt" maxLength="2"
                            style="left: 480px; top: 264px; position: absolute; width: 72px" tabIndex="3"/>
                        <ui:dropDown binding="#{NovDiasDispersion.ddFrecuenciaSimExt}" id="ddFrecuenciaSimExt"
                            items="#{NovDiasDispersion.ddFrecuenciaSimExtDefaultOptions.options}"
                            style="left: 480px; top: 288px; position: absolute; width: 192px" tabIndex="5"/>
                        <ui:label binding="#{NovDiasDispersion.label5}" id="label5" style="left: 312px; top: 336px; position: absolute" text="Dias Simit Local"/>
                        <ui:label binding="#{NovDiasDispersion.label6}" id="label6" style="left: 312px; top: 360px; position: absolute" text="Frecuencia Simit Local"/>
                        <ui:textField binding="#{NovDiasDispersion.tfDiasSimitLoc}" id="tfDiasSimitLoc" maxLength="2"
                            style="left: 480px; top: 336px; position: absolute; width: 72px" tabIndex="7"/>
                        <ui:dropDown binding="#{NovDiasDispersion.ddFrecuenciaSimLoc}" id="ddFrecuenciaSimLoc"
                            items="#{NovDiasDispersion.ddFrecuenciaSimLocDefaultOptions.options}"
                            style="left: 480px; top: 360px; position: absolute; width: 192px" tabIndex="9"/>
                        <ui:label binding="#{NovDiasDispersion.label7}" id="label7" style="left: 720px; top: 288px; position: absolute; width: 166px" text="Frecuencia Polca Externo"/>
                        <ui:label binding="#{NovDiasDispersion.label8}" id="label8" style="left: 720px; top: 264px; position: absolute; width: 120px" text="Dias Polca Externo"/>
                        <ui:textField binding="#{NovDiasDispersion.tfDiasPolcaExt}" id="tfDiasPolcaExt" maxLength="2"
                            style="left: 888px; top: 264px; position: absolute; width: 72px" tabIndex="4"/>
                        <ui:dropDown binding="#{NovDiasDispersion.ddFrecuenciaPolExt}" id="ddFrecuenciaPolExt"
                            items="#{NovDiasDispersion.ddFrecuenciaPolExtDefaultOptions.options}"
                            style="left: 888px; top: 288px; position: absolute; width: 216px" tabIndex="6"/>
                        <ui:label binding="#{NovDiasDispersion.label9}" id="label9" style="left: 720px; top: 360px; position: absolute; width: 166px" text="Frecuencia Polca Local"/>
                        <ui:label binding="#{NovDiasDispersion.label10}" id="label10" style="left: 720px; top: 336px; position: absolute; width: 120px" text="Dias Polca Local"/>
                        <ui:textField binding="#{NovDiasDispersion.tfDiasPolcaLoc}" id="tfDiasPolcaLoc" maxLength="2"
                            style="left: 888px; top: 336px; position: absolute; width: 72px" tabIndex="8"/>
                        <ui:dropDown binding="#{NovDiasDispersion.ddFrecuenciaPolLoc}" id="ddFrecuenciaPolLoc"
                            items="#{NovDiasDispersion.ddFrecuenciaPolLocDefaultOptions.options}"
                            style="left: 888px; top: 360px; position: absolute; width: 216px" tabIndex="10"/>
                        <ui:button action="#{NovDiasDispersion.btActualizar_action}" binding="#{NovDiasDispersion.btActualizar}" id="btActualizar"
                            onClick="btActualizar_action()" style="left: 935px; top: 456px; position: absolute; width: 95px" tabIndex="14" text="Adicionar"/>
                        <ui:dropDown binding="#{NovDiasDispersion.ddMunicipio}" id="ddMunicipio"
                            items="#{NovDiasDispersion.vw_municipio_novDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 216px; position: absolute; width: 264px"
                            tabIndex="1" valueChangeListener="#{NovDiasDispersion.ddMunicipio_processValueChange}"/>
                        <ui:calendar binding="#{NovDiasDispersion.clActivacion}" dateFormatPattern="yyyy-MM-dd" id="clActivacion"
                            style="left: 480px; top: 408px; position: absolute" tabIndex="13"/>
                        <ui:label binding="#{NovDiasDispersion.label12}" id="label12" style="left: 312px; top: 408px; position: absolute; width: 118px" text="Fecha Activacion"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
