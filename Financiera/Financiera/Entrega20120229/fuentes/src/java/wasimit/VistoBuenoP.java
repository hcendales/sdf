/*
 * rptLiqSimitLoc.java
 *
 * Created on 28 de noviembre de 2007, 02:30 PM
 * Copyright DSOFTFIN
 */
package wasimit;

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
import com.sun.rave.web.ui.component.RadioButtonGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
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
public class VistoBuenoP extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        radioButtonGroup1DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("L", "Recaudo Local")});
        radioButtonGroup2DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("D", "Distribucion"), new com.sun.rave.web.ui.model.Option("T", "Transferencia")});
        dropDown1DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("52", "Avvillas"), new com.sun.rave.web.ui.model.Option("51", "Davivienda"), new com.sun.rave.web.ui.model.Option("40", "Agrario"), new com.sun.rave.web.ui.model.Option("02", "Popular")});
        radioButtonGroup1DefaultOptions.setSelectedValue("L");
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
    
    private RadioButtonGroup radioButtonGroup1 = new RadioButtonGroup();
    
    public RadioButtonGroup getRadioButtonGroup1() {
        return radioButtonGroup1;
    }
    
    public void setRadioButtonGroup1(RadioButtonGroup rbg) {
        this.radioButtonGroup1 = rbg;
    }
    
    private SingleSelectOptionsList radioButtonGroup1DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getRadioButtonGroup1DefaultOptions() {
        return radioButtonGroup1DefaultOptions;
    }
    
    public void setRadioButtonGroup1DefaultOptions(SingleSelectOptionsList ssol) {
        this.radioButtonGroup1DefaultOptions = ssol;
    }
    
    private RadioButtonGroup radioButtonGroup2 = new RadioButtonGroup();
    
    public RadioButtonGroup getRadioButtonGroup2() {
        return radioButtonGroup2;
    }
    
    public void setRadioButtonGroup2(RadioButtonGroup rbg) {
        this.radioButtonGroup2 = rbg;
    }
    
    private SingleSelectOptionsList radioButtonGroup2DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getRadioButtonGroup2DefaultOptions() {
        return radioButtonGroup2DefaultOptions;
    }
    
    public void setRadioButtonGroup2DefaultOptions(SingleSelectOptionsList ssol) {
        this.radioButtonGroup2DefaultOptions = ssol;
    }
    
    private Calendar calendar1 = new Calendar();
    
    public Calendar getCalendar1() {
        return calendar1;
    }
    
    public void setCalendar1(Calendar c) {
        this.calendar1 = c;
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
    
    private Calendar calendar2 = new Calendar();
    
    public Calendar getCalendar2() {
        return calendar2;
    }
    
    public void setCalendar2(Calendar c) {
        this.calendar2 = c;
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
    
    private Calendar calendar3 = new Calendar();
    
    public Calendar getCalendar3() {
        return calendar3;
    }
    
    public void setCalendar3(Calendar c) {
        this.calendar3 = c;
    }
    
    private Calendar calendar4 = new Calendar();
    
    public Calendar getCalendar4() {
        return calendar4;
    }
    
    public void setCalendar4(Calendar c) {
        this.calendar4 = c;
    }
    
    private Button button1 = new Button();
    
    public Button getButton1() {
        return button1;
    }
    
    public void setButton1(Button b) {
        this.button1 = b;
    }
    
    private Label label5 = new Label();
    
    public Label getLabel5() {
        return label5;
    }
    
    public void setLabel5(Label l) {
        this.label5 = l;
    }
    
    private DropDown dropDown1 = new DropDown();
    
    public DropDown getDropDown1() {
        return dropDown1;
    }
    
    public void setDropDown1(DropDown dd) {
        this.dropDown1 = dd;
    }
    
    private SingleSelectOptionsList dropDown1DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDropDown1DefaultOptions() {
        return dropDown1DefaultOptions;
    }
    
    public void setDropDown1DefaultOptions(SingleSelectOptionsList ssol) {
        this.dropDown1DefaultOptions = ssol;
    }
    
    private TextArea textArea1 = new TextArea();
    
    public TextArea getTextArea1() {
        return textArea1;
    }
    
    public void setTextArea1(TextArea ta) {
        this.textArea1 = ta;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public VistoBuenoP() {
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
    
    
    public void radioButtonGroup2_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        if (radioButtonGroup1.getValue() == null ||
                radioButtonGroup2.getValue() == null){
            return;
        }
        
        label1.setVisible(false);
        label2.setVisible(false);
        label3.setVisible(false);
        label4.setVisible(false);
        label5.setVisible(true);
        label6.setVisible(false);
        
        calendar1.setVisible(false);
        calendar2.setVisible(false);
        calendar3.setVisible(false);
        calendar4.setVisible(false);
        
        textArea1.setVisible(true);
        
        dropDown1.setVisible(true);
        label6.setVisible(true);
         
        if (radioButtonGroup2.getValue().toString().equals("D")) {
            if (this.radioButtonGroup1.getValue().toString().equals("L")) {
                label3.setVisible(true);
                calendar3.setVisible(true);
                label4.setVisible(true);
                calendar4.setVisible(true);
               
            }
        }
        
        if (radioButtonGroup2.getValue().toString().equals("T")) {
            if (radioButtonGroup1.getValue().toString().equals("L")) {
                label2.setVisible(true);
                calendar2.setVisible(true);
            }
        }
        
    }
    
    public void radioButtonGroup1_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        radioButtonGroup2_processValueChange(null);
    }
    
    public String button1_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            if (radioButtonGroup1.getValue() == null ||
                radioButtonGroup2.getValue() == null)
                throw new Exception("Seleccione el tipo de recaudo y el proceso a dar visto bueno");

            if (this.textArea1.getText() != null )
                if (this.textArea1.getText().toString().length() > 500 )
                    throw new Exception("Observaciones demasiado largas. Tama�o maximo 500 caracteres");

            java.util.Calendar cal =  java.util.Calendar.getInstance();
            
            Date fecha_ini = null;
            Date fecha_fin = null;
            
            int fecha_ini_ano = 0;
            int fecha_ini_mes = 0;
            int fecha_ini_dia = 0;
            int fecha_fin_ano = 0;
            int fecha_fin_mes = 0;
            int fecha_fin_dia = 0;
            
            if (this.radioButtonGroup1.getValue().toString().equals("L") &&
                this.radioButtonGroup2.getValue().toString().equals("D") ) {
                
                if (calendar3.getSelectedDate() == null)
                    throw new Exception("Ingrese fecha de corte inicial");
                
                if (calendar4.getSelectedDate() == null)
                    throw new Exception("Ingrese fecha de corte final");
                
                if (dropDown1.getValue() == null )
                    throw new Exception("Seleccione banco a autorizar");
                
                fecha_ini = calendar3.getSelectedDate();
                cal.setTime(fecha_ini);
                
                fecha_ini_ano = cal.get(java.util.Calendar.YEAR) ;
                fecha_ini_mes = cal.get(java.util.Calendar.MONTH) + 1;
                fecha_ini_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
                
                fecha_fin = this.calendar4.getSelectedDate();
                cal.setTime(fecha_fin);
                
                fecha_fin_ano = cal.get(java.util.Calendar.YEAR) ;
                fecha_fin_mes = cal.get(java.util.Calendar.MONTH) + 1;
                fecha_fin_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
                
                if (fecha_ini.compareTo(fecha_fin) > 0)
                    throw new Exception("Fecha final debe ser superior o igual a fecha inicial");
            }
            
            if (radioButtonGroup1.getValue().toString().equals("L") &&
                radioButtonGroup2.getValue().toString().equals("T")  ) {
                
                if (calendar2.getSelectedDate() == null)
                    throw new Exception("Ingrese fecha de pago");
                
                if (dropDown1.getValue() == null )
                    throw new Exception("Seleccione banco a autorizar");
            
                fecha_ini = calendar2.getSelectedDate();
                cal.setTime(fecha_ini);
                
                fecha_ini_ano = cal.get(java.util.Calendar.YEAR) ;
                fecha_ini_mes = cal.get(java.util.Calendar.MONTH) + 1;
                fecha_ini_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
              
                fecha_fin_ano = cal.get(java.util.Calendar.YEAR) ;
                fecha_fin_mes = cal.get(java.util.Calendar.MONTH) + 1;
                fecha_fin_dia = cal.get(java.util.Calendar.DAY_OF_MONTH);
             
            }

            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.VistoBuenoP);
             
            cs.setInt(++pos, fecha_ini_ano );
            cs.setInt(++pos, fecha_ini_mes );
            cs.setInt(++pos, fecha_ini_dia );

            cs.setInt(++pos, fecha_fin_ano );
            cs.setInt(++pos, fecha_fin_mes );
            cs.setInt(++pos, fecha_fin_dia );

            cs.setString(++pos, radioButtonGroup1.getValue().toString() );
            cs.setString(++pos, radioButtonGroup2.getValue().toString() );
            
            if (dropDown1.getValue() == null)
                cs.setString(++pos, "00" );
            else
                cs.setString(++pos, dropDown1.getValue().toString() );
            
            if (this.textArea1.getText() == null )
                cs.setString(++pos, "" );
            else
                cs.setString(++pos,textArea1.getText().toString()  );
            
            cs.setString(++pos, getSessionBean1().getUser());
             
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
             
            // Ejecutamos
            cs.execute();
             
            // Captura los parametros de salida OUT
            resultado = cs.getString(12);
             
            info(resultado);
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return null;
        
    }
    
    
    
}

