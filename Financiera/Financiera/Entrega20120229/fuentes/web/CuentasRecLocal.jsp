<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{CuentasRecLocal.page1}" id="page1">
            <ui:html binding="#{CuentasRecLocal.html1}" id="html1">
                <ui:head binding="#{CuentasRecLocal.head1}" id="head1">
                    <ui:link binding="#{CuentasRecLocal.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{CuentasRecLocal.body1}" focus="form1:ddBanco" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{CuentasRecLocal.form1}" id="form1">
                        <div style="left: 0px; top: 0px; position: absolute">
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{CuentasRecLocal.tfNitFcm}" id="tfNitFcm" readOnly="true"
                            style="left: 360px; top: 168px; position: absolute; width: 94px" text="8000826650"/>
                        <ui:label binding="#{CuentasRecLocal.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Nit FCM"/>
                        <ui:table augmentTitle="false" binding="#{CuentasRecLocal.table1}" id="table1"
                            style="left: 264px; top: 408px; position: absolute; width: 686px" title="Cuentas Recaudo Local" width="686">
                            <ui:tableRowGroup binding="#{CuentasRecLocal.tableRowGroup1}" id="tableRowGroup1" rows="5"
                                sourceData="#{CuentasRecLocal.cta_recaudo_fcmDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{CuentasRecLocal.btEditar_action}" binding="#{CuentasRecLocal.btEditar}" id="btEditar"
                                        imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn9}" id="tableColumn9">
                                    <ui:button action="#{CuentasRecLocal.beliminar_action}" binding="#{CuentasRecLocal.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn2}" headerText="IDBANCO" id="tableColumn2" sort="IDBANCO">
                                    <ui:staticText binding="#{CuentasRecLocal.stIdBanco}" id="stIdBanco" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn8}" headerText="NOMBREBANCO" id="tableColumn8" sort="NOMBREBANCO">
                                    <ui:staticText binding="#{CuentasRecLocal.staticText1}" id="staticText1" text="#{currentRow.value['NOMBREBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn3}" headerText="INDTIPO" id="tableColumn3" sort="INDTIPO">
                                    <ui:staticText binding="#{CuentasRecLocal.staticText3}" id="staticText3" text="#{currentRow.value['INDTIPO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn4}" headerText="TIPOCUENTA" id="tableColumn4" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{CuentasRecLocal.staticText4}" id="staticText4" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn5}" headerText="CUENTA" id="tableColumn5" sort="CUENTA">
                                    <ui:staticText binding="#{CuentasRecLocal.staticText5}" id="staticText5" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn6}" headerText="COMISION RECAUDO" id="tableColumn6" sort="COMISION_RECAUDO">
                                    <ui:staticText binding="#{CuentasRecLocal.staticText6}" id="staticText6" text="#{currentRow.value['COMISION_RECAUDO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn7}" headerText="COMISION ACH" id="tableColumn7" sort="COMISION_ACH">
                                    <ui:staticText binding="#{CuentasRecLocal.staticText7}" id="staticText7" text="#{currentRow.value['COMISION_ACH']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasRecLocal.tableColumn10}" headerText="CUENTA CONTABLE" id="tableColumn10" sort="CTA_CONTABLE">
                                    <ui:staticText binding="#{CuentasRecLocal.staticText8}" id="staticText8" text="#{currentRow.value['CTA_CONTABLE']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{CuentasRecLocal.ddBanco}" id="ddBanco"
                            items="#{CuentasRecLocal.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 216px; position: absolute; width: 150px" tabIndex="1"/>
                        <ui:label binding="#{CuentasRecLocal.label2}" id="label2" style="left: 264px; top: 216px; position: absolute" text="Banco"/>
                        <ui:radioButtonGroup binding="#{CuentasRecLocal.rbTipo}" id="rbTipo" items="#{CuentasRecLocal.rbTipoDefaultOptions.options}"
                            style="left: 696px; top: 216px; position: absolute" tabIndex="7"/>
                        <ui:label binding="#{CuentasRecLocal.label3}" id="label3" style="left: 600px; top: 216px; position: absolute" text="Tipo Recaudo"/>
                        <ui:dropDown binding="#{CuentasRecLocal.ddTipoCta}" id="ddTipoCta" items="#{CuentasRecLocal.ddTipoCtaDefaultOptions.options}"
                            style="left: 432px; top: 240px; position: absolute; width: 150px" tabIndex="2"/>
                        <ui:textField binding="#{CuentasRecLocal.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 432px; top: 264px; position: absolute; width: 144px" tabIndex="3"/>
                        <ui:label binding="#{CuentasRecLocal.label4}" for="tfCuenta" id="label4" style="left: 264px; top: 264px; position: absolute" text="Cuenta"/>
                        <ui:textField binding="#{CuentasRecLocal.tfComisionRec}" id="tfComisionRec" maxLength="7"
                            style="left: 432px; top: 288px; position: absolute; width: 144px" tabIndex="4"/>
                        <ui:label binding="#{CuentasRecLocal.label5}" id="label5" style="left: 264px; top: 288px; position: absolute" text="Comisión Recaudo + Iva"/>
                        <ui:textField binding="#{CuentasRecLocal.tfComisionAch}" id="tfComisionAch" maxLength="7"
                            style="left: 432px; top: 312px; position: absolute; width: 144px" tabIndex="5"/>
                        <ui:label binding="#{CuentasRecLocal.label6}" id="label6" style="left: 264px; top: 312px; position: absolute" text="Comisión ACH + Iva"/>
                        <ui:label binding="#{CuentasRecLocal.label7}" id="label7" style="left: 264px; top: 240px; position: absolute" text="Tipo Cuenta"/>
                        <ui:button action="#{CuentasRecLocal.btAdicionar_action}" binding="#{CuentasRecLocal.btAdicionar}" id="btAdicionar"
                            style="left: 671px; top: 336px; position: absolute; width: 96px" tabIndex="8" text="Adicionar"/>
                        <ui:label binding="#{CuentasRecLocal.label8}" id="label8" style="left: 264px; top: 336px; position: absolute" text="Cuenta Contable"/>
                        <ui:textField binding="#{CuentasRecLocal.tfCtaCon}" id="tfCtaCon" maxLength="10"
                            style="left: 432px; top: 336px; position: absolute; width: 144px" tabIndex="6"/>
                    </ui:form>
                    <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                        <jsp:directive.include file="Navigation.jspf"/>
                    </div>
                    <ui:staticText binding="#{CuentasRecLocal.stopcion1}" id="stopcion1"
                        style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Cuentas Recaudo Local"/>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
