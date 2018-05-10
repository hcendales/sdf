<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Terceros.page1}" id="page1">
            <ui:html binding="#{Terceros.html1}" id="html1">
                <ui:head binding="#{Terceros.head1}" id="head1">
                    <ui:link binding="#{Terceros.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Terceros.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Terceros.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Terceros.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definicion Terceros"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{Terceros.ddMunicipio}" id="ddMunicipio" items="#{Terceros.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 168px; position: absolute; width: 288px"
                            tabIndex="1" valueChangeListener="#{Terceros.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{Terceros.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{Terceros.table1}" id="table1"
                            style="left: 264px; top: 456px; position: absolute; width: 409px" title="Terceros" width="409">
                            <ui:tableRowGroup binding="#{Terceros.tableRowGroup1}" emptyDataMsg="No hay terceros registrados para este municipio"
                                id="tableRowGroup1" rows="10" sourceData="#{Terceros.terceroDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Terceros.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{Terceros.btEditar_action}" binding="#{Terceros.btEditar}" id="btEditar" imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn4}" id="tableColumn4">
                                    <ui:button action="#{Terceros.button1_action}" binding="#{Terceros.button1}" id="button1" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn11}" headerText="NUM TERCERO" id="tableColumn11" sort="NUM_TERCERO">
                                    <ui:staticText binding="#{Terceros.stNumTer}" id="stNumTer" text="#{currentRow.value['NUM_TERCERO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn2}" headerText="NIT" id="tableColumn2" sort="NIT_T">
                                    <ui:staticText binding="#{Terceros.stNitTer}" id="stNitTer" text="#{currentRow.value['NIT_T']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn3}" headerText="NOMBRE" id="tableColumn3" sort="NOMBRE">
                                    <ui:staticText binding="#{Terceros.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn5}" headerText="IDMUNICIPIO" id="tableColumn5" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{Terceros.staticText1}" id="staticText1" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn6}" headerText="IDBANCO" id="tableColumn6" sort="IDBANCO">
                                    <ui:staticText binding="#{Terceros.staticText2}" id="staticText2" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn7}" headerText="TIPOCUENTA" id="tableColumn7" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{Terceros.staticText4}" id="staticText4" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn8}" headerText="CUENTA" id="tableColumn8" sort="CUENTA">
                                    <ui:staticText binding="#{Terceros.staticText5}" id="staticText5" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn9}" headerText="BASE SIMIT" id="tableColumn9" sort="BASE_S" width="89">
                                    <ui:staticText binding="#{Terceros.staticText6}" id="staticText6" text="#{currentRow.value['BASE_S']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn10}" headerText="BASE POLCA" id="tableColumn10" sort="BASE_P">
                                    <ui:staticText binding="#{Terceros.staticText7}" id="staticText7" text="#{currentRow.value['BASE_P']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn12}" headerText="IND BASE" id="tableColumn12" sort="IND_BASE">
                                    <ui:staticText binding="#{Terceros.staticText8}" id="staticText8" text="#{currentRow.value['IND_BASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Terceros.tableColumn13}" headerText="BANCO" id="tableColumn13" sort="BANCO">
                                    <ui:staticText binding="#{Terceros.staticText9}" id="staticText9" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{Terceros.label2}" id="label2" style="left: 264px; top: 216px; position: absolute" text="NIT Tercero"/>
                        <ui:textField binding="#{Terceros.tfNitTercero}" id="tfNitTercero" maxLength="10"
                            style="left: 408px; top: 216px; position: absolute; width: 192px" tabIndex="3"/>
                        <ui:label binding="#{Terceros.label3}" id="label3" style="left: 264px; top: 240px; position: absolute" text="Nombre"/>
                        <ui:textField binding="#{Terceros.tfNombre}" id="tfNombre" maxLength="50"
                            style="left: 408px; top: 240px; position: absolute; width: 192px" tabIndex="4"/>
                        <ui:label binding="#{Terceros.label4}" id="label4" style="left: 264px; top: 336px; position: absolute" text="Cuenta Transferencia"/>
                        <ui:label binding="#{Terceros.label6}" id="label6" style="left: 408px; top: 312px; position: absolute" text="Banco"/>
                        <ui:label binding="#{Terceros.label7}" id="label7" style="left: 576px; top: 312px; position: absolute" text="Tipo"/>
                        <ui:dropDown binding="#{Terceros.ddBanco}" id="ddBanco" items="#{Terceros.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 408px; top: 336px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{Terceros.ddTipo}" id="ddTipo" items="#{Terceros.ddTipoDefaultOptions.options}"
                            style="left: 576px; top: 336px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:label binding="#{Terceros.label8}" id="label8" style="left: 720px; top: 312px; position: absolute" text="Cuenta"/>
                        <ui:textField binding="#{Terceros.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 720px; top: 336px; position: absolute; width: 120px" tabIndex="8"/>
                        <ui:label binding="#{Terceros.label9}" id="label9" style="left: 264px; top: 360px; position: absolute" text="% Base SIMIT"/>
                        <ui:label binding="#{Terceros.label10}" id="label10" style="left: 264px; top: 384px; position: absolute" text="% Base  POLCA"/>
                        <ui:textField binding="#{Terceros.tfBaseSimit}" id="tfBaseSimit" maxLength="6"
                            style="left: 408px; top: 360px; position: absolute; width: 72px" tabIndex="9"/>
                        <ui:textField binding="#{Terceros.tfBasePolca}" id="tfBasePolca" maxLength="6"
                            style="left: 408px; top: 384px; position: absolute; width: 72px" tabIndex="10"/>
                        <ui:dropDown binding="#{Terceros.ddIndBase}" id="ddIndBase" items="#{Terceros.ddIndBaseDefaultOptions.options}"
                            style="left: 408px; top: 408px; position: absolute" tabIndex="11"/>
                        <ui:label binding="#{Terceros.label11}" id="label11" style="left: 264px; top: 408px; position: absolute" text="Indicador Base"/>
                        <ui:button action="#{Terceros.btActualizar_action}" binding="#{Terceros.btActualizar}" id="btActualizar" onClick="btActualizar_action()"
                            style="left: 743px; top: 408px; position: absolute; width: 95px" tabIndex="12" text="Adicionar"/>
                        <ui:label binding="#{Terceros.label5}" id="label5" style="left: 264px; top: 192px; position: absolute" text="Número Tercero"/>
                        <ui:dropDown binding="#{Terceros.ddNumero}" id="ddNumero" items="#{Terceros.ddNumeroDefaultOptions.options}"
                            style="left: 408px; top: 192px; position: absolute; width: 198px" tabIndex="2"/>
                        <ui:textField binding="#{Terceros.tfcorreoTercero}" id="tfcorreoTercero"
                            style="left: 408px; top: 264px; position: absolute; width: 192px" tabIndex="5"/>
                        <ui:label binding="#{Terceros.label12}" id="label12" style="left: 264px; top: 264px; position: absolute" text="Correo Electrónico"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
