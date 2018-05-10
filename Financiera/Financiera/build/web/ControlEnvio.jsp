<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ControlEnvio.page1}" id="page1">
            <ui:html binding="#{ControlEnvio.html1}" id="html1">
                <ui:head binding="#{ControlEnvio.head1}" id="head1">
                    <ui:link binding="#{ControlEnvio.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ControlEnvio.body1}" focus="form1:clFechaIni" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ControlEnvio.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ControlEnvio.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Control Envio Bancos"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ControlEnvio.label1}" id="label1" style="left: 264px; top: 192px; position: absolute" text="Fecha Transferencia"/>
                        <ui:button action="#{ControlEnvio.btConsultar_action}" binding="#{ControlEnvio.btConsultar}" id="btConsultar"
                            style="left: 407px; top: 312px; position: absolute; width: 120px" tabIndex="3" text="Consultar"/>
                        <ui:calendar binding="#{ControlEnvio.clFechaIni}" dateFormatPattern="yyyy-MM-dd" id="clFechaIni"
                            style="left: 408px; top: 192px; position: absolute" tabIndex="1"/>
                        <ui:dropDown binding="#{ControlEnvio.dbanco}" id="dbanco" items="#{ControlEnvio.dbancoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'dbanco');" style="left: 408px; top: 264px; position: absolute; width: 168px" valueChangeListener="#{ControlEnvio.dbanco_processValueChange}"/>
                        <ui:label binding="#{ControlEnvio.label2}" id="label2" style="left: 336px; top: 264px; position: absolute" text="Banco"/>
                        <ui:label binding="#{ControlEnvio.label3}" id="label3" style="left: 312px; top: 360px; position: absolute" text="Cuenta Origen"/>
                        <ui:label binding="#{ControlEnvio.label4}" id="label4" style="left: 456px; top: 360px; position: absolute" text="Autoridad"/>
                        <ui:label binding="#{ControlEnvio.label5}" id="label5" style="height: 46px; left: 552px; top: 360px; position: absolute; width: 94px" text="Fecha Transferencia"/>
                        <ui:label binding="#{ControlEnvio.label6}" id="label6" style="height: 46px; left: 672px; top: 360px; position: absolute; width: 46px" text="Nro Trn"/>
                        <ui:label binding="#{ControlEnvio.label7}" id="label7" style="height: 46px; left: 768px; top: 360px; position: absolute; width: 94px" text="Valor Transferencia"/>
                        <ui:label binding="#{ControlEnvio.label8}" id="label8" style="height: 46px; left: 912px; top: 360px; position: absolute; width: 70px" text="Estado"/>
                        <ui:label binding="#{ControlEnvio.label9}" id="label9" style="height: 46px; left: 1032px; top: 360px; position: absolute; width: 94px" text="Nro Proceso"/>
                        <ui:textField binding="#{ControlEnvio.tcuenta1}" id="tcuenta1" readOnly="true" style="left: 312px; top: 432px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ControlEnvio.tcuenta2}" id="tcuenta2" readOnly="true" style="left: 312px; top: 456px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ControlEnvio.tcuenta3}" id="tcuenta3" readOnly="true" style="left: 312px; top: 480px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ControlEnvio.tcuenta4}" id="tcuenta4" readOnly="true" style="left: 312px; top: 504px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ControlEnvio.tcuenta5}" id="tcuenta5" readOnly="true" style="left: 312px; top: 528px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ControlEnvio.tcuenta6}" id="tcuenta6" readOnly="true" style="left: 312px; top: 552px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ControlEnvio.tautoridad1}" id="tautoridad1" readOnly="true" style="left: 456px; top: 432px; position: absolute; width: 72px"/>
                        <ui:textField binding="#{ControlEnvio.tautoridad2}" id="tautoridad2" readOnly="true" style="left: 456px; top: 456px; position: absolute; width: 72px"/>
                        <ui:textField binding="#{ControlEnvio.tautoridad3}" id="tautoridad3" readOnly="true" style="left: 456px; top: 480px; position: absolute; width: 72px"/>
                        <ui:textField binding="#{ControlEnvio.tautoridad4}" id="tautoridad4" readOnly="true" style="left: 456px; top: 504px; position: absolute; width: 72px"/>
                        <ui:textField binding="#{ControlEnvio.tautoridad5}" id="tautoridad5" readOnly="true" style="left: 456px; top: 528px; position: absolute; width: 72px"/>
                        <ui:textField binding="#{ControlEnvio.tautoridad6}" id="tautoridad6" readOnly="true" style="left: 456px; top: 552px; position: absolute; width: 72px"/>
                        <ui:textField binding="#{ControlEnvio.tfecha1}" id="tfecha1" readOnly="true" style="left: 552px; top: 432px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tfecha2}" id="tfecha2" readOnly="true" style="left: 552px; top: 456px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tfecha3}" id="tfecha3" readOnly="true" style="left: 552px; top: 480px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tfecha4}" id="tfecha4" readOnly="true" style="left: 552px; top: 504px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tfecha5}" id="tfecha5" readOnly="true" style="left: 552px; top: 528px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tfecha6}" id="tfecha6" readOnly="true" style="left: 552px; top: 552px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tnumero1}" id="tnumero1" readOnly="true" style="left: 672px; top: 432px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tnumero2}" id="tnumero2" readOnly="true" style="left: 672px; top: 456px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tnumero3}" id="tnumero3" readOnly="true" style="left: 672px; top: 480px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tnumero4}" id="tnumero4" readOnly="true" style="left: 672px; top: 504px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tnumero5}" id="tnumero5" readOnly="true" style="left: 672px; top: 528px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tnumero6}" id="tnumero6" readOnly="true" style="left: 672px; top: 552px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor1}" id="tvalor1" readOnly="true" style="left: 744px; top: 432px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor2}" id="tvalor2" readOnly="true" style="left: 744px; top: 456px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor3}" id="tvalor3" readOnly="true" style="left: 744px; top: 480px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor4}" id="tvalor4" readOnly="true" style="left: 744px; top: 504px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor5}" id="tvalor5" readOnly="true" style="left: 744px; top: 528px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor6}" id="tvalor6" readOnly="true" style="left: 744px; top: 552px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlEnvio.testado1}" id="testado1" readOnly="true" style="left: 912px; top: 432px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.testado2}" id="testado2" readOnly="true" style="left: 912px; top: 456px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.testado3}" id="testado3" readOnly="true" style="left: 912px; top: 480px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.testado4}" id="testado4" readOnly="true" style="left: 912px; top: 504px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.testado5}" id="testado5" readOnly="true" style="left: 912px; top: 528px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.testado6}" id="testado6" readOnly="true" style="left: 912px; top: 552px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tproceso1}" id="tproceso1" readOnly="true" style="left: 1032px; top: 432px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tproceso2}" id="tproceso2" readOnly="true" style="left: 1032px; top: 456px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tproceso3}" id="tproceso3" readOnly="true" style="left: 1032px; top: 480px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tproceso4}" id="tproceso4" readOnly="true" style="left: 1032px; top: 504px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tproceso5}" id="tproceso5" readOnly="true" style="left: 1032px; top: 528px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tproceso6}" id="tproceso6" readOnly="true" style="left: 1032px; top: 552px; position: absolute; width: 96px"/>
                        <ui:button action="#{ControlEnvio.BRegsitrar_action}" binding="#{ControlEnvio.BRegsitrar}" id="BRegsitrar"
                            style="left: 479px; top: 672px; position: absolute; width: 120px" tabIndex="3" text="Registrar"/>
                        <ui:textField binding="#{ControlEnvio.tcuenta7}" id="tcuenta7" readOnly="true" style="left: 312px; top: 576px; position: absolute; width: 120px"/>
                        <ui:textField binding="#{ControlEnvio.tautoridad7}" id="tautoridad7" readOnly="true" style="left: 456px; top: 576px; position: absolute; width: 72px"/>
                        <ui:textField binding="#{ControlEnvio.tfecha7}" id="tfecha7" readOnly="true" style="left: 552px; top: 576px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tnumero7}" id="tnumero7" readOnly="true" style="left: 672px; top: 576px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor7}" id="tvalor7" readOnly="true" style="left: 744px; top: 576px; position: absolute; width: 144px"/>
                        <ui:textField binding="#{ControlEnvio.testado7}" id="testado7" readOnly="true" style="left: 912px; top: 576px; position: absolute; width: 96px"/>
                        <ui:textField binding="#{ControlEnvio.tproceso7}" id="tproceso7" readOnly="true" style="left: 1032px; top: 576px; position: absolute; width: 96px"/>
                        <ui:label binding="#{ControlEnvio.label10}" id="label10" style="height: 22px; left: 600px; top: 624px; position: absolute; width: 46px" text="Totales"/>
                        <ui:textField binding="#{ControlEnvio.tnumero8}" id="tnumero8" readOnly="true" style="left: 672px; top: 624px; position: absolute; width: 48px"/>
                        <ui:textField binding="#{ControlEnvio.tvalor8}" id="tvalor8" readOnly="true" style="left: 744px; top: 624px; position: absolute; width: 144px"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
