<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{CuentasDispFCM.page1}" id="page1">
            <ui:html binding="#{CuentasDispFCM.html1}" id="html1">
                <ui:head binding="#{CuentasDispFCM.head1}" id="head1">
                    <ui:link binding="#{CuentasDispFCM.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{CuentasDispFCM.body1}" focus="form1:ddBanco" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{CuentasDispFCM.form1}" id="form1">
                        <div style="left: 0px; top: 0px; position: absolute">
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{CuentasDispFCM.tfNitFcm}" id="tfNitFcm" readOnly="true"
                            style="left: 432px; top: 168px; position: absolute; width: 94px" tabIndex="1" text="8000826650"/>
                        <ui:label binding="#{CuentasDispFCM.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Nit FCM"/>
                        <ui:table augmentTitle="false" binding="#{CuentasDispFCM.table1}" id="table1"
                            style="left: 264px; top: 456px; position: absolute; width: 546px" title="Cuentas Dispersion FCM" width="546">
                            <ui:tableRowGroup binding="#{CuentasDispFCM.tableRowGroup1}" id="tableRowGroup1" rows="5"
                                sourceData="#{CuentasDispFCM.cta_dispersion_fcmDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{CuentasDispFCM.tableColumn11}" id="tableColumn11">
                                    <ui:button action="#{CuentasDispFCM.btEditar_action}" binding="#{CuentasDispFCM.bconsultar}" id="bconsultar"
                                        imageURL="/resources/edit.GIF" tabIndex="13" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasDispFCM.tableColumn12}" id="tableColumn12">
                                    <ui:button action="#{CuentasDispFCM.beliminar_action}" binding="#{CuentasDispFCM.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;"
                                        tabIndex="14" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasDispFCM.tableColumn1}" headerText="BANCO RECAUDADOR" id="tableColumn1" sort="IDBANCOREC">
                                    <ui:staticText binding="#{CuentasDispFCM.stIdBancoRec}" id="stIdBancoRec" text="#{currentRow.value['IDBANCOREC']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasDispFCM.tableColumn2}" headerText="BANCO" id="tableColumn2" sort="BANCONOMBRE">
                                    <ui:staticText binding="#{CuentasDispFCM.staticText1}" id="staticText1" text="#{currentRow.value['BANCONOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasDispFCM.tableColumn4}" headerText="CUENTA SIMIT" id="tableColumn4" sort="CTA_DISP_S_CTA">
                                    <ui:staticText binding="#{CuentasDispFCM.staticText4}" id="staticText4" text="#{currentRow.value['CTA_DISP_S_CTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasDispFCM.tableColumn7}" headerText="CUENTA POLCA" id="tableColumn7" sort="CTA_DISP_P_CTA">
                                    <ui:staticText binding="#{CuentasDispFCM.staticText7}" id="staticText7" text="#{currentRow.value['CTA_DISP_P_CTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CuentasDispFCM.tableColumn10}" headerText="CUENTA 1.8" id="tableColumn10" sort="CTA_DISP_PA_CTA">
                                    <ui:staticText binding="#{CuentasDispFCM.staticText10}" id="staticText10" text="#{currentRow.value['CTA_DISP_PA_CTA']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:button action="#{CuentasDispFCM.btAdicionar_action}" binding="#{CuentasDispFCM.btAdicionar}" id="btAdicionar"
                            style="left: 815px; top: 408px; position: absolute; width: 96px" tabIndex="12" text="Adicionar"/>
                        <ui:textField binding="#{CuentasDispFCM.tfCuentaSimit}" id="tfCuentaSimit" maxLength="16"
                            style="left: 768px; top: 264px; position: absolute; width: 144px" tabIndex="5"/>
                        <ui:label binding="#{CuentasDispFCM.label9}" for="tfCuentaPolca" id="label9"
                            style="left: 816px; top: 240px; position: absolute; width: 72px" text="Cuenta"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddBancoPolcaA}" id="ddBancoPolcaA"
                            items="#{CuentasDispFCM.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 312px; position: absolute; width: 168px" tabIndex="9"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddBancoPolca}" id="ddBancoPolca"
                            items="#{CuentasDispFCM.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 288px; position: absolute; width: 168px" tabIndex="6"/>
                        <ui:label binding="#{CuentasDispFCM.label10}" id="label10" style="left: 672px; top: 240px; position: absolute; width: 72px" text="Tipo"/>
                        <ui:label binding="#{CuentasDispFCM.label11}" id="label11" style="left: 264px; top: 264px; position: absolute" text="Libre Disposición (SIMIT)"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddBancoSimit}" id="ddBancoSimit"
                            items="#{CuentasDispFCM.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 264px; position: absolute; width: 168px" tabIndex="3"/>
                        <ui:label binding="#{CuentasDispFCM.label12}" id="label12" style="left: 480px; top: 240px; position: absolute" text="Banco"/>
                        <ui:label binding="#{CuentasDispFCM.label13}" id="label13" style="left: 264px; top: 288px; position: absolute" text="Libre Disposición (POLCA)"/>
                        <ui:label binding="#{CuentasDispFCM.label14}" id="label14" style="left: 264px; top: 312px; position: absolute" text="FCM 1.8%"/>
                        <ui:textField binding="#{CuentasDispFCM.tfCuentaPolcaA}" id="tfCuentaPolcaA" maxLength="16"
                            style="left: 768px; top: 312px; position: absolute; width: 144px" tabIndex="11"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddTipoSimit}" id="ddTipoSimit" items="#{CuentasDispFCM.ddTipoSimitDefaultOptions.options}"
                            style="left: 624px; top: 264px; position: absolute; width: 120px" tabIndex="4"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddTipoPolcaA}" id="ddTipoPolcaA" items="#{CuentasDispFCM.ddTipoPolcaADefaultOptions.options}"
                            style="left: 624px; top: 312px; position: absolute; width: 120px" tabIndex="10"/>
                        <ui:textField binding="#{CuentasDispFCM.tfCuentaPolca}" id="tfCuentaPolca" maxLength="16"
                            style="left: 768px; top: 288px; position: absolute; width: 144px" tabIndex="8"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddTipoPolca}" id="ddTipoPolca" items="#{CuentasDispFCM.ddTipoPolcaDefaultOptions.options}"
                            style="left: 624px; top: 288px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:label binding="#{CuentasDispFCM.label2}" id="label2" style="left: 264px; top: 192px; position: absolute" text="Banco Recaudador"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddBancoRec}" id="ddBancoRec"
                            items="#{CuentasDispFCM.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}" onChange=""
                            style="left: 432px; top: 192px; position: absolute; width: 192px" tabIndex="2"/>
                        <ui:label binding="#{CuentasDispFCM.label3}" id="label3" style="left: 264px; top: 336px; position: absolute" text="Acuerdo de Pago"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddBancoAcuerdo}" id="ddBancoAcuerdo"
                            items="#{CuentasDispFCM.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 336px; position: absolute; width: 168px" tabIndex="9"/>
                        <ui:dropDown binding="#{CuentasDispFCM.ddTipoAcuerdo}" id="ddTipoAcuerdo" items="#{CuentasDispFCM.ddTipoAcuerdoDefaultOptions.options}"
                            style="left: 624px; top: 336px; position: absolute; width: 120px" tabIndex="10"/>
                        <ui:textField binding="#{CuentasDispFCM.tfCuentaAcuerdo}" id="tfCuentaAcuerdo" maxLength="16"
                            style="left: 768px; top: 336px; position: absolute; width: 144px" tabIndex="11"/>
                    </ui:form>
                    <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                        <jsp:directive.include file="Navigation.jspf"/>
                    </div>
                    <ui:staticText binding="#{CuentasDispFCM.stopcion1}" id="stopcion1"
                        style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Cuentas Dispersión FCM"/>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
