<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{AjustesLocal.page1}" id="page1">
            <ui:html binding="#{AjustesLocal.html1}" id="html1">
                <ui:head binding="#{AjustesLocal.head1}" id="head1">
                    <ui:link binding="#{AjustesLocal.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{AjustesLocal.body1}" focus="form1:ddPeriodo" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{AjustesLocal.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{AjustesLocal.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Ajustes a Recaudo Local"/>
                        <div style="left: 0px; top: 0px; position: absolute">
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{AjustesLocal.ddPeriodo}" id="ddPeriodo" items="#{AjustesLocal.ddPeriodoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddPeriodo');" style="left: 336px; top: 168px; position: absolute; width: 120px"
                            tabIndex="1" valueChangeListener="#{AjustesLocal.ddPeriodo_processValueChange}"/>
                        <ui:label binding="#{AjustesLocal.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Periodo"/>
                        <ui:table augmentTitle="false" binding="#{AjustesLocal.table1}" id="table1"
                            style="left: 264px; top: 792px; position: absolute; width: 641px" title="Ajustes" width="641">
                            <ui:tableRowGroup binding="#{AjustesLocal.tableRowGroup1}" emptyDataMsg="No Hay Registros" id="tableRowGroup1" rows="10"
                                sourceData="#{AjustesLocal.recaudo_local_ajustesDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{AjustesLocal.btEliminar_action}" binding="#{AjustesLocal.btEliminar}" id="btEliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn8}" headerText="MUNICIPIO" id="tableColumn8" sort="MUNICIPIO">
                                    <ui:staticText binding="#{AjustesLocal.staticText8}" id="staticText8" text="#{currentRow.value['MUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn9}" headerText="BANCO" id="tableColumn9" sort="BANCO">
                                    <ui:staticText binding="#{AjustesLocal.staticText9}" id="staticText9" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn3}" headerText="INDTIPO" id="tableColumn3" sort="INDTIPO">
                                    <ui:staticText binding="#{AjustesLocal.staticText3}" id="staticText3" text="#{currentRow.value['INDTIPO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn2}" headerText="CTA RECAUDO" id="tableColumn2" sort="CTA_RECAUDO">
                                    <ui:staticText binding="#{AjustesLocal.staticText2}" id="staticText2" text="#{currentRow.value['CTA_RECAUDO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn4}" headerText="FECHA CORTE" id="tableColumn4" sort="FEC_CORTE">
                                    <ui:staticText binding="#{AjustesLocal.staticText4}" id="staticText4" text="#{currentRow.value['FEC_CORTE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn5}" headerText="FECHA TRANSACCION" id="tableColumn5" sort="FEC_TRAN">
                                    <ui:staticText binding="#{AjustesLocal.staticText5}" id="staticText5" text="#{currentRow.value['FEC_TRAN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn6}" headerText="VALOR TOTAL" id="tableColumn6" sort="VALOR_TOTAL">
                                    <ui:staticText binding="#{AjustesLocal.staticText6}" id="staticText6" text="#{currentRow.value['VALOR_TOTAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn10}" headerText="ID_RECAUDO_LOCAL_AJUSTES" id="tableColumn10"
                                    sort="ID_RECAUDO_LOCAL_AJUSTES" visible="false">
                                    <ui:staticText binding="#{AjustesLocal.staticText10}" id="staticText10" text="#{currentRow.value['ID_RECAUDO_LOCAL_AJUSTES']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{AjustesLocal.tableColumn7}" headerText="Soportes" id="tableColumn7">
                                    <ui:hyperlink action="#{AjustesLocal.hyperlink1_action}" binding="#{AjustesLocal.hyperlink1}" id="hyperlink1" text="Consultar"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{AjustesLocal.ddBanco}" id="ddBanco" items="#{AjustesLocal.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 384px; top: 240px; position: absolute; width: 288px" tabIndex="3"/>
                        <ui:label binding="#{AjustesLocal.label2}" id="label2" style="left: 264px; top: 216px; position: absolute" text="Municipio"/>
                        <ui:dropDown binding="#{AjustesLocal.ddMunicipio}" id="ddMunicipio"
                            items="#{AjustesLocal.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            style="left: 384px; top: 216px; position: absolute; width: 288px" tabIndex="2"/>
                        <ui:label binding="#{AjustesLocal.label4}" id="label4" style="left: 264px; top: 240px; position: absolute" text="Banco"/>
                        <ui:dropDown binding="#{AjustesLocal.ddTipo}" id="ddTipo" items="#{AjustesLocal.ddTipoDefaultOptions.options}"
                            style="left: 384px; top: 264px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{AjustesLocal.label5}" id="label5" style="left: 264px; top: 264px; position: absolute" text="Tipo"/>
                        <ui:textField binding="#{AjustesLocal.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 384px; top: 312px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:label binding="#{AjustesLocal.label6}" id="label6" style="left: 264px; top: 312px; position: absolute" text="Cuenta Recaudo"/>
                        <ui:calendar binding="#{AjustesLocal.clFechaCorte}" dateFormatPattern="yyyy-MM-dd" id="clFechaCorte"
                            style="left: 384px; top: 336px; position: absolute" tabIndex="6"/>
                        <ui:label binding="#{AjustesLocal.label7}" id="label7" style="left: 264px; top: 336px; position: absolute" text="Fecha Corte"/>
                        <ui:calendar binding="#{AjustesLocal.clFechaTrn}" dateFormatPattern="yyyy-MM-dd" id="clFechaTrn"
                            style="left: 384px; top: 384px; position: absolute" tabIndex="7"/>
                        <ui:label binding="#{AjustesLocal.label8}" id="label8" style="left: 264px; top: 384px; position: absolute; width: 120px" text="Fecha Transaccion"/>
                        <ui:textField binding="#{AjustesLocal.tfValor}" id="tfValor" maxLength="16"
                            style="left: 384px; top: 432px; position: absolute; width: 136px" tabIndex="8"/>
                        <ui:label binding="#{AjustesLocal.label9}" id="label9" style="left: 264px; top: 432px; position: absolute" text="Valor"/>
                        <ui:button action="#{AjustesLocal.btAgregar_action}" binding="#{AjustesLocal.btAgregar}" id="btAgregar" onClick="btAgregar_action()"
                            style="left: 431px; top: 744px; position: absolute; width: 85px" tabIndex="10" text="Adicionar"/>
                        <ui:label binding="#{AjustesLocal.label3}" id="label3" style="left: 264px; top: 576px; position: absolute" text="% Consignado"/>
                        <ui:dropDown binding="#{AjustesLocal.ddPConsignado}" id="ddPConsignado" items="#{AjustesLocal.ddPConsignadoDefaultOptions.options}"
                            style="left: 384px; top: 576px; position: absolute; width: 72px" tabIndex="9"/>
                        <ui:label binding="#{AjustesLocal.label10}" id="label10" style="left: 264px; top: 624px; position: absolute" text="Motivo del ajuste"/>
                        <ui:textArea binding="#{AjustesLocal.tmotivo1}" id="tmotivo1" style="height: 96px; left: 384px; top: 624px; position: absolute; width: 456px"/>
                        <ui:calendar binding="#{AjustesLocal.clVigenciaIni}" dateFormatPattern="yyyy-MM-dd" id="clVigenciaIni"
                            style="left: 384px; top: 480px; position: absolute" tabIndex="7"/>
                        <ui:calendar binding="#{AjustesLocal.clVigenciaFin}" dateFormatPattern="yyyy-MM-dd" id="clVigenciaFin"
                            style="left: 384px; top: 528px; position: absolute" tabIndex="7"/>
                        <ui:label binding="#{AjustesLocal.label11}" id="label11" style="left: 264px; top: 480px; position: absolute; width: 120px" text="Vigencia Inicial"/>
                        <ui:label binding="#{AjustesLocal.label12}" id="label12" style="left: 264px; top: 528px; position: absolute; width: 120px" text="Vigencia Final"/>
                        <ui:label binding="#{AjustesLocal.label13}" id="label13" style="left: 480px; top: 168px; position: absolute" text="Quincena"/>
                        <ui:dropDown binding="#{AjustesLocal.ddQuincena}" id="ddQuincena" items="#{AjustesLocal.ddQuincenaDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddQuincena');" style="left: 552px; top: 168px; position: absolute; width: 120px"
                            tabIndex="1" valueChangeListener="#{AjustesLocal.ddPeriodo_processValueChange}"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
