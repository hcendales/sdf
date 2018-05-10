<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{DefDptal.page1}" id="page1">
            <ui:html binding="#{DefDptal.html1}" id="html1">
                <ui:head binding="#{DefDptal.head1}" id="head1">
                    <ui:link binding="#{DefDptal.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{DefDptal.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{DefDptal.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{DefDptal.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Definicion de Organismos Departamentales"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{DefDptal.dropDown1}" id="dropDown1" items="#{DefDptal.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'dropDown1');"
                            style="height: 24px; left: 432px; top: 168px; position: absolute; width: 312px" valueChangeListener="#{DefDptal.dropDown1_processValueChange}"/>
                        <ui:table augmentTitle="false" binding="#{DefDptal.table1}" id="table1"
                            style="left: 432px; top: 312px; position: absolute; width: 240px" title="Municipio" width="240">
                            <ui:tableRowGroup binding="#{DefDptal.tableRowGroup1}" emptyDataMsg="No hay municipios" id="tableRowGroup1" rows="10"
                                sourceData="#{DefDptal.departamentalDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{DefDptal.tableColumn3}" id="tableColumn3">
                                    <ui:button action="#{DefDptal.button1_action}" binding="#{DefDptal.button1}" id="button1" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{DefDptal.tableColumn1}" headerText="IDDPTAL" id="tableColumn1" sort="IDDPTAL">
                                    <ui:staticText binding="#{DefDptal.staticText1}" id="staticText1" text="#{currentRow.value['IDDPTAL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{DefDptal.tableColumn2}" headerText="IDMUNICIPIO" id="tableColumn2" sort="IDMUNICIPIO">
                                    <ui:staticText binding="#{DefDptal.staticText2}" id="staticText2" text="#{currentRow.value['IDMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{DefDptal.tableColumn4}" headerText="NOMBRE" id="tableColumn4" sort="NOMBRE">
                                    <ui:staticText binding="#{DefDptal.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{DefDptal.label1}" id="label1" style="left: 312px; top: 168px; position: absolute" text="Departamental"/>
                        <ui:dropDown binding="#{DefDptal.dropDown2}" id="dropDown2" items="#{DefDptal.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}" style="height: 24px; left: 432px; top: 216px; position: absolute; width: 312px"/>
                        <ui:label binding="#{DefDptal.label2}" id="label2" style="left: 312px; top: 216px; position: absolute" text="Municipio"/>
                        <ui:button action="#{DefDptal.button2_action}" binding="#{DefDptal.button2}" id="button2"
                            style="height: 24px; left: 456px; top: 264px; position: absolute; width: 119px" text="Agregar"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
