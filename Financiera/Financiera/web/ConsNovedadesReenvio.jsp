<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadesReenvio.page}" id="page">
            <ui:html binding="#{ConsNovedadesReenvio.html}" id="html">
                <ui:head binding="#{ConsNovedadesReenvio.head}" id="head">
                    <ui:link binding="#{ConsNovedadesReenvio.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadesReenvio.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadesReenvio.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadesReenvio.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 262px" text="Consulta Novedades Reenvio ACH"/>
                        <ui:textField binding="#{ConsNovedadesReenvio.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:dropDown binding="#{ConsNovedadesReenvio.ddEstado}" id="ddEstado" items="#{ConsNovedadesReenvio.ddEstadoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddEstado');" style="left: 432px; top: 168px; position: absolute; width: 168px" valueChangeListener="#{ConsNovedadesReenvio.ddEstado_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesReenvio.label1}" id="label1" style="left: 312px; top: 168px; position: absolute" text="Filtro por Estado"/>
                        <ui:table augmentTitle="false" binding="#{ConsNovedadesReenvio.table1}" id="table1"
                            style="left: 336px; top: 264px; position: absolute; width: 480px" title="Novedades" width="680">
                            <ui:tableRowGroup binding="#{ConsNovedadesReenvio.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="10"
                                sourceData="#{ConsNovedadesReenvio.novreenvioDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn2}" headerText="NOVEDAD" id="tableColumn2" sort="NOVEDAD">
                                    <ui:staticText binding="#{ConsNovedadesReenvio.stNovedad}" id="stNovedad" text="#{currentRow.value['NOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn14}" headerText="Estado" id="tableColumn14" sort="ESTADONOV">
                                    <ui:staticText binding="#{ConsNovedadesReenvio.staticText14}" id="staticText14" text="#{currentRow.value['ESTADONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn20}" headerText="Concepto" id="tableColumn20" sort="CONCEPTO">
                                    <ui:staticText binding="#{ConsNovedadesReenvio.staticText20}" id="staticText20" text="#{currentRow.value['CONCEPTO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn9}" headerText="Fecha Novedad" id="tableColumn9" sort="FECHANOV">
                                    <ui:staticText binding="#{ConsNovedadesReenvio.staticText9}" id="staticText9" text="#{currentRow.value['FECHANOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn12}" headerText="Fecha Validacion" id="tableColumn12" sort="FECHAVAL">
                                    <ui:staticText binding="#{ConsNovedadesReenvio.staticText12}" id="staticText12" text="#{currentRow.value['FECHAVAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn13}" headerText="Fecha Activacion" id="tableColumn13" sort="FECHAACT">
                                    <ui:staticText binding="#{ConsNovedadesReenvio.staticText13}" id="staticText13" text="#{currentRow.value['FECHAACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn16}" headerText="Fecha Anulacion" id="tableColumn16" sort="FECHAANUL">
                                    <ui:staticText binding="#{ConsNovedadesReenvio.staticText16}" id="staticText16" text="#{currentRow.value['FECHAANUL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesReenvio.tableColumn1}" headerText="Detalle" id="tableColumn1">
                                    <ui:hyperlink action="#{ConsNovedadesReenvio.hyperlink1_action}" binding="#{ConsNovedadesReenvio.hyperlink1}"
                                        id="hyperlink1" text="Detalle"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{ConsNovedadesReenvio.ddIdentificacion}" id="ddIdentificacion"
                            items="#{ConsNovedadesReenvio.vw_conceptonovreenDataProvider.options['CONCEPTO,CONCEPTO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddIdentificacion');"
                            style="left: 432px; top: 216px; position: absolute; width: 288px" tabIndex="24" valueChangeListener="#{ConsNovedadesReenvio.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesReenvio.label2}" id="label2" style="left: 312px; top: 216px; position: absolute" text="Concepto"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ConsNovedadesReenvio.page1}" id="page1"/>
    <ui:html binding="#{ConsNovedadesReenvio.html1}" id="html1"/>
    <ui:head binding="#{ConsNovedadesReenvio.head1}" id="head1"/>
</jsp:root>
