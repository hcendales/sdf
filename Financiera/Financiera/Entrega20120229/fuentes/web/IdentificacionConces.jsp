<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{IdentificacionConces.page1}" id="page1">
            <ui:html binding="#{IdentificacionConces.html1}" id="html1">
                <ui:head binding="#{IdentificacionConces.head1}" id="head1">
                    <ui:link binding="#{IdentificacionConces.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{IdentificacionConces.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{IdentificacionConces.form1}" id="form1" virtualFormsConfig="">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{IdentificacionConces.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Identificacion depositos Concesionario"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{IdentificacionConces.btReporte_action}" binding="#{IdentificacionConces.btReporte}" id="btReporte"
                            style="height: 24px; left: 815px; top: 360px; position: absolute; width: 144px" tabIndex="3" text="Generar Reporte"/>
                        <ui:label binding="#{IdentificacionConces.label1}" id="label1" style="left: 336px; top: 216px; position: absolute" text="Periodo"/>
                        <ui:label binding="#{IdentificacionConces.label2}" id="label2" style="height: 22px; left: 336px; top: 240px; position: absolute" text="Cuenta"/>
                        <ui:label binding="#{IdentificacionConces.label3}" id="label3" style="height: 22px; left: 336px; top: 264px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{IdentificacionConces.label4}" id="label4" style="height: 22px; left: 336px; top: 288px; position: absolute" text="Valor"/>
                        <ui:table augmentTitle="false" binding="#{IdentificacionConces.table1}" clearSortButton="true" id="table1" paginateButton="true"
                            paginationControls="true" sortPanelToggleButton="true" style="left: 336px; top: 432px; position: absolute; width: 1800px"
                            title="Depositos Recaudo Local" width="1800">
                            <ui:tableRowGroup binding="#{IdentificacionConces.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="10"
                                sourceData="#{IdentificacionConces.trxsinidentificarDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn1}" headerText="NUMSECUENCIAREG" id="tableColumn1"
                                    sort="NUMSECUENCIAREG" visible="false">
                                    <ui:staticText binding="#{IdentificacionConces.staticText1}" id="staticText1" text="#{currentRow.value['NUMSECUENCIAREG']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn2}" headerText="Procesar" id="tableColumn2" sort="ACTUALIZAR">
                                    <ui:checkbox binding="#{IdentificacionConces.checkbox1}" disabled="true" id="checkbox1"
                                        selected="#{currentRow.value['ACTUALIZAR']}" selectedValue="1"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn9}" headerText="Observaciones" id="tableColumn9" sort="OBSERVACIONES">
                                    <ui:textField binding="#{IdentificacionConces.textField1}" disabled="true" id="textField1" style="width: 168px" text="#{currentRow.value['OBSERVACIONES']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn17}" headerText="Municipio Asignado" id="tableColumn17" sort="tableColumn17">
                                    <ui:dropDown binding="#{IdentificacionConces.dropDown1}" disabled="true" id="dropDown1"
                                        items="#{IdentificacionConces.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIONEW']}" style="width: 240px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn4}" headerText="Municipio Propuesto" id="tableColumn4">
                                    <ui:dropDown binding="#{IdentificacionConces.dropDown4}" disabled="true" id="dropDown4"
                                        items="#{IdentificacionConces.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                                        selected="#{currentRow.value['IDMUNICIPIOACT']}" style="width: 192px"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn5}" headerText="Tipo Asignado" id="tableColumn5">
                                    <ui:dropDown binding="#{IdentificacionConces.dropDown2}" disabled="true" id="dropDown2"
                                        items="#{IdentificacionConces.vw_indtipoDataProvider.options['INDTIPO,INDTIPO']}" selected="#{currentRow.value['INDTIPONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn6}" headerText="Tipo Propuesto" id="tableColumn6" sort="IDTIPOACT">
                                    <ui:staticText binding="#{IdentificacionConces.staticText6}" id="staticText6" text="#{currentRow.value['IDTIPOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn7}" headerText="Porcentaje Asignado" id="tableColumn7">
                                    <ui:dropDown binding="#{IdentificacionConces.dropDown3}" converter="#{IdentificacionConces.dropDown3Converter}"
                                        disabled="true" id="dropDown3" items="#{IdentificacionConces.vw_pconsigandoDataProvider.options['PORCENTAJE,NOMBRE']}" selected="#{currentRow.value['PCONSIGNADONEW']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn8}" headerText="Porcentaje Propuesto" id="tableColumn8" sort="PCONSIGNADOACT">
                                    <ui:staticText binding="#{IdentificacionConces.staticText8}" id="staticText8" text="#{currentRow.value['PCONSIGNADOACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn10}" headerText="Valor" id="tableColumn10" sort="VALORTRX">
                                    <ui:staticText binding="#{IdentificacionConces.staticText10}" id="staticText10" text="#{currentRow.value['VALORTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn11}" headerText="Banco" id="tableColumn11" sort="BANCO">
                                    <ui:staticText binding="#{IdentificacionConces.staticText11}" id="staticText11" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn12}" headerText="Cuenta" id="tableColumn12" sort="CUENTA">
                                    <ui:staticText binding="#{IdentificacionConces.staticText12}" id="staticText12" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn13}" headerText="Periodo" id="tableColumn13" sort="PERIODO">
                                    <ui:staticText binding="#{IdentificacionConces.staticText13}" id="staticText13" text="#{currentRow.value['PERIODO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn14}" headerText="Fecha Trx" id="tableColumn14" sort="FECHATRX">
                                    <ui:staticText binding="#{IdentificacionConces.staticText14}" id="staticText14" text="#{currentRow.value['FECHATRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn15}" headerText="Descripcion" id="tableColumn15" sort="DESCRIPCIONTRX">
                                    <ui:staticText binding="#{IdentificacionConces.staticText15}" id="staticText15" text="#{currentRow.value['DESCRIPCIONTRX']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificacionConces.tableColumn16}" headerText="Oficina" id="tableColumn16" sort="OFICINAORIGEN">
                                    <ui:staticText binding="#{IdentificacionConces.staticText16}" id="staticText16" text="#{currentRow.value['OFICINAORIGEN']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{IdentificacionConces.label5}" id="label5"
                            style="height: 22px; left: 336px; top: 168px; position: absolute; width: 46px" text="Estado"/>
                        <ui:dropDown binding="#{IdentificacionConces.ddPeriodo}" id="ddPeriodo"
                            items="#{IdentificacionConces.vw_periodotrfDataProvider.options['PERIODO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddPeriodo');" style="left: 480px; top: 216px; position: absolute; width: 144px" valueChangeListener="#{IdentificacionConces.ddPeriodo_processValueChange}"/>
                        <ui:dropDown binding="#{IdentificacionConces.ddCuenta}" id="ddCuenta"
                            items="#{IdentificacionConces.vw_cuentatrfDataProvider.options['CTA,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddCuenta');" style="left: 480px; top: 240px; position: absolute; width: 312px" valueChangeListener="#{IdentificacionConces.ddCuenta_processValueChange}"/>
                        <ui:dropDown binding="#{IdentificacionConces.ddMunicipio}" id="ddMunicipio"
                            items="#{IdentificacionConces.vw_municipiotrfDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 480px; top: 264px; position: absolute; width: 312px" valueChangeListener="#{IdentificacionConces.ddMunicipio_processValueChange}"/>
                        <ui:dropDown binding="#{IdentificacionConces.ddEstado}" id="ddEstado" items="#{IdentificacionConces.ddEstadoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddEstado');" style="left: 480px; top: 168px; position: absolute; width: 240px" valueChangeListener="#{IdentificacionConces.ddEstado_processValueChange}"/>
                        <ui:dropDown binding="#{IdentificacionConces.ddValor}" converter="#{IdentificacionConces.ddValorConverter}" id="ddValor"
                            items="#{IdentificacionConces.vw_valortrfDataProvider.options['VALORTRX,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddValor');" style="left: 480px; top: 288px; position: absolute; width: 240px" valueChangeListener="#{IdentificacionConces.ddValor_processValueChange}"/>
                        <ui:label binding="#{IdentificacionConces.label6}" id="label6" style="height: 22px; left: 336px; top: 144px; position: absolute" text="Concesionario Zonal"/>
                        <ui:button action="#{IdentificacionConces.bsalvar_action}" binding="#{IdentificacionConces.bsalvar}" disabled="true" id="bsalvar"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea procesar los registros identificados ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;"
                            style="height: 24px; left: 647px; top: 360px; position: absolute; width: 144px" text="Procesar Cambios"/>
                        <ui:dropDown binding="#{IdentificacionConces.ddCon}" id="ddCon" items="#{IdentificacionConces.ddConDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddCon');"
                            style="height: 24px; left: 480px; top: 144px; position: absolute; width: 240px" valueChangeListener="#{IdentificacionConces.ddCon_processValueChange}"/>
                        <ui:button action="#{IdentificacionConces.biniIdentificar_action}" binding="#{IdentificacionConces.biniIdentificar}"
                            id="biniIdentificar" style="height: 24px; left: 479px; top: 360px; position: absolute; width: 144px" text="Iniciar Identificacion"/>
                        <ui:dropDown binding="#{IdentificacionConces.dropDown5}" id="dropDown5" items="#{IdentificacionConces.dropDown5DefaultOptions.options}" style="height: 24px; left: 984px; top: 360px; position: absolute; width: 120px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
