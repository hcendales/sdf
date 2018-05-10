<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Rol.page1}" id="page1">
            <ui:html binding="#{Rol.html1}" id="html1">
                <ui:head binding="#{Rol.head1}" id="head1">
                    <ui:link binding="#{Rol.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Rol.body1}" focus="form1:tfnombrerol" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Rol.form1}" id="form1">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 24px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Rol.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 168px" text="Administracion Rol"/>
                        <ui:button action="#{Rol.btActualizar_action}" binding="#{Rol.btActualizar}" id="btActualizar"
                            style="left: 503px; top: 288px; position: absolute; width: 72px" tabIndex="3" text="Adicionar"/>
                        <ui:checkboxGroup binding="#{Rol.cbgmenus}" columns="3" converter="#{Rol.cbgmenusConverter}" id="cbgmenus"
                            items="#{Rol.menuDataProvider.options['IDMENU,NAMEMENU']}" style="height: 96px; left: 264px; top: 744px; position: absolute; width: 744px"/>
                        <ui:table augmentTitle="false" binding="#{Rol.table}" id="table" paginateButton="true" paginationControls="true"
                            style="left: 336px; top: 312px; position: absolute; width: 569px" title="Roles" width="569">
                            <ui:tableRowGroup binding="#{Rol.tableRowGroup}" id="tableRowGroup" rows="5" sourceData="#{Rol.rolDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Rol.tcedit}" id="tcedit" width="50">
                                    <ui:button action="#{Rol.btEditar_action}" binding="#{Rol.btEditar}" id="btEditar" imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Rol.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{Rol.beliminar_action}" binding="#{Rol.beliminar}" id="beliminar" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this); &#xa;function confirmar(formObj)&#xa;{&#xa; if(confirm(&quot;Desea eliminar registro ?&quot;))&#xa; { &#xa; btEliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; return false; &#xa; } &#xa;}" text="eliinar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Rol.tcrolid}" headerText="ROLID" id="tcrolid" sort="ROLID" visible="false">
                                    <ui:staticText binding="#{Rol.strolid}" id="strolid" text="#{currentRow.value['ROLID']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Rol.tcnombrerol}" headerText="NOMBRE ROL" id="tcnombrerol" sort="NAMEROL" width="196">
                                    <ui:staticText binding="#{Rol.stnombrerol}" id="stnombrerol" text="#{currentRow.value['NAMEROL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn align="center" binding="#{Rol.tcenablerol}" headerText="ACTIVO" id="tcenablerol" sort="ENABLEROL" width="192">
                                    <ui:staticText binding="#{Rol.stenablerol}" id="stenablerol" text="#{currentRow.value['ENABLEROL']}" visible="false"/>
                                    <ui:image binding="#{Rol.imageActivo}" id="imageActivo" url="/resources/#{currentRow.value['ENABLEROL']}.gif"/>
                                </ui:tableColumn>
                                <ui:tableColumn align="center" binding="#{Rol.tcenablemod}" headerText="MODIFICA" id="tcenablemod" sort="ENABLEMOD">
                                    <ui:staticText binding="#{Rol.stenablemod}" id="stenablemod" text="#{currentRow.value['ENABLEMOD']}" visible="false"/>
                                    <ui:image align="middle" binding="#{Rol.imageActivo1}" id="imageActivo1" url="/resources/#{currentRow.value['ENABLEMOD']}.gif"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:checkbox binding="#{Rol.cbhabil}" id="cbhabil" label=" Habilitado" style="left: 456px; top: 240px; position: absolute; width: 94px" tabIndex="2"/>
                        <ui:textField binding="#{Rol.tfnombrerol}" id="tfnombrerol" maxLength="50"
                            style="left: 456px; top: 216px; position: absolute; width: 360px" tabIndex="1"/>
                        <ui:textField binding="#{Rol.tfrolid}" id="tfrolid" style="left: 600px; top: 192px; position: absolute; width: 192px" visible="false"/>
                        <ui:textField binding="#{Rol.tfIdRol}" id="tfIdRol" label="Rol" style="left: 288px; top: 192px; position: absolute; width: 286px" visible="false"/>
                        <ui:label binding="#{Rol.label1}" for="tfcedula" id="label1" style="left: 408px; top: 216px; position: absolute" text="Rol"/>
                        <ui:checkbox binding="#{Rol.cbmod}" id="cbmod" label="Permite Modificaciones"
                            style="left: 600px; top: 240px; position: absolute; width: 166px" tabIndex="2"/>
                        <ui:label binding="#{Rol.label2}" for="tfcedula" id="label2" style="left: 264px; top: 696px; position: absolute" text="OPCIONES DEL SISTEMA"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
