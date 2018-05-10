<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ControlTecho.page1}" id="page1">
            <ui:html binding="#{ControlTecho.html1}" id="html1">
                <ui:head binding="#{ControlTecho.head1}" id="head1">
                    <ui:link binding="#{ControlTecho.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ControlTecho.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ControlTecho.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ControlTecho.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Control Techo Financiero Concesionarios"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ControlTecho.label1}" id="label1" style="position: absolute; left: 384px; top: 192px" text="Concesionario"/>
                        <ui:dropDown binding="#{ControlTecho.ddConcesionario}" id="ddConcesionario"
                            items="#{ControlTecho.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddConcesionario');" style="left: 504px; top: 192px; position: absolute; width: 216px" valueChangeListener="#{ControlTecho.ddConcesionario_processValueChange}"/>
                        <ui:label binding="#{ControlTecho.label2}" id="label2" style="left: 384px; top: 240px; position: absolute" text="Año de control"/>
                        <ui:textField binding="#{ControlTecho.tanoControl}" id="tanoControl" style="left: 504px; top: 240px; position: absolute; width: 72px"/>
                        <ui:button action="#{ControlTecho.bconsultar_action}" binding="#{ControlTecho.bconsultar}" id="bconsultar"
                            style="left: 504px; top: 288px; position: absolute; width: 119px" text="Consultar"/>
                        <ui:label binding="#{ControlTecho.label3}" id="label3" style="left: 384px; top: 336px; position: absolute" text="Total Techo Anual - Recaudo Externo"/>
                        <ui:label binding="#{ControlTecho.label4}" id="label4" style="left: 384px; top: 360px; position: absolute" text="Total Techo Anual - Recaudo Local"/>
                        <ui:textField binding="#{ControlTecho.ttotalExt}" id="ttotalExt" readOnly="true" style="left: 624px; top: 336px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlTecho.ttotalLoc}" id="ttotalLoc" readOnly="true" style="left: 624px; top: 360px; position: absolute; width: 144px"/>
                        <ui:table augmentTitle="false" binding="#{ControlTecho.table1}" id="table1"
                            style="left: 408px; top: 552px; position: absolute; width: 360px" title="Techo Recaudo" width="360">
                            <ui:tableRowGroup binding="#{ControlTecho.tableRowGroup1}" emptyDataMsg="No hay informacion" id="tableRowGroup1" rows="10"
                                sourceData="#{ControlTecho.vw_controltechoDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ControlTecho.tableColumn4}" id="tableColumn4">
                                    <ui:button action="#{ControlTecho.beditar_action}" binding="#{ControlTecho.beditar}" id="beditar"
                                        imageURL="/resources/edit.GIF" text="textEditar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlTecho.tableColumn1}" headerText="Periodo" id="tableColumn1" sort="PERIODO">
                                    <ui:staticText binding="#{ControlTecho.stPeriodo}" id="stPeriodo" text="#{currentRow.value['PERIODO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlTecho.tableColumn2}" headerText="Externo" id="tableColumn2" sort="VLREXT">
                                    <ui:staticText binding="#{ControlTecho.staticText2}" id="staticText2" text="#{currentRow.value['VLREXT']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ControlTecho.tableColumn3}" headerText="Local" id="tableColumn3" sort="VLRLOC">
                                    <ui:staticText binding="#{ControlTecho.staticText3}" id="staticText3" text="#{currentRow.value['VLRLOC']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:dropDown binding="#{ControlTecho.ddMes}" id="ddMes" items="#{ControlTecho.ddMesDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMes');" style="left: 552px; top: 432px; position: absolute; width: 144px" valueChangeListener="#{ControlTecho.ddMes_processValueChange}"/>
                        <ui:label binding="#{ControlTecho.label5}" id="label5" style="left: 384px; top: 432px; position: absolute" text="Periodo"/>
                        <ui:button action="#{ControlTecho.bactualizar_action}" binding="#{ControlTecho.bactualizar}" id="bactualizar"
                            style="left: 719px; top: 504px; position: absolute; width: 95px" text="Actualizar"/>
                        <ui:label binding="#{ControlTecho.label6}" id="label6" style="left: 384px; top: 480px; position: absolute" text="Techo Recaudo Externo"/>
                        <ui:textField binding="#{ControlTecho.ttechoExt}" id="ttechoExt" style="left: 552px; top: 480px; position: absolute; width: 144px"/>
                        <ui:label binding="#{ControlTecho.label7}" id="label7" style="left: 384px; top: 504px; position: absolute" text="Techo Recaudo Local"/>
                        <ui:textField binding="#{ControlTecho.ttechoLoc}" id="ttechoLoc" style="left: 552px; top: 504px; position: absolute; width: 144px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
