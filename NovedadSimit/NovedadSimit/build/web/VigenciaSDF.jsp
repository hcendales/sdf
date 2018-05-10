<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{VigenciaSDF.page1}" id="page1">
            <ui:html binding="#{VigenciaSDF.html1}" id="html1">
                <ui:head binding="#{VigenciaSDF.head1}" id="head1">
                    <ui:link binding="#{VigenciaSDF.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{VigenciaSDF.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{VigenciaSDF.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{VigenciaSDF.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Ajustar vigencia SDF"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{VigenciaSDF.btConsultar_action}" binding="#{VigenciaSDF.btConsultar}" id="btConsultar"
                            onClick="btActualizar_action()" style="height: 24px; left: 431px; top: 336px; position: absolute; width: 120px" tabIndex="4" text="Consultar"/>
                        <ui:label binding="#{VigenciaSDF.label1}" id="label1" style="position: absolute; left: 336px; top: 168px" text="Municipio"/>
                        <ui:label binding="#{VigenciaSDF.label2}" id="label2" style="left: 336px; top: 192px; position: absolute" text="Filtro Consulta"/>
                        <ui:dropDown binding="#{VigenciaSDF.ddMunicipio}" id="ddMunicipio"
                            items="#{VigenciaSDF.municipioDataProvider1.options['IDMUNICIPIO,NOMBRE']}" style="left: 456px; top: 168px; position: absolute; width: 408px"/>
                        <ui:dropDown binding="#{VigenciaSDF.ddFiltro}" id="ddFiltro" items="#{VigenciaSDF.ddFiltroDefaultOptions.options}" style="left: 456px; top: 192px; position: absolute; width: 288px"/>
                        <ui:tabSet binding="#{VigenciaSDF.tabSet1}" id="tabSet1" selected="tab1" style="left: 288px; top: 384px; position: absolute">
                            <ui:tab binding="#{VigenciaSDF.tab1}" id="tab1" text="Transferencias">
                                <ui:panelLayout binding="#{VigenciaSDF.layoutPanel1}" id="layoutPanel1" style="height: 269px; width: 597px">
                                    <ui:table augmentTitle="false" binding="#{VigenciaSDF.table1}" clearSortButton="true" deselectMultipleButton="true"
                                        id="table1" paginateButton="true" paginationControls="true" selectMultipleButton="true" sortPanelToggleButton="true"
                                        style="left: 24px; top: 24px; position: absolute; width: 764px" title="Transferencias SDF" width="764">
                                        <ui:tableRowGroup binding="#{VigenciaSDF.tableRowGroup1}" emptyDataMsg="No hay informacion" id="tableRowGroup1"
                                            rows="10" sourceData="#{VigenciaSDF.transferencias_sdfDataProvider}" sourceVar="currentRow">
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn1}" id="tableColumn1" selectId="checkbox1">
                                                <ui:checkbox binding="#{VigenciaSDF.checkbox1}" id="checkbox1" selected="#{currentRow.value['ACTUALIZAR']}" selectedValue="1"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn2}" headerText="CTA_RECAUDO" id="tableColumn2" sort="CTA_RECAUDO">
                                                <ui:staticText binding="#{VigenciaSDF.stCta1}" id="stCta1" text="#{currentRow.value['CTA_RECAUDO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn3}" headerText="INDTIPO" id="tableColumn3" sort="INDTIPO">
                                                <ui:staticText binding="#{VigenciaSDF.stindTipo1}" id="stindTipo1" text="#{currentRow.value['INDTIPO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn4}" headerText="FEC_CORTE" id="tableColumn4" sort="FEC_CORTE">
                                                <ui:staticText binding="#{VigenciaSDF.stFecCorte1}" id="stFecCorte1" text="#{currentRow.value['FEC_CORTE']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn5}" headerText="FEC_TRAN" id="tableColumn5" sort="FEC_TRAN">
                                                <ui:staticText binding="#{VigenciaSDF.stFecTran1}" id="stFecTran1" text="#{currentRow.value['FEC_TRAN']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn6}" headerText="VALOR_TOTAL" id="tableColumn6" sort="VALOR_TOTAL">
                                                <ui:staticText binding="#{VigenciaSDF.stValor1}" id="stValor1" text="#{currentRow.value['VALOR_TOTAL']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn7}" headerText="IDMUNICIPIO" id="tableColumn7">
                                                <ui:dropDown binding="#{VigenciaSDF.stIdMunicipio1}" disabled="true" id="stIdMunicipio1"
                                                    items="#{VigenciaSDF.municipioDataProvider1.options['IDMUNICIPIO,NOMBRE']}" selected="#{currentRow.value['IDMUNICIPIO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn8}" headerText="INDORIGEN" id="tableColumn8" sort="INDORIGEN">
                                                <ui:staticText binding="#{VigenciaSDF.stIndOrigen1}" id="stIndOrigen1" text="#{currentRow.value['INDORIGEN']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn9}" headerText="VIGENCIA" id="tableColumn9" sort="VIGENCIA">
                                                <ui:staticText binding="#{VigenciaSDF.stVigencia1}" id="stVigencia1" text="#{currentRow.value['VIGENCIA']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn10}" headerText="FECHAINICIO" id="tableColumn10" sort="FECHAINICIO">
                                                <ui:staticText binding="#{VigenciaSDF.stFecIni1}" id="stFecIni1" text="#{currentRow.value['FECHAINICIO']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn11}" headerText="FECHAFIN" id="tableColumn11" sort="FECHAFIN">
                                                <ui:staticText binding="#{VigenciaSDF.stFecFin1}" id="stFecFin1" text="#{currentRow.value['FECHAFIN']}"/>
                                            </ui:tableColumn>
                                            <ui:tableColumn binding="#{VigenciaSDF.tableColumn12}" headerText="IDREG" id="tableColumn12" sort="IDRECAUDO_LOCAL_LIQUIDACION">
                                                <ui:staticText binding="#{VigenciaSDF.stIdReg1}" id="stIdReg1" text="#{currentRow.value['IDRECAUDO_LOCAL_LIQUIDACION']}"/>
                                            </ui:tableColumn>
                                        </ui:tableRowGroup>
                                    </ui:table>
                                </ui:panelLayout>
                            </ui:tab>
                            <ui:tab action="#{VigenciaSDF.tab2_action}" binding="#{VigenciaSDF.tab2}" id="tab2" text="Actualizar Vigencia">
                                <ui:panelLayout binding="#{VigenciaSDF.layoutPanel2}" id="layoutPanel2" style="height: 271px; position: relative; width: 695px; -rave-layout: grid">
                                    <ui:button action="#{VigenciaSDF.bmodificar_action}" binding="#{VigenciaSDF.bmodificar1}" id="bmodificar1"
                                        onClick="btActualizar_action()" style="height: 24px; left: 479px; top: 48px; position: absolute; width: 96px"
                                        tabIndex="4" text="Modificar"/>
                                    <ui:label binding="#{VigenciaSDF.label4}" id="label4" style="left: 24px; top: 96px; position: absolute; width: 118px" text="Fecha Fin vigencia"/>
                                    <ui:label binding="#{VigenciaSDF.label7}" id="label7" style="left: 24px; top: 48px; position: absolute" text="Fecha Inicio vigencia"/>
                                    <ui:calendar binding="#{VigenciaSDF.cfecFin}" dateFormatPattern="yyyy-MM-dd" id="cfecFin" style="left: 168px; top: 96px; position: absolute"/>
                                    <ui:calendar binding="#{VigenciaSDF.cfecIni}" dateFormatPattern="yyyy-MM-dd" id="cfecIni" style="left: 168px; top: 48px; position: absolute"/>
                                </ui:panelLayout>
                            </ui:tab>
                        </ui:tabSet>
                        <ui:calendar binding="#{VigenciaSDF.cfecCorIni}" dateFormatPattern="yyyy-MM-dd" id="cfecCorIni" style="left: 456px; top: 216px; position: absolute"/>
                        <ui:label binding="#{VigenciaSDF.lfecCorIni}" id="lfecCorIni" style="left: 336px; top: 216px; position: absolute" text="Fecha Corte Inicial"/>
                        <ui:label binding="#{VigenciaSDF.lfecCorFin}" id="lfecCorFin" style="left: 336px; top: 264px; position: absolute" text="Fecha Corte Inicial"/>
                        <ui:calendar binding="#{VigenciaSDF.cfecCorFin}" dateFormatPattern="yyyy-MM-dd" id="cfecCorFin" style="left: 456px; top: 264px; position: absolute"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
