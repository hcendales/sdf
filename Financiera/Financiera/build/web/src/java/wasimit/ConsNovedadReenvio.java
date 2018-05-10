/*
 * Terceros.java
 *
 * Created on November 8, 2007, 10:57 AM
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
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.text.DecimalFormat;
import javax.faces.FacesException;
import javax.faces.context.ExternalContext;
import javax.faces.event.ValueChangeEvent;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import oracle.jdbc.OracleTypes;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Date;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class ConsNovedadReenvio extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    
    private String Director_Ejecutivo;
    private String Director_Nacional;
    private String Contador_General;
    private String Coordinador_Financiero;
    
    private void _init() throws Exception {
        vw_detallenovreenvioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_detallenovreenvioRowSet}"));
        
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
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private TableColumn tableColumn3 = new TableColumn();
    
    public TableColumn getTableColumn3() {
        return tableColumn3;
    }
    
    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private Button btAnular = new Button();
    
    public Button getBtAnular() {
        return btAnular;
    }
    
    public void setBtAnular(Button b) {
        this.btAnular = b;
    }
    
    private TableColumn tableColumn11 = new TableColumn();
    
    public TableColumn getTableColumn11() {
        return tableColumn11;
    }
    
    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
    private TableColumn tableColumn5 = new TableColumn();
    
    public TableColumn getTableColumn5() {
        return tableColumn5;
    }
    
    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }
    
    private TableColumn tableColumn6 = new TableColumn();
    
    public TableColumn getTableColumn6() {
        return tableColumn6;
    }
    
    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private TableColumn tableColumn8 = new TableColumn();
    
    public TableColumn getTableColumn8() {
        return tableColumn8;
    }
    
    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private TableColumn tableColumn10 = new TableColumn();
    
    public TableColumn getTableColumn10() {
        return tableColumn10;
    }
    
    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }
    
    private TableColumn tableColumn12 = new TableColumn();
    
    public TableColumn getTableColumn12() {
        return tableColumn12;
    }
    
    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }
    
    private TableColumn tableColumn13 = new TableColumn();
    
    public TableColumn getTableColumn13() {
        return tableColumn13;
    }
    
    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }
    
    private TextField tfNumero = new TextField();
    
    public TextField getTfNumero() {
        return tfNumero;
    }
    
    public void setTfNumero(TextField tf) {
        this.tfNumero = tf;
    }
    
    private Label labelDivipo1 = new Label();
    
    public Label getLabelDivipo1() {
        return labelDivipo1;
    }
    
    public void setLabelDivipo1(Label l) {
        this.labelDivipo1 = l;
    }
    
    // </editor-fold>
    
    private String resultadoVal = "";
    
    private Button btAprobar = new Button();
    
    public Button getBtAprobar() {
        return btAprobar;
    }
    
    public void setBtAprobar(Button b) {
        this.btAprobar = b;
    }
    
    private Label labelDivipo2 = new Label();
    
    public Label getLabelDivipo2() {
        return labelDivipo2;
    }
    
    public void setLabelDivipo2(Label l) {
        this.labelDivipo2 = l;
    }
    
    private TextField tfTipo = new TextField();
    
    public TextField getTfTipo() {
        return tfTipo;
    }
    
    public void setTfTipo(TextField tf) {
        this.tfTipo = tf;
    }
    
    private Label labelDivipo3 = new Label();
    
    public Label getLabelDivipo3() {
        return labelDivipo3;
    }
    
    public void setLabelDivipo3(Label l) {
        this.labelDivipo3 = l;
    }
    
    private TextField tdnsAvvillas = new TextField();
    
    public TextField getTdnsAvvillas() {
        return tdnsAvvillas;
    }
    
    public void setTdnsAvvillas(TextField tf) {
        this.tdnsAvvillas = tf;
    }
    
    private TextField tcuenta = new TextField();
    
    public TextField getTcuenta() {
        return tcuenta;
    }
    
    public void setTcuenta(TextField tf) {
        this.tcuenta = tf;
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
    
    private TextField tidentificacion = new TextField();
    
    public TextField getTidentificacion() {
        return tidentificacion;
    }
    
    public void setTidentificacion(TextField tf) {
        this.tidentificacion = tf;
    }
    
    private TextField tdnsDavivienda = new TextField();
    
    public TextField getTdnsDavivienda() {
        return tdnsDavivienda;
    }
    
    public void setTdnsDavivienda(TextField tf) {
        this.tdnsDavivienda = tf;
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
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private Label label9 = new Label();
    
    public Label getLabel9() {
        return label9;
    }
    
    public void setLabel9(Label l) {
        this.label9 = l;
    }
    
    private Label label10 = new Label();
    
    public Label getLabel10() {
        return label10;
    }
    
    public void setLabel10(Label l) {
        this.label10 = l;
    }
    
    private TextField tconcepto = new TextField();
    
    public TextField getTconcepto() {
        return tconcepto;
    }
    
    public void setTconcepto(TextField tf) {
        this.tconcepto = tf;
    }
    
    private TextField tajuste = new TextField();
    
    public TextField getTajuste() {
        return tajuste;
    }
    
    public void setTajuste(TextField tf) {
        this.tajuste = tf;
    }
    
    private TextField tbanco = new TextField();
    
    public TextField getTbanco() {
        return tbanco;
    }
    
    public void setTbanco(TextField tf) {
        this.tbanco = tf;
    }
    
    private TextField ttipoCuenta = new TextField();
    
    public TextField getTtipoCuenta() {
        return ttipoCuenta;
    }
    
    public void setTtipoCuenta(TextField tf) {
        this.ttipoCuenta = tf;
    }
    
    private TextField ttipoIde = new TextField();
    
    public TextField getTtipoIde() {
        return ttipoIde;
    }
    
    public void setTtipoIde(TextField tf) {
        this.ttipoIde = tf;
    }
    
    private Label label11 = new Label();
    
    public Label getLabel11() {
        return label11;
    }
    
    public void setLabel11(Label l) {
        this.label11 = l;
    }
    
    private TextField testado = new TextField();
    
    public TextField getTestado() {
        return testado;
    }
    
    public void setTestado(TextField tf) {
        this.testado = tf;
    }
    
    private TextField tfechaAct = new TextField();
    
    public TextField getTfechaAct() {
        return tfechaAct;
    }
    
    public void setTfechaAct(TextField tf) {
        this.tfechaAct = tf;
    }
    
    private Label label12 = new Label();
    
    public Label getLabel12() {
        return label12;
    }
    
    public void setLabel12(Label l) {
        this.label12 = l;
    }
    
    private TextField tusuario = new TextField();
    
    public TextField getTusuario() {
        return tusuario;
    }
    
    public void setTusuario(TextField tf) {
        this.tusuario = tf;
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

    private CachedRowSetDataProvider vw_detallenovreenvioDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_detallenovreenvioDataProvider() {
        return vw_detallenovreenvioDataProvider;
    }

    public void setVw_detallenovreenvioDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_detallenovreenvioDataProvider = crsdp;
    }

    private TableColumn tableColumn14 = new TableColumn();

    public TableColumn getTableColumn14() {
        return tableColumn14;
    }

    public void setTableColumn14(TableColumn tc) {
        this.tableColumn14 = tc;
    }

    private StaticText staticText1 = new StaticText();

    public StaticText getStaticText1() {
        return staticText1;
    }

    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }

    private TableColumn tableColumn15 = new TableColumn();

    public TableColumn getTableColumn15() {
        return tableColumn15;
    }

    public void setTableColumn15(TableColumn tc) {
        this.tableColumn15 = tc;
    }

    private StaticText staticText2 = new StaticText();

    public StaticText getStaticText2() {
        return staticText2;
    }

    public void setStaticText2(StaticText st) {
        this.staticText2 = st;
    }

    private TableColumn tableColumn19 = new TableColumn();

    public TableColumn getTableColumn19() {
        return tableColumn19;
    }

    public void setTableColumn19(TableColumn tc) {
        this.tableColumn19 = tc;
    }

    private StaticText staticText6 = new StaticText();

    public StaticText getStaticText6() {
        return staticText6;
    }

    public void setStaticText6(StaticText st) {
        this.staticText6 = st;
    }

    private TableColumn tableColumn21 = new TableColumn();

    public TableColumn getTableColumn21() {
        return tableColumn21;
    }

    public void setTableColumn21(TableColumn tc) {
        this.tableColumn21 = tc;
    }

    private StaticText staticText8 = new StaticText();

    public StaticText getStaticText8() {
        return staticText8;
    }

    public void setStaticText8(StaticText st) {
        this.staticText8 = st;
    }

    private TableColumn tableColumn22 = new TableColumn();

    public TableColumn getTableColumn22() {
        return tableColumn22;
    }

    public void setTableColumn22(TableColumn tc) {
        this.tableColumn22 = tc;
    }

    private StaticText staticText9 = new StaticText();

    public StaticText getStaticText9() {
        return staticText9;
    }

    public void setStaticText9(StaticText st) {
        this.staticText9 = st;
    }

    private TableColumn tableColumn23 = new TableColumn();

    public TableColumn getTableColumn23() {
        return tableColumn23;
    }

    public void setTableColumn23(TableColumn tc) {
        this.tableColumn23 = tc;
    }

    private StaticText staticText10 = new StaticText();

    public StaticText getStaticText10() {
        return staticText10;
    }

    public void setStaticText10(StaticText st) {
        this.staticText10 = st;
    }

    private TableColumn tableColumn25 = new TableColumn();

    public TableColumn getTableColumn25() {
        return tableColumn25;
    }

    public void setTableColumn25(TableColumn tc) {
        this.tableColumn25 = tc;
    }

    private StaticText staticText12 = new StaticText();

    public StaticText getStaticText12() {
        return staticText12;
    }

    public void setStaticText12(StaticText st) {
        this.staticText12 = st;
    }

    private TableColumn tableColumn26 = new TableColumn();

    public TableColumn getTableColumn26() {
        return tableColumn26;
    }

    public void setTableColumn26(TableColumn tc) {
        this.tableColumn26 = tc;
    }

    private StaticText staticText13 = new StaticText();

    public StaticText getStaticText13() {
        return staticText13;
    }

    public void setStaticText13(StaticText st) {
        this.staticText13 = st;
    }

    private TableColumn tableColumn27 = new TableColumn();

    public TableColumn getTableColumn27() {
        return tableColumn27;
    }

    public void setTableColumn27(TableColumn tc) {
        this.tableColumn27 = tc;
    }

    private StaticText staticText14 = new StaticText();

    public StaticText getStaticText14() {
        return staticText14;
    }

    public void setStaticText14(StaticText st) {
        this.staticText14 = st;
    }

    private TableColumn tableColumn28 = new TableColumn();

    public TableColumn getTableColumn28() {
        return tableColumn28;
    }

    public void setTableColumn28(TableColumn tc) {
        this.tableColumn28 = tc;
    }

    private StaticText staticText15 = new StaticText();

    public StaticText getStaticText15() {
        return staticText15;
    }

    public void setStaticText15(StaticText st) {
        this.staticText15 = st;
    }

    private TableColumn tableColumn29 = new TableColumn();

    public TableColumn getTableColumn29() {
        return tableColumn29;
    }

    public void setTableColumn29(TableColumn tc) {
        this.tableColumn29 = tc;
    }

    private StaticText staticText16 = new StaticText();

    public StaticText getStaticText16() {
        return staticText16;
    }

    public void setStaticText16(StaticText st) {
        this.staticText16 = st;
    }

    private TableColumn tableColumn30 = new TableColumn();

    public TableColumn getTableColumn30() {
        return tableColumn30;
    }

    public void setTableColumn30(TableColumn tc) {
        this.tableColumn30 = tc;
    }

    private StaticText staticText17 = new StaticText();

    public StaticText getStaticText17() {
        return staticText17;
    }

    public void setStaticText17(StaticText st) {
        this.staticText17 = st;
    }

    private TableColumn tableColumn31 = new TableColumn();

    public TableColumn getTableColumn31() {
        return tableColumn31;
    }

    public void setTableColumn31(TableColumn tc) {
        this.tableColumn31 = tc;
    }

    private StaticText staticText18 = new StaticText();

    public StaticText getStaticText18() {
        return staticText18;
    }

    public void setStaticText18(StaticText st) {
        this.staticText18 = st;
    }

    private TableColumn tableColumn32 = new TableColumn();

    public TableColumn getTableColumn32() {
        return tableColumn32;
    }

    public void setTableColumn32(TableColumn tc) {
        this.tableColumn32 = tc;
    }

    private StaticText staticText19 = new StaticText();

    public StaticText getStaticText19() {
        return staticText19;
    }

    public void setStaticText19(StaticText st) {
        this.staticText19 = st;
    }

    private TableColumn tableColumn16 = new TableColumn();

    public TableColumn getTableColumn16() {
        return tableColumn16;
    }

    public void setTableColumn16(TableColumn tc) {
        this.tableColumn16 = tc;
    }

    private StaticText staticText3 = new StaticText();

    public StaticText getStaticText3() {
        return staticText3;
    }

    public void setStaticText3(StaticText st) {
        this.staticText3 = st;
    }

    private TextField txtValorSimit = new TextField();

    public TextField getTxtValorSimit() {
        return txtValorSimit;
    }

    public void setTxtValorSimit(TextField tf) {
        this.txtValorSimit = tf;
    }

    private TextField txtValorPolca = new TextField();

    public TextField getTxtValorPolca() {
        return txtValorPolca;
    }

    public void setTxtValorPolca(TextField tf) {
        this.txtValorPolca = tf;
    }

    private Label label13 = new Label();

    public Label getLabel13() {
        return label13;
    }

    public void setLabel13(Label l) {
        this.label13 = l;
    }

    private Label label14 = new Label();

    public Label getLabel14() {
        return label14;
    }

    public void setLabel14(Label l) {
        this.label14 = l;
    }
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsNovedadReenvio() {
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
        //super.init();
        
        this.tfNumero.setValue(getSessionBean1().getnovedad());
        
        
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Terceros Initialization Failure", e);
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
        if ( this.isPostBack() )
            return;

        CargarNovedad();
        
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
        vw_detallenovreenvioDataProvider.close();
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
    
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
    
    public String btAnular_action() {
        try {
            String [] Novedad = getSessionBean1().getnovedad().split("-");
            ActualizarEstadoNovedad(Novedad[0], Novedad[1], "ANULADA");
            info(resultadoVal);
            
            this.btAnular.setDisabled(true);
            this.btAprobar.setDisabled(true);
            
            
        } catch (Exception e) {
            info(e.getMessage());
        }
        return "";
    }
    
    
    private void ActualizarEstadoNovedad(String tipoNov, String numeroNov, String estado){
        try{
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovReenvioUpdEst);
            
            // Cargamos los parametros de entrada IN
            cs.setString("p_tiponov", tipoNov);
            cs.setString("p_numeronov", numeroNov);
            cs.setString("p_usuario", getSessionBean1().getUser());
            cs.setString("p_estado", estado);
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_error", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString("p_error");
            
        } catch (Exception e) {
            resultadoVal = e.toString();
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return;
    }
    
    
    
    private int resulFun;
    
    private String  CargarNovedad() {
        try {
            
            String [] Novedad = getSessionBean1().getnovedad().split("-");
            
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovReenvioQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString("v_tiponov", Novedad[0]);
            cs.setString("v_numeronov", Novedad[1]);
            cs.setString("v_usuario", getSessionBean1().getUser());
            
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("v_concepto", java.sql.Types.CHAR);
            cs.registerOutParameter("v_ajuste", java.sql.Types.CHAR);
            cs.registerOutParameter("v_banco", java.sql.Types.CHAR);
            cs.registerOutParameter("v_tipoCuenta", java.sql.Types.CHAR);
            cs.registerOutParameter("v_cuenta", java.sql.Types.CHAR);
            cs.registerOutParameter("v_tipoIde", java.sql.Types.CHAR);
            cs.registerOutParameter("v_identificacion", java.sql.Types.CHAR);
            cs.registerOutParameter("v_fechaAct", java.sql.Types.CHAR);
            cs.registerOutParameter("v_dnsAvvillas", java.sql.Types.CHAR);
            cs.registerOutParameter("v_dnsDavivienda", java.sql.Types.CHAR);
            cs.registerOutParameter("v_estado", java.sql.Types.CHAR);
            cs.registerOutParameter("v_usuarioNov", java.sql.Types.CHAR);
            cs.registerOutParameter("v_usuarioNov", java.sql.Types.CHAR);
            cs.registerOutParameter("v_vpolca", java.sql.Types.NUMERIC);
            cs.registerOutParameter("v_vsimit", java.sql.Types.NUMERIC);
            
            cs.registerOutParameter("v_error", java.sql.Types.CHAR);
            
            cs.execute();
            
            resultadoVal = cs.getString("v_error");

            tconcepto.setText(cs.getString("v_concepto"));
            tajuste.setText(cs.getString("v_ajuste"));
            tbanco.setText(cs.getString("v_banco"));
            ttipoCuenta.setText(cs.getString("v_tipoCuenta"));
            tcuenta.setText(cs.getString("v_cuenta"));
            ttipoIde.setText(cs.getString("v_tipoIde"));
            tidentificacion.setText(cs.getString("v_identificacion"));
            tfechaAct.setText(cs.getString("v_fechaAct"));
            tdnsAvvillas.setText(cs.getString("v_dnsAvvillas"));
            tdnsDavivienda.setText(cs.getString("v_dnsDavivienda"));
            testado.setText(cs.getString("v_estado"));
            tusuario.setText(cs.getString("v_usuarioNov"));
            
            Double vSimit = new Double(cs.getDouble("v_vSimit"));
            String sSimit = new DecimalFormat("###,###,###,###,###.##").format(vSimit);
            txtValorSimit.setText(sSimit);

            Double vPolca = new Double(cs.getDouble("v_vPolca"));
            String sPolca = new DecimalFormat("###,###,###,###,###.##").format(vPolca);
            txtValorPolca.setText(sPolca);

            if (getSessionBean1().getTipoVoBo().equals("")) {
                this.btAprobar.setDisabled(true);
                this.btAnular.setDisabled(true);
            }
            
            if (Novedad[0].equals("10"))
                this.tfTipo.setText("Reenvio ACH");
            
            getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    1, getSessionBean1().getnovedad());

               getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    2, "TODOS");
                getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    3, "TODOS");
 
           if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOFINANCIERA)) {
                getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    2, "TODOS");
                getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    3, "TODOS");
           }
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOSIMIT)) {
                getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    2, "SIMIT");
                getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    3, "SIMIT");
            }
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOPOLCA)) {
                getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    2, "POLCA");
                getSessionBean1().getVw_detallenovreenvioRowSet().setObject(
                    3, "POLCA");
            }

            this.vw_detallenovreenvioDataProvider.refresh();
            
            
        } catch (Exception e) {
            System.out.println("error cargando:" + e.getMessage());
            
            if (e.getMessage() == null)
                resultadoVal = e.toString();
            else
                resultadoVal = e.getMessage();
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultadoVal;
    }
    
    public String btAprobar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            
            String [] Novedad = getSessionBean1().getnovedad().split("-");
            
            String estadoNew = "";
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOFINANCIERA))
                estadoNew = Constants.VOBOFINANCIERA;
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOSIMIT))
                estadoNew = Constants.VOBOSIMIT;
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOPOLCA))
                estadoNew =  Constants.VALIDADA;
            
            if (estadoNew.equals(""))
                throw new Exception("Nuevo estado invalido");
            
            ActualizarEstadoNovedad(Novedad[0], Novedad[1], estadoNew);
            
            info(resultadoVal);
            
            this.btAnular.setDisabled(true);
            this.btAprobar.setDisabled(true);
            
            
        } catch (Exception e) {
            info(e.getMessage());
        }
        
        return null;
    }
    
    
}

