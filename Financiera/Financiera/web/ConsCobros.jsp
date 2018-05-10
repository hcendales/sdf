<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsCobros.page1}" id="page1">
            <ui:html binding="#{ConsCobros.html1}" id="html1">
                <ui:head binding="#{ConsCobros.head1}" id="head1">
                    <ui:link binding="#{ConsCobros.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsCobros.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsCobros.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsCobros.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Consultas de Cobros de devolucion des usuario"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ConsCobros.label1}" id="label1" style="left: 312px; top: 192px; position: absolute" text="Municipio"/>
                        <ui:dropDown binding="#{ConsCobros.dropDown1}" id="dropDown1" items="#{ConsCobros.municipioDataProvider1.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'dropDown1');" style="left: 432px; top: 192px; position: absolute; width: 264px" valueChangeListener="#{ConsCobros.dropDown1_processValueChange}"/>
                        <ui:dropDown binding="#{ConsCobros.dropDown2}" id="dropDown2" items="#{ConsCobros.dropDown2DefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'dropDown2');" style="position: absolute; left: 432px; top: 240px" valueChangeListener="#{ConsCobros.dropDown2_processValueChange}"/>
                        <ui:label binding="#{ConsCobros.label2}" id="label2" style="left: 312px; top: 240px; position: absolute" text="Estado Cobro"/>
                        <ui:button action="#{ConsCobros.button1_action}" binding="#{ConsCobros.button1}" id="button1"
                            style="height: 24px; left: 431px; top: 336px; position: absolute; width: 144px" text="Generar Reporte"/>
                        <ui:label binding="#{ConsCobros.label3}" id="label3" style="left: 312px; top: 288px; position: absolute" text="Formato Reporte"/>
                        <ui:dropDown binding="#{ConsCobros.dropDown3}" id="dropDown3" items="#{ConsCobros.dropDown3DefaultOptions.options}" style="left: 432px; top: 288px; position: absolute"/>
                        <ui:table augmentTitle="false" binding="#{ConsCobros.table1}" id="table1"
                            style="left: 312px; top: 384px; position: absolute; width: 360px" title="Devolucion de usuarios" width="875">
                            <ui:tableRowGroup binding="#{ConsCobros.tableRowGroup1}" emptyDataMsg="No hay registros" id="tableRowGroup1" rows="10"
                                sourceData="#{ConsCobros.vw_cobrosdevDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsCobros.tableColumn2}" headerText="Identificacion" id="tableColumn2" sort="IDENTIFICACION">
                                    <ui:staticText binding="#{ConsCobros.staticText2}" id="staticText2" text="#{currentRow.value['IDENTIFICACION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn3}" headerText="Nombre Usuario" id="tableColumn3" sort="NOMBRE">
                                    <ui:staticText binding="#{ConsCobros.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn36}" headerText="Cuenta Recaudo" id="tableColumn36" sort="CUENTAREC">
                                    <ui:staticText binding="#{ConsCobros.staticText36}" id="staticText36" text="#{currentRow.value['CUENTAREC']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn9}" headerText="DIVIPO" id="tableColumn9" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{ConsCobros.staticText9}" id="staticText9" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn44}" headerText="Municipio" id="tableColumn44" sort="NOMMUNICIPIO">
                                    <ui:staticText binding="#{ConsCobros.staticText44}" id="staticText44" text="#{currentRow.value['NOMMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn23}" headerText="# Novedad" id="tableColumn23" sort="NUMERONOV">
                                    <ui:staticText binding="#{ConsCobros.staticText23}" id="staticText23" text="#{currentRow.value['NUMERONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn34}" headerText="Fecha Pago Usuario" id="tableColumn34" sort="FECHAAPLICACION">
                                    <ui:staticText binding="#{ConsCobros.staticText34}" id="staticText34" text="#{currentRow.value['FECHAAPLICACION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn40}" headerText="Fecha Cobro" id="tableColumn40" sort="FECHACOBRO">
                                    <ui:staticText binding="#{ConsCobros.staticText40}" id="staticText40" text="#{currentRow.value['FECHACOBRO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsCobros.tableColumn1}" headerText="Estado Cobro" id="tableColumn1" sort="NOMINDCOBRO">
                                    <ui:staticText binding="#{ConsCobros.staticText1}" id="staticText1" text="#{currentRow.value['NOMINDCOBRO']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
