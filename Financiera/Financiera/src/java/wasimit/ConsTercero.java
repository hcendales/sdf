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
public class ConsTercero extends AbstractPageBean {
    
    public void setPage1(Page p) {
        this.page1 = p;
    }
    
    private Head head1 = new Head();

    private TableColumn tableColumn4 = new TableColumn();

    private TableColumn tableColumn12 = new TableColumn();
    
    private Form form1 = new Form();

    private StaticText staticText4 = new StaticText();

    private TableColumn tableColumn7 = new TableColumn();
    
    private Body body1 = new Body();

    private TableColumn tableColumn1 = new TableColumn();

    private TableColumn tableColumn2 = new TableColumn();
    
    private Link link1 = new Link();

    private TableColumn tableColumn13 = new TableColumn();
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;

    private TableColumn tableColumn14 = new TableColumn();

    private TableColumn tableColumn15 = new TableColumn();

    private StaticText staticText13 = new StaticText();

    private StaticText staticText14 = new StaticText();

    private TableColumn tableColumn9 = new TableColumn();

    private Table table1 = new Table();

    private CachedRowSetDataProvider vw_tercero_otDataProvider = new CachedRowSetDataProvider();

    private TableRowGroup tableRowGroup1 = new TableRowGroup();
    
    private Page page1 = new Page();

    private StaticText staticText10 = new StaticText();

    private StaticText staticText11 = new StaticText();

    private StaticText staticText12 = new StaticText();

    private StaticText staticText2 = new StaticText();

    private TableColumn tableColumn8 = new TableColumn();

    private StaticText staticText15 = new StaticText();
    CallableStatement cs = null;

    private TableColumn tableColumn11 = new TableColumn();
    ResultSet rs = null;

    private StaticText staticText6 = new StaticText();

    private StaticText staticText7 = new StaticText();

    private StaticText staticText8 = new StaticText();

    private TableColumn tableColumn5 = new TableColumn();

    private TableColumn tableColumn6 = new TableColumn();
    
    private StaticText stopcion1 = new StaticText();

    private TableColumn tableColumn10 = new TableColumn();

    private TableColumn tableColumn3 = new TableColumn();
    int pos = 0;
    
    Connection con = null;
    String resultado = "";

    private StaticText staticText9 = new StaticText();

    private StaticText staticText1 = new StaticText();

    private StaticText staticText3 = new StaticText();

    private StaticText staticText5 = new StaticText();
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        vw_tercero_otDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_tercero_otRowSet1}"));
    }
    
    private Html html1 = new Html();
    
    public Page getPage1() {
        return page1;
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
        
        
        // <editor-fold defaultstate="collapsed" desc="Visual-Web-managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Page1 Initialization Failure", e);
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

    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsTercero() {
    }

    
    
}

