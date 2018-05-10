<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Menu.page}" id="page">
            <ui:html binding="#{Menu.html}" id="html">
                <ui:head binding="#{Menu.head}" id="head">
                    <ui:link binding="#{Menu.link}" id="link" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Menu.body}" focus="form:tfnombremenu" id="body" style="-rave-layout: grid">
                    <ui:form binding="#{Menu.form}" id="form">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:button action="#{Menu.btActualizar_action}" binding="#{Menu.btActualizar}" id="btActualizar"
                            style="left: 623px; top: 240px; position: absolute; width: 72px" tabIndex="5" text="Adicionar"/>
                        <ui:staticText binding="#{Menu.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 168px" text="Administracion Menu"/>
                        <ui:textField binding="#{Menu.tfnombremenu}" id="tfnombremenu" maxLength="50"
                            style="left: 336px; top: 168px; position: absolute; width: 312px" tabIndex="1"/>
                        <ui:textField binding="#{Menu.tfidmenu}" columns="10" id="tfidmenu" style="left: 600px; top: 168px; position: absolute; width: 190px" visible="false"/>
                        <ui:checkbox binding="#{Menu.cbhabil}" id="cbhabil" label=" Habilitado" style="left: 288px; top: 240px; position: absolute; width: 94px" tabIndex="3"/>
                        <ui:table augmentTitle="false" binding="#{Menu.table}" id="table" paginateButton="true" paginationControls="true"
                            style="left: 288px; top: 288px; position: absolute; width: 909px" title="Menus" width="909">
                            <ui:tableRowGroup binding="#{Menu.tableRowGroup}" id="tableRowGroup" rows="10" sourceData="#{Menu.menuDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Menu.tcedit}" id="tcedit" width="88">
                                    <ui:button action="#{Menu.btEditar_action}" binding="#{Menu.btEditar}" id="btEditar" imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Menu.tableColumn1}" id="tableColumn1" width="86">
                                    <ui:button action="#{Menu.beliminar_action}" binding="#{Menu.beliminar}" id="beliminar" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Menu.tcidmenu}" headerText="IDMENU" id="tcidmenu" sort="IDMENU" visible="false" width="40">
                                    <ui:staticText binding="#{Menu.stidmenu}" id="stidmenu" text="#{currentRow.value['IDMENU']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Menu.tcnombre}" headerText="NOMBRE MENU" id="tcnombre" sort="NAMEMENU" width="220">
                                    <ui:staticText binding="#{Menu.stnombre}" id="stnombre" text="#{currentRow.value['NAMEMENU']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Menu.tcpagina}" headerText="PAGINA" id="tcpagina" sort="PAGE" width="190">
                                    <ui:staticText binding="#{Menu.stpagina}" id="stpagina" text="#{currentRow.value['PAGE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Menu.tcidpadre}" headerText="PADREID" id="tcidpadre" sort="PADREID" visible="false" width="40">
                                    <ui:staticText binding="#{Menu.stidpadre}" id="stidpadre" text="#{currentRow.value['PADREID']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Menu.tcnamepadre}" headerText="PADRE" id="tcnamepadre" sort="NAMEPADRE" width="70">
                                    <ui:staticText binding="#{Menu.stnamepadre}" id="stnamepadre" text="#{currentRow.value['NAMEPADRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn align="center" binding="#{Menu.tcenablemenu}" headerText="ACTIVO" id="tcenablemenu" sort="ENABLEMENU" width="50">
                                    <ui:staticText binding="#{Menu.stenablemenu}" id="stenablemenu" text="#{currentRow.value['ENABLEMENU']}" visible="false"/>
                                    <ui:image binding="#{Menu.imageActivo}" id="imageActivo" url="/resources/#{currentRow.value['ENABLEMENU']}.gif"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{Menu.tfpage}" id="tfpage" maxLength="100" style="left: 336px; top: 192px; position: absolute; width: 502px" tabIndex="2"/>
                        <ui:dropDown binding="#{Menu.ddpadre}" converter="#{Menu.ddpadreConverter}" id="ddpadre"
                            items="#{Menu.padreDataProvider.options['IDPADRE,NAMEPADRE']}" label="Padre :" selected="#{Menu.padreDataProvider.value['IDPADRE']}"
                            style="left: 408px; top: 240px; position: absolute; width: 192px" tabIndex="4"/>
                        <ui:label binding="#{Menu.label1}" for="tfcedula" id="label1" style="left: 288px; top: 168px; position: absolute" text="Menu"/>
                        <ui:label binding="#{Menu.label2}" for="tfcedula" id="label2" style="left: 288px; top: 192px; position: absolute" text="Página"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
    <ui:page binding="#{Menu.page1}" id="page1"/>
    <ui:html binding="#{Menu.html1}" id="html1"/>
    <ui:head binding="#{Menu.head1}" id="head1"/>
</jsp:root>
