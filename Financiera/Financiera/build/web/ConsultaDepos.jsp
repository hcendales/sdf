<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsultaDepos.page1}" id="page1">
            <ui:html binding="#{ConsultaDepos.html1}" id="html1">
                <ui:head binding="#{ConsultaDepos.head1}" id="head1">
                    <ui:link binding="#{ConsultaDepos.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsultaDepos.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsultaDepos.form1}" id="form1" virtualFormsConfig="">
                        <div style="height: 120px; left: 48px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsultaDepos.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Consulta depositos Recaudo Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{ConsultaDepos.btReporte_action}" binding="#{ConsultaDepos.btReporte}" id="btReporte"
                            style="height: 24px; left: 335px; top: 384px; position: absolute; width: 144px" tabIndex="3" text="Generar Reporte"/>
                        <ui:label binding="#{ConsultaDepos.label1}" id="label1" style="left: 336px; top: 216px; position: absolute" text="Periodo"/>
                        <ui:label binding="#{ConsultaDepos.label2}" id="label2" style="height: 22px; left: 336px; top: 240px; position: absolute" text="Cuenta"/>
                        <ui:label binding="#{ConsultaDepos.label3}" id="label3" style="height: 22px; left: 336px; top: 264px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{ConsultaDepos.table1}" clearSortButton="true" id="table1" paginateButton="true"
                            paginationControls="true" sortPanelToggleButton="true" style="left: 288px; top: 432px; position: absolute; width: 1664px"
                            title="Depositos Recaudo Local" width="1664">
                            <ui:tableRowGroup binding="#{ConsultaDepos.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="50"
                                sourceData="#{ConsultaDepos.trxsinidentificarDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn1}" headerText="Registro" id="tableColumn1" sort="NUMSECUENCIAREG">
                                    <ui:staticText binding="#{ConsultaDepos.staticText1}" id="staticText1" text="#{currentRow.value['NUMSECUENCIAREG']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn11}" headerText="Banco" id="tableColumn11" sort="BANCO" width="146">
                                    <ui:staticText binding="#{ConsultaDepos.staticText11}" id="staticText11" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn12}" headerText="Cuenta" id="tableColumn12" sort="CUENTA">
                                    <ui:staticText binding="#{ConsultaDepos.staticText12}" id="staticText12" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn10}" headerText="Valor" id="tableColumn10" sort="VALORTRX">
                                    <ui:staticText binding="#{ConsultaDepos.staticText10}" id="staticText10" text="#{currentRow.value['VALORTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn13}" headerText="Periodo" id="tableColumn13" sort="PERIODO">
                                    <ui:staticText binding="#{ConsultaDepos.staticText13}" id="staticText13" text="#{currentRow.value['PERIODO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn14}" headerText="Fecha Trx" id="tableColumn14" sort="FECHATRX">
                                    <ui:staticText binding="#{ConsultaDepos.staticText14}" id="staticText14" text="#{currentRow.value['FECHATRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn15}" headerText="Descripcion" id="tableColumn15" sort="DESCRIPCIONTRX">
                                    <ui:staticText binding="#{ConsultaDepos.staticText15}" id="staticText15" text="#{currentRow.value['DESCRIPCIONTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn16}" headerText="Oficina" id="tableColumn16" sort="OFICINAORIGEN">
                                    <ui:staticText binding="#{ConsultaDepos.staticText16}" id="staticText16" text="#{currentRow.value['OFICINAORIGEN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn2}" headerText="ESTADO" id="tableColumn2" sort="ESTADO">
                                    <ui:staticText binding="#{ConsultaDepos.staticText2}" id="staticText2" text="#{currentRow.value['ESTADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn4}" headerText="Municipio Propuesto" id="tableColumn4">
                                    <ui:dropDown binding="#{ConsultaDepos.dropDown4}" disabled="true" id="dropDown4"
                                        items="#{ConsultaDepos.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIOACT']}" style="width: 192px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn6}" headerText="Tipo Propuesto" id="tableColumn6" sort="IDTIPOACT">
                                    <ui:staticText binding="#{ConsultaDepos.staticText6}" id="staticText6" text="#{currentRow.value['IDTIPOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn8}" headerText="Porcentaje Propuesto" id="tableColumn8" sort="PCONSIGNADOACT">
                                    <ui:staticText binding="#{ConsultaDepos.staticText8}" id="staticText8" text="#{currentRow.value['PCONSIGNADOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn17}" headerText="Municipio Asignado" id="tableColumn17" sort="IDMUNICIPIONEW">
                                    <ui:dropDown binding="#{ConsultaDepos.dropDown1}" disabled="true" id="dropDown1"
                                        items="#{ConsultaDepos.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIONEW']}" style="width: 240px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn5}" headerText="Tipo Asignado" id="tableColumn5" sort="INDTIPONEW">
                                    <ui:staticText binding="#{ConsultaDepos.staticText3}" id="staticText3" text="#{currentRow.value['INDTIPONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn7}" headerText="Porcentaje Asignado" id="tableColumn7">
                                    <ui:staticText binding="#{ConsultaDepos.staticText4}" id="staticText4" text="#{currentRow.value['PCONSIGNADONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsultaDepos.tableColumn9}" headerText="Observaciones" id="tableColumn9" sort="OBSERVACIONES">
                                    <ui:textField binding="#{ConsultaDepos.textField1}" disabled="true" id="textField1" text="#{currentRow.value['OBSERVACIONES']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{ConsultaDepos.label5}" id="label5" style="height: 22px; left: 336px; top: 168px; position: absolute; width: 46px" text="Estado"/>
                        <ui:dropDown binding="#{ConsultaDepos.ddPeriodo}" id="ddPeriodo"
                            items="#{ConsultaDepos.vw_periodotrfDataProvider.options['PERIODO,NOMBRE']}" onChange="" style="left: 480px; top: 216px; position: absolute; width: 144px"/>
                        <ui:dropDown binding="#{ConsultaDepos.ddCuenta}" id="ddCuenta" items="#{ConsultaDepos.vw_cuentatrfDataProvider.options['CTA,NOMBRE']}"
                            onChange="" style="left: 480px; top: 240px; position: absolute; width: 312px"/>
                        <ui:dropDown binding="#{ConsultaDepos.ddMunicipio}" id="ddMunicipio"
                            items="#{ConsultaDepos.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}" onChange=""
                            style="left: 480px; top: 264px; position: absolute; width: 312px" valueChangeListener="#{ConsultaDepos.ddMunicipio_processValueChange}"/>
                        <ui:dropDown binding="#{ConsultaDepos.ddEstado}" id="ddEstado" items="#{ConsultaDepos.ddEstadoDefaultOptions.options}" onChange="" style="left: 480px; top: 168px; position: absolute; width: 240px"/>
                        <ui:label binding="#{ConsultaDepos.label6}" id="label6" style="height: 22px; left: 336px; top: 144px; position: absolute" text="Concesionario Zonal"/>
                        <ui:dropDown binding="#{ConsultaDepos.ddCon}" id="ddCon"
                            items="#{ConsultaDepos.vw_concesionariotrfDataProvider.options['IDCON,NOMBRE']}" onChange="" style="height: 24px; left: 480px; top: 144px; position: absolute; width: 240px"/>
                        <ui:label binding="#{ConsultaDepos.label7}" id="label7" style="height: 22px; left: 504px; top: 384px; position: absolute; width: 46px" text="Formato"/>
                        <ui:dropDown binding="#{ConsultaDepos.dropDown5}" id="dropDown5" items="#{ConsultaDepos.dropDown5DefaultOptions.options}" style="height: 24px; left: 576px; top: 384px; position: absolute; width: 96px"/>
                        <ui:button action="#{ConsultaDepos.button1_action}" binding="#{ConsultaDepos.button1}" id="button1"
                            style="height: 24px; left: 504px; top: 336px; position: absolute; width: 143px" text="Consultar"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
