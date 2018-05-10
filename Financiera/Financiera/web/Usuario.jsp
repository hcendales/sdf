<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Usuario.page1}" id="page1">
            <ui:html binding="#{Usuario.html1}" id="html1">
                <ui:head binding="#{Usuario.head1}" id="head1" title="Administracion Usuarios SIMIT">
                    <ui:link binding="#{Usuario.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Usuario.body1}" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Usuario.form1}" id="form1" style="height: 600px; left: 10cm; right: 10cm; top: 10cm; bottom: 10cm; width: 672px" virtualFormsConfig="">
                        <ui:table augmentTitle="false" binding="#{Usuario.table1}" id="table1" paginateButton="true" paginationControls="true"
                            style="left: 312px; top: 360px; position: absolute; width: 267px" tabIndex="9" title="Usuarios" width="267">
                            <ui:tableRowGroup binding="#{Usuario.tableRowGroup1}" id="tableRowGroup1" rows="10" sourceData="#{Usuario.personDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Usuario.tcedit}" id="tcedit">
                                    <ui:button action="#{Usuario.btEditar_action}" binding="#{Usuario.btEditar1}" id="btEditar1" imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuario.tableColumn1}" id="tableColumn1">
                                    <ui:button action="#{Usuario.beliminar_action}" binding="#{Usuario.beliminar}" id="beliminar" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuario.tccedula}" headerText="CEDULA" id="tccedula" sort="IDPERSON">
                                    <ui:staticText binding="#{Usuario.stcedula}" id="stcedula" text="#{currentRow.value['IDPERSON']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuario.tcnombre}" headerText="NOMBRE" id="tcnombre" sort="NAMEPERSON">
                                    <ui:staticText binding="#{Usuario.stnombre}" id="stnombre" text="#{currentRow.value['NAMEPERSON']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuario.tccargo}" headerText="CARGO" id="tccargo" sort="JOBTITLE">
                                    <ui:staticText binding="#{Usuario.stcargo}" id="stcargo" text="#{currentRow.value['JOBTITLE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuario.tcmail}" headerText="CORREO" id="tcmail"
                                        sort="MAIL">CORRE
                                    <ui:staticText binding="#{Usuario.stmail}" id="stmail" text="#{currentRow.value['MAIL']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn align="center" binding="#{Usuario.tcactivo}" headerText="ACTIVO" id="tcactivo" sort="ENABLEPERSON">
                                    <ui:staticText binding="#{Usuario.stactivo}" id="stactivo" text="#{currentRow.value['ENABLEPERSON']}" visible="false"/>
                                    <ui:image binding="#{Usuario.imageActivo}" id="imageActivo" url="/resources/#{currentRow.value['ENABLEPERSON']}.gif"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Usuario.tclave}" headerText="CLAVE" id="tclave" sort="PASSWORD" visible="false">
                                    <ui:staticText binding="#{Usuario.stclave}" id="stclave" text="#{currentRow.value['PASSWORD']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{Usuario.tfnombre}" id="tfnombre" maxLength="100"
                            style="left: 360px; top: 192px; position: absolute; width: 384px" tabIndex="2"/>
                        <ui:checkbox binding="#{Usuario.cbhabil}" id="cbhabil" label=" Habilitado"
                            style="left: 360px; top: 288px; position: absolute; width: 94px" tabIndex="6"/>
                        <ui:textField binding="#{Usuario.tfcedula}" columns="10" id="tfcedula" maxLength="13"
                            style="left: 360px; top: 168px; position: absolute; width: 120px" tabIndex="1"/>
                        <ui:textField binding="#{Usuario.tfcorreo}" id="tfcorreo" maxLength="100"
                            style="left: 360px; top: 264px; position: absolute; width: 384px" tabIndex="5"/>
                        <ui:textField binding="#{Usuario.tfcargo}" columns="10" id="tfcargo" maxLength="100"
                            style="left: 360px; top: 240px; position: absolute; width: 384px" tabIndex="4"/>
                        <ui:staticText binding="#{Usuario.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute; width: 168px" text="Administracion Usuario"/>
                        <ui:button action="#{Usuario.btActualizar_action}" binding="#{Usuario.btActualizar}" id="btActualizar" onClick="btActualizar_action()"
                            style="left: 455px; top: 336px; position: absolute; width: 72px" tabIndex="8" text="Crear"/>
                        <ui:checkboxGroup binding="#{Usuario.cbgroles}" converter="#{Usuario.cbgrolesConverter}" id="cbgroles"
                            items="#{Usuario.rolDataProvider.options['ROLID,NAMEROL']}"
                            style="height: 96px; left: 960px; top: 192px; position: absolute; width: 336px" tabIndex="7"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:label binding="#{Usuario.label1}" for="tfcedula" id="label1" style="left: 312px; top: 168px; position: absolute" text="Cedula"/>
                        <ui:label binding="#{Usuario.label2}" for="tfcedula" id="label2" style="left: 312px; top: 192px; position: absolute" text="Nombre"/>
                        <ui:label binding="#{Usuario.label3}" for="tfcedula" id="label3" style="left: 312px; top: 240px; position: absolute" text="Cargo"/>
                        <ui:label binding="#{Usuario.label4}" for="tfcedula" id="label4" style="left: 312px; top: 264px; position: absolute" text="Correo"/>
                        <ui:label binding="#{Usuario.label5}" for="tfcedula" id="label5" style="left: 312px; top: 216px; position: absolute" text="Clave"/>
                        <ui:passwordField binding="#{Usuario.tfclave}" id="tfclave" maxLength="16"
                            style="left: 360px; top: 216px; position: absolute; width: 120px" tabIndex="3" trim="false"/>
                        <ui:label binding="#{Usuario.label6}" for="tfcedula" id="label6" style="left: 888px; top: 192px; position: absolute; width: 46px" text="Roles"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
