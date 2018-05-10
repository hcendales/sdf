<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{NovReenvio.page1}" id="page1">
            <ui:html binding="#{NovReenvio.html1}" id="html1">
                <ui:head binding="#{NovReenvio.head1}" id="head1">
                    <ui:link binding="#{NovReenvio.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{NovReenvio.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{NovReenvio.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{NovReenvio.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 144px; position: absolute" text="Reenvio de rechazos ACH"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{NovReenvio.btConsultar_action}" binding="#{NovReenvio.btConsultar}" id="btConsultar"
                            onClick="btActualizar_action()" style="height: 24px; left: 455px; top: 240px; position: absolute; width: 96px" tabIndex="4" text="Consultar"/>
                        <ui:label binding="#{NovReenvio.label1}" id="label1" style="left: 288px; top: 192px; position: absolute" text="Concepto Rechazo ACH"/>
                        <ui:dropDown binding="#{NovReenvio.ddConcepto}" id="ddConcepto"
                            items="#{NovReenvio.vw_conceptodevachDataProvider.options['CONCEPTO,CONCEPTO']}" style="left: 456px; top: 192px; position: absolute; width: 360px"/>
                        <ui:tabSet binding="#{NovReenvio.tabSet1}" id="tabSet1" selected="tab2" style="left: 288px; top: 288px; position: absolute">
                            <ui:tab binding="#{NovReenvio.tab2}" id="tab2" text="Rechazos">
                                <ui:panelLayout binding="#{NovReenvio.layoutPanel2}" id="layoutPanel2" style="height: 463px; position: relative; width: 1775px; -rave-layout: grid">
                                    <ui:table augmentTitle="false" binding="#{NovReenvio.table1}" clearSortButton="true" deselectMultipleButton="true"
                                        id="table1" selectMultipleButton="true" sortPanelToggleButton="true"
                                        style="left: 24px; top: 24px; position: absolute; width: 1638px" title="Rechazos ACH" width="1529">
                                        <ui:tableRowGroup binding="#{NovReenvio.tableRowGroup1}" emptyDataMsg="No hay informacion resultante"
                                            id="tableRowGroup1" rows="10" sourceData="#{NovReenvio.vw_devolucionesachDataProvider}" sourceVar="currentRow">
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn16}" id="tableColumn16" selectId="checkbox1" sort="ACTUALIZAR">
                                                <ui:checkbox binding="#{NovReenvio.checkbox1}" id="checkbox1" selected="#{currentRow.value['ACTUALIZAR']}" selectedValue="1"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn2}" headerText="Banco Origen" id="tableColumn2" sort="BANCOORIGEN">
                                                <ui:staticText binding="#{NovReenvio.staticText1}" id="staticText1" text="#{currentRow.value['BANCOORIGEN']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn3}" headerText="Cuenta Origen" id="tableColumn3" sort="ORI_CUENTA">
                                                <ui:staticText binding="#{NovReenvio.staticText2}" id="staticText2" text="#{currentRow.value['ORI_CUENTA']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn4}" headerText="Fecha Transferencia" id="tableColumn4" sort="FEC_DISPERSION">
                                                <ui:staticText binding="#{NovReenvio.staticText3}" id="staticText3" text="#{currentRow.value['FEC_DISPERSION']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn5}" headerText="Fecha Envio Banco" id="tableColumn5" sort="FECHAENVIO">
                                                <ui:staticText binding="#{NovReenvio.staticText4}" id="staticText4" text="#{currentRow.value['FECHAENVIO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn6}" headerText="Tipo Cta Destino" id="tableColumn6" sort="DES_TIPOCUENTA">
                                                <ui:staticText binding="#{NovReenvio.staticText5}" id="staticText5" text="#{currentRow.value['DES_TIPOCUENTA']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn7}" headerText="Banco Destino" id="tableColumn7" sort="BANCODESTINO">
                                                <ui:staticText binding="#{NovReenvio.staticText6}" id="staticText6" text="#{currentRow.value['BANCODESTINO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn8}" headerText="Cuenta Destino" id="tableColumn8" sort="CUENTADESTINO">
                                                <ui:staticText binding="#{NovReenvio.staticText7}" id="staticText7" text="#{currentRow.value['CUENTADESTINO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn9}" headerText="Nit Destino" id="tableColumn9" sort="DES_NIT">
                                                <ui:staticText binding="#{NovReenvio.staticText8}" id="staticText8" text="#{currentRow.value['DES_NIT']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn10}" headerText="Autoridad" id="tableColumn10" sort="INDTIPO">
                                                <ui:staticText binding="#{NovReenvio.staticText9}" id="staticText9" text="#{currentRow.value['INDTIPO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn11}" headerText="Valor" id="tableColumn11" sort="VALOR">
                                                <ui:staticText binding="#{NovReenvio.staticText10}" id="staticText10" text="#{currentRow.value['VALOR']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn12}" headerText="Fecha Devolucion" id="tableColumn12" sort="FECHADEVOLUCION">
                                                <ui:staticText binding="#{NovReenvio.staticText11}" id="staticText11" text="#{currentRow.value['FECHADEVOLUCION']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn13}" headerText="Codigo Devolucion" id="tableColumn13" sort="CODIGODEVOLUCION">
                                                <ui:staticText binding="#{NovReenvio.staticText12}" id="staticText12" text="#{currentRow.value['CODIGODEVOLUCION']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn14}" headerText="Motivo Devolucion" id="tableColumn14" sort="MOTIVODEVOLUCION">
                                                <ui:staticText binding="#{NovReenvio.staticText13}" id="staticText13" text="#{currentRow.value['MOTIVODEVOLUCION']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{NovReenvio.tableColumn15}" headerText="Referencia" id="tableColumn15" sort="REFERENCIATRF">
                                                <ui:staticText binding="#{NovReenvio.staticText14}" id="staticText14" text="#{currentRow.value['REFERENCIATRF']}"/>
                                            </ui:tableColumn>
                                        </ui:tableRowGroup>
                                    </ui:table>
                                </ui:panelLayout>
                            </ui:tab>
                            <ui:tab action="#{NovReenvio.tab1_action}" binding="#{NovReenvio.tab1}" id="tab1" text="Datos Reenvio">
                                <ui:panelLayout binding="#{NovReenvio.layoutPanel1}" id="layoutPanel1" style="height: 533px; width: 621px">
                                    <ui:label binding="#{NovReenvio.label2}" id="label2" style="left: 120px; top: 48px; position: absolute" text="Ajuste Realizado"/>
                                    <ui:dropDown binding="#{NovReenvio.ddAjuste}" id="ddAjuste"
                                        items="#{NovReenvio.ajusteachDataProvider.options['TIPO,DESCRIPCION']}" style="left: 240px; top: 48px; position: absolute; width: 360px"/>
                                    <ui:label binding="#{NovReenvio.label3}" id="label3" style="position: absolute; left: 264px; top: 96px" text="Cuenta Destino"/>
                                    <ui:label binding="#{NovReenvio.label4}" id="label4" style="left: 120px; top: 120px; position: absolute" text="Banco"/>
                                    <ui:label binding="#{NovReenvio.label5}" id="label5" style="left: 120px; top: 144px; position: absolute" text="Tipo Cuenta"/>
                                    <ui:label binding="#{NovReenvio.label6}" id="label6" style="left: 120px; top: 168px; position: absolute" text="Cuenta"/>
                                    <ui:label binding="#{NovReenvio.label7}" id="label7" style="left: 120px; top: 192px; position: absolute" text="Tipo Identificacion"/>
                                    <ui:label binding="#{NovReenvio.label8}" id="label8" style="left: 120px; top: 216px; position: absolute" text="Identificacion"/>
                                    <ui:label binding="#{NovReenvio.label9}" id="label9" style="left: 120px; top: 240px; position: absolute" text="Fecha Activacion"/>
                                    <ui:label binding="#{NovReenvio.label10}" id="label10" style="left: 120px; top: 288px; position: absolute" text="DNS AVVILLAS"/>
                                    <ui:label binding="#{NovReenvio.label11}" id="label11" style="left: 120px; top: 312px; position: absolute" text="DNS DAVIVIENDA"/>
                                    <ui:label binding="#{NovReenvio.label12}" id="label12" style="left: 144px; top: 360px; position: absolute" text="Advertencia: Los nuevos datos de cuenta destino aplican para todas las operaciones seleccionadas"/>
                                    <ui:button action="#{NovReenvio.bcrearNov_action}" binding="#{NovReenvio.bcrearNov}" id="bcrearNov"
                                        style="left: 263px; top: 432px; position: absolute; width: 119px" text="Crear Novedad "/>
                                    <ui:dropDown binding="#{NovReenvio.ddBanco}" id="ddBanco" items="#{NovReenvio.bancoDataProvider.options['IDBANCO,NOMBRE']}" style="left: 240px; top: 120px; position: absolute; width: 240px"/>
                                    <ui:dropDown binding="#{NovReenvio.ddTipo}" id="ddTipo" items="#{NovReenvio.ddTipoDefaultOptions.options}" style="left: 240px; top: 144px; position: absolute; width: 144px"/>
                                    <ui:textField binding="#{NovReenvio.tcuenta}" id="tcuenta" style="left: 240px; top: 168px; position: absolute; width: 144px"/>
                                    <ui:dropDown binding="#{NovReenvio.ddTipoIde}" id="ddTipoIde" items="#{NovReenvio.ddTipoIdeDefaultOptions.options}" style="left: 240px; top: 192px; position: absolute; width: 144px"/>
                                    <ui:textField binding="#{NovReenvio.tidentificacion}" id="tidentificacion" style="left: 240px; top: 216px; position: absolute; width: 144px"/>
                                    <ui:calendar binding="#{NovReenvio.cfecAct}" dateFormatPattern="yyyy-MM-dd" dateFormatPatternHelp="yyyy-mm-dd" id="cfecAct" style="position: absolute; left: 240px; top: 240px"/>
                                    <ui:textField binding="#{NovReenvio.tdnsAvvillas}" id="tdnsAvvillas" style="left: 240px; top: 288px; position: absolute; width: 120px"/>
                                    <ui:textField binding="#{NovReenvio.tdnsDavivienda}" id="tdnsDavivienda" style="left: 240px; top: 312px; position: absolute; width: 120px"/>
                                </ui:panelLayout>
                            </ui:tab>
                        </ui:tabSet>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
