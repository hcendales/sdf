<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ReversarIdentificacion.page1}" id="page1">
            <ui:html binding="#{ReversarIdentificacion.html1}" id="html1">
                <ui:head binding="#{ReversarIdentificacion.head1}" id="head1">
                    <ui:link binding="#{ReversarIdentificacion.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ReversarIdentificacion.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ReversarIdentificacion.form1}" id="form1" virtualFormsConfig="">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ReversarIdentificacion.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Reversar depositos identificados"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ReversarIdentificacion.label1}" id="label1" style="left: 336px; top: 216px; position: absolute" text="Periodo"/>
                        <ui:label binding="#{ReversarIdentificacion.label2}" id="label2" style="height: 22px; left: 336px; top: 240px; position: absolute" text="Cuenta"/>
                        <ui:label binding="#{ReversarIdentificacion.label3}" id="label3" style="height: 22px; left: 336px; top: 264px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{ReversarIdentificacion.table1}" clearSortButton="true" deselectMultipleButton="true"
                            id="table1" paginateButton="true" paginationControls="true" selectMultipleButton="true" sortPanelToggleButton="true"
                            style="left: 336px; top: 480px; position: absolute; width: 1800px" title="Depositos Recaudo Local" width="1800">
                            <ui:tableRowGroup binding="#{ReversarIdentificacion.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="50"
                                sourceData="#{ReversarIdentificacion.trxsinidentificarDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn1}" headerText="Registro" id="tableColumn1" sort="NUMSECUENCIAREG">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText1}" id="staticText1" text="#{currentRow.value['NUMSECUENCIAREG']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn2}" headerText="Procesar" id="tableColumn2" selectId="checkbox1" sort="ACTUALIZAR">
                                    <ui:checkbox binding="#{ReversarIdentificacion.checkbox1}" disabled="true" id="checkbox1"
                                        selected="#{currentRow.value['ACTUALIZAR']}" selectedValue="1"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn10}" headerText="Valor" id="tableColumn10" sort="VALORTRX">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText10}" id="staticText10" text="#{currentRow.value['VALORTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn17}" headerText="Municipio Asignado" id="tableColumn17">
                                    <ui:dropDown binding="#{ReversarIdentificacion.dropDown1}" disabled="true" id="dropDown1"
                                        items="#{ReversarIdentificacion.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIONEW']}" style="width: 192px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn5}" headerText="Tipo Asignado" id="tableColumn5">
                                    <ui:dropDown binding="#{ReversarIdentificacion.dropDown2}" disabled="true" id="dropDown2"
                                        items="#{ReversarIdentificacion.vw_indtipoDataProvider.options['INDTIPO,INDTIPO']}" selected="#{currentRow.value['INDTIPONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn7}" headerText="Porcentaje Asignado" id="tableColumn7">
                                    <ui:dropDown binding="#{ReversarIdentificacion.dropDown3}" converter="#{ReversarIdentificacion.dropDown3Converter}"
                                        disabled="true" id="dropDown3" items="#{ReversarIdentificacion.vw_pconsigandoDataProvider.options['PORCENTAJE,NOMBRE']}" selected="#{currentRow.value['PCONSIGNADONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn11}" headerText="Banco" id="tableColumn11" sort="BANCO">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText11}" id="staticText11" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn12}" headerText="Cuenta" id="tableColumn12" sort="CUENTA">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText12}" id="staticText12" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn13}" headerText="Periodo" id="tableColumn13" sort="PERIODO">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText13}" id="staticText13" text="#{currentRow.value['PERIODO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn14}" headerText="Fecha Trx" id="tableColumn14" sort="FECHATRX">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText14}" id="staticText14" text="#{currentRow.value['FECHATRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn15}" headerText="Descripcion" id="tableColumn15" sort="DESCRIPCIONTRX">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText15}" id="staticText15" text="#{currentRow.value['DESCRIPCIONTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn16}" headerText="Oficina" id="tableColumn16" sort="OFICINAORIGEN">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText16}" id="staticText16" text="#{currentRow.value['OFICINAORIGEN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn4}" headerText="Municipio Propuesto" id="tableColumn4">
                                    <ui:dropDown binding="#{ReversarIdentificacion.dropDown4}" disabled="true" id="dropDown4"
                                        items="#{ReversarIdentificacion.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIOACT']}" style="width: 192px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn6}" headerText="Tipo Propuesto" id="tableColumn6" sort="IDTIPOACT">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText6}" id="staticText6" text="#{currentRow.value['IDTIPOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn8}" headerText="Porcentaje Propuesto" id="tableColumn8" sort="PCONSIGNADOACT">
                                    <ui:staticText binding="#{ReversarIdentificacion.staticText8}" id="staticText8" text="#{currentRow.value['PCONSIGNADOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ReversarIdentificacion.tableColumn9}" headerText="Observaciones" id="tableColumn9" sort="OBSERVACIONES">
                                    <ui:textField binding="#{ReversarIdentificacion.textField1}" disabled="true" id="textField1" text="#{currentRow.value['OBSERVACIONES']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{ReversarIdentificacion.label5}" id="label5"
                            style="height: 22px; left: 336px; top: 168px; position: absolute; width: 46px" text="Estado"/>
                        <ui:dropDown binding="#{ReversarIdentificacion.ddPeriodo}" id="ddPeriodo"
                            items="#{ReversarIdentificacion.vw_periodotrfDataProvider.options['PERIODO,NOMBRE']}" onChange="" style="left: 480px; top: 216px; position: absolute; width: 144px"/>
                        <ui:dropDown binding="#{ReversarIdentificacion.ddCuenta}" id="ddCuenta"
                            items="#{ReversarIdentificacion.vw_cuentatrfDataProvider.options['CTA,NOMBRE']}" onChange="" style="left: 480px; top: 240px; position: absolute; width: 312px"/>
                        <ui:dropDown binding="#{ReversarIdentificacion.ddMunicipio}" id="ddMunicipio"
                            items="#{ReversarIdentificacion.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}" onChange="" style="left: 480px; top: 264px; position: absolute; width: 312px"/>
                        <ui:dropDown binding="#{ReversarIdentificacion.ddEstado}" id="ddEstado" items="#{ReversarIdentificacion.ddEstadoDefaultOptions.options}"
                            onChange="" style="left: 480px; top: 168px; position: absolute; width: 240px"/>
                        <ui:label binding="#{ReversarIdentificacion.label6}" id="label6" style="height: 22px; left: 336px; top: 144px; position: absolute" text="Concesionario Zonal"/>
                        <ui:button action="#{ReversarIdentificacion.bsalvar_action}" binding="#{ReversarIdentificacion.bsalvar}" disabled="true" id="bsalvar"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea procesar los registros identificados ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;"
                            style="height: 24px; left: 503px; top: 408px; position: absolute; width: 144px" text="Procesar Cambios"/>
                        <ui:dropDown binding="#{ReversarIdentificacion.ddCon}" id="ddCon"
                            items="#{ReversarIdentificacion.vw_concesionariotrfDataProvider.options['IDCON,NOMBRE']}" onChange="" style="height: 24px; left: 480px; top: 144px; position: absolute; width: 240px"/>
                        <ui:button action="#{ReversarIdentificacion.biniIdentificar_action}" binding="#{ReversarIdentificacion.biniIdentificar}"
                            id="biniIdentificar" style="height: 24px; left: 335px; top: 408px; position: absolute; width: 144px" text="Iniciar Reverso"/>
                        <ui:button action="#{ReversarIdentificacion.bconsultar_action}" binding="#{ReversarIdentificacion.bconsultar}" id="bconsultar"
                            style="height: 24px; left: 479px; top: 360px; position: absolute; width: 144px" text="Consultar"/>
                        <ui:label binding="#{ReversarIdentificacion.label4}" id="label4"
                            style="height: 22px; left: 336px; top: 312px; position: absolute; width: 550px" text="Seleccionar el nuevo municipio o colocar sin municipio para reversar identificacion"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
