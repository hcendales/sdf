<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadReenvio.page1}" id="page1">
            <ui:html binding="#{ConsNovedadReenvio.html1}" id="html1">
                <ui:head binding="#{ConsNovedadReenvio.head1}" id="head1">
                    <ui:link binding="#{ConsNovedadReenvio.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadReenvio.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadReenvio.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadReenvio.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Consulta Novedad Reenvio"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{ConsNovedadReenvio.btAnular_action}" binding="#{ConsNovedadReenvio.btAnular}" id="btAnular"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea rechazar novedad ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}&#xa;"
                            style="left: 815px; top: 456px; position: absolute; width: 95px" tabIndex="15" text="Rechazar"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tfNumero}" id="tfNumero" readOnly="true"
                            style="left: 408px; top: 191px; position: absolute; width: 138px" tabIndex="50"/>
                        <ui:label binding="#{ConsNovedadReenvio.labelDivipo1}" for="tfDivipo" id="labelDivipo1"
                            style="left: 264px; top: 192px; position: absolute" text="No Novedad"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn2}" id="tableColumn2"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn3}" id="tableColumn3"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn1}" id="tableColumn1"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn11}" id="tableColumn11"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn4}" id="tableColumn4"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn5}" id="tableColumn5"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn6}" id="tableColumn6"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn7}" id="tableColumn7"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn8}" id="tableColumn8"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn9}" id="tableColumn9"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn10}" id="tableColumn10"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn12}" id="tableColumn12"/>
                        <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn13}" id="tableColumn13"/>
                        <ui:button action="#{ConsNovedadReenvio.btAprobar_action}" binding="#{ConsNovedadReenvio.btAprobar}" id="btAprobar"
                            style="left: 815px; top: 408px; position: absolute; width: 95px" tabIndex="15" text="Aprobar"/>
                        <ui:label binding="#{ConsNovedadReenvio.labelDivipo2}" for="tfDivipo" id="labelDivipo2"
                            style="left: 576px; top: 192px; position: absolute; width: 94px" text="Tipo Novedad"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tfTipo}" id="tfTipo" readOnly="true"
                            style="left: 696px; top: 191px; position: absolute; width: 240px" tabIndex="50"/>
                        <ui:label binding="#{ConsNovedadReenvio.labelDivipo3}" for="tfDivipo" id="labelDivipo3"
                            style="left: 360px; top: 288px; position: absolute" text="Concepto"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tdnsAvvillas}" id="tdnsAvvillas" readOnly="true" style="left: 480px; top: 552px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tcuenta}" id="tcuenta" readOnly="true" style="left: 480px; top: 431px; position: absolute; width: 144px"/>
                        <ui:label binding="#{ConsNovedadReenvio.label1}" id="label1" style="left: 360px; top: 552px; position: absolute" text="DNS AVVILLAS"/>
                        <ui:label binding="#{ConsNovedadReenvio.label2}" id="label2" style="left: 360px; top: 312px; position: absolute" text="Ajuste Realizado"/>
                        <ui:label binding="#{ConsNovedadReenvio.label3}" id="label3" style="left: 360px; top: 456px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{ConsNovedadReenvio.label4}" id="label4" style="left: 360px; top: 504px; position: absolute" text="Fecha Activacion"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tidentificacion}" id="tidentificacion" readOnly="true" style="left: 480px; top: 479px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tdnsDavivienda}" id="tdnsDavivienda" readOnly="true" style="left: 480px; top: 576px; position: absolute; width: 120px"/>
                        <ui:label binding="#{ConsNovedadReenvio.label5}" id="label5" style="left: 504px; top: 360px; position: absolute" text="Cuenta Destino"/>
                        <ui:label binding="#{ConsNovedadReenvio.label6}" id="label6" style="left: 360px; top: 384px; position: absolute" text="Banco"/>
                        <ui:label binding="#{ConsNovedadReenvio.label7}" id="label7" style="left: 360px; top: 576px; position: absolute" text="DNS DAVIVIENDA"/>
                        <ui:label binding="#{ConsNovedadReenvio.label8}" id="label8" style="left: 360px; top: 408px; position: absolute" text="Tipo Cuenta"/>
                        <ui:label binding="#{ConsNovedadReenvio.label9}" id="label9" style="left: 360px; top: 432px; position: absolute" text="Cuenta"/>
                        <ui:label binding="#{ConsNovedadReenvio.label10}" id="label10" style="left: 360px; top: 480px; position: absolute" text="Identificacion"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tconcepto}" id="tconcepto" readOnly="true"
                            style="left: 480px; top: 287px; position: absolute; width: 360px" tabIndex="50"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tajuste}" id="tajuste" readOnly="true"
                            style="left: 480px; top: 311px; position: absolute; width: 360px" tabIndex="50"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tbanco}" id="tbanco" readOnly="true"
                            style="left: 480px; top: 383px; position: absolute; width: 240px" tabIndex="50"/>
                        <ui:textField binding="#{ConsNovedadReenvio.ttipoCuenta}" id="ttipoCuenta" readOnly="true"
                            style="left: 480px; top: 407px; position: absolute; width: 144px" tabIndex="50"/>
                        <ui:textField binding="#{ConsNovedadReenvio.ttipoIde}" id="ttipoIde" readOnly="true" style="left: 480px; top: 455px; position: absolute; width: 144px"/>
                        <ui:label binding="#{ConsNovedadReenvio.label11}" id="label11" style="left: 360px; top: 696px; position: absolute" text="Estado Novedad"/>
                        <ui:textField binding="#{ConsNovedadReenvio.testado}" id="testado" readOnly="true" style="left: 480px; top: 696px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tfechaAct}" id="tfechaAct" readOnly="true" style="left: 480px; top: 503px; position: absolute; width: 144px"/>
                        <ui:label binding="#{ConsNovedadReenvio.label12}" id="label12" style="left: 360px; top: 720px; position: absolute" text="Usuario Novedad"/>
                        <ui:textField binding="#{ConsNovedadReenvio.tusuario}" id="tusuario" readOnly="true" style="left: 480px; top: 720px; position: absolute; width: 120px"/>
                        <ui:table augmentTitle="false" binding="#{ConsNovedadReenvio.table1}" id="table1"
                            style="left: 360px; top: 768px; position: absolute; width: 1650px" title="Transferencias" width="1650">
                            <ui:tableRowGroup binding="#{ConsNovedadReenvio.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{ConsNovedadReenvio.vw_detallenovreenvioDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn16}" headerText="NOVEDAD" id="tableColumn16" sort="NOVEDAD">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText3}" id="staticText3" text="#{currentRow.value['NOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn14}" headerText="Banco Origen" id="tableColumn14" sort="BANCOORI">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText1}" id="staticText1" text="#{currentRow.value['BANCOORI']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn21}" headerText="Cuenta Origen" id="tableColumn21" sort="CUENTAORIGEN">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText8}" id="staticText8" text="#{currentRow.value['CUENTAORIGEN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn22}" headerText="Fecha transferencia" id="tableColumn22" sort="FECHATRF">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText9}" id="staticText9" text="#{currentRow.value['FECHATRF']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn23}" headerText="Fecha Envio Banco" id="tableColumn23" sort="FECHAENVIOBANCO">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText10}" id="staticText10" text="#{currentRow.value['FECHAENVIOBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn15}" headerText="Banco Destino" id="tableColumn15" sort="BANCODES">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText2}" id="staticText2" text="#{currentRow.value['BANCODES']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn32}" headerText="Tipo Cuenta Destino" id="tableColumn32" sort="TIPOCUENTADEST">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText19}" id="staticText19" text="#{currentRow.value['TIPOCUENTADEST']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn25}" headerText="Cuenta Destino" id="tableColumn25" sort="CUENTADEST">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText12}" id="staticText12" text="#{currentRow.value['CUENTADEST']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn26}" headerText="NIT Destino" id="tableColumn26" sort="NITDESTINO">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText13}" id="staticText13" text="#{currentRow.value['NITDESTINO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn27}" headerText="Autoridad" id="tableColumn27" sort="AUTORIDAD">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText14}" id="staticText14" text="#{currentRow.value['AUTORIDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn28}" headerText="Valor" id="tableColumn28" sort="VALOR">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText15}" id="staticText15" text="#{currentRow.value['VALOR']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn29}" headerText="Fecha Devolucion" id="tableColumn29" sort="FECHADEVOL">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText16}" id="staticText16" text="#{currentRow.value['FECHADEVOL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn30}" headerText="Codigo Devolucion" id="tableColumn30" sort="CODIGODEVOL">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText17}" id="staticText17" text="#{currentRow.value['CODIGODEVOL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn31}" headerText="Motivo Devolucion" id="tableColumn31" sort="MOTIVODEVOL">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText18}" id="staticText18" text="#{currentRow.value['MOTIVODEVOL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadReenvio.tableColumn19}" headerText="Referencia" id="tableColumn19" sort="REFERENCIATRF">
                                    <ui:staticText binding="#{ConsNovedadReenvio.staticText6}" id="staticText6" text="#{currentRow.value['REFERENCIATRF']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{ConsNovedadReenvio.txtValorSimit}" disabled="true" id="txtValorSimit" maxLength="10"
                            style="left: 480px; top: 624px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:textField binding="#{ConsNovedadReenvio.txtValorPolca}" disabled="true" id="txtValorPolca" maxLength="10"
                            style="left: 480px; top: 648px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:label binding="#{ConsNovedadReenvio.label13}" id="label13" style="left: 360px; top: 624px; position: absolute" text="Valor X SIMIT"/>
                        <ui:label binding="#{ConsNovedadReenvio.label14}" id="label14" style="left: 360px; top: 648px; position: absolute" text="Valor X POLCA"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
