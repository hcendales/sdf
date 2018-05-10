<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:ui="http://www.sun.com/web/ui">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <ui:page binding="#{IdentificarAcuerdo.page1}" id="page1">
            <ui:html binding="#{IdentificarAcuerdo.html1}" id="html1">
                <ui:head binding="#{IdentificarAcuerdo.head1}" id="head1">
                    <ui:link binding="#{IdentificarAcuerdo.link1}" id="link1" url="/resources/stylesheet.css"/>
                </ui:head>
                <ui:body binding="#{IdentificarAcuerdo.body1}" focus="form1:ddFormato" id="body1" style="-rave-layout: grid">
                    <ui:form binding="#{IdentificarAcuerdo.form1}" id="form1">
                        <div style="height: 120px; left: 0px; top: 144px; position: absolute; width: 24px">
                            <jsp:directive.include file="Navigation.jspf"/>
                        </div>
                        <ui:staticText binding="#{IdentificarAcuerdo.stopcion1}" id="stopcion1"
                            style="color: rgb(0, 0, 204); font-family: 'Arial','Helvetica',sans-serif; font-size: 14px; left: 264px; top: 120px; position: absolute; width: 190px" text="Aplicar Acuerdos de Pago"/>
                        <div>
                            <jsp:directive.include file="CompanyLogo.jspf"/>
                        </div>
                        <ui:label binding="#{IdentificarAcuerdo.label3}" id="label3" style="left: 336px; top: 192px; position: absolute" text="Periodo"/>
                        <ui:dropDown binding="#{IdentificarAcuerdo.ddPeriodo}" id="ddPeriodo"
                            items="#{IdentificarAcuerdo.vw_acuerdopagoperiodoDataProvider.options['PERIODO,PERIODO']}"
                            style="height: 24px; left: 432px; top: 192px; position: absolute; width: 144px" valueChangeListener="#{IdentificarAcuerdo.ddPeriodo_processValueChange}"/>
                        <ui:table augmentTitle="false" binding="#{IdentificarAcuerdo.table1}" id="table1" paginationControls="true"
                            style="left: 312px; top: 240px; position: absolute; width: 3240px" title="Acuerdos" width="3040">
                            <ui:tableRowGroup binding="#{IdentificarAcuerdo.tableRowGroup1}" emptyDataMsg="No hay informacion" id="tableRowGroup1" rows="8"
                                sourceData="#{IdentificarAcuerdo.vw_acuerdopago_consultaDataProvider}" sourceVar="currentRow">
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn28}" id="tableColumn28">
                                    <ui:button action="#{IdentificarAcuerdo.beditar_action}" binding="#{IdentificarAcuerdo.beditar}" id="beditar"
                                        imageURL="/resources/edit.GIF" text="Editar"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn13}" headerText="IDACUERDO" id="tableColumn13" sort="IDACUERDO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stIdAcuerdo}" id="stIdAcuerdo" text="#{currentRow.value['IDACUERDO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn3}" headerText="MUNICIPIO" id="tableColumn3" sort="NOMBREMUNICIPIO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stmunicipio}" id="stmunicipio" text="#{currentRow.value['NOMBREMUNICIPIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn5}" headerText="VALOR" id="tableColumn5" sort="VALOR" width="74">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvalor}" id="stvalor" text="#{currentRow.value['VALOR']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn26}" headerText="ESTADO" id="tableColumn26" sort="NOMESTADO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stestado}" id="stestado" text="#{currentRow.value['NOMESTADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn22}" headerText="PERIODO" id="tableColumn22" sort="PERIODO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stperiodo}" id="stperiodo" text="#{currentRow.value['PERIODO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn1}" headerText="FEC_PAGO" id="tableColumn1" sort="FEC_PAGO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stfechapago}" id="stfechapago" text="#{currentRow.value['FEC_PAGO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn2}" headerText="DIVIPO" id="tableColumn2" sort="DIVIPO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stdivipo}" id="stdivipo" text="#{currentRow.value['DIVIPO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn7}" headerText="CONCESIONARIO" id="tableColumn7" sort="CONCESIONARIO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stconcesionario}" id="stconcesionario" text="#{currentRow.value['CONCESIONARIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn6}" headerText="IDCONCESIONARIO" id="tableColumn6" sort="IDCONCESIONARIO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stidconcesionario}" id="stidconcesionario" text="#{currentRow.value['IDCONCESIONARIO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn8}" headerText="VLRSIMITANTESPRORROGA" id="tableColumn8" sort="VLRSIMITANTESPRORROGA">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvsimitantes}" id="stvsimitantes" text="#{currentRow.value['VLRSIMITANTESPRORROGA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn9}" headerText="VLRPOLCAANTESPRORROGA" id="tableColumn9" sort="VLRPOLCAANTESPRORROGA">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvpolcaantes}" id="stvpolcaantes" text="#{currentRow.value['VLRPOLCAANTESPRORROGA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn10}" headerText="VLRSIMITDESPUESPRORROGA" id="tableColumn10" sort="VLRSIMITDESPUESPRORROGA">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvsimitdespues}" id="stvsimitdespues" text="#{currentRow.value['VLRSIMITDESPUESPRORROGA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn11}" headerText="VLRPOLCADESPUESPRORROGA" id="tableColumn11" sort="VLRPOLCADESPUESPRORROGA">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvpolcadespues}" id="stvpolcadespues" text="#{currentRow.value['VLRPOLCADESPUESPRORROGA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn12}" headerText="VLRREINTEGRARMUN" id="tableColumn12" sort="VLRREINTEGRARMUN">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvreintegrar}" id="stvreintegrar" text="#{currentRow.value['VLRREINTEGRARMUN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn25}" headerText="PORCENTAJE" id="tableColumn25" sort="PORCENTAJE">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stporcentaje}" id="stporcentaje" text="#{currentRow.value['PORCENTAJE']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn14}" headerText="FECHALIQ" id="tableColumn14" sort="FECHALIQ">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stfechaliq}" id="stfechaliq" text="#{currentRow.value['FECHALIQ']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn15}" headerText="VIGENCIA" id="tableColumn15" sort="VIGENCIA">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvigencia}" id="stvigencia" text="#{currentRow.value['VIGENCIA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn16}" headerText="FEC_VIG_INI" id="tableColumn16" sort="FEC_VIG_INI">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvigini}" id="stvigini" text="#{currentRow.value['FEC_VIG_INI']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn17}" headerText="FEC_VIG_FIN" id="tableColumn17" sort="FEC_VIG_FIN">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stvigfin}" id="stvigfin" text="#{currentRow.value['FEC_VIG_FIN']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn23}" headerText="CUENTA" id="tableColumn23" sort="CUENTA">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stcuenta}" id="stcuenta" text="#{currentRow.value['CUENTA']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn24}" headerText="IDBANCO" id="tableColumn24" sort="IDBANCO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stidbanco}" id="stidbanco" text="#{currentRow.value['IDBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn27}" headerText="NOMBANCO" id="tableColumn27" sort="NOMBANCO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stbanco}" id="stbanco" text="#{currentRow.value['NOMBANCO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn18}" headerText="ID ESTADO" id="tableColumn18" sort="ESTADO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stidestadoAc}" id="stidestadoAc" text="#{currentRow.value['ESTADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn19}" headerText="FECHAESTADO" id="tableColumn19" sort="FECHAESTADO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stfechaestado}" id="stfechaestado" text="#{currentRow.value['FECHAESTADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn20}" headerText="USUARIOESTADO" id="tableColumn20" sort="USUARIOESTADO">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stusuario}" id="stusuario" text="#{currentRow.value['USUARIOESTADO']}"/>
                                </ui:tableColumn>
                                <ui:tableColumn binding="#{IdentificarAcuerdo.tableColumn21}" headerText="OBSERVACIONES" id="tableColumn21" sort="OBSERVACIONES">
                                    <ui:staticText binding="#{IdentificarAcuerdo.stobservacion}" id="stobservacion" text="#{currentRow.value['OBSERVACIONES']}"/>
                                </ui:tableColumn>
                            </ui:tableRowGroup>
                        </ui:table>
                        <ui:label binding="#{IdentificarAcuerdo.label1}" id="label1" style="left: 336px; top: 792px; position: absolute" text="Municipio"/>
                        <ui:label binding="#{IdentificarAcuerdo.label2}" id="label2" style="left: 672px; top: 792px; position: absolute" text="Concesionario"/>
                        <ui:label binding="#{IdentificarAcuerdo.label4}" id="label4" style="left: 336px; top: 816px; position: absolute" text="Valor"/>
                        <ui:label binding="#{IdentificarAcuerdo.label5}" id="label5" style="left: 672px; top: 816px; position: absolute" text="Fecha pago"/>
                        <ui:label binding="#{IdentificarAcuerdo.label6}" id="label6" style="left: 336px; top: 840px; position: absolute" text="Cuenta"/>
                        <ui:label binding="#{IdentificarAcuerdo.label7}" id="label7" style="left: 672px; top: 840px; position: absolute" text="Banco"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tmunicipio}" id="tmunicipio" readOnly="true" style="height: 24px; left: 408px; top: 792px; position: absolute; width: 240px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tvalor}" disabled="true" id="tvalor" readOnly="true" style="height: 24px; left: 408px; top: 816px; position: absolute; width: 240px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tcuenta}" disabled="true" id="tcuenta" readOnly="true" style="height: 24px; left: 408px; top: 840px; position: absolute; width: 240px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tconcesionario}" disabled="true" id="tconcesionario" readOnly="true" style="height: 24px; left: 768px; top: 792px; position: absolute; width: 240px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tfechaPago}" disabled="true" id="tfechaPago" readOnly="true" style="height: 24px; left: 768px; top: 816px; position: absolute; width: 240px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tbanco}" disabled="true" id="tbanco" readOnly="true" style="height: 24px; left: 768px; top: 840px; position: absolute; width: 240px"/>
                        <ui:label binding="#{IdentificarAcuerdo.label8}" id="label8" style="left: 336px; top: 744px; position: absolute" text="ID ACUERDO"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tidAcuerdo}" disabled="true" id="tidAcuerdo" style="height: 24px; left: 408px; top: 744px; position: absolute; width: 240px"/>
                        <ui:label binding="#{IdentificarAcuerdo.label9}" id="label9" style="left: 336px; top: 912px; position: absolute" text="Valor SIMIT"/>
                        <ui:label binding="#{IdentificarAcuerdo.label11}" id="label11" style="left: 504px; top: 888px; position: absolute" text="Antes de prorroga"/>
                        <ui:label binding="#{IdentificarAcuerdo.label12}" id="label12" style="left: 672px; top: 888px; position: absolute" text="Despues de prorroga"/>
                        <ui:label binding="#{IdentificarAcuerdo.label13}" id="label13" style="left: 336px; top: 936px; position: absolute" text="Valor POLCA"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tvsimitAntes}" id="tvsimitAntes" style="height: 24px; left: 456px; top: 912px; position: absolute; width: 192px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tvPolcaAntes}" id="tvPolcaAntes" style="height: 24px; left: 456px; top: 936px; position: absolute; width: 192px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tvsimitDespues}" id="tvsimitDespues" style="height: 24px; left: 672px; top: 912px; position: absolute; width: 192px"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tvPolcaDespues}" id="tvPolcaDespues" style="height: 24px; left: 672px; top: 936px; position: absolute; width: 192px"/>
                        <ui:label binding="#{IdentificarAcuerdo.label14}" id="label14" style="left: 336px; top: 984px; position: absolute" text="Valor reintegrar"/>
                        <ui:textField binding="#{IdentificarAcuerdo.tvReintegrar}" id="tvReintegrar" style="height: 24px; left: 456px; top: 984px; position: absolute; width: 192px"/>
                        <ui:label binding="#{IdentificarAcuerdo.label15}" id="label15" style="left: 336px; top: 1032px; position: absolute" text="Vigencia inicial"/>
                        <ui:label binding="#{IdentificarAcuerdo.label16}" id="label16" style="left: 744px; top: 1032px; position: absolute" text="Vigencia final"/>
                        <ui:calendar binding="#{IdentificarAcuerdo.cvigInicial}" dateFormatPattern="yyyy-MM-dd" dateFormatPatternHelp="yyyy-mm-dd"
                            id="cvigInicial" style="position: absolute; left: 456px; top: 1032px"/>
                        <ui:calendar binding="#{IdentificarAcuerdo.cvigFinal}" dateFormatPattern="yyyy-MM-dd" dateFormatPatternHelp="yyyy-mm-dd" id="cvigFinal" style="left: 840px; top: 1032px; position: absolute"/>
                        <ui:dropDown binding="#{IdentificarAcuerdo.destado}" id="destado"
                            items="#{IdentificarAcuerdo.vw_acuerdopagoestadoDataProvider.options['ESTADO,NOMBRE']}" style="left: 456px; top: 1104px; position: absolute; width: 168px"/>
                        <ui:label binding="#{IdentificarAcuerdo.label17}" id="label17" style="left: 336px; top: 1104px; position: absolute" text="Estado"/>
                        <ui:label binding="#{IdentificarAcuerdo.label18}" id="label18" style="left: 336px; top: 1152px; position: absolute" text="Observaciones"/>
                        <ui:textArea binding="#{IdentificarAcuerdo.tobservaciones}" id="tobservaciones" style="position: absolute; left: 456px; top: 1152px; width: 336px; height: 96px"/>
                        <ui:label binding="#{IdentificarAcuerdo.label19}" id="label19" style="left: 888px; top: 936px; position: absolute" text="Porcentaje"/>
                        <ui:dropDown binding="#{IdentificarAcuerdo.dporcentaje}" id="dporcentaje"
                            items="#{IdentificarAcuerdo.dporcentajeDefaultOptions.options}" style="left: 960px; top: 936px; position: absolute"/>
                        <ui:button action="#{IdentificarAcuerdo.bactualizar_action}" binding="#{IdentificarAcuerdo.bactualizar}" id="bactualizar"
                            style="left: 528px; top: 1272px; position: absolute; width: 95px" text="Actualizar"/>
                        <ui:button action="#{IdentificarAcuerdo.bbuscar_action}" binding="#{IdentificarAcuerdo.bbuscar}" id="bbuscar"
                            style="left: 647px; top: 192px; position: absolute; width: 96px" text="Consultar"/>
                    </ui:form>
                </ui:body>
            </ui:html>
        </ui:page>
    </f:view>
</jsp:root>
