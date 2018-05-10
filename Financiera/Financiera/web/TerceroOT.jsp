<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{TerceroOT.page1}" id="page1">
            <ui:html binding="#{TerceroOT.html1}" id="html1">
                <ui:head binding="#{TerceroOT.head1}" id="head1">
                    <ui:link binding="#{TerceroOT.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{TerceroOT.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{TerceroOT.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{TerceroOT.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definicion Terceros"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{TerceroOT.ddMunicipio}" id="ddMunicipio"
                            items="#{TerceroOT.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 168px; position: absolute; width: 288px"
                            tabIndex="1" valueChangeListener="#{TerceroOT.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{TerceroOT.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{TerceroOT.label2}" id="label2" style="left: 264px; top: 192px; position: absolute" text="NIT Tercero"/>
                        <ui:textField binding="#{TerceroOT.tfNitTercero}" id="tfNitTercero" maxLength="10"
                            style="left: 408px; top: 192px; position: absolute; width: 192px" tabIndex="3"/>
                        <ui:label binding="#{TerceroOT.label3}" id="label3" style="left: 264px; top: 216px; position: absolute" text="Nombre"/>
                        <ui:textField binding="#{TerceroOT.tfNombre}" id="tfNombre" maxLength="50"
                            style="left: 408px; top: 216px; position: absolute; width: 192px" tabIndex="4"/>
                        <ui:label binding="#{TerceroOT.label4}" id="label4" style="left: 264px; top: 432px; position: absolute" text="Cuenta Transferencia"/>
                        <ui:label binding="#{TerceroOT.label6}" id="label6" style="left: 408px; top: 408px; position: absolute" text="Banco"/>
                        <ui:label binding="#{TerceroOT.label7}" id="label7" style="left: 576px; top: 408px; position: absolute" text="Tipo"/>
                        <ui:dropDown binding="#{TerceroOT.ddBanco}" id="ddBanco" items="#{TerceroOT.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 408px; top: 432px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{TerceroOT.ddTipo}" id="ddTipo" items="#{TerceroOT.ddTipoDefaultOptions.options}"
                            style="left: 576px; top: 432px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:label binding="#{TerceroOT.label8}" id="label8" style="left: 720px; top: 408px; position: absolute" text="Cuenta"/>
                        <ui:textField binding="#{TerceroOT.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 720px; top: 432px; position: absolute; width: 120px" tabIndex="8"/>
                        <ui:dropDown binding="#{TerceroOT.ddIndBase}" id="ddIndBase" items="#{TerceroOT.ddIndBaseDefaultOptions.options}"
                            style="left: 408px; top: 336px; position: absolute" tabIndex="11"/>
                        <ui:label binding="#{TerceroOT.label11}" id="label11" style="left: 264px; top: 336px; position: absolute" text="Base liquidación"/>
                        <ui:button action="#{TerceroOT.btActualizar_action}" binding="#{TerceroOT.btActualizar}" id="btActualizar"
                            onClick="btActualizar_action()" style="left: 575px; top: 480px; position: absolute; width: 120px" tabIndex="12" text="Adicionar"/>
                        <ui:textField binding="#{TerceroOT.tfcorreoTercero}" id="tfcorreoTercero"
                            style="left: 408px; top: 240px; position: absolute; width: 192px" tabIndex="5"/>
                        <ui:label binding="#{TerceroOT.label12}" id="label12" style="left: 264px; top: 240px; position: absolute" text="Correo Electrónico"/>
                        <ui:label binding="#{TerceroOT.label5}" id="label5" style="left: 264px; top: 288px; position: absolute" text="Jurisdicción"/>
                        <ui:dropDown binding="#{TerceroOT.ddJurisdiccion}" id="ddJurisdiccion" items="#{TerceroOT.ddJurisdiccionDefaultOptions.options}" style="left: 408px; top: 288px; position: absolute; width: 120px"/>
                        <ui:label binding="#{TerceroOT.label9}" id="label9" style="left: 264px; top: 312px; position: absolute" text="Medio imposición"/>
                        <ui:label binding="#{TerceroOT.label10}" id="label10" style="left: 264px; top: 360px; position: absolute" text="Metodo base"/>
                        <ui:dropDown binding="#{TerceroOT.ddMetodo}" id="ddMetodo" items="#{TerceroOT.ddMetodoDefaultOptions.options}" style="left: 408px; top: 360px; position: absolute; width: 120px"/>
                        <ui:label binding="#{TerceroOT.label13}" id="label13" style="left: 264px; top: 384px; position: absolute" text="Valor base"/>
                        <ui:textField binding="#{TerceroOT.tfValorBase}" id="tfValorBase" maxLength="6" style="left: 408px; top: 384px; position: absolute; width: 120px"/>
                        <ui:button action="#{TerceroOT.btCancelar_action}" binding="#{TerceroOT.btCancelar}" id="btCancelar" onClick="btActualizar_action()"
                            style="left: 719px; top: 480px; position: absolute; width: 95px" tabIndex="12" text="Cancelar"/>
                        <ui:dropDown binding="#{TerceroOT.ddMedio}" id="ddMedio" items="#{TerceroOT.ddMedioDefaultOptions.options}" style="left: 408px; top: 312px; position: absolute"/>
                        <ui:table augmentTitle="false" binding="#{TerceroOT.table1}" id="table1" style="position: absolute; left: 288px; top: 552px"
                            title="TERCERO" width="1416">
                            <ui:tableRowGroup binding="#{TerceroOT.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{TerceroOT.vw_tercero_otDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{TerceroOT.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{TerceroOT.beditar_action}" binding="#{TerceroOT.beditar}" id="beditar" imageURL="/resources/edit.GIF" text="Editar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn2}" id="tableColumn2">
                                    <ui:button action="#{TerceroOT.bborrar_action}" binding="#{TerceroOT.bborrar}" id="bborrar" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="Borrar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn3}" headerText="NIT_T" id="tableColumn3" sort="NIT_T">
                                    <ui:staticText binding="#{TerceroOT.stNitt}" id="stNitt" text="#{currentRow.value['NIT_T']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn4}" headerText="NOMBRE" id="tableColumn4" sort="NOMBRE">
                                    <ui:staticText binding="#{TerceroOT.stnombre}" id="stnombre" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn5}" headerText="CORREO" id="tableColumn5" sort="CORREO">
                                    <ui:staticText binding="#{TerceroOT.stcorreo}" id="stcorreo" text="#{currentRow.value['CORREO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn10}" headerText="JURISDICCION" id="tableColumn10" sort="JURISDICCION">
                                    <ui:staticText binding="#{TerceroOT.stjurisdiccion}" id="stjurisdiccion" text="#{currentRow.value['JURISDICCION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn11}" headerText="MEDIOIMPOSICION" id="tableColumn11" sort="MEDIOIMPOSICION">
                                    <ui:staticText binding="#{TerceroOT.stmedioimposicion}" id="stmedioimposicion" text="#{currentRow.value['MEDIOIMPOSICION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn12}" headerText="BASELIQUIDACION" id="tableColumn12" sort="BASELIQUIDACION">
                                    <ui:staticText binding="#{TerceroOT.stbaseliquidacion}" id="stbaseliquidacion" text="#{currentRow.value['BASELIQUIDACION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn13}" headerText="METODOBASE" id="tableColumn13" sort="METODOBASE">
                                    <ui:staticText binding="#{TerceroOT.stmetodobase}" id="stmetodobase" text="#{currentRow.value['METODOBASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn14}" headerText="VALORBASE" id="tableColumn14" sort="VALORBASE">
                                    <ui:staticText binding="#{TerceroOT.stvalorbase}" id="stvalorbase" text="#{currentRow.value['VALORBASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn7}" headerText="NOMBANCO" id="tableColumn7" sort="NOMBANCO">
                                    <ui:staticText binding="#{TerceroOT.stNombanco}" id="stNombanco" text="#{currentRow.value['NOMBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn8}" headerText="TIPOCUENTA" id="tableColumn8" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{TerceroOT.sttipocuenta}" id="sttipocuenta" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn9}" headerText="CUENTA" id="tableColumn9" sort="CUENTA">
                                    <ui:staticText binding="#{TerceroOT.stcuenta}" id="stcuenta" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{TerceroOT.tableColumn15}" headerText="NUMTERCERO" id="tableColumn15" sort="NUMTERCERO">
                                    <ui:staticText binding="#{TerceroOT.stnumtercero}" id="stnumtercero" text="#{currentRow.value['NUMTERCERO']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{TerceroOT.tfnumTercero}" id="tfnumTercero" style="left: 696px; top: 240px; position: absolute; width: 192px"
                            tabIndex="5" visible="false"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
