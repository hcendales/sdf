<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadesDiasDispersion.page}" id="page">
            <ui:html binding="#{ConsNovedadesDiasDispersion.html}" id="html">
                <ui:head binding="#{ConsNovedadesDiasDispersion.head}" id="head">
                    <ui:link binding="#{ConsNovedadesDiasDispersion.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadesDiasDispersion.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadesDiasDispersion.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadesDiasDispersion.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 310px" text="Consulta Novedades Dias Dispersión General"/>
                        <ui:textField binding="#{ConsNovedadesDiasDispersion.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:table augmentTitle="false" binding="#{ConsNovedadesDiasDispersion.table}" id="table"
                            style="left: 288px; top: 288px; position: absolute" title="Novedades" width="897">
                            <ui:tableRowGroup binding="#{ConsNovedadesDiasDispersion.tableRowGroup}" id="tableRowGroup" rows="10"
                                sourceData="#{ConsNovedadesDiasDispersion.novdias_dispersionDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn9}" headerText="NOVEDAD" id="tableColumn9" sort="NOVEDAD" width="107">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.stNovedad}" id="stNovedad" text="#{currentRow.value['NOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn7}" headerText="Estado" id="tableColumn7" sort="ESTADONOV" width="89">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.staticText7}" id="staticText7" text="#{currentRow.value['ESTADONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn3}" headerText="Municipio" id="tableColumn3" sort="MUNICIPIO" width="200">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.staticText3}" id="staticText3" text="#{currentRow.value['MUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn1}" headerText="Fecha Novedad" id="tableColumn1" sort="FECHANOV">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.staticText1}" id="staticText1" text="#{currentRow.value['FECHANOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn5}" headerText="Fecha Validación" id="tableColumn5" sort="FECHAVAL">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.staticText5}" id="staticText5" text="#{currentRow.value['FECHAVAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn6}" headerText="Fecha Activación" id="tableColumn6" sort="FECHAACT">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.staticText6}" id="staticText6" text="#{currentRow.value['FECHAACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn2}" headerText="Fecha Anulacion" id="tableColumn2" sort="FECHAANUL">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.staticText2}" id="staticText2" text="#{currentRow.value['FECHAANUL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn4}" headerText="Banco" id="tableColumn4" sort="BANCO" width="200">
                                    <ui:staticText binding="#{ConsNovedadesDiasDispersion.staticText4}" id="staticText4" text="#{currentRow.value['BANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesDiasDispersion.tableColumn8}" id="tableColumn8">
                                    <ui:hyperlink action="#{ConsNovedadesDiasDispersion.hyperlink1_action}" binding="#{ConsNovedadesDiasDispersion.hyperlink1}"
                                        id="hyperlink1" text="Detalle"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{ConsNovedadesDiasDispersion.ddEstado}" id="ddEstado"
                            items="#{ConsNovedadesDiasDispersion.ddEstadoDefaultOptions.options}" onChange="common_timeoutSubmitForm(this.form, 'ddEstado');"
                            style="left: 432px; top: 168px; position: absolute; width: 168px" valueChangeListener="#{ConsNovedadesDiasDispersion.ddEstado_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesDiasDispersion.label1}" id="label1" style="left: 312px; top: 168px; position: absolute" text="Filtro por Estado"/>
                        <ui:dropDown binding="#{ConsNovedadesDiasDispersion.ddMunicipio}" id="ddMunicipio"
                            items="#{ConsNovedadesDiasDispersion.municipioDataProvider1.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 432px; top: 216px; position: absolute; width: 288px"
                            tabIndex="24" valueChangeListener="#{ConsNovedadesDiasDispersion.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesDiasDispersion.label2}" id="label2" style="left: 312px; top: 216px; position: absolute" text="Municipio"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ConsNovedadesDiasDispersion.page1}" id="page1"/>
    <ui:html binding="#{ConsNovedadesDiasDispersion.html1}" id="html1"/>
    <ui:head binding="#{ConsNovedadesDiasDispersion.head1}" id="head1"/>
</jsp:root>
