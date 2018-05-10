<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{SalarioMinimo.page1}" id="page1">
            <ui:html binding="#{SalarioMinimo.html1}" id="html1">
                <ui:head binding="#{SalarioMinimo.head1}" id="head1" title="Administracion SIMIT">
                    <ui:link binding="#{SalarioMinimo.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{SalarioMinimo.body1}" focus="form1:tfanosalmin" id="body1" style="background-color: rgb(255, 255, 255); -rave-layout: grid">
                    <ui:form binding="#{SalarioMinimo.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{SalarioMinimo.stopcion}" id="stopcion"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Salario Minimo"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{SalarioMinimo.tfanosalmin}" id="tfanosalmin" maxLength="4"
                            style="left: 360px; top: 168px; position: absolute; width: 96px" tabIndex="1"/>
                        <ui:textField binding="#{SalarioMinimo.tfvalorsalmin}" id="tfvalorsalmin" maxLength="8"
                            style="left: 360px; top: 192px; position: absolute; width: 96px" tabIndex="2"/>
                        <ui:button action="#{SalarioMinimo.buttonsalminadd_action}" binding="#{SalarioMinimo.buttonsalminadd}" id="buttonsalminadd"
                            onClick="buttonsalminadd_action()" style="left: 359px; top: 240px; position: absolute; width: 93px" tabIndex="3" text="Adicionar"/>
                        <ui:table augmentTitle="false" binding="#{SalarioMinimo.table}" id="table"
                            style="left: 264px; top: 288px; position: absolute; width: 240px" title="SMLVD Diarios" width="240">
                            <ui:tableRowGroup binding="#{SalarioMinimo.tableRowGroup1}" id="tableRowGroup1" rows="5"
                                sourceData="#{SalarioMinimo.salario_minimoDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{SalarioMinimo.tableColumn3}" id="tableColumn3" sort="VALOR">
                                    <ui:button action="#{SalarioMinimo.btsalmindel_action}" binding="#{SalarioMinimo.btsalmindel}" id="btsalmindel"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="Button"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SalarioMinimo.tableColumn1}" headerText="AÑO" id="tableColumn1" sort="ANHO">
                                    <ui:staticText binding="#{SalarioMinimo.staticText1}" id="staticText1" text="#{currentRow.value['ANHO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{SalarioMinimo.tableColumn2}" headerText="VALOR" id="tableColumn2" sort="VALOR">
                                    <ui:staticText binding="#{SalarioMinimo.staticText2}" id="staticText2" text="#{currentRow.value['VALOR']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{SalarioMinimo.label1}" for="tfanosalmin" id="label1" style="left: 264px; top: 168px; position: absolute" text="Año (AAAA)"/>
                        <ui:label binding="#{SalarioMinimo.label2}" for="tfvalorsalmin" id="label2" style="left: 264px; top: 192px; position: absolute" text="Valor"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
