<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovDevolucionDoc.page}" id="page">
            <ui:html binding="#{ConsNovDevolucionDoc.html}" id="html">
                <ui:head binding="#{ConsNovDevolucionDoc.head}" id="head">
                    <ui:link binding="#{ConsNovDevolucionDoc.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovDevolucionDoc.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovDevolucionDoc.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovDevolucionDoc.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 262px" text="Consulta Novedades Devolucion Usuario"/>
                        <ui:textField binding="#{ConsNovDevolucionDoc.tfidmenu}" columns="10" id="tfidmenu"
                            style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:dropDown binding="#{ConsNovDevolucionDoc.ddEstado}" id="ddEstado" items="#{ConsNovDevolucionDoc.ddEstadoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddEstado');" style="left: 432px; top: 168px; position: absolute; width: 168px" valueChangeListener="#{ConsNovDevolucionDoc.ddEstado_processValueChange}"/>
                        <ui:label binding="#{ConsNovDevolucionDoc.label1}" id="label1" style="left: 312px; top: 168px; position: absolute" text="Filtro por Estado"/>
                        <ui:table augmentTitle="false" binding="#{ConsNovDevolucionDoc.table1}" id="table1"
                            style="left: 336px; top: 264px; position: absolute; width: 510px" title="Novedades" width="510">
                            <ui:tableRowGroup binding="#{ConsNovDevolucionDoc.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="5"
                                sourceData="#{ConsNovDevolucionDoc.novdevolucionDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn1}" headerText="NOVEDAD" id="tableColumn1" sort="NOVEDAD">
                                    <ui:staticText binding="#{ConsNovDevolucionDoc.stNovedad}" id="stNovedad" text="#{currentRow.value['NOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn3}" headerText="Identificacion" id="tableColumn3"
                                    sort="IDENTIFICACION" width="112">
                                    <ui:staticText binding="#{ConsNovDevolucionDoc.staticText3}" id="staticText3" text="#{currentRow.value['IDENTIFICACION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn31}" headerText="Estado" id="tableColumn31" sort="ESTADONOV">
                                    <ui:staticText binding="#{ConsNovDevolucionDoc.staticText31}" id="staticText31" text="#{currentRow.value['ESTADONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn4}" headerText="Nombre" id="tableColumn4" sort="NOMBRE">
                                    <ui:staticText binding="#{ConsNovDevolucionDoc.staticText4}" id="staticText4" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn2}" headerText="Fecha Novedad" id="tableColumn2" sort="FECHANOV">
                                    <ui:staticText binding="#{ConsNovDevolucionDoc.staticText1}" id="staticText1" text="#{currentRow.value['FECHANOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn5}" headerText="Fecha Validacion" id="tableColumn5" sort="FECHAVAL">
                                    <ui:staticText binding="#{ConsNovDevolucionDoc.staticText2}" id="staticText2" text="#{currentRow.value['FECHAVAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn6}" headerText="Fecha Activacion" id="tableColumn6" sort="FECHAACT">
                                    <ui:staticText binding="#{ConsNovDevolucionDoc.staticText5}" id="staticText5" text="#{currentRow.value['FECHAACT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsNovDevolucionDoc.tableColumn7}" id="tableColumn7">
                                    <ui:button action="#{ConsNovDevolucionDoc.bver_action}" binding="#{ConsNovDevolucionDoc.bver}" id="bver" text="Ver"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{ConsNovDevolucionDoc.ddIdentificacion}" converter="#{ConsNovDevolucionDoc.ddIdentificacionConverter}"
                            id="ddIdentificacion" items="#{ConsNovDevolucionDoc.vw_identdevDataProvider.options['IDENTIFICACION,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddIdentificacion');"
                            style="left: 432px; top: 216px; position: absolute; width: 288px" tabIndex="24" valueChangeListener="#{ConsNovDevolucionDoc.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{ConsNovDevolucionDoc.label2}" id="label2" style="left: 312px; top: 216px; position: absolute" text="Identificacion"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{ConsNovDevolucionDoc.page1}" id="page1"/>
    <ui:html binding="#{ConsNovDevolucionDoc.html1}" id="html1"/>
    <ui:head binding="#{ConsNovDevolucionDoc.head1}" id="head1"/>
</jsp:root>
