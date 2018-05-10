<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{CtaConcesionario.page1}" id="page1">
            <ui:html binding="#{CtaConcesionario.html1}" id="html1">
                <ui:head binding="#{CtaConcesionario.head1}" id="head1">
                    <ui:link binding="#{CtaConcesionario.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{CtaConcesionario.body1}" focus="form1:ddConcesionario" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{CtaConcesionario.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{CtaConcesionario.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Definición Cuentas Dispersión "/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:dropDown binding="#{CtaConcesionario.ddConcesionario}" id="ddConcesionario"
                            items="#{CtaConcesionario.concesionarioDataProvider1.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddConcesionario');" style="left: 432px; top: 168px; position: absolute; width: 192px"
                            tabIndex="1" valueChangeListener="#{CtaConcesionario.ddConcesionario_processValueChange}"/>
                        <ui:label binding="#{CtaConcesionario.label1}" id="label1" style="left: 264px; top: 168px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{CtaConcesionario.label2}" id="label2" style="left: 264px; top: 263px; position: absolute" text="Liquidación Ext Simit"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoLiq}" id="ddBancoLiq"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 264px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:label binding="#{CtaConcesionario.label3}" id="label3" style="left: 456px; top: 240px; position: absolute" text="Banco"/>
                        <ui:label binding="#{CtaConcesionario.label4}" id="label4" style="left: 600px; top: 240px; position: absolute" text="Tipo"/>
                        <ui:label binding="#{CtaConcesionario.label5}" id="label5" style="left: 744px; top: 240px; position: absolute" text="Cuenta"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaLiq}" id="tfCuentaLiq" maxLength="16"
                            style="left: 720px; top: 264px; position: absolute; width: 120px" tabIndex="5"/>
                        <ui:label binding="#{CtaConcesionario.label6}" id="label6" style="left: 888px; top: 240px; position: absolute" text="Nit"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitLiq}" id="tfNitLiq" maxLength="10"
                            style="left: 864px; top: 264px; position: absolute; width: 96px" tabIndex="6"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoFon}" id="ddBancoFon"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 360px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoFon}" id="ddTipoFon" items="#{CtaConcesionario.ddTipoFcmDefaultOptions.options}"
                            style="left: 576px; top: 360px; position: absolute; width: 120px" tabIndex="8"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaFon}" id="tfCuentaFon" maxLength="16"
                            style="left: 720px; top: 360px; position: absolute; width: 120px" tabIndex="9"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitFon}" id="tfNitFon" maxLength="10"
                            style="left: 864px; top: 360px; position: absolute; width: 96px" tabIndex="10"/>
                        <ui:label binding="#{CtaConcesionario.label7}" id="label7" style="left: 264px; top: 360px; position: absolute" text="Fondo Cobertura"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoCon}" id="ddBancoCon"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 384px; position: absolute; width: 120px" tabIndex="11"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoCon}" id="ddTipoCon" items="#{CtaConcesionario.ddTipoFcmDefaultOptions.options}"
                            style="left: 576px; top: 384px; position: absolute; width: 120px" tabIndex="12"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaCon}" id="tfCuentaCon" maxLength="16"
                            style="left: 720px; top: 384px; position: absolute; width: 120px" tabIndex="13"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitCon}" id="tfNitCon" maxLength="10"
                            style="left: 864px; top: 384px; position: absolute; width: 96px" tabIndex="14"/>
                        <ui:label binding="#{CtaConcesionario.label8}" id="label8" style="left: 264px; top: 384px; position: absolute" text="Contravencional"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoFcm}" id="ddBancoFcm"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 408px; position: absolute; width: 120px" tabIndex="15"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoFcm}" id="ddTipoFcm" items="#{CtaConcesionario.ddTipoFcmDefaultOptions.options}"
                            style="left: 576px; top: 408px; position: absolute; width: 120px" tabIndex="16"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaFcm}" id="tfCuentaFcm" maxLength="16"
                            style="left: 720px; top: 408px; position: absolute; width: 120px" tabIndex="17"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitFcm}" id="tfNitFcm" maxLength="10"
                            style="left: 864px; top: 408px; position: absolute; width: 96px" tabIndex="18"/>
                        <ui:label binding="#{CtaConcesionario.label9}" id="label9" style="left: 264px; top: 408px; position: absolute" text="Contravencional FCM"/>
                        <ui:button action="#{CtaConcesionario.btActualizar_action}" binding="#{CtaConcesionario.btActualizar}" id="btActualizar"
                            style="left: 863px; top: 528px; position: absolute; width: 95px" tabIndex="31" text="Actualizar"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaSevial}" id="tfCuentaSevial" maxLength="16"
                            style="left: 720px; top: 432px; position: absolute; width: 120px" tabIndex="21"/>
                        <ui:label binding="#{CtaConcesionario.label10}" id="label10" style="left: 264px; top: 432px; position: absolute" text="SEVIAL"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitSevial}" id="tfNitSevial" maxLength="10"
                            style="left: 864px; top: 432px; position: absolute; width: 96px" tabIndex="22"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoSevial}" id="ddTipoSevial" items="#{CtaConcesionario.ddTipoSevialDefaultOptions.options}"
                            style="left: 576px; top: 432px; position: absolute; width: 120px" tabIndex="20"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoSevial}" id="ddBancoSevial"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 432px; position: absolute; width: 120px" tabIndex="19"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitPolca}" id="tfNitPolca" maxLength="10"
                            style="left: 864px; top: 456px; position: absolute; width: 96px" tabIndex="26"/>
                        <ui:label binding="#{CtaConcesionario.label11}" id="label11" style="left: 264px; top: 456px; position: absolute" text="POLCA"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoPolca}" id="ddBancoPolca"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 456px; position: absolute; width: 120px" tabIndex="23"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoPolca}" id="ddTipoPolca" items="#{CtaConcesionario.ddTipoPolcaDefaultOptions.options}"
                            style="left: 576px; top: 456px; position: absolute; width: 120px" tabIndex="24"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaPolca}" id="tfCuentaPolca" maxLength="16"
                            style="left: 720px; top: 456px; position: absolute; width: 120px" tabIndex="25"/>
                        <ui:label binding="#{CtaConcesionario.label12}" id="label12"
                            style="height: 47px; left: 264px; top: 480px; position: absolute; width: 143px" text="Liquidación AvVillas Recaudo Local"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoAvv}" id="ddBancoAvv"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 480px; position: absolute; width: 120px" tabIndex="27"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoAvv}" id="ddTipoAvv" items="#{CtaConcesionario.ddTipoAvvDefaultOptions.options}"
                            style="left: 576px; top: 480px; position: absolute; width: 120px" tabIndex="28"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaAvv}" id="tfCuentaAvv" maxLength="16"
                            style="left: 720px; top: 480px; position: absolute; width: 120px" tabIndex="29"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitAvv}" id="tfNitAvv" maxLength="10"
                            style="left: 864px; top: 480px; position: absolute; width: 96px" tabIndex="30"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoRec}" id="ddBancoRec"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddBancoRec');" style="left: 432px; top: 192px; position: absolute; width: 192px"
                            tabIndex="2" valueChangeListener="#{CtaConcesionario.ddBancoRec_processValueChange}"/>
                        <ui:label binding="#{CtaConcesionario.label13}" id="label13" style="left: 264px; top: 192px; position: absolute" text="Banco Recaudador"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoLiq}" id="ddTipoLiq" items="#{CtaConcesionario.ddTipoLiqDefaultOptions.options}"
                            style="left: 576px; top: 264px; position: absolute; width: 120px" tabIndex="4"/>
                        <ui:label binding="#{CtaConcesionario.label14}" id="label14" style="left: 264px; top: 288px; position: absolute" text="Liquidación Ext Polca"/>
                        <ui:label binding="#{CtaConcesionario.label15}" id="label15" style="left: 264px; top: 312px; position: absolute" text="Liquidación Loc Simit"/>
                        <ui:label binding="#{CtaConcesionario.label16}" id="label16" style="left: 264px; top: 336px; position: absolute" text="Liquidación Loc Polca"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoLiq1}" id="ddBancoLiq1"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 288px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoLiq2}" id="ddBancoLiq2"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 312px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddBancoLiq3}" id="ddBancoLiq3"
                            items="#{CtaConcesionario.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 432px; top: 336px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoLiq1}" id="ddTipoLiq1" items="#{CtaConcesionario.ddTipoLiq1DefaultOptions.options}"
                            style="left: 576px; top: 288px; position: absolute; width: 120px" tabIndex="4"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoLiq2}" id="ddTipoLiq2" items="#{CtaConcesionario.ddTipoLiq2DefaultOptions.options}"
                            style="left: 576px; top: 312px; position: absolute; width: 120px" tabIndex="4"/>
                        <ui:dropDown binding="#{CtaConcesionario.ddTipoLiq3}" id="ddTipoLiq3" items="#{CtaConcesionario.ddTipoLiq3DefaultOptions.options}"
                            style="left: 576px; top: 336px; position: absolute; width: 120px" tabIndex="4"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaLiq1}" id="tfCuentaLiq1" maxLength="16"
                            style="left: 720px; top: 288px; position: absolute; width: 120px" tabIndex="5"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaLiq2}" id="tfCuentaLiq2" maxLength="16"
                            style="left: 720px; top: 312px; position: absolute; width: 120px" tabIndex="5"/>
                        <ui:textField binding="#{CtaConcesionario.tfCuentaLiq3}" id="tfCuentaLiq3" maxLength="16"
                            style="left: 720px; top: 336px; position: absolute; width: 120px" tabIndex="5"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitLiq1}" id="tfNitLiq1" maxLength="10"
                            style="left: 864px; top: 288px; position: absolute; width: 96px" tabIndex="6"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitLiq2}" id="tfNitLiq2" maxLength="10"
                            style="left: 864px; top: 312px; position: absolute; width: 96px" tabIndex="6"/>
                        <ui:textField binding="#{CtaConcesionario.tfNitLiq3}" id="tfNitLiq3" maxLength="10"
                            style="left: 864px; top: 336px; position: absolute; width: 96px" tabIndex="6"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
