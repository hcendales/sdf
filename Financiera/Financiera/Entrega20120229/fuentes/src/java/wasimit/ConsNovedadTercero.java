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
public class ConsNovedadTercero extends AbstractPageBean {
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
        
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        terceroDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.terceroRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddIndBaseDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("1", "1: Sobre OT al 100%"), new com.sun.rave.web.ui.model.Option("2", "2: Valor Adicional"), new com.sun.rave.web.ui.model.Option("3", "3: Valor Recaudo sin Adicional"), new com.sun.rave.web.ui.model.Option("4", "4: Valor Municipio")});
        ddNumeroDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"), new com.sun.rave.web.ui.model.Option("1", "Primero"), new com.sun.rave.web.ui.model.Option("2", "Segundo"), new com.sun.rave.web.ui.model.Option("3", "Tercero"), new com.sun.rave.web.ui.model.Option("4", "Cuarto")});
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
    
    private DropDown ddMunicipio = new DropDown();
    
    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }
    
    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }
    
    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
    }
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private CachedRowSetDataProvider terceroDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getTerceroDataProvider() {
        return terceroDataProvider;
    }
    
    public void setTerceroDataProvider(CachedRowSetDataProvider crsdp) {
        this.terceroDataProvider = crsdp;
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
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    private TextField tfNitTercero = new TextField();
    
    public TextField getTfNitTercero() {
        return tfNitTercero;
    }
    
    public void setTfNitTercero(TextField tf) {
        this.tfNitTercero = tf;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private TextField tfNombre = new TextField();
    
    public TextField getTfNombre() {
        return tfNombre;
    }
    
    public void setTfNombre(TextField tf) {
        this.tfNombre = tf;
    }
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
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
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private TextField tfCuenta = new TextField();
    
    public TextField getTfCuenta() {
        return tfCuenta;
    }
    
    public void setTfCuenta(TextField tf) {
        this.tfCuenta = tf;
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
    
    private TextField tfBaseSimit = new TextField();
    
    public TextField getTfBaseSimit() {
        return tfBaseSimit;
    }
    
    public void setTfBaseSimit(TextField tf) {
        this.tfBaseSimit = tf;
    }
    
    private TextField tfBasePolca = new TextField();
    
    public TextField getTfBasePolca() {
        return tfBasePolca;
    }
    
    public void setTfBasePolca(TextField tf) {
        this.tfBasePolca = tf;
    }
    
    private DropDown ddIndBase = new DropDown();
    
    public DropDown getDdIndBase() {
        return ddIndBase;
    }
    
    public void setDdIndBase(DropDown dd) {
        this.ddIndBase = dd;
    }
    
    private SingleSelectOptionsList ddIndBaseDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdIndBaseDefaultOptions() {
        return ddIndBaseDefaultOptions;
    }
    
    public void setDdIndBaseDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddIndBaseDefaultOptions = ssol;
    }
    
    private Label label11 = new Label();
    
    public Label getLabel11() {
        return label11;
    }
    
    public void setLabel11(Label l) {
        this.label11 = l;
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
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
   private DropDown ddNumero = new DropDown();

    public DropDown getDdNumero() {
        return ddNumero;
    }

    public void setDdNumero(DropDown dd) {
        this.ddNumero = dd;
    }

    private SingleSelectOptionsList ddNumeroDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdNumeroDefaultOptions() {
        return ddNumeroDefaultOptions;
    }

    public void setDdNumeroDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddNumeroDefaultOptions = ssol;
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

    private TextField tfcorreoTercero = new TextField();

    public TextField getTfcorreoTercero() {
        return tfcorreoTercero;
    }

    public void setTfcorreoTercero(TextField tf) {
        this.tfcorreoTercero = tf;
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

    private DropDown ddFirma1 = new DropDown();

    public DropDown getDdFirma1() {
        return ddFirma1;
    }

    public void setDdFirma1(DropDown dd) {
        this.ddFirma1 = dd;
    }

    private Label label14 = new Label();

    public Label getLabel14() {
        return label14;
    }

    public void setLabel14(Label l) {
        this.label14 = l;
    }

    private DropDown ddFirma2 = new DropDown();

    public DropDown getDdFirma2() {
        return ddFirma2;
    }

    public void setDdFirma2(DropDown dd) {
        this.ddFirma2 = dd;
    }

    private Calendar clActivacion = new Calendar();

    public Calendar getClActivacion() {
        return clActivacion;
    }

    public void setClActivacion(Calendar c) {
        this.clActivacion = c;
    }

    private Label label15 = new Label();

    public Label getLabel15() {
        return label15;
    }

    public void setLabel15(Label l) {
        this.label15 = l;
    }

    private SingleSelectOptionsList ddFirma1DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdFirma1DefaultOptions() {
        return ddFirma1DefaultOptions;
    }

    public void setDdFirma1DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFirma1DefaultOptions = ssol;
    }

    private SingleSelectOptionsList ddFirma2DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdFirma2DefaultOptions() {
        return ddFirma2DefaultOptions;
    }

    public void setDdFirma2DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFirma2DefaultOptions = ssol;
    }

    private CachedRowSetDataProvider fcmDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getFcmDataProvider() {
        return fcmDataProvider;
    }

    public void setFcmDataProvider(CachedRowSetDataProvider crsdp) {
        this.fcmDataProvider = crsdp;
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

    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsNovedadTercero() {
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
        CargarNovedadTercero();
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
        if ( this.ddMunicipio.getSelected() == null ) {
            try {
                this.municipioDataProvider.cursorFirst();
                
                getSessionBean1().getTerceroRowSet().setObject(
                        1, this.municipioDataProvider.getValue("IDMUNICIPIO") );
                this.terceroDataProvider.refresh();
            } catch (Exception e) {
                info(e.getMessage());
            }
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
        municipioDataProvider.close();
        terceroDataProvider.close();
        bancoDataProvider.close();
        fcmDataProvider.close();
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
    
    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
    }
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
     
    public boolean validarNombre(String nombre){
    
        boolean correcto = true;
        
        for (int i=0; i<=9; i++){
            if (nombre.contains(Integer.toString(i))){
                correcto = false;
            }   
        }
        return correcto;
    }
    
    
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
    

    
     public boolean validacionMail(String email) {
        
        //Set the email pattern string
        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
        
        //Match the given string with the pattern
        Matcher m = p.matcher(email);
        
        //check whether match is found
        return m.matches();
        
    }

     private void ActualizarEstadoNovedad(String tipoNov, String numeroNov, String estado){
        try{
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovTercerosUpdEst);
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
    
    
            
        private int resulFun;
        
        private String  CargarNovedadTercero() {
        try {

            String [] Novedad = getSessionBean1().getnovedad().split("-");
           
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovTercerosQue);
            
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
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.DATE);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString(19);


            // Se cargan cada uno de los valores en la forma
            this.ddMunicipio.setValue(cs.getString(4));
            this.ddNumero.setValue(cs.getString(14));
            this.tfNitTercero.setValue(cs.getString(5));
            this.tfNombre.setValue(cs.getString(6));
            this.tfcorreoTercero.setValue(cs.getString(7));
            this.ddBanco.setValue(cs.getString(8));
            this.ddTipo.setValue(cs.getString(9));
            this.tfCuenta.setValue(cs.getString(10));

            this.tfBaseSimit.setText("" + cs.getDouble(11));
            this.tfBasePolca.setText("" + cs.getDouble(12));

            this.ddIndBase.setValue(cs.getString(13));
            this.clActivacion.setSelectedDate(cs.getDate(15));
            this.ddFirma1.setValue(cs.getString(16));
            this.ddFirma2.setValue(cs.getString(17));

              if (getSessionBean1().getTipoVoBo().equals(""))
             {
                 this.btAprobar.setDisabled(true);
                 this.btAnular.setDisabled(true);
             }
            
            if (Novedad[0].equals("03"))
                this.tfTipo.setText("Adicion Tercero");
            
           if (Novedad[0].equals("04"))
                this.tfTipo.setText("Actualizacion Tercero");
            
           if (Novedad[0].equals("05"))
                this.tfTipo.setText("Eliminacion Tercero");
      
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
        
        rptName = "novTercero";
        
        String tipoNovedad = numNovedad.substring(0,2);
        String numeroNovedad = numNovedad.substring(3);
        
            
        PageReport =  "/SimitBanco/ReportEngine?NameFilter=PDF" +
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
     
     
}

