/*
 * rptLiqSimitLoc.java
 *
 * Created on 28 de noviembre de 2007, 02:30 PM
 * Copyright DSOF    private CachedRowSetXImpl municipioRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getMunicipioRowSet() {
        return municipioRowSet;
    }

    public void setMunicipioRowSet(CachedRowSetXImpl crsxi) {
        this.municipioRowSet = crsxi;
    }

 TFIN
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
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.model.DefaultOptionsList;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.context.ExternalContext;
import javax.faces.event.ValueChangeEvent;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class ReporteDistOTCom extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        ddFormatoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("CSV", "Excel"), new com.sun.rave.web.ui.model.Option("PDF", "PDF")});
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet6}"));
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
    
    private Calendar cfecIni = new Calendar();
    
    public Calendar getCfecIni() {
        return cfecIni;
    }
    
    public void setCfecIni(Calendar c) {
        this.cfecIni = c;
    }
    
    private DropDown ddFormato = new DropDown();
    
    public DropDown getDdFormato() {
        return ddFormato;
    }
    
    public void setDdFormato(DropDown dd) {
        this.ddFormato = dd;
    }
    
    private SingleSelectOptionsList ddFormatoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFormatoDefaultOptions() {
        return ddFormatoDefaultOptions;
    }
    
    public void setDdFormatoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFormatoDefaultOptions = ssol;
    }
    
    private Button btReport = new Button();
    
    public Button getBtReport() {
        return btReport;
    }
    
    public void setBtReport(Button b) {
        this.btReport = b;
    }
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private Checkbox checkbox = new Checkbox();
    
    public Checkbox getCheckbox() {
        return checkbox;
    }
    
    public void setCheckbox(Checkbox c) {
        this.checkbox = c;
    }
    
    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
    }

    private Label label6 = new Label();

    public Label getLabel6() {
        return label6;
    }

    public void setLabel6(Label l) {
        this.label6 = l;
    }

    private Calendar cfecFin = new Calendar();

    public Calendar getCfecFin() {
        return cfecFin;
    }

    public void setCfecFin(Calendar c) {
        this.cfecFin = c;
    }

    private Label label7 = new Label();

    public Label getLabel7() {
        return label7;
    }

    public void setLabel7(Label l) {
        this.label7 = l;
    }

    private Listbox listbox1 = new Listbox();

    public Listbox getListbox1() {
        return listbox1;
    }

    public void setListbox1(Listbox l) {
        this.listbox1 = l;
    }

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ReporteDistOTCom() {
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
    
    public String btReport_action() {
        try {
            // TODO: Process the button click action. Return value is a navigation
            // case name where null will return to the same page.
            String [] listaMun = (String [])this.listbox1.getSelected();
            if (listaMun == null)
                throw new Exception("Seleccione Municipios(s)");
            
            if (listaMun.length == 0 )
               throw new Exception("Seleccione Municipios(s)");
   
            String municipio = "";
            
            for( int i=0; i < listaMun.length; i++ )
                municipio += "|" + listaMun[i];
            
            if (listaMun.length > 1)
                if (municipio.contains("TODOS"))
                    throw new Exception("No se permite seleccion multiple en municipio con TODOS");

            if (listaMun.length > 50)
               throw new Exception("Seleccion demasiado grande");
        
            
            String PageReport;
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
            Date fi = cfecIni.getSelectedDate();
            Date ff = cfecFin.getSelectedDate();
            Date ac = new Date();
            
            PageReport =  Constants.darPathApp(this.getFacesContext()) + "ReportEngine?NameFilter=" + (String)ddFormato.getValue() +
                    "&P_FEC_INI=" + formatter.format(fi) +
                    "&P_FEC_FIN=" + formatter.format(ff) + 
                    "&P_FEC_IMP=" + formatter.format(ac) + 
                    "&P_MUNICIPIO=" + municipio;
            
                                
            if (  checkbox.getValue() == null  )
               PageReport = PageReport + "&rptfilename=" + "DistOTDetalladaCom";
            else
               PageReport = PageReport + "&rptfilename=" + "DistOTTotalizadaCom";
    
            ExternalContext externalContext = getFacesContext().getExternalContext();
            externalContext.redirect(PageReport);
            
            return "";
        } 
        catch (Exception ex) {
            info(ex.getMessage());
        }
        
        return "";
    }

    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        
    }
}
