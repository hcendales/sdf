<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsTercero.page1}" id="page1">
            <ui:html binding="#{ConsTercero.html1}" id="html1">
                <ui:head binding="#{ConsTercero.head1}" id="head1">
                    <ui:link binding="#{ConsTercero.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsTercero.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsTercero.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsTercero.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Consulta de terceros"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:table augmentTitle="false" binding="#{ConsTercero.table1}" id="table1" style="position: absolute; left: 360px; top: 192px"
                            title="TERCEROS" width="1800">
                            <ui:tableRowGroup binding="#{ConsTercero.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{ConsTercero.vw_tercero_otDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsTercero.tableColumn1}" headerText="IDMUNICIPIO" id="tableColumn1" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{ConsTercero.staticText1}" id="staticText1" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn2}" headerText="NOMMUNICIPIO" id="tableColumn2" sort="NOMMUNICIPIO">
                                    <ui:staticText binding="#{ConsTercero.staticText2}" id="staticText2" text="#{currentRow.value['NOMMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn3}" headerText="NIT_T" id="tableColumn3" sort="NIT_T">
                                    <ui:staticText binding="#{ConsTercero.staticText3}" id="staticText3" text="#{currentRow.value['NIT_T']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn4}" headerText="NOMBRE" id="tableColumn4" sort="NOMBRE">
                                    <ui:staticText binding="#{ConsTercero.staticText4}" id="staticText4" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn5}" headerText="CORREO" id="tableColumn5" sort="CORREO">
                                    <ui:staticText binding="#{ConsTercero.staticText5}" id="staticText5" text="#{currentRow.value['CORREO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn6}" headerText="IDBANCO" id="tableColumn6" sort="IDBANCO">
                                    <ui:staticText binding="#{ConsTercero.staticText6}" id="staticText6" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn7}" headerText="NOMBANCO" id="tableColumn7" sort="NOMBANCO">
                                    <ui:staticText binding="#{ConsTercero.staticText7}" id="staticText7" text="#{currentRow.value['NOMBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn8}" headerText="TIPOCUENTA" id="tableColumn8" sort="TIPOCUENTA">
                                    <ui:staticText binding="#{ConsTercero.staticText8}" id="staticText8" text="#{currentRow.value['TIPOCUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn9}" headerText="CUENTA" id="tableColumn9" sort="CUENTA">
                                    <ui:staticText binding="#{ConsTercero.staticText9}" id="staticText9" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn10}" headerText="JURISDICCION" id="tableColumn10" sort="JURISDICCION">
                                    <ui:staticText binding="#{ConsTercero.staticText10}" id="staticText10" text="#{currentRow.value['JURISDICCION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn11}" headerText="MEDIOIMPOSICION" id="tableColumn11" sort="MEDIOIMPOSICION">
                                    <ui:staticText binding="#{ConsTercero.staticText11}" id="staticText11" text="#{currentRow.value['MEDIOIMPOSICION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn12}" headerText="BASELIQUIDACION" id="tableColumn12" sort="BASELIQUIDACION">
                                    <ui:staticText binding="#{ConsTercero.staticText12}" id="staticText12" text="#{currentRow.value['BASELIQUIDACION']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn13}" headerText="METODOBASE" id="tableColumn13" sort="METODOBASE">
                                    <ui:staticText binding="#{ConsTercero.staticText13}" id="staticText13" text="#{currentRow.value['METODOBASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn14}" headerText="VALORBASE" id="tableColumn14" sort="VALORBASE">
                                    <ui:staticText binding="#{ConsTercero.staticText14}" id="staticText14" text="#{currentRow.value['VALORBASE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsTercero.tableColumn15}" headerText="NUMTERCERO" id="tableColumn15" sort="NUMTERCERO">
                                    <ui:staticText binding="#{ConsTercero.staticText15}" id="staticText15" text="#{currentRow.value['NUMTERCERO']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
