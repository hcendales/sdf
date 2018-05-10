<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Usuarios.page1}" id="page1">
            <ui:html binding="#{Usuarios.html1}" id="html1">
                <ui:head binding="#{Usuarios.head1}" id="head1">
                    <ui:link binding="#{Usuarios.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Usuarios.body1}" focus="form1:tfcedula" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Usuarios.form1}" id="form1">
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:table augmentTitle="false" binding="#{Usuarios.table1}" id="table1"
                            style="left: 288px; top: 312px; position: absolute; width: 267px" title="Usuarios" width="1">
                            <ui:tableRowGroup binding="#{Usuarios.tableRowGroup1}" id="tableRowGroup1" sourceData="#{Usuario.personDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Usuarios.tcedit}" id="tcedit">
                                    <ui:button action="#{Usuarios.btEditar_action}" binding="#{Usuarios.btEditar1}" id="btEditar1"
                                        imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuarios.tccedula}" headerText="CEDULA" id="tccedula" sort="IDPERSON">
                                    <ui:staticText binding="#{Usuarios.stcedula}" id="stcedula" text="#{currentRow.value['IDPERSON']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuarios.tcnombre}" headerText="NOMBRE" id="tcnombre" sort="NAMEPERSON">
                                    <ui:staticText binding="#{Usuarios.stnombre}" id="stnombre" text="#{currentRow.value['NAMEPERSON']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuarios.tccargo}" headerText="CARGO" id="tccargo" sort="JOBTITLE">
                                    <ui:staticText binding="#{Usuarios.stcargo}" id="stcargo" text="#{currentRow.value['JOBTITLE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuarios.tcmail}" headerText="CORREO" id="tcmail" sort="MAIL">
                                    <ui:staticText binding="#{Usuarios.stmail}" id="stmail" text="#{currentRow.value['MAIL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuarios.tcactivo}" headerText="ACTIVO" id="tcactivo" sort="ENABLEPERSON">
                                    <ui:staticText binding="#{Usuarios.stactivo}" id="stactivo" text="#{currentRow.value['ENABLEPERSON']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{Usuarios.tfnombre}" id="tfnombre" label="Nombre :"
                            style="left: 480px; top: 168px; position: absolute; width: 312px" tabIndex="2"/>
                        <ui:checkbox binding="#{Usuarios.cbhabil}" id="cbhabil" label=" Habilitado"
                            style="left: 288px; top: 264px; position: absolute; width: 94px" tabIndex="6"/>
                        <ui:textField binding="#{Usuarios.tfcedula}" columns="10" id="tfcedula" label="Cedula :"
                            style="left: 288px; top: 168px; position: absolute; width: 190px" tabIndex="1"/>
                        <ui:textField binding="#{Usuarios.tfcorreo}" id="tfcorreo" label="Correo :"
                            style="left: 480px; top: 216px; position: absolute; width: 310px" tabIndex="5"/>
                        <ui:textField binding="#{Usuarios.tfcargo}" columns="10" id="tfcargo" label="Cargo :"
                            style="left: 288px; top: 216px; position: absolute; width: 190px" tabIndex="4"/>
                        <ui:staticText binding="#{Usuarios.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 168px" text="Administracion Usuario"/>
                        <ui:button binding="#{Usuarios.btActualizar}" id="btActualizar" onClick="btActualizar_action()"
                            style="left: 479px; top: 264px; position: absolute; width: 72px" tabIndex="7" text="Adicionar"/>
                        <ui:checkboxGroup binding="#{Usuarios.checkboxGroupRoles}" converter="#{Usuarios.checkboxGroupRolesConverter}" id="checkboxGroupRoles"
                            items="#{Usuarios.rolDataProvider.options['ROLID,NAMEROL']}"
                            style="height: 96px; left: 816px; top: 144px; position: absolute; width: 120px" tabIndex="3"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
