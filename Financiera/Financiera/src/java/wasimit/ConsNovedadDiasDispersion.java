/*
* DiasDispersion.java
 *
 * Created on November 7, 2007, 3:28 PM
 * Copyright cristina
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
//import com.sun.org.apache.bcel.internal.classfile.ConstantString;
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
import java.util.Date;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class ConsNovedadDiasDispersion extends AbstractPageBean {
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
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_municipio_novRowSet}"));
        dias_dispersionDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.dias_dispersionRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddFrecuenciaSimExtDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: Inicio Mes")});
        ddFrecuenciaSimLocDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: Inicio Mes")});
        ddFrecuenciaPolExtDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: Inicio Mes")});
        ddFrecuenciaPolLocDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: Inicio Mes")});
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
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider dias_dispersionDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getDias_dispersionDataProvider() {
        return dias_dispersionDataProvider;
    }
    
    public void setDias_dispersionDataProvider(CachedRowSetDataProvider crsdp) {
        this.dias_dispersionDataProvider = crsdp;
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
    
    private Label lbBanco = new Label();
    
    public Label getLbBanco() {
        return lbBanco;
    }
    
    public void setLbBanco(Label l) {
        this.lbBanco = l;
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
    
    private TextField tfDiasSimitExt = new TextField();
    
    public TextField getTfDiasSimitExt() {
        return tfDiasSimitExt;
    }
    
    public void setTfDiasSimitExt(TextField tf) {
        this.tfDiasSimitExt = tf;
    }
    
    private DropDown ddFrecuenciaSimExt = new DropDown();
    
    public DropDown getDdFrecuenciaSimExt() {
        return ddFrecuenciaSimExt;
    }
    
    public void setDdFrecuenciaSimExt(DropDown dd) {
        this.ddFrecuenciaSimExt = dd;
    }
    
    private SingleSelectOptionsList ddFrecuenciaSimExtDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFrecuenciaSimExtDefaultOptions() {
        return ddFrecuenciaSimExtDefaultOptions;
    }
    
    public void setDdFrecuenciaSimExtDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFrecuenciaSimExtDefaultOptions = ssol;
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
    
    private TextField tfDiasSimitLoc = new TextField();
    
    public TextField getTfDiasSimitLoc() {
        return tfDiasSimitLoc;
    }
    
    public void setTfDiasSimitLoc(TextField tf) {
        this.tfDiasSimitLoc = tf;
    }
    
    private DropDown ddFrecuenciaSimLoc = new DropDown();
    
    public DropDown getDdFrecuenciaSimLoc() {
        return ddFrecuenciaSimLoc;
    }
    
    public void setDdFrecuenciaSimLoc(DropDown dd) {
        this.ddFrecuenciaSimLoc = dd;
    }
    
    private SingleSelectOptionsList ddFrecuenciaSimLocDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFrecuenciaSimLocDefaultOptions() {
        return ddFrecuenciaSimLocDefaultOptions;
    }
    
    public void setDdFrecuenciaSimLocDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFrecuenciaSimLocDefaultOptions = ssol;
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
    
    private TextField tfDiasPolcaExt = new TextField();
    
    public TextField getTfDiasPolcaExt() {
        return tfDiasPolcaExt;
    }
    
    public void setTfDiasPolcaExt(TextField tf) {
        this.tfDiasPolcaExt = tf;
    }
    
    private DropDown ddFrecuenciaPolExt = new DropDown();
    
    public DropDown getDdFrecuenciaPolExt() {
        return ddFrecuenciaPolExt;
    }
    
    public void setDdFrecuenciaPolExt(DropDown dd) {
        this.ddFrecuenciaPolExt = dd;
    }
    
    private SingleSelectOptionsList ddFrecuenciaPolExtDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFrecuenciaPolExtDefaultOptions() {
        return ddFrecuenciaPolExtDefaultOptions;
    }
    
    public void setDdFrecuenciaPolExtDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFrecuenciaPolExtDefaultOptions = ssol;
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
    
    private TextField tfDiasPolcaLoc = new TextField();
    
    public TextField getTfDiasPolcaLoc() {
        return tfDiasPolcaLoc;
    }
    
    public void setTfDiasPolcaLoc(TextField tf) {
        this.tfDiasPolcaLoc = tf;
    }
    
    private DropDown ddFrecuenciaPolLoc = new DropDown();
    
    public DropDown getDdFrecuenciaPolLoc() {
        return ddFrecuenciaPolLoc;
    }
    
    public void setDdFrecuenciaPolLoc(DropDown dd) {
        this.ddFrecuenciaPolLoc = dd;
    }
    
    private SingleSelectOptionsList ddFrecuenciaPolLocDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdFrecuenciaPolLocDefaultOptions() {
        return ddFrecuenciaPolLocDefaultOptions;
    }
    
    public void setDdFrecuenciaPolLocDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddFrecuenciaPolLocDefaultOptions = ssol;
    }
    
    private Button btAnular = new Button();
    
    public Button getBtAnular() {
        return btAnular;
    }
    
    public void setBtAnular(Button b) {
        this.btAnular = b;
    }
    
    private SingleSelectOptionsList ddMunicipio1DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdMunicipio1DefaultOptions() {
        return ddMunicipio1DefaultOptions;
    }
    
    public void setDdMunicipio1DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddMunicipio1DefaultOptions = ssol;
    }
    
    private SingleSelectOptionsList dropDown1DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDropDown1DefaultOptions() {
        return dropDown1DefaultOptions;
    }
    
    public void setDropDown1DefaultOptions(SingleSelectOptionsList ssol) {
        this.dropDown1DefaultOptions = ssol;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private Calendar clActivacion = new Calendar();

    public Calendar getClActivacion() {
        return clActivacion;
    }

    public void setClActivacion(Calendar c) {
        this.clActivacion = c;
    }

    private DropDown ddFirma1 = new DropDown();

    public DropDown getDdFirma1() {
        return ddFirma1;
    }

    public void setDdFirma1(DropDown dd) {
        this.ddFirma1 = dd;
    }

    private Label label11 = new Label();

    public Label getLabel11() {
        return label11;
    }

    public void setLabel11(Label l) {
        this.label11 = l;
    }

    private Label label12 = new Label();

    public Label getLabel12() {
        return label12;
    }

    public void setLabel12(Label l) {
        this.label12 = l;
    }

    private DropDown ddFirma2 = new DropDown();

    public DropDown getDdFirma2() {
        return ddFirma2;
    }

    public void setDdFirma2(DropDown dd) {
        this.ddFirma2 = dd;
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
    public ConsNovedadDiasDispersion() {
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
        tfNumero.setValue(getSessionBean1().getnovedad());
        CargarNovedadDiasDispersion();
// Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("DiasDispersion Initialization Failure", e);
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
                
                getSessionBean1().getDias_dispersionRowSet().setObject(
                        1, this.municipioDataProvider.getValue("IDMUNICIPIO") );
                this.dias_dispersionDataProvider.refresh();
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
        dias_dispersionDataProvider.close();
        bancoDataProvider.close();
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
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }
    
    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        try {
            getSessionBean1().getDias_dispersionRowSet().setObject(
                    1,(String) this.ddMunicipio.getSelected());
            this.dias_dispersionDataProvider.refresh();
        } catch (Exception e) {
           info(e.getMessage());
        }
        
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
    
    public String btEditar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.DiasDispersionQue);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)this.ddMunicipio.getValue());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(12);
            
            
            //this.ddBanco.setValue((String)stIdbanco.getText());
            this.tfDiasSimitExt.setText("" + cs.getInt(4));
            this.tfDiasSimitLoc.setText("" + cs.getInt(5));
            this.tfDiasPolcaExt.setText("" + cs.getInt(6));
            this.tfDiasPolcaLoc.setText("" + cs.getInt(7));
            
            this.ddFrecuenciaSimExt.setValue("" + cs.getInt(8));
            this.ddFrecuenciaSimLoc.setValue("" + cs.getInt(9));
            this.ddFrecuenciaPolExt.setValue("" + cs.getInt(10));
            this.ddFrecuenciaPolLoc.setValue("" + cs.getInt(11));
            
            info(resultado);
            
            ddMunicipio.setDisabled(true);
            ddBanco.setDisabled(true);
            
            this.btAnular.setText("Actualizar");
         
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
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.DiasDispersionQue);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)this.ddMunicipio.getValue());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(12);
            
            
            //this.ddBanco.setValue((String)stIdbanco.getText());
            this.tfDiasSimitExt.setText("" + cs.getInt(4));
            this.tfDiasSimitLoc.setText("" + cs.getInt(5));
            this.tfDiasPolcaExt.setText("" + cs.getInt(6));
            this.tfDiasPolcaLoc.setText("" + cs.getInt(7));
            
            this.ddFrecuenciaSimExt.setValue("" + cs.getInt(8));
            this.ddFrecuenciaSimLoc.setValue("" + cs.getInt(9));
            this.ddFrecuenciaPolExt.setValue("" + cs.getInt(10));
            this.ddFrecuenciaPolLoc.setValue("" + cs.getInt(11));
            
            info(resultado);
            
            ddMunicipio.setDisabled(true);
            ddBanco.setDisabled(true);
            
            this.btAnular.setText("Eliminar");
         
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;        
    }
    
        private void ActualizarEstadoNovedad(String tipoNov, String numeroNov, String estado){
        try{
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovDiasDispersionUpdEst);
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
        
        private int  Validar(String tipoNov, String numeroNov) {
        try {
            
            
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovDiasDispersionQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, tipoNov);
            cs.setString(++pos, numeroNov);
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
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
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString(18);

            //Revisa si la Novedad está en estado INGRESADA antes de continuar la validacion
            if(cs.getString(17).trim().compareTo("INGRESADA") != 0)
                resulFun = 2;
            
            //Se validan cada uno de los campos y se comparan con los de la novedad
            if(ddMunicipio.getValue().toString().trim().compareTo(cs.getString(4).trim()) != 0)
                throw new Exception("Municipio no corresponde al de la novedad");

            if (this.ddBanco.getValue().toString().trim().compareTo(cs.getString(5).trim()) != 0)
                throw new Exception("Banco no corresponde al de la novedad");
            
            if ((double) Float.parseFloat(this.tfDiasSimitExt.getText().toString()) != cs.getFloat(6))
                throw new Exception("Dias SiMIT Externo no corresponde al de la novedad");

            if ((double) Float.parseFloat(this.tfDiasSimitLoc.getText().toString()) != cs.getFloat(7))
                throw new Exception("Dias SiMIT Local no corresponde al de la novedad");

            if ((double) Float.parseFloat(this.tfDiasPolcaExt.getText().toString()) != cs.getFloat(8))
                throw new Exception("Dias POLCA Externo no corresponde al de la novedad");

            if ((double) Float.parseFloat(this.tfDiasPolcaLoc.getText().toString()) != cs.getFloat(9))
                throw new Exception("Dias POLCA Local no corresponde al de la novedad");

            if ((double) Float.parseFloat(this.ddFrecuenciaSimExt.getValue().toString()) != cs.getFloat(10))
                throw new Exception("Frecuencia SiMIT Externo no corresponde al de la novedad");

            if ((double) Float.parseFloat(this.ddFrecuenciaSimLoc.getValue().toString()) != cs.getFloat(11))
                throw new Exception("Frecuencia SiMIT Local no corresponde al de la novedad");

            if ((double) Float.parseFloat(this.ddFrecuenciaPolExt.getValue().toString()) != cs.getFloat(12))
                throw new Exception("Frecuencia POLCA Externo no corresponde al de la novedad");

            if ((double) Float.parseFloat(this.ddFrecuenciaPolLoc.getValue().toString()) != cs.getFloat(13))
                throw new Exception("Frecuencia POLCA Local no corresponde al de la novedad");

            if(this.clActivacion.getSelectedDate().compareTo(cs.getDate(14)) != 0)
                throw new Exception("Fecha Activación no corresponde a la de la novedad");
            
            if(this.ddFirma1.getValue().toString().compareTo(cs.getString(15)) != 0 )
                throw new Exception("Firma1 no corresponde a la de la novedad");

            if(this.ddFirma2.getValue().toString().compareTo(cs.getString(16)) != 0 )
                throw new Exception("Firma2 no corresponde a la de la novedad");

            resulFun = 1;
                   
        } catch (Exception e) {
            
            if (e.getMessage() == null)
                resultadoVal = e.toString();
            else
                resultadoVal = e.getMessage();
            resulFun = 0;
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resulFun;
        
    }
        private String  CargarNovedadDiasDispersion() {
        try {

            String [] Novedad = getSessionBean1().getnovedad().split("-");
           
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovDiasDispersionQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, Novedad[0]);
            cs.setString(++pos, Novedad[1]);
            cs.setString(++pos, getSessionBean1().getUser());

                        // Registramos los parametro de salida OUT
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
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString(18);

            // Se cargan cada uno de los valores en la forma
            this.ddMunicipio.setValue(cs.getString(4).trim());
            this.ddBanco.setValue(cs.getString(5).trim());
            this.tfDiasSimitExt.setText(cs.getString(6));
            this.tfDiasSimitLoc.setText(cs.getString(7));
            this.tfDiasPolcaExt.setText(cs.getString(8));
            this.tfDiasPolcaLoc.setText(cs.getString(9));
            this.ddFrecuenciaSimExt.setValue(cs.getString(10));
            this.ddFrecuenciaSimLoc.setValue(cs.getString(11));
            this.ddFrecuenciaPolExt.setValue(cs.getString(12));
            this.ddFrecuenciaPolLoc.setValue(cs.getString(13));
            this.clActivacion.setSelectedDate(cs.getDate(14));
            this.ddFirma1.setValue(cs.getString(15));
            this.ddFirma2.setValue(cs.getString(16));

            if (getSessionBean1().getTipoVoBo().equals(""))
             {
                 this.btAprobar.setDisabled(true);
                 this.btAnular.setDisabled(true);
             }
            
           if (Novedad[0].equals("06"))
                this.tfTipo.setText("Adicion Dias Dispersion");
            
           if (Novedad[0].equals("07"))
                this.tfTipo.setText("Actualizacion Dias Dispersion");
            
           if (Novedad[0].equals("08"))
                this.tfTipo.setText("Eliminacion Dias Dispersion");

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
        reporteNovedad(this.tfNumero.getText().toString());
        return null;
    }
    public void reporteNovedad(String numNovedad) {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        String PageReport;
        String rptName = "";
        
        rptName = "novDiasDispersion";
        
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
            
            this.btAprobar.setDisabled(true);
            
            
              
       } catch (Exception e) {
            info(e.getMessage());
       }

        return null;
    }
    
}

