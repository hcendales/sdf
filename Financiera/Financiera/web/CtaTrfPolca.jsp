<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{CtaTrfPolca.page1}" id="page1">
            <ui:html binding="#{CtaTrfPolca.html1}" id="html1">
                <ui:head binding="#{CtaTrfPolca.head1}" id="head1">
                    <ui:link binding="#{CtaTrfPolca.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{CtaTrfPolca.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{CtaTrfPolca.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{CtaTrfPolca.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Cuenta Transferencia POLCA"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{CtaTrfPolca.label1}" id="label1" style="left: 336px; top: 168px; position: absolute" text="Banco"/>
                        <ui:label binding="#{CtaTrfPolca.label2}" id="label2" style="left: 336px; top: 192px; position: absolute" text="Tipo Cuenta"/>
                        <ui:label binding="#{CtaTrfPolca.label3}" id="label3" style="left: 336px; top: 216px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{CtaTrfPolca.label4}" id="label4" style="left: 336px; top: 240px; position: absolute" text="Identificacion"/>
                        <ui:label binding="#{CtaTrfPolca.label5}" id="label5" style="left: 336px; top: 264px; position: absolute" text="Numero cuenta"/>
                        <ui:textField binding="#{CtaTrfPolca.tidentificacion}" id="tidentificacion" maxLength="10" style="left: 480px; top: 240px; position: absolute; width: 168px"/>
                        <ui:textField binding="#{CtaTrfPolca.tcuenta}" id="tcuenta" maxLength="16" style="left: 480px; top: 264px; position: absolute; width: 168px"/>
                        <ui:button action="#{CtaTrfPolca.button1_action}" binding="#{CtaTrfPolca.button1}" id="button1"
                            style="left: 479px; top: 408px; position: absolute; width: 96px" text="Agregar"/>
                        <ui:dropDown binding="#{CtaTrfPolca.ddBanco}" id="ddBanco" items="#{CtaTrfPolca.bancoDataProvider1.options['IDBANCO,NOMBREBANCO']}" style="left: 480px; top: 168px; position: absolute; width: 168px"/>
                        <ui:dropDown binding="#{CtaTrfPolca.ddTipo}" id="ddTipo" items="#{CtaTrfPolca.ddTipoDefaultOptions.options}" style="left: 480px; top: 192px; position: absolute"/>
                        <ui:dropDown binding="#{CtaTrfPolca.ddNit}" id="ddNit" items="#{CtaTrfPolca.ddNitDefaultOptions.options}" style="left: 480px; top: 216px; position: absolute"/>
                        <ui:label binding="#{CtaTrfPolca.label6}" id="label6" style="left: 336px; top: 288px; position: absolute" text="Metodo transferencia"/>
                        <ui:dropDown binding="#{CtaTrfPolca.ddMetodo}" id="ddMetodo" items="#{CtaTrfPolca.ddMetodoDefaultOptions.options}" style="left: 480px; top: 288px; position: absolute; width: 168px"/>
                        <ui:calendar binding="#{CtaTrfPolca.clFechaTrf}" dateFormatPattern="yyyy-MM-dd" id="clFechaTrf"
                            style="left: 480px; top: 360px; position: absolute" tabIndex="1"/>
                        <ui:label binding="#{CtaTrfPolca.label7}" id="label7" style="left: 336px; top: 360px; position: absolute" text="Fecha Transferencia"/>
                        <ui:table augmentTitle="false" binding="#{CtaTrfPolca.table1}" id="table1" style="position: absolute; left: 360px; top: 432px"
                            title="Historial" width="840">
                            <ui:tableRowGroup binding="#{CtaTrfPolca.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{CtaTrfPolca.trfpolcaDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn8}" id="tableColumn8">
                                    <ui:button action="#{CtaTrfPolca.beliminar_action}" binding="#{CtaTrfPolca.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="Eliminar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn1}" headerText="FECHATRF" id="tableColumn1" sort="FECHATRF">
                                    <ui:staticText binding="#{CtaTrfPolca.stFecha}" id="stFecha" text="#{currentRow.value['FECHATRF']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn2}" headerText="IDBANCO" id="tableColumn2" sort="IDBANCO">
                                    <ui:staticText binding="#{CtaTrfPolca.staticText2}" id="staticText2" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn3}" headerText="TIPOCUENTA" id="tableColumn3" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{CtaTrfPolca.staticText3}" id="staticText3" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn4}" headerText="CUENTA" id="tableColumn4" sort="CUENTA">
                                    <ui:staticText binding="#{CtaTrfPolca.staticText4}" id="staticText4" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn5}" headerText="METODOTRF" id="tableColumn5" sort="METODOTRF">
                                    <ui:staticText binding="#{CtaTrfPolca.staticText5}" id="staticText5" text="#{currentRow.value['METODOTRF']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn6}" headerText="VALOR" id="tableColumn6" sort="VALOR">
                                    <ui:staticText binding="#{CtaTrfPolca.staticText6}" id="staticText6" text="#{currentRow.value['VALOR']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{CtaTrfPolca.tableColumn7}" headerText="NIT" id="tableColumn7" sort="NIT">
                                    <ui:staticText binding="#{CtaTrfPolca.staticText7}" id="staticText7" text="#{currentRow.value['NIT']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{CtaTrfPolca.tvalor}" id="tvalor" maxLength="16" style="left: 480px; top: 312px; position: absolute; width: 168px"/>
                        <ui:label binding="#{CtaTrfPolca.label8}" id="label8" style="left: 336px; top: 312px; position: absolute" text="Valor"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
