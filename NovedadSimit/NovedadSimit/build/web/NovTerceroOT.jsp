<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{NovTerceroOT.page1}" id="page1">
            <ui:html binding="#{NovTerceroOT.html1}" id="html1">
                <ui:head binding="#{NovTerceroOT.head1}" id="head1">
                    <ui:link binding="#{NovTerceroOT.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{NovTerceroOT.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{NovTerceroOT.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{NovTerceroOT.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definicion Terceros"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{NovTerceroOT.ddMunicipio}" id="ddMunicipio"
                            items="#{NovTerceroOT.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 168px; position: absolute; width: 288px"
                            tabIndex="1" valueChangeListener="#{NovTerceroOT.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{NovTerceroOT.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{NovTerceroOT.label2}" id="label2" style="left: 264px; top: 192px; position: absolute" text="NIT Tercero"/>
                        <ui:textField binding="#{NovTerceroOT.tfNitTercero}" id="tfNitTercero" maxLength="10"
                            style="left: 408px; top: 192px; position: absolute; width: 192px" tabIndex="3"/>
                        <ui:label binding="#{NovTerceroOT.label3}" id="label3" style="left: 264px; top: 216px; position: absolute" text="Nombre"/>
                        <ui:textField binding="#{NovTerceroOT.tfNombre}" id="tfNombre" maxLength="50"
                            style="left: 408px; top: 216px; position: absolute; width: 192px" tabIndex="4"/>
                        <ui:label binding="#{NovTerceroOT.label4}" id="label4" style="left: 264px; top: 432px; position: absolute" text="Cuenta Transferencia"/>
                        <ui:label binding="#{NovTerceroOT.label6}" id="label6" style="left: 408px; top: 408px; position: absolute" text="Banco"/>
                        <ui:label binding="#{NovTerceroOT.label7}" id="label7" style="left: 576px; top: 408px; position: absolute" text="Tipo"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddBanco}" id="ddBanco" items="#{NovTerceroOT.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 408px; top: 432px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddTipo}" id="ddTipo" items="#{NovTerceroOT.ddTipoDefaultOptions.options}"
                            style="left: 576px; top: 432px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:label binding="#{NovTerceroOT.label8}" id="label8" style="left: 720px; top: 408px; position: absolute" text="Cuenta"/>
                        <ui:textField binding="#{NovTerceroOT.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 720px; top: 432px; position: absolute; width: 120px" tabIndex="8"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddIndBase}" id="ddIndBase" items="#{NovTerceroOT.ddIndBaseDefaultOptions.options}"
                            style="left: 408px; top: 336px; position: absolute" tabIndex="11"/>
                        <ui:label binding="#{NovTerceroOT.label11}" id="label11" style="left: 264px; top: 336px; position: absolute" text="Base liquidación"/>
                        <ui:button action="#{NovTerceroOT.btActualizar_action}" binding="#{NovTerceroOT.btActualizar}" id="btActualizar"
                            onClick="btActualizar_action()" style="left: 527px; top: 648px; position: absolute; width: 120px" tabIndex="12" text="Adicionar"/>
                        <ui:textField binding="#{NovTerceroOT.tfcorreoTercero}" id="tfcorreoTercero"
                            style="left: 408px; top: 240px; position: absolute; width: 192px" tabIndex="5"/>
                        <ui:label binding="#{NovTerceroOT.label12}" id="label12" style="left: 264px; top: 240px; position: absolute" text="Correo Electrónico"/>
                        <ui:label binding="#{NovTerceroOT.label5}" id="label5" style="left: 264px; top: 288px; position: absolute" text="Jurisdicción"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddJurisdiccion}" id="ddJurisdiccion" items="#{NovTerceroOT.ddJurisdiccionDefaultOptions.options}" style="left: 408px; top: 288px; position: absolute; width: 120px"/>
                        <ui:label binding="#{NovTerceroOT.label9}" id="label9" style="left: 264px; top: 312px; position: absolute" text="Medio imposición"/>
                        <ui:label binding="#{NovTerceroOT.label10}" id="label10" style="left: 264px; top: 360px; position: absolute" text="Metodo base"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddMetodo}" id="ddMetodo" items="#{NovTerceroOT.ddMetodoDefaultOptions.options}" style="left: 408px; top: 360px; position: absolute; width: 120px"/>
                        <ui:label binding="#{NovTerceroOT.label13}" id="label13" style="left: 264px; top: 384px; position: absolute" text="Valor base"/>
                        <ui:textField binding="#{NovTerceroOT.tfValorBase}" id="tfValorBase" maxLength="6" style="left: 408px; top: 384px; position: absolute; width: 120px"/>
                        <ui:button action="#{NovTerceroOT.btCancelar_action}" binding="#{NovTerceroOT.btCancelar}" id="btCancelar"
                            onClick="btActualizar_action()" style="left: 671px; top: 648px; position: absolute; width: 95px" tabIndex="12" text="Cancelar"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddMedio}" id="ddMedio" items="#{NovTerceroOT.ddMedioDefaultOptions.options}" style="left: 408px; top: 312px; position: absolute"/>
                        <ui:table augmentTitle="false" binding="#{NovTerceroOT.table1}" id="table1"
                            style="left: 264px; top: 696px; position: absolute; width: 1416px" title="TERCERO" width="1416">
                            <ui:tableRowGroup binding="#{NovTerceroOT.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{NovTerceroOT.vw_tercero_otDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{NovTerceroOT.beditar_action}" binding="#{NovTerceroOT.beditar}" id="beditar"
                                        imageURL="/resources/edit.GIF" text="Editar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn2}" id="tableColumn2">
                                    <ui:button action="#{NovTerceroOT.bborrar_action}" binding="#{NovTerceroOT.bborrar}" id="bborrar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="Borrar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn3}" headerText="NIT_T" id="tableColumn3" sort="NIT_T">
                                    <ui:staticText binding="#{NovTerceroOT.stNitt}" id="stNitt" text="#{currentRow.value['NIT_T']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn4}" headerText="NOMBRE" id="tableColumn4" sort="NOMBRE">
                                    <ui:staticText binding="#{NovTerceroOT.stnombre}" id="stnombre" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn5}" headerText="CORREO" id="tableColumn5" sort="CORREO">
                                    <ui:staticText binding="#{NovTerceroOT.stcorreo}" id="stcorreo" text="#{currentRow.value['CORREO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn10}" headerText="JURISDICCION" id="tableColumn10" sort="JURISDICCION">
                                    <ui:staticText binding="#{NovTerceroOT.stjurisdiccion}" id="stjurisdiccion" text="#{currentRow.value['JURISDICCION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn11}" headerText="MEDIOIMPOSICION" id="tableColumn11" sort="MEDIOIMPOSICION">
                                    <ui:staticText binding="#{NovTerceroOT.stmedioimposicion}" id="stmedioimposicion" text="#{currentRow.value['MEDIOIMPOSICION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn12}" headerText="BASELIQUIDACION" id="tableColumn12" sort="BASELIQUIDACION">
                                    <ui:staticText binding="#{NovTerceroOT.stbaseliquidacion}" id="stbaseliquidacion" text="#{currentRow.value['BASELIQUIDACION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn13}" headerText="METODOBASE" id="tableColumn13" sort="METODOBASE">
                                    <ui:staticText binding="#{NovTerceroOT.stmetodobase}" id="stmetodobase" text="#{currentRow.value['METODOBASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn14}" headerText="VALORBASE" id="tableColumn14" sort="VALORBASE">
                                    <ui:staticText binding="#{NovTerceroOT.stvalorbase}" id="stvalorbase" text="#{currentRow.value['VALORBASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn7}" headerText="NOMBANCO" id="tableColumn7" sort="NOMBANCO">
                                    <ui:staticText binding="#{NovTerceroOT.stNombanco}" id="stNombanco" text="#{currentRow.value['NOMBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn8}" headerText="TIPOCUENTA" id="tableColumn8" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{NovTerceroOT.sttipocuenta}" id="sttipocuenta" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn9}" headerText="CUENTA" id="tableColumn9" sort="CUENTA">
                                    <ui:staticText binding="#{NovTerceroOT.stcuenta}" id="stcuenta" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{NovTerceroOT.tableColumn15}" headerText="NUMTERCERO" id="tableColumn15" sort="NUMTERCERO">
                                    <ui:staticText binding="#{NovTerceroOT.stnumtercero}" id="stnumtercero" text="#{currentRow.value['NUMTERCERO']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{NovTerceroOT.tfnumTercero}" id="tfnumTercero" style="left: 696px; top: 240px; position: absolute; width: 192px"
                            tabIndex="5" visible="false"/>
                        <ui:label binding="#{NovTerceroOT.label14}" id="label14" style="left: 264px; top: 576px; position: absolute; width: 113px" text="DNS Avvillas"/>
                        <ui:label binding="#{NovTerceroOT.label15}" id="label15" style="left: 264px; top: 528px; position: absolute; width: 118px" text="Fecha Activacion"/>
                        <ui:label binding="#{NovTerceroOT.label16}" id="label16" style="left: 264px; top: 480px; position: absolute; width: 94px" text="Firma 1"/>
                        <ui:calendar binding="#{NovTerceroOT.clActivacion}" dateFormatPattern="yyyy-MM-dd" id="clActivacion"
                            style="left: 408px; top: 528px; position: absolute" tabIndex="14"/>
                        <ui:textField binding="#{NovTerceroOT.tfDnsDavivienda}" id="tfDnsDavivienda" maxLength="16"
                            style="left: 408px; top: 600px; position: absolute; width: 138px" tabIndex="28"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddFirma1}" id="ddFirma1" items="#{NovTerceroOT.ddFirma1DefaultOptions.options}"
                            style="left: 408px; top: 480px; position: absolute; width: 240px" tabIndex="13"/>
                        <ui:textField binding="#{NovTerceroOT.tfDnsAvvillas}" id="tfDnsAvvillas" maxLength="16"
                            style="left: 408px; top: 576px; position: absolute; width: 138px" tabIndex="27"/>
                        <ui:dropDown binding="#{NovTerceroOT.ddFirma2}" id="ddFirma2" items="#{NovTerceroOT.ddFirma2DefaultOptions.options}"
                            style="left: 408px; top: 504px; position: absolute; width: 240px" tabIndex="12"/>
                        <ui:label binding="#{NovTerceroOT.label17}" id="label17" style="left: 264px; top: 600px; position: absolute; width: 113px" text="DNS Davivienda"/>
                        <ui:label binding="#{NovTerceroOT.label18}" id="label18" style="left: 264px; top: 504px; position: absolute; width: 94px" text="Firma 2"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
