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
import com.sun.rave.web.ui.component.Hyperlink;
import com.sun.rave.web.ui.component.ImageComponent;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.ImageHyperlink;
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
public class ConsNovedadesDiasDispersion extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        ddEstadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("TODOS", "TODOS"), new com.sun.rave.web.ui.model.Option("INGRESADA", "INGRESADA"), new com.sun.rave.web.ui.model.Option("VOBOFINANCIERA", "VOBOFINANCIERA"), new com.sun.rave.web.ui.model.Option("VOBOSIMIT", "VOBOSIMIT"), new com.sun.rave.web.ui.model.Option("VALIDADA", "VALIDADA"), new com.sun.rave.web.ui.model.Option("ACTIVADA", "ACTIVA"), new com.sun.rave.web.ui.model.Option("ANULADA", "ANULADA")});
        novdias_dispersionDataProvider.refresh();
        municipioDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet6}"));
        novdias_dispersionDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.novdias_dispersionRowSet}"));
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

    private Table table = new Table();

    public Table getTable() {
        return table;
    }

    public void setTable(Table t) {
        this.table = t;
    }

    private TableRowGroup tableRowGroup = new TableRowGroup();

    public TableRowGroup getTableRowGroup() {
        return tableRowGroup;
    }

    public void setTableRowGroup(TableRowGroup trg) {
        this.tableRowGroup = trg;
    }

    private CachedRowSetDataProvider novdias_dispersionDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getNovdias_dispersionDataProvider() {
        return novdias_dispersionDataProvider;
    }

    public void setNovdias_dispersionDataProvider(CachedRowSetDataProvider crsdp) {
        this.novdias_dispersionDataProvider = crsdp;
    }

    private TableColumn tableColumn5 = new TableColumn();

    public TableColumn getTableColumn5() {
        return tableColumn5;
    }

    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }

    private StaticText staticText5 = new StaticText();

    public StaticText getStaticText5() {
        return staticText5;
    }

    public void setStaticText5(StaticText st) {
        this.staticText5 = st;
    }

    private TableColumn tableColumn6 = new TableColumn();

    public TableColumn getTableColumn6() {
        return tableColumn6;
    }

    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }

    private StaticText staticText6 = new StaticText();

    public StaticText getStaticText6() {
        return staticText6;
    }

    public void setStaticText6(StaticText st) {
        this.staticText6 = st;
    }

    private TableColumn tableColumn7 = new TableColumn();

    public TableColumn getTableColumn7() {
        return tableColumn7;
    }

    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }

    private StaticText staticText7 = new StaticText();

    public StaticText getStaticText7() {
        return staticText7;
    }

    public void setStaticText7(StaticText st) {
        this.staticText7 = st;
    }

    private TableColumn tableColumn8 = new TableColumn();

    public TableColumn getTableColumn8() {
        return tableColumn8;
    }

    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }

    private Hyperlink hyperlink1 = new Hyperlink();

    public Hyperlink getHyperlink1() {
        return hyperlink1;
    }

    public void setHyperlink1(Hyperlink h) {
        this.hyperlink1 = h;
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

    private TableColumn tableColumn4 = new TableColumn();

    public TableColumn getTableColumn4() {
        return tableColumn4;
    }

    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }

    private StaticText staticText4 = new StaticText();

    public StaticText getStaticText4() {
        return staticText4;
    }

    public void setStaticText4(StaticText st) {
        this.staticText4 = st;
    }

    private TableColumn tableColumn9 = new TableColumn();

    public TableColumn getTableColumn9() {
        return tableColumn9;
    }

    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }

    private StaticText stNovedad = new StaticText();

    public StaticText getStNovedad() {
        return stNovedad;
    }

    public void setStNovedad(StaticText st) {
        this.stNovedad = st;
    }

    private DropDown ddEstado = new DropDown();

    public DropDown getDdEstado() {
        return ddEstado;
    }

    public void setDdEstado(DropDown dd) {
        this.ddEstado = dd;
    }

    private Label label1 = new Label();

    public Label getLabel1() {
        return label1;
    }

    public void setLabel1(Label l) {
        this.label1 = l;
    }

    private SingleSelectOptionsList ddEstadoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdEstadoDefaultOptions() {
        return ddEstadoDefaultOptions;
    }

    public void setDdEstadoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddEstadoDefaultOptions = ssol;
    }

    private CachedRowSetDataProvider municipioDataProvider1 = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getMunicipioDataProvider1() {
        return municipioDataProvider1;
    }

    public void setMunicipioDataProvider1(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider1 = crsdp;
    }

    private DropDown ddMunicipio = new DropDown();

    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }

    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
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
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsNovedadesDiasDispersion() {
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
        
        if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOFINANCIERA))
            this.ddEstadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {
                new com.sun.rave.web.ui.model.Option("seleccione", "Seleccione"),
                new com.sun.rave.web.ui.model.Option("INGRESADA", "INGRESADA") } );
        
        if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOSIMIT))
            this.ddEstadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {
                new com.sun.rave.web.ui.model.Option("seleccione", "Seleccione"),
                new com.sun.rave.web.ui.model.Option(Constants.VOBOFINANCIERA, Constants.VOBOFINANCIERA) } );
        
        if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOPOLCA))
            this.ddEstadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {
                new com.sun.rave.web.ui.model.Option("seleccione", "Seleccione"),
                new com.sun.rave.web.ui.model.Option(Constants.VOBOSIMIT, Constants.VOBOSIMIT) } );

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
      if ( this.isPostBack() )
            return;
        
        try {
            
            
            String valorFiltro = darFiltro();
            
            getSessionBean1().getNovdias_dispersionRowSet().setObject(
                    1, valorFiltro);
            getSessionBean1().getNovdias_dispersionRowSet().setObject(
                    2, "TODOS");
            getSessionBean1().getNovdias_dispersionRowSet().setObject(
                    3, "00000000");
            getSessionBean1().getNovdias_dispersionRowSet().setObject(
                    4, "00000000");
            
           this.novdias_dispersionDataProvider.refresh();
        } catch (Exception e) {
            error("Cannot switch to person INGRESADA" );
            log("Cannot switch to person INGRESADA", e);
        }
        
    }
    
    private String darFiltro() {
        String valorFiltro = "TODOS";
        
        if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOFINANCIERA))
            valorFiltro = "INGRESADA";
        
        if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOSIMIT))
            valorFiltro = Constants.VOBOFINANCIERA;
        
        if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOPOLCA))
            valorFiltro = Constants.VOBOSIMIT;
        
        return valorFiltro;
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
        novdias_dispersionDataProvider.close();
        municipioDataProvider1.close();
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
    
  

    public String hyperlink1_action() {
    try{
        getSessionBean1().setnovedad(stNovedad.getValue().toString());
        
        Application app = getApplication();
        NavigationHandler nav = app.getNavigationHandler();
        FacesContext fc = getFacesContext();
        nav.handleNavigation(fc,null,"detalle");
        return "";
    } catch (Exception e) {
        return e.toString();
    } finally {
        SQLTools.close(rs, cs, con);
    }
    }

     public void ddEstado_processValueChange(ValueChangeEvent vce) {
        // TODO: Replace with your code
        try {
            
            String valorFiltro = darFiltro();
                        
            if (ddEstado.getSelected() == null ) {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        1, valorFiltro);
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        2, "TODOS");
            } else {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        1, ddEstado.getSelected().toString());
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        2, ddEstado.getSelected().toString());
            }
            
            if (ddMunicipio.getSelected() == null ) {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        3, "00000000");
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        4, "00000000");
            } else {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        3, this.ddMunicipio.getSelected().toString());
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        4, this.ddMunicipio.getSelected().toString());
            }
            this.novdias_dispersionDataProvider.refresh();
         
        } catch (Exception e) {
            error("Cannot switch to person " +
                    ddEstado.getSelected());
            log("Cannot switch to person " +
                    ddEstado.getSelected(), e);
        }
        
    }
    
    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        try {
            
            String valorFiltro = darFiltro();
            
            if (ddEstado.getSelected() == null ) {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        1, valorFiltro);
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        2, "TODOS");
            } else {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        1, ddEstado.getSelected().toString());
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        2, ddEstado.getSelected().toString());
            }
            
            if (ddMunicipio.getSelected() == null ) {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        3, "00000000");
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        4, "00000000");
            } else {
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        3, this.ddMunicipio.getSelected().toString());
                getSessionBean1().getNovdias_dispersionRowSet().setObject(
                        4, this.ddMunicipio.getSelected().toString());
            }
            
             this.novdias_dispersionDataProvider.refresh();
             
        } catch (Exception e) {
            error("Cannot switch to person " +
                    ddEstado.getSelected());
            log("Cannot switch to person " +
                    ddEstado.getSelected(), e);
        }
        
    }
   
  
}

