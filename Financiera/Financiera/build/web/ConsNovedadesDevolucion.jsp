<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadesDevolucion.page}" id="page">
            <ui:html binding="#{ConsNovedadesDevolucion.html}" id="html">
                <ui:head binding="#{ConsNovedadesDevolucion.head}" id="head">
                    <ui:link binding="#{ConsNovedadesDevolucion.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadesDevolucion.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadesDevolucion.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadesDevolucion.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 262px" text="Consulta Novedades Devolucion Usuario"/>
                        <ui:textField binding="#{ConsNovedadesDevolucion.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:dropDown binding="#{ConsNovedadesDevolucion.ddEstado}" id="ddEstado"
                            items="#{ConsNovedadesDevolucion.ddEstadoDefaultOptions.options}" onChange="common_timeoutSubmitForm(this.form, 'ddEstado');"
                            style="left: 432px; top: 168px; position: absolute; width: 168px" valueChangeListener="#{ConsNovedadesDevolucion.ddEstado_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesDevolucion.label1}" id="label1" style="left: 312px; top: 168px; position: absolute" text="Filtro por Estado"/>
                        <ui:table augmentTitle="false" binding="#{ConsNovedadesDevolucion.table1}" id="table1" paginateButton="true" paginationControls="true"
                            style="left: 336px; top: 264px; position: absolute; width: 480px" title="Novedades" width="427">
                            <ui:tableRowGroup binding="#{ConsNovedadesDevolucion.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="10"
                                sourceData="#{ConsNovedadesDevolucion.novmunicipioDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn2}" headerText="NOVEDAD" id="tableColumn2" sort="NOVEDAD">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.stNovedad}" id="stNovedad" text="#{currentRow.value['NOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn7}" headerText="IDENTIFICACION" id="tableColumn7" sort="IDENTIFICACION">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.staticText6}" id="staticText6" text="#{currentRow.value['IDENTIFICACION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn24}" headerText="Estado" id="tableColumn24" sort="ESTADONOV">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.staticText24}" id="staticText24" text="#{currentRow.value['ESTADONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn3}" headerText="NOMBRE" id="tableColumn3" sort="NOMBRE">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn19}" headerText="Fecha Nov" id="tableColumn19" sort="FECHANOV">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.staticText19}" id="staticText19" text="#{currentRow.value['FECHANOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn4}" headerText="Fecha Validada" id="tableColumn4" sort="FECHAVAL">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.staticText2}" id="staticText2" text="#{currentRow.value['FECHAVAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn5}" headerText="Fecha Activacion" id="tableColumn5" sort="FECHAACT">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.staticText4}" id="staticText4" text="#{currentRow.value['FECHAACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn6}" headerText="Fecha Anulacion" id="tableColumn6" sort="FECHAANUL">
                                    <ui:staticText binding="#{ConsNovedadesDevolucion.staticText5}" id="staticText5" text="#{currentRow.value['FECHAANUL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDevolucion.tableColumn39}" headerText="Detalle" id="tableColumn39">
                                    <ui:hyperlink action="#{ConsNovedadesDevolucion.hyperlink1_action}" binding="#{ConsNovedadesDevolucion.hyperlink1}"
                                        id="hyperlink1" text="Detalle"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{ConsNovedadesDevolucion.ddIdentificacion}" converter="#{ConsNovedadesDevolucion.ddIdentificacionConverter}"
                            id="ddIdentificacion" items="#{ConsNovedadesDevolucion.vw_identdevDataProvider.options['IDENTIFICACION,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddIdentificacion');"
                            style="left: 432px; top: 216px; position: absolute; width: 288px" tabIndex="24" valueChangeListener="#{ConsNovedadesDevolucion.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesDevolucion.label2}" id="label2" style="left: 312px; top: 216px; position: absolute" text="Identificacion"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ConsNovedadesDevolucion.page1}" id="page1"/>
    <ui:html binding="#{ConsNovedadesDevolucion.html1}" id="html1"/>
    <ui:head binding="#{ConsNovedadesDevolucion.head1}" id="head1"/>
</jsp:root>
