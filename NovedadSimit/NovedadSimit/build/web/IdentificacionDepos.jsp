<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{IdentificacionDepos.page1}" id="page1">
            <ui:html binding="#{IdentificacionDepos.html1}" id="html1">
                <ui:head binding="#{IdentificacionDepos.head1}" id="head1">
                    <ui:link binding="#{IdentificacionDepos.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{IdentificacionDepos.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{IdentificacionDepos.form1}" id="form1" virtualFormsConfig="">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{IdentificacionDepos.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Identificacion depositos Concesionario"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{IdentificacionDepos.btReporte_action}" binding="#{IdentificacionDepos.btReporte}" id="btReporte"
                            style="height: 24px; left: 671px; top: 384px; position: absolute; width: 144px" tabIndex="3" text="Generar Reporte"/>
                        <ui:label binding="#{IdentificacionDepos.label1}" id="label1" style="left: 336px; top: 216px; position: absolute" text="Periodo"/>
                        <ui:label binding="#{IdentificacionDepos.label2}" id="label2" style="height: 22px; left: 336px; top: 240px; position: absolute" text="Cuenta"/>
                        <ui:label binding="#{IdentificacionDepos.label3}" id="label3" style="height: 22px; left: 336px; top: 264px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{IdentificacionDepos.table1}" clearSortButton="true" deselectMultipleButton="true" id="table1"
                            paginateButton="true" paginationControls="true" selectMultipleButton="true" sortPanelToggleButton="true"
                            style="left: 288px; top: 432px; position: absolute; width: 1800px" title="Depositos Recaudo Local" width="1800">
                            <ui:tableRowGroup binding="#{IdentificacionDepos.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="50"
                                sourceData="#{IdentificacionDepos.trxsinidentificarDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn1}" headerText="Registro" id="tableColumn1" sort="NUMSECUENCIAREG">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText1}" id="staticText1" text="#{currentRow.value['NUMSECUENCIAREG']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn2}" headerText="Procesar" id="tableColumn2" selectId="checkbox1" sort="ACTUALIZAR">
                                    <ui:checkbox binding="#{IdentificacionDepos.checkbox1}" disabled="true" id="checkbox1"
                                        selected="#{currentRow.value['ACTUALIZAR']}" selectedValue="1"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn10}" headerText="Valor" id="tableColumn10" sort="VALORTRX">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText10}" id="staticText10" text="#{currentRow.value['VALORTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn17}" headerText="Municipio Asignado" id="tableColumn17">
                                    <ui:dropDown binding="#{IdentificacionDepos.dropDown1}" disabled="true" id="dropDown1"
                                        items="#{IdentificacionDepos.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIONEW']}" style="width: 192px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn5}" headerText="Tipo Asignado" id="tableColumn5">
                                    <ui:dropDown binding="#{IdentificacionDepos.dropDown2}" disabled="true" id="dropDown2"
                                        items="#{IdentificacionDepos.vw_indtipoDataProvider.options['INDTIPO,INDTIPO']}" selected="#{currentRow.value['INDTIPONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn7}" headerText="Porcentaje Asignado" id="tableColumn7">
                                    <ui:dropDown binding="#{IdentificacionDepos.dropDown3}" converter="#{IdentificacionDepos.dropDown3Converter}"
                                        disabled="true" id="dropDown3" items="#{IdentificacionDepos.vw_pconsigandoDataProvider.options['PORCENTAJE,NOMBRE']}" selected="#{currentRow.value['PCONSIGNADONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn11}" headerText="Banco" id="tableColumn11" sort="BANCO">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText11}" id="staticText11" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn12}" headerText="Cuenta" id="tableColumn12" sort="CUENTA">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText12}" id="staticText12" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn13}" headerText="Periodo" id="tableColumn13" sort="PERIODO">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText13}" id="staticText13" text="#{currentRow.value['PERIODO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn14}" headerText="Fecha Trx" id="tableColumn14" sort="FECHATRX">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText14}" id="staticText14" text="#{currentRow.value['FECHATRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn15}" headerText="Descripcion" id="tableColumn15" sort="DESCRIPCIONTRX">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText15}" id="staticText15" text="#{currentRow.value['DESCRIPCIONTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn16}" headerText="Oficina" id="tableColumn16" sort="OFICINAORIGEN">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText16}" id="staticText16" text="#{currentRow.value['OFICINAORIGEN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn4}" headerText="Municipio Propuesto" id="tableColumn4">
                                    <ui:dropDown binding="#{IdentificacionDepos.dropDown4}" disabled="true" id="dropDown4"
                                        items="#{IdentificacionDepos.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIOACT']}" style="width: 192px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn6}" headerText="Tipo Propuesto" id="tableColumn6" sort="IDTIPOACT">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText6}" id="staticText6" text="#{currentRow.value['IDTIPOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn8}" headerText="Porcentaje Propuesto" id="tableColumn8" sort="PCONSIGNADOACT">
                                    <ui:staticText binding="#{IdentificacionDepos.staticText8}" id="staticText8" text="#{currentRow.value['PCONSIGNADOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionDepos.tableColumn9}" headerText="Observaciones" id="tableColumn9" sort="OBSERVACIONES">
                                    <ui:textField binding="#{IdentificacionDepos.textField1}" disabled="true" id="textField1" text="#{currentRow.value['OBSERVACIONES']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{IdentificacionDepos.ddCuenta}" id="ddCuenta"
                            items="#{IdentificacionDepos.vw_cuentatrfDataProvider.options['CTA,NOMBRE']}" onChange="" style="left: 480px; top: 240px; position: absolute; width: 312px"/>
                        <ui:dropDown binding="#{IdentificacionDepos.ddMunicipio}" id="ddMunicipio"
                            items="#{IdentificacionDepos.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}" onChange="" style="left: 480px; top: 264px; position: absolute; width: 312px"/>
                        <ui:button action="#{IdentificacionDepos.bsalvar_action}" binding="#{IdentificacionDepos.bsalvar}" disabled="true" id="bsalvar"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea procesar los registros identificados ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;"
                            style="height: 24px; left: 503px; top: 384px; position: absolute; width: 144px" text="Procesar Cambios"/>
                        <ui:button action="#{IdentificacionDepos.biniIdentificar_action}" binding="#{IdentificacionDepos.biniIdentificar}" id="biniIdentificar"
                            style="height: 24px; left: 335px; top: 384px; position: absolute; width: 144px" text="Iniciar Identificacion"/>
                        <ui:label binding="#{IdentificacionDepos.label7}" id="label7"
                            style="height: 22px; left: 840px; top: 384px; position: absolute; width: 46px" text="Formato"/>
                        <ui:dropDown binding="#{IdentificacionDepos.dropDown5}" id="dropDown5" items="#{IdentificacionDepos.dropDown5DefaultOptions.options}" style="height: 24px; left: 912px; top: 384px; position: absolute; width: 96px"/>
                        <ui:button action="#{IdentificacionDepos.bconsultar_action}" binding="#{IdentificacionDepos.bconsultar}" id="bconsultar"
                            style="height: 24px; left: 479px; top: 336px; position: absolute; width: 144px" text="Consultar"/>
                        <ui:dropDown binding="#{IdentificacionDepos.ddPeriodo}" id="ddPeriodo" items="#{IdentificacionDepos.ddPeriodoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddPeriodo');" style="left: 480px; top: 216px; position: absolute; width: 120px" tabIndex="1"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
