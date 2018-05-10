/*
 * LiquidarExterno.java
 *
 * Created on November 21, 2007, 8:36 AM
 * Copyright cristina
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
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.PanelLayout;
import com.sun.rave.web.ui.component.RadioButtonGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Tab;
import com.sun.rave.web.ui.component.TabSet;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.math.BigDecimal;
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
public class PagoFondo extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        pagofondoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.pagofondoRowSet}"));
        ddTipoRecDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("E", "Externo"), new com.sun.rave.web.ui.model.Option("L", "Local")});
        vw_cuentaorigendevDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_cuentaorigenlocRowSet1}"));
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

    private Calendar cfechaIni = new Calendar();

    public Calendar getCfechaIni() {
        return cfechaIni;
    }

    public void setCfechaIni(Calendar c) {
        this.cfechaIni = c;
    }

    private Calendar cfechaFin = new Calendar();

    public Calendar getCfechaFin() {
        return cfechaFin;
    }

    public void setCfechaFin(Calendar c) {
        this.cfechaFin = c;
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

    private Button button1 = new Button();

    public Button getButton1() {
        return button1;
    }

    public void setButton1(Button b) {
        this.button1 = b;
    }

    private CachedRowSetDataProvider pagofondoDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getPagofondoDataProvider() {
        return pagofondoDataProvider;
    }

    public void setPagofondoDataProvider(CachedRowSetDataProvider crsdp) {
        this.pagofondoDataProvider = crsdp;
    }

    private TabSet tabSet1 = new TabSet();

    public TabSet getTabSet1() {
        return tabSet1;
    }

    public void setTabSet1(TabSet ts) {
        this.tabSet1 = ts;
    }

    private Tab tab1 = new Tab();

    public Tab getTab1() {
        return tab1;
    }

    public void setTab1(Tab t) {
        this.tab1 = t;
    }

    private PanelLayout layoutPanel1 = new PanelLayout();

    public PanelLayout getLayoutPanel1() {
        return layoutPanel1;
    }

    public void setLayoutPanel1(PanelLayout pl) {
        this.layoutPanel1 = pl;
    }

    private Tab tab2 = new Tab();

    public Tab getTab2() {
        return tab2;
    }

    public void setTab2(Tab t) {
        this.tab2 = t;
    }

    private PanelLayout layoutPanel2 = new PanelLayout();

    public PanelLayout getLayoutPanel2() {
        return layoutPanel2;
    }

    public void setLayoutPanel2(PanelLayout pl) {
        this.layoutPanel2 = pl;
    }

    private Table table1 = new Table();

    public Table getTable1() {
        return table1;
    }

    public void setTable1(Table t) {
        this.table1 = t;
    }

    private TableRowGroup tableRowGroup1 = new TableRowGroup();

    public TableRowGroup getTableRowGroup1() {
        return tableRowGroup1;
    }

    public void setTableRowGroup1(TableRowGroup trg) {
        this.tableRowGroup1 = trg;
    }

    private TableColumn tableColumn1 = new TableColumn();

    public TableColumn getTableColumn1() {
        return tableColumn1;
    }

    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }

    private StaticText sfechaAplic = new StaticText();

    public StaticText getSfechaAplic() {
        return sfechaAplic;
    }

    public void setSfechaAplic(StaticText st) {
        this.sfechaAplic = st;
    }

    private TableColumn tableColumn2 = new TableColumn();

    public TableColumn getTableColumn2() {
        return tableColumn2;
    }

    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }

    private StaticText stipoRecaudo = new StaticText();

    public StaticText getStipoRecaudo() {
        return stipoRecaudo;
    }

    public void setStipoRecaudo(StaticText st) {
        this.stipoRecaudo = st;
    }

    private TableColumn tableColumn3 = new TableColumn();

    public TableColumn getTableColumn3() {
        return tableColumn3;
    }

    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }

    private StaticText scuenta = new StaticText();

    public StaticText getScuenta() {
        return scuenta;
    }

    public void setScuenta(StaticText st) {
        this.scuenta = st;
    }

    private TableColumn tableColumn4 = new TableColumn();

    public TableColumn getTableColumn4() {
        return tableColumn4;
    }

    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }

    private StaticText svalor = new StaticText();

    public StaticText getSvalor() {
        return svalor;
    }

    public void setSvalor(StaticText st) {
        this.svalor = st;
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

    private Button button2 = new Button();

    public Button getButton2() {
        return button2;
    }

    public void setButton2(Button b) {
        this.button2 = b;
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

    private DropDown ddCuenta = new DropDown();

    public DropDown getDdCuenta() {
        return ddCuenta;
    }

    public void setDdCuenta(DropDown dd) {
        this.ddCuenta = dd;
    }

    private Calendar cfecApli = new Calendar();

    public Calendar getCfecApli() {
        return cfecApli;
    }

    public void setCfecApli(Calendar c) {
        this.cfecApli = c;
    }

    private TextField txtValor = new TextField();

    public TextField getTxtValor() {
        return txtValor;
    }

    public void setTxtValor(TextField tf) {
        this.txtValor = tf;
    }

    private Label label3 = new Label();

    public Label getLabel3() {
        return label3;
    }

    public void setLabel3(Label l) {
        this.label3 = l;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private Button bagregar = new Button();

    public Button getBagregar() {
        return bagregar;
    }

    public void setBagregar(Button b) {
        this.bagregar = b;
    }

    private Label label5 = new Label();

    public Label getLabel5() {
        return label5;
    }

    public void setLabel5(Label l) {
        this.label5 = l;
    }

    private Label label6 = new Label();

    public Label getLabel6() {
        return label6;
    }

    public void setLabel6(Label l) {
        this.label6 = l;
    }

    private CachedRowSetDataProvider vw_cuentaorigendevDataProvider1 = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_cuentaorigendevDataProvider1() {
        return vw_cuentaorigendevDataProvider1;
    }

    public void setVw_cuentaorigendevDataProvider1(CachedRowSetDataProvider crsdp) {
        this.vw_cuentaorigendevDataProvider1 = crsdp;
    }

    private TableColumn tableColumn9 = new TableColumn();

    public TableColumn getTableColumn9() {
        return tableColumn9;
    }

    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }

    private StaticText stIdReg = new StaticText();

    public StaticText getStIdReg() {
        return stIdReg;
    }

    public void setStIdReg(StaticText st) {
        this.stIdReg = st;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public PagoFondo() {
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
        /*
        if ( ! this.isPostBack() )
            bconsultar_action();
*/
    }

        public String bconsultar_action() {
        
  /*      try {
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.fondoQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString("v_usuario", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("v_idbanco", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_tipocuenta", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_nit", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_error", java.sql.Types.VARCHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString("v_error");
            info(resultado);
            
            if (resultado.equals("NO EXISTE REGISTRO") )
                return "";
                
            this.ddBanco.setValue((String)cs.getString("v_idbanco"));
            this.ddTipo.setValue((String)cs.getString("v_tipocuenta"));
            this.tcuenta.setText (cs.getString("v_cuenta"));
            this.tnit.setText (cs.getString("v_nit"));
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        } */
        return "";
        
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
        pagofondoDataProvider.close();
        vw_cuentaorigendevDataProvider1.close();
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
    
    
    public String btActualizar_action() {
        // TODO: Replace with your code
        
        try {
        /*
            if (ddBanco.getValue().toString() == "00")
                throw new Exception("Favor seleccione banco");
            
            if (tnit.getText() == null)
                throw new Exception("Favor ingrese NIT");
                
            if (tnit.getText().toString().length() == 0)
                throw new Exception("Favor ingrese NIT");
            
            if (tnit.getText().toString().length() != 10)
                throw new Exception("Verifique NIT");
            
            try {
                double vlr = Double.parseDouble(tnit.getText().toString());
            }
            catch (Exception er)
            {
                throw new Exception("NIT no numerico");
            }
            
            if (tcuenta.getText() == null)
                throw new Exception("Favor ingrese CUENTA");
                
            if (tnit.getText().toString().length() == 0)
                throw new Exception("Favor ingrese CUENTA");
            
            
            try {
                double vlr = Double.parseDouble(tcuenta.getText().toString());
            }
            catch (Exception er)
            {
                throw new Exception("CUENTA no numerico");
            }
            
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.fondoAct);
            
            cs.setString("v_usuario", getSessionBean1().getUser());
            cs.setString("v_idbanco", ddBanco.getValue().toString());
            cs.setString("v_tipocuenta", ddTipo.getValue().toString());
            cs.setString("v_cuenta", tcuenta.getText().toString());
            cs.setString("v_nit", tnit.getText().toString());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("v_error", java.sql.Types.VARCHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString("v_error");
            
            info(resultado);
          */  
           
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
        
        return null;
    }

    public String tab1_action() {
        // TODO: Replace with your code
        
        return null;
    }

    public String tab2_action() {
        // TODO: Replace with your code
        
        return null;
    }


    public String bagregar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try
        {
            if (cfecApli.getValue() == null)
                throw new Exception("Favor ingrese fecha de aplicacion");
            
            if (txtValor.getText() == null)
                throw new Exception("Favor ingrese valor");
            
            if (txtValor.getText().toString().length() == 0)
                throw new Exception("Favor ingrese valor");
            
            try {
                double vlr = Double.parseDouble(txtValor.getText().toString());
            }
            catch (Exception e)
            {
                throw new Exception("Valor no numerico");
            
            }
            
            con = Constants.getJdbcDataSource().getConnection();
            
            cs = con.prepareCall(Constants.PagoFonAdd);
            
            java.sql.Date fec = new java.sql.Date(cfecApli.getSelectedDate().getTime());

            cs.setDate("V_FECHAAPLICACION", fec);
            cs.setString("V_TIPORECAUDO", ddTipoRec.getValue().toString());
            cs.setString("V_CUENTAORIGEN", ddCuenta.getValue().toString());
            cs.setDouble("V_VALOR", Double.parseDouble(txtValor.getValue().toString()));
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            cs.registerOutParameter("V_ERROR", java.sql.Types.CHAR);
            
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString("V_ERROR");
            info(resultado);
            
            if (!resultado.equals(Constants.MSG_INS_OK))
                throw new Exception("Operacion Fallida");
            
            this.pagofondoDataProvider.refresh();
            this.tabSet1.setSelected(tab1.getId());
            
            

        }
        catch (Exception e)
        {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return null;
    }

    public String button2_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try
        {
            
            con = Constants.getJdbcDataSource().getConnection();
            
            cs = con.prepareCall(Constants.PagoFonDel);
            
            cs.setBigDecimal("V_IDREG", new BigDecimal( stIdReg.getValue().toString() ) );
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            cs.registerOutParameter("V_ERROR", java.sql.Types.CHAR);
            
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString("V_ERROR");
            info(resultado);
            
            if (!resultado.equals(Constants.MSG_DEL_OK))
                throw new Exception("Operacion Fallida");
            
            this.pagofondoDataProvider.refresh();
            this.tabSet1.setSelected(tab1.getId());
            
            

        }
        catch (Exception e)
        {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return null;
    }
    
    
}

