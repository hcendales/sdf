<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReenvioTrf.page1}" id="page1">
            <ui:html binding="#{ReenvioTrf.html1}" id="html1">
                <ui:head binding="#{ReenvioTrf.head1}" id="head1">
                    <ui:link binding="#{ReenvioTrf.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReenvioTrf.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReenvioTrf.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReenvioTrf.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Renvio de rechazos de transferencias bancarias"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ReenvioTrf.label1}" id="label1" style="position: absolute; left: 360px; top: 192px" text="Cuenta Origen"/>
                        <ui:label binding="#{ReenvioTrf.label2}" id="label2" style="left: 360px; top: 240px; position: absolute" text="Concepto de transferencia"/>
                        <ui:dropDown binding="#{ReenvioTrf.dropDown1}" id="dropDown1" items="#{ReenvioTrf.vw_cuentatrfDataProvider.options['CTA,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'dropDown1');" style="height: 24px; left: 528px; top: 192px; position: absolute; width: 312px"/>
                        <ui:dropDown binding="#{ReenvioTrf.dropDown2}" id="dropDown2"
                            items="#{ReenvioTrf.vw_conceptopagoDataProvider.options['CONCEPTO,CONCEPTO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'dropDown2');" style="height: 24px; left: 528px; top: 240px; position: absolute; width: 408px"/>
                        <ui:table augmentTitle="false" binding="#{ReenvioTrf.table1}" id="table1" style="position: absolute; left: 432px; top: 360px"
                            title="Rechazos" width="1718">
                            <ui:tableRowGroup binding="#{ReenvioTrf.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{ReenvioTrf.vw_reenvio_trfDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn13}" headerText="Procesar" id="tableColumn13">
                                    <ui:checkbox binding="#{ReenvioTrf.checkbox1}" disabled="true" id="checkbox1" selected=""/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn1}" headerText="CONCEPTO" id="tableColumn1" sort="CONCEPTO">
                                    <ui:staticText binding="#{ReenvioTrf.staticText1}" id="staticText1" text="#{currentRow.value['CONCEPTO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn2}" headerText="ORI_IDBANCO" id="tableColumn2" sort="ORI_IDBANCO">
                                    <ui:dropDown binding="#{ReenvioTrf.dropDown3}" disabled="true" id="dropDown3"
                                        items="#{ReenvioTrf.bancoDataProvider.options['IDBANCO,IDBANCO']}" selected="#{currentRow.value['ORI_IDBANCO']}" style="width: 168px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn3}" headerText="ORI_CUENTA" id="tableColumn3" sort="ORI_CUENTA">
                                    <ui:staticText binding="#{ReenvioTrf.staticText3}" id="staticText3" text="#{currentRow.value['ORI_CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn4}" headerText="DES_IDBANCO" id="tableColumn4">
                                    <ui:dropDown binding="#{ReenvioTrf.dropDown4}" disabled="true" id="dropDown4"
                                        items="#{ReenvioTrf.bancoDataProvider.options['IDBANCO,NOMBRE']}" selected="#{currentRow.value['DES_IDBANCO']}" style="width: 168px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn5}" headerText="DES_TIPOCUENTA" id="tableColumn5" sort="DES_TIPOCUENTA" width="249">
                                    <ui:dropDown binding="#{ReenvioTrf.dropDown5}" disabled="true" id="dropDown5"
                                        items="#{ReenvioTrf.tipoctaDataProvider.options['TIPO,TIPO']}" selected="#{currentRow.value['DES_TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn6}" headerText="DES_CUENTA" id="tableColumn6" sort="DES_CUENTA">
                                    <ui:textField binding="#{ReenvioTrf.textField2}" disabled="true" id="textField2" style="width: 144px" text="#{currentRow.value['DES_CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn7}" headerText="DES_NIT" id="tableColumn7" sort="DES_NIT">
                                    <ui:textField binding="#{ReenvioTrf.textField3}" disabled="true" id="textField3" style="width: 120px" text="#{currentRow.value['DES_NIT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn8}" headerText="VALOR" id="tableColumn8" sort="VALOR">
                                    <ui:staticText binding="#{ReenvioTrf.staticText8}" id="staticText8" text="#{currentRow.value['VALOR']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn9}" headerText="FECHAENVIO" id="tableColumn9" sort="FECHAENVIO">
                                    <ui:staticText binding="#{ReenvioTrf.staticText9}" id="staticText9" text="#{currentRow.value['FECHAENVIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn10}" headerText="FECHADEVOLUCION" id="tableColumn10" sort="FECHADEVOLUCION">
                                    <ui:staticText binding="#{ReenvioTrf.staticText10}" id="staticText10" text="#{currentRow.value['FECHADEVOLUCION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn11}" headerText="CODIGODEVOLUCION" id="tableColumn11" sort="CODIGODEVOLUCION">
                                    <ui:staticText binding="#{ReenvioTrf.staticText11}" id="staticText11" text="#{currentRow.value['CODIGODEVOLUCION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn12}" headerText="MOTIVODEVOLUCION" id="tableColumn12" sort="MOTIVODEVOLUCION">
                                    <ui:staticText binding="#{ReenvioTrf.staticText12}" id="staticText12" text="#{currentRow.value['MOTIVODEVOLUCION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReenvioTrf.tableColumn14}" headerText="REFERENCIATRF" id="tableColumn14" sort="REFERENCIATRF">
                                    <ui:staticText binding="#{ReenvioTrf.staticText2}" id="staticText2" text="#{currentRow.value['REFERENCIATRF']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:button action="#{ReenvioTrf.button1_action}" binding="#{ReenvioTrf.button1}" id="button1"
                            style="height: 24px; left: 503px; top: 312px; position: absolute; width: 144px" text="Inicar reenvio"/>
                        <ui:button action="#{ReenvioTrf.button2_action}" binding="#{ReenvioTrf.button2}" disabled="true" id="button2"
                            style="height: 24px; left: 696px; top: 312px; position: absolute; width: 144px" text="Procesar reenvio"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
