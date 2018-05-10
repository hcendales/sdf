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
import com.sun.rave.web.ui.component.PasswordField;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.context.ExternalContext;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.FacesException;
import javax.faces.event.ValueChangeEvent;
import javax.faces.validator.LongRangeValidator;
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
public class ConsCobros extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        municipioDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet6}"));
        dropDown2DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Todos"), new com.sun.rave.web.ui.model.Option("0", "Pendiente de Cobro"), new com.sun.rave.web.ui.model.Option("1", "Cobro Ejecutado")});
        dropDown3DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("PDF", "PDF"), new com.sun.rave.web.ui.model.Option("CSV", "Excel")});
        vw_cobrosdevDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_cobrosdevRowSet}"));
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
    
    private CachedRowSetDataProvider municipioDataProvider1 = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider1() {
        return municipioDataProvider1;
    }
    
    public void setMunicipioDataProvider1(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider1 = crsdp;
    }
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private DropDown dropDown1 = new DropDown();
    
    public DropDown getDropDown1() {
        return dropDown1;
    }
    
    public void setDropDown1(DropDown dd) {
        this.dropDown1 = dd;
    }
    
    private DropDown dropDown2 = new DropDown();
    
    public DropDown getDropDown2() {
        return dropDown2;
    }
    
    public void setDropDown2(DropDown dd) {
        this.dropDown2 = dd;
    }
    
    private SingleSelectOptionsList dropDown2DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDropDown2DefaultOptions() {
        return dropDown2DefaultOptions;
    }
    
    public void setDropDown2DefaultOptions(SingleSelectOptionsList ssol) {
        this.dropDown2DefaultOptions = ssol;
    }
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    private Button button1 = new Button();
    
    public Button getButton1() {
        return button1;
    }
    
    public void setButton1(Button b) {
        this.button1 = b;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private DropDown dropDown3 = new DropDown();
    
    public DropDown getDropDown3() {
        return dropDown3;
    }
    
    public void setDropDown3(DropDown dd) {
        this.dropDown3 = dd;
    }
    
    private SingleSelectOptionsList dropDown3DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDropDown3DefaultOptions() {
        return dropDown3DefaultOptions;
    }
    
    public void setDropDown3DefaultOptions(SingleSelectOptionsList ssol) {
        this.dropDown3DefaultOptions = ssol;
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
    
    private CachedRowSetDataProvider vw_cobrosdevDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_cobrosdevDataProvider() {
        return vw_cobrosdevDataProvider;
    }
    
    public void setVw_cobrosdevDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_cobrosdevDataProvider = crsdp;
    }
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private StaticText staticText2 = new StaticText();
    
    public StaticText getStaticText2() {
        return staticText2;
    }
    
    public void setStaticText2(StaticText st) {
        this.staticText2 = st;
    }
    
    private TableColumn tableColumn3 = new TableColumn();
    
    public TableColumn getTableColumn3() {
        return tableColumn3;
    }
    
    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }
    
    private StaticText staticText3 = new StaticText();
    
    public StaticText getStaticText3() {
        return staticText3;
    }
    
    public void setStaticText3(StaticText st) {
        this.staticText3 = st;
    }
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private StaticText staticText9 = new StaticText();
    
    public StaticText getStaticText9() {
        return staticText9;
    }
    
    public void setStaticText9(StaticText st) {
        this.staticText9 = st;
    }
    
    private TableColumn tableColumn23 = new TableColumn();
    
    public TableColumn getTableColumn23() {
        return tableColumn23;
    }
    
    public void setTableColumn23(TableColumn tc) {
        this.tableColumn23 = tc;
    }
    
    private StaticText staticText23 = new StaticText();
    
    public StaticText getStaticText23() {
        return staticText23;
    }
    
    public void setStaticText23(StaticText st) {
        this.staticText23 = st;
    }
    
    private TableColumn tableColumn34 = new TableColumn();
    
    public TableColumn getTableColumn34() {
        return tableColumn34;
    }
    
    public void setTableColumn34(TableColumn tc) {
        this.tableColumn34 = tc;
    }
    
    private StaticText staticText34 = new StaticText();
    
    public StaticText getStaticText34() {
        return staticText34;
    }
    
    public void setStaticText34(StaticText st) {
        this.staticText34 = st;
    }
    
    private TableColumn tableColumn36 = new TableColumn();
    
    public TableColumn getTableColumn36() {
        return tableColumn36;
    }
    
    public void setTableColumn36(TableColumn tc) {
        this.tableColumn36 = tc;
    }
    
    private StaticText staticText36 = new StaticText();
    
    public StaticText getStaticText36() {
        return staticText36;
    }
    
    public void setStaticText36(StaticText st) {
        this.staticText36 = st;
    }
    
    private TableColumn tableColumn40 = new TableColumn();
    
    public TableColumn getTableColumn40() {
        return tableColumn40;
    }
    
    public void setTableColumn40(TableColumn tc) {
        this.tableColumn40 = tc;
    }
    
    private StaticText staticText40 = new StaticText();
    
    public StaticText getStaticText40() {
        return staticText40;
    }
    
    public void setStaticText40(StaticText st) {
        this.staticText40 = st;
    }
    
    private TableColumn tableColumn44 = new TableColumn();
    
    public TableColumn getTableColumn44() {
        return tableColumn44;
    }
    
    public void setTableColumn44(TableColumn tc) {
        this.tableColumn44 = tc;
    }
    
    private StaticText staticText44 = new StaticText();
    
    public StaticText getStaticText44() {
        return staticText44;
    }
    
    public void setStaticText44(StaticText st) {
        this.staticText44 = st;
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
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsCobros() {
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
            getSessionBean1().getVw_cobrosdevRowSet().setObject(1,"00000000");
            getSessionBean1().getVw_cobrosdevRowSet().setObject(2,"00000000");
            getSessionBean1().getVw_cobrosdevRowSet().setObject(3,"9");
            getSessionBean1().getVw_cobrosdevRowSet().setObject(4,"9");
            
            
            
        } catch (Exception e) {
            info( e.getMessage() );
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
        municipioDataProvider1.close();
        vw_cobrosdevDataProvider.close();
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
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    
    public void dropDown1_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        try {
            getSessionBean1().getVw_cobrosdevRowSet().setObject(1,dropDown1.getSelected());
            getSessionBean1().getVw_cobrosdevRowSet().setObject(2,dropDown1.getSelected());
            getSessionBean1().getVw_cobrosdevRowSet().setObject(3,dropDown2.getSelected());
            getSessionBean1().getVw_cobrosdevRowSet().setObject(4,dropDown2.getSelected());
            
            this.vw_cobrosdevDataProvider.refresh();
            
        } catch (Exception e) {
            info( e.getMessage() );
        }
        
    }
    
    public void dropDown2_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        dropDown1_processValueChange(null);
    }
    
    public String button1_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            // TODO: Process the button click action. Return value is a navigation
            // case name where null will return to the same page.
            
            
            String PageReport;
            
            
            PageReport =  Constants.darPathApp(this.getFacesContext()) + "ReportEngine?NameFilter=" + (String)dropDown3.getValue() +
                    "&P_INDCOBRO=" + (String)dropDown2.getValue() +
                    "&P_MUNICIPIO=" + (String)dropDown1.getValue();
            
            
            PageReport = PageReport + "&rptfilename=" + "ConsCobros";
            
            ExternalContext externalContext = getFacesContext().getExternalContext();
            externalContext.redirect(PageReport);
            
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        
        return null;
    }
    
    
    
}

