<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{NovTerceros.page1}" id="page1">
            <ui:html binding="#{NovTerceros.html1}" id="html1">
                <ui:head binding="#{NovTerceros.head1}" id="head1">
                    <ui:link binding="#{NovTerceros.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{NovTerceros.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{NovTerceros.form1}" id="form1">
                        <div style="height: 120px; left: 432px; top: 312px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{NovTerceros.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definicion Novedad Terceros"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{NovTerceros.ddMunicipio}" id="ddMunicipio"
                            items="#{NovTerceros.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 168px; position: absolute; width: 288px"
                            tabIndex="1" valueChangeListener="#{NovTerceros.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{NovTerceros.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{NovTerceros.table1}" id="table1"
                            style="left: 264px; top: 648px; position: absolute; width: 409px" title="Terceros" width="409">
                            <ui:tableRowGroup binding="#{NovTerceros.tableRowGroup1}" emptyDataMsg="No hay terceros registrados para este municipio"
                                id="tableRowGroup1" rows="10" sourceData="#{NovTerceros.terceroDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{NovTerceros.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{NovTerceros.btEditar_action}" binding="#{NovTerceros.btEditar}" id="btEditar"
                                        imageURL="/resources/edit.GIF"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea generar Novedad de actualización para el registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn4}" id="tableColumn4">
                                    <ui:button action="#{NovTerceros.button1_action}" binding="#{NovTerceros.button1}" id="button1" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea generar Novedad de eliminación para el registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn11}" headerText="NUM TERCERO" id="tableColumn11" sort="NUM_TERCERO">
                                    <ui:staticText binding="#{NovTerceros.stNumTer}" id="stNumTer" text="#{currentRow.value['NUM_TERCERO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn2}" headerText="NIT" id="tableColumn2" sort="NIT_T">
                                    <ui:staticText binding="#{NovTerceros.stNitTer}" id="stNitTer" text="#{currentRow.value['NIT_T']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn3}" headerText="NOMBRE" id="tableColumn3" sort="NOMBRE">
                                    <ui:staticText binding="#{NovTerceros.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn5}" headerText="IDMUNICIPIO" id="tableColumn5" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{NovTerceros.staticText1}" id="staticText1" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn6}" headerText="IDBANCO" id="tableColumn6" sort="IDBANCO">
                                    <ui:staticText binding="#{NovTerceros.staticText2}" id="staticText2" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn7}" headerText="TIPOCUENTA" id="tableColumn7" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{NovTerceros.staticText4}" id="staticText4" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn8}" headerText="CUENTA" id="tableColumn8" sort="CUENTA">
                                    <ui:staticText binding="#{NovTerceros.staticText5}" id="staticText5" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn9}" headerText="BASE SIMIT" id="tableColumn9" sort="BASE_S" width="89">
                                    <ui:staticText binding="#{NovTerceros.staticText6}" id="staticText6" text="#{currentRow.value['BASE_S']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn10}" headerText="BASE POLCA" id="tableColumn10" sort="BASE_P">
                                    <ui:staticText binding="#{NovTerceros.staticText7}" id="staticText7" text="#{currentRow.value['BASE_P']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn12}" headerText="IND BASE" id="tableColumn12" sort="IND_BASE">
                                    <ui:staticText binding="#{NovTerceros.staticText8}" id="staticText8" text="#{currentRow.value['IND_BASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceros.tableColumn13}" headerText="BANCO" id="tableColumn13" sort="BANCO">
                                    <ui:staticText binding="#{NovTerceros.staticText9}" id="staticText9" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{NovTerceros.label2}" id="label2" style="left: 264px; top: 216px; position: absolute" text="NIT Tercero"/>
                        <ui:textField binding="#{NovTerceros.tfNitTercero}" id="tfNitTercero" maxLength="10"
                            style="left: 408px; top: 216px; position: absolute; width: 192px" tabIndex="3"/>
                        <ui:label binding="#{NovTerceros.label3}" id="label3" style="left: 264px; top: 240px; position: absolute" text="Nombre"/>
                        <ui:textField binding="#{NovTerceros.tfNombre}" id="tfNombre" maxLength="50"
                            style="left: 408px; top: 240px; position: absolute; width: 192px" tabIndex="4"/>
                        <ui:label binding="#{NovTerceros.label4}" id="label4" style="left: 264px; top: 336px; position: absolute" text="Cuenta Transferencia"/>
                        <ui:label binding="#{NovTerceros.label6}" id="label6" style="left: 408px; top: 312px; position: absolute" text="Banco"/>
                        <ui:label binding="#{NovTerceros.label7}" id="label7" style="left: 576px; top: 312px; position: absolute" text="Tipo"/>
                        <ui:dropDown binding="#{NovTerceros.ddBanco}" id="ddBanco" items="#{NovTerceros.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 408px; top: 336px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{NovTerceros.ddTipo}" id="ddTipo" items="#{NovTerceros.ddTipoDefaultOptions.options}"
                            style="left: 576px; top: 336px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:label binding="#{NovTerceros.label8}" id="label8" style="left: 720px; top: 312px; position: absolute" text="Cuenta"/>
                        <ui:textField binding="#{NovTerceros.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 720px; top: 336px; position: absolute; width: 120px" tabIndex="8"/>
                        <ui:label binding="#{NovTerceros.label9}" id="label9" style="left: 264px; top: 360px; position: absolute" text="% Base SIMIT"/>
                        <ui:label binding="#{NovTerceros.label10}" id="label10" style="left: 264px; top: 384px; position: absolute" text="% Base  POLCA"/>
                        <ui:textField binding="#{NovTerceros.tfBaseSimit}" id="tfBaseSimit" maxLength="6"
                            style="left: 408px; top: 360px; position: absolute; width: 72px" tabIndex="9"/>
                        <ui:textField binding="#{NovTerceros.tfBasePolca}" id="tfBasePolca" maxLength="6"
                            style="left: 408px; top: 384px; position: absolute; width: 72px" tabIndex="10"/>
                        <ui:dropDown binding="#{NovTerceros.ddIndBase}" id="ddIndBase" items="#{NovTerceros.ddIndBaseDefaultOptions.options}"
                            style="left: 408px; top: 408px; position: absolute" tabIndex="11"/>
                        <ui:label binding="#{NovTerceros.label11}" id="label11" style="left: 264px; top: 408px; position: absolute" text="Indicador Base"/>
                        <ui:button action="#{NovTerceros.btActualizar_action}" binding="#{NovTerceros.btActualizar}" id="btActualizar"
                            onClick="btActualizar_action()" style="left: 743px; top: 456px; position: absolute; width: 95px" tabIndex="15" text="Adicionar"/>
                        <ui:label binding="#{NovTerceros.label5}" id="label5" style="left: 264px; top: 192px; position: absolute" text="Número Tercero"/>
                        <ui:dropDown binding="#{NovTerceros.ddNumero}" id="ddNumero" items="#{NovTerceros.ddNumeroDefaultOptions.options}"
                            style="left: 408px; top: 192px; position: absolute; width: 198px" tabIndex="2"/>
                        <ui:textField binding="#{NovTerceros.tfcorreoTercero}" id="tfcorreoTercero"
                            style="left: 408px; top: 264px; position: absolute; width: 192px" tabIndex="5"/>
                        <ui:label binding="#{NovTerceros.label12}" id="label12" style="left: 264px; top: 264px; position: absolute" text="Correo Electrónico"/>
                        <ui:label binding="#{NovTerceros.label13}" id="label13" style="left: 264px; top: 479px; position: absolute; width: 94px" text="Firma 1"/>
                        <ui:dropDown binding="#{NovTerceros.ddFirma1}" id="ddFirma1" items="#{NovTerceros.ddFirma1DefaultOptions.options}"
                            style="left: 408px; top: 479px; position: absolute; width: 240px" tabIndex="12"/>
                        <ui:label binding="#{NovTerceros.label14}" id="label14" style="left: 264px; top: 503px; position: absolute; width: 94px" text="Firma 2"/>
                        <ui:dropDown binding="#{NovTerceros.ddFirma2}" id="ddFirma2" items="#{NovTerceros.ddFirma2DefaultOptions.options}"
                            style="left: 408px; top: 503px; position: absolute; width: 240px" tabIndex="13"/>
                        <ui:calendar binding="#{NovTerceros.clActivacion}" dateFormatPattern="yyyy-MM-dd" id="clActivacion"
                            style="left: 408px; top: 527px; position: absolute" tabIndex="14"/>
                        <ui:label binding="#{NovTerceros.label15}" id="label15" style="left: 264px; top: 527px; position: absolute; width: 118px" text="Fecha Activacion"/>
                        <ui:textField binding="#{NovTerceros.tfDnsAvvillas}" id="tfDnsAvvillas" maxLength="16"
                            style="left: 408px; top: 576px; position: absolute; width: 138px" tabIndex="27"/>
                        <ui:label binding="#{NovTerceros.label16}" id="label16" style="left: 264px; top: 600px; position: absolute; width: 113px" text="DNS Davivienda"/>
                        <ui:textField binding="#{NovTerceros.tfDnsDavivienda}" id="tfDnsDavivienda" maxLength="16"
                            style="left: 408px; top: 600px; position: absolute; width: 138px" tabIndex="28"/>
                        <ui:label binding="#{NovTerceros.label17}" id="label17" style="left: 264px; top: 576px; position: absolute; width: 113px" text="DNS Avvillas"/>
                        <ui:textField binding="#{NovTerceros.ddBancoAct1}" id="ddBancoAct1" maxLength="16"
                            style="left: 888px; top: 360px; position: absolute; width: 138px" tabIndex="14" visible="false"/>
                        <ui:textField binding="#{NovTerceros.ddTipoAct1}" id="ddTipoAct1" maxLength="16"
                            style="left: 888px; top: 384px; position: absolute; width: 138px" tabIndex="14" visible="false"/>
                        <ui:textField binding="#{NovTerceros.tfCuentaAct1}" id="tfCuentaAct1" maxLength="16"
                            style="left: 888px; top: 408px; position: absolute; width: 138px" tabIndex="14" visible="false"/>
                        <ui:textField binding="#{NovTerceros.tfNitCta1}" id="tfNitCta1" maxLength="10"
                            style="left: 888px; top: 432px; position: absolute; width: 138px" tabIndex="15" visible="false"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
