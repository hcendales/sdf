<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{NovMunicipio.page1}" id="page1">
            <ui:html binding="#{NovMunicipio.html1}" id="html1">
                <ui:head binding="#{NovMunicipio.head1}" id="head1">
                    <ui:link binding="#{NovMunicipio.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{NovMunicipio.body1}" focus="form1:tfDivipo" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{NovMunicipio.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{NovMunicipio.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Novedad Municipio"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:textField binding="#{NovMunicipio.tfDivipo}" id="tfDivipo" maxLength="8"
                            style="left: 360px; top: 168px; position: absolute; width: 138px" tabIndex="1"/>
                        <ui:label binding="#{NovMunicipio.labelDivipo}" for="tfDivipo" id="labelDivipo" style="left: 264px; top: 169px; position: absolute" text="DIVIPO"/>
                        <ui:textField binding="#{NovMunicipio.tfNombre}" id="tfNombre" maxLength="50"
                            style="left: 360px; top: 216px; position: absolute; width: 138px" tabIndex="3"/>
                        <ui:label binding="#{NovMunicipio.label1}" id="label1" style="left: 267px; top: 216px; position: absolute" text="Nombre"/>
                        <ui:dropDown binding="#{NovMunicipio.ddConcesionario}" id="ddConcesionario"
                            items="#{NovMunicipio.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            style="left: 360px; top: 240px; position: absolute; width: 144px" tabIndex="4"/>
                        <ui:label binding="#{NovMunicipio.label2}" for="ddConcesionario" id="label2" style="left: 267px; top: 240px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{NovMunicipio.label3}" for="tfNit" id="label3" style="left: 265px; top: 192px; position: absolute" text="NIT"/>
                        <ui:textField binding="#{NovMunicipio.tfNit}" id="tfNit" maxLength="10"
                            style="left: 360px; top: 192px; position: absolute; width: 138px" tabIndex="2"/>
                        <ui:label binding="#{NovMunicipio.label4}" id="label4" style="left: 266px; top: 264px; position: absolute" text="Correo"/>
                        <ui:textField binding="#{NovMunicipio.tfCorreo}" id="tfCorreo" maxLength="500"
                            style="left: 360px; top: 264px; position: absolute; width: 138px" tabIndex="5"/>
                        <ui:checkbox binding="#{NovMunicipio.cbLiquidarSimitExt}" id="cbLiquidarSimitExt" label=" Liquidar SiMIT Externo" selectedValue="1"
                            style="height: 24px; left: 649px; top: 191px; position: absolute; width: 216px" tabIndex="7"/>
                        <ui:checkbox binding="#{NovMunicipio.cbLiquidarSimitLoc}" id="cbLiquidarSimitLoc" label=" Liquidar SiMIT Local" selectedValue="1"
                            style="height: 24px; left: 649px; top: 216px; position: absolute; width: 216px" tabIndex="8"/>
                        <ui:checkbox binding="#{NovMunicipio.cbLiquidarPolcaExt}" id="cbLiquidarPolcaExt" label=" Liquidar POLCA Externo" selectedValue="1"
                            style="height: 22px; left: 649px; top: 240px; position: absolute; width: 214px" tabIndex="9"/>
                        <ui:checkbox binding="#{NovMunicipio.cbLiquidarPolcaLoc}" id="cbLiquidarPolcaLoc" label=" Liquidar POLCA Local" selectedValue="1"
                            style="height: 22px; left: 649px; top: 264px; position: absolute; width: 214px" tabIndex="10"/>
                        <ui:label binding="#{NovMunicipio.label5}" id="label5" style="left: 266px; top: 312px; position: absolute" text="Cuenta Dispersión"/>
                        <ui:dropDown binding="#{NovMunicipio.ddBanco}" id="ddBanco" items="#{NovMunicipio.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 360px; top: 360px; position: absolute; width: 144px" tabIndex="12"/>
                        <ui:label binding="#{NovMunicipio.label6}" id="label6" style="left: 266px; top: 360px; position: absolute; width: 68px" text="Banco"/>
                        <ui:dropDown binding="#{NovMunicipio.ddTipo}" id="ddTipo" items="#{NovMunicipio.ddTipoDefaultOptions.options}"
                            style="left: 360px; top: 384px; position: absolute; width: 144px" tabIndex="13"/>
                        <ui:label binding="#{NovMunicipio.label7}" id="label7" style="left: 264px; top: 384px; position: absolute; width: 94px" text="Tipo"/>
                        <ui:textField binding="#{NovMunicipio.tfCuenta}" id="tfCuenta" maxLength="16"
                            style="left: 360px; top: 408px; position: absolute; width: 138px" tabIndex="14"/>
                        <ui:label binding="#{NovMunicipio.label8}" id="label8" style="left: 264px; top: 408px; position: absolute; width: 94px" text="Cuenta"/>
                        <ui:textField binding="#{NovMunicipio.tfNitCta}" id="tfNitCta" maxLength="10"
                            style="left: 360px; top: 432px; position: absolute; width: 138px" tabIndex="15"/>
                        <ui:label binding="#{NovMunicipio.label9}" id="label9" style="left: 264px; top: 432px; position: absolute; width: 94px" text="NIT"/>
                        <ui:button action="#{NovMunicipio.btAdicionar_action}" binding="#{NovMunicipio.btAdicionar}" id="btAdicionar"
                            onClick="btAdicionar_action()" style="left: 767px; top: 576px; position: absolute; width: 95px" tabIndex="31" text="Adicionar"/>
                        <ui:label binding="#{NovMunicipio.label10}" id="label10" style="left: 694px; top: 336px; position: absolute; width: 72px" text="SIMIT 90%"/>
                        <ui:textField binding="#{NovMunicipio.tfFcmS}" id="tfFcmS" maxLength="6"
                            style="left: 696px; top: 384px; position: absolute; width: 72px" tabIndex="17"/>
                        <ui:textField binding="#{NovMunicipio.tfAcuerdoS}" id="tfAcuerdoS" maxLength="6"
                            style="left: 696px; top: 432px; position: absolute; width: 72px" tabIndex="19"/>
                        <ui:textField binding="#{NovMunicipio.tfConcesionarioS}" id="tfConcesionarioS" maxLength="6"
                            style="left: 696px; top: 408px; position: absolute; width: 72px" tabIndex="18"/>
                        <ui:label binding="#{NovMunicipio.label12}" for="tfAcuerdoS" id="label12" style="left: 528px; top: 432px; position: absolute" text="% Acuerdo"/>
                        <ui:label binding="#{NovMunicipio.label13}" for="tfFcmS" id="label13" style="left: 528px; top: 384px; position: absolute" text="% FCM Contravencional"/>
                        <ui:label binding="#{NovMunicipio.label14}" for="tfMunicipioS" id="label14" style="left: 528px; top: 360px; position: absolute" text="% Municipio"/>
                        <ui:textField binding="#{NovMunicipio.tfMunicipioS}" id="tfMunicipioS" maxLength="6"
                            style="left: 696px; top: 360px; position: absolute; width: 72px" tabIndex="16"/>
                        <ui:label binding="#{NovMunicipio.label15}" for="tfConcesionarioS" id="label15" style="left: 528px; top: 408px; position: absolute" text="% Conces Contravencional"/>
                        <ui:textField binding="#{NovMunicipio.tfConcesionarioP}" id="tfConcesionarioP" maxLength="6"
                            style="left: 792px; top: 408px; position: absolute; width: 72px" tabIndex="22"/>
                        <ui:textField binding="#{NovMunicipio.tfMunicipioP}" id="tfMunicipioP" maxLength="6"
                            style="left: 792px; top: 360px; position: absolute; width: 72px" tabIndex="20"/>
                        <ui:textField binding="#{NovMunicipio.tfAcuerdoP}" id="tfAcuerdoP" maxLength="6"
                            style="left: 792px; top: 432px; position: absolute; width: 72px" tabIndex="23"/>
                        <ui:textField binding="#{NovMunicipio.tfFcmP}" id="tfFcmP" maxLength="6"
                            style="left: 792px; top: 384px; position: absolute; width: 72px" tabIndex="21"/>
                        <ui:label binding="#{NovMunicipio.label11}" id="label11" style="left: 792px; top: 336px; position: absolute; width: 70px" text="POLCA 45%"/>
                        <ui:checkbox binding="#{NovMunicipio.cbRetroactividad}" id="cbRetroactividad" label=" Retroactividad Salario Mínimo" selectedValue="1"
                            style="height: 22px; left: 648px; top: 169px; position: absolute; width: 214px" tabIndex="6"/>
                        <ui:dropDown binding="#{NovMunicipio.ddMunicipio}" id="ddMunicipio"
                            items="#{NovMunicipio.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMunicipio');" style="left: 384px; top: 648px; position: absolute; width: 288px"
                            tabIndex="29" valueChangeListener="#{NovMunicipio.ddMunicipio_processValueChange}"/>
                        <ui:label binding="#{NovMunicipio.label16}" id="label16" style="left: 264px; top: 648px; position: absolute" text="Consultar Municipio"/>
                        <ui:button action="#{NovMunicipio.btEliminar_action}" binding="#{NovMunicipio.btEliminar}" disabled="true" id="btEliminar"
                            onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;"
                            style="left: 767px; top: 530px; position: absolute; width: 95px" tabIndex="26" text="Eliminar" visible="false"/>
                        <ui:dropDown binding="#{NovMunicipio.ddFirma1}" id="ddFirma1" items="#{NovMunicipio.ddFirma1DefaultOptions.options}"
                            style="left: 384px; top: 480px; position: absolute; width: 240px" tabIndex="24"/>
                        <ui:label binding="#{NovMunicipio.label17}" id="label17" style="left: 270px; top: 478px; position: absolute; width: 94px" text="Firma 1"/>
                        <ui:label binding="#{NovMunicipio.label18}" id="label18" style="left: 270px; top: 502px; position: absolute; width: 94px" text="Firma 2"/>
                        <ui:dropDown binding="#{NovMunicipio.ddFirma2}" id="ddFirma2" items="#{NovMunicipio.ddFirma2DefaultOptions.options}"
                            style="left: 384px; top: 504px; position: absolute; width: 240px" tabIndex="25"/>
                        <ui:calendar binding="#{NovMunicipio.clActivacion}" dateFormatPattern="yyyy-MM-dd" id="clActivacion"
                            style="left: 384px; top: 528px; position: absolute" tabIndex="26"/>
                        <ui:label binding="#{NovMunicipio.label19}" id="label19" style="left: 269px; top: 526px; position: absolute; width: 113px" text="Fecha Activacion"/>
                        <ui:label binding="#{NovMunicipio.label20}" id="label20" style="left: 263px; top: 577px; position: absolute; width: 113px" text="DNS Avvillas"/>
                        <ui:label binding="#{NovMunicipio.label21}" id="label21" style="left: 263px; top: 601px; position: absolute; width: 113px" text="DNS Davivienda"/>
                        <ui:textField binding="#{NovMunicipio.tfDnsAvvillas}" id="tfDnsAvvillas" maxLength="16"
                            style="left: 383px; top: 577px; position: absolute; width: 138px" tabIndex="27"/>
                        <ui:textField binding="#{NovMunicipio.tfDnsDavivienda}" id="tfDnsDavivienda" maxLength="16"
                            style="left: 384px; top: 600px; position: absolute; width: 138px" tabIndex="28"/>
                        <ui:textField binding="#{NovMunicipio.tfCuentaAct1}" id="tfCuentaAct1" maxLength="16"
                            style="left: 888px; top: 408px; position: absolute; width: 138px" tabIndex="14" visible="false"/>
                        <ui:textField binding="#{NovMunicipio.tfNitCta1}" id="tfNitCta1" maxLength="10"
                            style="left: 888px; top: 432px; position: absolute; width: 138px" tabIndex="15" visible="false"/>
                        <ui:textField binding="#{NovMunicipio.ddTipoAct1}" id="ddTipoAct1" maxLength="16"
                            style="left: 888px; top: 384px; position: absolute; width: 138px" tabIndex="14" visible="false"/>
                        <ui:textField binding="#{NovMunicipio.ddBancoAct1}" id="ddBancoAct1" maxLength="16"
                            style="left: 888px; top: 360px; position: absolute; width: 138px" tabIndex="14" visible="false"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
