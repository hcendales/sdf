/*
 * ConsNovedades.java
 *
 * Created on 29 de enero de 2008, 04:03 PM
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
import com.sun.rave.web.ui.component.ImageComponent;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.faces.FacesException;
import javax.faces.convert.BigDecimalConverter;
import javax.faces.application.Application;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
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
public class ConsNovedades extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
    }
    
    private Page page = new Page();
    
    public Page getPage() {
        return page;
    }
    
    public void setPage(Page p) {
        this.page = p;
    }
    
    private Html html = new Html();
    
    public Html getHtml() {
        return html;
    }
    
    public void setHtml(Html h) {
        this.html = h;
    }
    
    private Head head = new Head();
    
    public Head getHead() {
        return head;
    }
    
    public void setHead(Head h) {
        this.head = h;
    }
    
    private Link link = new Link();
    
    public Link getLink() {
        return link;
    }
    
    public void setLink(Link l) {
        this.link = l;
    }
    
    private Body body = new Body();
    
    public Body getBody() {
        return body;
    }
    
    public void setBody(Body b) {
        this.body = b;
    }
    
    private Form form = new Form();
    
    public Form getForm() {
        return form;
    }
    
    public void setForm(Form f) {
        this.form = f;
    }

    private StaticText stopcion = new StaticText();

    public StaticText getStopcion() {
        return stopcion;
    }

    public void setStopcion(StaticText stidmenu) {
        this.stopcion = stidmenu;
    }

    private TextField tfidmenu = new TextField();

    public TextField getTfidmenu() {
        return tfidmenu;
    }

    public void setTfidmenu(TextField tf) {
        this.tfidmenu = tf;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private DropDown ddTipoNov = new DropDown();

    public DropDown getDdTipoNov() {
        return ddTipoNov;
    }

    public void setDdTipoNov(DropDown dd) {
        this.ddTipoNov = dd;
    }

    private SingleSelectOptionsList ddTipoNovDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoNovDefaultOptions() {
        return ddTipoNovDefaultOptions;
    }

    public void setDdTipoNovDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoNovDefaultOptions = ssol;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsNovedades() {
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
        //CJMM super.init();
        
        
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Menu Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
        
        // </editor-fold>
        // Perform application initialization that must complete
        // *after* managed components are initialized
        // TODO - add your own initialization code here
        ddTipoNovDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {
            new com.sun.rave.web.ui.model.Option("seleccione", "Seleccione"), 
            new com.sun.rave.web.ui.model.Option("municipio", "Municipios"),
            new com.sun.rave.web.ui.model.Option("diasdispersion", "Dias Dispersión"),
            new com.sun.rave.web.ui.model.Option("tercero", "Terceros"),
            new com.sun.rave.web.ui.model.Option("devolucion", "Devoluciones Usuario")
            //new com.sun.rave.web.ui.model.Option("validador", "Validador Fechas"), 
            //new com.sun.rave.web.ui.model.Option("devolucion", "Devoluciones"),
        });
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
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
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

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    CallableStatement cs = null;
    String resultado = null;
    int pos = 0;
    Object[] selectedArrayOld = new Object[getSessionBean1().getMenuRowSet1().size()];
    Object[] selectedArrayNew = new Object[getSessionBean1().getMenuRowSet1().size()];
    

    /*public String btConsultar_action() {
       
        try {
            Application app = getApplication();
            NavigationHandler nav = app.getNavigationHandler();
            FacesContext fc = getFacesContext();
            nav.handleNavigation(fc,null,ddTipoNov.getValue().toString());
                       
        } catch (Exception e) {
            e.printStackTrace();
            log(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;

    }¨*/

    public void ddTipoNov_processValueChange(ValueChangeEvent event) {
        try {
            if (!ddTipoNov.getSelected().toString().equals("seleccione")){
                Application app = getApplication();
                NavigationHandler nav = app.getNavigationHandler();
                FacesContext fc = getFacesContext();
                nav.handleNavigation(fc,null,ddTipoNov.getValue().toString());
            }
                       
        } catch (Exception e) {
            e.printStackTrace();
            log(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
    }
}

