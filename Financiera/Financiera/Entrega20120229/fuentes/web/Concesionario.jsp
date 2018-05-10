<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Concesionario.page1}" id="page1">
            <ui:html binding="#{Concesionario.html1}" id="html1">
                <ui:head binding="#{Concesionario.head1}" id="head1">
                    <ui:link binding="#{Concesionario.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Concesionario.body1}" focus="form1:tfIdConces" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Concesionario.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Concesionario.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Concesionarios"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{Concesionario.label2}" id="label2" style="left: 264px; top: 456px; position: absolute" text="ID"/>
                        <ui:textField binding="#{Concesionario.tfIdConces}" id="tfIdConces" maxLength="2"
                            style="left: 360px; top: 456px; position: absolute; width: 48px" tabIndex="3"/>
                        <ui:label binding="#{Concesionario.label3}" id="label3" style="left: 264px; top: 480px; position: absolute" text="Nombre"/>
                        <ui:textField binding="#{Concesionario.tfNombre}" id="tfNombre" maxLength="50"
                            style="left: 360px; top: 480px; position: absolute; width: 216px" tabIndex="4"/>
                        <ui:label binding="#{Concesionario.label4}" id="label4" style="left: 264px; top: 528px; position: absolute" text="Correo"/>
                        <ui:textField binding="#{Concesionario.tfCorreo}" id="tfCorreo" style="left: 360px; top: 528px; position: absolute; width: 216px" tabIndex="6"/>
                        <ui:label binding="#{Concesionario.label5}" id="label5" style="left: 264px; top: 504px; position: absolute" text="Nit"/>
                        <ui:textField binding="#{Concesionario.tfNit}" id="tfNit" maxLength="10"
                            style="left: 360px; top: 504px; position: absolute; width: 216px" tabIndex="5"/>
                        <ui:label binding="#{Concesionario.label6}" id="label6" style="left: 468px; top: 576px; position: absolute" text="SIMIT 10%"/>
                        <ui:label binding="#{Concesionario.label7}" id="label7" style="left: 264px; top: 600px; position: absolute" text="% Concesionario"/>
                        <ui:label binding="#{Concesionario.label8}" id="label8" style="left: 264px; top: 648px; position: absolute" text="% Fondo Cobertura Concesionario"/>
                        <ui:label binding="#{Concesionario.label9}" id="label9" style="left: 264px; top: 672px; position: absolute" text="% Fondo Cobertura SIMIT"/>
                        <ui:label binding="#{Concesionario.label10}" id="label10" style="left: 264px; top: 624px; position: absolute" text="% SIMIT"/>
                        <ui:label binding="#{Concesionario.label11}" id="label11" style="left: 264px; top: 696px; position: absolute" text="% Equilibrio Económico"/>
                        <ui:textField binding="#{Concesionario.tfS_PConces}" id="tfS_PConces" maxLength="7"
                            style="left: 468px; top: 600px; position: absolute; width: 72px" tabIndex="7"/>
                        <ui:textField binding="#{Concesionario.tfS_PSimit}" id="tfS_PSimit" maxLength="7"
                            style="left: 468px; top: 624px; position: absolute; width: 72px" tabIndex="10"/>
                        <ui:textField binding="#{Concesionario.tfS_PFondoC}" id="tfS_PFondoC" maxLength="7"
                            style="left: 468px; top: 648px; position: absolute; width: 72px" tabIndex="13"/>
                        <ui:textField binding="#{Concesionario.tfS_PFondoS}" id="tfS_PFondoS" maxLength="7"
                            style="left: 468px; top: 672px; position: absolute; width: 72px" tabIndex="16"/>
                        <ui:textField binding="#{Concesionario.tfS_PEquilibrio}" id="tfS_PEquilibrio" maxLength="7"
                            style="left: 468px; top: 696px; position: absolute; width: 72px" tabIndex="19"/>
                        <ui:label binding="#{Concesionario.label12}" id="label12" style="left: 468px; top: 720px; position: absolute; width: 142px" text="POLCA MUNICIPIO 5%"/>
                        <ui:textField binding="#{Concesionario.tfPM_PSimit}" id="tfPM_PSimit" maxLength="7"
                            style="left: 468px; top: 768px; position: absolute; width: 72px" tabIndex="25"/>
                        <ui:textField binding="#{Concesionario.tfPM_PConces}" id="tfPM_PConces" maxLength="7"
                            style="left: 468px; top: 744px; position: absolute; width: 72px" tabIndex="22"/>
                        <ui:textField binding="#{Concesionario.tfPM_PFondoS}" id="tfPM_PFondoS" maxLength="7"
                            style="left: 468px; top: 816px; position: absolute; width: 72px" tabIndex="31"/>
                        <ui:textField binding="#{Concesionario.tfPM_PEquilibrio}" id="tfPM_PEquilibrio" maxLength="7"
                            style="left: 468px; top: 840px; position: absolute; width: 72px" tabIndex="34"/>
                        <ui:textField binding="#{Concesionario.tfPM_PFondoC}" id="tfPM_PFondoC" maxLength="7"
                            style="left: 468px; top: 792px; position: absolute; width: 72px" tabIndex="28"/>
                        <ui:label binding="#{Concesionario.label13}" id="label13" style="left: 468px; top: 864px; position: absolute; width: 118px" text="POLCA POLCA 5%"/>
                        <ui:textField binding="#{Concesionario.tfPP_PSevial}" id="tfPP_PSevial" maxLength="7"
                            style="left: 468px; top: 912px; position: absolute; width: 72px" tabIndex="40"/>
                        <ui:textField binding="#{Concesionario.tfPP_PSimit}" id="tfPP_PSimit" maxLength="7"
                            style="left: 468px; top: 888px; position: absolute; width: 72px" tabIndex="37"/>
                        <ui:label binding="#{Concesionario.label14}" id="label14" style="left: 264px; top: 888px; position: absolute; width: 46px" text="% SIMIT"/>
                        <ui:label binding="#{Concesionario.label15}" id="label15" style="left: 264px; top: 912px; position: absolute; width: 70px" text="% SEVIAL"/>
                        <ui:label binding="#{Concesionario.label17}" id="label17" style="left: 468px; top: 960px; position: absolute; width: 142px" text="CONVENIO POLCA  45%"/>
                        <ui:label binding="#{Concesionario.label18}" id="label18" style="left: 264px; top: 936px; position: absolute; width: 142px" text="% Equilibrio Económico"/>
                        <ui:textField binding="#{Concesionario.tfPP_PEquilibrio}" id="tfPP_PEquilibrio" maxLength="7"
                            style="left: 468px; top: 936px; position: absolute; width: 72px" tabIndex="43"/>
                        <ui:label binding="#{Concesionario.label19}" id="label19" style="left: 264px; top: 984px; position: absolute; width: 70px" text="% POLCA"/>
                        <ui:label binding="#{Concesionario.label20}" id="label20" style="left: 264px; top: 1008px; position: absolute; width: 70px" text="% FCM"/>
                        <ui:label binding="#{Concesionario.label21}" id="label21" style="left: 264px; top: 1032px; position: absolute; width: 70px" text="% SEVIAL"/>
                        <ui:label binding="#{Concesionario.label22}" id="label22" style="left: 264px; top: 1056px; position: absolute; width: 142px" text="% Equilibrio Económico"/>
                        <ui:textField binding="#{Concesionario.tfCP_PPolca}" id="tfCP_PPolca" maxLength="7"
                            style="left: 468px; top: 984px; position: absolute; width: 72px" tabIndex="46"/>
                        <ui:textField binding="#{Concesionario.tfCP_PFcm}" id="tfCP_PFcm" maxLength="7"
                            style="left: 468px; top: 1008px; position: absolute; width: 72px" tabIndex="49"/>
                        <ui:textField binding="#{Concesionario.tfCP_PSevial}" id="tfCP_PSevial" maxLength="7"
                            style="left: 468px; top: 1032px; position: absolute; width: 72px" tabIndex="52"/>
                        <ui:textField binding="#{Concesionario.tfCP_PEquilibrio}" id="tfCP_PEquilibrio" maxLength="7"
                            style="left: 468px; top: 1056px; position: absolute; width: 72px" tabIndex="55"/>
                        <ui:button action="#{Concesionario.btAdicionar_action}" binding="#{Concesionario.btAdicionar}" id="btAdicionar"
                            style="left: 671px; top: 1104px; position: absolute; width: 95px" tabIndex="58" text="Adicionar"/>
                        <ui:label binding="#{Concesionario.label16}" id="label16" style="left: 264px; top: 816px; position: absolute" text="% Fondo Cobertura SIMIT"/>
                        <ui:label binding="#{Concesionario.label23}" id="label23" style="left: 264px; top: 792px; position: absolute" text="% Fondo Cobertura Concesionario"/>
                        <ui:label binding="#{Concesionario.label24}" id="label24" style="left: 264px; top: 744px; position: absolute" text="% Concesionario"/>
                        <ui:label binding="#{Concesionario.label25}" id="label25" style="left: 264px; top: 840px; position: absolute" text="% Equilibrio Económico"/>
                        <ui:label binding="#{Concesionario.label26}" id="label26" style="left: 264px; top: 768px; position: absolute" text="% SIMIT"/>
                        <ui:label binding="#{Concesionario.label27}" id="label27" style="left: 600px; top: 576px; position: absolute; width: 70px" text="LOCAL"/>
                        <ui:label binding="#{Concesionario.label28}" id="label28" style="left: 696px; top: 576px; position: absolute; width: 70px" text="EXTERNO"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalConS}" id="tfCCLocalConS" maxLength="4"
                            style="left: 600px; top: 600px; position: absolute; width: 72px" tabIndex="8"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalSimS}" id="tfCCLocalSimS" maxLength="4"
                            style="left: 600px; top: 624px; position: absolute; width: 72px" tabIndex="11"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalFonS}" id="tfCCLocalFonS" maxLength="4"
                            style="left: 600px; top: 648px; position: absolute; width: 72px" tabIndex="14"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalCobS}" id="tfCCLocalCobS" maxLength="4"
                            style="left: 600px; top: 672px; position: absolute; width: 72px" tabIndex="17"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalEquS}" id="tfCCLocalEquS" maxLength="4"
                            style="left: 600px; top: 696px; position: absolute; width: 72px" tabIndex="20"/>
                        <ui:textField binding="#{Concesionario.tfCCExtConS}" id="tfCCExtConS" maxLength="4"
                            style="left: 696px; top: 600px; position: absolute; width: 72px" tabIndex="9"/>
                        <ui:textField binding="#{Concesionario.tfCCExtSimS}" id="tfCCExtSimS" maxLength="4"
                            style="left: 696px; top: 624px; position: absolute; width: 72px" tabIndex="12"/>
                        <ui:textField binding="#{Concesionario.tfCCExtFonS}" id="tfCCExtFonS" maxLength="4"
                            style="left: 696px; top: 648px; position: absolute; width: 72px" tabIndex="15"/>
                        <ui:textField binding="#{Concesionario.tfCCExtCobS}" id="tfCCExtCobS" maxLength="4"
                            style="left: 696px; top: 672px; position: absolute; width: 72px" tabIndex="18"/>
                        <ui:textField binding="#{Concesionario.tfCCExtEquS}" id="tfCCExtEquS" maxLength="4"
                            style="left: 696px; top: 696px; position: absolute; width: 72px" tabIndex="21"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalSimP}" id="tfCCLocalSimP" maxLength="4"
                            style="left: 600px; top: 768px; position: absolute; width: 72px" tabIndex="26"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalConP}" id="tfCCLocalConP" maxLength="4"
                            style="left: 600px; top: 744px; position: absolute; width: 72px" tabIndex="23"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalCobP}" id="tfCCLocalCobP" maxLength="4"
                            style="left: 600px; top: 816px; position: absolute; width: 72px" tabIndex="32"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalEquP}" id="tfCCLocalEquP" maxLength="4"
                            style="left: 600px; top: 840px; position: absolute; width: 72px" tabIndex="35"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalFonP}" id="tfCCLocalFonP" maxLength="4"
                            style="left: 600px; top: 792px; position: absolute; width: 72px" tabIndex="29"/>
                        <ui:textField binding="#{Concesionario.tfCCExtEquP}" id="tfCCExtEquP" maxLength="4"
                            style="left: 696px; top: 840px; position: absolute; width: 72px" tabIndex="36"/>
                        <ui:textField binding="#{Concesionario.tfCCExtFonP}" id="tfCCExtFonP" maxLength="4"
                            style="left: 696px; top: 792px; position: absolute; width: 72px" tabIndex="30"/>
                        <ui:textField binding="#{Concesionario.tfCCExtConP}" id="tfCCExtConP" maxLength="4"
                            style="left: 696px; top: 744px; position: absolute; width: 72px" tabIndex="24"/>
                        <ui:textField binding="#{Concesionario.tfCCExtSimP}" id="tfCCExtSimP" maxLength="4"
                            style="left: 696px; top: 768px; position: absolute; width: 72px" tabIndex="27"/>
                        <ui:textField binding="#{Concesionario.tfCCExtCobP}" id="tfCCExtCobP" maxLength="4"
                            style="left: 696px; top: 816px; position: absolute; width: 72px" tabIndex="33"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalSimPP}" id="tfCCLocalSimPP" maxLength="4"
                            style="left: 600px; top: 888px; position: absolute; width: 72px" tabIndex="38"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalSevPP}" id="tfCCLocalSevPP" maxLength="4"
                            style="left: 600px; top: 912px; position: absolute; width: 72px" tabIndex="41"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalEquPP}" id="tfCCLocalEquPP" maxLength="4"
                            style="left: 600px; top: 936px; position: absolute; width: 72px" tabIndex="44"/>
                        <ui:textField binding="#{Concesionario.tfCCExtSimPP}" id="tfCCExtSimPP" maxLength="4"
                            style="left: 696px; top: 888px; position: absolute; width: 72px" tabIndex="39"/>
                        <ui:textField binding="#{Concesionario.tfCCExtSevPP}" id="tfCCExtSevPP" maxLength="4"
                            style="left: 696px; top: 912px; position: absolute; width: 72px" tabIndex="42"/>
                        <ui:textField binding="#{Concesionario.tfCCExtEquPP}" id="tfCCExtEquPP" maxLength="4"
                            style="left: 696px; top: 936px; position: absolute; width: 72px" tabIndex="45"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalSimCP}" id="tfCCLocalSimCP" maxLength="4"
                            style="left: 600px; top: 984px; position: absolute; width: 72px" tabIndex="47"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalFcmCP}" id="tfCCLocalFcmCP" maxLength="4"
                            style="left: 600px; top: 1008px; position: absolute; width: 72px" tabIndex="50"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalSevCP}" id="tfCCLocalSevCP" maxLength="4"
                            style="left: 600px; top: 1032px; position: absolute; width: 72px" tabIndex="53"/>
                        <ui:textField binding="#{Concesionario.tfCCLocalEquCP}" id="tfCCLocalEquCP" maxLength="4"
                            style="left: 600px; top: 1056px; position: absolute; width: 72px" tabIndex="56"/>
                        <ui:textField binding="#{Concesionario.tfCCExtEquCP}" id="tfCCExtEquCP" maxLength="4"
                            style="left: 696px; top: 1056px; position: absolute; width: 72px" tabIndex="57"/>
                        <ui:textField binding="#{Concesionario.tfCCExtSevCP}" id="tfCCExtSevCP" maxLength="4"
                            style="left: 696px; top: 1032px; position: absolute; width: 72px" tabIndex="54"/>
                        <ui:textField binding="#{Concesionario.tfCCExtSimCP}" id="tfCCExtSimCP" maxLength="4"
                            style="left: 696px; top: 984px; position: absolute; width: 72px" tabIndex="48"/>
                        <ui:textField binding="#{Concesionario.tfCCExtFcmCP}" id="tfCCExtFcmCP" maxLength="4"
                            style="left: 696px; top: 1008px; position: absolute; width: 72px" tabIndex="51"/>
                        <ui:table augmentTitle="false" binding="#{Concesionario.table1}" id="table1" paginationControls="true"
                            style="left: 264px; top: 168px; position: absolute; width: 240px" title="Concesionarios" width="240">
                            <ui:tableRowGroup binding="#{Concesionario.tableRowGroup1}" emptyDataMsg="No hay Registros" id="tableRowGroup1" rows="5"
                                sourceData="#{Concesionario.concesionarioDataProvider1}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{Concesionario.tableColumn3}" id="tableColumn3">
                                    <ui:button action="#{Concesionario.bconsultar_action}" binding="#{Concesionario.bconsultar}" id="bconsultar"
                                        imageURL="/resources/edit.GIF" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Concesionario.tableColumn4}" id="tableColumn4">
                                    <ui:button action="#{Concesionario.beliminar_action}" binding="#{Concesionario.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;" text="text"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Concesionario.tableColumn1}" headerText="ID" id="tableColumn1" sort="IDCONCESIONARIO">
                                    <ui:staticText binding="#{Concesionario.stId}" id="stId" text="#{currentRow.value['IDCONCESIONARIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{Concesionario.tableColumn2}" headerText="NOMBRE" id="tableColumn2" sort="NOMBRE">
                                    <ui:staticText binding="#{Concesionario.staticText2}" id="staticText2" text="#{currentRow.value['NOMBRE']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{Concesionario.label1}" id="label1" style="left: 624px; top: 552px; position: absolute; width: 142px" text="CENTROS DE COSTO"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
