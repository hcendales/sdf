/*
 * InformacionFCM.java
 *
 * Created on November 2, 2007, 4:39 PM
 * Copyright cristina
 */
package wasimit;

import com.sun.rave.web.ui.component.Checkbox;
import java.util.regex.*;


import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.DropDown;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import javax.faces.FacesException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.event.ValueChangeEvent;
import javax.faces.validator.LongRangeValidator;
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
public class InformacionFCM extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        bancoDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
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
    
    private TextField tfNitFcm = new TextField();
    
    public TextField getTfNitFcm() {
        return tfNitFcm;
    }
    
    public void setTfNitFcm(TextField tf) {
        this.tfNitFcm = tf;
    }
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    private TextField tfCorreo = new TextField();
    
    public TextField getTfCorreo() {
        return tfCorreo;
    }
    
    public void setTfCorreo(TextField tf) {
        this.tfCorreo = tf;
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
    
    private Label label13 = new Label();
    
    public Label getLabel13() {
        return label13;
    }
    
    public void setLabel13(Label l) {
        this.label13 = l;
    }
    
    private TextField tfIva = new TextField();
    
    public TextField getTfIva() {
        return tfIva;
    }
    
    public void setTfIva(TextField tf) {
        this.tfIva = tf;
    }
    
    private TextField tfRetencion = new TextField();
    
    public TextField getTfRetencion() {
        return tfRetencion;
    }
    
    public void setTfRetencion(TextField tf) {
        this.tfRetencion = tf;
    }
    
    private TextField tfTimbreTercero = new TextField();
    
    public TextField getTfTimbreTercero() {
        return tfTimbreTercero;
    }
    
    public void setTfTimbreTercero(TextField tf) {
        this.tfTimbreTercero = tf;
    }
    
    private TextField tfTimbreFCM = new TextField();
    
    public TextField getTfTimbreFCM() {
        return tfTimbreFCM;
    }
    
    public void setTfTimbreFCM(TextField tf) {
        this.tfTimbreFCM = tf;
    }
    
    private TextField tfNitSevial = new TextField();
    
    public TextField getTfNitSevial() {
        return tfNitSevial;
    }
    
    public void setTfNitSevial(TextField tf) {
        this.tfNitSevial = tf;
    }
    
    private TextField tfNitPolca = new TextField();
    
    public TextField getTfNitPolca() {
        return tfNitPolca;
    }
    
    public void setTfNitPolca(TextField tf) {
        this.tfNitPolca = tf;
    }
    
    private Label label14 = new Label();
    
    public Label getLabel14() {
        return label14;
    }
    
    public void setLabel14(Label l) {
        this.label14 = l;
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
    
    private Label label17 = new Label();
    
    public Label getLabel17() {
        return label17;
    }
    
    public void setLabel17(Label l) {
        this.label17 = l;
    }
    
    private TextField tfEjecutivo = new TextField();
    
    public TextField getTfEjecutivo() {
        return tfEjecutivo;
    }
    
    public void setTfEjecutivo(TextField tf) {
        this.tfEjecutivo = tf;
    }
    
    private TextField tfNacional = new TextField();
    
    public TextField getTfNacional() {
        return tfNacional;
    }
    
    public void setTfNacional(TextField tf) {
        this.tfNacional = tf;
    }
    
    private TextField tfContador = new TextField();
    
    public TextField getTfContador() {
        return tfContador;
    }
    
    public void setTfContador(TextField tf) {
        this.tfContador = tf;
    }
    
    private TextField tfCoodinador = new TextField();
    
    public TextField getTfCoodinador() {
        return tfCoodinador;
    }
    
    public void setTfCoodinador(TextField tf) {
        this.tfCoodinador = tf;
    }
    
    private Button btActualizar = new Button();
    
    public Button getBtActualizar() {
        return btActualizar;
    }
    
    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider bancoDataProvider1 = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider1() {
        return bancoDataProvider1;
    }
    
    public void setBancoDataProvider1(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider1 = crsdp;
    }
    
    private Label label18 = new Label();
    
    public Label getLabel18() {
        return label18;
    }
    
    public void setLabel18(Label l) {
        this.label18 = l;
    }
    
    private Label label19 = new Label();
    
    public Label getLabel19() {
        return label19;
    }
    
    public void setLabel19(Label l) {
        this.label19 = l;
    }
    
    private Label label20 = new Label();
    
    public Label getLabel20() {
        return label20;
    }
    
    public void setLabel20(Label l) {
        this.label20 = l;
    }
    
    private Label label21 = new Label();
    
    public Label getLabel21() {
        return label21;
    }
    
    public void setLabel21(Label l) {
        this.label21 = l;
    }
    
    private Label label22 = new Label();
    
    public Label getLabel22() {
        return label22;
    }
    
    public void setLabel22(Label l) {
        this.label22 = l;
    }
    
    private Label label23 = new Label();
    
    public Label getLabel23() {
        return label23;
    }
    
    public void setLabel23(Label l) {
        this.label23 = l;
    }
    
    private Label label25 = new Label();
    
    public Label getLabel25() {
        return label25;
    }
    
    public void setLabel25(Label l) {
        this.label25 = l;
    }
    
    private TextField tfPuente = new TextField();
    
    public TextField getTfPuente() {
        return tfPuente;
    }
    
    public void setTfPuente(TextField tf) {
        this.tfPuente = tf;
    }
    
    private TextField tfFondo = new TextField();
    
    public TextField getTfFondo() {
        return tfFondo;
    }
    
    public void setTfFondo(TextField tf) {
        this.tfFondo = tf;
    }
    
    private TextField tfPolca = new TextField();
    
    public TextField getTfPolca() {
        return tfPolca;
    }
    
    public void setTfPolca(TextField tf) {
        this.tfPolca = tf;
    }
    
    private TextField textField4 = new TextField();
    
    public TextField getTextField4() {
        return textField4;
    }
    
    public void setTextField4(TextField tf) {
        this.textField4 = tf;
    }
    
    private TextField tfFcmA = new TextField();
    
    public TextField getTfFcmA() {
        return tfFcmA;
    }
    
    public void setTfFcmA(TextField tf) {
        this.tfFcmA = tf;
    }
    
    private TextField tfIngreso = new TextField();
    
    public TextField getTfIngreso() {
        return tfIngreso;
    }
    
    public void setTfIngreso(TextField tf) {
        this.tfIngreso = tf;
    }
    
    private TextField tfFcm = new TextField();
    
    public TextField getTfFcm() {
        return tfFcm;
    }
    
    public void setTfFcm(TextField tf) {
        this.tfFcm = tf;
    }
    
    private Label label26 = new Label();
    
    public Label getLabel26() {
        return label26;
    }
    
    public void setLabel26(Label l) {
        this.label26 = l;
    }
    
    private Label label27 = new Label();
    
    public Label getLabel27() {
        return label27;
    }
    
    public void setLabel27(Label l) {
        this.label27 = l;
    }
    
    private TextField tfRteIva = new TextField();
    
    public TextField getTfRteIva() {
        return tfRteIva;
    }
    
    public void setTfRteIva(TextField tf) {
        this.tfRteIva = tf;
    }
    
    private TextField tfTimCon = new TextField();
    
    public TextField getTfTimCon() {
        return tfTimCon;
    }
    
    public void setTfTimCon(TextField tf) {
        this.tfTimCon = tf;
    }
    
    private TextField tfPuenteExt = new TextField();
    
    public TextField getTfPuenteExt() {
        return tfPuenteExt;
    }
    
    public void setTfPuenteExt(TextField tf) {
        this.tfPuenteExt = tf;
    }
    
    private Label label29 = new Label();
    
    public Label getLabel29() {
        return label29;
    }
    
    public void setLabel29(Label l) {
        this.label29 = l;
    }
    
    private Label label30 = new Label();
    
    public Label getLabel30() {
        return label30;
    }
    
    public void setLabel30(Label l) {
        this.label30 = l;
    }
    
    private Label label31 = new Label();
    
    public Label getLabel31() {
        return label31;
    }
    
    public void setLabel31(Label l) {
        this.label31 = l;
    }
    
    private Label label32 = new Label();
    
    public Label getLabel32() {
        return label32;
    }
    
    public void setLabel32(Label l) {
        this.label32 = l;
    }

    private TextField tfeDirectorEjecutivo = new TextField();
    
    public TextField getTfeDirectorEjecutivo() {
        return tfeDirectorEjecutivo;
    }
    
    public void setTfeDirectorEjecutivo(TextField tf) {
        this.tfeDirectorEjecutivo = tf;
    }
    
    private TextField tfeDirectorNacional = new TextField();
    
    public TextField getTfeDirectorNacional() {
        return tfeDirectorNacional;
    }
    
    public void setTfeDirectorNacional(TextField tf) {
        this.tfeDirectorNacional = tf;
    }
    
    private TextField tfeContadorGeneral = new TextField();
    
    public TextField getTfeContadorGeneral() {
        return tfeContadorGeneral;
    }
    
    public void setTfeContadorGeneral(TextField tf) {
        this.tfeContadorGeneral = tf;
    }
    
    private TextField tfeCoordinadorFinanciero = new TextField();
    
    public TextField getTfeCoordinadorFinanciero() {
        return tfeCoordinadorFinanciero;
    }
    
    public void setTfeCoordinadorFinanciero(TextField tf) {
        this.tfeCoordinadorFinanciero = tf;
    }
    
    private LongRangeValidator longRangeValidator1 = new LongRangeValidator();
    
    public LongRangeValidator getLongRangeValidator1() {
        return longRangeValidator1;
    }
    
    public void setLongRangeValidator1(LongRangeValidator lrv) {
        this.longRangeValidator1 = lrv;
    }
    
    private LongRangeValidator longRangeValidator2 = new LongRangeValidator();
    
    public LongRangeValidator getLongRangeValidator2() {
        return longRangeValidator2;
    }
    
    public void setLongRangeValidator2(LongRangeValidator lrv) {
        this.longRangeValidator2 = lrv;
    }

    private Label label33 = new Label();

    public Label getLabel33() {
        return label33;
    }

    public void setLabel33(Label l) {
        this.label33 = l;
    }

    private Checkbox cbSeguridad = new Checkbox();

    public Checkbox getCbSeguridad() {
        return cbSeguridad;
    }

    public void setCbSeguridad(Checkbox c) {
        this.cbSeguridad = c;
    }

    private Label label3 = new Label();

    public Label getLabel3() {
        return label3;
    }

    public void setLabel3(Label l) {
        this.label3 = l;
    }

    private TextField turl = new TextField();

    public TextField getTurl() {
        return turl;
    }

    public void setTurl(TextField tf) {
        this.turl = tf;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private TextField tfDias = new TextField();

    public TextField getTfDias() {
        return tfDias;
    }

    public void setTfDias(TextField tf) {
        this.tfDias = tf;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public InformacionFCM() {
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
        
        if ( ! this.isPostBack() )
            bconsultar_action();
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("InformacionFCM Initialization Failure", e);
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
        bancoDataProvider.close();
        bancoDataProvider1.close();
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
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
    public String btActualizar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
             try {
            
            
            
            
            // Validaciones
            //Correo
            
            if ( tfCorreo.getText() == null )
                throw new Exception("fcm e-mail requerido");
            
            if ( tfCorreo.getText().toString().length() == 0 )
                throw new Exception("fcm e-mail requerido");

            if(!validacionMail(tfCorreo.getText().toString()))
                throw new Exception("fcm e-mail invalido");
      

            if ( tfIva.getText() == null )
                throw new Exception("El valor del iva es requerido");
            
            if ( tfIva.getText().toString().length() == 0 )
                throw new Exception("El valor del iva es requerido");
            //IVA
            try {
                double num = Double.parseDouble((String)this.tfIva.getText());
                if (num < 0 )
                    throw new Exception("El valor IVA debe ser > o = 0");
                if (num > 100)
                    throw new Exception("El valor IVA debe ser < o = 100");
                
            } catch (NumberFormatException Ex) {
                throw new Exception("El valor IVA debe ser numerico");
            }
            //Retención Fuente
            try {
                double num = Double.parseDouble((String)this.tfRetencion.getText());
                if (num < 0 )
                    throw new Exception("El valor Retención Fuente debe ser > o = 0");
                if (num > 100)
                    throw new Exception("El valor Retención Fuente debe ser < o = 100");
                
            } catch (NumberFormatException Ex) {
                throw new Exception("El valor Retención Fuente debe ser numerico");
            }
            //Impuesto Timbre Terceros
            try {
                double num = Double.parseDouble((String)this.tfTimbreTercero.getText());
                if (num < 0 )
                    throw new Exception("El valor Impuesto Timbre Terceros debe ser > o = 0");
                if (num > 100)
                    throw new Exception("El valor Impuesto Timbre Terceros debe ser < o = 100");
                
            } catch (NumberFormatException Ex) {
                throw new Exception("El valor Impuesto Timbre Terceros debe ser numerico");
            }
            //Impuesto Timbre FCM
            try {
                double num = Double.parseDouble((String)this.tfTimbreFCM.getText());
                if (num < 0 )
                    throw new Exception("El valor Impuesto Timbre FCM debe ser > o = 0");
                if (num > 100)
                    throw new Exception("El valor Impuesto Timbre FCM debe ser < o = 100");
                
            } catch (NumberFormatException Ex) {
                throw new Exception("El valor Impuesto Timbre FCM debe ser numerico");
            }
            //RETEIVA
            try {
                double num = Double.parseDouble((String)this.tfRteIva.getText());
                if (num < 0 )
                    throw new Exception("El valor RETEIVA debe ser > o = 0");
                if (num > 100)
                    throw new Exception("El valor RETEIVA debe ser < o = 100");
                
            } catch (NumberFormatException Ex) {
                throw new Exception("El valor RETEIVA debe ser numerico");
            }
            //Timbre Contravencional
            try {
                double num = Double.parseDouble((String)this.tfTimCon.getText());
                if (num < 0 )
                    throw new Exception("El valor Timbre Contravencional debe ser > o = 0");
                if (num > 100)
                    throw new Exception("El valor Timbre Contravencional debe ser < o = 100");
                
            } catch (NumberFormatException Ex) {
                throw new Exception("El valor Timbre Contravencional debe ser numerico");
            }



            if ( tfRetencion.getText() == null )
                throw new Exception("El valor de Retencion es requerido");
            
            if ( tfRetencion.getText().toString().length() == 0 )
                throw new Exception("El valor de Retencion es requerido");
        
            try {
                double num = Double.parseDouble((String)this.tfRetencion.getText());
                if (num < 0 )
                    throw new Exception("El valor de Retencion ser > 0");
                
            } catch (NumberFormatException Ex) {
                 throw new Exception("El valor de Retencion debe ser numerico");
            }

            if ( tfTimbreTercero.getText() == null )
                throw new Exception("El valor de Timbre tercero es requerido");
            
            if ( tfTimbreTercero.getText().toString().length() == 0 )
                throw new Exception("El valor de Timbre tercero es requerido");
        
            try {
                double num = Double.parseDouble((String)this.tfTimbreTercero.getText());
                if (num < 0 )
                    throw new Exception("El valor de Timbre tercero ser >= 0");
                
            } catch (NumberFormatException Ex) {
                 throw new Exception("El valor de Timbre tercero debe ser numerico");
            }

            if ( tfTimbreFCM.getText() == null )
                throw new Exception("El valor de Timbre FCM es requerido");
            
            if ( tfTimbreFCM.getText().toString().length() == 0 )
                throw new Exception("El valor de Timbre FCM es requerido");
        
            try {
                double num = Double.parseDouble((String)this.tfTimbreFCM.getText());
                if (num < 0 )
                    throw new Exception("El valor de Timbre FCM ser >= 0");
                
            } catch (NumberFormatException Ex) {
                 throw new Exception("El valor de Timbre FCM debe ser numerico");
            }

            if ( tfRteIva.getText() == null )
                throw new Exception("El valor de RETEIVA es requerido");
            
            if ( tfRteIva.getText().toString().length() == 0 )
                throw new Exception("El valor de RETEIVA es requerido");
        
            try {
                double num = Double.parseDouble((String)this.tfRteIva.getText());
                if (num < 0 )
                    throw new Exception("El valor de RETEIVA ser >= 0");
                
            } catch (NumberFormatException Ex) {
                 throw new Exception("El valor de RETEIVA debe ser numerico");
            }

            if ( tfTimCon.getText() == null )
                throw new Exception("El valor de Timbre Contravencional es requerido");
            
            if ( tfTimCon.getText().toString().length() == 0 )
                throw new Exception("El valor de Timbre Contravencional es requerido");
        
            try {
                double num = Double.parseDouble((String)this.tfTimCon.getText());
                if (num < 0 )
                    throw new Exception("El valor de Timbre Contravencional ser >= 0");
                
            } catch (NumberFormatException Ex) {
                 throw new Exception("El valor de Timbre Contravencional debe ser numerico");
            }

            if ( tfNitSevial.getText() == null )
                throw new Exception("El valor de NIT SEVIAL es requerido");
            
            if ( tfNitSevial.getText().toString().length() == 0 )
                throw new Exception("El valor de NIT SEVIAL es requerido");
        
            try {
                
                double num = Double.parseDouble((String)this.tfNitSevial.getText());
                if (num < 8000000000.0 )
                    throw new Exception("El valor de NIT SEVIAL incorrecto");
                
            } catch (NumberFormatException Ex) {
                 throw new Exception("El valor de NIT SEVIAL debe ser numerico");
            }
            
            if ( tfNitPolca.getText() == null )
                throw new Exception("El valor de NIT POLCA es requerido");
            
            if ( tfNitPolca.getText().toString().length() == 0 )
                throw new Exception("El valor de NIT POLCA es requerido");
        
            try {
                double num = Double.parseDouble((String)this.tfNitPolca.getText());
                if (num < 8000000000.0 )
                    throw new Exception("El valor de NIT POLCA incorrecto");
                
            } catch (NumberFormatException Ex) {
                 throw new Exception("El valor de NIT POLCA debe ser numerico");
            }
        
            if ( tfEjecutivo.getText() == null)
                throw new Exception("Director Ejecutivo requerido");
            
            if ( tfEjecutivo.getText().toString().length() == 0)
                throw new Exception("Director Ejecutivo requerido");

            if ( tfNacional.getText() == null)
                throw new Exception("Director Nacional requerido");
            
            if ( tfNacional.getText().toString().length() == 0)
                throw new Exception("Director Nacional requerido");

            if ( tfContador.getText() == null)
                throw new Exception("Contador General requerido");
            
            if ( tfContador.getText().toString().length() == 0)
                throw new Exception("Contador General requerido");

            if ( tfCoodinador.getText() == null)
                throw new Exception("Coodinardor Financiero requerido");
            
            if ( tfCoodinador.getText().toString().length() == 0)
                throw new Exception("Coordinador Financiero requerido");

            //email
            if ( tfeDirectorEjecutivo.getText() == null)
                throw new Exception("Correo electronico Director Ejecutivo requerido");
            
            if ( tfeDirectorEjecutivo.getText().toString().length() == 0)
                throw new Exception("Correo electronico Director Ejecutivo requerido");

            if ( tfeDirectorNacional.getText() == null)
                throw new Exception("Correo electronico Director Nacional requerido");
            
            if ( tfeDirectorNacional.getText().toString().length() == 0)
                throw new Exception("Correo electronico Director Nacional requerido");

            if ( tfeContadorGeneral.getText() == null)
                throw new Exception("Correo electronico Contador General requerido");
            
            if ( tfeContadorGeneral.getText().toString().length() == 0)
                throw new Exception("Correo electronico Contador General requerido");

            if ( tfeCoordinadorFinanciero.getText() == null)
                throw new Exception("Correo electronico Coodinardor Financiero requerido");
            
            if ( tfeCoordinadorFinanciero.getText().toString().length() == 0)
                throw new Exception("Correo electronico Coordinador Financiero requerido");
           
            //Director Ejecutivo
            if(!validacionMail(tfeDirectorEjecutivo.getText().toString()))
                throw new Exception("Correo electronico Director Ejecutivo Invalido");
            //Director Nacional
            if(!validacionMail(tfeDirectorNacional.getText().toString()))
                throw new Exception("Correo electronico Director Nacional Invalido");
            //Contador General
            if(!validacionMail(tfeContadorGeneral.getText().toString()))
                throw new Exception("Correo electronico Contador General Invalido");
            //Coodinador Financiero
            if(!validacionMail(this.tfeCoordinadorFinanciero.getText().toString()))
                throw new Exception("Correo electronico Coodinador Financiero Invalido");

            //Las cuentas contables deben existir ser numericos de 8 long y >= 0
            //Cuenta por pagar operadores
            
            if ( tfPuente.getText() == null )
                tfPuente.setText("0");
            if ( tfFondo.getText() == null )
                tfFondo.setText("0");
            if ( tfPolca.getText() == null )
                tfPolca.setText("0");
            if ( tfFcm.getText() == null )
                tfFcm.setText("0");
            if ( tfFcmA.getText() == null )
                tfFcmA.setText("0");
            if ( tfIngreso.getText() == null )
                tfIngreso.setText("0");
            if ( tfPuenteExt.getText() == null )
                tfPuenteExt.setText("0");
            
            
            double num = 0;
            
            try {
                num = Double.parseDouble((String)this.tfPuente.getText());
                if (num < 1000000000)
                    throw new Exception("Cuenta por pagar operadores debe ser numerico");
                
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta por pagar operadores debe ser numerico");
            }
            //Fondo Cobertura - Simit
            try {
                num = Double.parseDouble((String)this.tfFondo.getText());
                if (num < 1000000000)
                    throw new Exception("Cuenta Fondo Cobertura debe ser numerico");
                
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Fondo Cobertura debe ser numerico");
            }
            
            
            //Simit Polca 39.78%
            try {
                num = Double.parseDouble((String)this.tfPolca.getText());
                 if (num < 1000000000)
                    throw new Exception("Cuenta Simit Polca 39.78% debe ser numerico");
                
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Simit Polca 39.78% debe ser numerico");
            }
            
           //Libre Disposicion
            try {
                num = Double.parseDouble((String)this.tfFcm.getText());
                 if (num < 1000000000)
                    throw new Exception("Cuenta Libre Disposicion debe ser numerico");
                
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Libre Disposicion debe ser numerico");
            }

            //FCM 1.8%
            try {
                num = Double.parseDouble((String)this.tfFcmA.getText());
                 if (num < 1000000000)
                    throw new Exception("Cuenta FCM 1.8% debe ser numerico");
                
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta FCM 1.8% debe ser numerico");
            }

            //FCM (Simit) Ingreso
            try {
                num = Double.parseDouble((String)this.tfIngreso.getText());
                 if (num < 1000000000)
                    throw new Exception("Cuenta FCM (Simit) Ingreso debe ser numerico");
                
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta FCM (Simit) Ingreso debe ser numerico");
            }

            
            //Cuenta puente 4.5%
            try {
                num = Double.parseDouble((String)this.tfPuenteExt.getText());
                 if (num < 1000000000)
                    throw new Exception("Cuenta puente 4.5% - 19% debe ser numerico");
                
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta puente 4.5% - 19% debe ser numerico");
            }

            if (cbSeguridad.isChecked())
                if (this.turl.getText() == null)
                    throw new Exception("Url debe ser digitada");

            if (cbSeguridad.isChecked())
                if (this.turl.getText().toString().length() == 0)
                    throw new Exception("Url debe ser digitada");

             //dias activacion novedades > 0
            try {
                num = Double.parseDouble((String)this.tfDias.getText());
                if (num < 0 )
                    throw new Exception("Numero dias activacion debe ser > 0");
                if (num > 99)
                    throw new Exception("Numero dias debe ser < 100");
                
            } catch (NumberFormatException Ex) {
                throw new Exception("Numero dias activacion debe ser numerico");
            }

            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.fcmAdd);

            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfNitFcm.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            cs.setString(++pos, (String) this.tfCorreo.getText());
            cs.setString(++pos, "00");
            cs.setString(++pos, "AHO");
            cs.setString(++pos, "");
            cs.setString(++pos, "00");
            cs.setString(++pos, "AHO");
            cs.setString(++pos, "");
            cs.setDouble(++pos, Double.parseDouble((String)this.tfIva.getText()));
            cs.setDouble(++pos, Double.parseDouble((String)this.tfRetencion.getText()));
            cs.setDouble(++pos, Double.parseDouble((String)this.tfTimbreTercero.getText()));
            cs.setDouble(++pos, Double.parseDouble((String)this.tfTimbreFCM.getText()));
            cs.setString(++pos, (String) this.tfEjecutivo.getText());
            
            cs.setString(++pos, (String) this.tfNacional.getText());
            cs.setString(++pos, (String) this.tfContador.getText());
            cs.setString(++pos, (String) this.tfCoodinador.getText());
            cs.setString(++pos, (String) this.tfNitPolca.getText());
            cs.setString(++pos, (String) this.tfNitSevial.getText());
            
            cs.setString(++pos, (String) this.tfPuente.getText());
            cs.setString(++pos, (String) this.tfFondo.getText());
            cs.setString(++pos, (String) this.tfPolca.getText());
            cs.setString(++pos, (String) this.tfFcm.getText());
            cs.setString(++pos, (String) this.tfFcmA.getText());
            cs.setString(++pos, (String) this.tfIngreso.getText());
            cs.setString(++pos, (String) this.tfPuenteExt.getText());
            cs.setString(++pos, (String) this.tfPuenteExt.getText());
            
            cs.setDouble(++pos, Double.parseDouble((String)this.tfRteIva.getText()));
            cs.setDouble(++pos, Double.parseDouble((String)this.tfTimCon.getText()));
            
            cs.setString(++pos, "00");
            cs.setString(++pos, "AHO");           
            cs.setString(++pos, "");
            
            cs.setString(++pos, (String) this.tfeDirectorEjecutivo.getText());
            cs.setString(++pos, (String) this.tfeDirectorNacional.getText());
            cs.setString(++pos, (String) this.tfeContadorGeneral.getText());
            cs.setString(++pos, (String) this.tfeCoordinadorFinanciero.getText());
            cs.setInt(++pos, Integer.parseInt( (String)this.tfDias.getText() ));
            
            if (cbSeguridad.isChecked())
                cs.setInt(++pos, 1);
            else
                cs.setInt(++pos, 0);
     
            cs.setString(++pos, (String) this.turl.getText());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(40);
            
            info(resultado);
            
        } 
        catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
        
    }
    
    public String bconsultar_action() {
        
        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.fcmQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, "8000826650");
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            cs.registerOutParameter(++pos, java.sql.Types.VARCHAR);
            
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(40);
            info(resultado);
            
            this.tfCorreo.setText((String)cs.getString(3));
            this.tfIva.setText((String)cs.getString(10));
            this.tfRetencion.setText((String)cs.getString(11));
            this.tfTimbreTercero.setText((String)cs.getString(12));
            this.tfTimbreFCM.setText((String)cs.getString(13));
            this.tfEjecutivo.setText((String)cs.getString(14));
            
            this.tfNacional.setText((String)cs.getString(15));
            this.tfContador.setText((String)cs.getString(16));
            this.tfCoodinador.setText((String)cs.getString(17));
            this.tfNitPolca.setText((String)cs.getString(18));
            this.tfNitSevial.setText((String)cs.getString(19));
            
            this.tfPuente.setText((String)cs.getString(20));
            this.tfFondo.setText((String)cs.getString(21));
            this.tfPolca.setText((String)cs.getString(22));
            this.tfFcm.setText((String)cs.getString(23));
            this.tfFcmA.setText((String)cs.getString(24));
            this.tfIngreso.setText((String)cs.getString(25));
            this.tfPuenteExt.setText((String)cs.getString(27));
            
            this.tfRteIva.setText((String)cs.getString(28));
            this.tfTimCon.setText((String)cs.getString(29));
            
           
            this.tfeDirectorEjecutivo.setText((String)cs.getString(33));
            this.tfeDirectorNacional.setText((String)cs.getString(34));
            this.tfeContadorGeneral.setText((String)cs.getString(35));
            this.tfeCoordinadorFinanciero.setText((String)cs.getString(36));
            this.tfDias.setText((String)cs.getString(37));
            
            if (cs.getInt(38) == 1)
                this.cbSeguridad.setValue("true");
            else
                this.cbSeguridad.setValue("false");
            
            this.turl.setText((String)cs.getString(39));
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
        
    }
    
    public boolean validacionMail(String email) {
        
        //Set the email pattern string
        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
        
        //Match the given string with the pattern
        Matcher m = p.matcher(email);
        
        //check whether match is found
        return m.matches();
        
    }
    
    
    
    
}


