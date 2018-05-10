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
import com.sun.rave.web.ui.component.Listbox;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.PasswordField;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultOptionsList;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.context.ExternalContext;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.FacesException;
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
public class ReenvioTrf extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        vw_cuentatrfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_cuentatrfRowSet}"));
        vw_conceptopagoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_conceptopagoRowSet}"));
        vw_reenvio_trfDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_reenvio_trfRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet}"));
        tipoctaDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.tipoctaRowSet}"));
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

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
    }

    private DropDown dropDown1 = new DropDown();

    public DropDown getDropDown1() {
        return dropDown1;
    }

    public void setDropDown1(DropDown dd) {
        this.dropDown1 = dd;
    }

    private DropDown dropDown2 = new DropDown();

    public DropDown getDropDown2() {
        return dropDown2;
    }

    public void setDropDown2(DropDown dd) {
        this.dropDown2 = dd;
    }

    private CachedRowSetDataProvider vw_cuentatrfDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_cuentatrfDataProvider() {
        return vw_cuentatrfDataProvider;
    }

    public void setVw_cuentatrfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_cuentatrfDataProvider = crsdp;
    }

    private CachedRowSetDataProvider vw_conceptopagoDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_conceptopagoDataProvider() {
        return vw_conceptopagoDataProvider;
    }

    public void setVw_conceptopagoDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_conceptopagoDataProvider = crsdp;
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

    private CachedRowSetDataProvider vw_reenvio_trfDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getVw_reenvio_trfDataProvider() {
        return vw_reenvio_trfDataProvider;
    }

    public void setVw_reenvio_trfDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_reenvio_trfDataProvider = crsdp;
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

    private StaticText staticText8 = new StaticText();

    public StaticText getStaticText8() {
        return staticText8;
    }

    public void setStaticText8(StaticText st) {
        this.staticText8 = st;
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

    private TableColumn tableColumn13 = new TableColumn();

    public TableColumn getTableColumn13() {
        return tableColumn13;
    }

    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }

    private Checkbox checkbox1 = new Checkbox();

    public Checkbox getCheckbox1() {
        return checkbox1;
    }

    public void setCheckbox1(Checkbox c) {
        this.checkbox1 = c;
    }

    private DropDown dropDown3 = new DropDown();

    public DropDown getDropDown3() {
        return dropDown3;
    }

    public void setDropDown3(DropDown dd) {
        this.dropDown3 = dd;
    }

    private DropDown dropDown4 = new DropDown();

    public DropDown getDropDown4() {
        return dropDown4;
    }

    public void setDropDown4(DropDown dd) {
        this.dropDown4 = dd;
    }

    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }

    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }

    private TextField textField2 = new TextField();

    public TextField getTextField2() {
        return textField2;
    }

    public void setTextField2(TextField tf) {
        this.textField2 = tf;
    }

    private TextField textField3 = new TextField();

    public TextField getTextField3() {
        return textField3;
    }

    public void setTextField3(TextField tf) {
        this.textField3 = tf;
    }

    private DropDown dropDown5 = new DropDown();

    public DropDown getDropDown5() {
        return dropDown5;
    }

    public void setDropDown5(DropDown dd) {
        this.dropDown5 = dd;
    }

    private CachedRowSetDataProvider tipoctaDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getTipoctaDataProvider() {
        return tipoctaDataProvider;
    }

    public void setTipoctaDataProvider(CachedRowSetDataProvider crsdp) {
        this.tipoctaDataProvider = crsdp;
    }

    private Button button1 = new Button();

    public Button getButton1() {
        return button1;
    }

    public void setButton1(Button b) {
        this.button1 = b;
    }

    private Button button2 = new Button();

    public Button getButton2() {
        return button2;
    }

    public void setButton2(Button b) {
        this.button2 = b;
    }

    private TableColumn tableColumn14 = new TableColumn();

    public TableColumn getTableColumn14() {
        return tableColumn14;
    }

    public void setTableColumn14(TableColumn tc) {
        this.tableColumn14 = tc;
    }

    private StaticText staticText2 = new StaticText();

    public StaticText getStaticText2() {
        return staticText2;
    }

    public void setStaticText2(StaticText st) {
        this.staticText2 = st;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ReenvioTrf() {
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
        vw_cuentatrfDataProvider.close();
        vw_conceptopagoDataProvider.close();
        vw_reenvio_trfDataProvider.close();
        bancoDataProvider.close();
        tipoctaDataProvider.close();
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

    public String button1_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
       if (button1.getText().toString().contains("Iniciar reenvio")) {
            checkbox1.setDisabled(false);
            dropDown1.setDisabled(false);
            dropDown2.setDisabled(false);
            dropDown4.setDisabled(false);
            dropDown5.setDisabled(false);
            button1.setText("Cancelar reenvio");
            button2.setDisabled(false);
            textField2.setDisabled(false);
            textField3.setDisabled(false);
            
            
        } else{
            checkbox1.setDisabled(true);
            dropDown1.setDisabled(true);
            dropDown2.setDisabled(true);
            dropDown4.setDisabled(true);
            dropDown5.setDisabled(true);
            button1.setText("Iniciar reenvio");
            button2.setDisabled(true);
            textField2.setDisabled(true);
            textField3.setDisabled(true);
            
        }
        return null;
         
    }

    public String button2_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            
            if (this.vw_reenvio_trfDataProvider.getRowCount() > 0) {
                vw_reenvio_trfDataProvider.cursorFirst();
                int numReg = 0;
                do {
                    boolean  actualizar = false;
                    String cbAct = "0";
                    if (vw_reenvio_trfDataProvider.getValue("actualizar") != null )
                        cbAct = vw_reenvio_trfDataProvider.getValue("actualizar").toString();
                    
                    if (cbAct.equals("1"))
                        actualizar = true;
                    /*
                    if (actualizar) {
                        if ( vw_reenvio_trfDataProvider.getValue("idMunicipioNew").toString().equals("00000000"))
                            throw new Exception("Registro sin municipio asignado");
                    }
                    */
                    
                } while (vw_reenvio_trfDataProvider.cursorNext());
            }
            // Navigate through rows with data provider
            if (this.vw_reenvio_trfDataProvider.getRowCount() > 0) {
                vw_reenvio_trfDataProvider.cursorFirst();
                int numReg = 0;
                do {
                    
                    boolean  actualizar = false;
                    String cbAct = "0";
                    if (vw_reenvio_trfDataProvider.getValue("actualizar") != null )
                        cbAct = vw_reenvio_trfDataProvider.getValue("actualizar").toString();
                    
                    if (cbAct.equals("1"))
                        actualizar = true;
                    
                    if (actualizar) {
                        String registro = vw_reenvio_trfDataProvider.getValue("referenciatrf").toString();
                        
                        con = Constants.getJdbcDataSource().getConnection();
                        cs = con.prepareCall(Constants.u_reenviotrf);
                        
                        cs.setString("p_usuario", getSessionBean1().getUser());
                        cs.setBigDecimal("p_referenciatrf", new BigDecimal(registro));
                        cs.setString("p_des_idbanco", vw_reenvio_trfDataProvider.getValue("des_idbanco").toString());
                        cs.setString("p_des_tipocuenta", vw_reenvio_trfDataProvider.getValue("des_tipocuenta").toString());
                        cs.setString("p_des_cuenta", vw_reenvio_trfDataProvider.getValue("des_cuenta").toString());
                        cs.setString("p_des_nit", vw_reenvio_trfDataProvider.getValue("des_nit").toString());
                        
                        // Registramos los parametro de salida OUT
                        cs.registerOutParameter("p_error", java.sql.Types.VARCHAR);
                        
                        // Ejecutamos
                        cs.execute();
                        numReg++;
                        
                    }
                    
                } while (vw_reenvio_trfDataProvider.cursorNext());
                
                info("Registros procesados " + numReg);
            };
            
            this.vw_reenvio_trfDataProvider.refresh();
            
        } catch (Exception ex) {
            info("Error :"+ex.getMessage());
        }
        return null;
    }


}