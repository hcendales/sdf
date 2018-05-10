<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Validador.page1}" id="page1">
            <ui:html binding="#{Validador.html1}" id="html1">
                <ui:head binding="#{Validador.head1}" id="head1">
                    <ui:link binding="#{Validador.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Validador.body1}" focus="form1:ddMunicipio" id="body1" style="background-color: rgb(255, 255, 255); -rave-layout: grid">
                    <ui:form binding="#{Validador.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Validador.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Validador Fechas"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{Validador.tfIdValidador}" id="tfIdValidador" maxLength="3"
                            style="left: 336px; top: 504px; position: absolute; width: 72px" tabIndex="2"/>
                        <ui:calendar binding="#{Validador.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 432px; top: 576px; position: absolute" tabIndex="4"/>
                        <ui:calendar binding="#{Validador.clFechaFin}" dateFormatPattern="yyyy-MM-dd" id="clFechaFin"
                            style="left: 432px; top: 624px; position: absolute" tabIndex="5"/>
                        <ui:radioButtonGroup binding="#{Validador.rbTipoComparendo}" id="rbTipoComparendo"
                            items="#{Validador.rbTipoComparendoDefaultOptions.options}" style="height: 48px; left: 576px; top: 504px; position: absolute" tabIndex="3"/>
                        <ui:textField binding="#{Validador.tfMunicipio}" id="tfMunicipio" maxLength="8"
                            style="left: 432px; top: 696px; position: absolute; width: 70px" tabIndex="6"/>
                        <ui:textField binding="#{Validador.tfFcm}" id="tfFcm" maxLength="8" style="left: 432px; top: 720px; position: absolute; width: 70px" tabIndex="7"/>
                        <ui:textField binding="#{Validador.tfConcesionario}" id="tfConcesionario" maxLength="8"
                            style="left: 432px; top: 744px; position: absolute; width: 70px" tabIndex="8"/>
                        <ui:textField binding="#{Validador.tfAcuerdo}" id="tfAcuerdo" maxLength="8"
                            style="left: 432px; top: 768px; position: absolute; width: 70px" tabIndex="9"/>
                        <ui:button action="#{Validador.btActualizar_Agregar_action}" binding="#{Validador.btActualizar_Agregar}" id="btActualizar_Agregar"
                            onClick="btActualizar_Agregar_action()" style="left: 503px; top: 816px; position: absolute; width: 96px" tabIndex="16" text="Adicionar"/>
                        <ui:dropDown binding="#{Validador.ddMunicipio}" id="ddMunicipio"
                            items="#{Validador.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" required="true"
                            style="left: 336px; top: 144px; position: absolute; width: 504px" tabIndex="1" valueChangeListener="#{Validador.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{Validador.label1}" for="ddMunicipio" id="label1" style="left: 264px; top: 144px; position: absolute" text="Municipio"/>
                        <ui:table augmentTitle="false" binding="#{Validador.table1}" id="table1" paginationControls="true"
                            style="height: 68px; left: 264px; top: 192px; position: absolute" title="Validador Fecha" width="419">
                            <ui:tableRowGroup binding="#{Validador.tableRowGroup1}" emptyDataMsg="No hay Registros" id="tableRowGroup1" rows="4"
                                sourceData="#{Validador.validador_fechaDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Validador.tableColumn1}" id="tableColumn1" width="50">
                                    <ui:button action="#{Validador.beditar_action}" binding="#{Validador.beditar}" id="beditar" imageURL="/resources/edit.GIF"
                                        onClick="beditar_action()" text="Editar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Validador.tableColumn16}" id="tableColumn16" width="36">
                                    <ui:button action="#{Validador.beliminar_action}" binding="#{Validador.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this); &#xa;function confirmar(formObj)&#xa;{&#xa; if(confirm(&quot;Desea eliminar registro ?&quot;))&#xa; { &#xa; btEliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; beliminar_action();&#xa; return false; &#xa; } &#xa;}" text="eliinar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Validador.tableColumn2}" headerText="VALIDADOR" id="tableColumn2" sort="IDVALIDADOR" width="91">
                                    <ui:staticText binding="#{Validador.stValidador}" id="stValidador" text="#{currentRow.value['IDVALIDADOR']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Validador.tableColumn5}" headerText="TIPO" id="tableColumn5" sort="INDTIPO">
                                    <ui:staticText binding="#{Validador.stTipo}" id="stTipo" text="#{currentRow.value['INDTIPO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Validador.tableColumn3}" headerText="FECHA INI" id="tableColumn3" sort="FECHA_INI" width="121">
                                    <ui:staticText binding="#{Validador.stFechaIni}" id="stFechaIni" text="#{currentRow.value['FECHA_INI']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Validador.tableColumn4}" headerText="FECHA FIN" id="tableColumn4" sort="FECHA_FIN" width="289">
                                    <ui:staticText binding="#{Validador.staticText4}" id="staticText4" text="#{currentRow.value['FECHA_FIN']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{Validador.label2}" for="tfIdValidador" id="label2" style="left: 264px; top: 504px; position: absolute" text=" Validador"/>
                        <ui:label binding="#{Validador.label3}" for="clFechaFin" id="label3" style="left: 264px; top: 624px; position: absolute" text="Fecha Final"/>
                        <ui:label binding="#{Validador.label4}" for="clFechaIni" id="label4" style="left: 264px; top: 576px; position: absolute" text="Fecha Inicio"/>
                        <ui:label binding="#{Validador.label5}" for="tfMunicipio" id="label5" style="left: 264px; top: 696px; position: absolute" text=" % Municipio"/>
                        <ui:label binding="#{Validador.label6}" for="tfFcm" id="label6" style="left: 264px; top: 720px; position: absolute" text=" % FCM Contravencional"/>
                        <ui:label binding="#{Validador.label7}" for="tfConcesionario" id="label7" style="left: 264px; top: 744px; position: absolute" text=" % Conces Contravencional"/>
                        <ui:label binding="#{Validador.label8}" for="tfAcuerdo" id="label8" style="left: 264px; top: 768px; position: absolute" text=" % Acuerdo"/>
                        <ui:tableColumn binding="#{Validador.tableColumn66}" id="tableColumn66"/>
                        <ui:tableColumn binding="#{Validador.tableColumn17}" id="tableColumn17"/>
                        <ui:label binding="#{Validador.label9}" for="tfIdValidador" id="label9" style="left: 456px; top: 504px; position: absolute" text="Tipo de Recaudo"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
