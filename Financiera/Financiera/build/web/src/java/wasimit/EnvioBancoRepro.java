/*
 * LiquidarExterno.java
 *
 * Created on November 21, 2007, 8:36 AM
 * Copyright cristina
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
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.util.Date;
import javax.faces.FacesException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.swing.text.html.Option;
import oracle.jdbc.OracleTypes;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class EnvioBancoRepro extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        ddBancoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99", "Seleccione"), new com.sun.rave.web.ui.model.Option("52", "Avvillas"), new com.sun.rave.web.ui.model.Option("51", "Davivienda"), new com.sun.rave.web.ui.model.Option("01", "Bogota")});
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

    private Button btLiquidar = new Button();

    public Button getBtLiquidar() {
        return btLiquidar;
    }

    public void setBtLiquidar(Button b) {
        this.btLiquidar = b;
    }

    private Calendar clFechaIni = new Calendar();

    public Calendar getClFechaIni() {
        return clFechaIni;
    }

    public void setClFechaIni(Calendar c) {
        this.clFechaIni = c;
    }

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
    }

    private TextArea logAvvillas = new TextArea();

    public TextArea getLogAvvillas() {
        return logAvvillas;
    }

    public void setLogAvvillas(TextArea ta) {
        this.logAvvillas = ta;
    }

    private DropDown ddBanco = new DropDown();

    public DropDown getDdBanco() {
        return ddBanco;
    }

    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
    }

    private SingleSelectOptionsList ddBancoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdBancoDefaultOptions() {
        return ddBancoDefaultOptions;
    }

    public void setDdBancoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddBancoDefaultOptions = ssol;
    }

    private Label label3 = new Label();

    public Label getLabel3() {
        return label3;
    }

    public void setLabel3(Label l) {
        this.label3 = l;
    }

    private Button btLog = new Button();

    public Button getBtLog() {
        return btLog;
    }

    public void setBtLog(Button b) {
        this.btLog = b;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private Calendar clFechaFin = new Calendar();

    public Calendar getClFechaFin() {
        return clFechaFin;
    }

    public void setClFechaFin(Calendar c) {
        this.clFechaFin = c;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public EnvioBancoRepro() {
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
            log("LiquidarExterno Initialization Failure", e);
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
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
  
   
    public String btLiquidar_action() {
        // TODO: Replace with your code
        
        try {
            if (ddBanco.getSelected() == null)
                throw new Exception("Favor seleccione banco a procesar");
            
            if (ddBanco.getSelected().toString().equals("99"))
                throw new Exception("Favor seleccione banco a procesar");
          
            if (this.clFechaIni.getSelectedDate() == null)
                throw new Exception("Seleccione Fecha Transferencia Inicial");
          
            if (this.clFechaFin.getSelectedDate() == null)
                throw new Exception("Seleccione Fecha Transferencia Final");
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.envioBancoRepro);
            
            java.util.Calendar cal =  java.util.Calendar.getInstance();
            
            Date fecha_ini = this.clFechaIni.getSelectedDate();
            cal.setTime(fecha_ini);
      
            
            int fecha_ini_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_ini_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_ini_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
            
            cs.setInt(++pos, fecha_ini_ano );
            cs.setInt(++pos, fecha_ini_mes );
            cs.setInt(++pos, fecha_ini_dia );
            
            Date fecha_fin = this.clFechaFin.getSelectedDate();
            cal.setTime(fecha_fin);
      
            
            int fecha_fin_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_fin_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_fin_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
            
            cs.setInt(++pos, fecha_fin_ano );
            cs.setInt(++pos, fecha_fin_mes );
            cs.setInt(++pos, fecha_fin_dia );
       
            cs.setString(++pos,ddBanco.getSelected().toString());
            cs.setString(++pos, getSessionBean1().getUser());
       
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            
            
            // Ejecutamos
            cs.execute();

            // Captura los parametros de salida OUT
            resultado = cs.getString(9);
            
            String log = "";
            log = cs.getString(10);
            
            logAvvillas.setText(cs.getString(10));
           
            if (!resultado.contains("OK")){
                info(resultado);
                return "";
            }
           
            info("Proceso Enviado a bancos Correctamente. " + resultado);
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return null;
    }

    public String btLog_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
    try {
            if (ddBanco.getSelected() == null)
                throw new Exception("Favor seleccione banco a procesar");
            
            if (ddBanco.getSelected().toString().equals("99"))
                throw new Exception("Favor seleccione banco a procesar");
          
            con = getJdbcDataSource().getConnection();
            
            if (ddBanco.getSelected().toString().equals("52"))
                cs = con.prepareCall(Constants.verLogEnvioAvvillas);
            
            if (ddBanco.getSelected().toString().equals("50"))
                cs = con.prepareCall(Constants.verLogEnvioDavivienda);
           
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            
            
            // Ejecutamos
            cs.execute();

            // Captura los parametros de salida OUT
            resultado = cs.getString(1);
            
            String log = "";
            log = cs.getString(1);
            
            logAvvillas.setText(cs.getString(1));
           
            info("Consulta log correcta ");
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return null;

    }

  
}

