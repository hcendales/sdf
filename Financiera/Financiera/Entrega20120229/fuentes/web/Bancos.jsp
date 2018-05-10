<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Bancos.page1}" id="page1">
            <ui:html binding="#{Bancos.html1}" id="html1">
                <ui:head binding="#{Bancos.head1}" id="head1" title="Administracion Bancos SIMIT">
                    <ui:link binding="#{Bancos.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Bancos.body1}" focus="form1:tfidbco" id="body1" style="background-color: rgb(255, 255, 255); -rave-layout: grid">
                    <ui:form binding="#{Bancos.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Bancos.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: Arial,Helvetica,sans-serif; font-size: 14px; left: 264px; top: 125px; position: absolute" text="Definición Bancos"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{Bancos.tfidbco}" id="tfidbco" maxLength="2" style="left: 336px; top: 168px; position: absolute; width: 48px" tabIndex="1"/>
                        <ui:textField binding="#{Bancos.tfnombrebco}" id="tfnombrebco" maxLength="50"
                            style="left: 576px; top: 168px; position: absolute; width: 238px" tabIndex="2"/>
                        <ui:textField binding="#{Bancos.tfrespbco}" id="tfrespbco" maxLength="100"
                            style="left: 576px; top: 192px; position: absolute; width: 238px" tabIndex="3"/>
                        <ui:textField binding="#{Bancos.tfcargobco}" id="tfcargobco" maxLength="50"
                            style="left: 576px; top: 216px; position: absolute; width: 238px" tabIndex="4"/>
                        <ui:textField binding="#{Bancos.tfcorreobco}" id="tfcorreobco" maxLength="500"
                            style="left: 576px; top: 240px; position: absolute; width: 238px" tabIndex="5"/>
                        <ui:textField binding="#{Bancos.tftelbco}" id="tftelbco" maxLength="50"
                            style="left: 576px; top: 264px; position: absolute; width: 238px" tabIndex="6"/>
                        <ui:button action="#{Bancos.buttonbcoadd_action}" binding="#{Bancos.buttonbcoadd}" id="buttonbcoadd"
                            style="left: 722px; top: 336px; position: absolute; width: 93px" tabIndex="8" text="Adicionar"/>
                        <ui:table augmentTitle="false" binding="#{Bancos.table1}" id="table1" paginateButton="true" paginationControls="true"
                            rendered="#{Bancos.bancoDataProvider}" selectMultipleButton="true" style="left: 264px; top: 384px; position: absolute; width: 726px"
                            title="Bancos" width="295">
                            <ui:tableRowGroup binding="#{Bancos.tableRowGroup1}" id="tableRowGroup1" rows="10" sourceData="#{Bancos.bancoDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Bancos.tableColumn7}" id="tableColumn7">
                                    <ui:button action="#{Bancos.btEditar_action}" binding="#{Bancos.btEditar}" id="btEditar" imageURL="/resources/edit.GIF" text=""/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn8}" id="tableColumn8" width="0">
                                    <ui:button action="#{Bancos.btEliminar_action}" binding="#{Bancos.btEliminar}" id="btEliminar" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text=""/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn1}" headerText="ID BANCO" id="tableColumn1" sort="IDBANCO">
                                    <ui:staticText binding="#{Bancos.stIdBanco}" id="stIdBanco" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn2}" headerText="NOMBRE" id="tableColumn2" sort="NOMBRE" width="181">
                                    <ui:staticText binding="#{Bancos.staticText3}" id="staticText3" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn3}" headerText="RESPONSABLE" id="tableColumn3" sort="RESPONSABLE">
                                    <ui:staticText binding="#{Bancos.staticText4}" id="staticText4" text="#{currentRow.value['RESPONSABLE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn4}" headerText="CARGO" id="tableColumn4" sort="CARGO">
                                    <ui:staticText binding="#{Bancos.staticText5}" id="staticText5" text="#{currentRow.value['CARGO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn5}" headerText="CORREO" id="tableColumn5" sort="CORREO">
                                    <ui:staticText binding="#{Bancos.staticText6}" id="staticText6" text="#{currentRow.value['CORREO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn6}" headerText="TELEFONO" id="tableColumn6" sort="TELEFONO">
                                    <ui:staticText binding="#{Bancos.staticText7}" id="staticText7" text="#{currentRow.value['TELEFONO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Bancos.tableColumn9}" headerText="DIRCORRES" id="tableColumn9" sort="DIRCORRES">
                                    <ui:staticText binding="#{Bancos.staticText1}" id="staticText1" text="#{currentRow.value['DIRCORRES']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                            <ui:tableRowGroup binding="#{Bancos.tableRowGroup2}" id="tableRowGroup2" rows="10" sourceData="#{Bancos.defaultTableDataProvider}" sourceVar="currentRow"/>
                        </ui:table>
                        <ui:label binding="#{Bancos.label1}" for="tfidbco" id="label1" style="left: 264px; top: 168px; position: absolute" text="Banco"/>
                        <ui:label binding="#{Bancos.label2}" for="tfnombrebco" id="label2" style="left: 408px; top: 168px; position: absolute" text="Nombre"/>
                        <ui:label binding="#{Bancos.label3}" for="tfrespbco" id="label3" style="left: 408px; top: 192px; position: absolute" text="Responsable"/>
                        <ui:label binding="#{Bancos.label4}" for="tfcargobco" id="label4" style="left: 408px; top: 216px; position: absolute" text="Cargo"/>
                        <ui:label binding="#{Bancos.label5}" for="tfcorreobco" id="label5" style="left: 408px; top: 240px; position: absolute" text="Correo Electrónico"/>
                        <ui:label binding="#{Bancos.label6}" for="tftelbco" id="label6" style="left: 408px; top: 264px; position: absolute" text="Teléfono"/>
                        <ui:textField binding="#{Bancos.tfDirCorrespondencia}" id="tfDirCorrespondencia"
                            style="left: 576px; top: 288px; position: absolute; width: 238px" tabIndex="7"/>
                        <ui:label binding="#{Bancos.label7}" id="label7" style="left: 408px; top: 288px; position: absolute" text="Dirección Correspondencia "/>
                        <ui:tableColumn binding="#{Bancos.tableColumn10}" id="tableColumn10"/>
                        <ui:staticText binding="#{Bancos.staticText2}" id="staticText2"/>
                        <ui:tableColumn binding="#{Bancos.tableColumn11}" id="tableColumn11"/>
                        <ui:staticText binding="#{Bancos.staticText8}" id="staticText8"/>
                        <ui:tableColumn binding="#{Bancos.tableColumn12}" id="tableColumn12"/>
                        <ui:staticText binding="#{Bancos.staticText9}" id="staticText9"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
