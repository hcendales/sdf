/*
 * LiquidarExterno.java
 *
 * Created on November 21, 2007, 8:36 AM
 * Copyright cristina
 */
package wasimit;

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
import com.sun.rave.web.ui.component.RadioButtonGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.sql.SQLException;
import java.util.Date;
import javax.faces.FacesException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
public class ControlEnvio extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        dbancoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("52", "Avvillas"), new com.sun.rave.web.ui.model.Option("51", "Davivienda"), new com.sun.rave.web.ui.model.Option("01", "Bogota")});
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
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private Button btConsultar = new Button();
    
    public Button getBtConsultar() {
        return btConsultar;
    }
    
    public void setBtConsultar(Button b) {
        this.btConsultar = b;
    }
    
    private Calendar clFechaIni = new Calendar();
    
    public Calendar getClFechaIni() {
        return clFechaIni;
    }
    
    public void setClFechaIni(Calendar c) {
        this.clFechaIni = c;
    }

    private DropDown dbanco = new DropDown();

    public DropDown getDbanco() {
        return dbanco;
    }

    public void setDbanco(DropDown dd) {
        this.dbanco = dd;
    }

    private SingleSelectOptionsList dbancoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDbancoDefaultOptions() {
        return dbancoDefaultOptions;
    }

    public void setDbancoDefaultOptions(SingleSelectOptionsList ssol) {
        this.dbancoDefaultOptions = ssol;
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

    private TextField tcuenta1 = new TextField();

    public TextField getTcuenta1() {
        return tcuenta1;
    }

    public void setTcuenta1(TextField tf) {
        this.tcuenta1 = tf;
    }

    private TextField tcuenta2 = new TextField();

    public TextField getTcuenta2() {
        return tcuenta2;
    }

    public void setTcuenta2(TextField tf) {
        this.tcuenta2 = tf;
    }

    private TextField tcuenta3 = new TextField();

    public TextField getTcuenta3() {
        return tcuenta3;
    }

    public void setTcuenta3(TextField tf) {
        this.tcuenta3 = tf;
    }

    private TextField tcuenta4 = new TextField();

    public TextField getTcuenta4() {
        return tcuenta4;
    }

    public void setTcuenta4(TextField tf) {
        this.tcuenta4 = tf;
    }

    private TextField tcuenta5 = new TextField();

    public TextField getTcuenta5() {
        return tcuenta5;
    }

    public void setTcuenta5(TextField tf) {
        this.tcuenta5 = tf;
    }

    private TextField tcuenta6 = new TextField();

    public TextField getTcuenta6() {
        return tcuenta6;
    }

    public void setTcuenta6(TextField tf) {
        this.tcuenta6 = tf;
    }

    private TextField tautoridad1 = new TextField();

    public TextField getTautoridad1() {
        return tautoridad1;
    }

    public void setTautoridad1(TextField tf) {
        this.tautoridad1 = tf;
    }

    private TextField tautoridad2 = new TextField();

    public TextField getTautoridad2() {
        return tautoridad2;
    }

    public void setTautoridad2(TextField tf) {
        this.tautoridad2 = tf;
    }

    private TextField tautoridad3 = new TextField();

    public TextField getTautoridad3() {
        return tautoridad3;
    }

    public void setTautoridad3(TextField tf) {
        this.tautoridad3 = tf;
    }

    private TextField tautoridad4 = new TextField();

    public TextField getTautoridad4() {
        return tautoridad4;
    }

    public void setTautoridad4(TextField tf) {
        this.tautoridad4 = tf;
    }

    private TextField tautoridad5 = new TextField();

    public TextField getTautoridad5() {
        return tautoridad5;
    }

    public void setTautoridad5(TextField tf) {
        this.tautoridad5 = tf;
    }

    private TextField tautoridad6 = new TextField();

    public TextField getTautoridad6() {
        return tautoridad6;
    }

    public void setTautoridad6(TextField tf) {
        this.tautoridad6 = tf;
    }

    private TextField tfecha1 = new TextField();

    public TextField getTfecha1() {
        return tfecha1;
    }

    public void setTfecha1(TextField tf) {
        this.tfecha1 = tf;
    }

    private TextField tfecha2 = new TextField();

    public TextField getTfecha2() {
        return tfecha2;
    }

    public void setTfecha2(TextField tf) {
        this.tfecha2 = tf;
    }

    private TextField tfecha3 = new TextField();

    public TextField getTfecha3() {
        return tfecha3;
    }

    public void setTfecha3(TextField tf) {
        this.tfecha3 = tf;
    }

    private TextField tfecha4 = new TextField();

    public TextField getTfecha4() {
        return tfecha4;
    }

    public void setTfecha4(TextField tf) {
        this.tfecha4 = tf;
    }

    private TextField tfecha5 = new TextField();

    public TextField getTfecha5() {
        return tfecha5;
    }

    public void setTfecha5(TextField tf) {
        this.tfecha5 = tf;
    }

    private TextField tfecha6 = new TextField();

    public TextField getTfecha6() {
        return tfecha6;
    }

    public void setTfecha6(TextField tf) {
        this.tfecha6 = tf;
    }

    private TextField tnumero1 = new TextField();

    public TextField getTnumero1() {
        return tnumero1;
    }

    public void setTnumero1(TextField tf) {
        this.tnumero1 = tf;
    }

    private TextField tnumero2 = new TextField();

    public TextField getTnumero2() {
        return tnumero2;
    }

    public void setTnumero2(TextField tf) {
        this.tnumero2 = tf;
    }

    private TextField tnumero3 = new TextField();

    public TextField getTnumero3() {
        return tnumero3;
    }

    public void setTnumero3(TextField tf) {
        this.tnumero3 = tf;
    }

    private TextField tnumero4 = new TextField();

    public TextField getTnumero4() {
        return tnumero4;
    }

    public void setTnumero4(TextField tf) {
        this.tnumero4 = tf;
    }

    private TextField tnumero5 = new TextField();

    public TextField getTnumero5() {
        return tnumero5;
    }

    public void setTnumero5(TextField tf) {
        this.tnumero5 = tf;
    }

    private TextField tnumero6 = new TextField();

    public TextField getTnumero6() {
        return tnumero6;
    }

    public void setTnumero6(TextField tf) {
        this.tnumero6 = tf;
    }

    private TextField tvalor1 = new TextField();

    public TextField getTvalor1() {
        return tvalor1;
    }

    public void setTvalor1(TextField tf) {
        this.tvalor1 = tf;
    }

    private TextField tvalor2 = new TextField();

    public TextField getTvalor2() {
        return tvalor2;
    }

    public void setTvalor2(TextField tf) {
        this.tvalor2 = tf;
    }

    private TextField tvalor3 = new TextField();

    public TextField getTvalor3() {
        return tvalor3;
    }

    public void setTvalor3(TextField tf) {
        this.tvalor3 = tf;
    }

    private TextField tvalor4 = new TextField();

    public TextField getTvalor4() {
        return tvalor4;
    }

    public void setTvalor4(TextField tf) {
        this.tvalor4 = tf;
    }

    private TextField tvalor5 = new TextField();

    public TextField getTvalor5() {
        return tvalor5;
    }

    public void setTvalor5(TextField tf) {
        this.tvalor5 = tf;
    }

    private TextField tvalor6 = new TextField();

    public TextField getTvalor6() {
        return tvalor6;
    }

    public void setTvalor6(TextField tf) {
        this.tvalor6 = tf;
    }

    private TextField testado1 = new TextField();

    public TextField getTestado1() {
        return testado1;
    }

    public void setTestado1(TextField tf) {
        this.testado1 = tf;
    }

    private TextField testado2 = new TextField();

    public TextField getTestado2() {
        return testado2;
    }

    public void setTestado2(TextField tf) {
        this.testado2 = tf;
    }

    private TextField testado3 = new TextField();

    public TextField getTestado3() {
        return testado3;
    }

    public void setTestado3(TextField tf) {
        this.testado3 = tf;
    }

    private TextField testado4 = new TextField();

    public TextField getTestado4() {
        return testado4;
    }

    public void setTestado4(TextField tf) {
        this.testado4 = tf;
    }

    private TextField testado5 = new TextField();

    public TextField getTestado5() {
        return testado5;
    }

    public void setTestado5(TextField tf) {
        this.testado5 = tf;
    }

    private TextField testado6 = new TextField();

    public TextField getTestado6() {
        return testado6;
    }

    public void setTestado6(TextField tf) {
        this.testado6 = tf;
    }

    private TextField tproceso1 = new TextField();

    public TextField getTproceso1() {
        return tproceso1;
    }

    public void setTproceso1(TextField tf) {
        this.tproceso1 = tf;
    }

    private TextField tproceso2 = new TextField();

    public TextField getTproceso2() {
        return tproceso2;
    }

    public void setTproceso2(TextField tf) {
        this.tproceso2 = tf;
    }

    private TextField tproceso3 = new TextField();

    public TextField getTproceso3() {
        return tproceso3;
    }

    public void setTproceso3(TextField tf) {
        this.tproceso3 = tf;
    }

    private TextField tproceso4 = new TextField();

    public TextField getTproceso4() {
        return tproceso4;
    }

    public void setTproceso4(TextField tf) {
        this.tproceso4 = tf;
    }

    private TextField tproceso5 = new TextField();

    public TextField getTproceso5() {
        return tproceso5;
    }

    public void setTproceso5(TextField tf) {
        this.tproceso5 = tf;
    }

    private TextField tproceso6 = new TextField();

    public TextField getTproceso6() {
        return tproceso6;
    }

    public void setTproceso6(TextField tf) {
        this.tproceso6 = tf;
    }

    private Button BRegsitrar = new Button();

    public Button getBRegsitrar() {
        return BRegsitrar;
    }

    public void setBRegsitrar(Button b) {
        this.BRegsitrar = b;
    }

    private TextField tcuenta7 = new TextField();

    public TextField getTcuenta7() {
        return tcuenta7;
    }

    public void setTcuenta7(TextField tf) {
        this.tcuenta7 = tf;
    }

    private TextField tautoridad7 = new TextField();

    public TextField getTautoridad7() {
        return tautoridad7;
    }

    public void setTautoridad7(TextField tf) {
        this.tautoridad7 = tf;
    }

    private TextField tfecha7 = new TextField();

    public TextField getTfecha7() {
        return tfecha7;
    }

    public void setTfecha7(TextField tf) {
        this.tfecha7 = tf;
    }

    private TextField tnumero7 = new TextField();

    public TextField getTnumero7() {
        return tnumero7;
    }

    public void setTnumero7(TextField tf) {
        this.tnumero7 = tf;
    }

    private TextField tvalor7 = new TextField();

    public TextField getTvalor7() {
        return tvalor7;
    }

    public void setTvalor7(TextField tf) {
        this.tvalor7 = tf;
    }

    private TextField testado7 = new TextField();

    public TextField getTestado7() {
        return testado7;
    }

    public void setTestado7(TextField tf) {
        this.testado7 = tf;
    }

    private TextField tproceso7 = new TextField();

    public TextField getTproceso7() {
        return tproceso7;
    }

    public void setTproceso7(TextField tf) {
        this.tproceso7 = tf;
    }

    private Label label10 = new Label();

    public Label getLabel10() {
        return label10;
    }

    public void setLabel10(Label l) {
        this.label10 = l;
    }

    private TextField tnumero8 = new TextField();

    public TextField getTnumero8() {
        return tnumero8;
    }

    public void setTnumero8(TextField tf) {
        this.tnumero8 = tf;
    }

    private TextField tvalor8 = new TextField();

    public TextField getTvalor8() {
        return tvalor8;
    }

    public void setTvalor8(TextField tf) {
        this.tvalor8 = tf;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ControlEnvio() {
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
    
   
    
    public void validar() throws Exception {
        
        if (this.clFechaIni.getSelectedDate() == null)
            throw new Exception("Favor ingrese fecha transferencia");
        
    }

    
    public String btConsultar_action() {
        // TODO: Replace with your code
        
        try {
            

            validar();
            
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.qControlenvio);
            
            cs.setString("v_usuario", getSessionBean1().getUser());
            cs.setString("v_idbanco",this.dbanco.getValue().toString());
            
            java.sql.Date fec = new java.sql.Date(this.clFechaIni.getSelectedDate().getTime());
            cs.setDate("v_fecTrf", fec);
            

            // Registramos los parametro de salida OUT
            cs.registerOutParameter("v_cod_error", java.sql.Types.INTEGER);
            cs.registerOutParameter("v_msg_error", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta1", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta2", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta3", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta4", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta5", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta6", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_cuenta7", java.sql.Types.VARCHAR);

            cs.registerOutParameter("v_autoridad1", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_autoridad2", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_autoridad3", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_autoridad4", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_autoridad5", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_autoridad6", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_autoridad7", java.sql.Types.VARCHAR);

            cs.registerOutParameter("v_fecha1", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_fecha2", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_fecha3", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_fecha4", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_fecha5", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_fecha6", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_fecha7", java.sql.Types.VARCHAR);

            cs.registerOutParameter("v_numero1", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_numero2", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_numero3", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_numero4", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_numero5", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_numero6", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_numero7", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_numero8", java.sql.Types.VARCHAR);

            cs.registerOutParameter("v_valor1", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_valor2", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_valor3", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_valor4", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_valor5", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_valor6", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_valor7", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_valor8", java.sql.Types.VARCHAR);

            cs.registerOutParameter("v_estado1", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_estado2", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_estado3", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_estado4", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_estado5", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_estado6", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_estado7", java.sql.Types.VARCHAR);

            cs.registerOutParameter("v_proceso1", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_proceso2", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_proceso3", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_proceso4", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_proceso5", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_proceso6", java.sql.Types.VARCHAR);
            cs.registerOutParameter("v_proceso7", java.sql.Types.VARCHAR);

            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            info( cs.getString("v_msg_error"));
            
            if (cs.getInt("v_cod_error") == 0) {
                
                tcuenta1.setText(cs.getString("v_cuenta1"));
                tcuenta2.setText(cs.getString("v_cuenta2"));
                tcuenta3.setText(cs.getString("v_cuenta3"));
                tcuenta4.setText(cs.getString("v_cuenta4"));
                tcuenta5.setText(cs.getString("v_cuenta5"));
                tcuenta6.setText(cs.getString("v_cuenta6"));
                tcuenta7.setText(cs.getString("v_cuenta7"));

                tautoridad1.setText(cs.getString("v_autoridad1"));
                tautoridad2.setText(cs.getString("v_autoridad2"));
                tautoridad3.setText(cs.getString("v_autoridad3"));
                tautoridad4.setText(cs.getString("v_autoridad4"));
                tautoridad5.setText(cs.getString("v_autoridad5"));
                tautoridad6.setText(cs.getString("v_autoridad6"));
                tautoridad7.setText(cs.getString("v_autoridad7"));

                tfecha1.setText(cs.getString("v_fecha1"));
                tfecha2.setText(cs.getString("v_fecha2"));
                tfecha3.setText(cs.getString("v_fecha3"));
                tfecha4.setText(cs.getString("v_fecha4"));
                tfecha5.setText(cs.getString("v_fecha5"));
                tfecha6.setText(cs.getString("v_fecha6"));
                tfecha7.setText(cs.getString("v_fecha7"));

                tnumero1.setText(cs.getString("v_numero1"));
                tnumero2.setText(cs.getString("v_numero2"));
                tnumero3.setText(cs.getString("v_numero3"));
                tnumero4.setText(cs.getString("v_numero4"));
                tnumero5.setText(cs.getString("v_numero5"));
                tnumero6.setText(cs.getString("v_numero6"));
                
                if (cs.getString("v_numero7").equals("0"))
                    tnumero7.setText("");
                else
                    tnumero7.setText(cs.getString("v_numero7"));
                
                tnumero8.setText(cs.getString("v_numero8"));

                
                tvalor1.setText(cs.getString("v_valor1"));
                tvalor2.setText(cs.getString("v_valor2"));
                tvalor3.setText(cs.getString("v_valor3"));
                tvalor4.setText(cs.getString("v_valor4"));
                tvalor5.setText(cs.getString("v_valor5"));
                tvalor6.setText(cs.getString("v_valor6"));
                
                
                if (cs.getString("v_valor7").equals("0.0"))
                    tvalor7.setText("");
                else
                    tvalor7.setText(cs.getString("v_valor7"));
                
                
                tvalor8.setText(cs.getString("v_valor8"));
                
                testado1.setText(cs.getString("v_estado1"));
                testado2.setText(cs.getString("v_estado2"));
                testado3.setText(cs.getString("v_estado3"));
                testado4.setText(cs.getString("v_estado4"));
                testado5.setText(cs.getString("v_estado5"));
                testado6.setText(cs.getString("v_estado6"));
                testado7.setText(cs.getString("v_estado7"));
                
                tproceso1.setText(cs.getString("v_proceso1"));
                tproceso2.setText(cs.getString("v_proceso2"));
                tproceso3.setText(cs.getString("v_proceso3"));
                tproceso4.setText(cs.getString("v_proceso4"));
                tproceso5.setText(cs.getString("v_proceso5"));
                tproceso6.setText(cs.getString("v_proceso6"));
                tproceso7.setText(cs.getString("v_proceso7"));
                
                
            }
            else {
                
                limpiarCampos();
                
            }
            
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    private void validarRegistro() throws Exception
    {
        
           if (tcuenta1.getText() == null)
                throw new Exception("Consulte datos antes de registrar");

            if (tcuenta1.getText().toString().length() == 0 )
                throw new Exception("Consulte datos antes de registrar");
            
           
            if (dbanco.getValue().toString().equals("51"))
            {
               
               if (tproceso1.getText() == null )
                   tproceso1.setText("");
               
               if (tproceso2.getText() == null )
                   tproceso2.setText("");
               
               if (tproceso3.getText() == null )
                   tproceso3.setText("");
               
               if (tproceso4.getText() == null )
                   tproceso4.setText("");
               
               if (tproceso5.getText() == null )
                   tproceso5.setText("");
               
               if (tproceso6.getText() == null )
                   tproceso6.setText("");
               
               if (tproceso7.getText() == null )
                   tproceso7.setText("");
               
               if (tproceso1.getText() == null &&
                    tproceso2.getText() == null &&
                    tproceso3.getText() == null &&
                    tproceso4.getText() == null &&
                    tproceso5.getText() == null &&
                    tproceso6.getText() == null &&
                    tproceso7.getText() == null )
                throw new Exception("Para Davivienda se requiere numero de proceso");
                        
                if (tproceso1.getText().toString().length() == 0 &&
                    tproceso2.getText().toString().length() == 0 &&
                    tproceso3.getText().toString().length() == 0 &&
                    tproceso4.getText().toString().length() == 0 &&
                    tproceso5.getText().toString().length() == 0 &&
                    tproceso6.getText().toString().length() == 0 &&
                    tproceso7.getText().toString().length() == 0 )
                throw new Exception("Para Davivienda se requiere numero de proceso");
                    
            }
     
    }

    public String BRegsitrar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            

            validar();
            
            validarRegistro ();
            
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.regControlenvio);
            
            cs.setString("v_usuario", getSessionBean1().getUser());
            cs.setString("v_idbanco",this.dbanco.getValue().toString());
            
            java.sql.Date fec = new java.sql.Date(this.clFechaIni.getSelectedDate().getTime());
            cs.setDate("v_fecTrf", fec);
            
            regParametro(cs,"v_cuenta1",tcuenta1);
            regParametro(cs,"v_cuenta2",tcuenta2);
            regParametro(cs,"v_cuenta3",tcuenta3);
            regParametro(cs,"v_cuenta4",tcuenta4);
            regParametro(cs,"v_cuenta5",tcuenta5);
            regParametro(cs,"v_cuenta6",tcuenta6);
            regParametro(cs,"v_cuenta7",tcuenta7);
            
            regParametro(cs,"v_autoridad1",tautoridad1);
            regParametro(cs,"v_autoridad2",tautoridad2);
            regParametro(cs,"v_autoridad3",tautoridad3);
            regParametro(cs,"v_autoridad4",tautoridad4);
            regParametro(cs,"v_autoridad5",tautoridad5);
            regParametro(cs,"v_autoridad6",tautoridad6);
            regParametro(cs,"v_autoridad7",tautoridad7);
            
            regParametro(cs,"v_fecha1",tfecha1);
            regParametro(cs,"v_fecha2",tfecha2);
            regParametro(cs,"v_fecha3",tfecha3);
            regParametro(cs,"v_fecha4",tfecha4);
            regParametro(cs,"v_fecha5",tfecha5);
            regParametro(cs,"v_fecha6",tfecha6);
            regParametro(cs,"v_fecha7",tfecha7);

            regParametro(cs,"v_numero1",tnumero1);
            regParametro(cs,"v_numero2",tnumero2);
            regParametro(cs,"v_numero3",tnumero3);
            regParametro(cs,"v_numero4",tnumero4);
            regParametro(cs,"v_numero5",tnumero5);
            regParametro(cs,"v_numero6",tnumero6);
            regParametro(cs,"v_numero7",tnumero7);

            regParametro(cs,"v_valor1",tvalor1);
            regParametro(cs,"v_valor2",tvalor2);
            regParametro(cs,"v_valor3",tvalor3);
            regParametro(cs,"v_valor4",tvalor4);
            regParametro(cs,"v_valor5",tvalor5);
            regParametro(cs,"v_valor6",tvalor6);
            regParametro(cs,"v_valor7",tvalor7);

            regParametro(cs,"v_estado1",testado1);
            regParametro(cs,"v_estado2",testado2);
            regParametro(cs,"v_estado3",testado3);
            regParametro(cs,"v_estado4",testado4);
            regParametro(cs,"v_estado5",testado5);
            regParametro(cs,"v_estado6",testado6);
            regParametro(cs,"v_estado7",testado7);

            if (this.dbanco.getValue().toString().equals("52"))
            {
                tproceso1.setText("Enviado");
                tproceso2.setText("Enviado");
                tproceso3.setText("Enviado");
                tproceso4.setText("Enviado");
                tproceso5.setText("Enviado");
                tproceso6.setText("Enviado");
                tproceso7.setText("Enviado");
                
            }
            regParametro(cs,"v_proceso1",tproceso1);
            regParametro(cs,"v_proceso2",tproceso2);
            regParametro(cs,"v_proceso3",tproceso3);
            regParametro(cs,"v_proceso4",tproceso4);
            regParametro(cs,"v_proceso5",tproceso5);
            regParametro(cs,"v_proceso6",tproceso6);
            regParametro(cs,"v_proceso7",tproceso7);
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("v_cod_error", java.sql.Types.INTEGER);
            cs.registerOutParameter("v_msg_error", java.sql.Types.VARCHAR);


            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            info( cs.getString("v_msg_error"));
            
            if (cs.getInt("v_cod_error") == 0) {
                limpiarCampos();
            
            }
            
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }

    private void regParametro(CallableStatement cs, String parametro, TextField tControl) throws SQLException {
        if (tControl.getText() == null)
            cs.setString(parametro,"");
        else
            cs.setString(parametro,tControl.getText().toString());
    }

    public void limpiarCampos()
    {
                tcuenta1.setText("");
                tcuenta2.setText("");
                tcuenta3.setText("");
                tcuenta4.setText("");
                tcuenta5.setText("");
                tcuenta6.setText("");
                tcuenta7.setText("");

                tautoridad1.setText("");
                tautoridad2.setText("");
                tautoridad3.setText("");
                tautoridad4.setText("");
                tautoridad5.setText("");
                tautoridad6.setText("");
                tautoridad7.setText("");

                tfecha1.setText("");
                tfecha2.setText("");
                tfecha3.setText("");
                tfecha4.setText("");
                tfecha5.setText("");
                tfecha6.setText("");
                tfecha7.setText("");

                tnumero1.setText("");
                tnumero2.setText("");
                tnumero3.setText("");
                tnumero4.setText("");
                tnumero5.setText("");
                tnumero6.setText("");
                tnumero7.setText("");
                tnumero8.setText("");

                tvalor1.setText("");
                tvalor2.setText("");
                tvalor3.setText("");
                tvalor4.setText("");
                tvalor5.setText("");
                tvalor6.setText("");
                tvalor7.setText("");
                tvalor8.setText("");

                testado1.setText("");
                testado2.setText("");
                testado3.setText("");
                testado4.setText("");
                testado5.setText("");
                testado6.setText("");
                testado7.setText("");

                tproceso1.setText("");
                tproceso2.setText("");
                tproceso3.setText("");
                tproceso4.setText("");
                tproceso5.setText("");
                tproceso6.setText("");
                tproceso7.setText("");
        
    }
    
    public void dbanco_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        limpiarCampos();
        if (dbanco.getValue().toString().equals("52"))
        {
                tproceso1.setReadOnly(true);
                tproceso2.setReadOnly(true);
                tproceso3.setReadOnly(true);
                tproceso4.setReadOnly(true);
                tproceso5.setReadOnly(true);
                tproceso6.setReadOnly(true);
                tproceso7.setReadOnly(true);
            
          
        }
        else
        {
                tproceso1.setReadOnly(false);
                tproceso2.setReadOnly(false);
                tproceso3.setReadOnly(false);
                tproceso4.setReadOnly(false);
                tproceso5.setReadOnly(false);
                tproceso6.setReadOnly(false);
                tproceso7.setReadOnly(false);
        }
    }
}
    


    
