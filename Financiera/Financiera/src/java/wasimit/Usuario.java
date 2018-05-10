/*
 * Usuario.java
 *
 * Created on 19 de diciembre de 2007, 04:10 PM
 * Copyright DSOFTFIN
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.Checkbox;
import com.sun.rave.web.ui.component.CheckboxGroup;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.ImageComponent;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.PasswordField;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.MultipleSelectOptionsList;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.faces.FacesException;
import javax.faces.convert.BigDecimalConverter;
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
public class Usuario extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        rolDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.rolRowSet}"));
        rolxpersonDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.rolxpersonRowSet}"));
        rolDataProvider.refresh();
        personDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.personRowSet}"));
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
    
    private CachedRowSetDataProvider personDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getPersonDataProvider() {
        return personDataProvider;
    }
    
    public void setPersonDataProvider(CachedRowSetDataProvider crsdp) {
        this.personDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider rolDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getRolDataProvider() {
        return rolDataProvider;
    }
    
    public void setRolDataProvider(CachedRowSetDataProvider crsdp) {
        this.rolDataProvider = crsdp;
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
    private TableColumn tccedula = new TableColumn();
    
    public TableColumn getTccedula() {
        return tccedula;
    }
    
    public void setTccedula(TableColumn tc) {
        this.tccedula = tc;
    }
    
    private StaticText stcedula = new StaticText();
    
    public StaticText getStcedula() {
        return stcedula;
    }
    
    public void setStcedula(StaticText st) {
        this.stcedula = st;
    }
    
    private TableColumn tclave = new TableColumn();
    
    public TableColumn getTclave() {
        return tclave;
    }
    
    public void setTclave(TableColumn tc) {
        this.tclave = tc;
    }
    
    private StaticText stclave = new StaticText();
    
    public StaticText getStclave() {
        return stclave;
    }
    
    public void setStclave(StaticText st) {
        this.stclave = st;
    }
    
    private TableColumn tcnombre = new TableColumn();
    
    public TableColumn getTcnombre() {
        return tcnombre;
    }
    
    public void setTcnombre(TableColumn tc) {
        this.tcnombre = tc;
    }
    
    private StaticText stnombre = new StaticText();
    
    public StaticText getStnombre() {
        return stnombre;
    }
    
    public void setStnombre(StaticText st) {
        this.stnombre = st;
    }
    
    private TableColumn tccargo = new TableColumn();
    
    public TableColumn getTccargo() {
        return tccargo;
    }
    
    public void setTccargo(TableColumn tc) {
        this.tccargo = tc;
    }
    
    private StaticText stcargo = new StaticText();
    
    public StaticText getStcargo() {
        return stcargo;
    }
    
    public void setStcargo(StaticText st) {
        this.stcargo = st;
    }
    
    private TableColumn tcactivo = new TableColumn();
    
    public TableColumn getTcactivo() {
        return tcactivo;
    }
    
    public void setTcactivo(TableColumn tc) {
        this.tcactivo = tc;
    }
    
    private StaticText stactivo = new StaticText();
    
    public StaticText getStactivo() {
        return stactivo;
    }
    
    public void setStactivo(StaticText st) {
        this.stactivo = st;
    }
    
    private TableColumn tcmail = new TableColumn();
    
    public TableColumn getTcmail() {
        return tcmail;
    }
    
    public void setTcmail(TableColumn tc) {
        this.tcmail = tc;
    }
    
    private StaticText stmail = new StaticText();
    
    public StaticText getStmail() {
        return stmail;
    }
    
    public void setStmail(StaticText st) {
        this.stmail = st;
    }
    
    private TableColumn tcedit = new TableColumn();
    
    public TableColumn getTcedit() {
        return tcedit;
    }
    
    public void setTcedit(TableColumn tc) {
        this.tcedit = tc;
    }
    
    private Button btEditar1 = new Button();
    
    public Button getBtEditar1() {
        return btEditar1;
    }
    
    public void setBtEditar1(Button b) {
        this.btEditar1 = b;
    }
    
    private Checkbox cbhabil = new Checkbox();
    
    public Checkbox getCbhabil() {
        return cbhabil;
    }
    
    public void setCbhabil(Checkbox c) {
        this.cbhabil = c;
    }
    
    private TextField tfcedula = new TextField();
    
    public TextField getTfcedula() {
        return tfcedula;
    }
    
    public void setTfcedula(TextField tf) {
        this.tfcedula = tf;
    }
    
    private TextField tfcorreo = new TextField();
    
    public TextField getTfcorreo() {
        return tfcorreo;
    }
    
    public void setTfcorreo(TextField tf) {
        this.tfcorreo = tf;
    }
    
    private TextField tfcargo = new TextField();
    
    public TextField getTfcargo() {
        return tfcargo;
    }
    
    public void setTfcargo(TextField tf) {
        this.tfcargo = tf;
    }
    
    private TextField tfnombre = new TextField();
    
    public TextField getTfnombre() {
        return tfnombre;
    }
    
    public void setTfnombre(TextField tf) {
        this.tfnombre = tf;
    }
    
    private Button beliminar = new Button();
    
    public Button getBeliminar() {
        return beliminar;
    }
    
    public void setBeliminar(Button b) {
        this.beliminar = b;
    }
    
    private CachedRowSetDataProvider rolxpersonDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getRolxpersonDataProvider() {
        return rolxpersonDataProvider;
    }
    
    public void setRolxpersonDataProvider(CachedRowSetDataProvider crsdp) {
        this.rolxpersonDataProvider = crsdp;
    }
    
    private Button btActualizar = new Button();
    
    public Button getBtActualizar() {
        return btActualizar;
    }
    
    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }
    
    private CheckboxGroup cbgroles = new CheckboxGroup();
    
    public CheckboxGroup getCbgroles() {
        return cbgroles;
    }
    
    public void setCbgroles(CheckboxGroup cg) {
        this.cbgroles = cg;
    }
    
    private BigDecimalConverter cbgrolesConverter = new BigDecimalConverter();
    
    public BigDecimalConverter getCbgrolesConverter() {
        return cbgrolesConverter;
    }
    
    public void setCbgrolesConverter(BigDecimalConverter bdc) {
        this.cbgrolesConverter = bdc;
    }
    
    private ImageComponent imageActivo = new ImageComponent();
    
    public ImageComponent getImageActivo() {
        return imageActivo;
    }
    
    public void setImageActivo(ImageComponent ic) {
        this.imageActivo = ic;
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

    private PasswordField tfclave = new PasswordField();

    public PasswordField getTfclave() {
        return tfclave;
    }

    public void setTfclave(PasswordField pf) {
        this.tfclave = pf;
    }

    private TableColumn tableColumn1 = new TableColumn();

    public TableColumn getTableColumn1() {
        return tableColumn1;
    }

    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }

    private Label label6 = new Label();

    public Label getLabel6() {
        return label6;
    }

    public void setLabel6(Label l) {
        this.label6 = l;
    }

    /*
    private Button buttonEliminar = new Button();

    public Button getButtonEliminar() {
        return buttonEliminar;
    }

    public void setButtonEliminar(Button b) {
        this.buttonEliminar = b;
    }
    */
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Usuario() {
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
            log("Usuario Initialization Failure", e);
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
        personDataProvider.close();
        rolDataProvider.close();
        rolxpersonDataProvider.close();
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
    
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = null;
    int pos = 0;
    Object[] selectedArrayOld = new Object[getSessionBean1().getRolRowSet().size()];
    Object[] selectedArrayNew = new Object[getSessionBean1().getRolRowSet().size()];
    
 
    public String btEditar_action() {
         btActualizar.setText("Actualizar");
        tfcedula.setReadOnly(true);
        tfcedula.setText(stcedula.getValue().toString());
        tfnombre.setText(stnombre.getValue().toString());
        tfcargo.setText(stcargo.getValue().toString());
        tfcorreo.setText(stmail.getValue().toString());
        tfclave.setText(stclave.getValue().toString());
        
        if(stactivo.getValue().toString().equalsIgnoreCase("1"))
            cbhabil.setValue("true");
        try {
            getSessionBean1().getRolxpersonRowSet().setObject(1, tfcedula.getText().toString());
            rolxpersonDataProvider.refresh();
            boolean hasNext = rolxpersonDataProvider.cursorFirst();
            int i=0;
            while (hasNext) {
                BigDecimal rol = new BigDecimal(rolxpersonDataProvider.getValue("ROLID").toString());
                selectedArrayOld[i] = rol;
                hasNext = rolxpersonDataProvider.cursorNext();
                i++;
            }
            cbgroles.setSelected(selectedArrayOld);
        } catch (Exception ex) {
            info(ex.getMessage());
        }
        
        return null;
    }
    
    public String btActualizar_action() {
        info("");
        String roles = "";
        try {
            
            try {
                if (tfcedula.getText() == null)
                    throw new Exception("Ingrese Cedula");
                
                if (tfcedula.getText().toString().length() == 0)
                    throw new Exception("Ingrese Cedula");
                
                if (tfcedula.getText().toString().contains("."))
                    throw new Exception("Valor errado cedula");
                
                float vlr = Float.parseFloat((String)this.tfcedula.getText());
                if (vlr < 10 )
                    throw new Exception("Valor cedula incorrecto");
                
            }catch(NumberFormatException e) {
                throw new Exception("Cedula debe ser numerico");
            }
            
            
            if (tfnombre.getText().toString().length() == 0)
                throw new Exception("Ingrese Nombre");
            
            if (tfcargo.getText() == null)
                throw new Exception("Ingrese Cargo");
            
            if (tfcargo.getText().toString().length() == 0)
                throw new Exception("Ingrese Cargo");
            
            //Correo
            if ( tfcorreo.getText() == null )
                throw new Exception("Digite el correo electronico");
            
            if ( ((String)tfcorreo.getText()).length() == 0 )
                throw new Exception("Digite el correo electronico");
            
            if (this.tfcorreo.getText() != null)
                if (tfcorreo.getText().toString().length() > 0 )
                    if(!validacionMail(tfcorreo.getText().toString()) )
                        throw new Exception("Formato de correo electronico errado");
                        
            if (tfclave.getText() == null)
                throw new Exception("Ingrese Clave");
            
            if (tfclave.getText().toString().length() == 0)
                throw new Exception("Ingrese Clave");
  
            if (tfclave.getText().toString().length() < 7)
                throw new Exception("Longitud de clave debe ser mayor a 8 caracteres");
            
            selectedArrayNew = (Object[]) cbgroles.getSelected();
            
            if (selectedArrayNew == null)
                throw new Exception("Seleccione rol de trabajo");
           
            if ( selectedArrayNew.length == 0 )
                throw new Exception("Seleccione un rol de trabajo");
            
            if ( selectedArrayNew.length > 1 )
                throw new Exception("Solo se permite un rol de trabajo");
            
            con = getJdbcDataSource().getConnection();
            if(btActualizar.getText().toString().equalsIgnoreCase("Crear")) {
                cs = con.prepareCall(Constants.usuarioadd);
                cs.setString(++pos,  tfcedula.getText().toString());
            }
            
            else {
                cs = con.prepareCall(Constants.usuariomod);
                cs.setString(++pos, tfcedula.getText().toString());
            }
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, tfnombre.getText().toString());
            cs.setString(++pos, tfcargo.getText().toString());
            
            if (cbhabil.isChecked())
                cs.setString(++pos, "1");
            else
                cs.setString(++pos, "0");
            
            cs.setString(++pos, (String) tfcorreo.getText());
            cs.setString(++pos, (String) tfclave.getText());
            
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(pos);
            
            selectedArrayNew = (Object[]) cbgroles.getSelected();
            
            if (selectedArrayNew != null) {
                for (int i=0; i < selectedArrayNew.length; i++) {
                    roles = roles + ((BigDecimal)selectedArrayNew[i]).toString() + ",";
                }
                pos = 0;
                cs = con.prepareCall(Constants.usuarioxroladd);
                cs.setString(++pos, tfcedula.getText().toString());
                cs.setString(++pos, roles);
                cs.setString(++pos, getSessionBean1().getUser());
                cs.registerOutParameter(++pos, java.sql.Types.CHAR);
                cs.execute();
                resultado = resultado + " y " + cs.getString(pos);
            } else {
                resultado = resultado + ", sin asignarle roles" ;
            }
            
            info(resultado);
            
            personDataProvider.refresh();
            btActualizar.setText("Crear");
            tfcedula.setReadOnly(false);
            tfcedula.setText("");
            tfnombre.setText("");
            tfcargo.setText("");
            tfcorreo.setText("");
            tfclave.setText("");
            
            cbhabil.setValue("false");
            cbgroles.setSelected(null);
            
            this.personDataProvider.refresh();
            
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


    public String beliminar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            // Cargamos los parametros de entrada IN
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.EliminarUsuario);
       
            // Cargamos los parametros de entrada IN
            cs.setString(1, stcedula.getText().toString());           
            cs.setString(2, getSessionBean1().getUser());        
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(3, java.sql.Types.CHAR);
            // Ejecutamos
            cs.execute();
            // Captura los parametros de salida OUT
            resultado = cs.getString(3);
            info(resultado);      
            
             if (!resultado.equals(Constants.MSG_DEL_OK) )
                return "";
            
            this.personDataProvider.refresh();
                          
                    
        } catch (Exception e) {
            info( e.getMessage() ) ;
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }

     private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    
}

