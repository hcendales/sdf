
/*
 * cargueArchivo.java
 *
 * Created on 29 de octubre de 2007, 04:15 PM
 * Copyright DSOFTFIN
 */
package wasimit;

import com.sun.corba.se.impl.orbutil.closure.Constant;
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
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.component.Upload;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import com.sun.rave.web.ui.model.UploadedFile;
import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.faces.FacesException;
import javax.faces.event.ValueChangeEvent;
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
public class cargueArchivo extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        cta_recaudo_fcmDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.cta_recaudo_fcmRowSet2}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddtipocargueDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("", "Seleccione"), new com.sun.rave.web.ui.model.Option("REC", "Recaudo Local Bancos"), new com.sun.rave.web.ui.model.Option("EXT", "Extracto Banco"), new com.sun.rave.web.ui.model.Option("SIN", "Historico depositos sin identificar"), new com.sun.rave.web.ui.model.Option("MOV", "Movimiento Avvillas"), new com.sun.rave.web.ui.model.Option("IDE", "Identificacion Masiva"), new com.sun.rave.web.ui.model.Option("DEP", "Depositos Identificados"), new com.sun.rave.web.ui.model.Option("DSI", "Depositos sin identificar")});
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
    
    private Upload fileUpload1 = new Upload();
    
    public Upload getFileUpload1() {
        return fileUpload1;
    }
    
    public void setFileUpload1(Upload u) {
        this.fileUpload1 = u;
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
    
    private StaticText fileNameStaticText = new StaticText();
    
    public StaticText getFileNameStaticText() {
        return fileNameStaticText;
    }
    
    public void setFileNameStaticText(StaticText st) {
        this.fileNameStaticText = st;
    }
    
    private StaticText fileTypeStaticText = new StaticText();
    
    public StaticText getFileTypeStaticText() {
        return fileTypeStaticText;
    }
    
    public void setFileTypeStaticText(StaticText st) {
        this.fileTypeStaticText = st;
    }
    
    private StaticText fileSizeStaticText = new StaticText();
    
    public StaticText getFileSizeStaticText() {
        return fileSizeStaticText;
    }
    
    public void setFileSizeStaticText(StaticText st) {
        this.fileSizeStaticText = st;
    }
    
    private Button uploadFileButton = new Button();
    
    public Button getUploadFileButton() {
        return uploadFileButton;
    }
    
    public void setUploadFileButton(Button b) {
        this.uploadFileButton = b;
    }
    
    private DropDown dropDownBanco = new DropDown();
    
    public DropDown getDropDownBanco() {
        return dropDownBanco;
    }
    
    public void setDropDownBanco(DropDown dd) {
        this.dropDownBanco = dd;
    }
    
    private DropDown dropDownCuenta = new DropDown();
    
    public DropDown getDropDownCuenta() {
        return dropDownCuenta;
    }
    
    public void setDropDownCuenta(DropDown dd) {
        this.dropDownCuenta = dd;
    }
    
    private CachedRowSetDataProvider cta_recaudo_fcmDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getCta_recaudo_fcmDataProvider() {
        return cta_recaudo_fcmDataProvider;
    }
    
    public void setCta_recaudo_fcmDataProvider(CachedRowSetDataProvider crsdp) {
        this.cta_recaudo_fcmDataProvider = crsdp;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private DropDown ddtipocargue = new DropDown();
    
    public DropDown getDdtipocargue() {
        return ddtipocargue;
    }
    
    public void setDdtipocargue(DropDown dd) {
        this.ddtipocargue = dd;
    }
    
    private SingleSelectOptionsList ddtipocargueDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdtipocargueDefaultOptions() {
        return ddtipocargueDefaultOptions;
    }
    
    public void setDdtipocargueDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddtipocargueDefaultOptions = ssol;
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
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public cargueArchivo() {
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
            log("cargueArchivo Initialization Failure", e);
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
        
        if (ddtipocargue.getValue() == null) {
            dropDownBanco.setVisible(false);
            dropDownCuenta.setVisible(false);
            label1.setVisible(false);
            fileUpload1.setVisible(false);
            uploadFileButton.setVisible(false);
            label2.setVisible(false);
            fileNameStaticText.setVisible(false);
            label3.setVisible(false);
            fileTypeStaticText.setVisible(false);
            label4.setVisible(false);
            fileSizeStaticText.setVisible(false);
            
        }
        if ( dropDownBanco.getSelected() == null ) {
            try {
                bancoDataProvider.cursorFirst();
                getSessionBean1().getCta_recaudo_fcmRowSet2().setObject(1, getApplicationBean1().getNITFCM());
                getSessionBean1().getCta_recaudo_fcmRowSet2().setObject(2, bancoDataProvider.getValue("IDBANCO"));
//                getSessionBean1().getCta_recaudo_fcmRowSet().setObject(1, "8000826650");
//                getSessionBean1().getCta_recaudo_fcmRowSet().setObject(2, "52");
                cta_recaudo_fcmDataProvider.refresh();
            } catch (Exception e) {
                error("No existen Cuentas FCM para el Banco el Banco (" +  bancoDataProvider.getValue("IDBANCO") + ") "+ bancoDataProvider.getValue("NOMBRE"));
                log("No existen Cuentas FCM para el Banco el Banco (" +  bancoDataProvider.getValue("IDBANCO") + ") "+ bancoDataProvider.getValue("NOMBRE"), e);
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
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
    }
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected ApplicationBean1 getApplicationBean1() {
        return (ApplicationBean1)getBean("ApplicationBean1");
    }
    
    
    public String uploadFileButton_action() {
        
        
        try{
            
            if( this.ddtipocargue.getValue().toString().equals("REC") )
                if(this.dropDownBanco.getValue().toString().equals("00"))
                    throw new Exception("Seleccione el banco");
            
            if( this.ddtipocargue.getValue().toString().equals("MOV") )
                if(this.dropDownBanco.getValue().toString().equals("00"))
                    throw new Exception("Seleccione el banco");
            
            
            if( this.ddtipocargue.getValue().toString().equals("EXT") )
                if(this.dropDownBanco.getValue().toString().equals("00"))
                    throw new Exception("Seleccione el banco");
            
            if( this.ddtipocargue.getValue().toString().equals("EXT") )
                if( this.dropDownCuenta.getValue() == null )
                    throw new Exception("Seleccione la cuenta del banco recaudador");
            
            if( this.ddtipocargue.getValue().toString().equals("MOV") )
                if(!this.dropDownBanco.getValue().toString().equals("52"))
                    throw new Exception("Banco recaudador debe ser Avvillas");
            
            if( this.ddtipocargue.getValue().toString().equals("EXT") )
                if(this.dropDownBanco.getValue().toString().equals("52"))
                    throw new Exception("Para Avvillas no se carga extracto, se debe hacer por movimiento Avvillas");
            
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
            
            if ( !extencionFileName.equals("txt") &&
                    !extencionFileName.equals("csv") )
                throw new Exception("Archivo debe poseer una extension txt o csv. Ajustar nombre del archivo");
            
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
            
            String cuenta = "";
            String periodo = "";
            
            if( this.ddtipocargue.getValue().toString().equals("EXT") ||
                    this.ddtipocargue.getValue().toString().equals("REC") ||
                    this.ddtipocargue.getValue().toString().equals("DEP") ||
                    this.ddtipocargue.getValue().toString().equals("MOV") ) {
                
                if ( this.dropDownCuenta.getValue() != null)
                    cuenta = this.dropDownCuenta.getValue().toString();
                else
                    cuenta = "";
                
                if ( justFileName.length() < 18 )
                    throw new Exception("Formato de archivo debe ser aaaammdd_cta.txt");
                
                //if (!justFileName.contains(this.dropDownCuenta.getValue().toString()))
                //    throw new Exception("Formato de archivo debe ser aaaamm_cta.txt");
                
                // cambiar para año 3000 en adelante
                //if (!justFileName.startsWith("2"))
                //    throw new Exception("Formato de archivo debe ser aaaammdd_cta.txt");
                
                periodo = justFileName.substring(0,6);
                String quincena = justFileName.substring(6,8);
                
                try{
                    
                    int vlr = Integer.parseInt( periodo );
                    
                    if (vlr < 0)
                        throw new Exception("Formato de archivo debe ser aaaammdd_cta.txt");
                    
                }catch(NumberFormatException e) {
                    throw new Exception("Formato de archivo debe ser aaaammdd_cta.txt");
                }
                
                if (!quincena.equals("15") &&  !quincena.equals("30"))
                    throw new Exception("Extracto debe ser del 15 o 30");
                
                
            }
            
            this.fileNameStaticText.setValue(justFileName);
            Long uploadedFileSize = new Long(uploadedFile.getSize());
            this.fileSizeStaticText.setValue(uploadedFileSize);
            String uploadedFileType = uploadedFile.getContentType();
            this.fileTypeStaticText.setValue(uploadedFileType);
            
            try {
                con = Constants.getJdbcDataSource().getConnection();
                cs = con.prepareCall(Constants.carguearchivo);
                
                // Cargamos los parametros de entrada IN
                cs.setString("p_filename", justFileName);
                lobsize = (int)uploadedFile.getSize();
                cs.setAsciiStream("p_cfile", uploadedFile.getInputStream(),lobsize);
                cs.setString("p_usuario", getSessionBean1().getUser());
                
                // Registramos los parametro de salida OUT
                cs.registerOutParameter("p_error", java.sql.Types.CHAR);
                
                // Ejecutamos
                cs.execute();
                
                // Captura los parametros de salida OUT
                resultado = cs.getString("p_error");
                
                if (Integer.parseInt(resultado) ==  0)
                    throw new Exception("Problemas en cargue. " + resultado);
                
                cs = con.prepareCall(Constants.validaarchivo);
                
                // Cargamos los parametros de entrada IN
                pos = 0;
                cs.setString("p_tipocargue", (String) this.ddtipocargue.getValue());
                cs.setString("p_uploadid", resultado);
                cs.setString("p_idbanco", (String)dropDownBanco.getSelected());
                
                if( this.ddtipocargue.getValue().toString().equals("EXT") )
                    cs.setString("p_cta_recaudo_fcm", (String)dropDownCuenta.getSelected());
                else
                    if( this.ddtipocargue.getValue().toString().equals("REC") )
                        cs.setString("p_cta_recaudo_fcm", (String)dropDownCuenta.getSelected());
                    else
                        cs.setString("p_cta_recaudo_fcm", "");
                
                cs.setString("p_usuario", getSessionBean1().getUser());
                
                // Registramos los parametro de salida OUT
                cs.registerOutParameter("p_error", java.sql.Types.CHAR);
                
                // Ejecutamos
                cs.execute();
                
                // Captura los parametros de salida OUT
                resultado = cs.getString("p_error");
                info(resultado);
                
                
                
            } catch (Exception e) {
                info(e.getMessage());
            } finally {
                SQLTools.close(rs, cs, con);
            }
            
            
        } catch(Exception e){
            info(e.getMessage());
            
        }
        return resultado;
    }
    
    
    public void dropDownBanco_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        //Dropdown List Event Code
        try {
            getSessionBean1().getCta_recaudo_fcmRowSet2().setObject(1, getApplicationBean1().getNITFCM());
            getSessionBean1().getCta_recaudo_fcmRowSet2().setObject(2, dropDownBanco.getValue());
            cta_recaudo_fcmDataProvider.refresh();
        } catch (Exception e) {
            error("No existen Cuentas FCM para el Banco el Banco (" +  bancoDataProvider.getValue("IDBANCO") + ") "+ bancoDataProvider.getValue("NOMBRE"));
            log("No existen Cuentas FCM para el Banco el Banco (" +  bancoDataProvider.getValue("IDBANCO") + ") "+ bancoDataProvider.getValue("NOMBRE"),e);
        }
    }
    
    public void ddtipocargue_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        stopcion1.setText("Cargue Archivo " + (String)ddtipocargue.getValue());
        //info(ddtipocargue.getValue().toString());
        if (ddtipocargue.getValue().toString().compareToIgnoreCase("REC") == 0 || ddtipocargue.getValue().toString().compareToIgnoreCase("EXT") == 0 ||  ddtipocargue.getValue().toString().compareToIgnoreCase("MOV") == 0) {
            dropDownBanco.setVisible(true);
            dropDownCuenta.setVisible(true);
            label1.setVisible(true);
            fileUpload1.setVisible(true);
            uploadFileButton.setVisible(true);
            label2.setVisible(true);
            fileNameStaticText.setVisible(true);
            label3.setVisible(true);
            fileTypeStaticText.setVisible(true);
            label4.setVisible(true);
            fileSizeStaticText.setVisible(true);
        } else if (ddtipocargue.getValue().toString().compareToIgnoreCase("DEP") == 0 || ddtipocargue.getValue().toString().compareToIgnoreCase("IDE") == 0) {
            dropDownBanco.setVisible(false);
            dropDownCuenta.setVisible(false);
            label1.setVisible(true);
            fileUpload1.setVisible(true);
            uploadFileButton.setVisible(true);
            label2.setVisible(true);
            fileNameStaticText.setVisible(true);
            label3.setVisible(true);
            fileTypeStaticText.setVisible(true);
            label4.setVisible(true);
            fileSizeStaticText.setVisible(true);
        }else if (ddtipocargue.getValue().toString().compareToIgnoreCase("SIN") == 0 || ddtipocargue.getValue().toString().compareToIgnoreCase("DSI") == 0 ) {
            dropDownBanco.setVisible(false);
            dropDownCuenta.setVisible(false);
            label1.setVisible(true);
            fileUpload1.setVisible(true);
            uploadFileButton.setVisible(true);
            label2.setVisible(true);
            fileNameStaticText.setVisible(true);
            label3.setVisible(true);
            fileTypeStaticText.setVisible(true);
            label4.setVisible(true);
            fileSizeStaticText.setVisible(true);
        } else { // Seleccione
            dropDownBanco.setVisible(false);
            dropDownCuenta.setVisible(false);
            label1.setVisible(false);
            fileUpload1.setVisible(false);
            uploadFileButton.setVisible(false);
            label2.setVisible(false);
            fileNameStaticText.setVisible(false);
            label3.setVisible(false);
            fileTypeStaticText.setVisible(false);
            label4.setVisible(false);
            fileSizeStaticText.setVisible(false);
        }
        
        
    }
    
}

