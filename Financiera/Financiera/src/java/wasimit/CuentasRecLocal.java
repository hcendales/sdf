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
public class CuentasRecLocal extends AbstractPageBean {
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
        rbTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("SIMIT", "SIMIT"), new com.sun.rave.web.ui.model.Option("POLCA", "POLCA")});
        ddTipoCtaDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("", "00 - Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
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
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private StaticText stIdBanco = new StaticText();
    
    public StaticText getStIdBanco() {
        return stIdBanco;
    }
    
    public void setStIdBanco(StaticText st) {
        this.stIdBanco = st;
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
    
    private StaticText staticText4 = new StaticText();
    
    public StaticText getStaticText4() {
        return staticText4;
    }
    
    public void setStaticText4(StaticText st) {
        this.staticText4 = st;
    }
    
    private TableColumn tableColumn5 = new TableColumn();
    
    public TableColumn getTableColumn5() {
        return tableColumn5;
    }
    
    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }
    
    private StaticText staticText5 = new StaticText();
    
    public StaticText getStaticText5() {
        return staticText5;
    }
    
    public void setStaticText5(StaticText st) {
        this.staticText5 = st;
    }
    
    private TableColumn tableColumn6 = new TableColumn();
    
    public TableColumn getTableColumn6() {
        return tableColumn6;
    }
    
    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }
    
    private StaticText staticText6 = new StaticText();
    
    public StaticText getStaticText6() {
        return staticText6;
    }
    
    public void setStaticText6(StaticText st) {
        this.staticText6 = st;
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
    
    private DropDown ddBanco = new DropDown();
    
    public DropDown getDdBanco() {
        return ddBanco;
    }
    
    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
    }
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private RadioButtonGroup rbTipo = new RadioButtonGroup();
    
    public RadioButtonGroup getRbTipo() {
        return rbTipo;
    }
    
    public void setRbTipo(RadioButtonGroup rbg) {
        this.rbTipo = rbg;
    }
    
    private SingleSelectOptionsList rbTipoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getRbTipoDefaultOptions() {
        return rbTipoDefaultOptions;
    }
    
    public void setRbTipoDefaultOptions(SingleSelectOptionsList ssol) {
        this.rbTipoDefaultOptions = ssol;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private DropDown ddTipoCta = new DropDown();
    
    public DropDown getDdTipoCta() {
        return ddTipoCta;
    }
    
    public void setDdTipoCta(DropDown dd) {
        this.ddTipoCta = dd;
    }
    
    private SingleSelectOptionsList ddTipoCtaDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoCtaDefaultOptions() {
        return ddTipoCtaDefaultOptions;
    }
    
    public void setDdTipoCtaDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoCtaDefaultOptions = ssol;
    }
    
    private TextField tfCuenta = new TextField();
    
    public TextField getTfCuenta() {
        return tfCuenta;
    }
    
    public void setTfCuenta(TextField tf) {
        this.tfCuenta = tf;
    }
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
    }
    
    private TextField tfComisionRec = new TextField();
    
    public TextField getTfComisionRec() {
        return tfComisionRec;
    }
    
    public void setTfComisionRec(TextField tf) {
        this.tfComisionRec = tf;
    }
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private TextField tfComisionAch = new TextField();
    
    public TextField getTfComisionAch() {
        return tfComisionAch;
    }
    
    public void setTfComisionAch(TextField tf) {
        this.tfComisionAch = tf;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private Button btEditar = new Button();
    
    public Button getBtEditar() {
        return btEditar;
    }
    
    public void setBtEditar(Button b) {
        this.btEditar = b;
    }
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private Button btAdicionar = new Button();
    
    public Button getBtAdicionar() {
        return btAdicionar;
    }
    
    public void setBtAdicionar(Button b) {
        this.btAdicionar = b;
    }
    
    private TableColumn tableColumn8 = new TableColumn();
    
    public TableColumn getTableColumn8() {
        return tableColumn8;
    }
    
    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }
    
    private StaticText staticText1 = new StaticText();
    
    public StaticText getStaticText1() {
        return staticText1;
    }
    
    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }
    
    private TableColumn tableColumn9 = new TableColumn();
    
    public TableColumn getTableColumn9() {
        return tableColumn9;
    }
    
    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }
    
    private Button beliminar = new Button();
    
    public Button getBeliminar() {
        return beliminar;
    }
    
    public void setBeliminar(Button b) {
        this.beliminar = b;
    }
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private TextField tfCtaCon = new TextField();
    
    public TextField getTfCtaCon() {
        return tfCtaCon;
    }
    
    public void setTfCtaCon(TextField tf) {
        this.tfCtaCon = tf;
    }
    
    private TableColumn tableColumn10 = new TableColumn();
    
    public TableColumn getTableColumn10() {
        return tableColumn10;
    }
    
    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }
    
    private StaticText staticText8 = new StaticText();
    
    public StaticText getStaticText8() {
        return staticText8;
    }
    
    public void setStaticText8(StaticText st) {
        this.staticText8 = st;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public CuentasRecLocal() {
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
            
            //Banco
            if(Integer.parseInt(ddBanco.getValue().toString())==0)
                throw new Exception("Seleccione el Banco");

            //Tipo Recaudo
            if(rbTipo.getValue()==null)
                throw new Exception("Seleccione el Tipo de Recaudo");

            //Tipo Cuenta
            if(ddTipoCta.getValue().toString().length()==0)
                throw new Exception("Seleccione el tipo de cuenta");
            
             //Cuenta
            if(tfCuenta.getText() == null)
                throw new Exception("Ingrese la cuenta");
            
            if( tfCuenta.getText().toString().length() == 0 )
                throw new Exception("Ingrese la cuenta");
            
            if( tfCuenta.getText().toString().contains(".") )
                throw new Exception("Cuenta no debe contener . , -");

            if( tfCuenta.getText().toString().contains("-") )
                throw new Exception("Cuenta no debe contener -");

            if( tfCuenta.getText().toString().contains(",") )
                throw new Exception("Cuenta no debe contener ,");

            try{
                double  num = Double.parseDouble(tfCuenta.getText().toString());
                if (num < 1 )
                    throw new Exception("Numero de Cuentar errado");
            } catch ( NumberFormatException e ) {
                throw new Exception("Cuenta debe ser numerica");
            }
            
            //Comision Recaudo + Iva
            if(tfComisionRec.getText() == null)
                throw new Exception("Ingrese Comisión Recaudo + Iva");
            
            if( tfComisionRec.getText().toString().length() == 0 )
                throw new Exception("Ingrese Comisión Recaudo + Iva");
            
       
            try{
                double num = Double.parseDouble(tfComisionRec.getText().toString());
                if (num < 0)
                    throw new Exception("Comisión Recaudo + Iva debe ser >= 0");
            } catch ( NumberFormatException e ) {
                throw new Exception("Comisión Recaudo + Iva debe ser numerico");
            }
            
            //Comision ACH + Iva
            if(tfComisionAch.getText() == null)
                throw new Exception("Ingrese Comisión ACH + Iva");
            
            if( tfComisionAch.getText().toString().length() == 0 )
                throw new Exception("Ingrese Comisión ACH + Iva");
            
            try{
                double num = Double.parseDouble(tfComisionAch.getText().toString());
                if (num < 0)
                    throw new Exception("Comisión ACH + Iva debe ser >= 0");
            } catch ( NumberFormatException e ) {
                throw new Exception("Comisión ACH + Iva debe ser numerico");
            }
            
            //Cuenta Contable
            if(tfCtaCon.getText() == null)
                throw new Exception("Ingrese la cuenta contable");
            
            if( tfCtaCon.getText().toString().length() == 0 )
                throw new Exception("Ingrese la cuenta contable");
            
            try{
                double num = Double.parseDouble(tfCtaCon.getText().toString());
                if (num < 1000000000)
                     throw new Exception("Cuenta contable errada ");
            } catch ( NumberFormatException e ) {
                throw new Exception("La cuenta contable debe ser numerica");
            }
            
            
            con = getJdbcDataSource().getConnection();
            
            if (this.btAdicionar.getText().equals("Adicionar"))
                cs = con.prepareCall(Constants.FcmCtaRecLocAdd);
            else
                cs = con.prepareCall(Constants.FcmCtaRecLocUpd);
               
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfNitFcm.getText());
            cs.setString(++pos, (String) this.ddBanco.getValue());
            cs.setString(++pos, (String) this.rbTipo.getValue());
            cs.setString(++pos, (String) this.ddTipoCta.getValue());
            cs.setString(++pos, (String) this.tfCuenta.getText());
            cs.setDouble(++pos, Double.parseDouble((String)this.tfComisionRec.getText()));
            cs.setDouble(++pos, Double.parseDouble((String)this.tfComisionAch.getText()));
            cs.setString(++pos, (String) this.tfCtaCon.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(10);
            
            info(resultado);

            this.cta_recaudo_fcmDataProvider.refresh();

            if ( !resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK) )
                return "";
            
            this.ddBanco.setValue("00");
            this.ddTipoCta.setValue("00");
            this.tfCuenta.setText("");
            this.tfComisionRec.setText("");
            this.tfComisionAch.setText("");
            this.tfCtaCon.setText("");
            
            this.rbTipo.setValue(null);           
            this.btAdicionar.setText("Adicionar");
            ddBanco.setDisabled(false);
            rbTipo.setDisabled(false);
            
            
            
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
            cs = con.prepareCall(Constants.CtaRecLocQue);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfNitFcm.getText() );
            cs.setString(++pos, (String)stIdBanco.getText());
            cs.setString(++pos, (String) staticText3.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(10);
            
            this.ddBanco.setValue((String)stIdBanco.getText());
            this.rbTipo.setValue((String)staticText3.getText());
            this.ddTipoCta.setValue(cs.getString(5));
            this.tfCuenta.setText(cs.getString(6));
            this.tfComisionRec.setText("" + cs.getDouble(7));
            this.tfComisionAch.setText("" + cs.getDouble(8));
            this.tfCtaCon.setText(cs.getString(9));
            
            info(resultado);
            
            this.btAdicionar.setText("Actualizar");
            ddBanco.setDisabled(true);
            rbTipo.setDisabled(true);
            
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
            cs = con.prepareCall(Constants.CtaRecLocDel);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfNitFcm.getText() );
            cs.setString(++pos, (String)stIdBanco.getText());
            cs.setString(++pos, (String) staticText3.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            // Ejecutamos
            cs.execute();
            // Captura los parametros de salida OUT
            resultado = cs.getString(5);
            
            this.cta_recaudo_fcmDataProvider.refresh();

            info(resultado);
            
            this.ddBanco.setValue("00");
            this.ddTipoCta.setValue("00");
            this.tfCuenta.setText("");
            this.tfComisionRec.setText("");
            this.tfComisionAch.setText("");
            this.tfCtaCon.setText("");
            
            this.rbTipo.setValue(null);           
            this.btAdicionar.setText("Adicionar");
            ddBanco.setDisabled(false);
            rbTipo.setDisabled(false);
            
            
            this.cta_recaudo_fcmDataProvider.refresh();
            
        } catch (Exception e) {
            info( e.getMessage() ) ;
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
        
        
    }
}

