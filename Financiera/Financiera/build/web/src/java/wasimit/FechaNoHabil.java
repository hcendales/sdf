/*
 * FechaNoHabil.java
 *
 * Created on 31 de octubre de 2007, 09:39 AM
 * Copyright DSOFTFIN
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
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
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
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
public class FechaNoHabil extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        fecha_no_habilDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.fecha_no_habilRowSet}"));
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
    
    private Calendar calendarfecnohab = new Calendar();
    
    public Calendar getCalendarfecnohab() {
        return calendarfecnohab;
    }
    
    public void setCalendarfecnohab(Calendar c) {
        this.calendarfecnohab = c;
    }
    
    private Button buttonfecnohabadd1 = new Button();
    
    public Button getButtonfecnohabadd1() {
        return buttonfecnohabadd1;
    }
    
    public void setButtonfecnohabadd1(Button b) {
        this.buttonfecnohabadd1 = b;
    }
    
    private Table table = new Table();
    
    public Table getTable() {
        return table;
    }
    
    public void setTable(Table t) {
        this.table = t;
    }
    
    private TableRowGroup tableRowGroup1 = new TableRowGroup();
    
    public TableRowGroup getTableRowGroup1() {
        return tableRowGroup1;
    }
    
    public void setTableRowGroup1(TableRowGroup trg) {
        this.tableRowGroup1 = trg;
    }
    
    private CachedRowSetDataProvider fecha_no_habilDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getFecha_no_habilDataProvider() {
        return fecha_no_habilDataProvider;
    }
    
    public void setFecha_no_habilDataProvider(CachedRowSetDataProvider crsdp) {
        this.fecha_no_habilDataProvider = crsdp;
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
    
    private Button btfecnohabdel = new Button();
    
    public Button getBtfecnohabdel() {
        return btfecnohabdel;
    }
    
    public void setBtfecnohabdel(Button b) {
        this.btfecnohabdel = b;
    }
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public FechaNoHabil() {
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
            log("FechaNoHabil Initialization Failure", e);
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
        
        try {
            
            com.sun.rave.web.ui.model.Option[] opt = new com.sun.rave.web.ui.model.Option[6];
            
            java.util.Calendar cal =  java.util.Calendar.getInstance();
            cal.setTime(new Date());
            
            String valor = "";
            
            for (int i=0; i<6; i++) {
                SimpleDateFormat fecha = new SimpleDateFormat("yyyy");
                valor = fecha.format(cal.getTime());
                opt[i] = new com.sun.rave.web.ui.model.Option( valor.substring(0,4), valor.substring(0,4) );
                cal.add(java.util.Calendar.YEAR, -1);
            }
            
            //this.dropDownfecnohabDefaultOptions.setOptions(opt);
            
        } catch (Exception e) {
            info(e.getMessage());
        }
        
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
        fecha_no_habilDataProvider.close();
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
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }
    
    public String buttonfecnohabadd_action() {
        // call procedure add fecha no habil
        try {
            
            if ( calendarfecnohab.getText() == null )
                throw new Exception ("Ingrese fecha no habil");
                        
            if(calendarfecnohab.getText().toString().length() == 0)
                throw new Exception ("Ingrese fecha no habil");

            java.util.Calendar cal =  java.util.Calendar.getInstance();
            
            Date fecha_ini = calendarfecnohab.getSelectedDate();
            cal.setTime(fecha_ini);
            
            int fecha_ini_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_ini_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_ini_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
            
            
            if ( fecha_ini_ano < 2000) 
                throw new Exception ("A�o debe ser superior a 2000");
            
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.fecnohabadd);
            
            // Cargamos los parametros de entrada IN
            cs.setInt(++pos, fecha_ini_ano );
            cs.setInt(++pos, fecha_ini_mes );
            cs.setInt(++pos, fecha_ini_dia );
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(5);
            info(resultado);
            
            calendarfecnohab.setText("");
            
            this.fecha_no_habilDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    
    public String btfecnohabdel_action() {
        // call procedure delete fecha no habil
        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.fecnohabdel);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos,(String)staticText1.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            // Ejecutamos
            cs.execute();
            // Captura los parametros de salida OUT
            resultado = cs.getString(3);
            info(resultado);
            calendarfecnohab.setText("");
            
            this.fecha_no_habilDataProvider.refresh();
            
        } catch (Exception e) {
           info( e.getMessage() ) ;
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    
}

