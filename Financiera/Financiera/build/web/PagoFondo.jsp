<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{PagoFondo.page1}" id="page1">
            <ui:html binding="#{PagoFondo.html1}" id="html1">
                <ui:head binding="#{PagoFondo.head1}" id="head1">
                    <ui:link binding="#{PagoFondo.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{PagoFondo.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{PagoFondo.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{PagoFondo.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 336px; top: 144px; position: absolute; width: 432px" text="Definicion Tansferencia Fondo Rotatorio POLCA"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{PagoFondo.cfechaIni}" dateFormatPattern="yyyy-MM-dd" id="cfechaIni" style="position: absolute; left: 504px; top: 216px"/>
                        <ui:calendar binding="#{PagoFondo.cfechaFin}" dateFormatPattern="yyyy-MM-dd" id="cfechaFin" style="left: 504px; top: 264px; position: absolute"/>
                        <ui:label binding="#{PagoFondo.label1}" id="label1" style="left: 384px; top: 216px; position: absolute" text="Fecha Inicial"/>
                        <ui:label binding="#{PagoFondo.label2}" id="label2" style="left: 384px; top: 264px; position: absolute" text="Fecha Final"/>
                        <ui:button binding="#{PagoFondo.button1}" id="button1" style="left: 527px; top: 336px; position: absolute; width: 120px" text="Consultar"/>
                        <ui:tabSet binding="#{PagoFondo.tabSet1}" id="tabSet1" selected="tab1" style="height: 430px; left: 384px; top: 408px; position: absolute; width: 1054px">
                            <ui:tab action="#{PagoFondo.tab1_action}" binding="#{PagoFondo.tab1}" id="tab1" text="Pagos registrados">
                                <ui:panelLayout binding="#{PagoFondo.layoutPanel1}" id="layoutPanel1" style="width: 100%; height: 128px;">
                                    <ui:table augmentTitle="false" binding="#{PagoFondo.table1}" id="table1" paginateButton="true" paginationControls="true"
                                        style="left: 24px; top: 24px; position: absolute; width: 840px" title="Pagos Fondo Rotatorio" width="840">
                                        <ui:tableRowGroup binding="#{PagoFondo.tableRowGroup1}" emptyDataMsg="NO hay pagos registrados" id="tableRowGroup1"
                                            rows="10" sourceData="#{PagoFondo.pagofondoDataProvider}" sourceVar="currentRow">
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn8}" id="tableColumn8">
                                                <ui:button action="#{PagoFondo.button2_action}" binding="#{PagoFondo.button2}" id="button2"
                                                    imageURL="/resources/no.gif"
                                                    onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="eliminar"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn1}" headerText="FECHAAPLICACION" id="tableColumn1" sort="FECHAAPLICACION">
                                                <ui:staticText binding="#{PagoFondo.sfechaAplic}" id="sfechaAplic" text="#{currentRow.value['FECHAAPLICACION']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn2}" headerText="TIPORECAUDO" id="tableColumn2" sort="TIPORECAUDO">
                                                <ui:staticText binding="#{PagoFondo.stipoRecaudo}" id="stipoRecaudo" text="#{currentRow.value['TIPORECAUDO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn3}" headerText="CUENTAORIGEN" id="tableColumn3" sort="CUENTAORIGEN">
                                                <ui:staticText binding="#{PagoFondo.scuenta}" id="scuenta" text="#{currentRow.value['CUENTAORIGEN']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn4}" headerText="VALOR" id="tableColumn4" sort="VALOR">
                                                <ui:staticText binding="#{PagoFondo.svalor}" id="svalor" text="#{currentRow.value['VALOR']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn5}" headerText="FECHANOVEDAD" id="tableColumn5" sort="FECHANOVEDAD">
                                                <ui:staticText binding="#{PagoFondo.staticText5}" id="staticText5" text="#{currentRow.value['FECHANOVEDAD']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn6}" headerText="USUARIONOVEDAD" id="tableColumn6" sort="USUARIONOVEDAD">
                                                <ui:staticText binding="#{PagoFondo.staticText6}" id="staticText6" text="#{currentRow.value['USUARIONOVEDAD']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn7}" headerText="FECHALIQUIDACION" id="tableColumn7" sort="FECHALIQUIDACION">
                                                <ui:staticText binding="#{PagoFondo.staticText7}" id="staticText7" text="#{currentRow.value['FECHALIQUIDACION']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{PagoFondo.tableColumn9}" headerText="IDREG" id="tableColumn9" sort="IDREG">
                                                <ui:staticText binding="#{PagoFondo.stIdReg}" id="stIdReg" text="#{currentRow.value['IDREG']}"/>
                                            </ui:tableColumn>
                                        </ui:tableRowGroup>
                                    </ui:table>
                                </ui:panelLayout>
                            </ui:tab>
                            <ui:tab action="#{PagoFondo.tab2_action}" binding="#{PagoFondo.tab2}" id="tab2" text="Agregar">
                                <ui:panelLayout binding="#{PagoFondo.layoutPanel2}" id="layoutPanel2" style="width: 100%; height: 128px;">
                                    <ui:dropDown binding="#{PagoFondo.ddTipoRec}" id="ddTipoRec" items="#{PagoFondo.ddTipoRecDefaultOptions.options}" style="left: 192px; top: 96px; position: absolute; width: 168px"/>
                                    <ui:dropDown binding="#{PagoFondo.ddCuenta}" id="ddCuenta"
                                        items="#{PagoFondo.vw_cuentaorigendevDataProvider1.options['CUENTA,NOMCUENTA']}" style="left: 192px; top: 144px; position: absolute; width: 384px"/>
                                    <ui:calendar binding="#{PagoFondo.cfecApli}" dateFormatPattern="yyyy-MM-dd" id="cfecApli" style="left: 192px; top: 24px; position: absolute"/>
                                    <ui:textField binding="#{PagoFondo.txtValor}" id="txtValor" style="left: 192px; top: 192px; position: absolute; width: 144px"/>
                                    <ui:label binding="#{PagoFondo.label3}" id="label3" style="left: 48px; top: 24px; position: absolute" text="Fecha de aplicacion"/>
                                    <ui:label binding="#{PagoFondo.label4}" id="label4" style="left: 48px; top: 96px; position: absolute" text="Tipo de recaudo"/>
                                    <ui:button action="#{PagoFondo.bagregar_action}" binding="#{PagoFondo.bagregar}" id="bagregar"
                                        style="left: 191px; top: 240px; position: absolute; width: 95px" text="Agregar"/>
                                    <ui:label binding="#{PagoFondo.label5}" id="label5" style="left: 48px; top: 144px; position: absolute" text="Cuenta Origen"/>
                                    <ui:label binding="#{PagoFondo.label6}" id="label6" style="left: 48px; top: 192px; position: absolute" text="Valor"/>
                                </ui:panelLayout>
                            </ui:tab>
                        </ui:tabSet>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
