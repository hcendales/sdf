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
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.PanelLayout;
import com.sun.rave.web.ui.component.PasswordField;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Tab;
import com.sun.rave.web.ui.component.TabSet;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.FacesException;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.faces.validator.LongRangeValidator;
import javax.faces.validator.ValidatorException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import oracle.jdbc.OracleTypes;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class NovReenvio extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        vw_conceptodevachDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_conceptodevachRowSet}"));
        vw_devolucionesachDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_devolucionesachRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet5}"));
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("AHO", "Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "Corriente")});
        ddTipoIdeDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("N", "NIT"), new com.sun.rave.web.ui.model.Option("C", "Cedula Ciudadania")});
        ajusteachDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.ajusteachRowSet}"));
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
    
    private Button btConsultar = new Button();
    
    public Button getBtConsultar() {
        return btConsultar;
    }
    
    public void setBtConsultar(Button b) {
        this.btConsultar = b;
    }
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private DropDown ddConcepto = new DropDown();
    
    public DropDown getDdConcepto() {
        return ddConcepto;
    }
    
    public void setDdConcepto(DropDown dd) {
        this.ddConcepto = dd;
    }
    
    private CachedRowSetDataProvider vw_conceptodevachDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_conceptodevachDataProvider() {
        return vw_conceptodevachDataProvider;
    }
    
    public void setVw_conceptodevachDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_conceptodevachDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider vw_devolucionesachDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_devolucionesachDataProvider() {
        return vw_devolucionesachDataProvider;
    }
    
    public void setVw_devolucionesachDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_devolucionesachDataProvider = crsdp;
    }
    
    private TabSet tabSet1 = new TabSet();
    
    public TabSet getTabSet1() {
        return tabSet1;
    }
    
    public void setTabSet1(TabSet ts) {
        this.tabSet1 = ts;
    }
    
    private Tab tab2 = new Tab();
    
    public Tab getTab2() {
        return tab2;
    }
    
    public void setTab2(Tab t) {
        this.tab2 = t;
    }
    
    private PanelLayout layoutPanel2 = new PanelLayout();
    
    public PanelLayout getLayoutPanel2() {
        return layoutPanel2;
    }
    
    public void setLayoutPanel2(PanelLayout pl) {
        this.layoutPanel2 = pl;
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
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private StaticText staticText1 = new StaticText();
    
    public StaticText getStaticText1() {
        return staticText1;
    }
    
    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }
    
    private TableColumn tableColumn3 = new TableColumn();
    
    public TableColumn getTableColumn3() {
        return tableColumn3;
    }
    
    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }
    
    private StaticText staticText2 = new StaticText();
    
    public StaticText getStaticText2() {
        return staticText2;
    }
    
    public void setStaticText2(StaticText st) {
        this.staticText2 = st;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
    private StaticText staticText3 = new StaticText();
    
    public StaticText getStaticText3() {
        return staticText3;
    }
    
    public void setStaticText3(StaticText st) {
        this.staticText3 = st;
    }
    
    private TableColumn tableColumn5 = new TableColumn();
    
    public TableColumn getTableColumn5() {
        return tableColumn5;
    }
    
    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }
    
    private StaticText staticText4 = new StaticText();
    
    public StaticText getStaticText4() {
        return staticText4;
    }
    
    public void setStaticText4(StaticText st) {
        this.staticText4 = st;
    }
    
    private TableColumn tableColumn6 = new TableColumn();
    
    public TableColumn getTableColumn6() {
        return tableColumn6;
    }
    
    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }
    
    private StaticText staticText5 = new StaticText();
    
    public StaticText getStaticText5() {
        return staticText5;
    }
    
    public void setStaticText5(StaticText st) {
        this.staticText5 = st;
    }
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private StaticText staticText6 = new StaticText();
    
    public StaticText getStaticText6() {
        return staticText6;
    }
    
    public void setStaticText6(StaticText st) {
        this.staticText6 = st;
    }
    
    private TableColumn tableColumn8 = new TableColumn();
    
    public TableColumn getTableColumn8() {
        return tableColumn8;
    }
    
    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }
    
    private StaticText staticText7 = new StaticText();
    
    public StaticText getStaticText7() {
        return staticText7;
    }
    
    public void setStaticText7(StaticText st) {
        this.staticText7 = st;
    }
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private StaticText staticText8 = new StaticText();
    
    public StaticText getStaticText8() {
        return staticText8;
    }
    
    public void setStaticText8(StaticText st) {
        this.staticText8 = st;
    }
    
    private TableColumn tableColumn10 = new TableColumn();
    
    public TableColumn getTableColumn10() {
        return tableColumn10;
    }
    
    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }
    
    private StaticText staticText9 = new StaticText();
    
    public StaticText getStaticText9() {
        return staticText9;
    }
    
    public void setStaticText9(StaticText st) {
        this.staticText9 = st;
    }
    
    private TableColumn tableColumn11 = new TableColumn();
    
    public TableColumn getTableColumn11() {
        return tableColumn11;
    }
    
    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }
    
    private StaticText staticText10 = new StaticText();
    
    public StaticText getStaticText10() {
        return staticText10;
    }
    
    public void setStaticText10(StaticText st) {
        this.staticText10 = st;
    }
    
    private TableColumn tableColumn12 = new TableColumn();
    
    public TableColumn getTableColumn12() {
        return tableColumn12;
    }
    
    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }
    
    private StaticText staticText11 = new StaticText();
    
    public StaticText getStaticText11() {
        return staticText11;
    }
    
    public void setStaticText11(StaticText st) {
        this.staticText11 = st;
    }
    
    private TableColumn tableColumn13 = new TableColumn();
    
    public TableColumn getTableColumn13() {
        return tableColumn13;
    }
    
    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }
    
    private StaticText staticText12 = new StaticText();
    
    public StaticText getStaticText12() {
        return staticText12;
    }
    
    public void setStaticText12(StaticText st) {
        this.staticText12 = st;
    }
    
    private TableColumn tableColumn14 = new TableColumn();
    
    public TableColumn getTableColumn14() {
        return tableColumn14;
    }
    
    public void setTableColumn14(TableColumn tc) {
        this.tableColumn14 = tc;
    }
    
    private StaticText staticText13 = new StaticText();
    
    public StaticText getStaticText13() {
        return staticText13;
    }
    
    public void setStaticText13(StaticText st) {
        this.staticText13 = st;
    }
    
    private TableColumn tableColumn15 = new TableColumn();
    
    public TableColumn getTableColumn15() {
        return tableColumn15;
    }
    
    public void setTableColumn15(TableColumn tc) {
        this.tableColumn15 = tc;
    }
    
    private StaticText staticText14 = new StaticText();
    
    public StaticText getStaticText14() {
        return staticText14;
    }
    
    public void setStaticText14(StaticText st) {
        this.staticText14 = st;
    }
    
    private Tab tab1 = new Tab();
    
    public Tab getTab1() {
        return tab1;
    }
    
    public void setTab1(Tab t) {
        this.tab1 = t;
    }
    
    private PanelLayout layoutPanel1 = new PanelLayout();
    
    public PanelLayout getLayoutPanel1() {
        return layoutPanel1;
    }
    
    public void setLayoutPanel1(PanelLayout pl) {
        this.layoutPanel1 = pl;
    }
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    private DropDown ddAjuste = new DropDown();
    
    public DropDown getDdAjuste() {
        return ddAjuste;
    }
    
    public void setDdAjuste(DropDown dd) {
        this.ddAjuste = dd;
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
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private Label label9 = new Label();
    
    public Label getLabel9() {
        return label9;
    }
    
    public void setLabel9(Label l) {
        this.label9 = l;
    }
    
    private Label label10 = new Label();
    
    public Label getLabel10() {
        return label10;
    }
    
    public void setLabel10(Label l) {
        this.label10 = l;
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
    
    private Button bcrearNov = new Button();
    
    public Button getBcrearNov() {
        return bcrearNov;
    }
    
    public void setBcrearNov(Button b) {
        this.bcrearNov = b;
    }
    
    private DropDown ddBanco = new DropDown();
    
    public DropDown getDdBanco() {
        return ddBanco;
    }
    
    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
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
    
    private TextField tcuenta = new TextField();
    
    public TextField getTcuenta() {
        return tcuenta;
    }
    
    public void setTcuenta(TextField tf) {
        this.tcuenta = tf;
    }
    
    private DropDown ddTipoIde = new DropDown();
    
    public DropDown getDdTipoIde() {
        return ddTipoIde;
    }
    
    public void setDdTipoIde(DropDown dd) {
        this.ddTipoIde = dd;
    }
    
    private SingleSelectOptionsList ddTipoIdeDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoIdeDefaultOptions() {
        return ddTipoIdeDefaultOptions;
    }
    
    public void setDdTipoIdeDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoIdeDefaultOptions = ssol;
    }
    
    private TextField tidentificacion = new TextField();
    
    public TextField getTidentificacion() {
        return tidentificacion;
    }
    
    public void setTidentificacion(TextField tf) {
        this.tidentificacion = tf;
    }
    
    private Calendar cfecAct = new Calendar();
    
    public Calendar getCfecAct() {
        return cfecAct;
    }
    
    public void setCfecAct(Calendar c) {
        this.cfecAct = c;
    }
    
    private TextField tdnsAvvillas = new TextField();
    
    public TextField getTdnsAvvillas() {
        return tdnsAvvillas;
    }
    
    public void setTdnsAvvillas(TextField tf) {
        this.tdnsAvvillas = tf;
    }
    
    private TextField tdnsDavivienda = new TextField();
    
    public TextField getTdnsDavivienda() {
        return tdnsDavivienda;
    }
    
    public void setTdnsDavivienda(TextField tf) {
        this.tdnsDavivienda = tf;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider ajusteachDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getAjusteachDataProvider() {
        return ajusteachDataProvider;
    }
    
    public void setAjusteachDataProvider(CachedRowSetDataProvider crsdp) {
        this.ajusteachDataProvider = crsdp;
    }
    
    private TableColumn tableColumn16 = new TableColumn();
    
    public TableColumn getTableColumn16() {
        return tableColumn16;
    }
    
    public void setTableColumn16(TableColumn tc) {
        this.tableColumn16 = tc;
    }
    
    private Checkbox checkbox1 = new Checkbox();
    
    public Checkbox getCheckbox1() {
        return checkbox1;
    }
    
    public void setCheckbox1(Checkbox c) {
        this.checkbox1 = c;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public NovReenvio() {
    }
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
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
            
            if (this.isPostBack())
                return;
            
            //tabSet1.setSelected(tab2.getText().toString());
            
            this.vw_conceptodevachDataProvider.refresh();
            
            getSessionBean1().getVw_devolucionesachRowSet().setObject(1,"");
            
            this.vw_devolucionesachDataProvider.refresh();
            
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
        vw_conceptodevachDataProvider.close();
        vw_devolucionesachDataProvider.close();
        bancoDataProvider.close();
        ajusteachDataProvider.close();
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
    
    
    public String btConsultar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            
            
            getSessionBean1().getVw_devolucionesachRowSet().setObject(1,ddConcepto.getValue().toString());
            this.vw_devolucionesachDataProvider.refresh();
            
        } catch (Exception ex) {
            info("Error en consulta:" + ex.getMessage());
        }
        
        return null;
        
    }
    
    public String tab1_action() {
        // TODO: Replace with your code
        try {
            validarSeleccion();
            
            if (this.vw_devolucionesachDataProvider.getRowCount() > 0) {
                vw_devolucionesachDataProvider.cursorFirst();
                
                do {
                    String cbAct = "0";
                    
                    if (vw_devolucionesachDataProvider.getValue("actualizar") != null )
                        cbAct = vw_devolucionesachDataProvider.getValue("actualizar").toString();
                    
                    if (cbAct.equals("1")) {
                        ddBanco.setValue(vw_devolucionesachDataProvider.getValue("des_idbanco").toString());
                        ddTipo.setValue(vw_devolucionesachDataProvider.getValue("des_tipoCuenta").toString());
                        tcuenta.setText(vw_devolucionesachDataProvider.getValue("cuentadestino").toString());
                        ddTipoIde.setValue("NIT");
                        tidentificacion.setText(vw_devolucionesachDataProvider.getValue("des_nit").toString());
                    }
                    
                    
                } while (vw_devolucionesachDataProvider.cursorNext());
            }
            
        } catch (Exception e) {
            info(e.getMessage());
        }
        
        return null;
    }
    
    public void validarSeleccion() throws Exception {
        
        int numReg = 0;
        
        if (this.vw_devolucionesachDataProvider.getRowCount() > 0) {
            vw_devolucionesachDataProvider.cursorFirst();
            
            do {
                boolean  actualizar = false;
                String cbAct = "0";
                
                if (vw_devolucionesachDataProvider.getValue("actualizar") != null )
                    cbAct = vw_devolucionesachDataProvider.getValue("actualizar").toString();
                
                if (cbAct.equals("1"))
                    numReg++;
                
                
            } while (vw_devolucionesachDataProvider.cursorNext());
        }
        
        if (numReg == 0)
            throw new Exception("Se debe seleccionar al menos una transaccion");
        
        info("se han seleccionado : "  + numReg + " transacciones");
        
        
    }
    public void cfecAct_validate(FacesContext context, UIComponent component, Object value) {
        // TODO: Replace with your code
        
    }
    
    
    public void validarForma() throws Exception {
        
        if (tcuenta.getText() == null)
            throw new Exception("Favor ingresar cuenta destino");
        
        if (tcuenta.getText().toString().length() == 0)
            throw new Exception("Favor ingresar cuenta destino");
        
        try{
            
            float vlr = Float.parseFloat((String)this.tcuenta.getText());
            
        }catch(NumberFormatException e) {
            throw new Exception("Cuenta debe ser numerica");
        }
        
        
        if (tidentificacion.getText() == null)
            throw new Exception("Favor ingresar identificacion");
        
        if (tidentificacion.getText().toString().length() == 0)
            throw new Exception("Favor ingresar identificacion");
        
        try{
            float vlr = Float.parseFloat((String)this.tidentificacion.getText());
            
        }catch(NumberFormatException e) {
            throw new Exception("Identificacion debe ser numerico");
        }
        
        if (!ddAjuste.getValue().toString().equals("001"))
            if (tdnsAvvillas.getValue() == null && tdnsDavivienda.getValue() == null)
                throw new Exception("El tipo de ajuste requiere DNS");
        
        if (!ddAjuste.getValue().toString().equals("001"))
            if (tdnsAvvillas.getValue().toString().length() == 0 && tdnsDavivienda.getValue().toString().length() == 0 )
                throw new Exception("El tipo de ajuste requiere DNS");
        
        if (this.cfecAct.getSelectedDate() == null)
            throw new Exception("Seleccione Fecha Activación");
        
        java.util.Calendar fecha_hoy = java.util.Calendar.getInstance();
        if (this.cfecAct.getSelectedDate().compareTo(fecha_hoy.getTime()) < 0 )
            throw new Exception("Fecha Activación inválida");
        
    }
    
    public String crearNovedad() throws Exception {
        
        con = Constants.getJdbcDataSource().getConnection();
        
        cs = con.prepareCall(Constants.NovReenvioAdd);
        
        cs.setString("V_CONCEPTO", ddConcepto.getValue().toString());
        cs.setString("V_IDAJUSTE", ddAjuste.getValue().toString());
        cs.setString("V_IDBANCO", ddBanco.getValue().toString());
        cs.setString("V_TIPOCTA", ddTipo.getValue().toString());
        cs.setDouble("V_CUENTA", Double.parseDouble((String) this.tcuenta.getText()));
        cs.setString("V_TIPOIDE", ddTipoIde.getValue().toString());
        cs.setDouble("V_IDENTIFICACION", Double.parseDouble((String) this.tidentificacion.getText()));
        
        java.sql.Date fec = new java.sql.Date(this.cfecAct.getSelectedDate().getTime());
        cs.setDate("V_FECACT", fec);
        
        if (tdnsAvvillas.getValue() == null)
            cs.setString("V_DNSAVVILLAS", "");
        else
            cs.setString("V_DNSAVVILLAS", tdnsAvvillas.getValue().toString());
        
        if (tdnsDavivienda.getValue() == null)
            cs.setString("V_DNSDAVIVIENDA", "");
        else
            cs.setString("V_DNSDAVIVIENDA", tdnsDavivienda.getValue().toString());
        
        cs.setString("V_USUARIO", getSessionBean1().getUser());
        
        // Registramos los parametro de salida OUT
        cs.registerOutParameter("V_ERROR", java.sql.Types.CHAR);
        cs.registerOutParameter("V_NOVEDAD", java.sql.Types.CHAR);
        
        // Ejecutamos
        cs.execute();
        
        // Captura los parametros de salida OUT
        resultado = cs.getString("V_ERROR");
        info(resultado);
        
        if (!resultado.equals(Constants.MSG_INS_OK)) {
            SQLTools.close(rs, cs, con);
            return "";
            
        }
        String novedad = cs.getString("V_NOVEDAD");
        SQLTools.close(rs, cs, con);
        
        return novedad;
        
    }
    
    public void registrarDetalleNovedad(String novedad) throws Exception {
        
        if (this.vw_devolucionesachDataProvider.getRowCount() > 0) {
            vw_devolucionesachDataProvider.cursorFirst();

            con = Constants.getJdbcDataSource().getConnection();

            do {
                String cbAct = "0";
                
                if (vw_devolucionesachDataProvider.getValue("actualizar") != null )
                    cbAct = vw_devolucionesachDataProvider.getValue("actualizar").toString();
                
                if (cbAct.equals("1"))
                {
        
                    cs = con.prepareCall(Constants.NovReenvioDetalleAdd);
        
                    cs.setString("V_NOVEDAD", novedad);
                    cs.setString("V_CONCEPTO", ddConcepto.getValue().toString());
                    cs.setDouble("V_REFERENCIATRF", Double.parseDouble(vw_devolucionesachDataProvider.getValue("referenciaTrf").toString()));
                    cs.setString("V_USUARIO", getSessionBean1().getUser());
        
                    // Registramos los parametro de salida OUT
                    cs.registerOutParameter("V_ERROR", java.sql.Types.CHAR);
                    
                    cs.execute();
                    
                    resultado = cs.getString("V_ERROR");
                    
                    if (!resultado.equals(Constants.MSG_INS_OK)) {
                        SQLTools.close(rs, cs, con);
                        throw new Exception("Problemas registrando detalle de novedad:" + resultado );
                        
                    }
                    
                    cs.close();
                    cs = null;
                    
                }
                
                
            } while (vw_devolucionesachDataProvider.cursorNext());
            
           SQLTools.close(rs, cs, con);

        }
        
    }
    
    public void limpiarCampos()
    {
        
        ddBanco.setValue("00");
        ddTipo.setValue("AHO");
        tcuenta.setText("");
        ddTipoIde.setValue("N");
        tidentificacion.setText("");
        cfecAct.setValue("");
        tdnsAvvillas.setText("");
        tdnsDavivienda.setText("");
        
    }
    public String bcrearNov_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            validarSeleccion();
            
            validarForma();
            
            String novedad = crearNovedad();
            
            registrarDetalleNovedad(novedad);
            
            info("Novedad de reenvio creada exitosamente. Nro:" + novedad);
                        
            btConsultar_action();
            
            limpiarCampos();
                
        } catch (Exception e) {
            info("No es posible crear novedad: " + e.getMessage());
        }
        return null;
    }
    
    
    
    
    
}

