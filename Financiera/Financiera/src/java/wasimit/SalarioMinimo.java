/*
 * Bancos.java
 *
 * Created on 28 de octubre de 2007, 23:35
 * Copyright Administrador
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
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
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.FacesException;
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
public class SalarioMinimo extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        salario_minimoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.salario_minimoRowSet}"));
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

    private StaticText stopcion = new StaticText();

    public StaticText getStopcion() {
        return stopcion;
    }

    public void setStopcion(StaticText st) {
        this.stopcion = st;
    }

    private TextField tfanosalmin = new TextField();

    public TextField getTfanosalmin() {
        return tfanosalmin;
    }

    public void setTfanosalmin(TextField tf) {
        this.tfanosalmin = tf;
    }

    private TextField tfvalorsalmin = new TextField();

    public TextField getTfvalorsalmin() {
        return tfvalorsalmin;
    }

    public void setTfvalorsalmin(TextField tf) {
        this.tfvalorsalmin = tf;
    }

    private Button buttonsalminadd = new Button();

    public Button getButtonsalminadd() {
        return buttonsalminadd;
    }

    public void setButtonsalminadd(Button b) {
        this.buttonsalminadd = b;
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

    private CachedRowSetDataProvider salario_minimoDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getSalario_minimoDataProvider() {
        return salario_minimoDataProvider;
    }

    public void setSalario_minimoDataProvider(CachedRowSetDataProvider crsdp) {
        this.salario_minimoDataProvider = crsdp;
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

    private TableColumn tableColumn3 = new TableColumn();

    public TableColumn getTableColumn3() {
        return tableColumn3;
    }

    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }

    private Button btsalmindel = new Button();

    public Button getBtsalmindel() {
        return btsalmindel;
    }

    public void setBtsalmindel(Button b) {
        this.btsalmindel = b;
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
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public SalarioMinimo() {
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
            log("Bancos Initialization Failure", e);
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
        salario_minimoDataProvider.close();
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

    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }

    public String buttonsalminadd_action() {
    
    try {
        
        if (tfanosalmin.getText() == null)
            throw new Exception("Ingrese el a�o");

        if (tfanosalmin.getText().toString().length() == 0l)
            throw new Exception("Ingrese el a�o");

        
        try{
            int x = Integer.parseInt((String) tfanosalmin.getText());
            if ( x < 2000 )
                throw new Exception("A�o incorecto");
        } catch ( NumberFormatException e ) {
            throw new Exception("El a�o debe ser numerico");
        }
        
        if (tfvalorsalmin.getText() == null)
                throw new Exception("Ingrese el salario minimo");
        
        if (tfvalorsalmin.getText().toString().length() == 0)
                throw new Exception("Ingrese el salario minimo");
       
         try{
             double y = Double.parseDouble((String)tfvalorsalmin.getText());
             if (y < 1000)
                 throw new Exception("Valor Salario minimo demasiado peque�o");
         } catch ( NumberFormatException e ) {
             throw new Exception("El salario minimo debe ser numerico");
         }
         
       
        con = getJdbcDataSource().getConnection();
        cs = con.prepareCall(Constants.salminadd);
        
        // Cargamos los parametros de entrada IN
        cs.setString(++pos, (String)tfanosalmin.getText());
        cs.setString(++pos, (String)tfvalorsalmin.getText());
        cs.setString(++pos, getSessionBean1().getUser());
        
        // Registramos los parametro de salida OUT
        cs.registerOutParameter(++pos, java.sql.Types.CHAR);
        
        // Ejecutamos
        cs.execute();
        
        // Captura los parametros de salida OUT
        resultado = cs.getString(4);

        info(resultado);
        
        
        tfanosalmin.setText("");
        tfvalorsalmin.setText("");
        
        this.salario_minimoDataProvider.refresh();
    } 

    catch (Exception e) {
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

    public String btsalmindel_action() {
    try {
        con = getJdbcDataSource().getConnection();
        cs = con.prepareCall(Constants.salmindel);
        
        // Cargamos los parametros de entrada IN
        cs.setString(++pos, staticText1.getValue().toString());
        cs.setString(++pos, getSessionBean1().getUser());
        // Registramos los parametro de salida OUT
        cs.registerOutParameter(++pos, java.sql.Types.CHAR);
        // Ejecutamos
        cs.execute();
        // Captura los parametros de salida OUT
        resultado = cs.getString(3);
        
        info(resultado);
        
        tfanosalmin.setText("");
        tfvalorsalmin.setText("");

        
        this.salario_minimoDataProvider.refresh();
        
    } catch (Exception e) {
        info(e.getMessage());
    } finally {
        SQLTools.close(rs, cs, con);
    }
    return resultado;
    }


}

