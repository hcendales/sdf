<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadesTercero.page}" id="page">
            <ui:html binding="#{ConsNovedadesTercero.html}" id="html">
                <ui:head binding="#{ConsNovedadesTercero.head}" id="head">
                    <ui:link binding="#{ConsNovedadesTercero.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadesTercero.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadesTercero.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadesTercero.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 262px" text="Consulta Novedades Tercero"/>
                        <ui:textField binding="#{ConsNovedadesTercero.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:table augmentTitle="false" binding="#{ConsNovedadesTercero.table}" id="table"
                            style="left: 288px; top: 288px; position: absolute; width: 860px" title="Novedades" width="860">
                            <ui:tableRowGroup binding="#{ConsNovedadesTercero.tableRowGroup}" id="tableRowGroup" rows="10"
                                sourceData="#{ConsNovedadesTercero.novterceroDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn9}" headerText="Novedad" id="tableColumn9" sort="NOVEDAD" width="150">
                                    <ui:staticText binding="#{ConsNovedadesTercero.stNovedad}" id="stNovedad" text="#{currentRow.value['NOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn7}" headerText="Estado" id="tableColumn7" sort="ESTADONOV">
                                    <ui:staticText binding="#{ConsNovedadesTercero.staticText7}" id="staticText7" text="#{currentRow.value['ESTADONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn3}" headerText="Municipio" id="tableColumn3" sort="IDMUNICIPIO" width="200">
                                    <ui:staticText binding="#{ConsNovedadesTercero.staticText3}" id="staticText3" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn4}" headerText="Tercero" id="tableColumn4" sort="TERCERO" width="200">
                                    <ui:staticText binding="#{ConsNovedadesTercero.staticText4}" id="staticText4" text="#{currentRow.value['TERCERO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn1}" headerText="Fecha Novedad" id="tableColumn1" sort="FECHANOV">
                                    <ui:staticText binding="#{ConsNovedadesTercero.staticText1}" id="staticText1" text="#{currentRow.value['FECHANOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn5}" headerText="Fecha Validación" id="tableColumn5" sort="FECHAVAL" width="60">
                                    <ui:staticText binding="#{ConsNovedadesTercero.staticText5}" id="staticText5" text="#{currentRow.value['FECHAVAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn6}" headerText="Fecha Activación" id="tableColumn6" sort="FECHAACT" width="60">
                                    <ui:staticText binding="#{ConsNovedadesTercero.staticText6}" id="staticText6" text="#{currentRow.value['FECHAACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn2}" headerText="Fecha Anulacion" id="tableColumn2" sort="FECHAANUL">
                                    <ui:staticText binding="#{ConsNovedadesTercero.staticText2}" id="staticText2" text="#{currentRow.value['FECHAANUL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovedadesTercero.tableColumn8}" id="tableColumn8" width="40">
                                    <ui:hyperlink action="#{ConsNovedadesTercero.hyperlink1_action}" binding="#{ConsNovedadesTercero.hyperlink1}"
                                        id="hyperlink1" text="Detalle"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{ConsNovedadesTercero.label1}" id="label1" style="left: 288px; top: 168px; position: absolute" text="Filtro por Estado"/>
                        <ui:dropDown binding="#{ConsNovedadesTercero.ddMunicipio}" id="ddMunicipio"
                            items="#{ConsNovedadesTercero.municipioDataProvider1.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 216px; position: absolute; width: 288px"
                            tabIndex="24" valueChangeListener="#{ConsNovedadesTercero.ddMunicipio_processValueChange}"/>
                        <ui:dropDown binding="#{ConsNovedadesTercero.ddEstado}" id="ddEstado" items="#{ConsNovedadesTercero.ddEstadoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddEstado');" style="left: 408px; top: 168px; position: absolute; width: 168px" valueChangeListener="#{ConsNovedadesTercero.ddEstado_processValueChange}"/>
                        <ui:label binding="#{ConsNovedadesTercero.label2}" id="label2" style="left: 288px; top: 216px; position: absolute" text="Municipio"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ConsNovedadesTercero.page1}" id="page1"/>
    <ui:html binding="#{ConsNovedadesTercero.html1}" id="html1"/>
    <ui:head binding="#{ConsNovedadesTercero.head1}" id="head1"/>
</jsp:root>
