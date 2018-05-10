/*
 * Bancos.java
 *
 * Created on 28 de octubre de 2007, 23:35
 * Copyright Administrador
 */
package wasimit;


import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.ImageHyperlink;
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
//import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
public class Bancos extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet}"));
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
    
    private StaticText stopcion = new StaticText();
    
    public StaticText getStopcion() {
        return stopcion;
    }
    
    public void setStopcion(StaticText st) {
        this.stopcion = st;
    }
    
    private TextField tfidbco = new TextField();
    
    public TextField getTfidbco() {
        return tfidbco;
    }
    
    public void setTfidbco(TextField tf) {
        this.tfidbco = tf;
    }
    
    private TextField tfnombrebco = new TextField();
    
    public TextField getTfnombrebco() {
        return tfnombrebco;
    }
    
    public void setTfnombrebco(TextField tf) {
        this.tfnombrebco = tf;
    }
    
    private TextField tfrespbco = new TextField();
    
    public TextField getTfrespbco() {
        return tfrespbco;
    }
    
    public void setTfrespbco(TextField tf) {
        this.tfrespbco = tf;
    }
    
    private TextField tfcargobco = new TextField();
    
    public TextField getTfcargobco() {
        return tfcargobco;
    }
    
    public void setTfcargobco(TextField tf) {
        this.tfcargobco = tf;
    }
    
    private TextField tfcorreobco = new TextField();
    
    public TextField getTfcorreobco() {
        return tfcorreobco;
    }
    
    public void setTfcorreobco(TextField tf) {
        this.tfcorreobco = tf;
    }
    
    private TextField tftelbco = new TextField();
    
    public TextField getTftelbco() {
        return tftelbco;
    }
    
    public void setTftelbco(TextField tf) {
        this.tftelbco = tf;
    }
    
    private Button buttonbcoadd = new Button();
    
    public Button getButtonbcoadd() {
        return buttonbcoadd;
    }
    
    public void setButtonbcoadd(Button b) {
        this.buttonbcoadd = b;
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
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private TableColumn tableColumn1 = new TableColumn();
    
    public TableColumn getTableColumn1() {
        return tableColumn1;
    }
    
    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }
    
    private StaticText stIdBanco = new StaticText();
    
    public StaticText getStIdBanco() {
        return stIdBanco;
    }
    
    public void setStIdBanco(StaticText st) {
        this.stIdBanco = st;
    }
    
    private TableColumn tableColumn2 = new TableColumn();
    
    public TableColumn getTableColumn2() {
        return tableColumn2;
    }
    
    public void setTableColumn2(TableColumn tc) {
        this.tableColumn2 = tc;
    }
    
    private StaticText staticText3 = new StaticText();
    
    public StaticText getStaticText3() {
        return staticText3;
    }
    
    public void setStaticText3(StaticText st) {
        this.staticText3 = st;
    }
    
    private TableColumn tableColumn3 = new TableColumn();
    
    public TableColumn getTableColumn3() {
        return tableColumn3;
    }
    
    public void setTableColumn3(TableColumn tc) {
        this.tableColumn3 = tc;
    }
    
    private StaticText staticText4 = new StaticText();
    
    public StaticText getStaticText4() {
        return staticText4;
    }
    
    public void setStaticText4(StaticText st) {
        this.staticText4 = st;
    }
    
    private TableColumn tableColumn4 = new TableColumn();
    
    public TableColumn getTableColumn4() {
        return tableColumn4;
    }
    
    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
    }
    
    private StaticText staticText5 = new StaticText();
    
    public StaticText getStaticText5() {
        return staticText5;
    }
    
    public void setStaticText5(StaticText st) {
        this.staticText5 = st;
    }
    
    private TableColumn tableColumn5 = new TableColumn();
    
    public TableColumn getTableColumn5() {
        return tableColumn5;
    }
    
    public void setTableColumn5(TableColumn tc) {
        this.tableColumn5 = tc;
    }
    
    private StaticText staticText6 = new StaticText();
    
    public StaticText getStaticText6() {
        return staticText6;
    }
    
    public void setStaticText6(StaticText st) {
        this.staticText6 = st;
    }
    
    private TableColumn tableColumn6 = new TableColumn();
    
    public TableColumn getTableColumn6() {
        return tableColumn6;
    }
    
    public void setTableColumn6(TableColumn tc) {
        this.tableColumn6 = tc;
    }
    
    private StaticText staticText7 = new StaticText();
    
    public StaticText getStaticText7() {
        return staticText7;
    }
    
    public void setStaticText7(StaticText st) {
        this.staticText7 = st;
    }
    
    private Button btEliminar = new Button();
    
    public Button getBtEliminar() {
        return btEliminar;
    }
    
    public void setBtEliminar(Button b) {
        this.btEliminar = b;
    }
    
    private TableColumn tableColumn8 = new TableColumn();
    
    public TableColumn getTableColumn8() {
        return tableColumn8;
    }
    
    public void setTableColumn8(TableColumn tc) {
        this.tableColumn8 = tc;
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
    
    private LongRangeValidator longRangeValidator1 = new LongRangeValidator();
    
    public LongRangeValidator getLongRangeValidator1() {
        return longRangeValidator1;
    }
    
    public void setLongRangeValidator1(LongRangeValidator lrv) {
        this.longRangeValidator1 = lrv;
    }
    
    private TableColumn tableColumn7 = new TableColumn();
    
    public TableColumn getTableColumn7() {
        return tableColumn7;
    }
    
    public void setTableColumn7(TableColumn tc) {
        this.tableColumn7 = tc;
    }
    
    private Button btEditar = new Button();
    
    public Button getBtEditar() {
        return btEditar;
    }
    
    public void setBtEditar(Button b) {
        this.btEditar = b;
    }

    private TextField tfDirCorrespondencia = new TextField();

    public TextField getTfDirCorrespondencia() {
        return tfDirCorrespondencia;
    }

    public void setTfDirCorrespondencia(TextField tf) {
        this.tfDirCorrespondencia = tf;
    }

    private Label label7 = new Label();

    public Label getLabel7() {
        return label7;
    }

    public void setLabel7(Label l) {
        this.label7 = l;
    }

    private TableColumn tableColumn9 = new TableColumn();

    public TableColumn getTableColumn9() {
        return tableColumn9;
    }

    public void setTableColumn9(TableColumn tc) {
        this.tableColumn9 = tc;
    }

    private StaticText staticText1 = new StaticText();

    public StaticText getStaticText1() {
        return staticText1;
    }

    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }

    private TableRowGroup tableRowGroup2 = new TableRowGroup();

    public TableRowGroup getTableRowGroup2() {
        return tableRowGroup2;
    }

    public void setTableRowGroup2(TableRowGroup trg) {
        this.tableRowGroup2 = trg;
    }

    private DefaultTableDataProvider defaultTableDataProvider = new DefaultTableDataProvider();

    public DefaultTableDataProvider getDefaultTableDataProvider() {
        return defaultTableDataProvider;
    }

    public void setDefaultTableDataProvider(DefaultTableDataProvider dtdp) {
        this.defaultTableDataProvider = dtdp;
    }

    private TableColumn tableColumn10 = new TableColumn();

    public TableColumn getTableColumn10() {
        return tableColumn10;
    }

    public void setTableColumn10(TableColumn tc) {
        this.tableColumn10 = tc;
    }

    private StaticText staticText2 = new StaticText();

    public StaticText getStaticText2() {
        return staticText2;
    }

    public void setStaticText2(StaticText st) {
        this.staticText2 = st;
    }

    private TableColumn tableColumn11 = new TableColumn();

    public TableColumn getTableColumn11() {
        return tableColumn11;
    }

    public void setTableColumn11(TableColumn tc) {
        this.tableColumn11 = tc;
    }

    private StaticText staticText8 = new StaticText();

    public StaticText getStaticText8() {
        return staticText8;
    }

    public void setStaticText8(StaticText st) {
        this.staticText8 = st;
    }

    private TableColumn tableColumn12 = new TableColumn();

    public TableColumn getTableColumn12() {
        return tableColumn12;
    }

    public void setTableColumn12(TableColumn tc) {
        this.tableColumn12 = tc;
    }

    private StaticText staticText9 = new StaticText();

    public StaticText getStaticText9() {
        return staticText9;
    }

    public void setStaticText9(StaticText st) {
        this.staticText9 = st;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Bancos() {
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
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
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
            log("Bancos Initialization Failure", e);
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
        bancoDataProvider.refresh();
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
    
    
    public String buttonbcoadd_action() {
        
        // call procedure add banco
        try {
            
            try{
                
                if ( tfidbco.getText() == null)
                    throw new Exception("Codigo Banco Requerido");
                
                if ( ((String)tfidbco.getText()).equals(""))
                    throw new Exception("Codigo Banco Requerido");
                
                float vlr = Float.parseFloat((String)this.tfidbco.getText());
                
            }catch(NumberFormatException e) {
                throw new Exception("Codigo Banco debe ser numerico");
            }
            
            if ( tfnombrebco.getText() == null)
                throw new Exception("Nombre Banco Requerido");
            
            if (((String)tfnombrebco.getText()).equals(""))
                throw new Exception("Nombre Banco Requerido");
            
            if ( tfrespbco.getText() == null)
                throw new Exception("Responsable Requerido");
            
            if (((String)tfrespbco.getText()).equals(""))
                throw new Exception("Responsable Requerido");
            
            if (tfcorreobco.getText() != null)
                if (tfcorreobco.getText().toString().length() > 0 )
                    if(!validacionMail(tfcorreobco.getText().toString()) )
                        throw new Exception("Formato de correo electronico errado");
            
            if ( tftelbco.getText() == null)
                throw new Exception("Telefono requerido");
            
            if ( tftelbco.getText().toString().length() < 7 )
                throw new Exception("Telefono debe ser de 7 caracteres minimo");
            
            
            int x = Integer.parseInt((String) tfidbco.getText());
            
            
            
            con = getJdbcDataSource().getConnection();
            
            if (buttonbcoadd.getText().equals("Adicionar"))
                cs = con.prepareCall(Constants.bancoadd);
            else
                cs = con.prepareCall(Constants.bancoupd);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)tfidbco.getText());
            cs.setString(++pos, (String)tfnombrebco.getText());
            cs.setString(++pos, (String)tfrespbco.getText());
            cs.setString(++pos, (String)tfcargobco.getText());
            cs.setString(++pos, (String)tfcorreobco.getText());
            cs.setString(++pos, (String)tftelbco.getText());
            cs.setString(++pos, (String)tfDirCorrespondencia.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(9);
            info(resultado);
            
            if ( !resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK) )
                throw new Exception(Constants.MSG_NOK);
            
            
            
            //blanquea y pone el boton en adicionar
            tfidbco.setText("");
            tfnombrebco.setText("");
            tfrespbco.setText("");
            tfcargobco.setText("");
            tfcorreobco.setText("");
            tftelbco.setText("");
            tfDirCorrespondencia.setText("");
            buttonbcoadd.setText("Adicionar");
            tfidbco.setDisabled(false);
            
            
            this.bancoDataProvider.refresh();
            
        } catch ( NumberFormatException e ) {
            info("Codigo Banco debe ser numerico");
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    
    
    public String btEliminar_action() {
        // call procedure delete banco
        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.bancodel);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)stIdBanco.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(3);
            info(resultado);
            this.bancoDataProvider.refresh();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    public String btEditar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        // call procedure que banco
        try {
            
            
            /*
             if ( tfnombrebco.getText() == null)
                throw new Exception("Nombre Banco Requerido");
            
            if (((String)tfnombrebco.getText()).equals(""))
                throw new Exception("Nombre Banco Requerido");
            
            if ( tfrespbco.getText() == null)
                throw new Exception("Responsable Requerido");
            
            if (((String)tfrespbco.getText()).equals(""))
                throw new Exception("Responsable Requerido");
            
            if (tfcorreobco.getText() != null)
                if (tfcorreobco.getText().toString().length() > 0 )
                    if(!validacionMail(tfcorreobco.getText().toString()) )
                        throw new Exception("Formato de correo electronico errado");
            
            if ( tftelbco.getText() == null)
                throw new Exception("Telefono requerido");
            
            if ( tftelbco.getText().toString().length() < 7 )
                throw new Exception("Telefono debe ser de 7 caracteres minimo");
            */
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.bancoque);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)stIdBanco.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(9);
            
            this.tfidbco.setText((String)stIdBanco.getText());
            this.tfnombrebco.setText(cs.getString(3));
            this.tfrespbco.setText(cs.getString(4));
            this.tfcargobco.setText(cs.getString(5));
            this.tfcorreobco.setText(cs.getString(6));
            this.tftelbco.setText(cs.getString(7));
            this.tfDirCorrespondencia.setText(cs.getString(8));

            info(resultado);
            
            tfidbco.setDisabled(true);
            
            buttonbcoadd.setText("Actualizar");
            
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

