/*
 * AjustesLocal.java
 *
 * Created on November 12, 2007, 5:40 PM
 * Copyright cristina
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.org.apache.bcel.internal.classfile.ConstantString;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.Calendar;
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
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import javax.faces.FacesException;
import javax.faces.application.Application;
import javax.faces.application.NavigationHandler;
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
public class AjustesLocal extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        ddTipoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("SIMIT", "SIMIT"), new com.sun.rave.web.ui.model.Option("POLCA", "POLCA")});
        ddPeriodoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {});
        ddPConsignadoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("55", "55"), new com.sun.rave.web.ui.model.Option("45", "45"), new com.sun.rave.web.ui.model.Option("10", "10")});
        ddPConsignadoDefaultOptions.setSelectedValue("55");
        recaudo_local_ajustesDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.recaudo_local_ajustesRowSet}"));
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        municipioDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddQuincenaDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("15", "15"), new com.sun.rave.web.ui.model.Option("30", "30")});
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
    
    private DropDown ddPeriodo = new DropDown();
    
    public DropDown getDdPeriodo() {
        return ddPeriodo;
    }
    
    public void setDdPeriodo(DropDown dd) {
        this.ddPeriodo = dd;
    }
    
    private SingleSelectOptionsList ddPeriodoDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdPeriodoDefaultOptions() {
        return ddPeriodoDefaultOptions;
    }
    
    public void setDdPeriodoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddPeriodoDefaultOptions = ssol;
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
    
    private CachedRowSetDataProvider recaudo_local_ajustesDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getRecaudo_local_ajustesDataProvider() {
        return recaudo_local_ajustesDataProvider;
    }
    
    public void setRecaudo_local_ajustesDataProvider(CachedRowSetDataProvider crsdp) {
        this.recaudo_local_ajustesDataProvider = crsdp;
    }
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private StaticText staticText2 = new StaticText();
    
    public StaticText getStaticText2() {
        return staticText2;
    }
    
    public void setStaticText2(StaticText st) {
        this.staticText2 = st;
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
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private Button btEliminar = new Button();
    
    public Button getBtEliminar() {
        return btEliminar;
    }
    
    public void setBtEliminar(Button b) {
        this.btEliminar = b;
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
    
    private CachedRowSetDataProvider municipioDataProvider1 = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider1() {
        return municipioDataProvider1;
    }
    
    public void setMunicipioDataProvider1(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider1 = crsdp;
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
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private Hyperlink hyperlink1 = new Hyperlink();
    
    public Hyperlink getHyperlink1() {
        return hyperlink1;
    }
    
    public void setHyperlink1(Hyperlink h) {
        this.hyperlink1 = h;
    }

    private Label label10 = new Label();

    public Label getLabel10() {
        return label10;
    }

    public void setLabel10(Label l) {
        this.label10 = l;
    }

    private TextArea tmotivo1 = new TextArea();

    public TextArea getTmotivo1() {
        return tmotivo1;
    }

    public void setTmotivo1(TextArea ta) {
        this.tmotivo1 = ta;
    }

    private Calendar clVigenciaIni = new Calendar();

    public Calendar getClVigenciaIni() {
        return clVigenciaIni;
    }

    public void setClVigenciaIni(Calendar c) {
        this.clVigenciaIni = c;
    }

    private Calendar clVigenciaFin = new Calendar();

    public Calendar getClVigenciaFin() {
        return clVigenciaFin;
    }

    public void setClVigenciaFin(Calendar c) {
        this.clVigenciaFin = c;
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

    private DropDown ddQuincena = new DropDown();

    public DropDown getDdQuincena() {
        return ddQuincena;
    }

    public void setDdQuincena(DropDown dd) {
        this.ddQuincena = dd;
    }

    private SingleSelectOptionsList ddQuincenaDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdQuincenaDefaultOptions() {
        return ddQuincenaDefaultOptions;
    }

    public void setDdQuincenaDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddQuincenaDefaultOptions = ssol;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public AjustesLocal() {
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
            log("AjustesLocal Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
        
        // </editor-fold>
        // Perform application initialization that must complete
        // *after* managed components are initialized
        // TODO - add your own initialization code here
        
        if ( ddPeriodoDefaultOptions.getOptions().length == 0 ) {
            com.sun.rave.web.ui.model.Option[] opt = new com.sun.rave.web.ui.model.Option[6];
            
            java.util.Calendar cal =  java.util.Calendar.getInstance();
            cal.setTime(new Date());
            
            String valor = "";
            
            for (int i=0; i<24; i++) {
                SimpleDateFormat fecha = new SimpleDateFormat("yyyyMMdd");
                valor = fecha.format(cal.getTime());
                opt[i] = new com.sun.rave.web.ui.model.Option(valor.substring(0,6),valor.substring(0,4) + "/" + valor.substring(4,6));
                cal.add(java.util.Calendar.MONTH, -1);
            }
            
            
            ddPeriodoDefaultOptions.setOptions(opt);
            try {
                
                getSessionBean1().getRecaudo_local_ajustesRowSet().setObject(
                        1, opt[0].getValue() );
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
//                this.recaudo_local_ajustesDataProvider.refresh();
            
        }
        
        
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
        recaudo_local_ajustesDataProvider.close();
        municipioDataProvider.close();
        municipioDataProvider1.close();
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
    
    public String btAgregar_action() {
        // TODO: Replace with your code
        
        try {
            
             if (tmotivo1.getText() == null)
                throw new Exception("Motivo del ajuste requerido");
            
            if (tmotivo1.getText().toString().length() < 5)
                throw new Exception("Motivo del ajuste incorrecto");
  
              if (tmotivo1.getText().toString().length() > 500)
                throw new Exception("Texto Motivo demasiado largo. maximo 500 caracteres");
     
             if (this.ddBanco.getValue() == null)
                   throw new Exception("Favor seleccione banco");
                 
             if (this.ddBanco.getValue().toString().equals("50"))
                   throw new Exception("Banco no permitido, seleccione Davivienda");
            
             if (this.ddMunicipio.getValue().toString().equals("00000000"))
                 throw new Exception("Seleccione municipio");
                 
             if (this.ddBanco.getValue().toString().equals("00"))
                 throw new Exception("Seleccione banco");
             
            con = Constants.getJdbcDataSource().getConnection();
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
            
            Date vigencia_ini = this.clVigenciaIni.getSelectedDate();
            cal.setTime(vigencia_ini);
            
            int vigencia_ini_ano = cal.get(java.util.Calendar.YEAR) ;
            int vigencia_ini_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int vigencia_ini_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
            
            Date vigencia_fin = this.clVigenciaFin.getSelectedDate();
            cal.setTime(vigencia_fin);
            
            int vigencia_fin_ano = cal.get(java.util.Calendar.YEAR) ;
            int vigencia_fin_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int vigencia_fin_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
        
            
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

            cs.setInt(++pos, vigencia_ini_ano );
            cs.setInt(++pos, vigencia_ini_mes );
            cs.setInt(++pos, vigencia_ini_dia );

            cs.setInt(++pos, vigencia_fin_ano );
            cs.setInt(++pos, vigencia_fin_mes );
            cs.setInt(++pos, vigencia_fin_mes );
            
            cs.setDouble(++pos,Double.parseDouble( (String)this.tfValor.getText() ) );
            cs.setString(++pos, (String) this.ddMunicipio.getValue());
            cs.setString(++pos, (String) this.ddPeriodo.getValue());
            cs.setString(++pos, (String) this.ddQuincena.getValue());
            cs.setInt(++pos,Integer.parseInt((String) this.ddPConsignado.getValue()) );
            cs.setString(++pos, tmotivo1.getText().toString());
            
         
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(23);
            
            info(resultado);
            
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
    
    public void ddPeriodo_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        // TODO: Replace with your code
        try {
            getSessionBean1().getRecaudo_local_ajustesRowSet().setObject(
                    1,(String) this.ddPeriodo.getSelected());
            this.recaudo_local_ajustesDataProvider.refresh();
        } catch (Exception e) {
            info( e.getMessage() );
        }
        
    }
    
    public String btEliminar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.RecLocAjuDel);
            
            BigDecimal x = (BigDecimal) this.staticText10.getText();
            
            // Cargamos los parametros de entrada IN
            cs.setLong(++pos,x.longValue());
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
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    public String hyperlink1_action() {
        // TODO: Replace with your code
        try{
            // TODO: Replace with your code
            getSessionBean1().setNumAjuste(staticText10.getText().toString());
            Application app = getApplication();
            NavigationHandler nav = app.getNavigationHandler();
            FacesContext fc = getFacesContext();
            nav.handleNavigation(fc,null,"detalle");
            return "";
        } catch (Exception e) {
            return e.toString();
        } finally {
            SQLTools.close(rs, cs, con);
        }
    }
    
}

