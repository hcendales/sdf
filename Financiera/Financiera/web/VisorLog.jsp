<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{VisorLog.page1}" id="page1">
            <ui:html binding="#{VisorLog.html1}" id="html1">
                <ui:head binding="#{VisorLog.head1}" id="head1">
                    <ui:link binding="#{VisorLog.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{VisorLog.body1}" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{VisorLog.form1}" id="form1">
                        <ui:staticText binding="#{VisorLog.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 312px; top: 120px; position: absolute" text="Visor Log de actividades"/>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:table augmentTitle="false" binding="#{VisorLog.table1}" id="table1" paginationControls="true" sortPanelToggleButton="true"
                            style="left: 312px; top: 192px; position: absolute; width: 480px" title="Log" width="480">
                            <ui:tableRowGroup binding="#{VisorLog.tableRowGroup1}" id="tableRowGroup1" rows="30" sourceData="#{VisorLog.logDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{VisorLog.tableColumn1}" headerText="FECHA" id="tableColumn1" sort="FECHA">
                                    <ui:staticText binding="#{VisorLog.staticText1}" id="staticText1" text="#{currentRow.value['FECHA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{VisorLog.tableColumn2}" headerText="USUARIO" id="tableColumn2" sort="USUARIO">
                                    <ui:staticText binding="#{VisorLog.staticText2}" id="staticText2" text="#{currentRow.value['USUARIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{VisorLog.tableColumn3}" headerText="PROCESO" id="tableColumn3" sort="PROCESO">
                                    <ui:staticText binding="#{VisorLog.staticText3}" id="staticText3" text="#{currentRow.value['PROCESO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{VisorLog.tableColumn4}" headerText="ACCION" id="tableColumn4" sort="ACCION">
                                    <ui:staticText binding="#{VisorLog.staticText4}" id="staticText4" text="#{currentRow.value['ACCION']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
