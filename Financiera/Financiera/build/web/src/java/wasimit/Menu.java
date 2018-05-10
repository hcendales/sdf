/*
 * Menu.java
 *
 * Created on 29 de enero de 2008, 04:03 PM
 * Copyright DSOFTFIN
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
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
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.faces.FacesException;
import javax.faces.convert.BigDecimalConverter;
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
public class Menu extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        padreDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.padreRowSet}"));
        menuDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.menuRowSet1}"));
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

    private Button btActualizar = new Button();

    public Button getBtActualizar() {
        return btActualizar;
    }

    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }

    private StaticText stopcion = new StaticText();

    public StaticText getStopcion() {
        return stopcion;
    }

    public void setStopcion(StaticText stidmenu) {
        this.stopcion = stidmenu;
    }

    private TextField tfnombremenu = new TextField();

    public TextField getTfnombremenu() {
        return tfnombremenu;
    }

    public void setTfnombremenu(TextField tf) {
        this.tfnombremenu = tf;
    }

    private TextField tfidmenu = new TextField();

    public TextField getTfidmenu() {
        return tfidmenu;
    }

    public void setTfidmenu(TextField tf) {
        this.tfidmenu = tf;
    }

    private Checkbox cbhabil = new Checkbox();

    public Checkbox getCbhabil() {
        return cbhabil;
    }

    public void setCbhabil(Checkbox c) {
        this.cbhabil = c;
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

    private TextField tfpage = new TextField();

    public TextField getTfpage() {
        return tfpage;
    }

    public void setTfpage(TextField tf) {
        this.tfpage = tf;
    }

    private DropDown ddpadre = new DropDown();

    public DropDown getDdpadre() {
        return ddpadre;
    }

    public void setDdpadre(DropDown dd) {
        this.ddpadre = dd;
    }

    private CachedRowSetDataProvider padreDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getPadreDataProvider() {
        return padreDataProvider;
    }

    public void setPadreDataProvider(CachedRowSetDataProvider crsdp) {
        this.padreDataProvider = crsdp;
    }

    private CachedRowSetDataProvider menuDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getMenuDataProvider() {
        return menuDataProvider;
    }

    public void setMenuDataProvider(CachedRowSetDataProvider crsdp) {
        this.menuDataProvider = crsdp;
    }

    private TableColumn tcidmenu = new TableColumn();

    public TableColumn getTcidmenu() {
        return tcidmenu;
    }

    public void setTcidmenu(TableColumn tc) {
        this.tcidmenu = tc;
    }

    private StaticText stidmenu = new StaticText();

    public StaticText getStidmenu() {
        return stidmenu;
    }

    public void setStidmenu(StaticText st) {
        this.stidmenu = st;
    }

    private TableColumn tcnombre = new TableColumn();

    public TableColumn getTcnombre() {
        return tcnombre;
    }

    public void setTcnombre(TableColumn tc) {
        this.tcnombre = tc;
    }

    private StaticText stnombre = new StaticText();

    public StaticText getStnombre() {
        return stnombre;
    }

    public void setStnombre(StaticText st) {
        this.stnombre = st;
    }

    private TableColumn tcpagina = new TableColumn();

    public TableColumn getTcpagina() {
        return tcpagina;
    }

    public void setTcpagina(TableColumn tc) {
        this.tcpagina = tc;
    }

    private StaticText stpagina = new StaticText();

    public StaticText getStpagina() {
        return stpagina;
    }

    public void setStpagina(StaticText st) {
        this.stpagina = st;
    }

    private TableColumn tcidpadre = new TableColumn();

    public TableColumn getTcidpadre() {
        return tcidpadre;
    }

    public void setTcidpadre(TableColumn tc) {
        this.tcidpadre = tc;
    }

    private StaticText stidpadre = new StaticText();

    public StaticText getStidpadre() {
        return stidpadre;
    }

    public void setStidpadre(StaticText st) {
        this.stidpadre = st;
    }

    private TableColumn tcenablemenu = new TableColumn();

    public TableColumn getTcenablemenu() {
        return tcenablemenu;
    }

    public void setTcenablemenu(TableColumn tc) {
        this.tcenablemenu = tc;
    }

    private StaticText stenablemenu = new StaticText();

    public StaticText getStenablemenu() {
        return stenablemenu;
    }

    public void setStenablemenu(StaticText st) {
        this.stenablemenu = st;
    }

    private TableColumn tcnamepadre = new TableColumn();

    public TableColumn getTcnamepadre() {
        return tcnamepadre;
    }

    public void setTcnamepadre(TableColumn tc) {
        this.tcnamepadre = tc;
    }

    private StaticText stnamepadre = new StaticText();

    public StaticText getStnamepadre() {
        return stnamepadre;
    }

    public void setStnamepadre(StaticText st) {
        this.stnamepadre = st;
    }

    private TableColumn tcedit = new TableColumn();

    public TableColumn getTcedit() {
        return tcedit;
    }

    public void setTcedit(TableColumn tc) {
        this.tcedit = tc;
    }

    private Button btEditar = new Button();

    public Button getBtEditar() {
        return btEditar;
    }

    public void setBtEditar(Button b) {
        this.btEditar = b;
    }

    private BigDecimalConverter ddpadreConverter = new BigDecimalConverter();

    public BigDecimalConverter getDdpadreConverter() {
        return ddpadreConverter;
    }

    public void setDdpadreConverter(BigDecimalConverter bdc) {
        this.ddpadreConverter = bdc;
    }

    private ImageComponent imageActivo = new ImageComponent();

    public ImageComponent getImageActivo() {
        return imageActivo;
    }

    public void setImageActivo(ImageComponent ic) {
        this.imageActivo = ic;
    }

    private TableColumn tableColumn1 = new TableColumn();

    public TableColumn getTableColumn1() {
        return tableColumn1;
    }

    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }

    private Button beliminar = new Button();

    public Button getBeliminar() {
        return beliminar;
    }

    public void setBeliminar(Button b) {
        this.beliminar = b;
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
    public Menu() {
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
            log("Menu Initialization Failure", e);
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
        padreDataProvider.close();
        menuDataProvider.close();
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
    CallableStatement cs = null;
    String resultado = null;
    int pos = 0;
    Object[] selectedArrayOld = new Object[getSessionBean1().getMenuRowSet1().size()];
    Object[] selectedArrayNew = new Object[getSessionBean1().getMenuRowSet1().size()];
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }

    public String btEditar_action() {
        info("Consulta exitosa");
        btActualizar.setText("Actualizar");
        tfidmenu.setText(stidmenu.getValue());
        tfnombremenu.setText(stnombre.getValue());
        tfpage.setText(stpagina.getValue());
        if(stenablemenu.getValue().toString().equalsIgnoreCase("1"))
            cbhabil.setValue("true");
        ddpadre.setValue((BigDecimal)stidpadre.getValue());
        return null;
 
    }

    public String btActualizar_action() {
        try {
            
            if (tfnombremenu.getText() == null)
                throw new Exception("Ingrese Nombre de menu");
            
            if (tfnombremenu.getText().toString().length() == 0)
                throw new Exception("Ingrese Nombre de menu");
                     
            if (tfpage.getText() == null)
                throw new Exception("Ingrese pagina asociada");
            
            if (tfpage.getText().toString().length() == 0)
                throw new Exception("Ingrese pagina asociada");

            con = getJdbcDataSource().getConnection();

            if(btActualizar.getText().toString().equalsIgnoreCase("Adicionar")) {
                cs = con.prepareCall(Constants.menuadd);
                tfidmenu.setText("");
            }
            else
                cs = con.prepareCall(Constants.menumod);

            // Cargamos los parametros de entrada IN
            cs.setString(++pos, tfidmenu.getText().toString());
            cs.setString(++pos, tfnombremenu.getText().toString());
            cs.setString(++pos, tfpage.getText().toString());
            cs.setBigDecimal(++pos, (BigDecimal) ddpadre.getValue());
            if (cbhabil.isChecked())
                cs.setString(++pos, "1");
            else
                cs.setString(++pos, "0");
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(pos);

            info(resultado);
            
            if (!resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK))
                return "";
                
            
            menuDataProvider.refresh();
            
            btActualizar.setText("Adicionar");
            tfnombremenu.setText("");
            tfpage.setText("");
            cbhabil.setValue("false");
            
        } catch (Exception e) {
           info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;

    }

    public String beliminar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            // Cargamos los parametros de entrada IN
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.menueli);
            
            // Cargamos los parametros de entrada IN
            cs.setString(1, stidmenu.getText().toString());
            cs.setString(2, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(3, java.sql.Types.CHAR);
            // Ejecutamos
            cs.execute();
            // Captura los parametros de salida OUT
            resultado = cs.getString(3);
            info(resultado);
            
  /*          if (!resultado.equals(Constants.MSG_DEL_OK) )
                return "";
    */       
            
            this.menuDataProvider.refresh();
                  
            
        } catch (Exception e) {
            info( e.getMessage() ) ;
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
}

