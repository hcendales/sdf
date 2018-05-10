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
import com.sun.rave.web.ui.component.PasswordField;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.TextField;
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
public class FondoContingencia extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        bancoDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("AHO", "AHORROS"), new com.sun.rave.web.ui.model.Option("CTE", "CORRIENTE")});
        ddNitDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("NIT", "NIT")});
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
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private TextField tidentificacion = new TextField();
    
    public TextField getTidentificacion() {
        return tidentificacion;
    }
    
    public void setTidentificacion(TextField tf) {
        this.tidentificacion = tf;
    }
    
    private TextField tcuenta = new TextField();
    
    public TextField getTcuenta() {
        return tcuenta;
    }
    
    public void setTcuenta(TextField tf) {
        this.tcuenta = tf;
    }
    
    private Button button1 = new Button();
    
    public Button getButton1() {
        return button1;
    }
    
    public void setButton1(Button b) {
        this.button1 = b;
    }
    
    private DropDown ddBanco = new DropDown();
    
    public DropDown getDdBanco() {
        return ddBanco;
    }
    
    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
    }
    
    private CachedRowSetDataProvider bancoDataProvider1 = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider1() {
        return bancoDataProvider1;
    }
    
    public void setBancoDataProvider1(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider1 = crsdp;
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
    
    private DropDown ddNit = new DropDown();
    
    public DropDown getDdNit() {
        return ddNit;
    }
    
    public void setDdNit(DropDown dd) {
        this.ddNit = dd;
    }
    
    private SingleSelectOptionsList ddNitDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdNitDefaultOptions() {
        return ddNitDefaultOptions;
    }
    
    public void setDdNitDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddNitDefaultOptions = ssol;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public FondoContingencia() {
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
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.conFondContig);
            
            
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            
            cs.registerOutParameter("V_IDBANCO", java.sql.Types.CHAR);
            cs.registerOutParameter("V_TIPOCTA", java.sql.Types.CHAR);
            cs.registerOutParameter("V_TIPOIDE", java.sql.Types.CHAR);
            cs.registerOutParameter("V_NUMIDE", java.sql.Types.CHAR);
            cs.registerOutParameter("V_NUMCTA", java.sql.Types.CHAR);
            cs.registerOutParameter("V_COD_ERROR", java.sql.Types.INTEGER);
            cs.registerOutParameter("V_MSG_ERROR", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            if (cs.getInt("V_COD_ERROR") == 0) {
                ddBanco.setValue(cs.getString("V_IDBANCO"));
                ddTipo.setValue(cs.getString("V_TIPOCTA"));
                ddNit.setValue(cs.getString("V_TIPOIDE"));
                tidentificacion.setText(cs.getString("V_NUMIDE"));
                tcuenta.setText(cs.getString("V_NUMCTA"));
            }
            
        } catch (Exception ex) {
            info(ex.getMessage());
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
        bancoDataProvider1.close();
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
    
    public String button1_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            try{
                float vlr = Float.parseFloat((String)this.tidentificacion.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Numero de identificacion incorrecto");
            }
            
            
            try{
                float vlr = Float.parseFloat((String)this.tcuenta.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Numero de cuenta incorrecto");
            }
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.actFondContig);
            
            cs.setString("V_IDBANCO", ddBanco.getValue().toString());
            cs.setString("V_TIPOCTA", ddTipo.getValue().toString());
            cs.setString("V_TIPOIDE", ddNit.getValue().toString());
            cs.setString("V_NUMIDE", tidentificacion.getText().toString());
            cs.setString("V_NUMCTA", tcuenta.getText().toString());
            
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            
            cs.registerOutParameter("V_COD_ERROR", java.sql.Types.INTEGER);
            cs.registerOutParameter("V_MSG_ERROR", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            info(cs.getString("V_MSG_ERROR"));
            
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        
        return null;
    }
    
    
    
    
    
}

