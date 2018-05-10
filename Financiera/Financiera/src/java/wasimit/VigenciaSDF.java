/*
 * rptLiqSimitLoc.java
 *
 * Created on 28 de noviembre de 2007, 02:30 PM
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
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.PanelLayout;
import com.sun.rave.web.ui.component.PasswordField;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Tab;
import com.sun.rave.web.ui.component.TabSet;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.FacesException;
import javax.faces.context.FacesContext;
import javax.faces.convert.BigDecimalConverter;
import javax.faces.validator.LongRangeValidator;
import javax.faces.validator.ValidatorException;
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
public class VigenciaSDF extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        municipioDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        transferencias_sdfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.transferencias_sdfRowSet}"));
        ddFiltroDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("SIN", "Sin Vigencia"), new com.sun.rave.web.ui.model.Option("COR", "Fecha de corte")});
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
    
    private Button btConsultar = new Button();
    
    public Button getBtConsultar() {
        return btConsultar;
    }
    
    public void setBtConsultar(Button b) {
        this.btConsultar = b;
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
    
    private DropDown ddMunicipio = new DropDown();
    
    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }
    
    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }
    
    private CachedRowSetDataProvider municipioDataProvider1 = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider1() {
        return municipioDataProvider1;
    }
    
    public void setMunicipioDataProvider1(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider1 = crsdp;
    }
    
    private CachedRowSetDataProvider transferencias_sdfDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getTransferencias_sdfDataProvider() {
        return transferencias_sdfDataProvider;
    }
    
    public void setTransferencias_sdfDataProvider(CachedRowSetDataProvider crsdp) {
        this.transferencias_sdfDataProvider = crsdp;
    }
    
    private DropDown ddFiltro = new DropDown();
    
    public DropDown getDdFiltro() {
        return ddFiltro;
    }
    
    public void setDdFiltro(DropDown dd) {
        this.ddFiltro = dd;
    }
    
    private SingleSelectOptionsList ddFiltroDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFiltroDefaultOptions() {
        return ddFiltroDefaultOptions;
    }
    
    public void setDdFiltroDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFiltroDefaultOptions = ssol;
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
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private StaticText stCta1 = new StaticText();
    
    public StaticText getStCta1() {
        return stCta1;
    }
    
    public void setStCta1(StaticText st) {
        this.stCta1 = st;
    }
    
    private TableColumn tableColumn3 = new TableColumn();
    
    public TableColumn getTableColumn3() {
        return tableColumn3;
    }
    
    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }
    
    private StaticText stindTipo1 = new StaticText();
    
    public StaticText getStindTipo1() {
        return stindTipo1;
    }
    
    public void setStindTipo1(StaticText st) {
        this.stindTipo1 = st;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
    private StaticText stFecCorte1 = new StaticText();
    
    public StaticText getStFecCorte1() {
        return stFecCorte1;
    }
    
    public void setStFecCorte1(StaticText st) {
        this.stFecCorte1 = st;
    }
    
    private TableColumn tableColumn5 = new TableColumn();
    
    public TableColumn getTableColumn5() {
        return tableColumn5;
    }
    
    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }
    
    private StaticText stFecTran1 = new StaticText();
    
    public StaticText getStFecTran1() {
        return stFecTran1;
    }
    
    public void setStFecTran1(StaticText st) {
        this.stFecTran1 = st;
    }
    
    private TableColumn tableColumn6 = new TableColumn();
    
    public TableColumn getTableColumn6() {
        return tableColumn6;
    }
    
    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }
    
    private StaticText stValor1 = new StaticText();
    
    public StaticText getStValor1() {
        return stValor1;
    }
    
    public void setStValor1(StaticText st) {
        this.stValor1 = st;
    }
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private DropDown stIdMunicipio1 = new DropDown();
    
    public DropDown getStIdMunicipio1() {
        return stIdMunicipio1;
    }
    
    public void setStIdMunicipio1(DropDown dd) {
        this.stIdMunicipio1 = dd;
    }
    
    private TableColumn tableColumn8 = new TableColumn();
    
    public TableColumn getTableColumn8() {
        return tableColumn8;
    }
    
    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }
    
    private StaticText stIndOrigen1 = new StaticText();
    
    public StaticText getStIndOrigen1() {
        return stIndOrigen1;
    }
    
    public void setStIndOrigen1(StaticText st) {
        this.stIndOrigen1 = st;
    }
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private StaticText stVigencia1 = new StaticText();
    
    public StaticText getStVigencia1() {
        return stVigencia1;
    }
    
    public void setStVigencia1(StaticText st) {
        this.stVigencia1 = st;
    }
    
    private TableColumn tableColumn10 = new TableColumn();
    
    public TableColumn getTableColumn10() {
        return tableColumn10;
    }
    
    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }
    
    private StaticText stFecIni1 = new StaticText();
    
    public StaticText getStFecIni1() {
        return stFecIni1;
    }
    
    public void setStFecIni1(StaticText st) {
        this.stFecIni1 = st;
    }
    
    private TableColumn tableColumn11 = new TableColumn();
    
    public TableColumn getTableColumn11() {
        return tableColumn11;
    }
    
    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }
    
    private StaticText stFecFin1 = new StaticText();
    
    public StaticText getStFecFin1() {
        return stFecFin1;
    }
    
    public void setStFecFin1(StaticText st) {
        this.stFecFin1 = st;
    }
    
    private TableColumn tableColumn12 = new TableColumn();
    
    public TableColumn getTableColumn12() {
        return tableColumn12;
    }
    
    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }
    
    private StaticText stIdReg1 = new StaticText();
    
    public StaticText getStIdReg1() {
        return stIdReg1;
    }
    
    public void setStIdReg1(StaticText st) {
        this.stIdReg1 = st;
    }
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private Checkbox checkbox1 = new Checkbox();
    
    public Checkbox getCheckbox1() {
        return checkbox1;
    }
    
    public void setCheckbox1(Checkbox c) {
        this.checkbox1 = c;
    }
    
    private Button bmodificar1 = new Button();
    
    public Button getBmodificar1() {
        return bmodificar1;
    }
    
    public void setBmodificar1(Button b) {
        this.bmodificar1 = b;
    }
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
    }
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private Calendar cfecFin = new Calendar();
    
    public Calendar getCfecFin() {
        return cfecFin;
    }
    
    public void setCfecFin(Calendar c) {
        this.cfecFin = c;
    }
    
    private Calendar cfecIni = new Calendar();
    
    public Calendar getCfecIni() {
        return cfecIni;
    }
    
    public void setCfecIni(Calendar c) {
        this.cfecIni = c;
    }
    
    private Calendar cfecCorIni = new Calendar();
    
    public Calendar getCfecCorIni() {
        return cfecCorIni;
    }
    
    public void setCfecCorIni(Calendar c) {
        this.cfecCorIni = c;
    }
    
    private Label lfecCorIni = new Label();
    
    public Label getLfecCorIni() {
        return lfecCorIni;
    }
    
    public void setLfecCorIni(Label l) {
        this.lfecCorIni = l;
    }
    
    private Label lfecCorFin = new Label();
    
    public Label getLfecCorFin() {
        return lfecCorFin;
    }
    
    public void setLfecCorFin(Label l) {
        this.lfecCorFin = l;
    }
    
    private Calendar cfecCorFin = new Calendar();
    
    public Calendar getCfecCorFin() {
        return cfecCorFin;
    }
    
    public void setCfecCorFin(Calendar c) {
        this.cfecCorFin = c;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public VigenciaSDF() {
    }
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
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
        
        if (this.isPostBack())
            return;
        
        try {
            
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(1,"99999999");
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(2,"SIN");
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(3,"SIN");
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(4,"SIN");
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(5,"20000101");
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(6,"SIN");
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(7,"20000101");
            
            this.transferencias_sdfDataProvider.refresh();
            this.municipioDataProvider1.refresh();
            
            
        } catch (SQLException ex) {
            ex.printStackTrace();
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
        municipioDataProvider1.close();
        transferencias_sdfDataProvider.close();
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
    
    
    
    public String btConsultar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            if (ddMunicipio.getValue() == null)
                throw new Exception("Favor seleccione municipio");
            
            if (ddFiltro.getValue() == null)
                throw new Exception("Favor seleccione filtro de consulta");
            
            if (ddFiltro.getValue().toString().equals("COR"))
                if (this.cfecCorIni.getSelectedDate() == null )
                    throw new Exception("Favor ingrese fecha inicial");
            
            if (ddFiltro.getValue().toString().equals("COR"))
                if (this.cfecCorFin.getSelectedDate() == null )
                    throw new Exception("Favor ingrese fecha final");
            
            SimpleDateFormat fecha = new SimpleDateFormat("yyyyMMdd");
            java.sql.Date fec1 = null;
            java.sql.Date fec2 = null;
            
            if (ddFiltro.getValue().toString().equals("COR")) {
                fec1 = new java.sql.Date(this.cfecCorIni.getSelectedDate().getTime());
                fec2 = new java.sql.Date(this.cfecCorFin.getSelectedDate().getTime());
            }
            
            String fecIni = "20000101";
            String fecFin = "20000101";
            
            if (ddFiltro.getValue().toString().equals("COR")) {
                fecIni = fecha.format(fec1);
                fecFin = fecha.format(fec2);
            }
            
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(1,ddMunicipio.getValue().toString());
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(2,ddFiltro.getValue().toString());
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(3,ddFiltro.getValue().toString());
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(4,ddFiltro.getValue().toString());
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(5,fecIni);
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(6,ddFiltro.getValue().toString());
            this.getSessionBean1().getTransferencias_sdfRowSet().setObject(7,fecFin);
            
            this.transferencias_sdfDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return null;
        
    }
    
    public String bquery_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        return null;
    }
    
    public String bmodificar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            int numReg = 0;
            
            if (this.transferencias_sdfDataProvider.getRowCount() > 0) {
                transferencias_sdfDataProvider.cursorFirst();
                
                do {
                    boolean  actualizar = false;
                    String cbAct = "0";
                    
                    if (transferencias_sdfDataProvider.getValue("actualizar") != null )
                        cbAct = transferencias_sdfDataProvider.getValue("actualizar").toString();
                    
                    if (cbAct.equals("1")) {
                        modificarSdf(transferencias_sdfDataProvider.getValue("IDRECAUDO_LOCAL_LIQUIDACION").toString());
                        numReg++;
                    }
                    
                    
                    
                    
                } while (transferencias_sdfDataProvider.cursorNext());
            }
            
            
            info("Registros actualizados:" + numReg);
            
            this.transferencias_sdfDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return null;
    }
    
    public String modificarSdf(String txtIdReg) {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            con= Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.modTrfSdf);
            
            // Cargamos los parametros de entrada IN
            
            cs.setBigDecimal("v_idReg", new BigDecimal(txtIdReg) );
            java.sql.Date fec1 = new java.sql.Date(this.cfecIni.getSelectedDate().getTime());
            cs.setDate("V_FECINI", fec1);
            
            java.sql.Date fec2 = new java.sql.Date(this.cfecFin.getSelectedDate().getTime());
            cs.setDate("V_FECFIN", fec2);
            
            cs.setString("v_usuario", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("v_cod_error", java.sql.Types.NUMERIC);
            cs.registerOutParameter("v_msg_error", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return null;
    }
    
    public String tab2_action() {
        // TODO: Replace with your code
        try {
            validarSeleccion();
            
        } catch (Exception e) {
            info(e.getMessage());
        }
        
        return null;
        
    }
    
    public void validarSeleccion() throws Exception {
        
        int numReg = 0;
        
        if (this.transferencias_sdfDataProvider.getRowCount() > 0) {
            transferencias_sdfDataProvider.cursorFirst();
            
            do {
                boolean  actualizar = false;
                String cbAct = "0";
                
                if (transferencias_sdfDataProvider.getValue("actualizar") != null )
                    cbAct = transferencias_sdfDataProvider.getValue("actualizar").toString();
                
                if (cbAct.equals("1"))
                    numReg++;
                
                
            } while (transferencias_sdfDataProvider.cursorNext());
        }
        
        if (numReg == 0)
            throw new Exception("Se debe seleccionar al menos una transaccion");
        
        info("se han seleccionado : "  + numReg + " transacciones");
        
        
    }
    
    
    
    
}

