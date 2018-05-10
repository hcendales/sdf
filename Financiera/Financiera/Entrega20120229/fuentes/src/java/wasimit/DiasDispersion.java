/*
 * DiasDispersion.java
 *
 * Created on November 7, 2007, 3:28 PM
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

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class DiasDispersion extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        dias_dispersionDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.dias_dispersionRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddFrecuenciaSimExtDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: Inicio Mes")});
        ddFrecuenciaSimLocDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: inicio Mes")});
        ddFrecuenciaPolExtDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: Inicio Mes")});
        ddFrecuenciaPolLocDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("0", "0: Ninguno"), new com.sun.rave.web.ui.model.Option("1", "1: Inicio Semana"), new com.sun.rave.web.ui.model.Option("2", "2: Inicio Quincena"), new com.sun.rave.web.ui.model.Option("3", "3: Inicio Mes")});
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
    
    private CachedRowSetDataProvider dias_dispersionDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getDias_dispersionDataProvider() {
        return dias_dispersionDataProvider;
    }
    
    public void setDias_dispersionDataProvider(CachedRowSetDataProvider crsdp) {
        this.dias_dispersionDataProvider = crsdp;
    }
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private StaticText stIdbanco = new StaticText();
    
    public StaticText getStIdbanco() {
        return stIdbanco;
    }
    
    public void setStIdbanco(StaticText st) {
        this.stIdbanco = st;
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
    
    private Button btEditar = new Button();
    
    public Button getBtEditar() {
        return btEditar;
    }
    
    public void setBtEditar(Button b) {
        this.btEditar = b;
    }
    
    private TableColumn tableColumn12 = new TableColumn();
    
    public TableColumn getTableColumn12() {
        return tableColumn12;
    }
    
    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }
    
    private StaticText staticText11 = new StaticText();
    
    public StaticText getStaticText11() {
        return staticText11;
    }
    
    public void setStaticText11(StaticText st) {
        this.staticText11 = st;
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
    
    private Button btAdicionar = new Button();
    
    public Button getBtAdicionar() {
        return btAdicionar;
    }
    
    public void setBtAdicionar(Button b) {
        this.btAdicionar = b;
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
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private Button beliminar = new Button();
    
    public Button getBeliminar() {
        return beliminar;
    }
    
    public void setBeliminar(Button b) {
        this.beliminar = b;
    }

    private TableColumn tableColumn13 = new TableColumn();

    public TableColumn getTableColumn13() {
        return tableColumn13;
    }

    public void setTableColumn13(TableColumn tc) {
        this.tableColumn13 = tc;
    }

    private StaticText stMunicipio = new StaticText();

    public StaticText getStMunicipio() {
        return stMunicipio;
    }

    public void setStMunicipio(StaticText st) {
        this.stMunicipio = st;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public DiasDispersion() {
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
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    
    public String btAdicionar_action() {
        try {
            

            if(this.ddMunicipio.getValue().toString().compareTo("00000000") == 0) {
                throw new Exception("Seleccione el Municipio");
            }
            if(this.ddBanco.getValue().toString().compareTo("00") == 0) {
                throw new Exception("Seleccione el Banco");
            }
            
            if ( tfDiasSimitExt.getText() == null )
                tfDiasSimitExt.setText("0");
            if ( ((String)tfDiasSimitExt.getText()).length() == 0 )
                tfDiasSimitExt.setText("0");
            
            if ( tfDiasSimitLoc.getText() == null )
                tfDiasSimitLoc.setText("0");
            if ( ((String)tfDiasSimitLoc.getText()).length() == 0 )
                tfDiasSimitLoc.setText("0");
            
            if ( tfDiasPolcaExt.getText() == null )
                tfDiasPolcaExt.setText("0");
            if ( ((String)tfDiasPolcaExt.getText()).length() == 0 )
                tfDiasPolcaExt.setText("0");
            
            if ( tfDiasPolcaLoc.getText() == null )
                tfDiasPolcaLoc.setText("0");
            if ( ((String)tfDiasPolcaLoc.getText()).length() == 0 )
                tfDiasPolcaLoc.setText("0");
            
            try
            {
                 int vlr = Integer.parseInt((String)this.tfDiasSimitExt.getText());
                 
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Dias SIMIT Externo no numerico");
            }
            
            try
            {
                 int vlr = Integer.parseInt((String)this.tfDiasSimitLoc.getText());
                 
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Dias SIMIT Local no numerico");
            }
            
             try
            {
                 int vlr = Integer.parseInt((String)this.tfDiasPolcaExt.getText());
                 
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Dias Polca Externo no numerico");
            }
                        try
            {
                 int vlr = Integer.parseInt((String)this.tfDiasPolcaLoc.getText());
                 
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Dias Polca Local no numerico");
            }
       
            if ( Integer.parseInt((String)this.ddFrecuenciaSimExt.getValue()) == 9 )
                throw new Exception("Seleccione Frecuencia SIMIT Externo");
            
            if ( Integer.parseInt((String)this.ddFrecuenciaSimLoc.getValue()) == 9 )
                throw new Exception("Seleccione Frecuencia SIMIT Local");
            
            if ( Integer.parseInt((String)this.ddFrecuenciaPolExt.getValue()) == 9 )
                throw new Exception("Seleccione Frecuencia POLCA Externo");
            
            if ( Integer.parseInt((String)this.ddFrecuenciaPolLoc.getValue()) == 9 )
                throw new Exception("Seleccione Frecuencia POLCA Local");
            
            int vlr = Integer.parseInt((String)this.tfDiasSimitExt.getText());
            if ( Integer.parseInt((String)this.ddFrecuenciaSimExt.getValue()) == 0 && vlr <= 0 )
                throw new Exception("Dias SIMIT Externo debe ser mayor a 0");
            if ( Integer.parseInt((String)this.ddFrecuenciaSimExt.getValue()) > 0 && vlr != 0 )
                throw new Exception("Dias SIMIT Externo debe 0");
            
            vlr = Integer.parseInt((String)this.tfDiasSimitLoc.getText());
            if ( Integer.parseInt((String)this.ddFrecuenciaSimLoc.getValue()) == 0 && vlr <= 0 )
                throw new Exception("Dias SIMIT Local debe ser mayor a 0");
            if ( Integer.parseInt((String)this.ddFrecuenciaSimLoc.getValue()) > 0 && vlr != 0 )
                throw new Exception("Dias SIMIT Local debe 0");
            
            vlr = Integer.parseInt((String)this.tfDiasPolcaExt.getText());
            if ( Integer.parseInt((String)this.ddFrecuenciaPolExt.getValue()) == 0 && vlr <= 0 )
                throw new Exception("Dias POLCA Externo debe ser mayor a 0");
            if ( Integer.parseInt((String)this.ddFrecuenciaPolExt.getValue()) > 0 && vlr != 0 )
                throw new Exception("Dias POLCA Externo debe 0");
            
            vlr = Integer.parseInt((String)this.tfDiasPolcaLoc.getText());
            if ( Integer.parseInt((String)this.ddFrecuenciaPolLoc.getValue()) == 0 && vlr <= 0 )
                throw new Exception("Dias POLCA Local debe ser mayor a 0");
            if ( Integer.parseInt((String)this.ddFrecuenciaPolLoc.getValue()) > 0 && vlr != 0 )
                throw new Exception("Dias POLCA Local debe 0");
            
                      
            con = getJdbcDataSource().getConnection();
            
            if (this.btAdicionar.getText().toString().equals("Adicionar"))
                cs = con.prepareCall(Constants.DiasDispersionAdd);
            else
                cs = con.prepareCall(Constants.DiasDispersionUpd);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.ddMunicipio.getValue());
            cs.setString(++pos, (String) this.ddBanco.getValue());
            cs.setInt(++pos, Integer.parseInt((String)this.tfDiasSimitExt.getText()));
            cs.setInt(++pos, Integer.parseInt((String)this.tfDiasSimitLoc.getText()));
            cs.setInt(++pos, Integer.parseInt((String)this.tfDiasPolcaExt.getText()));
            cs.setInt(++pos, Integer.parseInt((String)this.tfDiasPolcaLoc.getText()));
            
            cs.setInt(++pos, Integer.parseInt((String)this.ddFrecuenciaSimExt.getValue()));
            cs.setInt(++pos, Integer.parseInt((String)this.ddFrecuenciaSimLoc.getValue()));
            cs.setInt(++pos, Integer.parseInt((String)this.ddFrecuenciaPolExt.getValue()));
            cs.setInt(++pos, Integer.parseInt((String)this.ddFrecuenciaPolLoc.getValue()));
            
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(12);
            
            info(resultado);
            
            if (!resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK))
                return "";
            this.ddMunicipio.setValue("00000000");
            this.ddBanco.setValue("00");
            this.tfDiasSimitExt.setText("");
            this.tfDiasSimitLoc.setText("");
            this.tfDiasPolcaExt.setText("");
            this.tfDiasPolcaLoc.setText("");
            
            this.ddFrecuenciaSimExt.setValue("9");
            this.ddFrecuenciaSimLoc.setValue("9");
            this.ddFrecuenciaPolExt.setValue("9");
            this.ddFrecuenciaPolLoc.setValue("9");
            
            ddMunicipio.setDisabled(false);
            ddBanco.setDisabled(false);
            this.btAdicionar.setText("Adicionar");
            
            this.dias_dispersionDataProvider.refresh();
            
        }
        catch (Exception e) {
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
            cs = con.prepareCall(Constants.DiasDispersionQue);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)stMunicipio.getText());
            cs.setString(++pos, (String)stIdbanco.getText());
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
            
            
            this.ddBanco.setValue((String)stIdbanco.getText());
            this.ddMunicipio.setValue((String)stMunicipio.getText());
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
            this.btAdicionar.setText("Actualizar");
            
            
            
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
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.DiasDispersionDel);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)stMunicipio.getText());
            cs.setString(++pos, (String)stIdbanco.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(4);
            info(resultado);
            
            this.ddBanco.setValue("00");
            this.tfDiasSimitExt.setText("");
            this.tfDiasSimitLoc.setText("");
            this.tfDiasPolcaExt.setText("");
            this.tfDiasPolcaLoc.setText("");
            
            this.ddFrecuenciaSimExt.setValue("9");
            this.ddFrecuenciaSimLoc.setValue("9");
            this.ddFrecuenciaPolExt.setValue("9");
            this.ddFrecuenciaPolLoc.setValue("9");
            
            ddMunicipio.setDisabled(false);
            ddBanco.setDisabled(false);
            this.btAdicionar.setText("Adicionar");
            
            
            this.dias_dispersionDataProvider.refresh();
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
        }
        
        return null;
        
    }
    
    
}

