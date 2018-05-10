/*
 * Validador.java
 *
 * Created on 12 de febrero de 2009, 10:11 AM
 * Copyright hugo
 */

package wasimit;

import java.sql.SQLException;
import java.util.regex.*;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractPageBean;
import com.sun.rave.web.ui.component.Body;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.Calendar;
import com.sun.rave.web.ui.component.DropDown;
import com.sun.rave.web.ui.component.Form;
import com.sun.rave.web.ui.component.Head;
import com.sun.rave.web.ui.component.Html;
import com.sun.rave.web.ui.component.Label;
import com.sun.rave.web.ui.component.Link;
import com.sun.rave.web.ui.component.Listbox;
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.RadioButtonGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultOptionsList;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.FacesException;
import javax.faces.event.ValueChangeEvent;
import javax.faces.validator.LengthValidator;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import oracle.jdbc.OracleTypes;
import java.awt.event.*;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class Validador extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
     
    private void _init() throws Exception {
        rbTipoComparendoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("SIMIT", "SIMIT"), new com.sun.rave.web.ui.model.Option("POLCA", "POLCA")});
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet5}"));
        validador_fechaDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{RequestBean1.validador_fechaRowSet}"));
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        validador_fechaDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.validador_fechaRowSet}"));
        
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

    private Calendar clFechaIni = new Calendar();

    public Calendar getClFechaIni() {
        return clFechaIni;
    }

    public void setClFechaIni(Calendar c) {
        this.clFechaIni = c;
    }

    private Calendar clFechaFin = new Calendar();

    public Calendar getClFechaFin() {
        return clFechaFin;
    }

    public void setClFechaFin(Calendar c) {
        this.clFechaFin = c;
    }

   private RadioButtonGroup rbTipoComparendo = new RadioButtonGroup();
    
    public RadioButtonGroup getRbTipoComparendo() {
        return rbTipoComparendo;
    }
    
    public void setRbTipoComparendo(RadioButtonGroup rbg) {
        this.rbTipoComparendo = rbg;
    }

   private SingleSelectOptionsList rbTipoComparendoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getRbTipoComparendoDefaultOptions() {
        return rbTipoComparendoDefaultOptions;
    }

    private TextField tfMunicipio = new TextField();

    public TextField getTfMunicipio() {
        return tfMunicipio;
    }

    public void setTfMunicipio(TextField tf) {
        this.tfMunicipio = tf;
    }

    private TextField tfFcm = new TextField();

    public TextField getTfFcm() {
        return tfFcm;
    }

    public void setTfFcm(TextField tf) {
        this.tfFcm = tf;
    }

    private TextField tfConcesionario = new TextField();

    public TextField getTfConcesionario() {
        return tfConcesionario;
    }

    public void setTfConcesionario(TextField tf) {
        this.tfConcesionario = tf;
    }

    private TextField tfAcuerdo = new TextField();

    public TextField getTfAcuerdo() {
        return tfAcuerdo;
    }

    public void setTfAcuerdo(TextField tf) {
        this.tfAcuerdo = tf;
    }

    private Button btActualizar_Agregar = new Button();

    public Button getBtActualizar_Agregar() {
        return btActualizar_Agregar;
    }

    public void setBtActualizar_Agregar(Button b) {
        this.btActualizar_Agregar = b;
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

    private CachedRowSetDataProvider validador_fechaDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getValidador_fechaDataProvider() {
        return validador_fechaDataProvider;
    }

    public void setValidador_fechaDataProvider(CachedRowSetDataProvider crsdp) {
        this.validador_fechaDataProvider = crsdp;
    }

 /*   private CachedRowSetXImpl validador_fechaRowSet = new CachedRowSetXImpl();

    public CachedRowSetXImpl getValidador_fechaRowSet() {
        return validador_fechaRowSet;
    }

    public void setValidador_fechaRowSet(CachedRowSetXImpl crsxi) {
        this.validador_fechaRowSet = crsxi;
    }*/

    private TableColumn tableColumn66 = new TableColumn();

    public TableColumn getTableColumn66() {
        return tableColumn66;
    }

    public void setTableColumn66(TableColumn tc) {
        this.tableColumn66 = tc;
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

    private TextField tfIdValidador = new TextField();

    public TextField getTfIdValidador() {
        return tfIdValidador;
    }

    public void setTfIdValidador(TextField tf) {
        this.tfIdValidador = tf;
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
    
    private StaticText stValidador = new StaticText();

    public StaticText getStValidador() {
        return stValidador;
    }

    public void setStValidador(StaticText st) {
        this.stValidador = st;
    }
    private StaticText stTipo = new StaticText();

    public StaticText getStTipo() {
        return stTipo;
    }

    public void setStTipo(StaticText st) {
        this.stTipo = st;
    }
    
    private StaticText stFechaIni = new StaticText();

    public StaticText getStFechaIni() {
        return stFechaIni;
    }

    public void setStFechaIni(StaticText st) {
        this.stFechaIni = st;
    }

    private TableColumn tableColumn1 = new TableColumn();

    public TableColumn getTableColumn1() {
        return tableColumn1;
    }

    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }


    private TableColumn tableColumn16 = new TableColumn();

    public TableColumn getTableColumn16() {
        return tableColumn16;
    }

    public void setTableColumn16(TableColumn tc) {
        this.tableColumn16 = tc;
    }

    private Button beditar = new Button();

    public Button getBeditar() {
        return beditar;
    }

    public void setBeditar(Button b) {
        this.beditar = b;
    }

    private TableColumn tableColumn17 = new TableColumn();

    public TableColumn getTableColumn17() {
        return tableColumn17;
    }

    public void setTableColumn17(TableColumn tc) {
        this.tableColumn17 = tc;
    }

    private Button beliminar = new Button();

    public Button getBeliminar() {
        return beliminar;
    }

    public void setBeliminar(Button b) {
        this.beliminar = b;
    }

    private Label label9 = new Label();

    public Label getLabel9() {
        return label9;
    }

    public void setLabel9(Label l) {
        this.label9 = l;
    }
    
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Validador() {
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
            log("Validador Initialization Failure", e);
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
                
                getSessionBean1().getValidador_fechaRowSet().setObject(
                        1, this.municipioDataProvider.getValue("IDMUNICIPIO") );
                this.validador_fechaDataProvider.refresh();
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
        validador_fechaDataProvider.close();
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
    String resultado = "";
    int pos = 0;
    
   
     private DataSource getJdbcDataSource() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/jdbc/dataSource");
    }
    public String btActualizar_Agregar_action() {
      // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            if( ddMunicipio.getValue().toString().equals("00000000") )
                throw new Exception("Se debe seleccionar un municipio");

            if ( tfIdValidador.getText() == null )
                    throw new Exception("Validador obligatorio");
            
            if ( tfIdValidador.getText().toString().length() == 0 )
                    throw new Exception("Validador obligatorio");
            
            if ( tfIdValidador.getText().toString().length() != 3 )
                    throw new Exception("Longitud validador debe ser tres digitos");
  
            if ( tfIdValidador.getText().toString().contains(".") )
                    throw new Exception("Validador debe ser un valor entero");
            
           try{
               float vlr = Float.parseFloat(tfIdValidador.getValue().toString());
           }catch(NumberFormatException e){
               throw new Exception("Valor de Validador no numerico");
           }
            
           
           if ( this.rbTipoComparendo.getValue() == null )
                   throw new Exception("Tipo de comparendo obligatorio");
           
           if ( this.clFechaIni.getValue() == null )
                    throw new Exception("Fecha Inicial obligatoria");
           
           if ( this.clFechaIni.getValue().toString().length() == 0 )
                    throw new Exception("Fecha Inicial obligatoria");
            
           if ( this.clFechaFin.getValue() == null )
                    throw new Exception("Fecha Final obligatoria");
            
           if ( this.clFechaFin.getValue().toString().length() == 0 )
                    throw new Exception("Fecha Final obligatoria");

           if ( this.tfMunicipio.getValue() == null )
                    throw new Exception("%Municipio  obligatorio");

           if ( this.tfMunicipio.getValue().toString().length() == 0 )
                    throw new Exception("%Municipio  obligatorio");
            
            try {
                 float vlr = Float.parseFloat(tfMunicipio.getValue().toString());
                 if (vlr < 0 )
                    throw new Exception("%Municipio negativo");
            } catch (NumberFormatException e) {
                throw new Exception("%Municipio no numerico");
            }
                 

           if ( this.tfFcm.getValue() == null )
                    throw new Exception("%FCM Contravencional obligatorio");

           if ( this.tfFcm.getValue().toString().length() == 0 )
                    throw new Exception("%FCM Contravencional  obligatorio");
            
            try {
                 float vlr = Float.parseFloat(tfFcm.getValue().toString());
                 if (vlr < 0 )
                    throw new Exception("%FCM Contravencional negativo");
            } catch (NumberFormatException e) {
                throw new Exception("%FCM Contravencional no numerico");
            }

           if ( this.tfConcesionario.getValue() == null )
                    throw new Exception("%Concesionario Contravencional obligatorio");

           if ( this.tfConcesionario.getValue().toString().length() == 0 )
                    throw new Exception("%Concesionario Contravencional obligatorio");
            
            try {
                 float vlr = Float.parseFloat(tfConcesionario.getValue().toString());
                 if (vlr < 0 )
                    throw new Exception("%Concesionario Contravencional negativo");
            } catch (NumberFormatException e) {
                throw new Exception("%Concesionario Contravencional no numerico");
            }

           if ( this.tfAcuerdo.getValue() == null )
                    throw new Exception("%Acuerdo obligatorio");

           if ( this.tfAcuerdo.getValue().toString().length() == 0 )
                    throw new Exception("%Acuerdo obligatorio");
            
            try {
                 float vlr = Float.parseFloat(tfAcuerdo.getValue().toString());
                 if (vlr < 0 )
                    throw new Exception("%Acuerdo negativo");
            } catch (NumberFormatException e) {
                throw new Exception("%Acuerdo no numerico");
            }

           
            float suma =
                    Float.parseFloat(tfMunicipio.getValue().toString())+
                    Float.parseFloat(tfFcm.getValue().toString())+
                    Float.parseFloat(tfConcesionario.getValue().toString())+
                    Float.parseFloat(tfAcuerdo.getValue().toString());
            
           if(rbTipoComparendo.getValue().toString().equals("SIMIT"))
              if(suma != 90.0)
                       throw new Exception("%Municipio + %FCM Contrav + %Conces Contrav + %Acuerdo debe ser igual a 90 %");

           if(rbTipoComparendo.getValue().toString().equals("POLCA"))
                if(suma != 45.0)
                    throw new Exception("%Municipio + %FCM Contrav + %Conces Contrav + %Acuerdo debe ser igual a 45 %");
            
            java.util.Calendar cal =  java.util.Calendar.getInstance();
            
            Date fecha_ini = clFechaIni.getSelectedDate();
            cal.setTime(fecha_ini);
            
            int fecha_ini_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_ini_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_ini_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
            
            Date fecha_fin = clFechaFin.getSelectedDate();
            cal.setTime(fecha_fin);
            
            int fecha_fin_ano = cal.get(java.util.Calendar.YEAR) ;
            int fecha_fin_mes = cal.get(java.util.Calendar.MONTH) + 1;
            int fecha_fin_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
            
            if (fecha_ini.compareTo(fecha_fin) > 0)
                   throw new Exception("Fecha final debe ser superior o igual a fecha inicial");
                   
            if (validarFecha(fecha_ini_ano,fecha_ini_mes,fecha_ini_dia,fecha_fin_ano,fecha_fin_mes,fecha_fin_dia,(String) this.rbTipoComparendo.getValue(), (String) this.ddMunicipio.getSelected(),(String) this.tfIdValidador.getText() ).equals("FECHANOK"))
                    throw new Exception("Fecha Inicial o Fecha Final estan dentro de un rango ya asignado");
  
            con = getJdbcDataSource().getConnection();

            if(this.btActualizar_Agregar.getText().toString().equals("Actualizar"))
              cs = con.prepareCall(Constants.validadorUpd);
            else
              cs = con.prepareCall(Constants.validadorIns);

                // Cargamos los parametros de entrada IN
                cs.setString(++pos, (String) this.ddMunicipio.getSelected());
                cs.setString(++pos, (String) this.tfIdValidador.getText());
                cs.setString(++pos, (String) this.rbTipoComparendo.getValue());
                cs.setInt(++pos, fecha_ini_ano );
                cs.setInt(++pos, fecha_ini_mes );
                cs.setInt(++pos, fecha_ini_dia );
                cs.setInt(++pos, fecha_fin_ano );
                cs.setInt(++pos, fecha_fin_mes );
                cs.setInt(++pos, fecha_fin_dia );

                cs.setFloat(++pos, Float.parseFloat((String)this.tfMunicipio.getText()));
                cs.setFloat(++pos, Float.parseFloat((String)this.tfFcm.getText()));
                cs.setFloat(++pos, Float.parseFloat((String)this.tfConcesionario.getText()));
                cs.setFloat(++pos, Float.parseFloat((String)this.tfAcuerdo.getText()));

                cs.setString(++pos, "" );
                cs.setInt(++pos, 0 );
                cs.setInt(++pos, 0 );
                cs.setString(++pos, "" );
                cs.setInt(++pos, 0 );
                cs.setInt(++pos, 0 );
                
                cs.setString(++pos, getSessionBean1().getUser());
                // Registramos los parametro de salida OUT
                cs.registerOutParameter(++pos, java.sql.Types.CHAR);

                // Ejecutamos
                cs.execute();

                // Captura los parametros de salida OUT
                resultado = cs.getString(21);

                info(resultado);      

                if ( !resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK) )
                    throw new Exception (Constants.MSG_NOK); 

                tfIdValidador.setDisabled(false);
                rbTipoComparendo.setDisabled(false);

                tfIdValidador.setText("");

                tfMunicipio.setText("");
                tfFcm.setText("");
                tfConcesionario.setText("");
                tfAcuerdo.setText("");

                clFechaIni.setValue("");
                clFechaFin.setValue("");

                this.rbTipoComparendo.setValue(null);
                btActualizar_Agregar.setText("Adicionar");   

                this.validador_fechaDataProvider.refresh();
            
            
        } catch (Exception e) {
            info(e.getMessage());
            
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }

    public void ddMunicipio_processValueChange(ValueChangeEvent event) {
               
                tfIdValidador.setDisabled(false);
                rbTipoComparendo.setDisabled(false);

                tfIdValidador.setText("");
                
                tfMunicipio.setText("");
                tfFcm.setText("");
                tfConcesionario.setText("");
                tfAcuerdo.setText("");
                clFechaIni.setValue("");
                clFechaFin.setValue("");
                
                btActualizar_Agregar.setText("Adicionar");  
                
                this.rbTipoComparendo.setValue(null);
        try {
            getSessionBean1().getValidador_fechaRowSet().setObject(
                    1,(String) this.ddMunicipio.getSelected());
        } catch (SQLException ex) {
           info(ex.getMessage());
        }
            this.validador_fechaDataProvider.refresh();
        
    }
    
    public String beditar_action() {
       // call procedure que banco
        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.validadorQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.ddMunicipio.getSelected() );
            cs.setString(++pos, (String)stValidador.getText());
            cs.setString(++pos, (String)stTipo.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.DATE);
            cs.registerOutParameter(++pos, java.sql.Types.DATE);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(17);
            
            this.tfIdValidador.setText((String)stValidador.getText());
            this.rbTipoComparendo.setValue((String)stTipo.getText());
            this.clFechaIni.setValue(cs.getDate(5));
            this.clFechaFin.setValue(cs.getDate(6));
            this.tfMunicipio.setText(cs.getString(7));
            this.tfFcm.setText(cs.getString(8));
            this.tfConcesionario.setText(cs.getString(9));
            this.tfAcuerdo.setText(cs.getString(10));

            
            btActualizar_Agregar.setText("Actualizar");           

            tfIdValidador.setDisabled(true);
            rbTipoComparendo.setDisabled(true);

            info(resultado);
            
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
            cs = con.prepareCall(Constants.validadorDel);
            
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.ddMunicipio.getSelected() );
            cs.setString(++pos, (String)stValidador.getText());
            cs.setString(++pos, (String)stTipo.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(5);
            
            info(resultado);
            
           
            btActualizar_Agregar.setText("Adicionar");           
            tfIdValidador.setDisabled(false);
            rbTipoComparendo.setDisabled(false);

            
                 tfIdValidador.setText("");
                
                tfMunicipio.setText("");
                tfFcm.setText("");
                tfConcesionario.setText("");
                tfAcuerdo.setText("");

                
                clFechaIni.setValue("");
                clFechaFin.setValue("");
                
                
            this.rbTipoComparendo.setValue(null);

            
            this.validador_fechaDataProvider.refresh();
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    public String validarFecha(int fecha_ini_ano, int fecha_ini_mes, int fecha_ini_dia, int fecha_fin_ano, int fecha_fin_mes, int fecha_fin_dia, String tipo, String idmunicipio, String validador){

        try {
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.FcmValidarFecha); 
            
            // Cargamos los parametros de entrada IN
            cs.setInt(1, fecha_ini_ano );
            cs.setInt(2, fecha_ini_mes );
            cs.setInt(3, fecha_ini_dia );
            cs.setInt(4, fecha_fin_ano );
            cs.setInt(5, fecha_fin_mes );
            cs.setInt(6, fecha_fin_dia );
            cs.setString(7, tipo);
            cs.setString(8, idmunicipio);
            cs.setString(9, validador);
            
            cs.registerOutParameter(10, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(10);
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return resultado;
    }
}

