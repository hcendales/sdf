/*
 * CuentasRecLocal.java
 *
 * Created on November 6, 2007, 12:50 PM
 * Copyright cristina
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.DropDown;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.ImageHyperlink;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.RadioButtonGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.faces.FacesException;
import javax.faces.event.ValueChangeEvent;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class CuentasDispFCM extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        cta_recaudo_fcmDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.cta_recaudo_fcmRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        cta_dispersion_fcmDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.cta_dispersion_fcmRowSet}"));
        ddTipoSimitDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoPolcaADefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoPolcaDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "Seleccione "), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoAcuerdoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "Corriente")});
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
    
    private TextField tfNitFcm = new TextField();
    
    public TextField getTfNitFcm() {
        return tfNitFcm;
    }
    
    public void setTfNitFcm(TextField tf) {
        this.tfNitFcm = tf;
    }
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
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
    
    private CachedRowSetDataProvider cta_recaudo_fcmDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getCta_recaudo_fcmDataProvider() {
        return cta_recaudo_fcmDataProvider;
    }
    
    public void setCta_recaudo_fcmDataProvider(CachedRowSetDataProvider crsdp) {
        this.cta_recaudo_fcmDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private Button btAdicionar = new Button();
    
    public Button getBtAdicionar() {
        return btAdicionar;
    }
    
    public void setBtAdicionar(Button b) {
        this.btAdicionar = b;
    }

    private CachedRowSetDataProvider cta_dispersion_fcmDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getCta_dispersion_fcmDataProvider() {
        return cta_dispersion_fcmDataProvider;
    }

    public void setCta_dispersion_fcmDataProvider(CachedRowSetDataProvider crsdp) {
        this.cta_dispersion_fcmDataProvider = crsdp;
    }

    private TableColumn tableColumn1 = new TableColumn();

    public TableColumn getTableColumn1() {
        return tableColumn1;
    }

    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }

    private StaticText stIdBancoRec = new StaticText();

    public StaticText getStIdBancoRec() {
        return stIdBancoRec;
    }

    public void setStIdBancoRec(StaticText st) {
        this.stIdBancoRec = st;
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

    private Button bconsultar = new Button();

    public Button getBconsultar() {
        return bconsultar;
    }

    public void setBconsultar(Button b) {
        this.bconsultar = b;
    }

    private TableColumn tableColumn12 = new TableColumn();

    public TableColumn getTableColumn12() {
        return tableColumn12;
    }

    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }

    private Button beliminar = new Button();

    public Button getBeliminar() {
        return beliminar;
    }

    public void setBeliminar(Button b) {
        this.beliminar = b;
    }

    private TextField tfCuentaSimit = new TextField();

    public TextField getTfCuentaSimit() {
        return tfCuentaSimit;
    }

    public void setTfCuentaSimit(TextField tf) {
        this.tfCuentaSimit = tf;
    }

    private Label label9 = new Label();

    public Label getLabel9() {
        return label9;
    }

    public void setLabel9(Label l) {
        this.label9 = l;
    }

    private DropDown ddBancoPolcaA = new DropDown();

    public DropDown getDdBancoPolcaA() {
        return ddBancoPolcaA;
    }

    public void setDdBancoPolcaA(DropDown dd) {
        this.ddBancoPolcaA = dd;
    }

    private DropDown ddBancoPolca = new DropDown();

    public DropDown getDdBancoPolca() {
        return ddBancoPolca;
    }

    public void setDdBancoPolca(DropDown dd) {
        this.ddBancoPolca = dd;
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

    private DropDown ddBancoSimit = new DropDown();

    public DropDown getDdBancoSimit() {
        return ddBancoSimit;
    }

    public void setDdBancoSimit(DropDown dd) {
        this.ddBancoSimit = dd;
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

    private TextField tfCuentaPolcaA = new TextField();

    public TextField getTfCuentaPolcaA() {
        return tfCuentaPolcaA;
    }

    public void setTfCuentaPolcaA(TextField tf) {
        this.tfCuentaPolcaA = tf;
    }

    private DropDown ddTipoSimit = new DropDown();

    public DropDown getDdTipoSimit() {
        return ddTipoSimit;
    }

    public void setDdTipoSimit(DropDown dd) {
        this.ddTipoSimit = dd;
    }

    private DropDown ddTipoPolcaA = new DropDown();

    public DropDown getDdTipoPolcaA() {
        return ddTipoPolcaA;
    }

    public void setDdTipoPolcaA(DropDown dd) {
        this.ddTipoPolcaA = dd;
    }

    private TextField tfCuentaPolca = new TextField();

    public TextField getTfCuentaPolca() {
        return tfCuentaPolca;
    }

    public void setTfCuentaPolca(TextField tf) {
        this.tfCuentaPolca = tf;
    }

    private DropDown ddTipoPolca = new DropDown();

    public DropDown getDdTipoPolca() {
        return ddTipoPolca;
    }

    public void setDdTipoPolca(DropDown dd) {
        this.ddTipoPolca = dd;
    }

    private SingleSelectOptionsList ddTipoSimitDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoSimitDefaultOptions() {
        return ddTipoSimitDefaultOptions;
    }

    public void setDdTipoSimitDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoSimitDefaultOptions = ssol;
    }

    private SingleSelectOptionsList ddTipoPolcaADefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoPolcaADefaultOptions() {
        return ddTipoPolcaADefaultOptions;
    }

    public void setDdTipoPolcaADefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoPolcaADefaultOptions = ssol;
    }

    private SingleSelectOptionsList ddTipoPolcaDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoPolcaDefaultOptions() {
        return ddTipoPolcaDefaultOptions;
    }

    public void setDdTipoPolcaDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoPolcaDefaultOptions = ssol;
    }

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
    }

    private DropDown ddBancoRec = new DropDown();

    public DropDown getDdBancoRec() {
        return ddBancoRec;
    }

    public void setDdBancoRec(DropDown dd) {
        this.ddBancoRec = dd;
    }

    private TableColumn tableColumn2 = new TableColumn();

    public TableColumn getTableColumn2() {
        return tableColumn2;
    }

    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }

    private StaticText staticText1 = new StaticText();

    public StaticText getStaticText1() {
        return staticText1;
    }

    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }

    private Label label3 = new Label();

    public Label getLabel3() {
        return label3;
    }

    public void setLabel3(Label l) {
        this.label3 = l;
    }

    private DropDown ddBancoAcuerdo = new DropDown();

    public DropDown getDdBancoAcuerdo() {
        return ddBancoAcuerdo;
    }

    public void setDdBancoAcuerdo(DropDown dd) {
        this.ddBancoAcuerdo = dd;
    }

    private DropDown ddTipoAcuerdo = new DropDown();

    public DropDown getDdTipoAcuerdo() {
        return ddTipoAcuerdo;
    }

    public void setDdTipoAcuerdo(DropDown dd) {
        this.ddTipoAcuerdo = dd;
    }

    private SingleSelectOptionsList ddTipoAcuerdoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoAcuerdoDefaultOptions() {
        return ddTipoAcuerdoDefaultOptions;
    }

    public void setDdTipoAcuerdoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoAcuerdoDefaultOptions = ssol;
    }

    private TextField tfCuentaAcuerdo = new TextField();

    public TextField getTfCuentaAcuerdo() {
        return tfCuentaAcuerdo;
    }

    public void setTfCuentaAcuerdo(TextField tf) {
        this.tfCuentaAcuerdo = tf;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public CuentasDispFCM() {
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
            log("CuentasRecLocal Initialization Failure", e);
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
        cta_recaudo_fcmDataProvider.close();
        bancoDataProvider.close();
        cta_dispersion_fcmDataProvider.close();
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
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    
    public String btAdicionar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            if (this.ddBancoRec.getValue() == null)
                throw new Exception("Banco Recaudador requerido");

            if (this.ddBancoRec.getValue().toString().equals("00"))
                throw new Exception("Banco Recaudador requerido");
            

            // SIMIT
            if (this.ddBancoSimit.getValue() == null)
                throw new Exception("Banco Libre disposicion SIMIT requerido");

            if (this.ddBancoSimit.getValue().toString().equals("00"))
                throw new Exception("Banco Libre disposicion SIMIT requerido");

            if (this.ddTipoSimit.getValue() == null)
                throw new Exception("Tipo Cuenta Libre disposicion SIMIT requerido");

            if (this.ddTipoSimit.getValue().toString().equals("000"))
                throw new Exception("Tipo Cuenta Libre disposicion SIMIT requerido");

            if (this.tfCuentaSimit.getText() == null)
                throw new Exception("Cuenta Libre disposicion SIMIT requerido");

            if (this.tfCuentaSimit.getText().toString().length() == 0)
                throw new Exception("Cuenta Libre disposicion SIMIT requerido");
            
            try
            {
                float vlr = Float.parseFloat(this.tfCuentaSimit.getText().toString());
                if (vlr < 1 )
                    throw new Exception("Cuenta Libre disposicion SIMIT errada");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta Libre disposicion SIMIT debe ser numerica");
            }
            

            // POLCA
            if (this.ddBancoPolca.getValue() == null)
                throw new Exception("Banco Libre disposicion POLCA requerido");

            if (this.ddBancoPolca.getValue().toString().equals("00"))
                throw new Exception("Banco Libre disposicion POLCA requerido");

            if (this.ddTipoPolca.getValue() == null)
                throw new Exception("Tipo Cuenta Libre disposicion POLCA requerido");

            if (this.ddTipoPolca.getValue().toString().equals("000"))
                throw new Exception("Tipo Cuenta Libre disposicion POLCA requerido");

            if (this.tfCuentaPolca.getText() == null)
                throw new Exception("Cuenta Libre disposicion POLCA requerido");

            if (this.tfCuentaPolca.getText().toString().length() == 0)
                throw new Exception("Cuenta Libre disposicion POLCA requerido");
            
            try
            {
                float vlr = Float.parseFloat(this.tfCuentaPolca.getText().toString());
                if (vlr < 1 )
                    throw new Exception("Cuenta Libre disposicion POLCA errada");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta Libre disposicion POLCA debe ser numerica");
            }

            // 1.8
            if (this.ddBancoPolcaA.getValue() == null)
                throw new Exception("Banco Libre disposicion FCM 1.8% requerido");

            if (this.ddBancoPolcaA.getValue().toString().equals("00"))
                throw new Exception("Banco Libre disposicion FCM 1.8% requerido");

            if (this.ddTipoPolcaA.getValue() == null)
                throw new Exception("Tipo Cuenta Libre disposicion FCM 1.8% requerido");

            if (this.ddTipoPolcaA.getValue().toString().equals("000"))
                throw new Exception("Tipo Cuenta Libre disposicion FCM 1.8% requerido");

            if (this.tfCuentaPolcaA.getText() == null)
                throw new Exception("Cuenta Libre disposicion FCM 1.8% requerido");

            if (this.tfCuentaPolcaA.getText().toString().length() == 0)
                throw new Exception("Cuenta Libre disposicion FCM 1.8% requerido");
            
            try
            {
                float vlr = Float.parseFloat(this.tfCuentaPolcaA.getText().toString());
                if (vlr < 1 )
                    throw new Exception("Cuenta Libre disposicion FCM 1.8% errada");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta Libre disposicion FCM 1.8% debe ser numerica");
            }

            // acuerdo
            if (this.ddBancoAcuerdo.getValue() == null)
                throw new Exception("Banco Acuerdo Pago requerido");

            if (this.ddBancoAcuerdo.getValue().toString().equals("00"))
                throw new Exception("Banco Acuerdo Pago requerido");

            if (this.ddTipoAcuerdo.getValue() == null)
                throw new Exception("Tipo Cuenta Acuerdo Pago requerido");

            if (this.ddTipoAcuerdo.getValue().toString().equals("000"))
                throw new Exception("Tipo Cuenta Acuerdo Pago requerido");

            if (this.tfCuentaAcuerdo.getText() == null)
                throw new Exception("Cuenta Acuerdo Pago requerido");

            if (this.tfCuentaAcuerdo.getText().toString().length() == 0)
               throw new Exception("Cuenta Acuerdo Pago requerido");
            
            try
            {
                float vlr = Float.parseFloat(this.tfCuentaAcuerdo.getText().toString());
                if (vlr < 1 )
                    throw new Exception("Cuenta Acuerdo Pago errada");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta Acuerdo Pago debe ser numerica");
            }
            
            
            con = getJdbcDataSource().getConnection();
            
            if (this.btAdicionar.getText().equals("Adicionar"))
                cs = con.prepareCall(Constants.FcmCtaDisFCMAdd);
            else
                cs = con.prepareCall(Constants.FcmCtaDisFCMUpd);
               
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfNitFcm.getText());
            cs.setString(++pos, (String) this.ddBancoRec.getValue());
            
            cs.setString(++pos, (String) this.ddBancoSimit.getValue());
            cs.setString(++pos, (String) this.ddTipoSimit.getValue());
            cs.setString(++pos, (String) this.tfCuentaSimit.getText());
            
            cs.setString(++pos, (String) this.ddBancoPolca.getValue());
            cs.setString(++pos, (String) this.ddTipoPolca.getValue());
            cs.setString(++pos, (String) this.tfCuentaPolca.getText());
            
            cs.setString(++pos, (String) this.ddBancoPolcaA.getValue());
            cs.setString(++pos, (String) this.ddTipoPolcaA.getValue());
            cs.setString(++pos, (String) this.tfCuentaPolcaA.getText());

            cs.setString(++pos, (String) this.ddBancoAcuerdo.getValue());
            cs.setString(++pos, (String) this.ddTipoAcuerdo.getValue());
            cs.setString(++pos, (String) this.tfCuentaAcuerdo.getText());

            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(16);
            
            info(resultado);

            if ( !resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK) )
                return "";

            this.cta_dispersion_fcmDataProvider.refresh();

            this.ddBancoRec.setValue("00");
            
            this.ddBancoSimit.setValue("00");
            this.ddTipoSimit.setValue("00");
            this.tfCuentaSimit.setText("");
            
            this.ddBancoPolca.setValue("00");
            this.ddTipoPolca.setValue("00");
            this.tfCuentaPolca.setText("");

            this.ddBancoPolcaA.setValue("00");
            this.ddTipoPolcaA.setValue("00");
            this.tfCuentaPolcaA.setText("");

            this.ddBancoAcuerdo.setValue("00");
            this.ddTipoAcuerdo.setValue("00");
            this.tfCuentaAcuerdo.setText("");

            this.btAdicionar.setText("Adicionar");
            ddBancoRec.setDisabled(false);
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
        
    }
    
    public String btEditar_action() {
        
        // call procedure que banco
        try {
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.FcmCtaDisFCMQue);

            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfNitFcm.getText() );
            cs.setString(++pos, (String) this.stIdBancoRec.getText());
            
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            cs.setString(++pos, getSessionBean1().getUser());
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(16);
                        
            info(resultado);
            
            
            this.ddBancoRec.setValue((String) this.stIdBancoRec.getText());

            this.ddBancoSimit.setValue(cs.getString(3));
            this.ddTipoSimit.setValue(cs.getString(4) );
            this.tfCuentaSimit.setText(cs.getString(5));
            
            this.ddBancoPolca.setValue(cs.getString(6));
            this.ddTipoPolca.setValue(cs.getString(7));
            this.tfCuentaPolca.setText(cs.getString(8));

            this.ddBancoPolcaA.setValue(cs.getString(9));
            this.ddTipoPolcaA.setValue(cs.getString(10));
            this.tfCuentaPolcaA.setText(cs.getString(11));

            this.ddBancoAcuerdo.setValue(cs.getString(12));
            this.ddTipoAcuerdo.setValue(cs.getString(13));
            this.tfCuentaAcuerdo.setText(cs.getString(14));

            this.btAdicionar.setText("Actualizar");
            this.ddBancoRec.setDisabled(true);
            
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
            
            // Cargamos los parametros de entrada IN
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.FcmCtaDisFCMDel);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfNitFcm.getText() );
            cs.setString(++pos, (String) this.stIdBancoRec.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            // Ejecutamos
            cs.execute();
            // Captura los parametros de salida OUT
            resultado = cs.getString(4);
            

            info(resultado);

            this.ddBancoRec.setValue("00");
            
            this.ddBancoSimit.setValue("00");
            this.ddTipoSimit.setValue("00");
            this.tfCuentaSimit.setText("");
            
            this.ddBancoPolca.setValue("00");
            this.ddTipoPolca.setValue("00");
            this.tfCuentaPolca.setText("");

            this.ddBancoPolcaA.setValue("00");
            this.ddTipoPolcaA.setValue("00");
            this.tfCuentaPolcaA.setText("");

            this.ddBancoAcuerdo.setValue("00");
            this.ddTipoAcuerdo.setValue("00");
            this.tfCuentaAcuerdo.setText("");

            this.btAdicionar.setText("Adicionar");
            ddBancoRec.setDisabled(false);

            this.cta_dispersion_fcmDataProvider.refresh();
            
            
        } catch (Exception e) {
            info( e.getMessage() ) ;
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
        
        
    }

}

