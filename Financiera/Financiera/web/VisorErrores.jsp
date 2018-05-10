<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{VisorErrores.page1}" id="page1">
            <ui:html binding="#{VisorErrores.html1}" id="html1">
                <ui:head binding="#{VisorErrores.head1}" id="head1">
                    <ui:link binding="#{VisorErrores.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{VisorErrores.body1}" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{VisorErrores.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{VisorErrores.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Visor errores ejecucion"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:table augmentTitle="false" binding="#{VisorErrores.table1}" id="table1" paginationControls="true" sortPanelToggleButton="true"
                            style="left: 312px; top: 216px; position: absolute; width: 480px" title="Errores" width="480">
                            <ui:tableRowGroup binding="#{VisorErrores.tableRowGroup1}" id="tableRowGroup1" rows="30"
                                sourceData="#{VisorErrores.errorsDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{VisorErrores.tableColumn1}" headerText="ID ERROR" id="tableColumn1" sort="ID_ERRORS">
                                    <ui:staticText binding="#{VisorErrores.staticText1}" id="staticText1" text="#{currentRow.value['ID_ERRORS']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{VisorErrores.tableColumn2}" headerText="FECHA" id="tableColumn2" sort="FECHA">
                                    <ui:staticText binding="#{VisorErrores.staticText2}" id="staticText2" text="#{currentRow.value['FECHA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{VisorErrores.tableColumn3}" headerText="SQLCODE" id="tableColumn3" sort="SQLCODE">
                                    <ui:staticText binding="#{VisorErrores.staticText3}" id="staticText3" text="#{currentRow.value['SQLCODE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{VisorErrores.tableColumn4}" headerText="MESSAGE" id="tableColumn4" sort="MESSAGE">
                                    <ui:staticText binding="#{VisorErrores.staticText4}" id="staticText4" text="#{currentRow.value['MESSAGE']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
