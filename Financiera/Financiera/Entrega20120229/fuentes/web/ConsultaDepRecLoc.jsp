<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsultaDepRecLoc.page1}" id="page1">
            <ui:html binding="#{ConsultaDepRecLoc.html1}" id="html1">
                <ui:head binding="#{ConsultaDepRecLoc.head1}" id="head1">
                    <ui:link binding="#{ConsultaDepRecLoc.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsultaDepRecLoc.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsultaDepRecLoc.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsultaDepRecLoc.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Consulta depositos por identificar"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{ConsultaDepRecLoc.btLiquidar_action}" binding="#{ConsultaDepRecLoc.btLiquidar}" id="btLiquidar"
                            style="left: 527px; top: 312px; position: absolute; width: 120px" tabIndex="3" text="Generar Reporte"/>
                        <ui:label binding="#{ConsultaDepRecLoc.label1}" id="label1" style="position: absolute; left: 336px; top: 168px" text="Periodo"/>
                        <ui:label binding="#{ConsultaDepRecLoc.label2}" id="label2" style="height: 22px; left: 336px; top: 192px; position: absolute" text="Cuenta"/>
                        <ui:label binding="#{ConsultaDepRecLoc.label3}" id="label3" style="height: 22px; left: 336px; top: 264px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{ConsultaDepRecLoc.label4}" id="label4" style="height: 22px; left: 336px; top: 312px; position: absolute" text="Valor"/>
                        <ui:table augmentTitle="false" binding="#{ConsultaDepRecLoc.table1}" id="table1" paginateButton="true" paginationControls="true"
                            style="left: 360px; top: 360px; position: absolute; width: 843px" title="Depositos Recaudo Local" width="843">
                            <ui:tableRowGroup binding="#{ConsultaDepRecLoc.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="50"
                                sourceData="#{ConsultaDepRecLoc.trxsinidentificarDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn8}" headerText="Aprobar" id="tableColumn8">
                                    <ui:checkbox binding="#{ConsultaDepRecLoc.checkbox1}" id="checkbox1" selected="Aprobar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn13}" id="tableColumn13">
                                    <ui:button binding="#{ConsultaDepRecLoc.button1}" id="button1" text="Ajustar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn11}" headerText="BANCO" id="tableColumn11" sort="BANCO">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText11}" id="staticText11" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn12}" headerText="MUNICIPIO" id="tableColumn12" sort="MUNICIPIO">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText12}" id="staticText12" text="#{currentRow.value['MUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn2}" headerText="PERIODO" id="tableColumn2" sort="PERIODO">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText2}" id="staticText2" text="#{currentRow.value['PERIODO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn1}" headerText="CUENTA" id="tableColumn1" sort="CUENTA">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText1}" id="staticText1" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn3}" headerText="FECHATRX" id="tableColumn3" sort="FECHATRX">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText3}" id="staticText3" text="#{currentRow.value['FECHATRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn4}" headerText="DESCRIPCIONTRX" id="tableColumn4" sort="DESCRIPCIONTRX">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText4}" id="staticText4" text="#{currentRow.value['DESCRIPCIONTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn5}" headerText="VALORTRX" id="tableColumn5" sort="VALORTRX">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText5}" id="staticText5" text="#{currentRow.value['VALORTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn6}" headerText="OFICINAORIGEN" id="tableColumn6" sort="OFICINAORIGEN">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText6}" id="staticText6" text="#{currentRow.value['OFICINAORIGEN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn7}" headerText="INDTIPO" id="tableColumn7" sort="INDTIPO">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText7}" id="staticText7" text="#{currentRow.value['INDTIPO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn9}" headerText="P_CONSIGNADO" id="tableColumn9" sort="P_CONSIGNADO">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText9}" id="staticText9" text="#{currentRow.value['P_CONSIGNADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn15}" headerText="NOMBREESTADO" id="tableColumn15" sort="NOMBREESTADO">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText13}" id="staticText13" text="#{currentRow.value['NOMBREESTADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepRecLoc.tableColumn10}" headerText="NUMSECUENCIAREG" id="tableColumn10" sort="NUMSECUENCIAREG">
                                    <ui:staticText binding="#{ConsultaDepRecLoc.staticText10}" id="staticText10" text="#{currentRow.value['NUMSECUENCIAREG']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{ConsultaDepRecLoc.label5}" id="label5"
                            style="height: 22px; left: 336px; top: 288px; position: absolute; width: 46px" text="Estado"/>
                        <ui:dropDown binding="#{ConsultaDepRecLoc.ddPeriodo}" id="ddPeriodo"
                            items="#{ConsultaDepRecLoc.vw_periodotrfDataProvider.options['PERIODO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddPeriodo');" style="left: 480px; top: 168px; position: absolute; width: 144px" valueChangeListener="#{ConsultaDepRecLoc.ddPeriodo_processValueChange}"/>
                        <ui:dropDown binding="#{ConsultaDepRecLoc.ddCuenta}" id="ddCuenta"
                            items="#{ConsultaDepRecLoc.vw_cuentatrfDataProvider.options['CTA,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddCuenta');" style="left: 480px; top: 192px; position: absolute; width: 312px" valueChangeListener="#{ConsultaDepRecLoc.ddCuenta_processValueChange}"/>
                        <ui:dropDown binding="#{ConsultaDepRecLoc.ddMunicipio}" id="ddMunicipio"
                            items="#{ConsultaDepRecLoc.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 480px; top: 264px; position: absolute; width: 312px" valueChangeListener="#{ConsultaDepRecLoc.ddMunicipio_processValueChange}"/>
                        <ui:dropDown binding="#{ConsultaDepRecLoc.ddEstado}" id="ddEstado" items="#{ConsultaDepRecLoc.ddEstadoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddEstado');" style="left: 480px; top: 288px; position: absolute; width: 240px" valueChangeListener="#{ConsultaDepRecLoc.ddEstado_processValueChange}"/>
                        <ui:dropDown binding="#{ConsultaDepRecLoc.ddValor}" converter="#{ConsultaDepRecLoc.ddValorConverter}" id="ddValor"
                            items="#{ConsultaDepRecLoc.vw_valortrfDataProvider.options['VALORTRX,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddValor');" style="left: 480px; top: 312px; position: absolute; width: 240px" valueChangeListener="#{ConsultaDepRecLoc.ddValor_processValueChange}"/>
                        <ui:label binding="#{ConsultaDepRecLoc.label6}" id="label6" style="height: 22px; left: 336px; top: 216px; position: absolute" text="Concesionario Zonal"/>
                        <ui:dropDown binding="#{ConsultaDepRecLoc.ddCon}" id="ddCon"
                            items="#{ConsultaDepRecLoc.vw_concesionariotrfDataProvider.options['IDCON,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddCon');"
                            style="position: absolute; left: 480px; top: 216px; width: 288px; height: 24px" valueChangeListener="#{ConsultaDepRecLoc.ddCon_processValueChange}"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
