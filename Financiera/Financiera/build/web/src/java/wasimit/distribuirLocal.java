/*
 * liquida_recaudo_local.java
 *
 * Created on 16 de noviembre de 2007, 06:47 PM
 * Copyright DSOFTFIN
 */
package wasimit;

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
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class distribuirLocal extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        dbancoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("52", "Avvillas"), new com.sun.rave.web.ui.model.Option("51", "Davivienda"), new com.sun.rave.web.ui.model.Option("40", "Agrario"), new com.sun.rave.web.ui.model.Option("02", "Popular")});
        dbancoDefaultOptions.setSelectedValue("52");
        ddAutoridadDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("POLCA", "PONAL"), new com.sun.rave.web.ui.model.Option("SIMIT", "URBANO")});
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
    
    private Calendar calendarFecIni = new Calendar();
    
    public Calendar getCalendarFecIni() {
        return calendarFecIni;
    }
    
    public void setCalendarFecIni(Calendar c) {
        this.calendarFecIni = c;
    }
    
    private Calendar calendarFecFin = new Calendar();
    
    public Calendar getCalendarFecFin() {
        return calendarFecFin;
    }
    
    public void setCalendarFecFin(Calendar c) {
        this.calendarFecFin = c;
    }
    
    private Button btliquidarRL = new Button();
    
    public Button getBtliquidarRL() {
        return btliquidarRL;
    }
    
    public void setBtliquidarRL(Button b) {
        this.btliquidarRL = b;
    }
    
    private DropDown dbanco = new DropDown();
    
    public DropDown getDbanco() {
        return dbanco;
    }
    
    public void setDbanco(DropDown dd) {
        this.dbanco = dd;
    }
    
    private SingleSelectOptionsList dbancoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDbancoDefaultOptions() {
        return dbancoDefaultOptions;
    }
    
    public void setDbancoDefaultOptions(SingleSelectOptionsList ssol) {
        this.dbancoDefaultOptions = ssol;
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
    
    private DropDown ddAutoridad = new DropDown();
    
    public DropDown getDdAutoridad() {
        return ddAutoridad;
    }
    
    public void setDdAutoridad(DropDown dd) {
        this.ddAutoridad = dd;
    }
    
    private SingleSelectOptionsList ddAutoridadDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdAutoridadDefaultOptions() {
        return ddAutoridadDefaultOptions;
    }
    
    public void setDdAutoridadDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddAutoridadDefaultOptions = ssol;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public distribuirLocal() {
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
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
    
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
            log("liquida_recaudo_local Initialization Failure", e);
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
    protected SessionBean1 getSessionBean1() {
        return (SessionBean1)getBean("SessionBean1");
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
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
    }
    
    public String btliquidarRL_action() {
        // call procedure add fecha no habil
        
        try {
            
            if (this.calendarFecIni.getSelectedDate() == null)
                throw new Exception("Ingrese fecha inicial");
            
            if (this.calendarFecFin.getSelectedDate() == null)
                throw new Exception("Ingrese fecha final");
            
            java.util.Date f1 = this.calendarFecIni.getSelectedDate();
            java.util.Date f2 = this.calendarFecFin.getSelectedDate();
            
            if (f1.compareTo(f2) > 0 )
                throw new Exception("Fecha inicial debe ser menor a fecha final");
            
            con = Constants.getJdbcDataSource().getConnection();
            
            cs = con.prepareCall(Constants.distribuirLocal);
            
            // Cargamos los parametros de entrada IN
            
            
            java.sql.Date fecIni = new java.sql.Date(this.calendarFecIni.getSelectedDate().getTime());
            cs.setDate("p_fechaIni", fecIni);
            
            java.sql.Date fecFin = new java.sql.Date(this.calendarFecFin.getSelectedDate().getTime());
            cs.setDate("p_fechaFin", fecFin);
            
            cs.setString("p_banco", dbanco.getValue().toString());
            cs.setString("p_autoridad", ddAutoridad.getValue().toString());
            
            cs.setString("p_usuario", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_cod_error", java.sql.Types.NUMERIC);
            cs.registerOutParameter("p_msg_error", java.sql.Types.CHAR);
            
            // Ejecutamos
            
            cs.execute();
            
            info(cs.getString("p_msg_error"));
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    
    public void calendarFecIni_validate(FacesContext context, UIComponent component, Object value) {
        // TODO: Replace with your code
        
    }
}

