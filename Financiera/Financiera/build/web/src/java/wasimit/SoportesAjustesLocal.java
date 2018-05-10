/*
 * AjustesLocal.java
 *
 * Created on November 12, 2007, 5:40 PM
 * Copyright cristina
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
import com.sun.rave.web.ui.component.Hyperlink;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.component.Upload;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import com.sun.rave.web.ui.model.UploadedFile;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import javax.faces.FacesException;
import javax.faces.application.Application;
import javax.faces.application.NavigationHandler;
import javax.faces.application.ViewHandler;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.print.attribute.standard.DateTimeAtCompleted;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
public class SoportesAjustesLocal extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("SIMIT", "SIMIT"), new com.sun.rave.web.ui.model.Option("POLCA", "POLCA")});
        ddPConsignadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("55", "55"), new com.sun.rave.web.ui.model.Option("45", "45"), new com.sun.rave.web.ui.model.Option("10", "10")});
        ddPConsignadoDefaultOptions.setSelectedValue("55");
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        vw_soportesDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_soportesRowSet}"));
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
    
    private DropDown ddBanco = new DropDown();
    
    public DropDown getDdBanco() {
        return ddBanco;
    }
    
    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
    }
    
    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
    }
    
    private Label label2 = new Label();
    
    public Label getLabel2() {
        return label2;
    }
    
    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    private DropDown ddMunicipio = new DropDown();
    
    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }
    
    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private Label label4 = new Label();
    
    public Label getLabel4() {
        return label4;
    }
    
    public void setLabel4(Label l) {
        this.label4 = l;
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
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private TextField tfCuenta = new TextField();
    
    public TextField getTfCuenta() {
        return tfCuenta;
    }
    
    public void setTfCuenta(TextField tf) {
        this.tfCuenta = tf;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    private Calendar clFechaCorte = new Calendar();
    
    public Calendar getClFechaCorte() {
        return clFechaCorte;
    }
    
    public void setClFechaCorte(Calendar c) {
        this.clFechaCorte = c;
    }
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private Calendar clFechaTrn = new Calendar();
    
    public Calendar getClFechaTrn() {
        return clFechaTrn;
    }
    
    public void setClFechaTrn(Calendar c) {
        this.clFechaTrn = c;
    }
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private TextField tfValor = new TextField();
    
    public TextField getTfValor() {
        return tfValor;
    }
    
    public void setTfValor(TextField tf) {
        this.tfValor = tf;
    }
    
    private Label label9 = new Label();
    
    public Label getLabel9() {
        return label9;
    }
    
    public void setLabel9(Label l) {
        this.label9 = l;
    }
    
    private Button btAgregar = new Button();
    
    public Button getBtAgregar() {
        return btAgregar;
    }
    
    public void setBtAgregar(Button b) {
        this.btAgregar = b;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private DropDown ddPConsignado = new DropDown();
    
    public DropDown getDdPConsignado() {
        return ddPConsignado;
    }
    
    public void setDdPConsignado(DropDown dd) {
        this.ddPConsignado = dd;
    }
    
    private SingleSelectOptionsList ddPConsignadoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdPConsignadoDefaultOptions() {
        return ddPConsignadoDefaultOptions;
    }
    
    public void setDdPConsignadoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddPConsignadoDefaultOptions = ssol;
    }
    
    private Upload fileUpload1 = new Upload();
    
    public Upload getFileUpload1() {
        return fileUpload1;
    }
    
    public void setFileUpload1(Upload u) {
        this.fileUpload1 = u;
    }
    
    private TextField tfPeriodo = new TextField();
    
    public TextField getTfPeriodo() {
        return tfPeriodo;
    }
    
    public void setTfPeriodo(TextField tf) {
        this.tfPeriodo = tf;
    }
    
    private TextField tfNombre = new TextField();
    
    public TextField getTfNombre() {
        return tfNombre;
    }
    
    public void setTfNombre(TextField tf) {
        this.tfNombre = tf;
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
    
    private CachedRowSetDataProvider vw_soportesDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_soportesDataProvider() {
        return vw_soportesDataProvider;
    }
    
    public void setVw_soportesDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_soportesDataProvider = crsdp;
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
    
    private StaticText stIdDoc = new StaticText();
    
    public StaticText getStIdDoc() {
        return stIdDoc;
    }
    
    public void setStIdDoc(StaticText st) {
        this.stIdDoc = st;
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
    
    private Hyperlink hyperlink1 = new Hyperlink();
    
    public Hyperlink getHyperlink1() {
        return hyperlink1;
    }
    
    public void setHyperlink1(Hyperlink h) {
        this.hyperlink1 = h;
    }
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private Button beliminar = new Button();
    
    public Button getBeliminar() {
        return beliminar;
    }
    
    public void setBeliminar(Button b) {
        this.beliminar = b;
    }
    
    private TextField tfPeriodo1 = new TextField();
    
    public TextField getTfPeriodo1() {
        return tfPeriodo1;
    }
    
    public void setTfPeriodo1(TextField tf) {
        this.tfPeriodo1 = tf;
    }
    
    private Label label12 = new Label();
    
    public Label getLabel12() {
        return label12;
    }
    
    public void setLabel12(Label l) {
        this.label12 = l;
    }
    
    private TextArea textArea1 = new TextArea();
    
    public TextArea getTextArea1() {
        return textArea1;
    }
    
    public void setTextArea1(TextArea ta) {
        this.textArea1 = ta;
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
    
    private TextField tfQuincena = new TextField();
    
    public TextField getTfQuincena() {
        return tfQuincena;
    }
    
    public void setTfQuincena(TextField tf) {
        this.tfQuincena = tf;
    }
    
    private Label label15 = new Label();
    
    public Label getLabel15() {
        return label15;
    }
    
    public void setLabel15(Label l) {
        this.label15 = l;
    }
    
    private TextField tfVigencia = new TextField();
    
    public TextField getTfVigencia() {
        return tfVigencia;
    }
    
    public void setTfVigencia(TextField tf) {
        this.tfVigencia = tf;
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
    
    private TextField tfFecVigIni = new TextField();
    
    public TextField getTfFecVigIni() {
        return tfFecVigIni;
    }
    
    public void setTfFecVigIni(TextField tf) {
        this.tfFecVigIni = tf;
    }
    
    private TextField tfFecVigFin = new TextField();
    
    public TextField getTfFecVigFin() {
        return tfFecVigFin;
    }
    
    public void setTfFecVigFin(TextField tf) {
        this.tfFecVigFin = tf;
    }
    
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public SoportesAjustesLocal() {
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
        try {
            BigDecimal ajuste =  new BigDecimal(getSessionBean1().getNumAjuste());
            
            tfPeriodo1.setText(getSessionBean1().getNumAjuste());
            
            getSessionBean1().getVw_soportesRowSet().setObject(1, ajuste);
            getSessionBean1().getVw_soportesRowSet().close();
            getSessionBean1().getVw_soportesRowSet().setObject(1, ajuste);
            
            // getSessionBean1().getVw_soportesRowSet().refreshRow();
            
            this.vw_soportesDataProvider.refresh();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        CargarAjuste();
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("AjustesLocal Initialization Failure", e);
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
        municipioDataProvider.close();
        bancoDataProvider.close();
        vw_soportesDataProvider.close();
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
    
    
    /*
    public String btAgregar_action() {
        // TODO: Replace with your code
     
        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.RecLocAjuAdd);
     
            java.util.Calendar cal =  java.util.Calendar.getInstance();
     
            Date fecha_cor = this.clFechaCorte.getSelectedDate();
            cal.setTime(fecha_cor);
     
            int fecha_cor_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_cor_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_cor_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
     
            Date fecha_tra = this.clFechaTrn.getSelectedDate();
            cal.setTime(fecha_tra);
     
            int fecha_tra_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_tra_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_tra_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
     
     
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.ddBanco.getValue());
            cs.setString(++pos, (String) this.tfCuenta.getText());
            cs.setString(++pos, (String) this.ddTipo.getValue());
            cs.setInt(++pos, fecha_cor_ano );
            cs.setInt(++pos, fecha_cor_mes );
            cs.setInt(++pos, fecha_cor_dia );
            cs.setInt(++pos, fecha_tra_ano );
            cs.setInt(++pos, fecha_tra_mes );
            cs.setInt(++pos, fecha_tra_dia );
            cs.setDouble(++pos,Double.parseDouble( (String)this.tfValor.getText() ) );
            cs.setString(++pos, (String) this.ddMunicipio.getValue());
            cs.setString(++pos, (String) this.ddPeriodo.getValue());
            cs.setInt(++pos,Integer.parseInt((String) this.ddPConsignado.getValue()) );
     
            cs.setString(++pos, getSessionBean1().getUser());
     
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
     
            // Ejecutamos
            cs.execute();
     
            // Captura los parametros de salida OUT
            resultado = cs.getString(15);
     
            info(resultado);
            /*
            getSessionBean1().getRecaudo_local_ajustesRowSet().setObject(
                    1,(String) this.ddPeriodo.getSelected());
            this.recaudo_local_ajustesDataProvider.refresh();
     
     
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
     */
    
    
    /*
    public void ddPeriodo_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        // TODO: Replace with your code
        try {            getSessionBean1().getRecaudo_local_ajustesRowSet().setObject(
                    1,(String) this.ddPeriodo.getSelected());
            this.recaudo_local_ajustesDataProvider.refresh();
 } catch (Exception e) {
            info( e.getMessage() );
        }
     
    }
     */
    
    /*
    public String btEliminar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.RecLocAjuDel);
     
//            BigDecimal x = (BigDecimal) this.staticText10.getText();
     
            // Cargamos los parametros de entrada IN
//            cs.setLong(++pos,x.longValue());
            cs.setString(++pos, getSessionBean1().getUser());
     
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
     
            // Ejecutamos
            cs.execute();
     
            // Captura los parametros de salida OUT
            resultado = cs.getString(3);
     
            info(resultado);
     
            getSessionBean1().getRecaudo_local_ajustesRowSet().setObject(
                    1,(String) this.ddPeriodo.getSelected());
            this.recaudo_local_ajustesDataProvider.refresh();
¨
     
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
     */
    
    private void  CargarAjuste() {
        
        String resultadoVal;
        
        try {
            
            BigDecimal ajuste =  new BigDecimal(getSessionBean1().getNumAjuste());
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.RecLocAjuQue);
            
            // Cargamos los parametros de entrada IN
            cs.setBigDecimal("p_id_recaudo_local_ajustes", ajuste); // p_id_recaudo_local_ajustes
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_idbanco", java.sql.Types.CHAR); // p_idbanco
            cs.registerOutParameter("p_cta_recaudo", java.sql.Types.CHAR); // p_cta_recaudo
            cs.registerOutParameter("p_indtipo", java.sql.Types.CHAR); // p_indtipo
            cs.registerOutParameter("p_fec_corte", java.sql.Types.DATE); // p_fec_corte
            cs.registerOutParameter("p_fec_tran", java.sql.Types.DATE); // p_fec_tran
            cs.registerOutParameter("p_valor_total", java.sql.Types.NUMERIC); // p_valor_total
            cs.registerOutParameter("p_idmunicipio", java.sql.Types.NUMERIC); // p_idmunicipio
            cs.registerOutParameter("p_periodo", java.sql.Types.CHAR); // p_periodo
            cs.registerOutParameter("p_quincena", java.sql.Types.CHAR); // p_periodo
            cs.registerOutParameter("p_p_consignado", java.sql.Types.NUMERIC); // p_p_consignado
            cs.registerOutParameter("p_motivo", java.sql.Types.CHAR); // p_periodo
            cs.registerOutParameter("p_vigencia", java.sql.Types.CHAR); // p_periodo
            cs.registerOutParameter("p_fec_vig_ini", java.sql.Types.CHAR); // p_periodo
            cs.registerOutParameter("p_fec_vig_fin", java.sql.Types.CHAR); // p_periodo
            cs.registerOutParameter("p_acuerdo", java.sql.Types.NUMERIC); // p_p_consignado
            
            cs.setString("p_usuario", getSessionBean1().getUser()); // p_usuario
            cs.registerOutParameter("p_error", java.sql.Types.CHAR); // p_error
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString("p_error");
            
            if (!resultadoVal.contains("OK")) {
                info(resultadoVal);
                return;
            }
            
            //Ingresa cada uno de los valores de la novedad
            this.tfPeriodo.setText(cs.getString("p_periodo"));
            this.tfQuincena.setText(cs.getString("p_quincena"));
            this.ddMunicipio.setValue(cs.getString("p_idmunicipio"));
            this.ddBanco.setValue(cs.getString("p_idbanco"));
            this.ddTipo.setValue(cs.getString("p_indtipo"));
            this.tfCuenta.setText(cs.getString("p_cta_recaudo"));
            this.clFechaCorte.setSelectedDate(cs.getDate("p_fec_corte"));
            this.clFechaTrn.setSelectedDate(cs.getDate("p_fec_tran"));
            this.tfValor.setText(cs.getString("p_valor_total"));
            this.ddPConsignado.setValue(cs.getString("p_p_consignado"));
            this.textArea1.setText(cs.getString("p_motivo"));
            this.tfVigencia.setText(cs.getString("p_vigencia"));
            this.tfFecVigIni.setText(cs.getString("p_fec_vig_ini"));
            this.tfFecVigFin.setText(cs.getString("p_fec_vig_fin"));
            
            if (cs.getString("p_acuerdo").equals("1")) 
                cbAcuerdo.setValue("true");
            else
                cbAcuerdo.setValue("false");
            
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        
        
    }
    
    public String btAgregar_action() {
        // TODO: Replace with your code
        
        try {
            
            if ( getSessionBean1().getNumAjuste() == null )
                throw new Exception("Favor registrarse nuevamente");
            
            BigDecimal ajuste =  new BigDecimal(getSessionBean1().getNumAjuste());
            
            UploadedFile uploadedFile =this.fileUpload1.getUploadedFile();
            if (uploadedFile == null)
                throw new Exception("Archivo a cargar no seleccionado");
            
            int lobsize = 0;
            
            String uploadedFileName = uploadedFile.getOriginalName();
            if (uploadedFileName == null)
                throw new Exception("Nombre archivo vacio");
            
            if (uploadedFileName.length() == 0)
                throw new Exception("Nombre archivo vacio");
            
            uploadedFileName = uploadedFileName.toLowerCase();
            
            int index = uploadedFileName.lastIndexOf('.');
            String extencionFileName = "";
            if ( index >= 0) {
                extencionFileName = uploadedFileName.substring( index + 1 );
            }
            extencionFileName = extencionFileName.toLowerCase();
            
            if (extencionFileName.length() == 0)
                throw new Exception("Archivo debe poseer una extension. Ajustar nombre del archivo");
            
            if (tfNombre.getText() == null)
                throw new Exception("Nombre documento requerido");
            
            if (tfNombre.getText().toString().length() == 0)
                throw new Exception("Nombre documento requerido");
            
            index = uploadedFileName.lastIndexOf('/');
            String justFileName;
            if ( index >= 0) {
                justFileName = uploadedFileName.substring( index + 1 );
            } else {
                // Try backslash
                index = uploadedFileName.lastIndexOf('\\');
                if (index >= 0) {
                    justFileName = uploadedFileName.substring( index + 1 );
                } else {
                    // No forward or back slashes
                    justFileName = uploadedFileName;
                }
            }
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.carguearchivoSop);
            
            // Cargamos los parametros de entrada IN
            cs.setBigDecimal("p_id_recaudo_local_ajustes", ajuste); // p_id_recaudo_local_ajustes
            cs.setString("p_filename", uploadedFileName);
            cs.setString("p_nombreDocumento", tfNombre.getText().toString());
            cs.setString("p_extensionArchivo", extencionFileName);
            
            lobsize = (int) uploadedFile.getSize();
            cs.setBinaryStream("p_bfile", uploadedFile.getInputStream(),lobsize);
            
            cs.setString("p_usuario", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_error", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            info( cs.getString("p_error") );
            
            getSessionBean1().getVw_soportesRowSet().setObject(1, ajuste);
            getSessionBean1().getVw_soportesRowSet().close();
            getSessionBean1().getVw_soportesRowSet().setObject(1, ajuste);
            
            this.vw_soportesDataProvider.refresh();
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return null;
    }
    
    public String hyperlink1_action() {
        try {
            String idDoc = stIdDoc.getText().toString();
            
            java.util.Calendar cal =  java.util.Calendar.getInstance();
            int segundos = cal.get(java.util.Calendar.SECOND);
            
            
            String PageReport =  Constants.darPathApp( this.getFacesContext() ) + "VerDoc?IdDoc=" + idDoc;
            PageReport += "&idUser=" +  getSessionBean1().getUser();
            PageReport += "&fecha=" + segundos;
            
            
            ExternalContext externalContext = getFacesContext().getExternalContext();
            externalContext.redirect(PageReport);
            
        } catch (IOException ex) {
            info("Problemas en Ver documento: " + ex.getMessage());
        }
        
        return "";
    }
    
    public String beliminar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            BigDecimal idDoc =  new BigDecimal(stIdDoc.getText().toString());
            
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.carguearchivoDel);
            
            // Cargamos los parametros de entrada IN
            cs.setBigDecimal("p_id_documento", idDoc); // p_id_recaudo_local_ajustes
            cs.setString("p_usuario", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_error", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            info( cs.getString("p_error") );
            
            BigDecimal ajuste =  new BigDecimal(getSessionBean1().getNumAjuste());
            
            getSessionBean1().getVw_soportesRowSet().setObject(1, ajuste);
            getSessionBean1().getVw_soportesRowSet().close();
            getSessionBean1().getVw_soportesRowSet().setObject(1, ajuste);
            
            
            this.vw_soportesDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return null;
    }
    
    private Checkbox cbAcuerdo = new Checkbox();
    
    public Checkbox getCbAcuerdo() {
        return cbAcuerdo;
    }
    
    public void setCbAcuerdo(Checkbox c) {
        this.cbAcuerdo = c;
    }
}
