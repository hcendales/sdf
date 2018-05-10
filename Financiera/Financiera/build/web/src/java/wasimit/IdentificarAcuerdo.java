/*
 * rptLiqSimitLoc.java
 *
 * Created on 28 de noviembre de 2007, 02:30 PM
 * Copyright DSOFTFIN
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.Calendar;
import com.sun.rave.web.ui.component.Checkbox;
import com.sun.rave.web.ui.component.DropDown;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Listbox;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultOptionsList;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.context.ExternalContext;
import javax.faces.event.ValueChangeEvent;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class IdentificarAcuerdo extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        vw_acuerdopagoperiodoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_acuerdopagoperiodoRowSet}"));
        vw_acuerdopago_consultaDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_acuerdopago_consultaRowSet}"));
        vw_acuerdopagoestadoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_acuerdopagoestadoRowSet}"));
        dporcentajeDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("10", "10"), new com.sun.rave.web.ui.model.Option("45", "45"), new com.sun.rave.web.ui.model.Option("55", "55")});
    }
    
    private Page page1 = new Page();
    
    public Page getPage1() {
        return page1;
    }
    
    public void setPage1(Page p) {
        this.page1 = p;
    }
    
    private Html html1 = new Html();
    
    public Html getHtml1() {
        return html1;
    }
    
    public void setHtml1(Html h) {
        this.html1 = h;
    }
    
    private Head head1 = new Head();
    
    public Head getHead1() {
        return head1;
    }
    
    public void setHead1(Head h) {
        this.head1 = h;
    }
    
    private Link link1 = new Link();
    
    public Link getLink1() {
        return link1;
    }
    
    public void setLink1(Link l) {
        this.link1 = l;
    }
    
    private Body body1 = new Body();
    
    public Body getBody1() {
        return body1;
    }
    
    public void setBody1(Body b) {
        this.body1 = b;
    }
    
    private Form form1 = new Form();
    
    public Form getForm1() {
        return form1;
    }
    
    public void setForm1(Form f) {
        this.form1 = f;
    }
    
    private StaticText stopcion1 = new StaticText();
    
    public StaticText getStopcion1() {
        return stopcion1;
    }
    
    public void setStopcion1(StaticText st) {
        this.stopcion1 = st;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }

    private DropDown ddPeriodo = new DropDown();

    public DropDown getDdPeriodo() {
        return ddPeriodo;
    }

    public void setDdPeriodo(DropDown dd) {
        this.ddPeriodo = dd;
    }

    private CachedRowSetDataProvider vw_acuerdopagoperiodoDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_acuerdopagoperiodoDataProvider() {
        return vw_acuerdopagoperiodoDataProvider;
    }

    public void setVw_acuerdopagoperiodoDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_acuerdopagoperiodoDataProvider = crsdp;
    }

    private Table table1 = new Table();

    public Table getTable1() {
        return table1;
    }

    public void setTable1(Table t) {
        this.table1 = t;
    }

    private TableRowGroup tableRowGroup1 = new TableRowGroup();

    public TableRowGroup getTableRowGroup1() {
        return tableRowGroup1;
    }

    public void setTableRowGroup1(TableRowGroup trg) {
        this.tableRowGroup1 = trg;
    }

    private CachedRowSetDataProvider vw_acuerdopago_consultaDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_acuerdopago_consultaDataProvider() {
        return vw_acuerdopago_consultaDataProvider;
    }

    public void setVw_acuerdopago_consultaDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_acuerdopago_consultaDataProvider = crsdp;
    }

    private TableColumn tableColumn1 = new TableColumn();

    public TableColumn getTableColumn1() {
        return tableColumn1;
    }

    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }

    private StaticText stfechapago = new StaticText();

    public StaticText getStfechapago() {
        return stfechapago;
    }

    public void setStfechapago(StaticText st) {
        this.stfechapago = st;
    }

    private TableColumn tableColumn2 = new TableColumn();

    public TableColumn getTableColumn2() {
        return tableColumn2;
    }

    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }

    private StaticText stdivipo = new StaticText();

    public StaticText getStdivipo() {
        return stdivipo;
    }

    public void setStdivipo(StaticText st) {
        this.stdivipo = st;
    }

    private TableColumn tableColumn3 = new TableColumn();

    public TableColumn getTableColumn3() {
        return tableColumn3;
    }

    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }

    private StaticText stmunicipio = new StaticText();

    public StaticText getStmunicipio() {
        return stmunicipio;
    }

    public void setStmunicipio(StaticText st) {
        this.stmunicipio = st;
    }

    private TableColumn tableColumn5 = new TableColumn();

    public TableColumn getTableColumn5() {
        return tableColumn5;
    }

    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }

    private StaticText stvalor = new StaticText();

    public StaticText getStvalor() {
        return stvalor;
    }

    public void setStvalor(StaticText st) {
        this.stvalor = st;
    }

    private TableColumn tableColumn6 = new TableColumn();

    public TableColumn getTableColumn6() {
        return tableColumn6;
    }

    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }

    private StaticText stidconcesionario = new StaticText();

    public StaticText getStidconcesionario() {
        return stidconcesionario;
    }

    public void setStidconcesionario(StaticText st) {
        this.stidconcesionario = st;
    }

    private TableColumn tableColumn7 = new TableColumn();

    public TableColumn getTableColumn7() {
        return tableColumn7;
    }

    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }

    private StaticText stconcesionario = new StaticText();

    public StaticText getStconcesionario() {
        return stconcesionario;
    }

    public void setStconcesionario(StaticText st) {
        this.stconcesionario = st;
    }

    private TableColumn tableColumn8 = new TableColumn();

    public TableColumn getTableColumn8() {
        return tableColumn8;
    }

    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }

    private StaticText stvsimitantes = new StaticText();

    public StaticText getStvsimitantes() {
        return stvsimitantes;
    }

    public void setStvsimitantes(StaticText st) {
        this.stvsimitantes = st;
    }

    private TableColumn tableColumn9 = new TableColumn();

    public TableColumn getTableColumn9() {
        return tableColumn9;
    }

    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }

    private StaticText stvpolcaantes = new StaticText();

    public StaticText getStvpolcaantes() {
        return stvpolcaantes;
    }

    public void setStvpolcaantes(StaticText st) {
        this.stvpolcaantes = st;
    }

    private TableColumn tableColumn10 = new TableColumn();

    public TableColumn getTableColumn10() {
        return tableColumn10;
    }

    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }

    private StaticText stvsimitdespues = new StaticText();

    public StaticText getStvsimitdespues() {
        return stvsimitdespues;
    }

    public void setStvsimitdespues(StaticText st) {
        this.stvsimitdespues = st;
    }

    private TableColumn tableColumn11 = new TableColumn();

    public TableColumn getTableColumn11() {
        return tableColumn11;
    }

    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }

    private StaticText stvpolcadespues = new StaticText();

    public StaticText getStvpolcadespues() {
        return stvpolcadespues;
    }

    public void setStvpolcadespues(StaticText st) {
        this.stvpolcadespues = st;
    }

    private TableColumn tableColumn12 = new TableColumn();

    public TableColumn getTableColumn12() {
        return tableColumn12;
    }

    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }

    private StaticText stvreintegrar = new StaticText();

    public StaticText getStvreintegrar() {
        return stvreintegrar;
    }

    public void setStvreintegrar(StaticText st) {
        this.stvreintegrar = st;
    }

    private TableColumn tableColumn13 = new TableColumn();

    public TableColumn getTableColumn13() {
        return tableColumn13;
    }

    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }

    private StaticText stIdAcuerdo = new StaticText();

    public StaticText getStIdAcuerdo() {
        return stIdAcuerdo;
    }

    public void setStIdAcuerdo(StaticText st) {
        this.stIdAcuerdo = st;
    }

    private TableColumn tableColumn14 = new TableColumn();

    public TableColumn getTableColumn14() {
        return tableColumn14;
    }

    public void setTableColumn14(TableColumn tc) {
        this.tableColumn14 = tc;
    }

    private StaticText stfechaliq = new StaticText();

    public StaticText getStfechaliq() {
        return stfechaliq;
    }

    public void setStfechaliq(StaticText st) {
        this.stfechaliq = st;
    }

    private TableColumn tableColumn15 = new TableColumn();

    public TableColumn getTableColumn15() {
        return tableColumn15;
    }

    public void setTableColumn15(TableColumn tc) {
        this.tableColumn15 = tc;
    }

    private StaticText stvigencia = new StaticText();

    public StaticText getStvigencia() {
        return stvigencia;
    }

    public void setStvigencia(StaticText st) {
        this.stvigencia = st;
    }

    private TableColumn tableColumn16 = new TableColumn();

    public TableColumn getTableColumn16() {
        return tableColumn16;
    }

    public void setTableColumn16(TableColumn tc) {
        this.tableColumn16 = tc;
    }

    private StaticText stvigini = new StaticText();

    public StaticText getStvigini() {
        return stvigini;
    }

    public void setStvigini(StaticText st) {
        this.stvigini = st;
    }

    private TableColumn tableColumn17 = new TableColumn();

    public TableColumn getTableColumn17() {
        return tableColumn17;
    }

    public void setTableColumn17(TableColumn tc) {
        this.tableColumn17 = tc;
    }

    private StaticText stvigfin = new StaticText();

    public StaticText getStvigfin() {
        return stvigfin;
    }

    public void setStvigfin(StaticText st) {
        this.stvigfin = st;
    }

    private TableColumn tableColumn18 = new TableColumn();

    public TableColumn getTableColumn18() {
        return tableColumn18;
    }

    public void setTableColumn18(TableColumn tc) {
        this.tableColumn18 = tc;
    }

    private StaticText stidestadoAc = new StaticText();

    public StaticText getStidestadoAc() {
        return stidestadoAc;
    }

    public void setStidestadoAc(StaticText st) {
        this.stidestadoAc = st;
    }

    private TableColumn tableColumn19 = new TableColumn();

    public TableColumn getTableColumn19() {
        return tableColumn19;
    }

    public void setTableColumn19(TableColumn tc) {
        this.tableColumn19 = tc;
    }

    private StaticText stfechaestado = new StaticText();

    public StaticText getStfechaestado() {
        return stfechaestado;
    }

    public void setStfechaestado(StaticText st) {
        this.stfechaestado = st;
    }

    private TableColumn tableColumn20 = new TableColumn();

    public TableColumn getTableColumn20() {
        return tableColumn20;
    }

    public void setTableColumn20(TableColumn tc) {
        this.tableColumn20 = tc;
    }

    private StaticText stusuario = new StaticText();

    public StaticText getStusuario() {
        return stusuario;
    }

    public void setStusuario(StaticText st) {
        this.stusuario = st;
    }

    private TableColumn tableColumn21 = new TableColumn();

    public TableColumn getTableColumn21() {
        return tableColumn21;
    }

    public void setTableColumn21(TableColumn tc) {
        this.tableColumn21 = tc;
    }

    private StaticText stobservacion = new StaticText();

    public StaticText getStobservacion() {
        return stobservacion;
    }

    public void setStobservacion(StaticText st) {
        this.stobservacion = st;
    }

    private TableColumn tableColumn22 = new TableColumn();

    public TableColumn getTableColumn22() {
        return tableColumn22;
    }

    public void setTableColumn22(TableColumn tc) {
        this.tableColumn22 = tc;
    }

    private StaticText stperiodo = new StaticText();

    public StaticText getStperiodo() {
        return stperiodo;
    }

    public void setStperiodo(StaticText st) {
        this.stperiodo = st;
    }

    private TableColumn tableColumn23 = new TableColumn();

    public TableColumn getTableColumn23() {
        return tableColumn23;
    }

    public void setTableColumn23(TableColumn tc) {
        this.tableColumn23 = tc;
    }

    private StaticText stcuenta = new StaticText();

    public StaticText getStcuenta() {
        return stcuenta;
    }

    public void setStcuenta(StaticText st) {
        this.stcuenta = st;
    }

    private TableColumn tableColumn24 = new TableColumn();

    public TableColumn getTableColumn24() {
        return tableColumn24;
    }

    public void setTableColumn24(TableColumn tc) {
        this.tableColumn24 = tc;
    }

    private StaticText stidbanco = new StaticText();

    public StaticText getStidbanco() {
        return stidbanco;
    }

    public void setStidbanco(StaticText st) {
        this.stidbanco = st;
    }

    private TableColumn tableColumn25 = new TableColumn();

    public TableColumn getTableColumn25() {
        return tableColumn25;
    }

    public void setTableColumn25(TableColumn tc) {
        this.tableColumn25 = tc;
    }

    private StaticText stporcentaje = new StaticText();

    public StaticText getStporcentaje() {
        return stporcentaje;
    }

    public void setStporcentaje(StaticText st) {
        this.stporcentaje = st;
    }

    private TableColumn tableColumn26 = new TableColumn();

    public TableColumn getTableColumn26() {
        return tableColumn26;
    }

    public void setTableColumn26(TableColumn tc) {
        this.tableColumn26 = tc;
    }

    private StaticText stestado = new StaticText();

    public StaticText getStestado() {
        return stestado;
    }

    public void setStestado(StaticText st) {
        this.stestado = st;
    }

    private TableColumn tableColumn27 = new TableColumn();

    public TableColumn getTableColumn27() {
        return tableColumn27;
    }

    public void setTableColumn27(TableColumn tc) {
        this.tableColumn27 = tc;
    }

    private StaticText stbanco = new StaticText();

    public StaticText getStbanco() {
        return stbanco;
    }

    public void setStbanco(StaticText st) {
        this.stbanco = st;
    }

    private TableColumn tableColumn28 = new TableColumn();

    public TableColumn getTableColumn28() {
        return tableColumn28;
    }

    public void setTableColumn28(TableColumn tc) {
        this.tableColumn28 = tc;
    }

    private Button beditar = new Button();

    public Button getBeditar() {
        return beditar;
    }

    public void setBeditar(Button b) {
        this.beditar = b;
    }

    private Label label1 = new Label();

    public Label getLabel1() {
        return label1;
    }

    public void setLabel1(Label l) {
        this.label1 = l;
    }

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private Label label5 = new Label();

    public Label getLabel5() {
        return label5;
    }

    public void setLabel5(Label l) {
        this.label5 = l;
    }

    private Label label6 = new Label();

    public Label getLabel6() {
        return label6;
    }

    public void setLabel6(Label l) {
        this.label6 = l;
    }

    private Label label7 = new Label();

    public Label getLabel7() {
        return label7;
    }

    public void setLabel7(Label l) {
        this.label7 = l;
    }

    private TextField tmunicipio = new TextField();

    public TextField getTmunicipio() {
        return tmunicipio;
    }

    public void setTmunicipio(TextField tf) {
        this.tmunicipio = tf;
    }

    private TextField tvalor = new TextField();

    public TextField getTvalor() {
        return tvalor;
    }

    public void setTvalor(TextField tf) {
        this.tvalor = tf;
    }

    private TextField tcuenta = new TextField();

    public TextField getTcuenta() {
        return tcuenta;
    }

    public void setTcuenta(TextField tf) {
        this.tcuenta = tf;
    }

    private TextField tconcesionario = new TextField();

    public TextField getTconcesionario() {
        return tconcesionario;
    }

    public void setTconcesionario(TextField tf) {
        this.tconcesionario = tf;
    }

    private TextField tfechaPago = new TextField();

    public TextField getTfechaPago() {
        return tfechaPago;
    }

    public void setTfechaPago(TextField tf) {
        this.tfechaPago = tf;
    }

    private TextField tbanco = new TextField();

    public TextField getTbanco() {
        return tbanco;
    }

    public void setTbanco(TextField tf) {
        this.tbanco = tf;
    }

    private Label label8 = new Label();

    public Label getLabel8() {
        return label8;
    }

    public void setLabel8(Label l) {
        this.label8 = l;
    }

    private TextField tidAcuerdo = new TextField();

    public TextField getTidAcuerdo() {
        return tidAcuerdo;
    }

    public void setTidAcuerdo(TextField tf) {
        this.tidAcuerdo = tf;
    }

    private Label label9 = new Label();

    public Label getLabel9() {
        return label9;
    }

    public void setLabel9(Label l) {
        this.label9 = l;
    }

    private Label label11 = new Label();

    public Label getLabel11() {
        return label11;
    }

    public void setLabel11(Label l) {
        this.label11 = l;
    }

    private Label label12 = new Label();

    public Label getLabel12() {
        return label12;
    }

    public void setLabel12(Label l) {
        this.label12 = l;
    }

    private Label label13 = new Label();

    public Label getLabel13() {
        return label13;
    }

    public void setLabel13(Label l) {
        this.label13 = l;
    }

    private TextField tvsimitAntes = new TextField();

    public TextField getTvsimitAntes() {
        return tvsimitAntes;
    }

    public void setTvsimitAntes(TextField tf) {
        this.tvsimitAntes = tf;
    }

    private TextField tvPolcaAntes = new TextField();

    public TextField getTvPolcaAntes() {
        return tvPolcaAntes;
    }

    public void setTvPolcaAntes(TextField tf) {
        this.tvPolcaAntes = tf;
    }

    private TextField tvsimitDespues = new TextField();

    public TextField getTvsimitDespues() {
        return tvsimitDespues;
    }

    public void setTvsimitDespues(TextField tf) {
        this.tvsimitDespues = tf;
    }

    private TextField tvPolcaDespues = new TextField();

    public TextField getTvPolcaDespues() {
        return tvPolcaDespues;
    }

    public void setTvPolcaDespues(TextField tf) {
        this.tvPolcaDespues = tf;
    }

    private Label label14 = new Label();

    public Label getLabel14() {
        return label14;
    }

    public void setLabel14(Label l) {
        this.label14 = l;
    }

    private TextField tvReintegrar = new TextField();

    public TextField getTvReintegrar() {
        return tvReintegrar;
    }

    public void setTvReintegrar(TextField tf) {
        this.tvReintegrar = tf;
    }

    private Label label15 = new Label();

    public Label getLabel15() {
        return label15;
    }

    public void setLabel15(Label l) {
        this.label15 = l;
    }

    private Label label16 = new Label();

    public Label getLabel16() {
        return label16;
    }

    public void setLabel16(Label l) {
        this.label16 = l;
    }

    private Calendar cvigInicial = new Calendar();

    public Calendar getCvigInicial() {
        return cvigInicial;
    }

    public void setCvigInicial(Calendar c) {
        this.cvigInicial = c;
    }

    private Calendar cvigFinal = new Calendar();

    public Calendar getCvigFinal() {
        return cvigFinal;
    }

    public void setCvigFinal(Calendar c) {
        this.cvigFinal = c;
    }

    private DropDown destado = new DropDown();

    public DropDown getDestado() {
        return destado;
    }

    public void setDestado(DropDown dd) {
        this.destado = dd;
    }

    private Label label17 = new Label();

    public Label getLabel17() {
        return label17;
    }

    public void setLabel17(Label l) {
        this.label17 = l;
    }

    private CachedRowSetDataProvider vw_acuerdopagoestadoDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_acuerdopagoestadoDataProvider() {
        return vw_acuerdopagoestadoDataProvider;
    }

    public void setVw_acuerdopagoestadoDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_acuerdopagoestadoDataProvider = crsdp;
    }

    private Label label18 = new Label();

    public Label getLabel18() {
        return label18;
    }

    public void setLabel18(Label l) {
        this.label18 = l;
    }

    private TextArea tobservaciones = new TextArea();

    public TextArea getTobservaciones() {
        return tobservaciones;
    }

    public void setTobservaciones(TextArea ta) {
        this.tobservaciones = ta;
    }

    private Label label19 = new Label();

    public Label getLabel19() {
        return label19;
    }

    public void setLabel19(Label l) {
        this.label19 = l;
    }

    private DropDown dporcentaje = new DropDown();

    public DropDown getDporcentaje() {
        return dporcentaje;
    }

    public void setDporcentaje(DropDown dd) {
        this.dporcentaje = dd;
    }

    private SingleSelectOptionsList dporcentajeDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDporcentajeDefaultOptions() {
        return dporcentajeDefaultOptions;
    }

    public void setDporcentajeDefaultOptions(SingleSelectOptionsList ssol) {
        this.dporcentajeDefaultOptions = ssol;
    }

    private Button bactualizar = new Button();

    public Button getBactualizar() {
        return bactualizar;
    }

    public void setBactualizar(Button b) {
        this.bactualizar = b;
    }

    private Button bbuscar = new Button();

    public Button getBbuscar() {
        return bbuscar;
    }

    public void setBbuscar(Button b) {
        this.bbuscar = b;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public IdentificarAcuerdo() {
    }
    
    /**
     * <p>Callback method that is called whenever a page is navigated to,
     * either directly via a URL, or indirectly via page navigation.
     * Customize this method to acquire resources that will be needed
     * for event handlers and lifecycle methods, whether or not this
     * page is performing post back processing.</p>
     *
     * <p>Note that, if the current request is a postback, the property
     * values of the components do <strong>not</strong> represent any
     * values submitted with this request.  Instead, they represent the
     * property values that were saved for this view when it was rendered.</p>
     */
    public void init() {
        // Perform initializations inherited from our superclass
        super.init();
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Reports Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
            
            // </editor-fold>
            // Perform application initialization that must complete
            // *after* managed components are initialized
            // TODO - add your own initialization code here
        try {
            getSessionBean1().getVw_acuerdopago_consultaRowSet().setObject( 1, "" ); 
           
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        
    }
    
    /**
     * <p>Callback method that is called after the component tree has been
     * restored, but before any event processing takes place.  This method
     * will <strong>only</strong> be called on a postback request that
     * is processing a form submit.  Customize this method to allocate
     * resources that will be required in your event handlers.</p>
     */
    public void preprocess() {
    }
    
    /**
     * <p>Callback method that is called just before rendering takes place.
     * This method will <strong>only</strong> be called for the page that
     * will actually be rendered (and not, for example, on a page that
     * handled a postback and then navigated to a different page).  Customize
     * this method to allocate resources that will be required for rendering
     * this page.</p>
     */
    public void prerender() {
    }
    
    /**
     * <p>Callback method that is called after rendering is completed for
     * this request, if <code>init()</code> was called (regardless of whether
     * or not this was the page that was actually rendered).  Customize this
     * method to release resources acquired in the <code>init()</code>,
     * <code>preprocess()</code>, or <code>prerender()</code> methods (or
     * acquired during execution of an event handler).</p>
     */
    public void destroy() {
        vw_acuerdopagoperiodoDataProvider.close();
        vw_acuerdopago_consultaDataProvider.close();
        vw_acuerdopagoestadoDataProvider.close();
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
    }
    
    /**
     *
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }
   
   
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected SessionBean1 getSessionBean1() {
        return (SessionBean1)getBean("SessionBean1");
    }
    
 
    public void ddPeriodo_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
         bbuscar_action();
    }

    public String beditar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
         try {
             
            this.tidAcuerdo.setText(this.stIdAcuerdo.getValue().toString());
            this.tmunicipio.setText(this.stmunicipio.getValue().toString());
            this.tmunicipio.setText(this.stestado.getValue().toString());
            
            this.tconcesionario.setText(this.stconcesionario.getValue().toString());
            this.tvalor.setText(this.stvalor.getValue().toString());
            this.tfechaPago.setText(this.stfechapago.getValue().toString());
            this.tcuenta.setText(this.stcuenta.getValue().toString());
            this.tbanco.setText(this.stbanco.getValue().toString());
            this.tvsimitAntes.setText(this.stvsimitantes.getValue().toString());
            this.tvsimitDespues.setText(this.stvsimitdespues.getValue().toString());
            this.tvPolcaAntes.setText(this.stvpolcaantes.getValue().toString());
            this.tvPolcaDespues.setText(this.stvpolcadespues.getValue().toString());
            this.dporcentaje.setValue(this.stporcentaje.getValue().toString());
            this.tvReintegrar.setText(this.stvreintegrar.getValue().toString());
            
            if ( this.stvigini.getValue() != null)
                this.cvigInicial.setValue(this.stvigini.getValue().toString());
            else
                this.cvigInicial.setValue(null);
            
            if (this.stvigfin.getValue() != null)
                this.cvigFinal.setValue(this.stvigfin.getValue().toString());
            else
                this.cvigFinal.setValue(null);
            
            this.destado.setValue(this.stidestadoAc.getValue().toString());
            
            if (this.stobservacion.getValue() != null)
                this.tobservaciones.setText(this.stobservacion.getValue().toString());
            else
                this.tobservaciones.setText("");
            
         } catch (Exception e) {
            info( e.getMessage() );
        }
       
        return null;
    }

    public String bactualizar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
         try {

              //Fecha Activacion
            if (this.cvigInicial.getSelectedDate() == null)
                throw new Exception("Seleccione fecha de vigencia inicial");
            
            if (this.cvigFinal.getSelectedDate() == null)
                throw new Exception("Seleccione fecha de vigencia final");

            java.util.Date fIni = this.cvigInicial.getSelectedDate();
            java.util.Date fFin= this.cvigFinal.getSelectedDate();
              
            double vlrSimitAntes = 0;
            double vlrSimitDespues = 0;
            double vlrPolcaAntes = 0;
            double vlrPolcaDespues = 0;
            double vlrReintegrar = 0;
            double vlrTotal = 0;
            
            try {
                vlrTotal = Double.parseDouble( (String)this.tvalor.getText() );
                vlrSimitAntes = Double.parseDouble( (String)this.tvsimitAntes.getText() );
                vlrSimitDespues = Double.parseDouble( (String)this.tvsimitDespues.getText() );
                vlrPolcaAntes = Double.parseDouble( (String)this.tvPolcaAntes.getText() );
                vlrPolcaDespues = Double.parseDouble( (String)this.tvPolcaDespues.getText() );
                vlrReintegrar = Double.parseDouble( (String)this.tvReintegrar.getText() );
                
                
            } catch (NumberFormatException Err) {
                throw new Exception("Valor errado");
            }
            
            
            Connection con = null;
            ResultSet rs = null;
            CallableStatement cs = null;

            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.actAcuerdo);
            
            // Cargamos los parametros de entrada IN
            
            cs.setString("p_usuario", getSessionBean1().getUser());
            cs.setBigDecimal("p_idAcuerdo", new BigDecimal(this.tidAcuerdo.getText().toString()));
            cs.setDouble("p_vlrSimitAntes",Double.parseDouble( (String)this.tvsimitAntes.getText() ) );
            cs.setDouble("p_vlrSimitDespues",Double.parseDouble( (String)this.tvsimitDespues.getText() ) );
            cs.setDouble("p_vlrPolcaAntes",Double.parseDouble( (String)this.tvPolcaAntes.getText() ) );
            cs.setDouble("p_vlrPolcaDespues",Double.parseDouble( (String)this.tvPolcaDespues.getText() ) );
            cs.setDouble("p_vlrReintegro",Double.parseDouble( (String)this.tvReintegrar.getText() ) );
            cs.setInt("p_porcentajePolca", Integer.parseInt( dporcentaje.getSelected().toString()));
            
            java.sql.Date fecIni = new java.sql.Date(this.cvigInicial.getSelectedDate().getTime());
            cs.setDate("p_vigIni", fecIni);
            
            java.sql.Date fecFin = new java.sql.Date(this.cvigFinal.getSelectedDate().getTime());
            cs.setDate("p_vigFin", fecFin);

            cs.setString("p_estado", this.destado.getValue().toString());
            
            if (this.tobservaciones.getText() != null)
                cs.setString("p_observaciones",this.tobservaciones.getText().toString());
            else
                cs.setString("p_observaciones","");
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_codError", java.sql.Types.NUMERIC);
            cs.registerOutParameter("p_msgError", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            String resultado = cs.getString("p_msgError");
            info(resultado);
            
            if (cs.getInt("p_codError")!= 0)
                return null;

            bbuscar_action();
            
        } catch (Exception e) {
            info( e.getMessage() );
        }
        
        return null;
    }

    public String bbuscar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            getSessionBean1().getVw_acuerdopago_consultaRowSet().setObject( 1, (String)ddPeriodo.getSelected() );
            
            this.vw_acuerdopago_consultaDataProvider.refresh();
            this.vw_acuerdopagoperiodoDataProvider.refresh();
            this.vw_acuerdopagoestadoDataProvider.refresh();
            
        } catch (Exception e) {
            info( e.getMessage() );
        }
        return null;
    }

    
    
    
    
}

