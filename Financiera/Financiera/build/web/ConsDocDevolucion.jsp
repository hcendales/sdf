<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{ConsDocDevolucion.page1}" id="page1">
            <ui:html binding="#{ConsDocDevolucion.html1}" id="html1">
                <ui:head binding="#{ConsDocDevolucion.head1}" id="head1">
                    <ui:link binding="#{ConsDocDevolucion.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{ConsDocDevolucion.body1}" focus="form1:ddMunicipio" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{ConsDocDevolucion.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{ConsDocDevolucion.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute" text="Novedad Devolucion de Pago"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{ConsDocDevolucion.label1}" id="label1" style="color: red; left: 288px; top: 168px; position: absolute" text="DATOS INFRACTOR"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddBanco}" disabled="true" id="ddBanco" immediate="true"
                            items="#{ConsDocDevolucion.bancoDataProvider.options['IDBANCO,NOMBREBANCO']}"
                            style="left: 1080px; top: 168px; position: absolute; width: 312px" tabIndex="4"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco}" id="lbBanco" style="left: 936px; top: 168px; position: absolute" text="Banco"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddMunicipio}" disabled="true" id="ddMunicipio"
                            items="#{ConsDocDevolucion.municipioDataProvider.options['IDMUNICIPIO,NOMBRE']}"
                            style="left: 456px; top: 336px; position: absolute; width: 312px" tabIndex="7"/>
                        <ui:label binding="#{ConsDocDevolucion.label2}" id="label2" style="left: 312px; top: 192px; position: absolute" text="Nombre"/>
                        <ui:label binding="#{ConsDocDevolucion.label3}" id="label3" style="left: 312px; top: 216px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{ConsDocDevolucion.label4}" id="label4" style="left: 312px; top: 240px; position: absolute" text="Numero Identificacion"/>
                        <ui:label binding="#{ConsDocDevolucion.label5}" id="label5" style="color: red; left: 912px; top: 144px; position: absolute" text="CUENTA PARA DEVOLUCION"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco1}" id="lbBanco1" style="left: 936px; top: 192px; position: absolute" text="Tipo Cuenta"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco2}" id="lbBanco2" style="left: 936px; top: 216px; position: absolute" text="Numero Cuenta"/>
                        <ui:label binding="#{ConsDocDevolucion.label6}" id="label6" style="color: red; left: 288px; top: 288px; position: absolute" text="DATOS DEVOLUCION"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco3}" id="lbBanco3" style="left: 312px; top: 336px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco4}" id="lbBanco4" style="left: 312px; top: 360px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco5}" id="lbBanco5" style="left: 312px; top: 384px; position: absolute" text="Tipo Comparendo"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco6}" id="lbBanco6" style="left: 312px; top: 480px; position: absolute" text="Motivo Devolucion"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco7}" id="lbBanco7" style="left: 312px; top: 504px; position: absolute" text="Valor Devolucion"/>
                        <ui:label binding="#{ConsDocDevolucion.label7}" id="label7" style="color: red; left: 912px; top: 336px; position: absolute" text="VALORES DEVOLUCION"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco8}" id="lbBanco8" style="left: 936px; top: 360px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco9}" id="lbBanco9" style="left: 936px; top: 384px; position: absolute" text="FCM"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco10}" id="lbBanco10" style="left: 936px; top: 408px; position: absolute" text="Fondo Cobertura Simit"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco11}" id="lbBanco11" style="left: 936px; top: 432px; position: absolute" text="Fondo Cobertura Concesionario"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco12}" id="lbBanco12" style="left: 936px; top: 456px; position: absolute" text="Equilibrio Economico"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco13}" id="lbBanco13" style="left: 936px; top: 552px; position: absolute" text="SEVIAL 2.7%"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco14}" id="lbBanco14" style="left: 936px; top: 504px; position: absolute" text="POLCA"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco15}" id="lbBanco15" style="left: 936px; top: 528px; position: absolute" text="FCM POLCA 1.8%"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco16}" id="lbBanco16" style="left: 936px; top: 600px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco17}" id="lbBanco17" style="left: 936px; top: 624px; position: absolute" text="Contravencional  FCM"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco18}" id="lbBanco18" style="left: 936px; top: 648px; position: absolute" text="Contravencional  Concesionario"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtNombre}" disabled="true" id="txtNombre" maxLength="50"
                            style="left: 456px; top: 192px; position: absolute; width: 432px" tabIndex="1"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtNumIdentificacion}" disabled="true" id="txtNumIdentificacion" maxLength="13"
                            style="left: 456px; top: 240px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddTipoIde}" disabled="true" id="ddTipoIde"
                            items="#{ConsDocDevolucion.ddTipoIdeDefaultOptions.options}" style="left: 456px; top: 216px; position: absolute; width: 120px" tabIndex="2"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddTipoCta}" disabled="true" id="ddTipoCta"
                            items="#{ConsDocDevolucion.ddTipoCtaDefaultOptions.options}" style="left: 1080px; top: 192px; position: absolute; width: 144px" tabIndex="5"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtCuenta}" disabled="true" id="txtCuenta" maxLength="16"
                            style="left: 1080px; top: 216px; position: absolute; width: 144px" tabIndex="6"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddTipoCom}" disabled="true" id="ddTipoCom"
                            items="#{ConsDocDevolucion.ddTipoComDefaultOptions.options}" style="left: 456px; top: 384px; position: absolute; width: 96px" tabIndex="9"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtMotivo}" disabled="true" id="txtMotivo" maxLength="50"
                            style="left: 456px; top: 480px; position: absolute; width: 432px" tabIndex="10"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorDev}" disabled="true" id="txtValorDev" maxLength="7"
                            style="left: 456px; top: 504px; position: absolute; width: 144px" tabIndex="11"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorConces}" disabled="true" id="txtValorConces" maxLength="10"
                            style="left: 1128px; top: 360px; position: absolute; width: 144px" tabIndex="13"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorFcm}" disabled="true" id="txtValorFcm" maxLength="10"
                            style="left: 1128px; top: 384px; position: absolute; width: 144px" tabIndex="14"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorFonSim}" disabled="true" id="txtValorFonSim" maxLength="10"
                            style="left: 1128px; top: 408px; position: absolute; width: 144px" tabIndex="15"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorFonCon}" disabled="true" id="txtValorFonCon" maxLength="10"
                            style="left: 1128px; top: 432px; position: absolute; width: 144px" tabIndex="16"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorEquil}" disabled="true" id="txtValorEquil" maxLength="10"
                            style="left: 1128px; top: 456px; position: absolute; width: 144px" tabIndex="17"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorPolca}" disabled="true" id="txtValorPolca" maxLength="10"
                            style="left: 1128px; top: 504px; position: absolute; width: 144px" tabIndex="18"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorFcmPolca}" disabled="true" id="txtValorFcmPolca" maxLength="10"
                            style="left: 1128px; top: 528px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorsevial}" disabled="true" id="txtValorsevial" maxLength="10"
                            style="left: 1128px; top: 480px; position: absolute; width: 144px" tabIndex="20"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorMunicipio}" disabled="true" id="txtValorMunicipio" maxLength="10"
                            style="left: 1128px; top: 600px; position: absolute; width: 144px" tabIndex="21"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorContravFcm}" disabled="true" id="txtValorContravFcm" maxLength="10"
                            style="left: 1128px; top: 624px; position: absolute; width: 144px" tabIndex="22"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorContravCon}" disabled="true" id="txtValorContravCon" maxLength="10"
                            style="left: 1128px; top: 648px; position: absolute; width: 144px" tabIndex="23"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco19}" id="lbBanco19" style="left: 336px; top: 600px; position: absolute" text="Fecha Activacion"/>
                        <ui:calendar binding="#{ConsDocDevolucion.cfechaAct}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="cfechaAct"
                            style="left: 528px; top: 600px; position: absolute" tabIndex="24"/>
                        <ui:label binding="#{ConsDocDevolucion.label8}" id="label8" style="color: red; left: 312px; top: 576px; position: absolute" text="ACTIVACION"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddConcesionario}" disabled="true" id="ddConcesionario"
                            items="#{ConsDocDevolucion.concesionarioDataProvider.options['IDCONCESIONARIO,NOMBRECONCESIOANRIO']}"
                            style="left: 456px; top: 360px; position: absolute; width: 312px" tabIndex="8"/>
                        <ui:textField binding="#{ConsDocDevolucion.tfNumero}" disabled="true" id="tfNumero" maxLength="10"
                            style="left: 456px; top: 144px; position: absolute; width: 138px" tabIndex="50"/>
                        <ui:label binding="#{ConsDocDevolucion.label9}" id="label9" style="left: 312px; top: 144px; position: absolute" text="Número Novedad"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco20}" id="lbBanco20" style="left: 312px; top: 312px; position: absolute" text="Cuenta Recaudo"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddCuenta}" disabled="true" id="ddCuenta"
                            items="#{ConsDocDevolucion.vw_cuentaorigendevDataProvider.options['CUENTA,NOMCUENTA']}" style="left: 456px; top: 312px; position: absolute; width: 312px"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco21}" id="lbBanco21" style="left: 312px; top: 528px; position: absolute" text="Valor Adicional"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorDev1}" disabled="true" id="txtValorDev1" maxLength="10"
                            style="left: 456px; top: 528px; position: absolute; width: 144px" tabIndex="11"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco21}" id="lbBanco21" style="left: 312px; top: 576px; position: absolute" text="Valor Adicional"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco22}" id="lbBanco22" style="left: 936px; top: 480px; position: absolute" text="SEVIAL 3.0%"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtValorSevial27}" disabled="true" id="txtValorSevial27" maxLength="10"
                            style="left: 1128px; top: 552px; position: absolute; width: 144px" tabIndex="19"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco23}" id="lbBanco23" style="left: 312px; top: 408px; position: absolute" text="Numero Liquidacion"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtNumLiq}" disabled="true" id="txtNumLiq" maxLength="7"
                            style="left: 456px; top: 408px; position: absolute; width: 144px" tabIndex="11"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco24}" id="lbBanco24" style="left: 312px; top: 432px; position: absolute" text="Fecha Liquidacion"/>
                        <ui:calendar binding="#{ConsDocDevolucion.cfechaLiq}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="cfechaLiq"
                            style="left: 456px; top: 432px; position: absolute" tabIndex="24"/>
                        <ui:label binding="#{ConsDocDevolucion.label10}" id="label10" style="left: 936px; top: 240px; position: absolute" text="Tipo Identificacion"/>
                        <ui:label binding="#{ConsDocDevolucion.label11}" id="label11" style="left: 936px; top: 264px; position: absolute" text="Numero Identificacion"/>
                        <ui:dropDown binding="#{ConsDocDevolucion.ddTipoIde1}" disabled="true" id="ddTipoIde1"
                            items="#{ConsDocDevolucion.ddTipoIde1DefaultOptions.options}" style="left: 1080px; top: 240px; position: absolute; width: 120px" tabIndex="2"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtNumIdentificacion1}" disabled="true" id="txtNumIdentificacion1" maxLength="13"
                            style="left: 1080px; top: 264px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:label binding="#{ConsDocDevolucion.label12}" id="label12" style="left: 936px; top: 288px; position: absolute" text="DNS Banco"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtDns}" disabled="true" id="txtDns" maxLength="13"
                            style="left: 1080px; top: 288px; position: absolute; width: 120px" tabIndex="3"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco25}" id="lbBanco25" style="left: 936px; top: 672px; position: absolute" text="Valor Metrotransito - Barranquilla"/>
                        <ui:textField binding="#{ConsDocDevolucion.txtVlrTercero}" disabled="true" id="txtVlrTercero" maxLength="10"
                            style="left: 1128px; top: 672px; position: absolute; width: 144px" tabIndex="23"/>
                        <ui:label binding="#{ConsDocDevolucion.lbBanco26}" id="lbBanco26" style="left: 312px; top: 456px; position: absolute" text="Fecha Comparendo"/>
                        <ui:calendar binding="#{ConsDocDevolucion.cfechaCom}" dateFormatPattern="yyyy-MM-dd" disabled="true" id="cfechaCom"
                            style="left: 456px; top: 456px; position: absolute" tabIndex="24"/>
                        <ui:table augmentTitle="false" binding="#{ConsDocDevolucion.table1}" id="table1"
                            style="left: 336px; top: 816px; position: absolute; width: 840px" title="Documentos Soporte" width="840">
                            <ui:tableRowGroup binding="#{ConsDocDevolucion.tableRowGroup1}" id="tableRowGroup1" rows="10"
                                sourceData="#{ConsDocDevolucion.vw_soportedevolucionDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn9}" id="tableColumn9">
                                    <ui:button action="#{ConsDocDevolucion.beliminar_action}" binding="#{ConsDocDevolucion.beliminar}" id="beliminar"
                                        imageURL="/resources/no.gif"
                                        onClick="return confirmar(this);&#xa;&#xa;function confirmar(formObj) { &#xa;&#xa;    if(!confirm(&quot;Desea eliminar registro ?&quot;)) &#xa;    { &#xa;      return false;&#xa;    }&#xa;&#xa;}&#xa;"
                                        style="height: 24px" text="Eliminar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn1}" headerText="NUMERONOV" id="tableColumn1" sort="NUMERONOV">
                                    <ui:staticText binding="#{ConsDocDevolucion.staticText1}" id="staticText1" text="#{currentRow.value['NUMERONOV']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn2}" headerText="ID_DOCUMENTO" id="tableColumn2" sort="ID_DOCUMENTO">
                                    <ui:staticText binding="#{ConsDocDevolucion.stIdDoc}" id="stIdDoc" text="#{currentRow.value['ID_DOCUMENTO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn3}" headerText="NOMBREDOCUMENTO" id="tableColumn3" sort="NOMBREDOCUMENTO">
                                    <ui:staticText binding="#{ConsDocDevolucion.staticText3}" id="staticText3" text="#{currentRow.value['NOMBREDOCUMENTO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn4}" headerText="NOMBREARCHIVO" id="tableColumn4" sort="NOMBREARCHIVO">
                                    <ui:staticText binding="#{ConsDocDevolucion.staticText4}" id="staticText4" text="#{currentRow.value['NOMBREARCHIVO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn5}" headerText="EXTENSIONARCHIVO" id="tableColumn5" sort="EXTENSIONARCHIVO">
                                    <ui:staticText binding="#{ConsDocDevolucion.staticText5}" id="staticText5" text="#{currentRow.value['EXTENSIONARCHIVO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn6}" headerText="USUARIOCARGUE" id="tableColumn6" sort="USUARIOCARGUE">
                                    <ui:staticText binding="#{ConsDocDevolucion.staticText6}" id="staticText6" text="#{currentRow.value['USUARIOCARGUE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn7}" headerText="FECHACARGUE" id="tableColumn7" sort="FECHACARGUE">
                                    <ui:staticText binding="#{ConsDocDevolucion.staticText7}" id="staticText7" text="#{currentRow.value['FECHACARGUE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{ConsDocDevolucion.tableColumn8}" id="tableColumn8">
                                    <ui:button action="#{ConsDocDevolucion.bver_action}" binding="#{ConsDocDevolucion.bver}" id="bver" text="Ver"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:textField binding="#{ConsDocDevolucion.tfNombre1}" id="tfNombre1" style="left: 456px; top: 720px; position: absolute"/>
                        <ui:button action="#{ConsDocDevolucion.btAgregar_action}" binding="#{ConsDocDevolucion.btAgregar}" id="btAgregar"
                            onClick="btAgregar_action()" style="left: 455px; top: 768px; position: absolute; width: 85px" tabIndex="10" text="Adjuntar"/>
                        <ui:upload binding="#{ConsDocDevolucion.fileUpload1}" id="fileUpload1" style="left: 456px; top: 672px; position: absolute"/>
                        <ui:label binding="#{ConsDocDevolucion.label13}" id="label13" style="left: 336px; top: 672px; position: absolute" text="Archivo"/>
                        <ui:label binding="#{ConsDocDevolucion.label14}" id="label14" style="left: 336px; top: 720px; position: absolute" text="Nombre documento"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
