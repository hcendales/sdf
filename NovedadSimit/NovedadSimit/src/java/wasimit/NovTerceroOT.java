/*
 * Terceros.java
 *
 * Created on November 8, 2007, 10:57 AM
 * Copyright cristina
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.Calendar;
import com.sun.rave.web.ui.component.DropDown;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import javax.faces.FacesException;
import javax.faces.event.ValueChangeEvent;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import oracle.jdbc.OracleTypes;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class NovTerceroOT extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    
    private String Director_Ejecutivo;
    private String Director_Nacional;
    private String Contador_General;
    private String Coordinador_Financiero;
    
    private void _init() throws Exception {
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        fcmDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.fcmRowSet}"));
        
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddIndBaseDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99", "Seleccione"), new com.sun.rave.web.ui.model.Option("1", "1: Valor Municipio al 100%"), new com.sun.rave.web.ui.model.Option("2", "2: Valor Adicional"), new com.sun.rave.web.ui.model.Option("3", "3: Valor Recaudo sin adicional"), new com.sun.rave.web.ui.model.Option("4", "4: Valor Neto Municipio")});
        ddJurisdiccionDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99", "Seleccione"), new com.sun.rave.web.ui.model.Option("SIMIT", "SIMIT"), new com.sun.rave.web.ui.model.Option("POLCA", "POLCA")});
        ddMetodoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99", "Seleccione"), new com.sun.rave.web.ui.model.Option("1", "PORCENTAJE"), new com.sun.rave.web.ui.model.Option("2", "VALOR FIJO")});
        ddMedioDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99", "Seleccione"), new com.sun.rave.web.ui.model.Option("T", "OTRO MEDIO IMPOSICION"), new com.sun.rave.web.ui.model.Option("F", "FOTODETECCION")});
        vw_tercero_otDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_tercero_otRowSet}"));
        
        Director_Ejecutivo = fcmDataProvider.getValue("DIRECTOR_EJECUTIVO").toString();
        Director_Nacional = fcmDataProvider.getValue("DIRECTOR_NACIONAL").toString();
        Contador_General = fcmDataProvider.getValue("CONTADOR_GENERAL").toString();
        Coordinador_Financiero = fcmDataProvider.getValue("COORDINADOR_FINANCIERO").toString();
        ddFirma1DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"),
        new com.sun.rave.web.ui.model.Option(Director_Ejecutivo, Director_Ejecutivo), new com.sun.rave.web.ui.model.Option(Director_Nacional, Director_Nacional),
        new com.sun.rave.web.ui.model.Option(Contador_General, Contador_General),new com.sun.rave.web.ui.model.Option(Coordinador_Financiero, Coordinador_Financiero)});
        ddFirma2DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"),
        new com.sun.rave.web.ui.model.Option(Director_Ejecutivo, Director_Ejecutivo), new com.sun.rave.web.ui.model.Option(Director_Nacional, Director_Nacional),
        new com.sun.rave.web.ui.model.Option(Contador_General, Contador_General),new com.sun.rave.web.ui.model.Option(Coordinador_Financiero, Coordinador_Financiero)});
        
        
    }
    
    private CachedRowSetDataProvider fcmDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getFcmDataProvider() {
        return fcmDataProvider;
    }
    
    public void setFcmDataProvider(CachedRowSetDataProvider crsdp) {
        this.fcmDataProvider = crsdp;
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
    
    private DropDown ddMunicipio = new DropDown();
    
    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }
    
    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }
    
    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
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
    
    private TextField tfNitTercero = new TextField();
    
    public TextField getTfNitTercero() {
        return tfNitTercero;
    }
    
    public void setTfNitTercero(TextField tf) {
        this.tfNitTercero = tf;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private TextField tfNombre = new TextField();
    
    public TextField getTfNombre() {
        return tfNombre;
    }
    
    public void setTfNombre(TextField tf) {
        this.tfNombre = tf;
    }
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
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
    
    private DropDown ddBanco = new DropDown();
    
    public DropDown getDdBanco() {
        return ddBanco;
    }
    
    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private DropDown ddTipo = new DropDown();
    
    public DropDown getDdTipo() {
        return ddTipo;
    }
    
    public void setDdTipo(DropDown dd) {
        this.ddTipo = dd;
    }
    
    private SingleSelectOptionsList ddTipoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoDefaultOptions() {
        return ddTipoDefaultOptions;
    }
    
    public void setDdTipoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoDefaultOptions = ssol;
    }
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private TextField tfCuenta = new TextField();
    
    public TextField getTfCuenta() {
        return tfCuenta;
    }
    
    public void setTfCuenta(TextField tf) {
        this.tfCuenta = tf;
    }
    
    private DropDown ddIndBase = new DropDown();
    
    public DropDown getDdIndBase() {
        return ddIndBase;
    }
    
    public void setDdIndBase(DropDown dd) {
        this.ddIndBase = dd;
    }
    
    private SingleSelectOptionsList ddIndBaseDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdIndBaseDefaultOptions() {
        return ddIndBaseDefaultOptions;
    }
    
    public void setDdIndBaseDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddIndBaseDefaultOptions = ssol;
    }
    
    private Label label11 = new Label();
    
    public Label getLabel11() {
        return label11;
    }
    
    public void setLabel11(Label l) {
        this.label11 = l;
    }
    
    private Button btActualizar = new Button();
    
    public Button getBtActualizar() {
        return btActualizar;
    }
    
    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }
    
    private TextField tfcorreoTercero = new TextField();
    
    public TextField getTfcorreoTercero() {
        return tfcorreoTercero;
    }
    
    public void setTfcorreoTercero(TextField tf) {
        this.tfcorreoTercero = tf;
    }
    
    private Label label12 = new Label();
    
    public Label getLabel12() {
        return label12;
    }
    
    public void setLabel12(Label l) {
        this.label12 = l;
    }
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private DropDown ddJurisdiccion = new DropDown();
    
    public DropDown getDdJurisdiccion() {
        return ddJurisdiccion;
    }
    
    public void setDdJurisdiccion(DropDown dd) {
        this.ddJurisdiccion = dd;
    }
    
    private SingleSelectOptionsList ddJurisdiccionDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdJurisdiccionDefaultOptions() {
        return ddJurisdiccionDefaultOptions;
    }
    
    public void setDdJurisdiccionDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddJurisdiccionDefaultOptions = ssol;
    }
    
    private Label label9 = new Label();
    
    public Label getLabel9() {
        return label9;
    }
    
    public void setLabel9(Label l) {
        this.label9 = l;
    }
    
    private SingleSelectOptionsList ddMetodoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdMetodoDefaultOptions() {
        return ddMetodoDefaultOptions;
    }
    
    public void setDdMetodoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddMetodoDefaultOptions = ssol;
    }
    
    private Label label10 = new Label();
    
    public Label getLabel10() {
        return label10;
    }
    
    public void setLabel10(Label l) {
        this.label10 = l;
    }
    
    private DropDown ddMetodo = new DropDown();
    
    public DropDown getDdMetodo() {
        return ddMetodo;
    }
    
    public void setDdMetodo(DropDown dd) {
        this.ddMetodo = dd;
    }
    
    private Label label13 = new Label();
    
    public Label getLabel13() {
        return label13;
    }
    
    public void setLabel13(Label l) {
        this.label13 = l;
    }
    
    private TextField tfValorBase = new TextField();
    
    public TextField getTfValorBase() {
        return tfValorBase;
    }
    
    public void setTfValorBase(TextField tf) {
        this.tfValorBase = tf;
    }
    
    private Button btCancelar = new Button();
    
    public Button getBtCancelar() {
        return btCancelar;
    }
    
    public void setBtCancelar(Button b) {
        this.btCancelar = b;
    }
    
    private DropDown ddMedio = new DropDown();
    
    public DropDown getDdMedio() {
        return ddMedio;
    }
    
    public void setDdMedio(DropDown dd) {
        this.ddMedio = dd;
    }
    
    private SingleSelectOptionsList ddMedioDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdMedioDefaultOptions() {
        return ddMedioDefaultOptions;
    }
    
    public void setDdMedioDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddMedioDefaultOptions = ssol;
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
    
    private CachedRowSetDataProvider vw_tercero_otDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_tercero_otDataProvider() {
        return vw_tercero_otDataProvider;
    }
    
    public void setVw_tercero_otDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_tercero_otDataProvider = crsdp;
    }
    
    private TableColumn tableColumn3 = new TableColumn();
    
    public TableColumn getTableColumn3() {
        return tableColumn3;
    }
    
    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }
    
    private StaticText stNitt = new StaticText();
    
    public StaticText getStNitt() {
        return stNitt;
    }
    
    public void setStNitt(StaticText st) {
        this.stNitt = st;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
    private StaticText stnombre = new StaticText();
    
    public StaticText getStnombre() {
        return stnombre;
    }
    
    public void setStnombre(StaticText st) {
        this.stnombre = st;
    }
    
    private TableColumn tableColumn5 = new TableColumn();
    
    public TableColumn getTableColumn5() {
        return tableColumn5;
    }
    
    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }
    
    private StaticText stcorreo = new StaticText();
    
    public StaticText getStcorreo() {
        return stcorreo;
    }
    
    public void setStcorreo(StaticText st) {
        this.stcorreo = st;
    }
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private StaticText stNombanco = new StaticText();
    
    public StaticText getStNombanco() {
        return stNombanco;
    }
    
    public void setStNombanco(StaticText st) {
        this.stNombanco = st;
    }
    
    private TableColumn tableColumn8 = new TableColumn();
    
    public TableColumn getTableColumn8() {
        return tableColumn8;
    }
    
    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }
    
    private StaticText sttipocuenta = new StaticText();
    
    public StaticText getSttipocuenta() {
        return sttipocuenta;
    }
    
    public void setSttipocuenta(StaticText st) {
        this.sttipocuenta = st;
    }
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private StaticText stcuenta = new StaticText();
    
    public StaticText getStcuenta() {
        return stcuenta;
    }
    
    public void setStcuenta(StaticText st) {
        this.stcuenta = st;
    }
    
    private TableColumn tableColumn10 = new TableColumn();
    
    public TableColumn getTableColumn10() {
        return tableColumn10;
    }
    
    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }
    
    private StaticText stjurisdiccion = new StaticText();
    
    public StaticText getStjurisdiccion() {
        return stjurisdiccion;
    }
    
    public void setStjurisdiccion(StaticText st) {
        this.stjurisdiccion = st;
    }
    
    private TableColumn tableColumn11 = new TableColumn();
    
    public TableColumn getTableColumn11() {
        return tableColumn11;
    }
    
    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }
    
    private StaticText stmedioimposicion = new StaticText();
    
    public StaticText getStmedioimposicion() {
        return stmedioimposicion;
    }
    
    public void setStmedioimposicion(StaticText st) {
        this.stmedioimposicion = st;
    }
    
    private TableColumn tableColumn12 = new TableColumn();
    
    public TableColumn getTableColumn12() {
        return tableColumn12;
    }
    
    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }
    
    private StaticText stbaseliquidacion = new StaticText();
    
    public StaticText getStbaseliquidacion() {
        return stbaseliquidacion;
    }
    
    public void setStbaseliquidacion(StaticText st) {
        this.stbaseliquidacion = st;
    }
    
    private TableColumn tableColumn13 = new TableColumn();
    
    public TableColumn getTableColumn13() {
        return tableColumn13;
    }
    
    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }
    
    private StaticText stmetodobase = new StaticText();
    
    public StaticText getStmetodobase() {
        return stmetodobase;
    }
    
    public void setStmetodobase(StaticText st) {
        this.stmetodobase = st;
    }
    
    private TableColumn tableColumn14 = new TableColumn();
    
    public TableColumn getTableColumn14() {
        return tableColumn14;
    }
    
    public void setTableColumn14(TableColumn tc) {
        this.tableColumn14 = tc;
    }
    
    private StaticText stvalorbase = new StaticText();
    
    public StaticText getStvalorbase() {
        return stvalorbase;
    }
    
    public void setStvalorbase(StaticText st) {
        this.stvalorbase = st;
    }
    
    private TableColumn tableColumn15 = new TableColumn();
    
    public TableColumn getTableColumn15() {
        return tableColumn15;
    }
    
    public void setTableColumn15(TableColumn tc) {
        this.tableColumn15 = tc;
    }
    
    private StaticText stnumtercero = new StaticText();
    
    public StaticText getStnumtercero() {
        return stnumtercero;
    }
    
    public void setStnumtercero(StaticText st) {
        this.stnumtercero = st;
    }
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private Button beditar = new Button();
    
    public Button getBeditar() {
        return beditar;
    }
    
    public void setBeditar(Button b) {
        this.beditar = b;
    }
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private Button bborrar = new Button();
    
    public Button getBborrar() {
        return bborrar;
    }
    
    public void setBborrar(Button b) {
        this.bborrar = b;
    }
    
    private TextField tfnumTercero = new TextField();
    
    public TextField getTfnumTercero() {
        return tfnumTercero;
    }
    
    public void setTfnumTercero(TextField tf) {
        this.tfnumTercero = tf;
    }
    
    private Label label14 = new Label();
    
    public Label getLabel14() {
        return label14;
    }
    
    public void setLabel14(Label l) {
        this.label14 = l;
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
    
    private Calendar clActivacion = new Calendar();
    
    public Calendar getClActivacion() {
        return clActivacion;
    }
    
    public void setClActivacion(Calendar c) {
        this.clActivacion = c;
    }
    
    private TextField tfDnsDavivienda = new TextField();
    
    public TextField getTfDnsDavivienda() {
        return tfDnsDavivienda;
    }
    
    public void setTfDnsDavivienda(TextField tf) {
        this.tfDnsDavivienda = tf;
    }
    
    private DropDown ddFirma1 = new DropDown();
    
    public DropDown getDdFirma1() {
        return ddFirma1;
    }
    
    public void setDdFirma1(DropDown dd) {
        this.ddFirma1 = dd;
    }
    
    private TextField tfDnsAvvillas = new TextField();
    
    public TextField getTfDnsAvvillas() {
        return tfDnsAvvillas;
    }
    
    public void setTfDnsAvvillas(TextField tf) {
        this.tfDnsAvvillas = tf;
    }
    
    private DropDown ddFirma2 = new DropDown();
    
    public DropDown getDdFirma2() {
        return ddFirma2;
    }
    
    public void setDdFirma2(DropDown dd) {
        this.ddFirma2 = dd;
    }
    
    private Label label17 = new Label();
    
    public Label getLabel17() {
        return label17;
    }
    
    public void setLabel17(Label l) {
        this.label17 = l;
    }
    
    private Label label18 = new Label();
    
    public Label getLabel18() {
        return label18;
    }
    
    public void setLabel18(Label l) {
        this.label18 = l;
    }
    
    private SingleSelectOptionsList ddFirma1DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFirma1DefaultOptions() {
        return ddFirma1DefaultOptions;
    }
    
    public void setDdFirma1DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFirma1DefaultOptions = ssol;
    }
    
    private SingleSelectOptionsList ddFirma2DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFirma2DefaultOptions() {
        return ddFirma2DefaultOptions;
    }
    
    public void setDdFirma2DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFirma2DefaultOptions = ssol;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public NovTerceroOT() {
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
            log("Terceros Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
        
        // </editor-fold>
        // Perform application initialization that must complete
        // *after* managed components are initialized
        // TODO - add your own initialization code here
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
        
        if ( this.ddMunicipio.getSelected() == null ) {
            try {
                this.municipioDataProvider.cursorFirst();
                
                getSessionBean1().getVw_tercero_otRowSet().setObject(
                        1, this.municipioDataProvider.getValue("IDMUNICIPIO") );
                this.vw_tercero_otDataProvider.refresh();
            } catch (Exception e) {
                info(e.getMessage());
            }
        }
        
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
        municipioDataProvider.close();
        bancoDataProvider.close();
        vw_tercero_otDataProvider.close();
        fcmDataProvider.close();
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected SessionBean1 getSessionBean1() {
        return (SessionBean1)getBean("SessionBean1");
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }
    
    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        try {
            getSessionBean1().getVw_tercero_otRowSet().setObject(
                    1,(String) this.ddMunicipio.getSelected());
            this.vw_tercero_otDataProvider.refresh();
        } catch (Exception e) {
            info(e.getMessage());
        }
    }
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    
    
    public String btActualizar_action() {
        try {
            
            //Municipio
            if(ddMunicipio.getValue().toString().compareTo("00000000") == 0) {
                throw new Exception("Seleccione el Municipio");
            }
            
            
            if ( tfNitTercero.getText() == null )
                throw new Exception("Nit Municipio requerido");
            
            if ( ((String)tfNitTercero.getText()).length() == 0 )
                throw new Exception("Nit Tercero requerido");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitTercero.getText());
                if (vlr < 1000000000 )
                    throw new Exception("Nit tercero incompleto");
            } catch (NumberFormatException Err) {
                throw new Exception("Nit Tercero debe ser numerico");
            }
            
            
            if ( tfNombre.getText() == null )
                throw new Exception("Nombre requerido");
            
            if ( ((String)tfNombre.getText()).length() == 0 )
                throw new Exception("Nombre requerido");
            
            if ( this.tfcorreoTercero.getText() == null )
                throw new Exception("Correo Tercero requerido");
            
            if ( ((String)tfcorreoTercero.getText()).length() == 0 )
                throw new Exception("Correo Tercero requerido");
            
            if (tfcorreoTercero.getText() != null)
                if (tfcorreoTercero.getText().toString().length() > 0 )
                    if(!validacionMail(tfcorreoTercero.getText().toString()) )
                        throw new Exception("Formato de correo electronico errado");
            
            if(ddJurisdiccion.getValue().toString().compareTo("99") == 0) {
                throw new Exception("Seleccione la jurisdiccion");
            }
            
            if(ddMedio.getValue().toString().compareTo("99") == 0) {
                throw new Exception("Seleccione medio de imposicion");
            }
            
            if(ddIndBase.getValue().toString().compareTo("99") == 0) {
                throw new Exception("Seleccione el base de liquidacion");
            }
            
            if(ddMetodo.getValue().toString().compareTo("99") == 0) {
                throw new Exception("Seleccione meto de liquidacion");
            }
            
            
            
            if(tfValorBase.getValue()==null) {
                throw new Exception("Ingrese valor base");
            }
            if(tfValorBase.getValue().toString().length() == 0) {
                throw new Exception("Ingrese valor base");
            }
            
            
            try {
                float vlr = Float.parseFloat((String)this.tfValorBase.getText());
                if (vlr < 0 )
                    throw new Exception("Valor base debe ser > 0");
            } catch (NumberFormatException Err) {
                throw new Exception("Valor base errado");
            }
            
            if(ddBanco.getValue().toString().compareTo("00") == 0) {
                throw new Exception("Seleccione Banco");
            }
            
            if(ddTipo.getValue().toString().compareTo("99") == 0) {
                throw new Exception("Seleccione tipo cuenta");
            }
            
            if ( tfCuenta.getText() == null )
                throw new Exception("Cuenta requerida");
            
            if ( ((String)tfCuenta.getText()).length() == 0 )
                throw new Exception("Cuenta requerida");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuenta.getText());
                if (vlr < 1 )
                    throw new Exception("Cuenta Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta debe ser numerica");
            }
            
            //Firmas
            if(this.ddFirma1.getValue().toString().compareTo("0") == 0)
                throw new Exception("Seleccione Firma1");
            if(this.ddFirma2.getValue().toString().compareTo("0") == 0)
                throw new Exception("Seleccione Firma2");
            if(this.ddFirma1.getValue().toString().compareTo(ddFirma2.getValue().toString()) == 0 )
                throw new Exception("Firma1 y Firma2 deben ser diferentes");
            
            
            //Fecha Activacion
            if (this.clActivacion.getSelectedDate() == null)
                throw new Exception("Seleccione Fecha Activación");
            
            java.util.Calendar fecha_hoy = java.util.Calendar.getInstance();
            if (this.clActivacion.getSelectedDate().compareTo(fecha_hoy.getTime()) < 0 )
                throw new Exception("Fecha Activación inválida");
            
            
            con = Constants.getJdbcDataSource().getConnection();
            
            cs = con.prepareCall(Constants.U_TercerOT);
            
            cs.setString("p_usuario", getSessionBean1().getUser());
            cs.setString("p_idmunicipio", ddMunicipio.getValue().toString());
            cs.setString("p_nit_t", tfNitTercero.getValue().toString());
            cs.setString("p_jurisdiccion", ddJurisdiccion.getValue().toString());
            cs.setString("p_medioImposicion", ddMedio.getValue().toString());
            
            cs.setString("p_nombre", tfNombre.getValue().toString());
            cs.setString("p_correo", tfcorreoTercero.getValue().toString());
            cs.setString("p_idbanco", ddBanco.getValue().toString());
            cs.setString("p_tipocuenta", ddTipo.getValue().toString());
            cs.setString("p_cuenta", tfCuenta.getValue().toString());
            cs.setInt("p_baseLiquidacion", Integer.parseInt(ddIndBase.getValue().toString()));
            cs.setInt("p_metodoBase", Integer.parseInt(ddMetodo.getValue().toString()));
            cs.setDouble("p_valorBase", Double.parseDouble(tfValorBase.getValue().toString()) );
            
            if (this.btActualizar.getText().toString().equals("Actualizar"))
                cs.setString("p_numTercero", this.tfnumTercero.getValue().toString() );
            else
                cs.setString("p_numTercero", "0" );
            
            // Tipo Novedad
            if (btActualizar.getText().toString().equals("Adicionar"))
                cs.setString("p_tipoNovedad", "11");
            else if (btActualizar.getText().toString().equals("Actualizar"))
                cs.setString("p_tipoNovedad", "12");
            else
                cs.setString("p_tipoNovedad", "13");
            
            java.sql.Date fec = new java.sql.Date(this.clActivacion.getSelectedDate().getTime());
            cs.setDate("p_fechaAct", fec);
            
            // Firmas
            cs.setString("p_firma1", (String) this.ddFirma1.getSelected());
            cs.setString("P_firma2", (String) this.ddFirma2.getSelected());
            
            //dns
            cs.setString("p_dnsAvvillas", (String) this.tfDnsAvvillas.getText());
            cs.setString("p_dnsDavivienda", (String) this.tfDnsDavivienda.getText());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_codError", java.sql.Types.NUMERIC);
            cs.registerOutParameter("p_msgError", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            resultado = cs.getString("p_msgError");
            info(resultado);
            
            if (cs.getInt("p_codError")!= 0)
                return null;
            
            btCancelar_action();
            
            this.vw_tercero_otDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    
    public boolean validacionMail(String email) {
        
        //Set the email pattern string
        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
        
        //Match the given string with the pattern
        Matcher m = p.matcher(email);
        
        //check whether match is found
        return m.matches();
        
    }
    
    public String beditar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.Q_TercerOT);
            
            // Cargamos los parametros de entrada IN
            
            cs.setString("p_usuario", getSessionBean1().getUser());
            cs.setString("p_idmunicipio", ddMunicipio.getValue().toString());
            cs.setString("p_nit_t", this.stNitt.getValue().toString());
            cs.setString("p_jurisdiccion",this.stjurisdiccion.getValue().toString());
            
            if (this.stmedioimposicion.getValue().toString().startsWith("F"))
                cs.setString("p_medioImposicion", "F");
            else
                cs.setString("p_medioImposicion", "T");
            
            cs.setString("p_numTercero", this.stnumtercero.getValue().toString());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_nombre", java.sql.Types.CHAR);
            cs.registerOutParameter("p_correo", java.sql.Types.CHAR);
            cs.registerOutParameter("p_idbanco", java.sql.Types.CHAR);
            cs.registerOutParameter("p_tipocuenta", java.sql.Types.CHAR);
            cs.registerOutParameter("p_cuenta", java.sql.Types.CHAR);
            cs.registerOutParameter("p_baseLiquidacion", java.sql.Types.NUMERIC);
            cs.registerOutParameter("p_metodoBase", java.sql.Types.NUMERIC);
            cs.registerOutParameter("p_valorBase", java.sql.Types.NUMERIC);
            cs.registerOutParameter("p_codError", java.sql.Types.NUMERIC);
            cs.registerOutParameter("p_msgError", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            resultado = cs.getString("p_msgError");
            info(resultado);
            
            if (cs.getInt("p_codError")!= 0)
                return null;
            
            this.tfNitTercero.setText( this.stNitt.getValue().toString());
            this.tfNombre.setText(cs.getString("p_nombre"));
            this.tfcorreoTercero.setText(cs.getString("p_correo"));
            this.ddJurisdiccion.setValue(this.stjurisdiccion.getValue().toString());
            if (this.stmedioimposicion.getValue().toString().startsWith("F"))
                this.ddMedio.setValue("F");
            else
                this.ddMedio.setValue("T");
            
            this.ddIndBase.setValue("" + cs.getInt("p_baseLiquidacion"));
            this.ddMetodo.setValue("" + cs.getInt("p_metodoBase"));
            this.tfValorBase.setText( "" + cs.getDouble("p_valorBase") );
            
            this.ddBanco.setValue(cs.getString("p_idbanco"));
            this.ddTipo.setValue(cs.getString("p_tipocuenta"));
            this.tfCuenta.setText(cs.getString("p_cuenta"));
            this.tfnumTercero.setText(this.stnumtercero.getValue().toString());
            
            this.btActualizar.setText("Actualizar");
            
            this.ddMunicipio.setDisabled(true);
            this.tfNitTercero.setDisabled(true);
            this.ddJurisdiccion.setDisabled(true);
            this.ddMedio.setDisabled(true);
            
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return "";
        
    }
    
    public String btCancelar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        tfNitTercero.setText("");
        tfNombre.setText("");
        tfcorreoTercero.setText("");
        tfValorBase.setText("");
        tfCuenta.setText("");
        tfnumTercero.setText("");
        this.btActualizar.setText("Adicionar");
        
        this.ddJurisdiccion.setValue("99");
        this.ddMedio.setValue("99");
        this.ddIndBase.setValue("99");
        this.ddMetodo.setValue("99");
        this.ddBanco.setValue("00");
        this.ddTipo.setValue("99");
        
        this.ddMunicipio.setDisabled(false);
        this.tfNitTercero.setDisabled(false);
        this.ddJurisdiccion.setDisabled(false);
        this.ddMedio.setDisabled(false);
        
        ddFirma1.setValue(null);
        ddFirma2.setValue(null);
        clActivacion.setValue(null);
        
        tfDnsAvvillas.setText("");
        tfDnsDavivienda.setText("");
        
        return null;
    }
    
    
    public String bborrar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            beditar_action();            
            this.btActualizar.setText("Eliminar");
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return null;
    }
    
}

