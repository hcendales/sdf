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
import com.sun.rave.web.ui.component.Checkbox;
import com.sun.rave.web.ui.component.DropDown;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.RadioButtonGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.sql.SQLException;
import java.util.Date;
import javax.faces.FacesException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.convert.BigDecimalConverter;
import javax.faces.event.ValueChangeEvent;
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
public class ConsultaDepRecLoc extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        trxsinidentificarDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.trxsinidentificarRowSet}"));
        vw_periodotrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_periodotrfRowSet}"));
        vw_cuentatrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_cuentatrfRowSet}"));
        vw_municipiotrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_municipiotrfRowSet}"));
        ddEstadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("TO", "TODOS"), new com.sun.rave.web.ui.model.Option("SI", "Sin Identificar"), new com.sun.rave.web.ui.model.Option("ID", "Identificado"), new com.sun.rave.web.ui.model.Option("AN", "Anulado")});
        vw_valortrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_valortrfRowSet}"));
        vw_concesionariotrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_concesionariotrfRowSet}"));
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
    
    private Button btLiquidar = new Button();
    
    public Button getBtLiquidar() {
        return btLiquidar;
    }
    
    public void setBtLiquidar(Button b) {
        this.btLiquidar = b;
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
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
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
    
    private CachedRowSetDataProvider trxsinidentificarDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getTrxsinidentificarDataProvider() {
        return trxsinidentificarDataProvider;
    }
    
    public void setTrxsinidentificarDataProvider(CachedRowSetDataProvider crsdp) {
        this.trxsinidentificarDataProvider = crsdp;
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
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private StaticText staticText9 = new StaticText();
    
    public StaticText getStaticText9() {
        return staticText9;
    }
    
    public void setStaticText9(StaticText st) {
        this.staticText9 = st;
    }
    
    private TableColumn tableColumn10 = new TableColumn();
    
    public TableColumn getTableColumn10() {
        return tableColumn10;
    }
    
    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }
    
    private StaticText staticText10 = new StaticText();
    
    public StaticText getStaticText10() {
        return staticText10;
    }
    
    public void setStaticText10(StaticText st) {
        this.staticText10 = st;
    }
    
    private TableColumn tableColumn11 = new TableColumn();
    
    public TableColumn getTableColumn11() {
        return tableColumn11;
    }
    
    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }
    
    private StaticText staticText11 = new StaticText();
    
    public StaticText getStaticText11() {
        return staticText11;
    }
    
    public void setStaticText11(StaticText st) {
        this.staticText11 = st;
    }
    
    private TableColumn tableColumn12 = new TableColumn();
    
    public TableColumn getTableColumn12() {
        return tableColumn12;
    }
    
    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }
    
    private StaticText staticText12 = new StaticText();
    
    public StaticText getStaticText12() {
        return staticText12;
    }
    
    public void setStaticText12(StaticText st) {
        this.staticText12 = st;
    }
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private CachedRowSetDataProvider vw_periodotrfDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_periodotrfDataProvider() {
        return vw_periodotrfDataProvider;
    }
    
    public void setVw_periodotrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_periodotrfDataProvider = crsdp;
    }
    
    private DropDown ddPeriodo = new DropDown();
    
    public DropDown getDdPeriodo() {
        return ddPeriodo;
    }
    
    public void setDdPeriodo(DropDown dd) {
        this.ddPeriodo = dd;
    }

    private CachedRowSetDataProvider vw_cuentatrfDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_cuentatrfDataProvider() {
        return vw_cuentatrfDataProvider;
    }

    public void setVw_cuentatrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_cuentatrfDataProvider = crsdp;
    }

    private DropDown ddCuenta = new DropDown();

    public DropDown getDdCuenta() {
        return ddCuenta;
    }

    public void setDdCuenta(DropDown dd) {
        this.ddCuenta = dd;
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

    private TableColumn tableColumn8 = new TableColumn();

    public TableColumn getTableColumn8() {
        return tableColumn8;
    }

    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }

    private Checkbox checkbox1 = new Checkbox();

    public Checkbox getCheckbox1() {
        return checkbox1;
    }

    public void setCheckbox1(Checkbox c) {
        this.checkbox1 = c;
    }

    private TableColumn tableColumn13 = new TableColumn();

    public TableColumn getTableColumn13() {
        return tableColumn13;
    }

    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }

    private Button button1 = new Button();

    public Button getButton1() {
        return button1;
    }

    public void setButton1(Button b) {
        this.button1 = b;
    }

    private CachedRowSetDataProvider vw_municipiotrfDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_municipiotrfDataProvider() {
        return vw_municipiotrfDataProvider;
    }

    public void setVw_municipiotrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_municipiotrfDataProvider = crsdp;
    }

    private DropDown ddMunicipio = new DropDown();

    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }

    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }

    private TableColumn tableColumn15 = new TableColumn();

    public TableColumn getTableColumn15() {
        return tableColumn15;
    }

    public void setTableColumn15(TableColumn tc) {
        this.tableColumn15 = tc;
    }

    private StaticText staticText13 = new StaticText();

    public StaticText getStaticText13() {
        return staticText13;
    }

    public void setStaticText13(StaticText st) {
        this.staticText13 = st;
    }

    private DropDown ddEstado = new DropDown();

    public DropDown getDdEstado() {
        return ddEstado;
    }

    public void setDdEstado(DropDown dd) {
        this.ddEstado = dd;
    }

    private SingleSelectOptionsList ddEstadoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdEstadoDefaultOptions() {
        return ddEstadoDefaultOptions;
    }

    public void setDdEstadoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddEstadoDefaultOptions = ssol;
    }

    private CachedRowSetDataProvider vw_valortrfDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_valortrfDataProvider() {
        return vw_valortrfDataProvider;
    }

    public void setVw_valortrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_valortrfDataProvider = crsdp;
    }

    private DropDown ddValor = new DropDown();

    public DropDown getDdValor() {
        return ddValor;
    }

    public void setDdValor(DropDown dd) {
        this.ddValor = dd;
    }

    private BigDecimalConverter ddValorConverter = new BigDecimalConverter();

    public BigDecimalConverter getDdValorConverter() {
        return ddValorConverter;
    }

    public void setDdValorConverter(BigDecimalConverter bdc) {
        this.ddValorConverter = bdc;
    }

    private CachedRowSetDataProvider vw_concesionariotrfDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_concesionariotrfDataProvider() {
        return vw_concesionariotrfDataProvider;
    }

    public void setVw_concesionariotrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_concesionariotrfDataProvider = crsdp;
    }

    private Label label6 = new Label();

    public Label getLabel6() {
        return label6;
    }

    public void setLabel6(Label l) {
        this.label6 = l;
    }

    private DropDown ddCon = new DropDown();

    public DropDown getDdCon() {
        return ddCon;
    }

    public void setDdCon(DropDown dd) {
        this.ddCon = dd;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsultaDepRecLoc() {
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
        
        try {
            if (this.isPostBack())
                return;
            
            getSessionBean1().getTrxsinidentificarRowSet().setObject(1,"999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(2,"999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(3,"999999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(4,"999999999");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(5,"TODOS");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(6,"TODOS");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(7,"TO");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(8,"TO");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(9,"0");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(10,"0");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(11,"99");
            getSessionBean1().getTrxsinidentificarRowSet().setObject(12,"99");
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
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
        trxsinidentificarDataProvider.close();
        vw_periodotrfDataProvider.close();
        vw_cuentatrfDataProvider.close();
        vw_municipiotrfDataProvider.close();
        vw_valortrfDataProvider.close();
        vw_concesionariotrfDataProvider.close();
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
        
        /*try {
         
            if (this.tmotivo.getText() == null)
                throw new Exception("Motivo del reproceso requerido");
         
            if (tmotivo.getText().toString().length() < 5)
                throw new Exception("Motivo del reproceso incorrecto");
         
            if (tmotivo.getText().toString().length() > 500)
                throw new Exception("Motivo del reproceso muy extenso");
         
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.AprobarRep);
         
            java.util.Calendar cal =  java.util.Calendar.getInstance();
         
            Date fecha_ini = this.clFechaIni.getSelectedDate();
            cal.setTime(fecha_ini);
         
         
            int fecha_ini_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_ini_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_ini_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
         
            cs.setInt(++pos, fecha_ini_ano );
            cs.setInt(++pos, fecha_ini_mes );
            cs.setInt(++pos, fecha_ini_dia );
         
            cs.setString(++pos, rbTipo.getValue().toString());
            cs.setString(++pos, tmotivo.getText().toString());
            cs.setString(++pos, getSessionBean1().getUser());
         
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
         
            // Ejecutamos
            cs.execute();
         
            // Captura los parametros de salida OUT
            resultado = cs.getString(7);
         
            info(resultado);
         
         
         
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
         **/
        return null;
    }
    
    public void ddPeriodo_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        
        try {
            getSessionBean1().getTrxsinidentificarRowSet().setObject(1,ddPeriodo.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(2,ddPeriodo.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(3,ddCuenta.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(4,ddCuenta.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(5,ddMunicipio.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(6,ddMunicipio.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(7,ddEstado.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(8,ddEstado.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(9,ddValor.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(10,ddValor.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(11,ddCon.getSelected());
            getSessionBean1().getTrxsinidentificarRowSet().setObject(12,ddCon.getSelected());
            
            this.trxsinidentificarDataProvider.refresh();
        } catch (Exception e) {
            info( e.getMessage() );
        }
        
    }

    public void ddCuenta_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
    }

    public void ddEstado_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
        
    }

    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
    }

    public void ddValor_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        ddPeriodo_processValueChange(null);
    }

    public void ddCon_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
         ddPeriodo_processValueChange(null);
    }
    
    
}

