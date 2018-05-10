<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsNovedadMunicipio.page1}" id="page1">
            <ui:html binding="#{ConsNovedadMunicipio.html1}" id="html1">
                <ui:head binding="#{ConsNovedadMunicipio.head1}" id="head1">
                    <ui:link binding="#{ConsNovedadMunicipio.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsNovedadMunicipio.body1}" focus="form1:tfDivipo" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsNovedadMunicipio.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsNovedadMunicipio.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Consulta Novedad Municipio"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfDivipo}" disabled="true" id="tfDivipo" maxLength="8"
                            style="left: 360px; top: 192px; position: absolute; width: 138px" tabIndex="1"/>
                        <ui:label binding="#{ConsNovedadMunicipio.labelDivipo}" for="tfDivipo" id="labelDivipo"
                            style="left: 264px; top: 192px; position: absolute" text="DIVIPO"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfNombre}" disabled="true" id="tfNombre" maxLength="50"
                            style="left: 360px; top: 240px; position: absolute; width: 138px" tabIndex="3"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label1}" id="label1" style="left: 264px; top: 240px; position: absolute" text="Nombre"/>
                        <ui:dropDown binding="#{ConsNovedadMunicipio.ddConcesionario}" disabled="true" id="ddConcesionario"
                            items="#{ConsNovedadMunicipio.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            style="left: 360px; top: 264px; position: absolute; width: 144px" tabIndex="4"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label2}" for="ddConcesionario" id="label2" style="left: 264px; top: 264px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label3}" for="tfNit" id="label3" style="left: 264px; top: 216px; position: absolute" text="NIT"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfNit}" disabled="true" id="tfNit" maxLength="10"
                            style="left: 360px; top: 216px; position: absolute; width: 138px" tabIndex="2"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label4}" id="label4" style="left: 264px; top: 288px; position: absolute" text="Correo"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfCorreo}" disabled="true" id="tfCorreo" maxLength="500"
                            style="left: 360px; top: 288px; position: absolute; width: 138px" tabIndex="5"/>
                        <ui:checkbox binding="#{ConsNovedadMunicipio.cbLiquidarSimitExt}" disabled="true" id="cbLiquidarSimitExt"
                            label=" Liquidar SiMIT Externo" selectedValue="1" style="height: 24px; left: 600px; top: 240px; position: absolute; width: 216px" tabIndex="7"/>
                        <ui:checkbox binding="#{ConsNovedadMunicipio.cbLiquidarSimitLoc}" disabled="true" id="cbLiquidarSimitLoc" label=" Liquidar SiMIT Local"
                            selectedValue="1" style="height: 24px; left: 600px; top: 264px; position: absolute; width: 216px" tabIndex="8"/>
                        <ui:checkbox binding="#{ConsNovedadMunicipio.cbLiquidarPolcaExt}" disabled="true" id="cbLiquidarPolcaExt"
                            label=" Liquidar POLCA Externo" selectedValue="1" style="height: 22px; left: 600px; top: 288px; position: absolute; width: 214px" tabIndex="9"/>
                        <ui:checkbox binding="#{ConsNovedadMunicipio.cbLiquidarPolcaLoc}" disabled="true" id="cbLiquidarPolcaLoc" label=" Liquidar POLCA Local"
                            selectedValue="1" style="height: 22px; left: 600px; top: 312px; position: absolute; width: 214px" tabIndex="10"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label5}" id="label5" style="left: 264px; top: 336px; position: absolute" text="Cuenta Dispersión"/>
                        <ui:dropDown binding="#{ConsNovedadMunicipio.ddBanco}" disabled="true" id="ddBanco"
                            items="#{ConsNovedadMunicipio.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 360px; top: 384px; position: absolute; width: 144px" tabIndex="12"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label6}" id="label6" style="left: 264px; top: 384px; position: absolute; width: 68px" text="Banco"/>
                        <ui:dropDown binding="#{ConsNovedadMunicipio.ddTipo}" disabled="true" id="ddTipo"
                            items="#{ConsNovedadMunicipio.ddTipoDefaultOptions.options}" style="left: 360px; top: 408px; position: absolute; width: 144px" tabIndex="13"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label7}" id="label7" style="left: 264px; top: 408px; position: absolute; width: 94px" text="Tipo"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfCuenta}" disabled="true" id="tfCuenta" maxLength="16"
                            style="left: 360px; top: 432px; position: absolute; width: 138px" tabIndex="14"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label8}" id="label8" style="left: 264px; top: 432px; position: absolute; width: 94px" text="Cuenta"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfNitCta}" disabled="true" id="tfNitCta" maxLength="10"
                            style="left: 360px; top: 456px; position: absolute; width: 138px" tabIndex="15"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label9}" id="label9" style="left: 264px; top: 456px; position: absolute; width: 94px" text="NIT"/>
                        <ui:button action="#{ConsNovedadMunicipio.btAdicionar_action}" binding="#{ConsNovedadMunicipio.btAdicionar}" id="btAdicionar"
                            onClick="btAdicionar_action()" style="left: 767px; top: 480px; position: absolute; width: 95px" tabIndex="24" text="Adicionar" visible="false"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label10}" id="label10" style="left: 696px; top: 360px; position: absolute; width: 72px" text="SIMIT 90%"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfFcmS}" disabled="true" id="tfFcmS" maxLength="6"
                            style="left: 696px; top: 408px; position: absolute; width: 72px" tabIndex="17"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfAcuerdoS}" disabled="true" id="tfAcuerdoS" maxLength="6"
                            style="left: 696px; top: 456px; position: absolute; width: 72px" tabIndex="19"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfConcesionarioS}" disabled="true" id="tfConcesionarioS" maxLength="6"
                            style="left: 696px; top: 432px; position: absolute; width: 72px" tabIndex="18"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label12}" for="tfAcuerdoS" id="label12"
                            style="left: 528px; top: 456px; position: absolute; width: 96px" text="% Acuerdo"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label13}" for="tfFcmS" id="label13"
                            style="left: 528px; top: 408px; position: absolute; width: 144px" text="% FCM Contravencional"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label14}" for="tfMunicipioS" id="label14"
                            style="left: 528px; top: 384px; position: absolute; width: 144px" text="% Municipio"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfMunicipioS}" disabled="true" id="tfMunicipioS" maxLength="6"
                            style="left: 696px; top: 384px; position: absolute; width: 72px" tabIndex="16"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label15}" for="tfConcesionarioS" id="label15"
                            style="left: 528px; top: 432px; position: absolute; width: 166px" text="% Conces Contravencional"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfConcesionarioP}" disabled="true" id="tfConcesionarioP" maxLength="6"
                            style="left: 792px; top: 432px; position: absolute; width: 72px" tabIndex="22"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfMunicipioP}" disabled="true" id="tfMunicipioP" maxLength="6"
                            style="left: 792px; top: 384px; position: absolute; width: 72px" tabIndex="20"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfAcuerdoP}" disabled="true" id="tfAcuerdoP" maxLength="6"
                            style="left: 792px; top: 456px; position: absolute; width: 72px" tabIndex="23"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfFcmP}" disabled="true" id="tfFcmP" maxLength="6"
                            style="left: 792px; top: 408px; position: absolute; width: 72px" tabIndex="21"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label11}" id="label11" style="left: 792px; top: 360px; position: absolute; width: 70px" text="POLCA 45%"/>
                        <ui:checkbox binding="#{ConsNovedadMunicipio.cbRetroactividad}" disabled="true" id="cbRetroactividad"
                            label=" Retroactividad Salario Mínimo" selectedValue="1"
                            style="height: 22px; left: 600px; top: 216px; position: absolute; width: 214px" tabIndex="6"/>
                        <ui:button action="#{ConsNovedadMunicipio.btAnular_action}" binding="#{ConsNovedadMunicipio.btAnular}" id="btAnular"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea rechazar novedad ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}&#xa;"
                            style="left: 767px; top: 528px; position: absolute; width: 95px" tabIndex="30" text="Rechazar"/>
                        <ui:dropDown binding="#{ConsNovedadMunicipio.ddFirma1}" disabled="true" id="ddFirma1"
                            items="#{ConsNovedadMunicipio.ddFirma1DefaultOptions.options}" style="left: 384px; top: 504px; position: absolute; width: 240px" tabIndex="27"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label17}" id="label17" style="left: 264px; top: 504px; position: absolute; width: 94px" text="Firma 1"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label18}" id="label18" style="left: 264px; top: 528px; position: absolute; width: 94px" text="Firma 2"/>
                        <ui:dropDown binding="#{ConsNovedadMunicipio.ddFirma2}" disabled="true" id="ddFirma2"
                            items="#{ConsNovedadMunicipio.ddFirma2DefaultOptions.options}" style="left: 384px; top: 528px; position: absolute; width: 240px" tabIndex="28"/>
                        <ui:calendar binding="#{ConsNovedadMunicipio.clActivacion}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="clActivacion"
                            style="left: 384px; top: 552px; position: absolute" tabIndex="29"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label19}" id="label19" style="left: 264px; top: 552px; position: absolute; width: 118px" text="Fecha Activacion"/>
                        <ui:label binding="#{ConsNovedadMunicipio.labelDivipo1}" for="tfDivipo" id="labelDivipo1"
                            style="left: 264px; top: 168px; position: absolute" text="No Novedad"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfNumero}" disabled="true" id="tfNumero" maxLength="10"
                            style="left: 360px; top: 168px; position: absolute; width: 138px" tabIndex="50" valueChangeListener="#{ConsNovedadMunicipio.tfNumero_processValueChange}"/>
                        <ui:button action="#{ConsNovedadMunicipio.btAprobar_action}" binding="#{ConsNovedadMunicipio.btAprobar}" id="btAprobar"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea aprobar la novedad ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;}&#xa;"
                            style="left: 767px; top: 576px; position: absolute; width: 95px" tabIndex="30" text="Aprobar"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tdnsAvvillas}" disabled="true" id="tdnsAvvillas" maxLength="16" style="left: 384px; top: 600px; position: absolute; width: 144px"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label16}" id="label16" style="left: 264px; top: 600px; position: absolute; width: 94px" text="DNS Avvilas"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tdnsGranbanco}" disabled="true" id="tdnsGranbanco" maxLength="16" style="left: 384px; top: 624px; position: absolute; width: 144px"/>
                        <ui:label binding="#{ConsNovedadMunicipio.label20}" id="label20" style="left: 264px; top: 624px; position: absolute; width: 94px" text="DNS Granbanco"/>
                        <ui:label binding="#{ConsNovedadMunicipio.labelDivipo2}" for="tfDivipo" id="labelDivipo2"
                            style="height: 22px; left: 528px; top: 168px; position: absolute; width: 118px" text="Tipo Novedad"/>
                        <ui:textField binding="#{ConsNovedadMunicipio.tfTipo}" disabled="true" id="tfTipo" maxLength="10"
                            style="left: 672px; top: 168px; position: absolute; width: 240px" tabIndex="50" valueChangeListener="#{ConsNovedadMunicipio.tfNumero_processValueChange}"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
