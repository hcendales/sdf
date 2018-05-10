/*
 * Rol.java
 *
 * Created on 29 de enero de 2008, 11:57 AM
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
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
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
public class Rol extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        menuDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.menuRowSet1}"));
        rolDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.rolRowSet2}"));
        menuxrolDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.menuxrolRowSet}"));
        this.menuDataProvider.refresh();
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

    private Button btActualizar = new Button();

    public Button getBtActualizar() {
        return btActualizar;
    }

    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }

    private CheckboxGroup cbgmenus = new CheckboxGroup();

    public CheckboxGroup getCbgmenus() {
        return cbgmenus;
    }

    public void setCbgmenus(CheckboxGroup cg) {
        this.cbgmenus = cg;
    }

    private Table table = new Table();

    public Table getTable() {
        return table;
    }

    public void setTable(Table t) {
        this.table = t;
    }

    private TableRowGroup tableRowGroup = new TableRowGroup();

    public TableRowGroup getTableRowGroup() {
        return tableRowGroup;
    }

    public void setTableRowGroup(TableRowGroup trg) {
        this.tableRowGroup = trg;
    }

    private Checkbox cbhabil = new Checkbox();

    public Checkbox getCbhabil() {
        return cbhabil;
    }

    public void setCbhabil(Checkbox c) {
        this.cbhabil = c;
    }

    private TextField tfnombrerol = new TextField();

    public TextField getTfnombrerol() {
        return tfnombrerol;
    }

    public void setTfnombrerol(TextField tf) {
        this.tfnombrerol = tf;
    }

    private CachedRowSetDataProvider menuDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getMenuDataProvider() {
        return menuDataProvider;
    }

    public void setMenuDataProvider(CachedRowSetDataProvider crsdp) {
        this.menuDataProvider = crsdp;
    }

    private CachedRowSetDataProvider rolDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getRolDataProvider() {
        return rolDataProvider;
    }

    public void setRolDataProvider(CachedRowSetDataProvider crsdp) {
        this.rolDataProvider = crsdp;
    }

    private TableColumn tcrolid = new TableColumn();

    public TableColumn getTcrolid() {
        return tcrolid;
    }

    public void setTcrolid(TableColumn tc) {
        this.tcrolid = tc;
    }

    private StaticText strolid = new StaticText();

    public StaticText getStrolid() {
        return strolid;
    }

    public void setStrolid(StaticText st) {
        this.strolid = st;
    }

    private TableColumn tcnombrerol = new TableColumn();

    public TableColumn getTcnombrerol() {
        return tcnombrerol;
    }

    public void setTcnombrerol(TableColumn tc) {
        this.tcnombrerol = tc;
    }

    private StaticText stnombrerol = new StaticText();

    public StaticText getStnombrerol() {
        return stnombrerol;
    }

    public void setStnombrerol(StaticText st) {
        this.stnombrerol = st;
    }

    private TableColumn tcenablerol = new TableColumn();

    public TableColumn getTcenablerol() {
        return tcenablerol;
    }

    public void setTcenablerol(TableColumn tc) {
        this.tcenablerol = tc;
    }

    private StaticText stenablerol = new StaticText();

    public StaticText getStenablerol() {
        return stenablerol;
    }

    public void setStenablerol(StaticText st) {
        this.stenablerol = st;
    }

    private TableColumn tcedit = new TableColumn();

    public TableColumn getTcedit() {
        return tcedit;
    }

    public void setTcedit(TableColumn tc) {
        this.tcedit = tc;
    }

    private Button btEditar = new Button();

    public Button getBtEditar() {
        return btEditar;
    }

    public void setBtEditar(Button b) {
        this.btEditar = b;
    }

    private CachedRowSetDataProvider menuxrolDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getMenuxrolDataProvider() {
        return menuxrolDataProvider;
    }

    public void setMenuxrolDataProvider(CachedRowSetDataProvider crsdp) {
        this.menuxrolDataProvider = crsdp;
    }

    private TextField tfrolid = new TextField();

    public TextField getTfrolid() {
        return tfrolid;
    }

    public void setTfrolid(TextField tf) {
        this.tfrolid = tf;
    }

    private ImageComponent imageActivo = new ImageComponent();

    public ImageComponent getImageActivo() {
        return imageActivo;
    }

    public void setImageActivo(ImageComponent ic) {
        this.imageActivo = ic;
    }

    private TextField tfIdRol = new TextField();

    public TextField getTfIdRol() {
        return tfIdRol;
    }

    public void setTfIdRol(TextField tf) {
        this.tfIdRol = tf;
    }

    private BigDecimalConverter cbgmenusConverter = new BigDecimalConverter();

    public BigDecimalConverter getCbgmenusConverter() {
        return cbgmenusConverter;
    }

    public void setCbgmenusConverter(BigDecimalConverter bdc) {
        this.cbgmenusConverter = bdc;
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

    private Label label1 = new Label();

    public Label getLabel1() {
        return label1;
    }

    public void setLabel1(Label l) {
        this.label1 = l;
    }

    private Checkbox cbmod = new Checkbox();

    public Checkbox getCbmod() {
        return cbmod;
    }

    public void setCbmod(Checkbox c) {
        this.cbmod = c;
    }

    private TableColumn tcenablemod = new TableColumn();

    public TableColumn getTcenablemod() {
        return tcenablemod;
    }

    public void setTcenablemod(TableColumn tc) {
        this.tcenablemod = tc;
    }

    private StaticText stenablemod = new StaticText();

    public StaticText getStenablemod() {
        return stenablemod;
    }

    public void setStenablemod(StaticText st) {
        this.stenablemod = st;
    }

    private ImageComponent imageActivo1 = new ImageComponent();

    public ImageComponent getImageActivo1() {
        return imageActivo1;
    }

    public void setImageActivo1(ImageComponent ic) {
        this.imageActivo1 = ic;
    }

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Rol() {
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
            log("Rol Initialization Failure", e);
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
        menuDataProvider.close();
        rolDataProvider.close();
        menuxrolDataProvider.close();
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

    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected SessionBean1 getSessionBean1() {
        return (SessionBean1)getBean("SessionBean1");
    }

    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = null;
    int pos = 0;
    Object[] selectedArrayOld = new Object[getSessionBean1().getMenuRowSet1().size()];
    Object[] selectedArrayNew = new Object[getSessionBean1().getMenuRowSet1().size()];
    
    private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }

    public String btEditar_action() {
        info("Consulta Exitosa");
        
        btActualizar.setText("Actualizar");
        
        tfIdRol.setText(strolid.getValue());
        tfnombrerol.setText(stnombrerol.getValue());
        tfrolid.setText(strolid.getValue());
        
        if(stenablerol.getValue().toString().equalsIgnoreCase("1"))
            cbhabil.setValue("true");
        
        if(stenablemod.getValue().toString().equalsIgnoreCase("1"))
            cbmod.setValue("true");
        
        try {
            getSessionBean1().getMenuxrolRowSet().setObject(1, tfrolid.getText().toString());
            menuxrolDataProvider.refresh();
            boolean hasNext = menuxrolDataProvider.cursorFirst();
            int i=0;
            while (hasNext) {
                BigDecimal menu = new BigDecimal(menuxrolDataProvider.getValue("MENUID").toString());
                selectedArrayOld[i] = menu;
                hasNext = menuxrolDataProvider.cursorNext();
                i++;
            }
            cbgmenus.setSelected(selectedArrayOld);
 
        } catch (Exception ex) {
            info(ex.getMessage());
        }
 
    return null;
 
    }

    public String btActualizar_action() {
        info("");
        String menus = "";
        try {
            if (tfnombrerol.getText() == null)
                throw new Exception("Ingrese Rol");
            
            if (tfnombrerol.getText().toString().length() == 0)
                throw new Exception("Ingrese Rol");
            
             selectedArrayNew = (Object[]) cbgmenus.getSelected();
            
            if (selectedArrayNew == null)
                throw new Exception("Seleccione al menos una opcion");
           
            if ( selectedArrayNew.length == 0 )
                throw new Exception("Seleccione al menos una opcion");
            
            con = getJdbcDataSource().getConnection();
            if(btActualizar.getText().toString().equalsIgnoreCase("Adicionar"))
            {
                cs = con.prepareCall(Constants.roladd);
                cs.setString(++pos, "");
            }
            else
            {
                cs = con.prepareCall(Constants.rolmod);
                cs.setString(++pos, tfIdRol.getText().toString());
            }
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, tfnombrerol.getText().toString());
            if (cbhabil.isChecked())
                cs.setString(++pos, "1");
            else
                cs.setString(++pos, "0");
           
            if (cbmod.isChecked())
                cs.setString(++pos, "1");
            else
                cs.setString(++pos, "0");
           
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(pos);
            
            if (resultado.equals("NOK"))
                throw new Exception("Reintentar Creacion/Actualizacion de Rol");

            tfIdRol.setText(cs.getString(pos));

            resultado = "Rol Agregado Exitosamente, ";
            
            selectedArrayNew = (Object[]) cbgmenus.getSelected();

            if (selectedArrayNew != null) {
                for (int i=0; i < selectedArrayNew.length; i++) {
                    menus = menus + ((BigDecimal)selectedArrayNew[i]).toString() + ",";
                }
                 //System.out.println("getRolOriginal()"+getSessionBean1().getRolOriginal());

                 pos = 0;
                 cs = con.prepareCall(Constants.rolxmenuadd);
                 cs.setString(++pos, tfIdRol.getText().toString());
                 cs.setString(++pos, menus);
                 cs.setString(++pos, getSessionBean1().getUser());
                 cs.registerOutParameter(++pos, java.sql.Types.CHAR);
                 cs.execute();

                 resultado = resultado + " y " + cs.getString(pos);
             } else {
                 resultado = resultado + ", sin asignarle menus" ;
             }

            info(resultado);
            
            rolDataProvider.refresh();
            btActualizar.setText("Adicionar");
            tfnombrerol.setText("");
            cbhabil.setValue("false");
            cbmod.setValue("false");
            
            cbgmenus.setSelected(null);
            
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
            cs = con.prepareCall(Constants.EliminarRol);
            
            // Cargamos los parametros de entrada IN
            cs.setString(1, strolid.getText().toString());
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
           
            
            this.rolDataProvider.refresh();
                  
            
        } catch (Exception e) {
            info( e.getMessage() ) ;
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }


}

