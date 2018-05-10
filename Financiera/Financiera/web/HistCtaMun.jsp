<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{HistCtaMun.page1}" id="page1">
            <ui:html binding="#{HistCtaMun.html1}" id="html1">
                <ui:head binding="#{HistCtaMun.head1}" id="head1">
                    <ui:link binding="#{HistCtaMun.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{HistCtaMun.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{HistCtaMun.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{HistCtaMun.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Historico modificaciones cuentas municipios"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:table augmentTitle="false" binding="#{HistCtaMun.table1}" id="table1"
                            style="left: 336px; top: 168px; position: absolute; width: 1200px" title="Historico" width="1200">
                            <ui:tableRowGroup binding="#{HistCtaMun.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{HistCtaMun.vw_histmunDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn1}" headerText="FECHANOVEDAD" id="tableColumn1" sort="FECHANOVEDAD">
                                    <ui:staticText binding="#{HistCtaMun.staticText1}" id="staticText1" text="#{currentRow.value['FECHANOVEDAD']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn2}" headerText="IDMUNICIPIO" id="tableColumn2" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{HistCtaMun.staticText2}" id="staticText2" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn3}" headerText="NOMBRE" id="tableColumn3" sort="NOMBRE">
                                    <ui:staticText binding="#{HistCtaMun.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn4}" headerText="IDBANCOANT" id="tableColumn4" sort="IDBANCOANT">
                                    <ui:staticText binding="#{HistCtaMun.staticText4}" id="staticText4" text="#{currentRow.value['IDBANCOANT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn5}" headerText="TIPOCUENTAANT" id="tableColumn5" sort="TIPOCUENTAANT">
                                    <ui:staticText binding="#{HistCtaMun.staticText5}" id="staticText5" text="#{currentRow.value['TIPOCUENTAANT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn6}" headerText="CUENTAANT" id="tableColumn6" sort="CUENTAANT">
                                    <ui:staticText binding="#{HistCtaMun.staticText6}" id="staticText6" text="#{currentRow.value['CUENTAANT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn7}" headerText="IDBANCO" id="tableColumn7" sort="IDBANCO">
                                    <ui:staticText binding="#{HistCtaMun.staticText7}" id="staticText7" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn8}" headerText="TIPOCUENTA" id="tableColumn8" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{HistCtaMun.staticText8}" id="staticText8" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn9}" headerText="CUENTA" id="tableColumn9" sort="CUENTA">
                                    <ui:staticText binding="#{HistCtaMun.staticText9}" id="staticText9" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{HistCtaMun.tableColumn10}" headerText="USUARIO" id="tableColumn10" sort="USUARIO">
                                    <ui:staticText binding="#{HistCtaMun.staticText10}" id="staticText10" text="#{currentRow.value['USUARIO']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
