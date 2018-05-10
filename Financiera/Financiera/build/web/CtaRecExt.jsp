<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{CtaRecExt.page1}" id="page1">
            <ui:html binding="#{CtaRecExt.html1}" id="html1">
                <ui:head binding="#{CtaRecExt.head1}" id="head1">
                    <ui:link binding="#{CtaRecExt.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{CtaRecExt.body1}" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{CtaRecExt.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{CtaRecExt.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Cuentas de Recaudo Externo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:table augmentTitle="false" binding="#{CtaRecExt.table1}" id="table1" paginateButton="true" paginationControls="true"
                            selectMultipleButton="true" style="left: 264px; top: 360px; position: absolute; width: 840px" title="Cuentas Recaudo Externo" width="840">
                            <ui:tableRowGroup binding="#{CtaRecExt.tableRowGroup1}" emptyDataMsg="No hay registros o Seleccione Consesionario "
                                id="tableRowGroup1" rows="10" sourceData="#{CtaRecExt.cta_recaudo_concesionarioDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn11}" id="tableColumn11">
                                    <ui:button action="#{CtaRecExt.btEditar_action}" binding="#{CtaRecExt.btEditar}" id="btEditar"
                                        imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{CtaRecExt.beliminar_action}" binding="#{CtaRecExt.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn2}" headerText="BANCO" id="tableColumn2" sort="IDBANCO">
                                    <ui:staticText binding="#{CtaRecExt.stIdBanco}" id="stIdBanco" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn10}" headerText="NOMBRE BANCO" id="tableColumn10" sort="BANCO">
                                    <ui:staticText binding="#{CtaRecExt.staticText10}" id="staticText10" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn3}" headerText="TIPO RECAUDO" id="tableColumn3" sort="INDTIPO">
                                    <ui:staticText binding="#{CtaRecExt.stIndTipo}" id="stIndTipo" text="#{currentRow.value['INDTIPO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn4}" headerText="TIPO CUENTA" id="tableColumn4" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{CtaRecExt.staticText4}" id="staticText4" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn5}" headerText="NUMERO CUENTA" id="tableColumn5" sort="CUENTA">
                                    <ui:staticText binding="#{CtaRecExt.stCuenta}" id="stCuenta" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn6}" headerText="COMISION RECAUDO" id="tableColumn6" sort="COMISION_RECAUDO">
                                    <ui:staticText binding="#{CtaRecExt.staticText6}" id="staticText6" text="#{currentRow.value['COMISION_RECAUDO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn7}" headerText="COMISION ACH" id="tableColumn7" sort="COMISION_ACH">
                                    <ui:staticText binding="#{CtaRecExt.staticText7}" id="staticText7" text="#{currentRow.value['COMISION_ACH']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaRecExt.tableColumn8}" headerText="CUENTA CONTABLE" id="tableColumn8" sort="CTA_CONTABLE">
                                    <ui:staticText binding="#{CtaRecExt.staticText1}" id="staticText1" text="#{currentRow.value['CTA_CONTABLE']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{CtaRecExt.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{CtaRecExt.label2}" id="label2" style="left: 648px; top: 168px; position: absolute" text="Tipo Recaudo"/>
                        <ui:label binding="#{CtaRecExt.label3}" id="label3" style="left: 264px; top: 192px; position: absolute" text="Banco"/>
                        <ui:dropDown binding="#{CtaRecExt.ddConcesionario}" id="ddConcesionario"
                            items="#{CtaRecExt.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddConcesionario');" style="left: 432px; top: 168px; position: absolute; width: 192px"
                            tabIndex="1" valueChangeListener="#{CtaRecExt.ddConcesionario_processValueChange}"/>
                        <ui:dropDown binding="#{CtaRecExt.ddBanco}" id="ddBanco" items="#{CtaRecExt.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 192px; position: absolute; width: 192px" tabIndex="2"/>
                        <ui:dropDown binding="#{CtaRecExt.ddTipoCta}" id="ddTipoCta" items="#{CtaRecExt.ddTipoCtaDefaultOptions.options}"
                            style="left: 432px; top: 240px; position: absolute; width: 192px" tabIndex="4"/>
                        <ui:label binding="#{CtaRecExt.label4}" id="label4" style="left: 264px; top: 240px; position: absolute" text="Tipo Cuenta"/>
                        <ui:textField binding="#{CtaRecExt.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 432px; top: 216px; position: absolute; width: 186px" tabIndex="5"/>
                        <ui:label binding="#{CtaRecExt.label5}" id="label5" style="left: 264px; top: 216px; position: absolute" text="Número Cuenta"/>
                        <ui:textField binding="#{CtaRecExt.tfComisionRec}" id="tfComisionRec" maxLength="7"
                            style="left: 432px; top: 264px; position: absolute; width: 186px" tabIndex="6"/>
                        <ui:textField binding="#{CtaRecExt.tfComisionAch}" id="tfComisionAch" maxLength="7"
                            style="left: 432px; top: 288px; position: absolute; width: 186px" tabIndex="7"/>
                        <ui:label binding="#{CtaRecExt.label7}" id="label7" style="left: 264px; top: 264px; position: absolute" text="Comisión Recaudo  + Iva"/>
                        <ui:label binding="#{CtaRecExt.label8}" id="label8" style="left: 264px; top: 288px; position: absolute" text="Comisión ACH  + Iva"/>
                        <ui:button action="#{CtaRecExt.btAdicionar_action}" binding="#{CtaRecExt.btAdicionar}" id="btAdicionar" onClick="btActualizar_action()"
                            style="left: 719px; top: 312px; position: absolute; width: 95px" tabIndex="9" text="Adicionar"/>
                        <ui:textField binding="#{CtaRecExt.tfCtaCon}" id="tfCtaCon" maxLength="10"
                            style="left: 432px; top: 312px; position: absolute; width: 186px" tabIndex="8"/>
                        <ui:label binding="#{CtaRecExt.label6}" id="label6" style="left: 264px; top: 312px; position: absolute" text="Cuenta Contable"/>
                        <ui:radioButtonGroup binding="#{CtaRecExt.rbTipoRecaudo}" id="rbTipoRecaudo" items="#{CtaRecExt.rbTipoRecaudoDefaultOptions.options}"
                            style="left: 744px; top: 168px; position: absolute; width: 120px" tabIndex="3"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
