<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{Municipio.page1}" id="page1">
            <ui:html binding="#{Municipio.html1}" id="html1">
                <ui:head binding="#{Municipio.head1}" id="head1">
                    <ui:link binding="#{Municipio.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{Municipio.body1}" focus="form1:tfDivipo" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{Municipio.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{Municipio.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Municipios"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{Municipio.tfDivipo}" id="tfDivipo" maxLength="8"
                            style="left: 360px; top: 168px; position: absolute; width: 138px" tabIndex="1"/>
                        <ui:label binding="#{Municipio.labelDivipo}" for="tfDivipo" id="labelDivipo" style="left: 264px; top: 168px; position: absolute" text="DIVIPO"/>
                        <ui:textField binding="#{Municipio.tfNombre}" id="tfNombre" maxLength="50"
                            style="left: 360px; top: 216px; position: absolute; width: 138px" tabIndex="3"/>
                        <ui:label binding="#{Municipio.label1}" id="label1" style="left: 264px; top: 216px; position: absolute" text="Nombre"/>
                        <ui:dropDown binding="#{Municipio.ddConcesionario}" id="ddConcesionario"
                            items="#{Municipio.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            style="left: 360px; top: 240px; position: absolute; width: 144px" tabIndex="4"/>
                        <ui:label binding="#{Municipio.label2}" for="ddConcesionario" id="label2" style="left: 264px; top: 240px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{Municipio.label3}" for="tfNit" id="label3" style="left: 264px; top: 192px; position: absolute" text="NIT"/>
                        <ui:textField binding="#{Municipio.tfNit}" id="tfNit" maxLength="10" style="left: 360px; top: 192px; position: absolute; width: 138px" tabIndex="2"/>
                        <ui:label binding="#{Municipio.label4}" id="label4" style="left: 264px; top: 264px; position: absolute" text="Correo"/>
                        <ui:textField binding="#{Municipio.tfCorreo}" id="tfCorreo" maxLength="500"
                            style="left: 360px; top: 264px; position: absolute; width: 138px" tabIndex="5"/>
                        <ui:checkbox binding="#{Municipio.cbLiquidarSimitExt}" id="cbLiquidarSimitExt" label=" Liquidar SiMIT Externo" selectedValue="1"
                            style="height: 24px; left: 648px; top: 192px; position: absolute; width: 216px" tabIndex="7"/>
                        <ui:checkbox binding="#{Municipio.cbLiquidarSimitLoc}" id="cbLiquidarSimitLoc" label=" Liquidar SiMIT Local" selectedValue="1"
                            style="height: 24px; left: 648px; top: 216px; position: absolute; width: 216px" tabIndex="8"/>
                        <ui:checkbox binding="#{Municipio.cbLiquidarPolcaExt}" id="cbLiquidarPolcaExt" label=" Liquidar POLCA Externo" selectedValue="1"
                            style="height: 22px; left: 648px; top: 240px; position: absolute; width: 214px" tabIndex="9"/>
                        <ui:checkbox binding="#{Municipio.cbLiquidarPolcaLoc}" id="cbLiquidarPolcaLoc" label=" Liquidar POLCA Local" selectedValue="1"
                            style="height: 22px; left: 648px; top: 264px; position: absolute; width: 214px" tabIndex="10"/>
                        <ui:label binding="#{Municipio.label5}" id="label5" style="left: 264px; top: 312px; position: absolute" text="Cuenta Dispersión"/>
                        <ui:dropDown binding="#{Municipio.ddBanco}" id="ddBanco" items="#{Municipio.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 360px; top: 360px; position: absolute; width: 144px" tabIndex="12"/>
                        <ui:label binding="#{Municipio.label6}" id="label6" style="left: 264px; top: 360px; position: absolute; width: 96px" text="Banco"/>
                        <ui:dropDown binding="#{Municipio.ddTipo}" id="ddTipo" items="#{Municipio.ddTipoDefaultOptions.options}"
                            style="left: 360px; top: 384px; position: absolute; width: 144px" tabIndex="13"/>
                        <ui:label binding="#{Municipio.label7}" id="label7" style="left: 264px; top: 384px; position: absolute; width: 94px" text="Tipo"/>
                        <ui:textField binding="#{Municipio.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 360px; top: 408px; position: absolute; width: 138px" tabIndex="14"/>
                        <ui:label binding="#{Municipio.label8}" id="label8" style="left: 264px; top: 408px; position: absolute; width: 94px" text="Cuenta"/>
                        <ui:textField binding="#{Municipio.tfNitCta}" id="tfNitCta" maxLength="10"
                            style="left: 360px; top: 432px; position: absolute; width: 138px" tabIndex="15"/>
                        <ui:label binding="#{Municipio.label9}" id="label9" style="left: 264px; top: 432px; position: absolute; width: 94px" text="NIT"/>
                        <ui:button action="#{Municipio.btAdicionar_action}" binding="#{Municipio.btAdicionar}" id="btAdicionar" onClick="btAdicionar_action()"
                            style="left: 767px; top: 480px; position: absolute; width: 95px" tabIndex="24" text="Adicionar"/>
                        <ui:label binding="#{Municipio.label10}" id="label10" style="left: 696px; top: 336px; position: absolute; width: 72px" text="SIMIT 90%"/>
                        <ui:textField binding="#{Municipio.tfFcmS}" id="tfFcmS" maxLength="6" style="left: 696px; top: 384px; position: absolute; width: 72px" tabIndex="17"/>
                        <ui:textField binding="#{Municipio.tfAcuerdoS}" id="tfAcuerdoS" maxLength="6"
                            style="left: 696px; top: 432px; position: absolute; width: 72px" tabIndex="19"/>
                        <ui:textField binding="#{Municipio.tfConcesionarioS}" id="tfConcesionarioS" maxLength="6"
                            style="left: 696px; top: 408px; position: absolute; width: 72px" tabIndex="18"/>
                        <ui:label binding="#{Municipio.label12}" for="tfAcuerdoS" id="label12" style="left: 528px; top: 432px; position: absolute" text="% Acuerdo"/>
                        <ui:label binding="#{Municipio.label13}" for="tfFcmS" id="label13" style="left: 528px; top: 384px; position: absolute" text="% FCM Contravencional"/>
                        <ui:label binding="#{Municipio.label14}" for="tfMunicipioS" id="label14" style="left: 528px; top: 360px; position: absolute" text="% Municipio"/>
                        <ui:textField binding="#{Municipio.tfMunicipioS}" id="tfMunicipioS" maxLength="6"
                            style="left: 696px; top: 360px; position: absolute; width: 72px" tabIndex="16"/>
                        <ui:label binding="#{Municipio.label15}" for="tfConcesionarioS" id="label15" style="left: 528px; top: 408px; position: absolute" text="% Conces Contravencional"/>
                        <ui:textField binding="#{Municipio.tfConcesionarioP}" id="tfConcesionarioP" maxLength="6"
                            style="left: 792px; top: 408px; position: absolute; width: 72px" tabIndex="22"/>
                        <ui:textField binding="#{Municipio.tfMunicipioP}" id="tfMunicipioP" maxLength="6"
                            style="left: 792px; top: 360px; position: absolute; width: 72px" tabIndex="20"/>
                        <ui:textField binding="#{Municipio.tfAcuerdoP}" id="tfAcuerdoP" maxLength="6"
                            style="left: 792px; top: 432px; position: absolute; width: 72px" tabIndex="23"/>
                        <ui:textField binding="#{Municipio.tfFcmP}" id="tfFcmP" maxLength="6" style="left: 792px; top: 384px; position: absolute; width: 72px" tabIndex="21"/>
                        <ui:label binding="#{Municipio.label11}" id="label11" style="left: 792px; top: 336px; position: absolute; width: 70px" text="POLCA 45%"/>
                        <ui:checkbox binding="#{Municipio.cbRetroactividad}" id="cbRetroactividad" label=" Retroactividad Salario Mínimo" selectedValue="1"
                            style="height: 22px; left: 648px; top: 168px; position: absolute; width: 214px" tabIndex="6"/>
                        <ui:dropDown binding="#{Municipio.ddMunicipio}" id="ddMunicipio"
                            items="#{Municipio.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 408px; top: 480px; position: absolute; width: 288px"
                            tabIndex="24" valueChangeListener="#{Municipio.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{Municipio.label16}" id="label16" style="left: 264px; top: 480px; position: absolute" text="Consultar Municipio"/>
                        <ui:button action="#{Municipio.btEliminar_action}" binding="#{Municipio.btEliminar}" id="btEliminar"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;"
                            disabled="true" style="left: 767px; top: 530px; position: absolute; width: 95px" tabIndex="26" text="Eliminar"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
