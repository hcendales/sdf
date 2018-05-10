<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Parconta.page1}" id="page1">
            <ui:html binding="#{Parconta.html1}" id="html1">
                <ui:head binding="#{Parconta.head1}" id="head1">
                    <ui:link binding="#{Parconta.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Parconta.body1}" focus="form1:calendarfecnohab" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Parconta.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Parconta.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Defincion Parametros Contabilidad"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:button action="#{Parconta.badicionar_action}" binding="#{Parconta.badicionar}" id="badicionar" onClick="buttonfecnohabadd_action()"
                            style="left: 263px; top: 264px; position: absolute; width: 117px" tabIndex="2" text="Adicionar"/>
                        <ui:label binding="#{Parconta.label2}" id="label2" style="height: 22px; left: 264px; top: 168px; position: absolute; width: 118px" text="Id Parametro"/>
                        <ui:label binding="#{Parconta.label1}" id="label1" style="height: 22px; left: 264px; top: 192px; position: absolute; width: 118px" text="Parametro"/>
                        <ui:button action="#{Parconta.bcancelar_action}" binding="#{Parconta.bcancelar}" id="bcancelar" onClick="buttonfecnohabadd_action()"
                            style="left: 407px; top: 264px; position: absolute; width: 117px" tabIndex="2" text="Cancelar"/>
                        <ui:textField binding="#{Parconta.txtIdParametro}" id="txtIdParametro" maxLength="50" style="position: absolute; left: 408px; top: 168px"/>
                        <ui:textField binding="#{Parconta.txtParametro}" id="txtParametro" maxLength="250" style="left: 408px; top: 192px; position: absolute"/>
                        <ui:table augmentTitle="false" binding="#{Parconta.table1}" id="table1"
                            style="left: 264px; top: 312px; position: absolute; width: 240px" title="Parametros" width="370">
                            <ui:tableRowGroup binding="#{Parconta.tableRowGroup1}" id="tableRowGroup1" rows="5" sourceData="#{Parconta.par_contaDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Parconta.tableColumn3}" id="tableColumn3">
                                    <ui:button action="#{Parconta.beditar_action}" binding="#{Parconta.beditar}" id="beditar" imageURL="/resources/edit.GIF" text="editar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Parconta.tableColumn4}" id="tableColumn4">
                                    <ui:button action="#{Parconta.beliminar_action}" binding="#{Parconta.beliminar}" id="beliminar" imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="eliminar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Parconta.tableColumn1}" headerText="IDPARAMETRO" id="tableColumn1" sort="IDPARAMETRO">
                                    <ui:staticText binding="#{Parconta.stidparametro}" id="stidparametro" text="#{currentRow.value['IDPARAMETRO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Parconta.tableColumn2}" headerText="PARAMETRO" id="tableColumn2" sort="PARAMETRO">
                                    <ui:staticText binding="#{Parconta.stparametro}" id="stparametro" text="#{currentRow.value['PARAMETRO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Parconta.tableColumn5}" headerText="DESCRIPCION" id="tableColumn5" sort="DESCRIPCION" width="113">
                                    <ui:staticText binding="#{Parconta.stDescripcion}" id="stDescripcion" text="#{currentRow.value['DESCRIPCION']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{Parconta.txtDescripcion}" id="txtDescripcion" maxLength="250" style="left: 408px; top: 216px; position: absolute"/>
                        <ui:label binding="#{Parconta.label3}" id="label3" style="height: 22px; left: 264px; top: 216px; position: absolute; width: 118px" text="Descripcion"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
