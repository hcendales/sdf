<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ControlRespuesta.page1}" id="page1">
            <ui:html binding="#{ControlRespuesta.html1}" id="html1">
                <ui:head binding="#{ControlRespuesta.head1}" id="head1">
                    <ui:link binding="#{ControlRespuesta.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ControlRespuesta.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ControlRespuesta.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ControlRespuesta.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Control Respuesta Bancos"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{ControlRespuesta.btConsultar_action}" binding="#{ControlRespuesta.btConsultar}" id="btConsultar"
                            style="left: 431px; top: 240px; position: absolute; width: 120px" tabIndex="3" text="Consultar"/>
                        <ui:dropDown binding="#{ControlRespuesta.dbanco}" id="dbanco" items="#{ControlRespuesta.dbancoDefaultOptions.options}" onChange="" style="left: 408px; top: 192px; position: absolute; width: 168px"/>
                        <ui:table augmentTitle="false" binding="#{ControlRespuesta.table1}" id="table1" paginateButton="true" paginationControls="true"
                            style="position: absolute; left: 360px; top: 312px" title="Control Archivos" width="560">
                            <ui:tableRowGroup binding="#{ControlRespuesta.tableRowGroup1}" emptyDataMsg="No hay informacion" id="tableRowGroup1" rows="20"
                                sourceData="#{ControlRespuesta.vw_control_rptaDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ControlRespuesta.tableColumn1}" headerText="NOMBANCO" id="tableColumn1" sort="NOMBANCO">
                                    <ui:staticText binding="#{ControlRespuesta.staticText1}" id="staticText1" text="#{currentRow.value['NOMBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlRespuesta.tableColumn2}" headerText="NOMBREARCHIVO" id="tableColumn2" sort="NOMBREARCHIVO">
                                    <ui:staticText binding="#{ControlRespuesta.staticText2}" id="staticText2" text="#{currentRow.value['NOMBREARCHIVO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlRespuesta.tableColumn3}" headerText="FECHAHACIABANCO" id="tableColumn3" sort="FECHAHACIABANCO">
                                    <ui:staticText binding="#{ControlRespuesta.staticText3}" id="staticText3" text="#{currentRow.value['FECHAHACIABANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlRespuesta.tableColumn4}" headerText="FECHADESDEBANCO" id="tableColumn4" sort="FECHADESDEBANCO">
                                    <ui:staticText binding="#{ControlRespuesta.staticText4}" id="staticText4" text="#{currentRow.value['FECHADESDEBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlRespuesta.tableColumn5}" headerText="ESTADO" id="tableColumn5" sort="ESTADO">
                                    <ui:staticText binding="#{ControlRespuesta.staticText5}" id="staticText5" text="#{currentRow.value['ESTADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlRespuesta.tableColumn6}" headerText="FECHACORTE" id="tableColumn6" sort="FECHACORTE">
                                    <ui:staticText binding="#{ControlRespuesta.staticText6}" id="staticText6" text="#{currentRow.value['FECHACORTE']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{ControlRespuesta.label1}" id="label1" style="left: 360px; top: 192px; position: absolute" text="Banco"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
