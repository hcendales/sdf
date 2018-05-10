/*
 * Usuarios.java
 *
 * Created on 4 de enero de 2008, 04:36 PM
 * Copyright DSOFTFIN
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.Checkbox;
import com.sun.rave.web.ui.component.CheckboxGroup;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.MultipleSelectOptionsList;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.faces.FacesException;
import javax.faces.convert.BigDecimalConverter;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class Usuarios extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        personDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.personRowSet}"));
        rolxpersonDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.rolxpersonRowSet}"));
        rolDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.rolRowSet}"));
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
    
    private CachedRowSetDataProvider personDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getPersonDataProvider() {
        return personDataProvider;
    }
    
    public void setPersonDataProvider(CachedRowSetDataProvider crsdp) {
        this.personDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider rolxpersonDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getRolxpersonDataProvider() {
        return rolxpersonDataProvider;
    }
    
    public void setRolxpersonDataProvider(CachedRowSetDataProvider crsdp) {
        this.rolxpersonDataProvider = crsdp;
    }
    
    private Table table1 = new Table();
    
    public Table getTable1() {
        return table1;
    }
    
    public void setTable1(Table t) {
        this.table1 = t;
    }
    
    private TextField tfnombre = new TextField();
    
    public TextField getTfnombre() {
        return tfnombre;
    }
    
    public void setTfnombre(TextField tf) {
        this.tfnombre = tf;
    }
    
    private Checkbox cbhabil = new Checkbox();
    
    public Checkbox getCbhabil() {
        return cbhabil;
    }
    
    public void setCbhabil(Checkbox c) {
        this.cbhabil = c;
    }
    
    private TextField tfcedula = new TextField();
    
    public TextField getTfcedula() {
        return tfcedula;
    }
    
    public void setTfcedula(TextField tf) {
        this.tfcedula = tf;
    }
    
    private TextField tfcorreo = new TextField();
    
    public TextField getTfcorreo() {
        return tfcorreo;
    }
    
    public void setTfcorreo(TextField tf) {
        this.tfcorreo = tf;
    }
    
    private TextField tfcargo = new TextField();
    
    public TextField getTfcargo() {
        return tfcargo;
    }
    
    public void setTfcargo(TextField tf) {
        this.tfcargo = tf;
    }
    
    private StaticText stopcion1 = new StaticText();
    
    public StaticText getStopcion1() {
        return stopcion1;
    }
    
    public void setStopcion1(StaticText st) {
        this.stopcion1 = st;
    }
    
    private Button btActualizar = new Button();
    
    public Button getBtActualizar() {
        return btActualizar;
    }
    
    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }
    
    private TableRowGroup tableRowGroup1 = new TableRowGroup();
    
    public TableRowGroup getTableRowGroup1() {
        return tableRowGroup1;
    }
    
    public void setTableRowGroup1(TableRowGroup trg) {
        this.tableRowGroup1 = trg;
    }
    
    private TableColumn tcedit = new TableColumn();
    
    public TableColumn getTcedit() {
        return tcedit;
    }
    
    public void setTcedit(TableColumn tc) {
        this.tcedit = tc;
    }
    
    private Button btEditar1 = new Button();
    
    public Button getBtEditar1() {
        return btEditar1;
    }
    
    public void setBtEditar1(Button b) {
        this.btEditar1 = b;
    }
    
    private TableColumn tccedula = new TableColumn();
    
    public TableColumn getTccedula() {
        return tccedula;
    }
    
    public void setTccedula(TableColumn tc) {
        this.tccedula = tc;
    }
    
    private StaticText stcedula = new StaticText();
    
    public StaticText getStcedula() {
        return stcedula;
    }
    
    public void setStcedula(StaticText st) {
        this.stcedula = st;
    }
    
    private TableColumn tcnombre = new TableColumn();
    
    public TableColumn getTcnombre() {
        return tcnombre;
    }
    
    public void setTcnombre(TableColumn tc) {
        this.tcnombre = tc;
    }
    
    private StaticText stnombre = new StaticText();
    
    public StaticText getStnombre() {
        return stnombre;
    }
    
    public void setStnombre(StaticText st) {
        this.stnombre = st;
    }
    
    private TableColumn tccargo = new TableColumn();
    
    public TableColumn getTccargo() {
        return tccargo;
    }
    
    public void setTccargo(TableColumn tc) {
        this.tccargo = tc;
    }
    
    private StaticText stcargo = new StaticText();
    
    public StaticText getStcargo() {
        return stcargo;
    }
    
    public void setStcargo(StaticText st) {
        this.stcargo = st;
    }
    
    private TableColumn tcmail = new TableColumn();
    
    public TableColumn getTcmail() {
        return tcmail;
    }
    
    public void setTcmail(TableColumn tc) {
        this.tcmail = tc;
    }
    
    private StaticText stmail = new StaticText();
    
    public StaticText getStmail() {
        return stmail;
    }
    
    public void setStmail(StaticText st) {
        this.stmail = st;
    }
    
    private TableColumn tcactivo = new TableColumn();
    
    public TableColumn getTcactivo() {
        return tcactivo;
    }
    
    public void setTcactivo(TableColumn tc) {
        this.tcactivo = tc;
    }
    
    private StaticText stactivo = new StaticText();
    
    public StaticText getStactivo() {
        return stactivo;
    }
    
    public void setStactivo(StaticText st) {
        this.stactivo = st;
    }

    private CheckboxGroup checkboxGroupRoles = new CheckboxGroup();

    public CheckboxGroup getCheckboxGroupRoles() {
        return checkboxGroupRoles;
    }

    public void setCheckboxGroupRoles(CheckboxGroup cg) {
        this.checkboxGroupRoles = cg;
    }

    private CachedRowSetDataProvider rolDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getRolDataProvider() {
        return rolDataProvider;
    }

    public void setRolDataProvider(CachedRowSetDataProvider crsdp) {
        this.rolDataProvider = crsdp;
    }

    private BigDecimalConverter checkboxGroupRolesConverter = new BigDecimalConverter();

    public BigDecimalConverter getCheckboxGroupRolesConverter() {
        return checkboxGroupRolesConverter;
    }

    public void setCheckboxGroupRolesConverter(BigDecimalConverter bdc) {
        this.checkboxGroupRolesConverter = bdc;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Usuarios() {
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
            log("Usuarios Initialization Failure", e);
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
        personDataProvider.close();
        rolxpersonDataProvider.close();
        rolDataProvider.close();
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
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
    }
    
    public String btEditar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("editar :" + sdf.format(cal.getTime()));
        
        try {
            ArrayList roles = new ArrayList();
            btActualizar.setText("Actualizar");
            tfcedula.setReadOnly(true);
            tfcedula.setText(stcedula.getValue());
            tfnombre.setText(stnombre.getValue());
            tfcargo.setText(stcargo.getValue());
            tfcorreo.setText(stmail.getValue());
            if(stactivo.getValue().toString().equalsIgnoreCase("1"))
                cbhabil.setValue("true");
            //getSessionBean1().getRolxpersonRowSet().setObject(1, tfcedula.getText().toString());
            getSessionBean1().getRolxpersonRowSet().setObject(1, "79938127");
            rolxpersonDataProvider.refresh();
            boolean hasNext = rolxpersonDataProvider.cursorFirst();
            int i=0;
            while (hasNext) {
                BigDecimal rol = new BigDecimal(rolxpersonDataProvider.getValue("ROLID").toString());
                roles.add(rol);
                hasNext = rolxpersonDataProvider.cursorNext();
            }
            // Guardar en una variable los roles y despues asignarselos 
            // para ver si los guarda temporalmente y no se presente el error
            checkboxGroupRoles.setSelected(roles);
        } catch (Exception ex) {
            log("Exception gathering tree data", ex);
            error("Exception gathering tree data: " + ex);
        }
        System.out.println("termine traer");
        
        return null;
    }
    
    public String btActualizar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        btActualizar.setText("Adicionar");
        return null;
    }
}

