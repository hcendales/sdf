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
public class Terceros extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        terceroDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.terceroRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddIndBaseDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("1", "1: Valor Municipio al 100%"), new com.sun.rave.web.ui.model.Option("2", "2: Valor Adicional"), new com.sun.rave.web.ui.model.Option("3", "3: Valor Recaudo sin adicional"), new com.sun.rave.web.ui.model.Option("4", "4: Valor Neto Municipio")});
        ddNumeroDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"), new com.sun.rave.web.ui.model.Option("1", "Primero"), new com.sun.rave.web.ui.model.Option("2", "Segundo"), new com.sun.rave.web.ui.model.Option("3", "Tercero"), new com.sun.rave.web.ui.model.Option("4", "Cuarto")});
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
    
    private StaticText stNitTer = new StaticText();
    
    public StaticText getStNitTer() {
        return stNitTer;
    }
    
    public void setStNitTer(StaticText st) {
        this.stNitTer = st;
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
    
    private Button btActualizar = new Button();
    
    public Button getBtActualizar() {
        return btActualizar;
    }
    
    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }
    
    private TableColumn tableColumn11 = new TableColumn();
    
    public TableColumn getTableColumn11() {
        return tableColumn11;
    }
    
    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }
    
    private StaticText stNumTer = new StaticText();
    
    public StaticText getStNumTer() {
        return stNumTer;
    }
    
    public void setStNumTer(StaticText st) {
        this.stNumTer = st;
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
    
    private Button button1 = new Button();
    
    public Button getButton1() {
        return button1;
    }
    
    public void setButton1(Button b) {
        this.button1 = b;
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

    private StaticText staticText1 = new StaticText();

    public StaticText getStaticText1() {
        return staticText1;
    }

    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }

    private TableColumn tableColumn6 = new TableColumn();

    public TableColumn getTableColumn6() {
        return tableColumn6;
    }

    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }

    private StaticText staticText2 = new StaticText();

    public StaticText getStaticText2() {
        return staticText2;
    }

    public void setStaticText2(StaticText st) {
        this.staticText2 = st;
    }

    private TableColumn tableColumn7 = new TableColumn();

    public TableColumn getTableColumn7() {
        return tableColumn7;
    }

    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }

    private StaticText staticText4 = new StaticText();

    public StaticText getStaticText4() {
        return staticText4;
    }

    public void setStaticText4(StaticText st) {
        this.staticText4 = st;
    }

    private TableColumn tableColumn8 = new TableColumn();

    public TableColumn getTableColumn8() {
        return tableColumn8;
    }

    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
    }

    private StaticText staticText5 = new StaticText();

    public StaticText getStaticText5() {
        return staticText5;
    }

    public void setStaticText5(StaticText st) {
        this.staticText5 = st;
    }

    private TableColumn tableColumn9 = new TableColumn();

    public TableColumn getTableColumn9() {
        return tableColumn9;
    }

    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }

    private StaticText staticText6 = new StaticText();

    public StaticText getStaticText6() {
        return staticText6;
    }

    public void setStaticText6(StaticText st) {
        this.staticText6 = st;
    }

    private TableColumn tableColumn10 = new TableColumn();

    public TableColumn getTableColumn10() {
        return tableColumn10;
    }

    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }

    private StaticText staticText7 = new StaticText();

    public StaticText getStaticText7() {
        return staticText7;
    }

    public void setStaticText7(StaticText st) {
        this.staticText7 = st;
    }

    private TableColumn tableColumn12 = new TableColumn();

    public TableColumn getTableColumn12() {
        return tableColumn12;
    }

    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }

    private StaticText staticText8 = new StaticText();

    public StaticText getStaticText8() {
        return staticText8;
    }

    public void setStaticText8(StaticText st) {
        this.staticText8 = st;
    }

    private TableColumn tableColumn13 = new TableColumn();

    public TableColumn getTableColumn13() {
        return tableColumn13;
    }

    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }

    private StaticText staticText9 = new StaticText();

    public StaticText getStaticText9() {
        return staticText9;
    }

    public void setStaticText9(StaticText st) {
        this.staticText9 = st;
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
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Terceros() {
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
        try {
            getSessionBean1().getTerceroRowSet().setObject(
                    1,(String) this.ddMunicipio.getSelected());
            this.terceroDataProvider.refresh();
        } catch (Exception e) {
            info(e.getMessage());
        }
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
    
    public boolean validarNombre(String nombre){
    
        boolean correcto = true;
        
        for (int i=0; i<=9; i++){
            if (nombre.contains(Integer.toString(i))){
                correcto = false;
            }   
        }
        return correcto;
    }
    
    public String btActualizar_action() {
        try {
            
            //Municipio
            if(ddMunicipio.getValue().toString().compareTo("00000000") == 0)
            {
                throw new Exception("Seleccione el Municipio");
            }
            
            if (ddNumero.getValue().toString().equals("0"))
                throw new Exception("Debe seleccionar numero de tercero");
            
            if ( tfNitTercero.getText() == null )
                throw new Exception("Nit Municipio requerido");
            
            if ( ((String)tfNitTercero.getText()).length() == 0 )
                throw new Exception("Nit Tercero requerido");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitTercero.getText());
                 if (vlr < 1000000000 )
                    throw new Exception("Nit tercero incompleto");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Nit Tercero debe ser numerico");
            }
           
            
            if ( tfNombre.getText() == null )
                throw new Exception("Nombre requerido");
            
            if ( ((String)tfNombre.getText()).length() == 0 )
                throw new Exception("Nombre requerido");
            
            if (!validarNombre((String)tfNombre.getText()) )
                throw new Exception("El Nombre contiene números, ingrese letras solamente");
            
            if ( this.tfcorreoTercero.getText() == null )
                throw new Exception("Correo Tercero requerido");
            
            if ( ((String)tfcorreoTercero.getText()).length() == 0 )
                throw new Exception("Correo Tercero requerido");
            
             if (tfcorreoTercero.getText() != null)
                if (tfcorreoTercero.getText().toString().length() > 0 )
                    if(!validacionMail(tfcorreoTercero.getText().toString()) )
                        throw new Exception("Formato de correo electronico errado");
            
            
            
             if(ddBanco.getValue().toString().compareTo("00") == 0)
            {
                throw new Exception("Seleccione Banco");
            }
            
             if(ddTipo.getValue().toString().compareTo("000") == 0)
            {
                throw new Exception("Seleccione Tipo Cuenta");
            }
            
            if ( tfCuenta.getText() == null )
                throw new Exception("Cuenta requerida");
            
            if ( ((String)tfCuenta.getText()).length() == 0 )
                throw new Exception("Cuenta requerida");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuenta.getText());
                 if (vlr < 1 )
                    throw new Exception("Cuenta Incorrecta");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta debe ser numerica");
            }
            
            //% Base SIMIT
            if(tfBaseSimit.getValue()==null)
            {
                throw new Exception("Ingrese % Base SIMIT"); 
            }
            if(tfBaseSimit.getValue().toString().length() == 0)
            {
                throw new Exception("Ingrese % Base SIMIT");
            }
            
            //% Base  POLCA
            if(tfBasePolca.getValue()==null)
            {
                throw new Exception("Ingrese % Base POLCA"); 
            }
            if(tfBasePolca.getValue().toString().length() == 0)
            {
                throw new Exception("Ingrese % Base POLCA");
            }
            
                    
            
            
            try {
                float vlr = Float.parseFloat((String)this.tfBaseSimit.getText());
                 if (vlr < 0 )
                    throw new Exception("Base SIMIT debe ser > 0");
                 if (vlr > 100 )
                    throw new Exception("Base SIMIT debe ser < 100");
                
                 if (Integer.parseInt((String)this.ddIndBase.getValue()) == 1 )
                     if  (vlr > 90 )
                        throw new Exception("Base SIMIT debe ser < 90");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Base SIMIT ser numerica");
            }
           
            if ( tfBasePolca.getText() == null )
                tfBasePolca.setText("0");
            
            if ( ((String)tfBasePolca.getText()).length() == 0 )
                tfBasePolca.setText("0");

            try {
                float vlr = Float.parseFloat((String)this.tfBasePolca.getText());
                if (vlr < 0 )
                    throw new Exception("Base POLCA debe ser > 0");
                 if (vlr > 100 )
                    throw new Exception("Base POLCA debe ser < 100");
                 if (Integer.parseInt((String)this.ddIndBase.getValue()) == 1)
                     if  (vlr > 45 )
                        throw new Exception("Base POLCA debe ser < 45");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("base POLCA ser numerica");
            }
             
            if (this.ddIndBase.getValue().toString().equals("9"))
                throw new Exception("Seleccione indicador base");
            
            con = getJdbcDataSource().getConnection();
            
            if (btActualizar.getText().toString().equals("Adicionar"))
                cs = con.prepareCall(Constants.TercerosAdd);
            else
                cs = con.prepareCall(Constants.TercerosUpd);
                       
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.ddMunicipio.getValue());
            cs.setString(++pos, (String) this.tfNitTercero.getText());
            cs.setString(++pos, (String) this.tfNombre.getText());
            cs.setString(++pos, (String) this.tfcorreoTercero.getText());
            cs.setString(++pos, (String) this.ddBanco.getValue());
            cs.setString(++pos, (String) this.ddTipo.getValue());
            cs.setString(++pos, (String) this.tfCuenta.getText());
            cs.setFloat(++pos, Float.parseFloat((String)this.tfBaseSimit.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfBasePolca.getText()));
            cs.setInt(++pos, Integer.parseInt((String)this.ddIndBase.getValue()));
            cs.setInt(++pos, Integer.parseInt((String)this.ddNumero.getValue()));
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(13);
            
            info(resultado);
            
            if (!resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK) )
                return "";
            
            this.tfNitTercero.setText("");
            this.tfNombre.setText("");
            this.tfcorreoTercero.setText("");
            this.ddBanco.setValue("00");
            this.ddTipo.setValue("000");
            this.tfCuenta.setText("");
            this.tfBaseSimit.setText("");
            this.tfBasePolca.setText("");
            this.ddIndBase.setValue("9");
            this.ddNumero.setValue( "0" );
            
            this.btActualizar.setText("Adicionar");
            this.ddMunicipio.setDisabled(false);
            this.tfNitTercero.setDisabled(false);
            this.ddNumero.setDisabled(false);
            
            this.terceroDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    public String btEditar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.TercerosQue);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)this.ddMunicipio.getValue());
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
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
            
            cs.setInt(++pos,Integer.parseInt( stNumTer.getText().toString() ) );
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(13);
            
            
            this.tfNitTercero.setText((String)stNitTer.getText());
            this.tfNombre.setText(cs.getString(4));
            this.tfcorreoTercero.setText(cs.getString(5));
            this.ddBanco.setValue(cs.getString(6));
            this.ddTipo.setValue(cs.getString(7));
            this.tfCuenta.setText(cs.getString(8));
            this.tfBaseSimit.setText("" + cs.getDouble(9));
            this.tfBasePolca.setText("" + cs.getDouble(10));
            this.ddIndBase.setValue("" + cs.getInt(11));
            this.ddNumero.setValue( stNumTer.getText().toString() );
            
            
            this.btActualizar.setText("Actualizar");
            this.ddMunicipio.setDisabled(true);
            this.tfNitTercero.setDisabled(true);
            this.ddNumero.setDisabled(true);
            
            
            info(resultado);
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
        
    }

    public String button1_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.TercerosDel);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)this.ddMunicipio.getValue());
            cs.setInt(++pos,Integer.parseInt( stNumTer.getText().toString() ) );
            cs.setString(++pos, getSessionBean1().getUser());
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);           
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(4);
            
            info(resultado);
            
            this.tfNitTercero.setText("");
            this.tfNombre.setText("");
            this.tfcorreoTercero.setText("");
            this.ddBanco.setValue("00");
            this.ddTipo.setValue("000");
            this.tfCuenta.setText("");
            this.tfBaseSimit.setText("");
            this.tfBasePolca.setText("");
            this.ddIndBase.setValue("9");
            this.ddNumero.setValue( "0" );
            
            this.btActualizar.setText("Adicionar");
            this.tfNitTercero.setDisabled(false);
            this.ddNumero.setDisabled(false);
            this.ddMunicipio.setDisabled(false);
            
         
            this.terceroDataProvider.refresh();
            
            
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
    
}

