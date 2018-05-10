<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadesMunicipio.page}" id="page">
            <ui:html binding="#{ConsNovedadesMunicipio.html}" id="html">
                <ui:head binding="#{ConsNovedadesMunicipio.head}" id="head">
                    <ui:link binding="#{ConsNovedadesMunicipio.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadesMunicipio.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadesMunicipio.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadesMunicipio.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 262px" text="Consulta Novedades Municipio"/>
                        <ui:textField binding="#{ConsNovedadesMunicipio.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:dropDown binding="#{ConsNovedadesMunicipio.ddEstado}" id="ddEstado" items="#{ConsNovedadesMunicipio.ddEstadoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddEstado');" style="left: 432px; top: 168px; position: absolute; width: 168px" valueChangeListener="#{ConsNovedadesMunicipio.ddEstado_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesMunicipio.label1}" id="label1" style="left: 312px; top: 168px; position: absolute" text="Filtro por Estado"/>
                        <ui:table augmentTitle="false" binding="#{ConsNovedadesMunicipio.table1}" id="table1" paginateButton="true" paginationControls="true"
                            style="left: 336px; top: 264px; position: absolute; width: 480px" title="Novedades" width="480">
                            <ui:tableRowGroup binding="#{ConsNovedadesMunicipio.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="10"
                                sourceData="#{ConsNovedadesMunicipio.novmunicipioDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn2}" headerText="NOVEDAD" id="tableColumn2" sort="NOVEDAD">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.stNovedad}" id="stNovedad" text="#{currentRow.value['NOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn24}" headerText="Estado" id="tableColumn24" sort="ESTADONOV">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.staticText24}" id="staticText24" text="#{currentRow.value['ESTADONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn1}" headerText="IDMUNICIPIO" id="tableColumn1" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.staticText1}" id="staticText1" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn3}" headerText="NOMBRE" id="tableColumn3" sort="NOMBRE">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn19}" headerText="Fecha Nov" id="tableColumn19" sort="FECHANOV">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.staticText19}" id="staticText19" text="#{currentRow.value['FECHANOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn4}" headerText="Fecha Validada" id="tableColumn4" sort="FECHAVAL">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.staticText2}" id="staticText2" text="#{currentRow.value['FECHAVAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn5}" headerText="Fecha Activacion" id="tableColumn5" sort="FECHAACT">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.staticText4}" id="staticText4" text="#{currentRow.value['FECHAACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn6}" headerText="Fecha Anulacion" id="tableColumn6" sort="FECHAANUL">
                                    <ui:staticText binding="#{ConsNovedadesMunicipio.staticText5}" id="staticText5" text="#{currentRow.value['FECHAANUL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesMunicipio.tableColumn39}" headerText="Detalle" id="tableColumn39">
                                    <ui:hyperlink action="#{ConsNovedadesMunicipio.hyperlink1_action}" binding="#{ConsNovedadesMunicipio.hyperlink1}"
                                        id="hyperlink1" text="Detalle"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{ConsNovedadesMunicipio.ddMunicipio1}" id="ddMunicipio1"
                            items="#{ConsNovedadesMunicipio.municipioDataProvider1.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio1');" style="left: 432px; top: 216px; position: absolute; width: 288px"
                            tabIndex="24" valueChangeListener="#{ConsNovedadesMunicipio.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesMunicipio.label2}" id="label2" style="left: 350px; top: 216px; position: absolute" text="Municipio"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ConsNovedadesMunicipio.page1}" id="page1"/>
    <ui:html binding="#{ConsNovedadesMunicipio.html1}" id="html1"/>
    <ui:head binding="#{ConsNovedadesMunicipio.head1}" id="head1"/>
</jsp:root>
