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
import javax.faces.FacesException;
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

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class Municipio extends AbstractPageBean {

    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
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
    private void _init() throws Exception {
        concesionarioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
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

    
    private Button btEliminar = new Button();
    
    public Button getBtEliminar() {
        return btEliminar;
    }
    
    public void setBtEliminar(Button b) {
        this.btEliminar = b;
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
    
    private Label label16 = new Label();
    
    public Label getLabel16() {
        return label16;
    }
    
    public void setLabel16(Label l) {
        this.label16 = l;
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


   
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Municipio() {
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
    
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
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
        try {
            
            //DIVIPO            
            try{
                if ( tfDivipo.getText() == null )
                    throw new Exception("Digite el DIVIPO");
                
                if ( ((String)tfDivipo.getText()).length() == 0 )
                    throw new Exception("Digite el DIVIPO");
                
                float vlr = Float.parseFloat((String)this.tfDivipo.getText());
                
                if (vlr < 1000000 )
                    throw new Exception("Error Divipo no valido");
                
                
            }catch(NumberFormatException e) {
                throw new Exception("Divipo debe ser numerico");
            }
            
            //NIT
            try{
                if ( tfNit.getText() == null )
                    throw new Exception("Digite el NIT Municipio");
                
                if ( ((String)tfNit.getText()).length() == 0 )
                    throw new Exception("Digite el NIT Municipio");
                
                float vlr = Float.parseFloat((String)this.tfNit.getText());
                if (vlr < 1000000000 )
                    throw new Exception("NIT Municipio incompleto");
                
            }catch(NumberFormatException e) {
                throw new Exception("NIT Municipio debe ser numerico");
            }

            //Nombre
            if ( tfNombre.getText() == null )
                throw new Exception("Digite el Nombre");
            
            if ( ((String)tfNombre.getText()).length() == 0 )
                throw new Exception("Digite el Nombre");
            
             //Concesionario
            if(ddConcesionario.getValue().toString().compareTo("00") == 0)
            {
                throw new Exception("Seleccione el Concesionario");
            }
            
            //Correo
            if ( tfCorreo.getText() == null )
                throw new Exception("Digite el correo electronico");
            
            if ( ((String)tfCorreo.getText()).length() == 0 )
                throw new Exception("Digite el correo electronico");
            
            if (this.tfCorreo.getText() != null)
                if (tfCorreo.getText().toString().length() > 0 )
                    if(!validacionMail(tfCorreo.getText().toString()) )
                        throw new Exception("Formato de correo electronico errado");
            
            //checkbox
            //No se necesita validar
            
            //Banco
             if(this.ddBanco.getValue().toString().compareTo("00") == 0)
            {
                throw new Exception("Seleccione el Banco");
            }
            
            //Tipo
                if(this.ddTipo.getValue().toString().compareTo("000") == 0)
            {
                throw new Exception("Seleccione el tipo");
            }
                       
            //Cuenta
            try{
                if ( tfCuenta.getText() == null )
                    throw new Exception("Digite la Cuenta");
                
                if ( ((String)tfCuenta.getText()).length() == 0 )
                    throw new Exception("Digite la Cuenta");
                
                float vlr = Float.parseFloat((String)this.tfCuenta.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Cuenta debe ser numerica");
            }

            //Nit Cuenta
            try{
                if ( tfNitCta.getText() == null )
                    throw new Exception("Digite NIT Cuenta");
                
                if ( ((String)tfNitCta.getText()).length() == 0 )
                    throw new Exception("Digite NIT Cuenta");
                
                float vlr = Float.parseFloat((String)this.tfNitCta.getText());
                
                if (vlr < 1000000000 )
                    throw new Exception("NIT Cuenta incompleto");
            }catch(NumberFormatException e) {
                throw new Exception("NIT Cuenta debe ser numerico");
            }
            
            //Simit 90%
            //% Municipio
            try{
                if ( tfMunicipioS.getText() == null )
                    throw new Exception("Digite % Municipio SIMIT");
                
                if ( ((String)tfMunicipioS.getText()).length() == 0 )
                    throw new Exception("Digite % Municipio SIMIT");
                
                float vlr = Float.parseFloat((String)this.tfMunicipioS.getText());
    
                if (vlr < 0)
                    throw new Exception("Valor % Municipio SIMIT debe ser >= 0");
                
            }catch(NumberFormatException e) {
                throw new Exception(" % Municipio SIMIT debe ser numerico");
            }
            
            //% FCM Contrav
            try{
                if ( tfFcmS.getText() == null )
                    throw new Exception("Digite % FCM Contrav SIMIT" );
                
                if ( ((String)tfFcmS.getText()).length() == 0 )
                    throw new Exception("Digite % FCM Contrav SIMIT");
                
                float vlr = Float.parseFloat((String)this.tfFcmS.getText());
 
                if (vlr < 0)
                    throw new Exception("Valor % FCM Contrav SIMIT debe ser >= 0");
                
            }catch(NumberFormatException e) {
                throw new Exception("% FCM Contrav SIMIT debe ser numerico");
            }
            
            //% Conces Contrav
            try{
                if ( tfConcesionarioS.getText() == null )
                    throw new Exception("Digite % Conces Contrav SIMIT");
                
                if ( ((String)tfConcesionarioS.getText()).length() == 0 )
                    throw new Exception("Digite % Conces Contrav SIMIT");
                
                float vlr = Float.parseFloat((String)this.tfConcesionarioS.getText());
                
                if (vlr < 0)
                    throw new Exception("Valor % Conces Contrav SIMIT debe ser >= 0");
            }catch(NumberFormatException e) {
                throw new Exception("% Conces Contrav SIMIT debe ser numerico");
            }
            
            //% Acuerdo
            try{
                if ( tfAcuerdoS.getText() == null )
                    throw new Exception("Digite % Conces Contrav SIMIT");
                
                if ( ((String)tfAcuerdoS.getText()).length() == 0 )
                    throw new Exception("Digite % Conces Contrav SIMIT");
                
                float vlr = Float.parseFloat((String)this.tfAcuerdoS.getText());
                
                if (vlr < 0)
                    throw new Exception("Valor % Conces Contrav SIMIT debe ser >= 0");
                
            }catch(NumberFormatException e) {
                throw new Exception("% Acuerdo SIMIT debe ser numerico");
            }
            
            float vlr1 = Float.parseFloat((String)this.tfMunicipioS.getText());
            float vlr2 = Float.parseFloat((String)this.tfFcmS.getText());
            float vlr3 = Float.parseFloat((String)this.tfConcesionarioS.getText());
            float vlr4 = Float.parseFloat((String)this.tfAcuerdoS.getText());
            
            if ((vlr1 + vlr2 + vlr3 + vlr4 ) != 90.0)
                throw new Exception("% Municipio + % FCM Contrav + % Conces Contrav + % Acuerdo SIMIT debe ser igual a 90%");
            
            //Polca 45%
            //% Municipio
            try{
                if ( tfMunicipioP.getText() == null )
                    throw new Exception("Digite % Municipio POLCA");
                
                if ( ((String)tfMunicipioP.getText()).length() == 0 )
                    throw new Exception("Digite % Municipio POLCA");
                
                float vlr = Float.parseFloat((String)this.tfMunicipioP.getText());
                
                if (vlr < 0)
                    throw new Exception("Valor % Municipio POLCA debe ser >= 0");
    
            }catch(NumberFormatException e) {
                throw new Exception(" % Municipio POLCA debe ser numerico");
            }
            
            //% FCM Contrav
            try{
                if ( tfFcmP.getText() == null )
                    throw new Exception("Digite % FCM Contrav POLCA" );
                
                if ( ((String)tfFcmP.getText()).length() == 0 )
                    throw new Exception("Digite % FCM Contrav POLCA");
                
                float vlr = Float.parseFloat((String)this.tfFcmP.getText());
                
                if (vlr < 0)
                    throw new Exception("Valor % FCM Contrav POLCA debe ser >= 0");
                
            }catch(NumberFormatException e) {
                throw new Exception("% FCM Contrav POLCA debe ser numerico");
            }
            
            //% Conces Contrav
            try{
                if ( tfConcesionarioP.getText() == null )
                    throw new Exception("Digite % Conces Contrav POLCA");
                
                if ( ((String)tfConcesionarioP.getText()).length() == 0 )
                    throw new Exception("Digite % Conces Contrav POLCA");
                
                float vlr = Float.parseFloat((String)this.tfConcesionarioP.getText());

                if (vlr < 0)
                    throw new Exception("Valor % Conces Contrav POLCA debe ser >= 0");
                
            }catch(NumberFormatException e) {
                throw new Exception("% Conces Contrav POLCA debe ser numerico");
            }
            
            //% Acuerdo
            try{
                if ( tfAcuerdoP.getText() == null )
                    throw new Exception("Digite % Conces Contrav POLCA");
                
                if ( ((String)tfAcuerdoP.getText()).length() == 0 )
                    throw new Exception("Digite % Conces Contrav POLCA");
                
                float vlr = Float.parseFloat((String)this.tfAcuerdoP.getText());
                
                
                if (vlr < 0)
                    throw new Exception("Valor % Conces Contrav POLCA debe ser >= 0");
                
            }catch(NumberFormatException e) {
                throw new Exception("% Conces Contrav POLCA debe ser numerico");
            }
            
            vlr1 = Float.parseFloat((String)this.tfMunicipioP.getText());
            vlr2 = Float.parseFloat((String)this.tfFcmP.getText());
            vlr3 = Float.parseFloat((String)this.tfConcesionarioP.getText());
            vlr4 = Float.parseFloat((String)this.tfAcuerdoP.getText());
            
            if ((vlr1 + vlr2 + vlr3 + vlr4 ) != 45.0)
                throw new Exception("% Municipio + % FCM Contrav + % Conces Contrav + % Acuerdo POLCA debe ser igual a 45%");

            con = getJdbcDataSource().getConnection();
            if (this.btAdicionar.getText().toString().equals("Adicionar"))
                cs = con.prepareCall(Constants.MunicipioAdd);
            else
                cs = con.prepareCall(Constants.MunicipioUpd);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfDivipo.getText());
            cs.setString(++pos, (String) this.tfNit.getText());
            cs.setString(++pos, (String) this.tfNombre.getText());
            cs.setString(++pos, (String) this.ddConcesionario.getValue());
            cs.setString(++pos, (String) this.tfCorreo.getText());
            
            
            if( this.cbRetroactividad.getValue() == null  )
                cs.setInt(++pos,0);
            else
                cs.setInt(++pos,1);
            
            if( this.cbLiquidarSimitExt.getValue() == null )
                cs.setInt(++pos,0);
            else
                cs.setInt(++pos,1);
            
            if( this.cbLiquidarSimitLoc.getValue() == null )
                cs.setInt(++pos,0);
            else
                cs.setInt(++pos,1);
            
            if( this.cbLiquidarPolcaExt.getValue() == null )
                cs.setInt(++pos,0);
            else
                cs.setInt(++pos,1);
            
            if( this.cbLiquidarPolcaLoc.getValue() == null )
                cs.setInt(++pos,0);
            else
                cs.setInt(++pos,1);
            
            cs.setInt(++pos,0);
                        
            
            cs.setString(++pos, (String) this.ddBanco.getValue());
            cs.setString(++pos, (String) this.ddTipo.getValue());
            cs.setString(++pos, (String) this.tfCuenta.getText());
            cs.setString(++pos, (String) this.tfNitCta.getText());
            cs.setFloat(++pos, Float.parseFloat((String)this.tfMunicipioS.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfFcmS.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfConcesionarioS.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfAcuerdoS.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfMunicipioP.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfFcmP.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfConcesionarioP.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfAcuerdoP.getText()));
            
            cs.setString(++pos, getSessionBean1().getUser());
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(25);
            
            info(resultado);
            
            if (!resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK))
                return "";
            
            tfDivipo.setValue("");
            tfNit.setValue("");
            tfNombre.setValue("");
            ddConcesionario.setValue(null);
            tfCorreo.setValue("");
            ddBanco.setValue(null);
            ddTipo.setValue(null);
            tfCuenta.setValue("");
            tfNitCta.setValue("");
            cbRetroactividad.setValue("");
            cbLiquidarSimitExt.setValue(null);
            cbLiquidarSimitLoc.setValue(null);
            cbLiquidarPolcaExt.setValue(null);
            cbLiquidarPolcaLoc.setValue(null);
            tfMunicipioS.setValue("");
            tfFcmS.setValue("");
            tfConcesionarioS.setValue("");
            tfAcuerdoS.setValue("");
            tfMunicipioP.setValue("");	
            tfFcmP.setValue("");
            tfConcesionarioP.setValue("");
            tfAcuerdoP.setValue("");
            
            btAdicionar.setText("Adicionar");
            this.btEliminar.setDisabled(true);

            this.tfDivipo.setDisabled(false);
            this.body1.setFocus("form1:tfDivipo");
            
            ddMunicipio.setSelected("00000000");
            
            this.municipioDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
            
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    private DropDown ddMunicipio = new DropDown();
    
    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }
    
    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }

    
    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        btEditar_action();
        
    }
    

    
    public String  btEditar_action() {
        try {
            
            if ( ddMunicipio.getSelected().toString().compareTo("00000000") == 0 )
                 return "";
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.MunicipioQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) ddMunicipio.getSelected());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
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
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(25);
            
            this.tfDivipo.setText( (String) ddMunicipio.getSelected() );
            this.tfNit.setText(cs.getString(3));
            this.tfNombre.setText(cs.getString(4));
            this.ddConcesionario.setValue(cs.getString(5));
            this.tfCorreo.setText(cs.getString(6));
            this.cbRetroactividad.setValue(cs.getString(7));
            this.cbLiquidarSimitExt.setValue(cs.getString(8));
            this.cbLiquidarSimitLoc.setValue(cs.getString(9));
            this.cbLiquidarPolcaExt.setValue(cs.getString(10));
            this.cbLiquidarPolcaLoc.setValue(cs.getString(11));
            
            this.ddBanco.setValue(cs.getString(13));
            this.ddTipo.setValue(cs.getString(14));
            this.tfCuenta.setText(cs.getString(15));
            this.tfNitCta.setText(cs.getString(16));
            
            this.tfMunicipioS.setText("" + cs.getDouble(17));
            this.tfFcmS.setText("" + cs.getDouble(18));
            this.tfConcesionarioS.setText("" + cs.getDouble(19));
            this.tfAcuerdoS.setText("" + cs.getDouble(20));
            
            this.tfMunicipioP.setText("" + cs.getDouble(21));
            this.tfFcmP.setText("" + cs.getDouble(22));
            this.tfConcesionarioP.setText("" + cs.getDouble(23));
            this.tfAcuerdoP.setText("" + cs.getDouble(24));
            
            btAdicionar.setText("Actualizar");
            this.tfDivipo.setDisabled(true);
            this.btEliminar.setDisabled(false);
            
            this.body1.setFocus("form1:tfNit");
            
            info(resultado);
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
        
    }
    
    public String btEliminar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {

            if ( ddMunicipio.getSelected().toString().compareTo("00000000") == 0 )
                 throw new Exception("Favor Seleccione Muncipio");
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.MunicipioDel);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)tfDivipo.getText() );
            cs.setString(++pos, getSessionBean1().getUser());
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(3);
            tfDivipo.setValue("");
            tfNit.setValue("");
            tfNombre.setValue("");
            ddConcesionario.setValue(null);
            tfCorreo.setValue("");
            ddBanco.setValue(null);
            ddTipo.setValue(null);
            tfCuenta.setValue("");
            tfNitCta.setValue("");
            cbRetroactividad.setValue("");
            cbLiquidarSimitExt.setValue(null);
            cbLiquidarSimitLoc.setValue(null);
            cbLiquidarPolcaExt.setValue(null);
            cbLiquidarPolcaLoc.setValue(null);
            tfMunicipioS.setValue("");
            tfFcmS.setValue("");
            tfConcesionarioS.setValue("");
            tfAcuerdoS.setValue("");
            tfMunicipioP.setValue("");	
            tfFcmP.setValue("");
            tfConcesionarioP.setValue("");
            tfAcuerdoP.setValue("");
            
            btAdicionar.setText("Adicionar");
            this.btEliminar.setDisabled(true);
            
            this.body1.setFocus("form1:tfDivipo");
            
            this.municipioDataProvider.refresh();
            this.tfDivipo.setDisabled(false);
            
            info(resultado);
                       
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
        }
        
        return null;
    }
    
    public boolean validacionMail(String email) {
        
        //Set the email pattern string
        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
        
        //Match the given string with the pattern
        Matcher m = p.matcher(email);
        
        //check whether match is found
        return m.matches();
        
    }

    public String btBuscar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        return null;
    }



    
    
}

