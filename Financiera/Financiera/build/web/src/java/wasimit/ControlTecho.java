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
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.PasswordField;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.context.ExternalContext;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.FacesException;
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
public class ControlTecho extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        vw_controltechoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_controltechoRowSet}"));
        concesionarioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet3}"));
        concesionarioDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet3}"));
        ddMesDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("01", "Enero"), new com.sun.rave.web.ui.model.Option("02", "Febrero"), new com.sun.rave.web.ui.model.Option("03", "Marzo"), new com.sun.rave.web.ui.model.Option("04", "Abril"), new com.sun.rave.web.ui.model.Option("05", "Mayo"), new com.sun.rave.web.ui.model.Option("06", "Junio"), new com.sun.rave.web.ui.model.Option("07", "Julio"), new com.sun.rave.web.ui.model.Option("08", "Agosto"), new com.sun.rave.web.ui.model.Option("09", "Septiembre"), new com.sun.rave.web.ui.model.Option("10", "Octubre"), new com.sun.rave.web.ui.model.Option("11", "Noviembre"), new com.sun.rave.web.ui.model.Option("12", "Diciembre")});
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
    
    private TextField tanoControl = new TextField();
    
    public TextField getTanoControl() {
        return tanoControl;
    }
    
    public void setTanoControl(TextField tf) {
        this.tanoControl = tf;
    }
    
    private Button bconsultar = new Button();
    
    public Button getBconsultar() {
        return bconsultar;
    }
    
    public void setBconsultar(Button b) {
        this.bconsultar = b;
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
    
    private TextField ttotalExt = new TextField();
    
    public TextField getTtotalExt() {
        return ttotalExt;
    }
    
    public void setTtotalExt(TextField tf) {
        this.ttotalExt = tf;
    }
    
    private TextField ttotalLoc = new TextField();
    
    public TextField getTtotalLoc() {
        return ttotalLoc;
    }
    
    public void setTtotalLoc(TextField tf) {
        this.ttotalLoc = tf;
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
    
    private CachedRowSetDataProvider vw_controltechoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_controltechoDataProvider() {
        return vw_controltechoDataProvider;
    }
    
    public void setVw_controltechoDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_controltechoDataProvider = crsdp;
    }
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private StaticText stPeriodo = new StaticText();
    
    public StaticText getStPeriodo() {
        return stPeriodo;
    }
    
    public void setStPeriodo(StaticText st) {
        this.stPeriodo = st;
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
    
    private CachedRowSetDataProvider concesionarioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getConcesionarioDataProvider() {
        return concesionarioDataProvider;
    }
    
    public void setConcesionarioDataProvider(CachedRowSetDataProvider crsdp) {
        this.concesionarioDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider concesionarioDataProvider1 = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getConcesionarioDataProvider1() {
        return concesionarioDataProvider1;
    }
    
    public void setConcesionarioDataProvider1(CachedRowSetDataProvider crsdp) {
        this.concesionarioDataProvider1 = crsdp;
    }
    
    private DropDown ddMes = new DropDown();
    
    public DropDown getDdMes() {
        return ddMes;
    }
    
    public void setDdMes(DropDown dd) {
        this.ddMes = dd;
    }
    
    private SingleSelectOptionsList ddMesDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdMesDefaultOptions() {
        return ddMesDefaultOptions;
    }
    
    public void setDdMesDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddMesDefaultOptions = ssol;
    }
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private Button bactualizar = new Button();
    
    public Button getBactualizar() {
        return bactualizar;
    }
    
    public void setBactualizar(Button b) {
        this.bactualizar = b;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    private TextField ttechoExt = new TextField();
    
    public TextField getTtechoExt() {
        return ttechoExt;
    }
    
    public void setTtechoExt(TextField tf) {
        this.ttechoExt = tf;
    }
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private TextField ttechoLoc = new TextField();
    
    public TextField getTtechoLoc() {
        return ttechoLoc;
    }
    
    public void setTtechoLoc(TextField tf) {
        this.ttechoLoc = tf;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
    private Button beditar = new Button();
    
    public Button getBeditar() {
        return beditar;
    }
    
    public void setBeditar(Button b) {
        this.beditar = b;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ControlTecho() {
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
        try {
            
            getSessionBean1().getVw_controltechoRowSet().setObject(
                    1, "" );
            getSessionBean1().getVw_controltechoRowSet().setObject(
                    2, "" );
        } catch (SQLException ex) {
            ex.printStackTrace();
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
        vw_controltechoDataProvider.close();
        concesionarioDataProvider.close();
        concesionarioDataProvider1.close();
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
    
    public String bconsultar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            if (this.tanoControl.getText() == null)
                throw new Exception("Ingrese año");
            
            if (this.tanoControl.getText().toString().length() == 0)
                throw new Exception("Ingrese año");
            
            try{
                float vlr = Float.parseFloat((String)this.tanoControl.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Valor año incorrecto");
            }
            
            if (ddConcesionario.getValue().toString().equals("00"))
                throw new Exception("Seleccione concesionario");
            
            getSessionBean1().getVw_controltechoRowSet().setObject(
                    1, tanoControl.getText().toString());
            
            getSessionBean1().getVw_controltechoRowSet().setObject(
                    2, ddConcesionario.getValue().toString());
            
            
            vw_controltechoDataProvider.refresh();
            
            double vlrExt = 0;
            double vlrLoc = 0;
            
            if (this.vw_controltechoDataProvider.getRowCount() > 0) {
                vw_controltechoDataProvider.cursorFirst();
                do {
                    String cadExt = vw_controltechoDataProvider.getValue("vlrExt").toString();
                    String cadLoc = vw_controltechoDataProvider.getValue("vlrLoc").toString();
                    
                    vlrExt += Double.parseDouble(cadExt);
                    vlrLoc += Double.parseDouble(cadLoc);
                    
                } while (vw_controltechoDataProvider.cursorNext());
            }
            
            String sCad = new DecimalFormat("###,###,###,###,###.##").format(vlrExt);
            ttotalExt.setText(sCad);
            
            sCad = new DecimalFormat("###,###,###,###,###.##").format(vlrLoc);
            ttotalLoc.setText(sCad);
            
            ddMes_processValueChange(null);
            
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        return null;
    }
    
    public String bactualizar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            if (this.tanoControl.getText() == null)
                throw new Exception("Ingrese año");
            
            if (this.tanoControl.getText().toString().length() == 0)
                throw new Exception("Ingrese año");
            
            try{
                float vlr = Float.parseFloat((String)this.ttechoExt.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Valor techo Recaudo externo incorrecto");
            }
            
            try{
                float vlr = Float.parseFloat((String)this.ttechoLoc.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Valor techo Recaudo local incorrecto");
            }
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.actualizarTecho);
            
            cs.setString("V_IDCONCESIONARIO", ddConcesionario.getValue().toString());
            cs.setString("V_ANO", tanoControl.getValue().toString());
            cs.setString("V_MES", ddMes.getValue().toString());
            cs.setFloat("V_TECHOEXT", Float.parseFloat(this.ttechoExt.getText().toString()) );
            cs.setFloat("V_TECHOLOC", Float.parseFloat(this.ttechoLoc.getText().toString()) );
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            
            cs.registerOutParameter("V_COD_ERROR", java.sql.Types.INTEGER);
            cs.registerOutParameter("V_MSG_ERROR", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            info(cs.getString("V_MSG_ERROR"));
            
            bconsultar_action();
            
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        return null;
    }
    
    public void ddMes_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        try {
            if (this.tanoControl.getText() == null)
                throw new Exception("Ingrese año");
            
            if (this.tanoControl.getText().toString().length() == 0)
                throw new Exception("Ingrese año");
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.consultarTecho);
            
            cs.setString("V_IDCONCESIONARIO", ddConcesionario.getValue().toString());
            cs.setString("V_ANO", tanoControl.getValue().toString());
            cs.setString("V_MES", ddMes.getValue().toString());
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            
            cs.registerOutParameter("V_COD_ERROR", java.sql.Types.INTEGER);
            cs.registerOutParameter("V_MSG_ERROR", java.sql.Types.CHAR);
            cs.registerOutParameter("V_TECHOEXT", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_TECHOLOC", java.sql.Types.NUMERIC);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            info(cs.getString("V_MSG_ERROR"));
            
            if (cs.getInt("V_COD_ERROR") == 0) {
                
                Double vlrExt = new Double(cs.getDouble("V_TECHOEXT"));
                Double vlrLoc = new Double(cs.getDouble("V_TECHOLOC"));
                
                String sCad = new DecimalFormat("###############.##").format(vlrExt);
                this.ttechoExt.setText(sCad);
                
                sCad = new DecimalFormat("###############.##").format(vlrLoc);
                this.ttechoLoc.setText(sCad);
            } else {
                this.ttechoExt.setText("");
                this.ttechoLoc.setText("");
            }
            
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        
    }
    
    public String beditar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        ddMes.setValue(this.stPeriodo.getText().toString().substring(5,7));
        ddMes_processValueChange(null);
        info("Mes : "  + this.stPeriodo.getText().toString().substring(5,7));
        
        return null;
    }
    
    public void ddConcesionario_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        
        if (ddConcesionario.getValue() != null )
            if (!ddConcesionario.getValue().toString().equals("00"))
                if (this.tanoControl.getText() != null &&  this.tanoControl.getText().toString().length() > 0)
                    bconsultar_action();
    }
    
}

