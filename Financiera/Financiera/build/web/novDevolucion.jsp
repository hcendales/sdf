<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{novDevolucion.page1}" id="page1">
            <ui:html binding="#{novDevolucion.html1}" id="html1">
                <ui:head binding="#{novDevolucion.head1}" id="head1">
                    <ui:link binding="#{novDevolucion.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{novDevolucion.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{novDevolucion.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{novDevolucion.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Novedad Devolucion de Pago"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{novDevolucion.label1}" id="label1" style="color: red; left: 288px; top: 168px; position: absolute" text="DATOS INFRACTOR"/>
                        <ui:dropDown binding="#{novDevolucion.ddBanco}" id="ddBanco" immediate="true"
                            items="#{novDevolucion.bancoDataProvider.options['IDBANCO,NOMBRE']}"
                            style="left: 456px; top: 312px; position: absolute; width: 312px" tabIndex="4"/>
                        <ui:label binding="#{novDevolucion.lbBanco}" id="lbBanco" style="left: 312px; top: 312px; position: absolute" text="Banco"/>
                        <ui:button action="#{novDevolucion.btAdicionar_action}" binding="#{novDevolucion.btAdicionar}" id="btAdicionar"
                            onClick="btActualizar_action()" style="left: 551px; top: 1344px; position: absolute; width: 95px" tabIndex="38" text="Crear Novedad"/>
                        <ui:dropDown binding="#{novDevolucion.ddMunicipio}" id="ddMunicipio"
                            items="#{novDevolucion.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}" onChange=""
                            style="left: 456px; top: 504px; position: absolute; width: 312px" tabIndex="11"/>
                        <ui:label binding="#{novDevolucion.label2}" id="label2" style="left: 312px; top: 192px; position: absolute" text="Nombre"/>
                        <ui:label binding="#{novDevolucion.label3}" id="label3" style="left: 312px; top: 216px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{novDevolucion.label4}" id="label4" style="left: 312px; top: 240px; position: absolute" text="Numero Identificacion"/>
                        <ui:label binding="#{novDevolucion.label5}" id="label5" style="color: red; left: 288px; top: 288px; position: absolute" text="CUENTA PARA DEVOLUCION"/>
                        <ui:label binding="#{novDevolucion.lbBanco1}" id="lbBanco1" style="left: 312px; top: 336px; position: absolute" text="Tipo Cuenta"/>
                        <ui:label binding="#{novDevolucion.lbBanco2}" id="lbBanco2" style="left: 312px; top: 360px; position: absolute" text="Numero Cuenta"/>
                        <ui:label binding="#{novDevolucion.label6}" id="label6" style="color: red; left: 288px; top: 456px; position: absolute" text="DATOS DEVOLUCION"/>
                        <ui:label binding="#{novDevolucion.lbBanco3}" id="lbBanco3" style="left: 312px; top: 480px; position: absolute" text="Cuenta Recaudo"/>
                        <ui:label binding="#{novDevolucion.lbBanco4}" id="lbBanco4" style="left: 312px; top: 528px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{novDevolucion.lbBanco5}" id="lbBanco5" style="left: 312px; top: 552px; position: absolute" text="Tipo Comparendo"/>
                        <ui:label binding="#{novDevolucion.lbBanco6}" id="lbBanco6" style="left: 312px; top: 696px; position: absolute" text="Motivo Devolucion"/>
                        <ui:label binding="#{novDevolucion.lbBanco7}" id="lbBanco7" style="left: 312px; top: 744px; position: absolute" text="Valor Devolucion"/>
                        <ui:label binding="#{novDevolucion.label7}" id="label7" style="color: red; left: 312px; top: 864px; position: absolute; width: 312px" text="VALORES DEVOLUCION (CON IMPUESTOS)"/>
                        <ui:label binding="#{novDevolucion.lbBanco8}" id="lbBanco8" style="left: 312px; top: 888px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{novDevolucion.lbBanco9}" id="lbBanco9" style="left: 312px; top: 912px; position: absolute" text="FCM"/>
                        <ui:label binding="#{novDevolucion.lbBanco10}" id="lbBanco10" style="left: 312px; top: 936px; position: absolute" text="Fondo Cobertura Simit"/>
                        <ui:label binding="#{novDevolucion.lbBanco11}" id="lbBanco11" style="left: 312px; top: 960px; position: absolute" text="Fondo Cobertura Concesionario"/>
                        <ui:label binding="#{novDevolucion.lbBanco12}" id="lbBanco12" style="left: 312px; top: 984px; position: absolute" text="Equilibrio Economico"/>
                        <ui:label binding="#{novDevolucion.lbBanco13}" id="lbBanco13" style="left: 312px; top: 1080px; position: absolute" text="SEVIAL 2.7%"/>
                        <ui:label binding="#{novDevolucion.lbBanco14}" id="lbBanco14" style="left: 312px; top: 1032px; position: absolute" text="POLCA"/>
                        <ui:label binding="#{novDevolucion.lbBanco15}" id="lbBanco15" style="left: 312px; top: 1056px; position: absolute" text="FCM POLCA 1.8%"/>
                        <ui:label binding="#{novDevolucion.lbBanco16}" id="lbBanco16" style="left: 312px; top: 1128px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{novDevolucion.lbBanco17}" id="lbBanco17" style="left: 312px; top: 1152px; position: absolute" text="Contravencional  FCM"/>
                        <ui:label binding="#{novDevolucion.lbBanco18}" id="lbBanco18" style="left: 312px; top: 1176px; position: absolute" text="Contravencional  Concesionario"/>
                        <ui:textField binding="#{novDevolucion.txtNombre}" id="txtNombre" maxLength="50"
                            style="left: 456px; top: 192px; position: absolute; width: 360px" tabIndex="1"/>
                        <ui:textField binding="#{novDevolucion.txtNumIdentificacion}" id="txtNumIdentificacion" maxLength="13"
                            style="left: 456px; top: 240px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:dropDown binding="#{novDevolucion.ddTipoIde}" id="ddTipoIde" items="#{novDevolucion.ddTipoIdeDefaultOptions.options}"
                            style="left: 456px; top: 216px; position: absolute; width: 120px" tabIndex="2"/>
                        <ui:dropDown binding="#{novDevolucion.ddTipoCta}" id="ddTipoCta" items="#{novDevolucion.ddTipoCtaDefaultOptions.options}"
                            style="left: 456px; top: 336px; position: absolute; width: 144px" tabIndex="5"/>
                        <ui:textField binding="#{novDevolucion.txtCuenta}" id="txtCuenta" maxLength="16"
                            style="left: 456px; top: 360px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{novDevolucion.ddTipoCom}" id="ddTipoCom" items="#{novDevolucion.ddTipoComDefaultOptions.options}"
                            style="left: 456px; top: 552px; position: absolute; width: 96px" tabIndex="13"/>
                        <ui:textField binding="#{novDevolucion.txtMotivo}" disabled="true" id="txtMotivo" maxLength="50"
                            style="left: 456px; top: 720px; position: absolute; width: 432px" tabIndex="18"/>
                        <ui:textField binding="#{novDevolucion.txtValorDev}" id="txtValorDev" maxLength="7"
                            style="left: 456px; top: 744px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:textField binding="#{novDevolucion.txtValorConces}" id="txtValorConces" maxLength="10"
                            style="left: 504px; top: 888px; position: absolute; width: 144px" tabIndex="24"/>
                        <ui:textField binding="#{novDevolucion.txtValorFcm}" id="txtValorFcm" maxLength="10"
                            style="left: 504px; top: 912px; position: absolute; width: 144px" tabIndex="25"/>
                        <ui:textField binding="#{novDevolucion.txtValorFonSim}" id="txtValorFonSim" maxLength="10"
                            style="left: 504px; top: 936px; position: absolute; width: 144px" tabIndex="26"/>
                        <ui:textField binding="#{novDevolucion.txtValorFonCon}" id="txtValorFonCon" maxLength="10"
                            style="left: 504px; top: 960px; position: absolute; width: 144px" tabIndex="27"/>
                        <ui:textField binding="#{novDevolucion.txtValorEquil}" id="txtValorEquil" maxLength="10"
                            style="left: 504px; top: 984px; position: absolute; width: 144px" tabIndex="28"/>
                        <ui:textField binding="#{novDevolucion.txtValorPolca}" id="txtValorPolca" maxLength="10"
                            style="left: 504px; top: 1032px; position: absolute; width: 144px" tabIndex="30"/>
                        <ui:textField binding="#{novDevolucion.txtValorFcmPolca}" id="txtValorFcmPolca" maxLength="10"
                            style="left: 504px; top: 1056px; position: absolute; width: 144px" tabIndex="31"/>
                        <ui:textField binding="#{novDevolucion.txtValorsevial27}" id="txtValorsevial27" maxLength="10"
                            style="left: 504px; top: 1080px; position: absolute; width: 144px" tabIndex="32"/>
                        <ui:textField binding="#{novDevolucion.txtValorMunicipio}" id="txtValorMunicipio" maxLength="10"
                            style="left: 504px; top: 1128px; position: absolute; width: 144px" tabIndex="33"/>
                        <ui:textField binding="#{novDevolucion.txtValorContravFcm}" id="txtValorContravFcm" maxLength="10"
                            style="left: 504px; top: 1152px; position: absolute; width: 144px" tabIndex="34"/>
                        <ui:textField binding="#{novDevolucion.txtValorContravConc}" id="txtValorContravConc" maxLength="10"
                            style="left: 504px; top: 1176px; position: absolute; width: 144px" tabIndex="35"/>
                        <ui:label binding="#{novDevolucion.lbBanco19}" id="lbBanco19" style="left: 312px; top: 1272px; position: absolute" text="Fecha Activacion"/>
                        <ui:calendar binding="#{novDevolucion.cfechaAct}" dateFormatPattern="yyyy-MM-dd" id="cfechaAct"
                            style="left: 504px; top: 1272px; position: absolute" tabIndex="37"/>
                        <ui:label binding="#{novDevolucion.label8}" id="label8" style="color: red; left: 288px; top: 1248px; position: absolute" text="ACTIVACION"/>
                        <ui:button action="#{novDevolucion.bsugerirValor_action}" binding="#{novDevolucion.bsugerirValor}" id="bsugerirValor"
                            style="left: 455px; top: 840px; position: absolute; width: 128px" tabIndex="23" text="Sugerir Valores"/>
                        <ui:dropDown binding="#{novDevolucion.ddConcesionario}" id="ddConcesionario"
                            items="#{novDevolucion.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            style="left: 456px; top: 528px; position: absolute; width: 312px" tabIndex="12"/>
                        <ui:label binding="#{novDevolucion.lbBanco20}" id="lbBanco20" style="left: 312px; top: 504px; position: absolute" text="Municipio"/>
                        <ui:dropDown binding="#{novDevolucion.ddCuenta}" id="ddCuenta"
                            items="#{novDevolucion.vw_cuentaorigendevDataProvider.options['NOMCUENTA,NOMCUENTA']}"
                            style="height: 24px; left: 456px; top: 480px; position: absolute; width: 312px" tabIndex="10"/>
                        <ui:label binding="#{novDevolucion.lbBanco21}" id="lbBanco21" style="left: 312px; top: 768px; position: absolute" text="Valor Adicional"/>
                        <ui:textField binding="#{novDevolucion.txtValorAdicional}" id="txtValorAdicional" maxLength="7"
                            style="left: 456px; top: 768px; position: absolute; width: 144px" tabIndex="20"/>
                        <ui:checkbox binding="#{novDevolucion.civa}" id="civa" label="Valores incluyen IVA" selectedValue="S"
                            style="left: 456px; top: 792px; position: absolute" tabIndex="21" visible="false"/>
                        <ui:checkbox binding="#{novDevolucion.crete}" id="crete" label="Valores incluyen retefuente" selectedValue="S"
                            style="left: 624px; top: 792px; position: absolute; width: 168px" tabIndex="22" visible="false"/>
                        <ui:label binding="#{novDevolucion.lbBanco22}" id="lbBanco22" style="left: 312px; top: 432px; position: absolute" text="DNS banco"/>
                        <ui:textField binding="#{novDevolucion.txtDns}" id="txtDns" maxLength="20"
                            style="left: 456px; top: 432px; position: absolute; width: 120px" tabIndex="9"/>
                        <ui:label binding="#{novDevolucion.lbBanco23}" id="lbBanco23" style="left: 312px; top: 576px; position: absolute" text="Numero Liquidacion"/>
                        <ui:textField binding="#{novDevolucion.txtLiq}" id="txtLiq" maxLength="10"
                            style="left: 456px; top: 576px; position: absolute; width: 144px" tabIndex="14"/>
                        <ui:dropDown binding="#{novDevolucion.ddMotivo}" id="ddMotivo" items="#{novDevolucion.ddMotivoDefaultOptions.options}"
                            onChange="common_timeoutSubmitForm(this.form, 'ddMotivo');" style="left: 456px; top: 696px; position: absolute; width: 312px"
                            tabIndex="17" valueChangeListener="#{novDevolucion.ddMotivo_processValueChange}"/>
                        <ui:label binding="#{novDevolucion.label9}" id="label9" style="left: 312px; top: 384px; position: absolute" text="Tipo Identificacion"/>
                        <ui:dropDown binding="#{novDevolucion.ddTipoIde1}" id="ddTipoIde1" items="#{novDevolucion.ddTipoIde1DefaultOptions.options}"
                            style="left: 456px; top: 384px; position: absolute; width: 120px" tabIndex="7"/>
                        <ui:label binding="#{novDevolucion.label10}" id="label10" style="left: 312px; top: 408px; position: absolute" text="Numero Identificacion"/>
                        <ui:textField binding="#{novDevolucion.txtNumIdentificacion1}" id="txtNumIdentificacion1" maxLength="13"
                            style="left: 456px; top: 408px; position: absolute; width: 120px" tabIndex="8"/>
                        <ui:label binding="#{novDevolucion.lbBanco24}" id="lbBanco24" style="left: 312px; top: 1008px; position: absolute" text="SEVIAL 3.0%"/>
                        <ui:textField binding="#{novDevolucion.txtValorsevial3}" id="txtValorsevial3" maxLength="10"
                            style="left: 504px; top: 1008px; position: absolute; width: 144px" tabIndex="29"/>
                        <ui:calendar binding="#{novDevolucion.cfechaLiq}" dateFormatPattern="yyyy-MM-dd" id="cfechaLiq"
                            style="left: 456px; top: 600px; position: absolute" tabIndex="15"/>
                        <ui:label binding="#{novDevolucion.lbBanco25}" id="lbBanco25" style="left: 312px; top: 600px; position: absolute" text="Fecha Liquidacion"/>
                        <ui:label binding="#{novDevolucion.lbBanco26}" id="lbBanco26" style="left: 312px; top: 1200px; position: absolute" text="Valor Metrotransito - Barranquilla"/>
                        <ui:textField binding="#{novDevolucion.txtVlrTercero}" id="txtVlrTercero" maxLength="10"
                            style="left: 504px; top: 1200px; position: absolute; width: 144px" tabIndex="36"/>
                        <ui:label binding="#{novDevolucion.lbBanco27}" id="lbBanco27" style="left: 312px; top: 648px; position: absolute" text="Fecha Comparendo"/>
                        <ui:calendar binding="#{novDevolucion.cfechaCom}" dateFormatPattern="yyyy-MM-dd" id="cfechaCom"
                            style="left: 456px; top: 648px; position: absolute" tabIndex="16"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
