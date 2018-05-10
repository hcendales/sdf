/*
 * LiquidarExterno.java
 *
 * Created on November 21, 2007, 8:36 AM
 * Copyright cristina
 */
package wasimit;

import com.sun.data.provider.RowKey;
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
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.RadioButtonGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;
import javax.faces.FacesException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.context.ExternalContext;
import javax.faces.convert.BigDecimalConverter;
import javax.faces.event.ValueChangeEvent;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.swing.text.html.Option;
import oracle.jdbc.OracleTypes;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class IdentificacionConces extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        trxsinidentificarDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.trxsinidentificarRowSet}"));
        vw_periodotrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_periodotrfRowSet}"));
        vw_cuentatrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_cuentatrfRowSet}"));
        vw_municipiotrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_municipiotrfRowSet}"));
        ddEstadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("SI", "Sin Identificar")});
        vw_valortrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_valortrfRowSet}"));
        vw_concesionariotrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_concesionariotrfRowSet}"));
        vw_indtipoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_indtipoRowSet}"));
        vw_pconsigandoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_pconsigandoRowSet}"));
        ddConDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {});
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        dropDown5DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("PDF", "PDF"), new com.sun.rave.web.ui.model.Option("CSV", "Excel")});
        dropDown5DefaultOptions.setSelectedValue("PDF");
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
    
    private Button btReporte = new Button();
    
    public Button getBtReporte() {
        return btReporte;
    }
    
    public void setBtReporte(Button b) {
        this.btReporte = b;
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
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
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
    
    private CachedRowSetDataProvider trxsinidentificarDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getTrxsinidentificarDataProvider() {
        return trxsinidentificarDataProvider;
    }
    
    public void setTrxsinidentificarDataProvider(CachedRowSetDataProvider crsdp) {
        this.trxsinidentificarDataProvider = crsdp;
    }
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private CachedRowSetDataProvider vw_periodotrfDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_periodotrfDataProvider() {
        return vw_periodotrfDataProvider;
    }
    
    public void setVw_periodotrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_periodotrfDataProvider = crsdp;
    }
    
    private DropDown ddPeriodo = new DropDown();
    
    public DropDown getDdPeriodo() {
        return ddPeriodo;
    }
    
    public void setDdPeriodo(DropDown dd) {
        this.ddPeriodo = dd;
    }
    
    private CachedRowSetDataProvider vw_cuentatrfDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_cuentatrfDataProvider() {
        return vw_cuentatrfDataProvider;
    }
    
    public void setVw_cuentatrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_cuentatrfDataProvider = crsdp;
    }
    
    private DropDown ddCuenta = new DropDown();
    
    public DropDown getDdCuenta() {
        return ddCuenta;
    }
    
    public void setDdCuenta(DropDown dd) {
        this.ddCuenta = dd;
    }
    
    private CachedRowSetDataProvider vw_municipiotrfDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_municipiotrfDataProvider() {
        return vw_municipiotrfDataProvider;
    }
    
    public void setVw_municipiotrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_municipiotrfDataProvider = crsdp;
    }
    
    private DropDown ddMunicipio = new DropDown();
    
    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }
    
    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }
    
    private DropDown ddEstado = new DropDown();
    
    public DropDown getDdEstado() {
        return ddEstado;
    }
    
    public void setDdEstado(DropDown dd) {
        this.ddEstado = dd;
    }
    
    private SingleSelectOptionsList ddEstadoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdEstadoDefaultOptions() {
        return ddEstadoDefaultOptions;
    }
    
    public void setDdEstadoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddEstadoDefaultOptions = ssol;
    }
    
    private CachedRowSetDataProvider vw_valortrfDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_valortrfDataProvider() {
        return vw_valortrfDataProvider;
    }
    
    public void setVw_valortrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_valortrfDataProvider = crsdp;
    }
    
    private DropDown ddValor = new DropDown();
    
    public DropDown getDdValor() {
        return ddValor;
    }
    
    public void setDdValor(DropDown dd) {
        this.ddValor = dd;
    }
    
    private BigDecimalConverter ddValorConverter = new BigDecimalConverter();
    
    public BigDecimalConverter getDdValorConverter() {
        return ddValorConverter;
    }
    
    public void setDdValorConverter(BigDecimalConverter bdc) {
        this.ddValorConverter = bdc;
    }
    
    private CachedRowSetDataProvider vw_concesionariotrfDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_concesionariotrfDataProvider() {
        return vw_concesionariotrfDataProvider;
    }
    
    public void setVw_concesionariotrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_concesionariotrfDataProvider = crsdp;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    private Button bsalvar = new Button();
    
    public Button getBsalvar() {
        return bsalvar;
    }
    
    public void setBsalvar(Button b) {
        this.bsalvar = b;
    }
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private StaticText staticText1 = new StaticText();
    
    public StaticText getStaticText1() {
        return staticText1;
    }
    
    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
    private TableColumn tableColumn5 = new TableColumn();
    
    public TableColumn getTableColumn5() {
        return tableColumn5;
    }
    
    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }
    
    private TableColumn tableColumn6 = new TableColumn();
    
    public TableColumn getTableColumn6() {
        return tableColumn6;
    }
    
    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }
    
    private StaticText staticText6 = new StaticText();
    
    public StaticText getStaticText6() {
        return staticText6;
    }
    
    public void setStaticText6(StaticText st) {
        this.staticText6 = st;
    }
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private TableColumn tableColumn8 = new TableColumn();
    
    public TableColumn getTableColumn8() {
        return tableColumn8;
    }
    
    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }
    
    private StaticText staticText8 = new StaticText();
    
    public StaticText getStaticText8() {
        return staticText8;
    }
    
    public void setStaticText8(StaticText st) {
        this.staticText8 = st;
    }
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private TableColumn tableColumn10 = new TableColumn();
    
    public TableColumn getTableColumn10() {
        return tableColumn10;
    }
    
    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }
    
    private StaticText staticText10 = new StaticText();
    
    public StaticText getStaticText10() {
        return staticText10;
    }
    
    public void setStaticText10(StaticText st) {
        this.staticText10 = st;
    }
    
    private TableColumn tableColumn11 = new TableColumn();
    
    public TableColumn getTableColumn11() {
        return tableColumn11;
    }
    
    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }
    
    private StaticText staticText11 = new StaticText();
    
    public StaticText getStaticText11() {
        return staticText11;
    }
    
    public void setStaticText11(StaticText st) {
        this.staticText11 = st;
    }
    
    private TableColumn tableColumn12 = new TableColumn();
    
    public TableColumn getTableColumn12() {
        return tableColumn12;
    }
    
    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }
    
    private StaticText staticText12 = new StaticText();
    
    public StaticText getStaticText12() {
        return staticText12;
    }
    
    public void setStaticText12(StaticText st) {
        this.staticText12 = st;
    }
    
    private TableColumn tableColumn13 = new TableColumn();
    
    public TableColumn getTableColumn13() {
        return tableColumn13;
    }
    
    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }
    
    private StaticText staticText13 = new StaticText();
    
    public StaticText getStaticText13() {
        return staticText13;
    }
    
    public void setStaticText13(StaticText st) {
        this.staticText13 = st;
    }
    
    private TableColumn tableColumn14 = new TableColumn();
    
    public TableColumn getTableColumn14() {
        return tableColumn14;
    }
    
    public void setTableColumn14(TableColumn tc) {
        this.tableColumn14 = tc;
    }
    
    private StaticText staticText14 = new StaticText();
    
    public StaticText getStaticText14() {
        return staticText14;
    }
    
    public void setStaticText14(StaticText st) {
        this.staticText14 = st;
    }
    
    private TableColumn tableColumn15 = new TableColumn();
    
    public TableColumn getTableColumn15() {
        return tableColumn15;
    }
    
    public void setTableColumn15(TableColumn tc) {
        this.tableColumn15 = tc;
    }
    
    private StaticText staticText15 = new StaticText();
    
    public StaticText getStaticText15() {
        return staticText15;
    }
    
    public void setStaticText15(StaticText st) {
        this.staticText15 = st;
    }
    
    private TableColumn tableColumn16 = new TableColumn();
    
    public TableColumn getTableColumn16() {
        return tableColumn16;
    }
    
    public void setTableColumn16(TableColumn tc) {
        this.tableColumn16 = tc;
    }
    
    private StaticText staticText16 = new StaticText();
    
    public StaticText getStaticText16() {
        return staticText16;
    }
    
    public void setStaticText16(StaticText st) {
        this.staticText16 = st;
    }
    
    private Checkbox checkbox1 = new Checkbox();
    
    public Checkbox getCheckbox1() {
        return checkbox1;
    }
    
    public void setCheckbox1(Checkbox c) {
        this.checkbox1 = c;
    }
    
    private DropDown dropDown2 = new DropDown();
    
    public DropDown getDropDown2() {
        return dropDown2;
    }
    
    public void setDropDown2(DropDown dd) {
        this.dropDown2 = dd;
    }
    
    private DropDown dropDown3 = new DropDown();
    
    public DropDown getDropDown3() {
        return dropDown3;
    }
    
    public void setDropDown3(DropDown dd) {
        this.dropDown3 = dd;
    }
    
    private TextField textField1 = new TextField();
    
    public TextField getTextField1() {
        return textField1;
    }
    
    public void setTextField1(TextField tf) {
        this.textField1 = tf;
    }
    
    private CachedRowSetDataProvider vw_indtipoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_indtipoDataProvider() {
        return vw_indtipoDataProvider;
    }
    
    public void setVw_indtipoDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_indtipoDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider vw_pconsigandoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_pconsigandoDataProvider() {
        return vw_pconsigandoDataProvider;
    }
    
    public void setVw_pconsigandoDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_pconsigandoDataProvider = crsdp;
    }
    
    private BigDecimalConverter dropDown3Converter = new BigDecimalConverter();
    
    public BigDecimalConverter getDropDown3Converter() {
        return dropDown3Converter;
    }
    
    public void setDropDown3Converter(BigDecimalConverter bdc) {
        this.dropDown3Converter = bdc;
    }
    
    private DropDown ddCon = new DropDown();
    
    public DropDown getDdCon() {
        return ddCon;
    }
    
    public void setDdCon(DropDown dd) {
        this.ddCon = dd;
    }
    
    private SingleSelectOptionsList ddConDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdConDefaultOptions() {
        return ddConDefaultOptions;
    }
    
    public void setDdConDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddConDefaultOptions = ssol;
    }
    
    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
    }
    
    private DropDown dropDown4 = new DropDown();
    
    public DropDown getDropDown4() {
        return dropDown4;
    }
    
    public void setDropDown4(DropDown dd) {
        this.dropDown4 = dd;
    }
    
    private TableColumn tableColumn17 = new TableColumn();
    
    public TableColumn getTableColumn17() {
        return tableColumn17;
    }
    
    public void setTableColumn17(TableColumn tc) {
        this.tableColumn17 = tc;
    }
    
    private DropDown dropDown1 = new DropDown();
    
    public DropDown getDropDown1() {
        return dropDown1;
    }
    
    public void setDropDown1(DropDown dd) {
        this.dropDown1 = dd;
    }
    
    private Button biniIdentificar = new Button();
    
    public Button getBiniIdentificar() {
        return biniIdentificar;
    }
    
    public void setBiniIdentificar(Button b) {
        this.biniIdentificar = b;
    }

    private DropDown dropDown5 = new DropDown();

    public DropDown getDropDown5() {
        return dropDown5;
    }

    public void setDropDown5(DropDown dd) {
        this.dropDown5 = dd;
    }

    private SingleSelectOptionsList dropDown5DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDropDown5DefaultOptions() {
        return dropDown5DefaultOptions;
    }

    public void setDropDown5DefaultOptions(SingleSelectOptionsList ssol) {
        this.dropDown5DefaultOptions = ssol;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public IdentificacionConces() {
    }
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    
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
            log("LiquidarExterno Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
        
        // </editor-fold>
        // Perform application initialization that must complete
        // *after* managed components are initialized
        // TODO - add your own initialization code here
        
        try {
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.q_concesFunc);
            
            cs.setString("p_usuario", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_idConcesionario", java.sql.Types.VARCHAR);
            cs.registerOutParameter("p_nomConcesionario", java.sql.Types.VARCHAR);
            cs.registerOutParameter("p_error", java.sql.Types.VARCHAR);
            
            // Ejecutamos
            cs.execute();
            
            String idConcesionario = cs.getString("p_idConcesionario");
            String nomConcesionario = cs.getString("p_nomConcesionario");
            
            if (idConcesionario.equals("01"))
                
                ddConDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[]
                {new com.sun.rave.web.ui.model.Option(cs.getString("p_idConcesionario"), cs.getString("p_nomConcesionario")),
                 new com.sun.rave.web.ui.model.Option("04", "SERVIT LTDA"),
                });
            
            else
                ddConDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option(cs.getString("p_idConcesionario"), cs.getString("p_nomConcesionario"))});
            
            if (this.isPostBack())
                return;
            
            getSessionBean1().getTrxsinidentificarRowSet().setObject(1,"999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(2,"999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(3,"999999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(4,"999999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(5,"TODOS");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(6,"TODOS");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(7,"SI");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(8,"SI");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(9,"0");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(10,"0");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(11,cs.getString("p_idConcesionario"));
            getSessionBean1().getTrxsinidentificarRowSet().setObject(12,cs.getString("p_idConcesionario"));
            
        } catch (Exception ex) {
            error(ex.getMessage());
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
        trxsinidentificarDataProvider.close();
        vw_periodotrfDataProvider.close();
        vw_cuentatrfDataProvider.close();
        vw_municipiotrfDataProvider.close();
        vw_valortrfDataProvider.close();
        vw_concesionariotrfDataProvider.close();
        vw_indtipoDataProvider.close();
        vw_pconsigandoDataProvider.close();
        municipioDataProvider.close();
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
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected SessionBean1 getSessionBean1() {
        return (SessionBean1)getBean("SessionBean1");
    }
    
   
    
    public String btReporte_action() {
        // TODO: Replace with your code
        
        try {
            
            Object conSel = ddCon.getSelected();
            RowKey rowKey = this.vw_concesionariotrfDataProvider.findFirst("idCon",conSel);
            String nomCon = vw_concesionariotrfDataProvider.getValue(vw_concesionariotrfDataProvider.getFieldKey("nombre" ),rowKey).toString();
         
            Object ctaSel = ddCuenta.getSelected();
            rowKey = this.vw_cuentatrfDataProvider.findFirst("CTA",ctaSel);
            String nomCta = vw_cuentatrfDataProvider.getValue(vw_cuentatrfDataProvider.getFieldKey("nombre" ),rowKey).toString();
         
            Object munSel = ddMunicipio.getSelected();
            rowKey = this.vw_municipiotrfDataProvider.findFirst("IdMunicipio",munSel);
            String nomMun = vw_municipiotrfDataProvider.getValue(vw_municipiotrfDataProvider.getFieldKey("nombre" ),rowKey).toString();
         
            Object perSel = ddPeriodo.getSelected();
            rowKey = this.vw_periodotrfDataProvider.findFirst("PERIODO",perSel);
            String nomPer = vw_periodotrfDataProvider.getValue(vw_periodotrfDataProvider.getFieldKey("nombre" ),rowKey).toString();
         
            String nomEst = "";
            com.sun.rave.web.ui.model.Option[] arrEst = this.ddEstadoDefaultOptions.getOptions();
            for (int i=0; i<arrEst.length; i++)
                if (arrEst[i].getValue().toString().equals(ddEstado.getSelected().toString()) )
                    nomEst = arrEst[i].getLabel();
            String PageReport;
            
            
             if (dropDown5.getSelected() == null)
                throw new Exception("Favor seleccionar formato de reporte");
    
            PageReport =  Constants.darPathApp(this.getFacesContext()) + "ReportEngine?NameFilter=" + dropDown5.getSelected() +
                    "&P_CONCESIONARIO=" + ddCon.getSelected() +
                    "&P_NOMCONCESIONARIO=" + nomCon +
                    "&P_ESTADO=" + ddEstado.getSelected() +
                    "&P_NOMESTADO=" + nomEst +
                    "&P_PERIODO=" + ddPeriodo.getSelected() +
                    "&P_NOMPERIODO=" + nomPer +
                    "&P_CUENTA=" + ddCuenta.getSelected() +
                    "&P_NOMCUENTA=" +  nomCta +
                    "&P_MUNICIPIO=" + ddMunicipio.getSelected() +
                    "&P_NOMMUNICIPIO=" + nomMun +
                    "&P_VALOR=" + ddValor.getSelected();
            ;
            
            
            
            PageReport = PageReport + "&rptfilename=" + "DepositosSinIdentificar";
            
            ExternalContext externalContext = getFacesContext().getExternalContext();
            externalContext.redirect(PageReport);
            
            return "";
        } catch (Exception ex) {
            info(ex.getMessage());
            return "";
        }
        
    }
    
    public void ddPeriodo_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        
        try {
            //form1.discardSubmittedValues("SALVAR");
            
            getSessionBean1().getTrxsinidentificarRowSet().setObject(1,ddPeriodo.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(2,ddPeriodo.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(3,ddCuenta.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(4,ddCuenta.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(5,ddMunicipio.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(6,ddMunicipio.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(7,ddEstado.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(8,ddEstado.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(9,ddValor.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(10,ddValor.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(11,ddCon.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(12,ddCon.getSelected());
            
            this.trxsinidentificarDataProvider.refresh();
            
        } catch (Exception e) {
            info( e.getMessage() );
        }
        
    }
    
    public void ddCuenta_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
    }
    
    public void ddEstado_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
        
    }
    
    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
    }
    
    public void ddValor_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
    }
    
    public void ddCon_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
    }
    
    public String bsalvar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            if (this.trxsinidentificarDataProvider.getRowCount() > 0) {
                trxsinidentificarDataProvider.cursorFirst();
                int numReg = 0;
                do {
                    boolean  actualizar = false;
                    String cbAct = "0";
                    if (trxsinidentificarDataProvider.getValue("actualizar") != null )
                        cbAct = trxsinidentificarDataProvider.getValue("actualizar").toString();
                    
                    if (cbAct.equals("1"))
                        actualizar = true;
                    
                    if (actualizar) {
                        if ( trxsinidentificarDataProvider.getValue("idMunicipioNew").toString().equals("00000000"))
                            throw new Exception("Registro sin municipio asignado");
                    }
                } while (trxsinidentificarDataProvider.cursorNext());
            }
            // Navigate through rows with data provider
            if (this.trxsinidentificarDataProvider.getRowCount() > 0) {
                trxsinidentificarDataProvider.cursorFirst();
                int numReg = 0;
                do {
                    
                    boolean  actualizar = false;
                    String cbAct = "0";
                    if (trxsinidentificarDataProvider.getValue("actualizar") != null )
                        cbAct = trxsinidentificarDataProvider.getValue("actualizar").toString();
                    
                    if (cbAct.equals("1"))
                        actualizar = true;
                    
                    if (actualizar) {
                        String registro = trxsinidentificarDataProvider.getValue("numsecuenciareg").toString();
                        
                        con = Constants.getJdbcDataSource().getConnection();
                        cs = con.prepareCall(Constants.u_deposito);
                        
                        cs.setString("p_usuario", getSessionBean1().getUser());
                        cs.setBigDecimal("p_numSecuenciaReg", new BigDecimal(registro));
                        cs.setString("p_indtipoiden", trxsinidentificarDataProvider.getValue("indTipoNew").toString());
                        cs.setString("p_idmunicipioiden", trxsinidentificarDataProvider.getValue("idMunicipioNew").toString());
                        cs.setBigDecimal("p_p_consignadoiden", new BigDecimal(trxsinidentificarDataProvider.getValue("pConsignadoNew").toString()));
                        if (trxsinidentificarDataProvider.getValue("observaciones") == null)
                            cs.setString("p_observaciones", "");
                        else
                            cs.setString("p_observaciones", trxsinidentificarDataProvider.getValue("observaciones").toString());
                        
                        // Registramos los parametro de salida OUT
                        cs.registerOutParameter("p_error", java.sql.Types.VARCHAR);
                        
                        // Ejecutamos
                        cs.execute();
                        numReg++;
                        
                    }
                    
                } while (trxsinidentificarDataProvider.cursorNext());
                
                info("Registros procesados " + numReg);
            };
            
            this.trxsinidentificarDataProvider.refresh();
            
        } catch (Exception ex) {
            info("Error :"+ex.getMessage());
        }
        return null;
    }
    
    public String biniIdentificar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        if (biniIdentificar.getText().toString().contains("Iniciar")) {
            checkbox1.setDisabled(false);
            textField1.setDisabled(false);
            dropDown1.setDisabled(false);
            dropDown2.setDisabled(false);
            dropDown3.setDisabled(false);
            biniIdentificar.setText("Cancelar identificacion");
            ddCon.setDisabled(true);
            ddEstado.setDisabled(true);
            ddPeriodo.setDisabled(true);
            ddCuenta.setDisabled(true);
            ddMunicipio.setDisabled(true);
            ddValor.setDisabled(true);
            bsalvar.setDisabled(false);
            btReporte.setDisabled(true);
            
        } else{
            checkbox1.setDisabled(true);
            textField1.setDisabled(true);
            dropDown1.setDisabled(true);
            dropDown2.setDisabled(true);
            dropDown3.setDisabled(true);
            biniIdentificar.setText("Iniciar identificacion");
            ddCon.setDisabled(false);
            ddEstado.setDisabled(false);
            ddPeriodo.setDisabled(false);
            ddCuenta.setDisabled(false);
            ddMunicipio.setDisabled(false);
            ddValor.setDisabled(false);
            bsalvar.setDisabled(true);
            btReporte.setDisabled(false);
            
            ddPeriodo_processValueChange(null);
            
            
        }
        return null;
    }
    
    
    
}

