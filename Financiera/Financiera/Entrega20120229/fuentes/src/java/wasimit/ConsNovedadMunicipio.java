/*
 * Municipio.java
 *
 * Created on November 6, 2007, 5:17 PM
 * Copyright cristina
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.data.provider.impl.FilteredTableDataProvider;
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
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.text.SimpleDateFormat;
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
public class ConsNovedadMunicipio extends AbstractPageBean {

    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    private String resultadoVal = "";
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
    }

    
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
        concesionarioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        firmasDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        fcmDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.fcmRowSet}"));
        Director_Ejecutivo = fcmDataProvider.getValue("DIRECTOR_EJECUTIVO").toString();
        Director_Nacional = fcmDataProvider.getValue("DIRECTOR_NACIONAL").toString();
        Contador_General = fcmDataProvider.getValue("CONTADOR_GENERAL").toString();
        Coordinador_Financiero = fcmDataProvider.getValue("COORDINADOR_FINANCIERO").toString();        
        ddFirma1DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"), 
        new com.sun.rave.web.ui.model.Option(Director_Ejecutivo, Director_Ejecutivo), new com.sun.rave.web.ui.model.Option(Director_Nacional, Director_Nacional), 
        new com.sun.rave.web.ui.model.Option(Contador_General, Contador_General),new com.sun.rave.web.ui.model.Option(Coordinador_Financiero, Coordinador_Financiero)});
        ddFirma2DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"), 
        new com.sun.rave.web.ui.model.Option(Director_Ejecutivo, Director_Ejecutivo), new com.sun.rave.web.ui.model.Option(Director_Nacional, Director_Nacional), 
        new com.sun.rave.web.ui.model.Option(Contador_General, Contador_General),new com.sun.rave.web.ui.model.Option(Coordinador_Financiero, Coordinador_Financiero)});
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
    
    public void setForm1(Form clActivacion) {
        this.form1 = clActivacion;
    }
    
    private StaticText stopcion1 = new StaticText();
    
    public StaticText getStopcion1() {
        return stopcion1;
    }
    
    public void setStopcion1(StaticText st) {
        this.stopcion1 = st;
    }
    
    private TextField tfDivipo = new TextField();
    
    public TextField getTfDivipo() {
        return tfDivipo;
    }
    
    public void setTfDivipo(TextField tf) {
        this.tfDivipo = tf;
    }
    
    private Label labelDivipo = new Label();
    
    public Label getLabelDivipo() {
        return labelDivipo;
    }
    
    public void setLabelDivipo(Label l) {
        this.labelDivipo = l;
    }
    
    private TextField tfNombre = new TextField();
    
    public TextField getTfNombre() {
        return tfNombre;
    }
    
    public void setTfNombre(TextField tf) {
        this.tfNombre = tf;
    }
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private DropDown ddConcesionario = new DropDown();
    
    public DropDown getDdConcesionario() {
        return ddConcesionario;
    }
    
    public void setDdConcesionario(DropDown dd) {
        this.ddConcesionario = dd;
    }
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    private CachedRowSetDataProvider concesionarioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getConcesionarioDataProvider() {
        return concesionarioDataProvider;
    }
    
    public void setConcesionarioDataProvider(CachedRowSetDataProvider crsdp) {
        this.concesionarioDataProvider = crsdp;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private TextField tfNit = new TextField();
    
    public TextField getTfNit() {
        return tfNit;
    }
    
    public void setTfNit(TextField tf) {
        this.tfNit = tf;
    }
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
    }
    
    private TextField tfCorreo = new TextField();
    
    public TextField getTfCorreo() {
        return tfCorreo;
    }
    
    public void setTfCorreo(TextField tf) {
        this.tfCorreo = tf;
    }
    
    private Checkbox cbRetroactividad = new Checkbox();
    
    public Checkbox getCbRetroactividad() {
        return cbRetroactividad;
    }
    
    public void setCbRetroactividad(Checkbox c) {
        this.cbRetroactividad = c;
    }
    
    private Checkbox cbLiquidarSimitExt = new Checkbox();
    
    public Checkbox getCbLiquidarSimitExt() {
        return cbLiquidarSimitExt;
    }
    
    public void setCbLiquidarSimitExt(Checkbox c) {
        this.cbLiquidarSimitExt = c;
    }
    
    private Checkbox cbLiquidarSimitLoc = new Checkbox();
    
    public Checkbox getCbLiquidarSimitLoc() {
        return cbLiquidarSimitLoc;
    }
    
    public void setCbLiquidarSimitLoc(Checkbox c) {
        this.cbLiquidarSimitLoc = c;
    }
    
    private Checkbox cbLiquidarPolcaExt = new Checkbox();
    
    public Checkbox getCbLiquidarPolcaExt() {
        return cbLiquidarPolcaExt;
    }
    
    public void setCbLiquidarPolcaExt(Checkbox c) {
        this.cbLiquidarPolcaExt = c;
    }
    
    private Checkbox cbLiquidarPolcaLoc = new Checkbox();
    
    public Checkbox getCbLiquidarPolcaLoc() {
        return cbLiquidarPolcaLoc;
    }
    
    public void setCbLiquidarPolcaLoc(Checkbox c) {
        this.cbLiquidarPolcaLoc = c;
    }
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private DropDown ddBanco = new DropDown();
    
    public DropDown getDdBanco() {
        return ddBanco;
    }
    
    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    private DropDown ddTipo = new DropDown();
    
    public DropDown getDdTipo() {
        return ddTipo;
    }
    
    public void setDdTipo(DropDown dd) {
        this.ddTipo = dd;
    }
    
    private SingleSelectOptionsList ddTipoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoDefaultOptions() {
        return ddTipoDefaultOptions;
    }
    
    public void setDdTipoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoDefaultOptions = ssol;
    }
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private TextField tfCuenta = new TextField();
    
    public TextField getTfCuenta() {
        return tfCuenta;
    }
    
    public void setTfCuenta(TextField tf) {
        this.tfCuenta = tf;
    }
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private TextField tfNitCta = new TextField();
    
    public TextField getTfNitCta() {
        return tfNitCta;
    }
    
    public void setTfNitCta(TextField tf) {
        this.tfNitCta = tf;
    }
    
    private Label label9 = new Label();
    
    public Label getLabel9() {
        return label9;
    }
    
    public void setLabel9(Label l) {
        this.label9 = l;
    }
    
    private Button btAdicionar = new Button();
    
    public Button getBtAdicionar() {
        return btAdicionar;
    }
    
    public void setBtAdicionar(Button b) {
        this.btAdicionar = b;
    }

    
    private Button btAnular = new Button();
    
    public Button getBtAnular() {
        return btAnular;
    }
    
    public void setBtAnular(Button b) {
        this.btAnular = b;
    }


    private Label label10 = new Label();
    
    public Label getLabel10() {
        return label10;
    }
    
    public void setLabel10(Label l) {
        this.label10 = l;
    }
    
    private TextField tfFcmS = new TextField();
    
    public TextField getTfFcmS() {
        return tfFcmS;
    }
    
    public void setTfFcmS(TextField tf) {
        this.tfFcmS = tf;
    }
    
    private TextField tfAcuerdoS = new TextField();
    
    public TextField getTfAcuerdoS() {
        return tfAcuerdoS;
    }
    
    public void setTfAcuerdoS(TextField tf) {
        this.tfAcuerdoS = tf;
    }
    
    private TextField tfConcesionarioS = new TextField();
    
    public TextField getTfConcesionarioS() {
        return tfConcesionarioS;
    }
    
    public void setTfConcesionarioS(TextField tf) {
        this.tfConcesionarioS = tf;
    }
    
    private Label label12 = new Label();
    
    public Label getLabel12() {
        return label12;
    }
    
    public void setLabel12(Label l) {
        this.label12 = l;
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
    
    private TextField tfMunicipioS = new TextField();
    
    public TextField getTfMunicipioS() {
        return tfMunicipioS;
    }
    
    public void setTfMunicipioS(TextField tf) {
        this.tfMunicipioS = tf;
    }
    
    private Label label15 = new Label();
    
    public Label getLabel15() {
        return label15;
    }
    
    public void setLabel15(Label l) {
        this.label15 = l;
    }
    
    private TextField tfConcesionarioP = new TextField();
    
    public TextField getTfConcesionarioP() {
        return tfConcesionarioP;
    }
    
    public void setTfConcesionarioP(TextField tf) {
        this.tfConcesionarioP = tf;
    }
    
    private TextField tfMunicipioP = new TextField();
    
    public TextField getTfMunicipioP() {
        return tfMunicipioP;
    }
    
    public void setTfMunicipioP(TextField tf) {
        this.tfMunicipioP = tf;
    }
    
    private TextField tfAcuerdoP = new TextField();
    
    public TextField getTfAcuerdoP() {
        return tfAcuerdoP;
    }
    
    public void setTfAcuerdoP(TextField tf) {
        this.tfAcuerdoP = tf;
    }
    
    private TextField tfFcmP = new TextField();
    
    public TextField getTfFcmP() {
        return tfFcmP;
    }
    
    public void setTfFcmP(TextField tf) {
        this.tfFcmP = tf;
    }
    
    private Label label11 = new Label();
    
    public Label getLabel11() {
        return label11;
    }
    
    public void setLabel11(Label l) {
        this.label11 = l;
    }
    
    
    private FilteredTableDataProvider filteredTableDataProvider1 = new FilteredTableDataProvider();
    
    public FilteredTableDataProvider getFilteredTableDataProvider1() {
        return filteredTableDataProvider1;
    }
    
    public void setFilteredTableDataProvider1(FilteredTableDataProvider ftdp) {
        this.filteredTableDataProvider1 = ftdp;
    }

    private DropDown ddFirma1 = new DropDown();

    public DropDown getDdFirma1() {
        return ddFirma1;
    }

    public void setDdFirma1(DropDown dd) {
        this.ddFirma1 = dd;
    }

    private SingleSelectOptionsList ddFirma1DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdFirma1DefaultOptions() {
        return ddFirma1DefaultOptions;
    }

    public void setDdFirma1DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFirma1DefaultOptions = ssol;
    }

    private Label label17 = new Label();

    public Label getLabel17() {
        return label17;
    }

    public void setLabel17(Label l) {
        this.label17 = l;
    }

    private Label label18 = new Label();

    public Label getLabel18() {
        return label18;
    }

    public void setLabel18(Label l) {
        this.label18 = l;
    }

    private DropDown ddFirma2 = new DropDown();

    public DropDown getDdFirma2() {
        return ddFirma2;
    }

    public void setDdFirma2(DropDown dd) {
        this.ddFirma2 = dd;
    }

    private SingleSelectOptionsList ddFirma2DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdFirma2DefaultOptions() {
        return ddFirma2DefaultOptions;
    }

    public void setDdFirma2DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFirma2DefaultOptions = ssol;
    }

    private Calendar clActivacion = new Calendar();

    public Calendar getClActivacion() {
        return clActivacion;
    }

    public void setClActivacion(Calendar c) {
        this.clActivacion = c;
    }

    private Label label19 = new Label();

    public Label getLabel19() {
        return label19;
    }

    public void setLabel19(Label l) {
        this.label19 = l;
    }

    private CachedRowSetDataProvider firmasDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getFirmasDataProvider() {
        return firmasDataProvider;
    }

    public void setFirmasDataProvider(CachedRowSetDataProvider crsdp) {
        this.firmasDataProvider = crsdp;
    }

    private CachedRowSetDataProvider fcmDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getFcmDataProvider() {
        return fcmDataProvider;
    }

    public void setFcmDataProvider(CachedRowSetDataProvider crsdp) {
        this.fcmDataProvider = crsdp;
    }

    private Label labelDivipo1 = new Label();

    public Label getLabelDivipo1() {
        return labelDivipo1;
    }

    public void setLabelDivipo1(Label l) {
        this.labelDivipo1 = l;
    }

    private TextField tfNumero = new TextField();

    public TextField getTfNumero() {
        return tfNumero;
    }

    public void setTfNumero(TextField tf) {
        this.tfNumero = tf;
    }

    private Button btAprobar = new Button();

    public Button getBtAprobar() {
        return btAprobar;
    }

    public void setBtAprobar(Button b) {
        this.btAprobar = b;
    }

    private TextField tdnsAvvillas = new TextField();

    public TextField getTdnsAvvillas() {
        return tdnsAvvillas;
    }

    public void setTdnsAvvillas(TextField tf) {
        this.tdnsAvvillas = tf;
    }

    private Label label16 = new Label();

    public Label getLabel16() {
        return label16;
    }

    public void setLabel16(Label l) {
        this.label16 = l;
    }

    private TextField tdnsGranbanco = new TextField();

    public TextField getTdnsGranbanco() {
        return tdnsGranbanco;
    }

    public void setTdnsGranbanco(TextField tf) {
        this.tdnsGranbanco = tf;
    }

    private Label label20 = new Label();

    public Label getLabel20() {
        return label20;
    }

    public void setLabel20(Label l) {
        this.label20 = l;
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


   
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsNovedadMunicipio() {
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
        tfNumero.setValue(getSessionBean1().getnovedad());
        CargarNovedad();
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Municipio Initialization Failure", e);
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
        concesionarioDataProvider.close();
        bancoDataProvider.close();
        municipioDataProvider.close();
        firmasDataProvider.close();
        fcmDataProvider.close();
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
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
    }
    
    
   
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;

    


    
    public String btAdicionar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        return "";
    }
    

    
    public String  btEditar_action() {
        return "";
        
    }
    
    public String btAnular_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        // Se validan cada uno de los campos antes de buscar la Novedad
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
            cs = con.prepareCall(Constants.NovMunicipioUpdEst);
            pos = 0;

            // Cargamos los parametros de entrada IN
            cs.setString(++pos, tipoNov);
            cs.setString(++pos, numeroNov);
            cs.setString(++pos, getSessionBean1().getUser());
            cs.setString(++pos, estado);

            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // Ejecutamos
            cs.execute();

            // Captura los parametros de salida OUT
            resultadoVal = cs.getString(5);
        } catch (Exception e) {
            resultadoVal = e.toString();
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return;
    }
    

                    
       
        private String  CargarNovedad() {
        try {
            
            String [] Novedad = getSessionBean1().getnovedad().split("-");
           
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovMunicipioQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, Novedad[0]);
            cs.setString(++pos, Novedad[1]);
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);

            cs.registerOutParameter(++pos, java.sql.Types.DATE);

            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString(33);
            
            //Ingresa cada uno de los valores de la novedad
            this.tfDivipo.setValue(cs.getString(4));
            this.tfNit.setValue(cs.getString(5));
            this.tfNombre.setValue(cs.getString(6));
            this.ddConcesionario.setValue(cs.getString(7));
            this.tfCorreo.setText(cs.getString(8));
            this.cbRetroactividad.setValue(cs.getString(9));
            this.cbLiquidarSimitExt.setValue(cs.getString(10));
            this.cbLiquidarSimitLoc.setValue(cs.getString(11));
            this.cbLiquidarPolcaExt.setValue(cs.getString(12));
            this.cbLiquidarPolcaLoc.setValue(cs.getString(13));
            this.ddBanco.setValue(cs.getString(15));
            this.ddTipo.setValue(cs.getString(16));
            this.tfCuenta.setText(cs.getString(17));
            this.tfNitCta.setText(cs.getString(18));
            
            this.tfMunicipioS.setText("" + cs.getDouble(19));
            this.tfFcmS.setText("" + cs.getDouble(20));
            this.tfConcesionarioS.setText("" + cs.getDouble(21));
            this.tfAcuerdoS.setText("" + cs.getDouble(22));
            this.tfMunicipioP.setText("" + cs.getDouble(23));
            this.tfFcmP.setText("" + cs.getDouble(24));
            this.tfConcesionarioP.setText("" + cs.getDouble(25));
            this.tfAcuerdoP.setText("" + cs.getDouble(26));
            
            this.clActivacion.setSelectedDate(cs.getDate(27));
            this.ddFirma1.setValue(cs.getString(28));
            this.ddFirma2.setValue(cs.getString(29));
            
            this.tdnsAvvillas.setText(cs.getString(31));
            this.tdnsGranbanco.setText(cs.getString(32));
      
             if (getSessionBean1().getTipoVoBo().equals(""))
             {
                 this.btAprobar.setDisabled(true);
                 this.btAnular.setDisabled(true);
             }
            
            if (Novedad[0].equals("01"))
                this.tfTipo.setText("Adicion Municipio");
            
           if (Novedad[0].equals("02"))
                this.tfTipo.setText("Actualizacion Municipio");
            
        } catch (Exception e) {
            if (e.getMessage() == null)
                resultadoVal = e.toString();
            else
                resultadoVal = e.getMessage();
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultadoVal;
    }

        public String btReimprimir_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        reporteNovedad(this.tfNumero.getText().toString());
        return null;
    }
    
    public void reporteNovedad(String numNovedad) {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        String PageReport;
        String rptName = "";
        
        rptName = "novMunicipio";
        
        String tipoNovedad = numNovedad.substring(0,2);
        String numeroNovedad = numNovedad.substring(3);
        
            
        PageReport =  Constants.darPathApp(this.getFacesContext()) + "ReportEngine?NameFilter=PDF" +
                "&P_TIPO_NOVEDAD=" + tipoNovedad +
                "&P_NUMERO_NOVEDAD=" + numeroNovedad +
                "&rptfilename=" + rptName;
   
        
        ExternalContext externalContext = getFacesContext().getExternalContext();
        
        try {
            externalContext.redirect(PageReport);
            
        } catch (Exception ex) {
            info("Fallo generando reporte novedad " + ex.getMessage());
        }
    
        
    }

    public String btAprobar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
       try {
           
           /*if ( this.tdnsAvvillas.getText() == null )
                throw new Exception("Digite DNS enviado a Banco Avvillas");
                
           if ( ((String)tdnsAvvillas.getText()).length() < 15 )
                    throw new Exception("DNS invalido. Formato DNS-AAAA-XX-XXXX");
           if ( this.tdnsGranbanco.getText() == null )
                throw new Exception("Digite DNS enviado a Banco Granbanco");
                
           if ( ((String)tdnsGranbanco.getText()).length() < 15 )
                    throw new Exception("DNS invalido. Formato DNS-AAAA-XX-XXXX");
           */
           
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

    public void tfNumero_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        
    }
 
    


}
    
    
    


