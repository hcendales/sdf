/*
 * rptLiqSimitLoc.java
 *
 * Created on 28 de noviembre de 2007, 02:30 PM
 * Copyright DSOFTFIN
 */
package wasimit;

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
public class RptControlTecho extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        ddConcesionarioDefaultOptions1.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99", "TODOS"), new com.sun.rave.web.ui.model.Option("01", "REMO S.A."), new com.sun.rave.web.ui.model.Option("02", "SIMIT OCCIDENTE"), new com.sun.rave.web.ui.model.Option("03", "SEVIAL S.A"), new com.sun.rave.web.ui.model.Option("04", "SERVIT LTDA"), new com.sun.rave.web.ui.model.Option("05", "SIMIT CAPITAL"), new com.sun.rave.web.ui.model.Option("06", "FCM")});
        ddTipoRecDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("TOD", "TODOS"), new com.sun.rave.web.ui.model.Option("EXT", "EXTERNO"), new com.sun.rave.web.ui.model.Option("LOC", "LOCAL")});
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
    
    private DropDown ddConcesionario1 = new DropDown();
    
    public DropDown getDdConcesionario1() {
        return ddConcesionario1;
    }
    
    public void setDdConcesionario1(DropDown dd) {
        this.ddConcesionario1 = dd;
    }
    
    private SingleSelectOptionsList ddConcesionarioDefaultOptions1 = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdConcesionarioDefaultOptions1() {
        return ddConcesionarioDefaultOptions1;
    }
    
    public void setDdConcesionarioDefaultOptions1(SingleSelectOptionsList ssol) {
        this.ddConcesionarioDefaultOptions1 = ssol;
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
    
    private DropDown ddTipoRec = new DropDown();
    
    public DropDown getDdTipoRec() {
        return ddTipoRec;
    }
    
    public void setDdTipoRec(DropDown dd) {
        this.ddTipoRec = dd;
    }
    
    private SingleSelectOptionsList ddTipoRecDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoRecDefaultOptions() {
        return ddTipoRecDefaultOptions;
    }
    
    public void setDdTipoRecDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoRecDefaultOptions = ssol;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private TextField textField1 = new TextField();
    
    public TextField getTextField1() {
        return textField1;
    }
    
    public void setTextField1(TextField tf) {
        this.textField1 = tf;
    }
    
    private Button button1 = new Button();
    
    public Button getButton1() {
        return button1;
    }
    
    public void setButton1(Button b) {
        this.button1 = b;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public RptControlTecho() {
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
    
    public String button1_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            try{
                float vlr = Float.parseFloat((String)this.textField1.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Periodo incorrecto");
            }
            

            String nomCon = "TODOS";
            String nomRec = "TODOS";
            
            if (ddTipoRec.getValue().toString().equals("EXT"))
                nomRec = "EXTERNO";
            
            if (ddTipoRec.getValue().toString().equals("LOC"))
                nomRec = "LOCAL";
            
            if (ddConcesionario1.getValue().toString().equals("01"))
                nomCon = "REMO S.A";
            
            if (ddConcesionario1.getValue().toString().equals("02"))
                nomCon = "SIMIT OCCIDENTE S.A.";
            
            if (ddConcesionario1.getValue().toString().equals("03"))
                nomCon = "SEVIAL S.A";

            if (ddConcesionario1.getValue().toString().equals("04"))
                nomCon = "SERVIT S.A.S.";

            if (ddConcesionario1.getValue().toString().equals("05"))
                nomCon = "SIMIT CAPITAL U.T.";

            if (ddConcesionario1.getValue().toString().equals("06"))
                nomCon = "FCM";

            String PageReport =  Constants.darPathApp( this.getFacesContext() ) + "ReportEngine?NameFilter=XLS" +
                    "&P_IDCONC=" + ddConcesionario1.getValue().toString() +
                    "&P_TIPOREC=" + ddTipoRec.getValue().toString() +
                    "&P_PERIODO=" + textField1.getText().toString() +
                    "&P_NOMCON=" + nomCon +
                    "&P_NOMREC=" + nomRec;
                    
            PageReport = PageReport + "&rptfilename=" + "ControlTecho";
            
            ExternalContext externalContext = getFacesContext().getExternalContext();
            externalContext.redirect(PageReport);
            
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        
        
        return null;
    }

    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ConsTercero getConsTercero() {
        return (ConsTercero)getBean("ConsTercero");
    }
    
    
    
    
}

