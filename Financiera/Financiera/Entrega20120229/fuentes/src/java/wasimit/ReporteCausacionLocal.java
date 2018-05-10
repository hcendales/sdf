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
import com.sun.rave.web.ui.component.DropDown;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class ReporteCausacionLocal extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        ddFormatoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("CSV", "Excel"), new com.sun.rave.web.ui.model.Option("PDF", "PDF")});
        ddTipoRecaudoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("Seleccione", "Seleccione"), new com.sun.rave.web.ui.model.Option("Simit", "Simit"), new com.sun.rave.web.ui.model.Option("Polca", "Polca")});
        ddTipoCausaciónDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("Seleccione", "Seleccione"), new com.sun.rave.web.ui.model.Option("Gasto", "Gasto"), new com.sun.rave.web.ui.model.Option("Ingreso", "Ingreso")});
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
    
    private Calendar cfecFin = new Calendar();
    
    public Calendar getCfecFin() {
        return cfecFin;
    }
    
    public void setCfecFin(Calendar c) {
        this.cfecFin = c;
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

    private DropDown ddTipoRecaudo = new DropDown();

    public DropDown getDdTipoRecaudo() {
        return ddTipoRecaudo;
    }

    public void setDdTipoRecaudo(DropDown dd) {
        this.ddTipoRecaudo = dd;
    }

    private SingleSelectOptionsList ddTipoRecaudoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoRecaudoDefaultOptions() {
        return ddTipoRecaudoDefaultOptions;
    }

    public void setDdTipoRecaudoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoRecaudoDefaultOptions = ssol;
    }

    private DropDown ddTipoCausación = new DropDown();

    public DropDown getDdTipoCausación() {
        return ddTipoCausación;
    }

    public void setDdTipoCausación(DropDown dd) {
        this.ddTipoCausación = dd;
    }

    private SingleSelectOptionsList ddTipoCausaciónDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoCausaciónDefaultOptions() {
        return ddTipoCausaciónDefaultOptions;
    }

    public void setDdTipoCausaciónDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoCausaciónDefaultOptions = ssol;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private Label tipo_Causación = new Label();

    public Label getTipo_Causación() {
        return tipo_Causación;
    }

    public void setTipo_Causación(Label l) {
        this.tipo_Causación = l;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ReporteCausacionLocal() {
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
            String PageReport;
            
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
            Date fi = cfecIni.getSelectedDate();
            Date ff = cfecFin.getSelectedDate();
            
            if(this.ddTipoRecaudo.getValue().toString().equals("Seleccione"))
                throw new Exception("Debe seleccionar Tipo Recaudo");
            
            if(this.ddTipoCausación.getValue().toString().equals("Seleccione"))
                throw new Exception("Debe seleccionar Tipo Causación");
            
            //Validacion de la fecha
            if ( fi.compareTo(ff) > 0 )
                throw new Exception("Las Fecha Inicial Debe ser menor que la fecha Final");

         
            PageReport =  Constants.darPathApp( this.getFacesContext() ) + "ReportEngine?NameFilter=" + (String)ddFormato.getValue() +
                    "&P_FEC_INI=" + formatter.format(fi) +
                    "&P_FEC_FIN=" + formatter.format(ff) ;
            
            if(this.ddTipoCausación.getValue().toString().equals("Gasto")){
                if(ddTipoRecaudo.getValue().toString().equals("Simit"))
                    PageReport = PageReport + "&rptfilename=" + "CausacionGasSimitLocal";
                else if(ddTipoRecaudo.getValue().toString().equals("Polca"))
                    PageReport = PageReport + "&rptfilename=" +  "CausacionGasPolcaLocal";
            }
            
            if(this.ddTipoCausación.getValue().toString().equals("Ingreso")){
                if(ddTipoRecaudo.getValue().toString().equals("Simit"))
                    PageReport = PageReport + "&rptfilename=" + "CausacionIngSimitLocal";
                else if(ddTipoRecaudo.getValue().toString().equals("Polca"))
                    PageReport = PageReport + "&rptfilename=" +  "CausacionIngPolcaLocal";
            }
            
            ExternalContext externalContext = getFacesContext().getExternalContext();
                        
            externalContext.redirect(PageReport);
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        return null;
    }   
}

