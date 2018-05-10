<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{SoportesAjustesLocal.page1}" id="page1">
            <ui:html binding="#{SoportesAjustesLocal.html1}" id="html1">
                <ui:head binding="#{SoportesAjustesLocal.head1}" id="head1">
                    <ui:link binding="#{SoportesAjustesLocal.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{SoportesAjustesLocal.body1}" focus="form1:forma" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{SoportesAjustesLocal.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{SoportesAjustesLocal.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Soportes para ajuste recaudo local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{SoportesAjustesLocal.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Periodo"/>
                        <ui:dropDown binding="#{SoportesAjustesLocal.ddBanco}" disabled="true" id="ddBanco"
                            items="#{SoportesAjustesLocal.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 384px; top: 240px; position: absolute; width: 288px" tabIndex="3"/>
                        <ui:label binding="#{SoportesAjustesLocal.label2}" id="label2" style="left: 264px; top: 216px; position: absolute" text="Municipio"/>
                        <ui:dropDown binding="#{SoportesAjustesLocal.ddMunicipio}" disabled="true" id="ddMunicipio"
                            items="#{SoportesAjustesLocal.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            style="left: 384px; top: 216px; position: absolute; width: 288px" tabIndex="2"/>
                        <ui:label binding="#{SoportesAjustesLocal.label4}" id="label4" style="left: 264px; top: 240px; position: absolute" text="Banco"/>
                        <ui:dropDown binding="#{SoportesAjustesLocal.ddTipo}" disabled="true" id="ddTipo"
                            items="#{SoportesAjustesLocal.ddTipoDefaultOptions.options}" style="left: 384px; top: 264px; position: absolute" tabIndex="4"/>
                        <ui:label binding="#{SoportesAjustesLocal.label5}" id="label5" style="left: 264px; top: 264px; position: absolute" text="Tipo"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfCuenta}" disabled="true" id="tfCuenta" maxLength="16"
                            style="left: 384px; top: 312px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:label binding="#{SoportesAjustesLocal.label6}" id="label6" style="left: 264px; top: 312px; position: absolute" text="Cuenta Recaudo"/>
                        <ui:calendar binding="#{SoportesAjustesLocal.clFechaCorte}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="clFechaCorte"
                            style="left: 384px; top: 336px; position: absolute" tabIndex="6"/>
                        <ui:label binding="#{SoportesAjustesLocal.label7}" id="label7" style="left: 264px; top: 336px; position: absolute" text="Fecha Corte"/>
                        <ui:calendar binding="#{SoportesAjustesLocal.clFechaTrn}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="clFechaTrn"
                            style="left: 384px; top: 384px; position: absolute" tabIndex="7"/>
                        <ui:label binding="#{SoportesAjustesLocal.label8}" id="label8" style="left: 264px; top: 384px; position: absolute; width: 120px" text="Fecha Transaccion"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfValor}" disabled="true" id="tfValor" maxLength="16"
                            style="left: 384px; top: 432px; position: absolute; width: 136px" tabIndex="8"/>
                        <ui:label binding="#{SoportesAjustesLocal.label9}" id="label9" style="left: 264px; top: 432px; position: absolute" text="Valor"/>
                        <ui:button action="#{SoportesAjustesLocal.btAgregar_action}" binding="#{SoportesAjustesLocal.btAgregar}" id="btAgregar"
                            onClick="btAgregar_action()" style="left: 383px; top: 720px; position: absolute; width: 85px" tabIndex="10" text="Adjuntar"/>
                        <ui:label binding="#{SoportesAjustesLocal.label3}" id="label3" style="left: 264px; top: 456px; position: absolute" text="% Consignado"/>
                        <ui:dropDown binding="#{SoportesAjustesLocal.ddPConsignado}" disabled="true" id="ddPConsignado"
                            items="#{SoportesAjustesLocal.ddPConsignadoDefaultOptions.options}" style="left: 384px; top: 456px; position: absolute; width: 72px" tabIndex="9"/>
                        <ui:upload binding="#{SoportesAjustesLocal.fileUpload1}" id="fileUpload1" style="left: 384px; top: 672px; position: absolute"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfPeriodo}" disabled="true" id="tfPeriodo" maxLength="16"
                            style="left: 384px; top: 168px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfNombre}" id="tfNombre" style="left: 384px; top: 696px; position: absolute"/>
                        <ui:label binding="#{SoportesAjustesLocal.label10}" id="label10" style="left: 264px; top: 696px; position: absolute" text="Nombre documento"/>
                        <ui:label binding="#{SoportesAjustesLocal.label11}" id="label11" style="left: 264px; top: 672px; position: absolute" text="Archivo"/>
                        <ui:table augmentTitle="false" binding="#{SoportesAjustesLocal.table1}" id="table1"
                            style="left: 264px; top: 768px; position: absolute; width: 588px" title="Documentos" width="588">
                            <ui:tableRowGroup binding="#{SoportesAjustesLocal.tableRowGroup1}" emptyDataMsg="No hay documentos" id="tableRowGroup1" rows="10"
                                sourceData="#{SoportesAjustesLocal.vw_soportesDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{SoportesAjustesLocal.tableColumn7}" id="tableColumn7">
                                    <ui:button action="#{SoportesAjustesLocal.beliminar_action}" binding="#{SoportesAjustesLocal.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SoportesAjustesLocal.tableColumn1}" headerText="ID_RECAUDO_LOCAL_AJUSTES" id="tableColumn1"
                                    sort="ID_RECAUDO_LOCAL_AJUSTES" visible="false">
                                    <ui:staticText binding="#{SoportesAjustesLocal.staticText1}" id="staticText1" text="#{currentRow.value['ID_RECAUDO_LOCAL_AJUSTES']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SoportesAjustesLocal.tableColumn2}" headerText="ID_DOCUMENTO" id="tableColumn2" sort="ID_DOCUMENTO" visible="false">
                                    <ui:staticText binding="#{SoportesAjustesLocal.stIdDoc}" id="stIdDoc" text="#{currentRow.value['ID_DOCUMENTO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SoportesAjustesLocal.tableColumn3}" headerText="Nombre" id="tableColumn3" sort="NOMBREDOCUMENTO" width="79">
                                    <ui:staticText binding="#{SoportesAjustesLocal.staticText3}" id="staticText3" text="#{currentRow.value['NOMBREDOCUMENTO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SoportesAjustesLocal.tableColumn4}" headerText="Archivo" id="tableColumn4" sort="NOMBREARCHIVO">
                                    <ui:staticText binding="#{SoportesAjustesLocal.staticText4}" id="staticText4" text="#{currentRow.value['NOMBREARCHIVO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SoportesAjustesLocal.tableColumn5}" headerText="Extension" id="tableColumn5" sort="EXTENSIONARCHIVO" visible="false">
                                    <ui:staticText binding="#{SoportesAjustesLocal.staticText5}" id="staticText5" text="#{currentRow.value['EXTENSIONARCHIVO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SoportesAjustesLocal.tableColumn6}" headerText="Documento" id="tableColumn6">
                                    <ui:hyperlink action="#{SoportesAjustesLocal.hyperlink1_action}" binding="#{SoportesAjustesLocal.hyperlink1}"
                                        id="hyperlink1" text="Ver"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{SoportesAjustesLocal.tfPeriodo1}" disabled="true" id="tfPeriodo1" maxLength="16"
                            style="left: 384px; top: 144px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:label binding="#{SoportesAjustesLocal.label12}" id="label12" style="left: 264px; top: 144px; position: absolute" text="Id Ajuste"/>
                        <ui:textArea binding="#{SoportesAjustesLocal.textArea1}" disabled="true" id="textArea1" style="height: 72px; left: 384px; top: 480px; position: absolute; width: 528px"/>
                        <ui:label binding="#{SoportesAjustesLocal.label13}" id="label13" style="left: 264px; top: 480px; position: absolute" text="Motivo"/>
                        <ui:label binding="#{SoportesAjustesLocal.label14}" id="label14" style="left: 264px; top: 192px; position: absolute" text="Quincena"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfQuincena}" disabled="true" id="tfQuincena" maxLength="16"
                            style="left: 384px; top: 192px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:label binding="#{SoportesAjustesLocal.label15}" id="label15" style="left: 264px; top: 552px; position: absolute; width: 94px" text="Vigencia"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfVigencia}" disabled="true" id="tfVigencia" maxLength="16"
                            style="left: 384px; top: 552px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:label binding="#{SoportesAjustesLocal.label16}" id="label16" style="left: 264px; top: 576px; position: absolute; width: 94px" text="Fec Vig Ini"/>
                        <ui:label binding="#{SoportesAjustesLocal.label17}" id="label17" style="left: 264px; top: 600px; position: absolute; width: 94px" text="Fec Vig Fin"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfFecVigIni}" disabled="true" id="tfFecVigIni" maxLength="16"
                            style="left: 384px; top: 576px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:textField binding="#{SoportesAjustesLocal.tfFecVigFin}" disabled="true" id="tfFecVigFin" maxLength="16"
                            style="left: 384px; top: 600px; position: absolute; width: 136px" tabIndex="5"/>
                        <ui:checkbox binding="#{SoportesAjustesLocal.cbAcuerdo}" id="cbAcuerdo" label="Acuerdo de pago" style="left: 384px; top: 624px; position: absolute"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
