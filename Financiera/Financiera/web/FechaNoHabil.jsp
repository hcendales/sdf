<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{FechaNoHabil.page1}" id="page1">
            <ui:html binding="#{FechaNoHabil.html1}" id="html1">
                <ui:head binding="#{FechaNoHabil.head1}" id="head1">
                    <ui:link binding="#{FechaNoHabil.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{FechaNoHabil.body1}" focus="form1:calendarfecnohab" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{FechaNoHabil.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{FechaNoHabil.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Fechas NO Hábiles"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:calendar binding="#{FechaNoHabil.calendarfecnohab}" dateFormatPattern="yyyy-MM-dd" id="calendarfecnohab"
                            style="left: 336px; top: 168px; position: absolute" tabIndex="1"/>
                        <ui:button action="#{FechaNoHabil.buttonfecnohabadd_action}" binding="#{FechaNoHabil.buttonfecnohabadd1}" id="buttonfecnohabadd1"
                            onClick="buttonfecnohabadd_action()" style="left: 407px; top: 216px; position: absolute; width: 93px" tabIndex="2" text="Adicionar"/>
                        <ui:table augmentTitle="false" binding="#{FechaNoHabil.table}" id="table"
                            style="left: 336px; top: 288px; position: absolute; width: 78px" title="Fechas NO Habiles" width="78">
                            <ui:tableRowGroup binding="#{FechaNoHabil.tableRowGroup1}" id="tableRowGroup1" rows="5"
                                sourceData="#{FechaNoHabil.fecha_no_habilDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{FechaNoHabil.tableColumn2}" height="24" id="tableColumn2" sort="VALOR" width="39">
                                    <ui:button action="#{FechaNoHabil.btfecnohabdel_action}" binding="#{FechaNoHabil.btfecnohabdel}" id="btfecnohabdel"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="Button"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{FechaNoHabil.tableColumn1}" headerText="FECHA" id="tableColumn1" sort="FECHA">
                                    <ui:staticText binding="#{FechaNoHabil.staticText1}" id="staticText1" text="#{currentRow.value['FECHA']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{FechaNoHabil.label2}" for="calendarfecnohab" id="label2"
                            style="left: 264px; top: 168px; position: absolute; width: 48px" text="Fecha"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
