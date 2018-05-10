<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{VBO_Polca.page1}" id="page1">
            <ui:html binding="#{VBO_Polca.html1}" id="html1">
                <ui:head binding="#{VBO_Polca.head1}" id="head1">
                    <ui:link binding="#{VBO_Polca.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{VBO_Polca.body1}" focus="form1:tfClaveActual" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{VBO_Polca.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{VBO_Polca.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 288px; top: 120px; position: absolute" text="Visto Bueno Interventoria POLCA - Recaudo Local"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:radioButtonGroup binding="#{VBO_Polca.radioButtonGroup1}" id="radioButtonGroup1"
                            items="#{VBO_Polca.radioButtonGroup1DefaultOptions.options}" onClick="" style="left: 336px; top: 192px; position: absolute" valueChangeListener="#{VBO_Polca.radioButtonGroup1_processValueChange}"/>
                        <ui:radioButtonGroup binding="#{VBO_Polca.radioButtonGroup2}" id="radioButtonGroup2"
                            items="#{VBO_Polca.radioButtonGroup2DefaultOptions.options}" onClick="common_timeoutSubmitForm(this.form, 'radioButtonGroup2');"
                            style="left: 480px; top: 192px; position: absolute" valueChangeListener="#{VBO_Polca.radioButtonGroup2_processValueChange}"/>
                        <ui:calendar binding="#{VBO_Polca.calendar1}" dateFormatPattern="yyyy-MM-dd" id="calendar1"
                            style="left: 456px; top: 264px; position: absolute" visible="false"/>
                        <ui:label binding="#{VBO_Polca.label1}" id="label1" style="left: 336px; top: 264px; position: absolute" text="Fecha Corte" visible="false"/>
                        <ui:label binding="#{VBO_Polca.label2}" id="label2" style="left: 336px; top: 264px; position: absolute" text="FechaPago" visible="false"/>
                        <ui:calendar binding="#{VBO_Polca.calendar2}" dateFormatPattern="yyyy-MM-dd" id="calendar2"
                            style="left: 456px; top: 264px; position: absolute" visible="false"/>
                        <ui:label binding="#{VBO_Polca.label3}" id="label3" style="left: 336px; top: 264px; position: absolute" text="Fecha Corte Inicial" visible="false"/>
                        <ui:label binding="#{VBO_Polca.label4}" id="label4" style="left: 336px; top: 312px; position: absolute" text="Fecha Corte Final" visible="false"/>
                        <ui:calendar binding="#{VBO_Polca.calendar3}" dateFormatPattern="yyyy-MM-dd" id="calendar3"
                            style="left: 456px; top: 264px; position: absolute" visible="false"/>
                        <ui:calendar binding="#{VBO_Polca.calendar4}" dateFormatPattern="yyyy-MM-dd" id="calendar4"
                            style="left: 456px; top: 312px; position: absolute" visible="false"/>
                        <ui:button action="#{VBO_Polca.button1_action}" binding="#{VBO_Polca.button1}" id="button1"
                            style="left: 647px; top: 192px; position: absolute" text="Dar Visto Bueno"/>
                        <ui:label binding="#{VBO_Polca.label5}" id="label5" style="left: 336px; top: 432px; position: absolute" text="Observaciones" visible="false"/>
                        <ui:dropDown binding="#{VBO_Polca.dropDown1}" id="dropDown1" items="#{VBO_Polca.dropDown1DefaultOptions.options}"
                            style="left: 480px; top: 384px; position: absolute; width: 216px" visible="false"/>
                        <ui:textArea binding="#{VBO_Polca.textArea1}" id="textArea1"
                            style="height: 96px; left: 480px; top: 432px; position: absolute; width: 312px" visible="false"/>
                        <ui:label binding="#{VBO_Polca.label6}" id="label6" style="left: 336px; top: 384px; position: absolute" text="Banco Recaudador" visible="false"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>