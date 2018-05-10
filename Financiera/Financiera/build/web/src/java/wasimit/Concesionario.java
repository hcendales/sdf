/*
 * Concesionario.java
 *
 * Created on November 8, 2007, 2:40 PM
 * Copyright cristina
 */
package wasimit;


import com.sun.data.provider.DataAdapter;
import com.sun.data.provider.DataProvider;
import com.sun.data.provider.FieldKey;
import com.sun.data.provider.RefreshableDataAdapter;
import com.sun.data.provider.RefreshableDataProvider;
import com.sun.data.provider.RowKey;
import com.sun.data.provider.TableCursorAdapter;
import com.sun.data.provider.TableDataAdapter;
import com.sun.data.provider.TableDataProvider;
import com.sun.data.provider.TransactionalDataAdapter;
import com.sun.data.provider.TransactionalDataProvider;
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
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.faces.FacesException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.faces.event.ValueChangeEvent;
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
public class Concesionario extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        concesionarioDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet1}"));
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

    private Label label2 = new Label();

    public Label getLabel2() {
        return label2;
    }

    public void setLabel2(Label l) {
        this.label2 = l;
    }

    private TextField tfIdConces = new TextField();

    public TextField getTfIdConces() {
        return tfIdConces;
    }

    public void setTfIdConces(TextField tf) {
        this.tfIdConces = tf;
    }

    private Label label3 = new Label();

    public Label getLabel3() {
        return label3;
    }

    public void setLabel3(Label l) {
        this.label3 = l;
    }

    private TextField tfNombre = new TextField();

    public TextField getTfNombre() {
        return tfNombre;
    }

    public void setTfNombre(TextField tf) {
        this.tfNombre = tf;
    }

    private Label label4 = new Label();

    public Label getLabel4() {
        return label4;
    }

    public void setLabel4(Label l) {
        this.label4 = l;
    }

    private TextField tfCorreo = new TextField();

    public TextField getTfCorreo() {
        return tfCorreo;
    }

    public void setTfCorreo(TextField tf) {
        this.tfCorreo = tf;
    }

    private Label label5 = new Label();

    public Label getLabel5() {
        return label5;
    }

    public void setLabel5(Label l) {
        this.label5 = l;
    }

    private TextField tfNit = new TextField();

    public TextField getTfNit() {
        return tfNit;
    }

    public void setTfNit(TextField tf) {
        this.tfNit = tf;
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

    private Label label11 = new Label();

    public Label getLabel11() {
        return label11;
    }

    public void setLabel11(Label l) {
        this.label11 = l;
    }

    private TextField tfS_PConces = new TextField();

    public TextField getTfS_PConces() {
        return tfS_PConces;
    }

    public void setTfS_PConces(TextField tf) {
        this.tfS_PConces = tf;
    }

    private TextField tfS_PSimit = new TextField();

    public TextField getTfS_PSimit() {
        return tfS_PSimit;
    }

    public void setTfS_PSimit(TextField tf) {
        this.tfS_PSimit = tf;
    }

    private TextField tfS_PFondoC = new TextField();

    public TextField getTfS_PFondoC() {
        return tfS_PFondoC;
    }

    public void setTfS_PFondoC(TextField tf) {
        this.tfS_PFondoC = tf;
    }

    private TextField tfS_PFondoS = new TextField();

    public TextField getTfS_PFondoS() {
        return tfS_PFondoS;
    }

    public void setTfS_PFondoS(TextField tf) {
        this.tfS_PFondoS = tf;
    }

    private TextField tfS_PEquilibrio = new TextField();

    public TextField getTfS_PEquilibrio() {
        return tfS_PEquilibrio;
    }

    public void setTfS_PEquilibrio(TextField tf) {
        this.tfS_PEquilibrio = tf;
    }

    private Label label12 = new Label();

    public Label getLabel12() {
        return label12;
    }

    public void setLabel12(Label l) {
        this.label12 = l;
    }

    private TextField tfPM_PSimit = new TextField();

    public TextField getTfPM_PSimit() {
        return tfPM_PSimit;
    }

    public void setTfPM_PSimit(TextField tf) {
        this.tfPM_PSimit = tf;
    }

    private TextField tfPM_PConces = new TextField();

    public TextField getTfPM_PConces() {
        return tfPM_PConces;
    }

    public void setTfPM_PConces(TextField tf) {
        this.tfPM_PConces = tf;
    }

    private TextField tfPM_PFondoS = new TextField();

    public TextField getTfPM_PFondoS() {
        return tfPM_PFondoS;
    }

    public void setTfPM_PFondoS(TextField tf) {
        this.tfPM_PFondoS = tf;
    }

    private TextField tfPM_PEquilibrio = new TextField();

    public TextField getTfPM_PEquilibrio() {
        return tfPM_PEquilibrio;
    }

    public void setTfPM_PEquilibrio(TextField tf) {
        this.tfPM_PEquilibrio = tf;
    }

    private TextField tfPM_PFondoC = new TextField();

    public TextField getTfPM_PFondoC() {
        return tfPM_PFondoC;
    }

    public void setTfPM_PFondoC(TextField tf) {
        this.tfPM_PFondoC = tf;
    }

    private Label label13 = new Label();

    public Label getLabel13() {
        return label13;
    }

    public void setLabel13(Label l) {
        this.label13 = l;
    }

    private TextField tfPP_PSevial = new TextField();

    public TextField getTfPP_PSevial() {
        return tfPP_PSevial;
    }

    public void setTfPP_PSevial(TextField tf) {
        this.tfPP_PSevial = tf;
    }

    private TextField tfPP_PSimit = new TextField();

    public TextField getTfPP_PSimit() {
        return tfPP_PSimit;
    }

    public void setTfPP_PSimit(TextField tf) {
        this.tfPP_PSimit = tf;
    }

    private Label label14 = new Label();

    public Label getLabel14() {
        return label14;
    }

    public void setLabel14(Label l) {
        this.label14 = l;
    }

    private Label label15 = new Label();

    public Label getLabel15() {
        return label15;
    }

    public void setLabel15(Label l) {
        this.label15 = l;
    }

    private Label label17 = new Label();

    public Label getLabel17() {
        return label17;
    }

    public void setLabel17(Label l) {
        this.label17 = l;
    }

    private Label label18 = new Label();

    public Label getLabel18() {
        return label18;
    }

    public void setLabel18(Label l) {
        this.label18 = l;
    }

    private TextField tfPP_PEquilibrio = new TextField();

    public TextField getTfPP_PEquilibrio() {
        return tfPP_PEquilibrio;
    }

    public void setTfPP_PEquilibrio(TextField tf) {
        this.tfPP_PEquilibrio = tf;
    }

    private Label label19 = new Label();

    public Label getLabel19() {
        return label19;
    }

    public void setLabel19(Label l) {
        this.label19 = l;
    }

    private Label label20 = new Label();

    public Label getLabel20() {
        return label20;
    }

    public void setLabel20(Label l) {
        this.label20 = l;
    }

    private Label label21 = new Label();

    public Label getLabel21() {
        return label21;
    }

    public void setLabel21(Label l) {
        this.label21 = l;
    }

    private Label label22 = new Label();

    public Label getLabel22() {
        return label22;
    }

    public void setLabel22(Label l) {
        this.label22 = l;
    }

    private TextField tfCP_PPolca = new TextField();

    public TextField getTfCP_PPolca() {
        return tfCP_PPolca;
    }

    public void setTfCP_PPolca(TextField tf) {
        this.tfCP_PPolca = tf;
    }

    private TextField tfCP_PFcm = new TextField();

    public TextField getTfCP_PFcm() {
        return tfCP_PFcm;
    }

    public void setTfCP_PFcm(TextField tf) {
        this.tfCP_PFcm = tf;
    }

    private TextField tfCP_PSevial = new TextField();

    public TextField getTfCP_PSevial() {
        return tfCP_PSevial;
    }

    public void setTfCP_PSevial(TextField tf) {
        this.tfCP_PSevial = tf;
    }

    private TextField tfCP_PEquilibrio = new TextField();

    public TextField getTfCP_PEquilibrio() {
        return tfCP_PEquilibrio;
    }

    public void setTfCP_PEquilibrio(TextField tf) {
        this.tfCP_PEquilibrio = tf;
    }

    private Button btAdicionar = new Button();

    public Button getBtAdicionar() {
        return btAdicionar;
    }

    public void setBtAdicionar(Button b) {
        this.btAdicionar = b;
    }

    private Label label16 = new Label();

    public Label getLabel16() {
        return label16;
    }

    public void setLabel16(Label l) {
        this.label16 = l;
    }

    private Label label23 = new Label();

    public Label getLabel23() {
        return label23;
    }

    public void setLabel23(Label l) {
        this.label23 = l;
    }

    private Label label24 = new Label();

    public Label getLabel24() {
        return label24;
    }

    public void setLabel24(Label l) {
        this.label24 = l;
    }

    private Label label25 = new Label();

    public Label getLabel25() {
        return label25;
    }

    public void setLabel25(Label l) {
        this.label25 = l;
    }

    private Label label26 = new Label();

    public Label getLabel26() {
        return label26;
    }

    public void setLabel26(Label l) {
        this.label26 = l;
    }

    private Label label27 = new Label();

    public Label getLabel27() {
        return label27;
    }

    public void setLabel27(Label l) {
        this.label27 = l;
    }

    private Label label28 = new Label();

    public Label getLabel28() {
        return label28;
    }

    public void setLabel28(Label l) {
        this.label28 = l;
    }

    private TextField tfCCLocalConS = new TextField();

    public TextField getTfCCLocalConS() {
        return tfCCLocalConS;
    }

    public void setTfCCLocalConS(TextField tf) {
        this.tfCCLocalConS = tf;
    }

    private TextField tfCCLocalSimS = new TextField();

    public TextField getTfCCLocalSimS() {
        return tfCCLocalSimS;
    }

    public void setTfCCLocalSimS(TextField tf) {
        this.tfCCLocalSimS = tf;
    }

    private TextField tfCCLocalFonS = new TextField();

    public TextField getTfCCLocalFonS() {
        return tfCCLocalFonS;
    }

    public void setTfCCLocalFonS(TextField tf) {
        this.tfCCLocalFonS = tf;
    }

    private TextField tfCCLocalCobS = new TextField();

    public TextField getTfCCLocalCobS() {
        return tfCCLocalCobS;
    }

    public void setTfCCLocalCobS(TextField tf) {
        this.tfCCLocalCobS = tf;
    }

    private TextField tfCCLocalEquS = new TextField();

    public TextField getTfCCLocalEquS() {
        return tfCCLocalEquS;
    }

    public void setTfCCLocalEquS(TextField tf) {
        this.tfCCLocalEquS = tf;
    }

    private TextField tfCCExtConS = new TextField();

    public TextField getTfCCExtConS() {
        return tfCCExtConS;
    }

    public void setTfCCExtConS(TextField tf) {
        this.tfCCExtConS = tf;
    }

    private TextField tfCCExtSimS = new TextField();

    public TextField getTfCCExtSimS() {
        return tfCCExtSimS;
    }

    public void setTfCCExtSimS(TextField tf) {
        this.tfCCExtSimS = tf;
    }

    private TextField tfCCExtFonS = new TextField();

    public TextField getTfCCExtFonS() {
        return tfCCExtFonS;
    }

    public void setTfCCExtFonS(TextField tf) {
        this.tfCCExtFonS = tf;
    }

    private TextField tfCCExtCobS = new TextField();

    public TextField getTfCCExtCobS() {
        return tfCCExtCobS;
    }

    public void setTfCCExtCobS(TextField tf) {
        this.tfCCExtCobS = tf;
    }

    private TextField tfCCExtEquS = new TextField();

    public TextField getTfCCExtEquS() {
        return tfCCExtEquS;
    }

    public void setTfCCExtEquS(TextField tf) {
        this.tfCCExtEquS = tf;
    }

    private TextField tfCCLocalSimP = new TextField();

    public TextField getTfCCLocalSimP() {
        return tfCCLocalSimP;
    }

    public void setTfCCLocalSimP(TextField tf) {
        this.tfCCLocalSimP = tf;
    }

    private TextField tfCCLocalConP = new TextField();

    public TextField getTfCCLocalConP() {
        return tfCCLocalConP;
    }

    public void setTfCCLocalConP(TextField tf) {
        this.tfCCLocalConP = tf;
    }

    private TextField tfCCLocalCobP = new TextField();

    public TextField getTfCCLocalCobP() {
        return tfCCLocalCobP;
    }

    public void setTfCCLocalCobP(TextField tf) {
        this.tfCCLocalCobP = tf;
    }

    private TextField tfCCLocalEquP = new TextField();

    public TextField getTfCCLocalEquP() {
        return tfCCLocalEquP;
    }

    public void setTfCCLocalEquP(TextField tf) {
        this.tfCCLocalEquP = tf;
    }

    private TextField tfCCLocalFonP = new TextField();

    public TextField getTfCCLocalFonP() {
        return tfCCLocalFonP;
    }

    public void setTfCCLocalFonP(TextField tf) {
        this.tfCCLocalFonP = tf;
    }

    private TextField tfCCExtEquP = new TextField();

    public TextField getTfCCExtEquP() {
        return tfCCExtEquP;
    }

    public void setTfCCExtEquP(TextField tf) {
        this.tfCCExtEquP = tf;
    }

    private TextField tfCCExtFonP = new TextField();

    public TextField getTfCCExtFonP() {
        return tfCCExtFonP;
    }

    public void setTfCCExtFonP(TextField tf) {
        this.tfCCExtFonP = tf;
    }

    private TextField tfCCExtConP = new TextField();

    public TextField getTfCCExtConP() {
        return tfCCExtConP;
    }

    public void setTfCCExtConP(TextField tf) {
        this.tfCCExtConP = tf;
    }

    private TextField tfCCExtSimP = new TextField();

    public TextField getTfCCExtSimP() {
        return tfCCExtSimP;
    }

    public void setTfCCExtSimP(TextField tf) {
        this.tfCCExtSimP = tf;
    }

    private TextField tfCCExtCobP = new TextField();

    public TextField getTfCCExtCobP() {
        return tfCCExtCobP;
    }

    public void setTfCCExtCobP(TextField tf) {
        this.tfCCExtCobP = tf;
    }

    private TextField tfCCLocalSimPP = new TextField();

    public TextField getTfCCLocalSimPP() {
        return tfCCLocalSimPP;
    }

    public void setTfCCLocalSimPP(TextField tf) {
        this.tfCCLocalSimPP = tf;
    }

    private TextField tfCCLocalSevPP = new TextField();

    public TextField getTfCCLocalSevPP() {
        return tfCCLocalSevPP;
    }

    public void setTfCCLocalSevPP(TextField tf) {
        this.tfCCLocalSevPP = tf;
    }

    private TextField tfCCLocalEquPP = new TextField();

    public TextField getTfCCLocalEquPP() {
        return tfCCLocalEquPP;
    }

    public void setTfCCLocalEquPP(TextField tf) {
        this.tfCCLocalEquPP = tf;
    }

    private TextField tfCCExtSimPP = new TextField();

    public TextField getTfCCExtSimPP() {
        return tfCCExtSimPP;
    }

    public void setTfCCExtSimPP(TextField tf) {
        this.tfCCExtSimPP = tf;
    }

    private TextField tfCCExtSevPP = new TextField();

    public TextField getTfCCExtSevPP() {
        return tfCCExtSevPP;
    }

    public void setTfCCExtSevPP(TextField tf) {
        this.tfCCExtSevPP = tf;
    }

    private TextField tfCCExtEquPP = new TextField();

    public TextField getTfCCExtEquPP() {
        return tfCCExtEquPP;
    }

    public void setTfCCExtEquPP(TextField tf) {
        this.tfCCExtEquPP = tf;
    }

    private TextField tfCCLocalSimCP = new TextField();

    public TextField getTfCCLocalSimCP() {
        return tfCCLocalSimCP;
    }

    public void setTfCCLocalSimCP(TextField tf) {
        this.tfCCLocalSimCP = tf;
    }

    private TextField tfCCLocalFcmCP = new TextField();

    public TextField getTfCCLocalFcmCP() {
        return tfCCLocalFcmCP;
    }

    public void setTfCCLocalFcmCP(TextField tf) {
        this.tfCCLocalFcmCP = tf;
    }

    private TextField tfCCLocalSevCP = new TextField();

    public TextField getTfCCLocalSevCP() {
        return tfCCLocalSevCP;
    }

    public void setTfCCLocalSevCP(TextField tf) {
        this.tfCCLocalSevCP = tf;
    }

    private TextField tfCCLocalEquCP = new TextField();

    public TextField getTfCCLocalEquCP() {
        return tfCCLocalEquCP;
    }

    public void setTfCCLocalEquCP(TextField tf) {
        this.tfCCLocalEquCP = tf;
    }

    private TextField tfCCExtEquCP = new TextField();

    public TextField getTfCCExtEquCP() {
        return tfCCExtEquCP;
    }

    public void setTfCCExtEquCP(TextField tf) {
        this.tfCCExtEquCP = tf;
    }

    private TextField tfCCExtSevCP = new TextField();

    public TextField getTfCCExtSevCP() {
        return tfCCExtSevCP;
    }

    public void setTfCCExtSevCP(TextField tf) {
        this.tfCCExtSevCP = tf;
    }

    private TextField tfCCExtSimCP = new TextField();

    public TextField getTfCCExtSimCP() {
        return tfCCExtSimCP;
    }

    public void setTfCCExtSimCP(TextField tf) {
        this.tfCCExtSimCP = tf;
    }

    private TextField tfCCExtFcmCP = new TextField();

    public TextField getTfCCExtFcmCP() {
        return tfCCExtFcmCP;
    }

    public void setTfCCExtFcmCP(TextField tf) {
        this.tfCCExtFcmCP = tf;
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

    private CachedRowSetDataProvider concesionarioDataProvider1 = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getConcesionarioDataProvider1() {
        return concesionarioDataProvider1;
    }

    public void setConcesionarioDataProvider1(CachedRowSetDataProvider crsdp) {
        this.concesionarioDataProvider1 = crsdp;
    }

    private TableColumn tableColumn1 = new TableColumn();

    public TableColumn getTableColumn1() {
        return tableColumn1;
    }

    public void setTableColumn1(TableColumn tc) {
        this.tableColumn1 = tc;
    }

    private StaticText stId = new StaticText();

    public StaticText getStId() {
        return stId;
    }

    public void setStId(StaticText st) {
        this.stId = st;
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

    private Button bconsultar = new Button();

    public Button getBconsultar() {
        return bconsultar;
    }

    public void setBconsultar(Button b) {
        this.bconsultar = b;
    }

    private TableColumn tableColumn4 = new TableColumn();

    public TableColumn getTableColumn4() {
        return tableColumn4;
    }

    public void setTableColumn4(TableColumn tc) {
        this.tableColumn4 = tc;
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

    private Label label29 = new Label();

    public Label getLabel29() {
        return label29;
    }

    public void setLabel29(Label l) {
        this.label29 = l;
    }

    private Calendar cfecPro = new Calendar();

    public Calendar getCfecPro() {
        return cfecPro;
    }

    public void setCfecPro(Calendar c) {
        this.cfecPro = c;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Concesionario() {
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
            log("Concesionario Initialization Failure", e);
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
        concesionarioDataProvider1.close();
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
                          
            
            if ( tfIdConces.getText() == null )
                throw new Exception ("Ingrese el concesionario");
            
            if ( ((String)tfIdConces.getText()).length() != 2 )
                throw new Exception ("Id concesionario incorrecto");
          
            try {
                int vlr = Integer.parseInt((String)tfIdConces.getText());
                if (vlr < 0 )
                    throw new Exception ("Id consesionario incorrecto");    
            }
            catch (NumberFormatException Err)
            {
                throw new Exception ("Id consesionario no numerico"); 
            }

            if ( tfNombre.getText() == null )
                throw new Exception ("Favor ingresar nombre");

            if ( ((String)tfNombre.getText()).length() == 0 )
                throw new Exception ("Favor ingresar nombre");

            if ( tfNit.getText() == null )
                throw new Exception ("Favor ingresar Nit");

            if ( ((String)tfNit.getText()).length() == 0 )
                throw new Exception ("Favor ingresar Nit");

           try {
                float num = Float.parseFloat((String)tfNit.getText());
         
                if (num < 1000000000)
                        throw new Exception ("Favor ingresar Nit completo");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception ("Nit concesionario no numerico"); 
            }

            if (tfCorreo.getText() != null)
                if (tfCorreo.getText().toString().length() > 0 )
                    if (!validacionMail(tfCorreo.getText().toString()))
                        throw new Exception ("Formato de Correo errado"); 
                      
            con = getJdbcDataSource().getConnection();
            
           if (btAdicionar.getText().equals("Adicionar"))
               cs = con.prepareCall(Constants.ConcesionarioAdd);
            else
                cs = con.prepareCall(Constants.ConcesionarioUpd);           
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.tfIdConces.getText());
            cs.setString(++pos, (String) this.tfNit.getText());
            cs.setString(++pos, (String) this.tfNombre.getText());
            cs.setString(++pos, (String) this.tfCorreo.getText());

            // simit 10%
            if (this.tfS_PConces.getText() == null)
                this.tfS_PConces.setText("0");
            if (this.tfS_PFondoC.getText() == null)
                this.tfS_PFondoC.setText("0");
            if (this.tfS_PFondoS.getText() == null)
                this.tfS_PFondoS.setText("0");
            if (this.tfS_PSimit.getText() == null)
                this.tfS_PSimit.setText("0");
            if (this.tfS_PEquilibrio.getText() == null)
                this.tfS_PEquilibrio.setText("0");

            if (this.tfS_PConces.getText().toString().length() == 0)
                this.tfS_PConces.setText("0");
            if (this.tfS_PFondoC.getText().toString().length() == 0)
                this.tfS_PFondoC.setText("0");
            if (this.tfS_PFondoS.getText().toString().length() == 0)
                this.tfS_PFondoS.setText("0");
            if (this.tfS_PSimit.getText().toString().length() == 0)
                this.tfS_PSimit.setText("0");
            if (this.tfS_PEquilibrio.getText().toString().length() == 0)
                this.tfS_PEquilibrio.setText("0");

            
            float num1 = Float.parseFloat((String)tfS_PConces.getText());
            float num2 = Float.parseFloat((String)tfS_PFondoC.getText());
            float num3 = Float.parseFloat((String)tfS_PFondoS.getText());
            float num4 = Float.parseFloat((String)tfS_PSimit.getText());
            float num5 = Float.parseFloat((String)tfS_PEquilibrio.getText());
            
            if ( (num1+num2+num3+num4+num5) != 10.0)
                throw new Exception ("Valor porcentajes SIMIT debe ser 10%");

            
            cs.setFloat(++pos, Float.parseFloat((String)this.tfS_PConces.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfS_PFondoC.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfS_PFondoS.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfS_PSimit.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfS_PEquilibrio.getText()));

            // polca 10%
            if (this.tfPM_PConces.getText() == null)
                this.tfPM_PConces.setText("0");
            if (this.tfPM_PFondoC.getText() == null)
                this.tfPM_PFondoC.setText("0");
            if (this.tfPM_PFondoS.getText() == null)
                this.tfPM_PFondoS.setText("0");
            if (this.tfPM_PSimit.getText() == null)
                this.tfPM_PSimit.setText("0");
            if (this.tfPM_PEquilibrio.getText() == null)
                this.tfPM_PEquilibrio.setText("0");

            if (this.tfPM_PConces.getText().toString().length() == 0)
                this.tfPM_PConces.setText("0");
            if (this.tfPM_PFondoC.getText().toString().length() == 0)
                this.tfPM_PFondoC.setText("0");
            if (this.tfPM_PFondoS.getText().toString().length() == 0)
                this.tfPM_PFondoS.setText("0");
            if (this.tfPM_PSimit.getText().toString().length() == 0)
                this.tfPM_PSimit.setText("0");
            if (this.tfPM_PEquilibrio.getText().toString().length() == 0)
                this.tfPM_PEquilibrio.setText("0");


            
            num1 = Float.parseFloat((String)tfPM_PConces.getText());
            num2 = Float.parseFloat((String)tfPM_PFondoC.getText());
            num3 = Float.parseFloat((String)tfPM_PFondoS.getText());
            num4 = Float.parseFloat((String)tfPM_PSimit.getText());
            num5 = Float.parseFloat((String)tfPM_PEquilibrio.getText());
            
            if ( (num1+num2+num3+num4+num5) != 5.0)
                throw new Exception ("Valor porcentajes POLCA MUNICIPIO debe ser 5%");

            cs.setFloat(++pos, Float.parseFloat((String)this.tfPM_PConces.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfPM_PFondoC.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfPM_PFondoS.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfPM_PSimit.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfPM_PEquilibrio.getText()));

            // polca polca 5%
            if (this.tfPP_PSimit.getText() == null)
                this.tfPP_PSimit.setText("0");
            if (this.tfPP_PSevial.getText() == null)
                this.tfPP_PSevial.setText("0");
            if (this.tfPP_PEquilibrio.getText() == null)
                this.tfPP_PEquilibrio.setText("0");

            if (this.tfPP_PSimit.getText().toString().length() == 0)
                this.tfPP_PSimit.setText("0");
            if (this.tfPP_PSevial.getText().toString().length() == 0)
                this.tfPP_PSevial.setText("0");
            if (this.tfPP_PEquilibrio.getText().toString().length() == 0)
                this.tfPP_PEquilibrio.setText("0");

            num1 = Float.parseFloat((String)tfPP_PSimit.getText());
            num2 = Float.parseFloat((String)tfPP_PSevial.getText());
            num3 = Float.parseFloat((String)tfPP_PEquilibrio.getText());
            
            if ( (num1+num2+num3) != 5.0)
                throw new Exception ("Valor porcentajes POLCA POLCA debe ser 5%");

            
            cs.setFloat(++pos, Float.parseFloat((String)this.tfPP_PSimit.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfPP_PSevial.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfPP_PEquilibrio.getText()));

            // convenio polca 45%
            if (this.tfCP_PPolca.getText() == null)
                this.tfCP_PPolca.setText("0");
            if (this.tfCP_PFcm.getText() == null)
                this.tfCP_PFcm.setText("0");
            if (this.tfCP_PSevial.getText() == null)
                this.tfCP_PSevial.setText("0");
            if (this.tfCP_PEquilibrio.getText() == null)
                this.tfCP_PEquilibrio.setText("0");

            if (this.tfCP_PPolca.getText().toString().length() == 0)
                this.tfCP_PPolca.setText("0");
            if (this.tfCP_PFcm.getText().toString().length() == 0)
                this.tfCP_PFcm.setText("0");
            if (this.tfCP_PSevial.getText().toString().length() == 0)
                this.tfCP_PSevial.setText("0");
            if (this.tfCP_PEquilibrio.getText().toString().length() == 0)
                this.tfCP_PEquilibrio.setText("0");

            num1 = Float.parseFloat((String)tfCP_PPolca.getText());
            num2 = Float.parseFloat((String)tfCP_PFcm.getText());
            num3 = Float.parseFloat((String)tfCP_PSevial.getText());
            num4 = Float.parseFloat((String)tfCP_PEquilibrio.getText());

            double dif = Math.abs( 45.0 - num1 - num2 - num3 - num4 );
            
            if  ( dif > 0.001 )
                throw new Exception ("Valor porcentajes CONVENIO POLCA debe ser 45% " + dif) ;

            cs.setFloat(++pos, Float.parseFloat((String)this.tfCP_PPolca.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfCP_PFcm.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfCP_PSevial.getText()));
            cs.setFloat(++pos, Float.parseFloat((String)this.tfCP_PEquilibrio.getText()));

            if (this.tfCCLocalConS.getText() == null)
                this.tfCCLocalConS.setText("0000");
            if (this.tfCCLocalSimS.getText() == null)
                this.tfCCLocalSimS.setText("0000");
            if (this.tfCCLocalFonS.getText() == null)
                this.tfCCLocalFonS.setText("0000");
            if (this.tfCCLocalCobS.getText() == null)
                this.tfCCLocalCobS.setText("0000");
            if (this.tfCCLocalEquS.getText() == null)
                this.tfCCLocalEquS.setText("0000");

            if (this.tfCCLocalConS.getText().toString().length() == 0)
                this.tfCCLocalConS.setText("0000");
            if (this.tfCCLocalSimS.getText().toString().length() == 0)
                this.tfCCLocalSimS.setText("0000");
            if (this.tfCCLocalFonS.getText().toString().length() == 0)
                this.tfCCLocalFonS.setText("0000");
            if (this.tfCCLocalCobS.getText().toString().length() == 0)
                this.tfCCLocalCobS.setText("0000");
            if (this.tfCCLocalEquS.getText().toString().length() == 0)
                this.tfCCLocalEquS.setText("0000");

            int val = Integer.parseInt((String)this.tfCCLocalConS.getText());
            val = Integer.parseInt((String)this.tfCCLocalSimS.getText());
            val = Integer.parseInt((String)this.tfCCLocalFonS.getText());
            val = Integer.parseInt((String)this.tfCCLocalCobS.getText());
            val = Integer.parseInt((String)this.tfCCLocalEquS.getText());

            if (this.tfCCExtConS.getText() == null)
                this.tfCCExtConS.setText("0000");
            if (this.tfCCExtSimS.getText() == null)
                this.tfCCExtSimS.setText("0000");
            if (this.tfCCExtFonS.getText() == null)
                this.tfCCExtFonS.setText("0000");
            if (this.tfCCExtCobS.getText() == null)
                this.tfCCExtCobS.setText("0000");
            if (this.tfCCExtEquS.getText() == null)
                this.tfCCExtEquS.setText("0000");

            if (this.tfCCExtConS.getText().toString().length() == 0)
                this.tfCCExtConS.setText("0000");
            if (this.tfCCExtSimS.getText().toString().length() == 0)
                this.tfCCExtSimS.setText("0000");
            if (this.tfCCExtFonS.getText().toString().length() == 0)
                this.tfCCExtFonS.setText("0000");
            if (this.tfCCExtCobS.getText().toString().length() == 0)
                this.tfCCExtCobS.setText("0000");
            if (this.tfCCExtEquS.getText().toString().length() == 0)
                this.tfCCExtEquS.setText("0000");

            val = Integer.parseInt((String)this.tfCCExtConS.getText());
            val = Integer.parseInt((String)this.tfCCExtSimS.getText());
            val = Integer.parseInt((String)this.tfCCExtFonS.getText());
            val = Integer.parseInt((String)this.tfCCExtCobS.getText());
            val = Integer.parseInt((String)this.tfCCExtEquS.getText());

            if (this.tfCCLocalConP.getText() == null)
                this.tfCCLocalConP.setText("0000");
            if (this.tfCCLocalSimP.getText() == null)
                this.tfCCLocalSimP.setText("0000");
            if (this.tfCCLocalFonP.getText() == null)
                this.tfCCLocalFonP.setText("0000");
            if (this.tfCCLocalCobP.getText() == null)
                this.tfCCLocalCobP.setText("0000");
            if (this.tfCCLocalEquP.getText() == null)
                this.tfCCLocalEquP.setText("0000");
            
            if (this.tfCCLocalConP.getText().toString().length() == 0)
                this.tfCCLocalConP.setText("0000");
            if (this.tfCCLocalSimP.getText().toString().length() == 0)
                this.tfCCLocalSimP.setText("0000");
            if (this.tfCCLocalFonP.getText().toString().length() == 0)
                this.tfCCLocalFonP.setText("0000");
            if (this.tfCCLocalCobP.getText().toString().length() == 0)
                this.tfCCLocalCobP.setText("0000");
            if (this.tfCCLocalEquP.getText().toString().length() == 0)
                this.tfCCLocalEquP.setText("0000");

            val = Integer.parseInt((String)this.tfCCLocalConP.getText());
            val = Integer.parseInt((String)this.tfCCLocalSimP.getText());
            val = Integer.parseInt((String)this.tfCCLocalFonP.getText());
            val = Integer.parseInt((String)this.tfCCLocalCobP.getText());
            val = Integer.parseInt((String)this.tfCCLocalEquP.getText());

            if (this.tfCCExtConP.getText() == null)
                this.tfCCExtConP.setText("0000");
            if (this.tfCCExtSimP.getText() == null)
                this.tfCCExtSimP.setText("0000");
            if (this.tfCCExtFonP.getText() == null)
                this.tfCCExtFonP.setText("0000");
            if (this.tfCCExtCobP.getText() == null)
                this.tfCCExtCobP.setText("0000");
            if (this.tfCCExtEquP.getText() == null)
                this.tfCCExtEquP.setText("0000");

            if (this.tfCCExtConP.getText().toString().length() == 0)
                this.tfCCExtConP.setText("0000");
            if (this.tfCCExtSimP.getText().toString().length() == 0)
                this.tfCCExtSimP.setText("0000");
            if (this.tfCCExtFonP.getText().toString().length() == 0)
                this.tfCCExtFonP.setText("0000");
            if (this.tfCCExtCobP.getText().toString().length() == 0)
                this.tfCCExtCobP.setText("0000");
            if (this.tfCCExtEquP.getText().toString().length() == 0)
                this.tfCCExtEquP.setText("0000");

            
            val = Integer.parseInt((String)this.tfCCExtConP.getText());
            val = Integer.parseInt((String)this.tfCCExtSimP.getText());
            val = Integer.parseInt((String)this.tfCCExtFonP.getText());
            val = Integer.parseInt((String)this.tfCCExtCobP.getText());
            val = Integer.parseInt((String)this.tfCCExtEquP.getText());

            if (this.tfCCLocalSimPP.getText() == null)
                this.tfCCLocalSimPP.setText("0000");
            if (this.tfCCLocalSevPP.getText() == null)
                this.tfCCLocalSevPP.setText("0000");
            if (this.tfCCLocalEquPP.getText() == null)
                this.tfCCLocalEquPP.setText("0000");
           
            if (this.tfCCLocalSimPP.getText().toString().length() == 0)
                this.tfCCLocalSimPP.setText("0000");
            if (this.tfCCLocalSevPP.getText().toString().length() == 0)
                this.tfCCLocalSevPP.setText("0000");
            if (this.tfCCLocalEquPP.getText().toString().length() == 0)
                this.tfCCLocalEquPP.setText("0000");
            
            val = Integer.parseInt((String)this.tfCCLocalSimPP.getText());
            val = Integer.parseInt((String)this.tfCCLocalSevPP.getText());
            val = Integer.parseInt((String)this.tfCCLocalEquPP.getText());

            if (this.tfCCExtSimPP.getText() == null)
                this.tfCCExtSimPP.setText("0000");
            if (this.tfCCExtSevPP.getText() == null)
                this.tfCCExtSevPP.setText("0000");
            if (this.tfCCExtEquPP.getText() == null)
                this.tfCCExtEquPP.setText("0000");
           
            if (this.tfCCExtSimPP.getText().toString().length() == 0)
                this.tfCCExtSimPP.setText("0000");
            if (this.tfCCExtSevPP.getText().toString().length() == 0)
                this.tfCCExtSevPP.setText("0000");
            if (this.tfCCExtEquPP.getText().toString().length() == 0)
                this.tfCCExtEquPP.setText("0000");

            
            val = Integer.parseInt((String)this.tfCCExtSimPP.getText());
            val = Integer.parseInt((String)this.tfCCExtSevPP.getText());
            val = Integer.parseInt((String)this.tfCCExtEquPP.getText());

             if (this.tfCCLocalSimCP.getText() == null)
                this.tfCCLocalSimCP.setText("0000");
            if (this.tfCCLocalFcmCP.getText() == null)
                this.tfCCLocalFcmCP.setText("0000");
            if (this.tfCCLocalSevCP.getText() == null)
                this.tfCCLocalSevCP.setText("0000");
            if (this.tfCCLocalEquCP.getText() == null)
                this.tfCCLocalEquCP.setText("0000");

            if (this.tfCCLocalSimCP.getText().toString().length() == 0)
                this.tfCCLocalSimCP.setText("0000");
            if (this.tfCCLocalFcmCP.getText().toString().length() == 0)
                this.tfCCLocalFcmCP.setText("0000");
            if (this.tfCCLocalSevCP.getText().toString().length() == 0)
                this.tfCCLocalSevCP.setText("0000");
            if (this.tfCCLocalEquCP.getText().toString().length() == 0)
                this.tfCCLocalEquCP.setText("0000");

            val = Integer.parseInt((String)this.tfCCLocalSimCP.getText());
            val = Integer.parseInt((String)this.tfCCLocalFcmCP.getText());
            val = Integer.parseInt((String)this.tfCCLocalSevCP.getText());
            val = Integer.parseInt((String)this.tfCCLocalEquCP.getText());

            if (this.tfCCExtSimCP.getText() == null)
                this.tfCCExtSimCP.setText("0000");
            if (this.tfCCExtFcmCP.getText() == null)
                this.tfCCExtFcmCP.setText("0000");
            if (this.tfCCExtSevCP.getText() == null)
                this.tfCCExtSevCP.setText("0000");
            if (this.tfCCExtEquCP.getText() == null)
                this.tfCCExtEquCP.setText("0000");

            if (this.tfCCExtSimCP.getText().toString().length() == 0)
                this.tfCCExtSimCP.setText("0000");
            if (this.tfCCExtFcmCP.getText().toString().length() == 0)
                this.tfCCExtFcmCP.setText("0000");
            if (this.tfCCExtSevCP.getText().toString().length() == 0)
                this.tfCCExtSevCP.setText("0000");
            if (this.tfCCExtEquCP.getText().toString().length() == 0)
                this.tfCCExtEquCP.setText("0000");

            
            val = Integer.parseInt((String)this.tfCCExtSimCP.getText());
            val = Integer.parseInt((String)this.tfCCExtFcmCP.getText());
            val = Integer.parseInt((String)this.tfCCExtSevCP.getText());
            val = Integer.parseInt((String)this.tfCCExtEquCP.getText());

            // cc simit 10% local
            cs.setString(++pos, (String) this.tfCCLocalConS.getText());
            cs.setString(++pos, (String) this.tfCCLocalSimS.getText());
            cs.setString(++pos, (String) this.tfCCLocalFonS.getText());
            cs.setString(++pos, (String) this.tfCCLocalCobS.getText());
            cs.setString(++pos, (String) this.tfCCLocalEquS.getText());

            // cc simit 10% externo
            
            cs.setString(++pos, (String) this.tfCCExtConS.getText());
            cs.setString(++pos, (String) this.tfCCExtSimS.getText());
            cs.setString(++pos, (String) this.tfCCExtFonS.getText());
            cs.setString(++pos, (String) this.tfCCExtCobS.getText());
            cs.setString(++pos, (String) this.tfCCExtEquS.getText());

            // cc polca 5% local
            cs.setString(++pos, (String) this.tfCCLocalConP.getText());
            cs.setString(++pos, (String) this.tfCCLocalSimP.getText());
            cs.setString(++pos, (String) this.tfCCLocalFonP.getText());
            cs.setString(++pos, (String) this.tfCCLocalCobP.getText());
            cs.setString(++pos, (String) this.tfCCLocalEquP.getText());

            // cc polca 5% externo
            cs.setString(++pos, (String) this.tfCCExtConP.getText());
            cs.setString(++pos, (String) this.tfCCExtSimP.getText());
            cs.setString(++pos, (String) this.tfCCExtFonP.getText());
            cs.setString(++pos, (String) this.tfCCExtCobP.getText());
            cs.setString(++pos, (String) this.tfCCExtEquP.getText());

            // cc polca polca 5% local
            cs.setString(++pos, (String) this.tfCCLocalSimPP.getText());
            cs.setString(++pos, (String) this.tfCCLocalSevPP.getText());
            cs.setString(++pos, (String) this.tfCCLocalEquPP.getText());

            // cc polca polca 5% externo
            cs.setString(++pos, (String) this.tfCCExtSimPP.getText());
            cs.setString(++pos, (String) this.tfCCExtSevPP.getText());
            cs.setString(++pos, (String) this.tfCCExtEquPP.getText());

            // cc convenio polca 5% local
            cs.setString(++pos, (String) this.tfCCLocalSimCP.getText());
            cs.setString(++pos, (String) this.tfCCLocalFcmCP.getText());
            cs.setString(++pos, (String) this.tfCCLocalSevCP.getText());
            cs.setString(++pos, (String) this.tfCCLocalEquCP.getText());

            // cc convenio polca 5% externo
            cs.setString(++pos, (String) this.tfCCExtSimCP.getText());
            cs.setString(++pos, (String) this.tfCCExtFcmCP.getText());
            cs.setString(++pos, (String) this.tfCCExtSevCP.getText());
            cs.setString(++pos, (String) this.tfCCExtEquCP.getText());

            // fecha de prorroga
            if (this.cfecPro.getSelectedDate() != null) {
                java.sql.Date fec = new java.sql.Date(this.cfecPro.getSelectedDate().getTime());
                cs.setDate(++pos, fec);
            } else {
                cs.setDate(++pos, null);
            }

            cs.setString(++pos, getSessionBean1().getUser());

             
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(58);
            
            info(resultado);
            
            if ( !resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK))
                return "";
            
            this.concesionarioDataProvider1.refresh();
                        
            tfIdConces.setText("");
            tfNombre.setText("");
            tfNit.setText("");
            tfCorreo.setText("");
            
            tfS_PConces.setText("");
            tfCCLocalConS.setText("");
            tfCCExtConS.setText("");
            tfS_PSimit.setText("");
            tfCCLocalSimS.setText("");
            tfCCExtSimS.setText("");
            tfS_PFondoC.setText("");
            tfCCLocalFonS.setText("");
            tfCCExtFonS.setText("");
            tfS_PFondoS.setText("");
            tfCCLocalCobS.setText("");
            tfCCExtCobS.setText("");
            tfS_PEquilibrio.setText("");
            tfCCLocalEquS.setText("");
            tfCCExtEquS.setText("");
                        
            tfPM_PConces.setText("");
            tfCCLocalConP.setText("");
            tfCCExtConP.setText("");
            
            tfPM_PSimit.setText("");
            tfCCLocalSimP.setText("");
            tfCCExtSimP.setText("");
            
            tfPM_PFondoC.setText("");
            tfCCLocalFonP.setText("");
            tfCCExtFonP.setText("");
            
            tfPM_PFondoS.setText("");
            tfCCLocalCobP.setText("");
            tfCCExtCobP.setText("");
            
            tfPM_PEquilibrio.setText("");
            tfCCLocalEquP.setText("");
            tfCCExtEquP.setText("");
                    
            tfPP_PSimit.setText("");
            tfCCLocalSimPP.setText("");
            tfCCExtSimPP.setText("");
            
            tfPP_PSevial.setText("");
            tfCCLocalSevPP.setText("");
            tfCCExtSevPP.setText("");
            
            tfPP_PEquilibrio.setText("");
            tfCCLocalEquPP.setText("");
            tfCCExtEquPP.setText("");

            tfCP_PPolca.setText("");
            tfCCLocalSimCP.setText("");
            tfCCExtSimCP.setText("");
            
            tfCP_PFcm.setText("");
            tfCCLocalFcmCP.setText("");
            tfCCExtFcmCP.setText("");
            
            tfCP_PSevial.setText("");
            tfCCLocalSevCP.setText("");
            tfCCExtSevCP.setText("");
            
            tfCP_PEquilibrio.setText("");
            tfCCLocalEquCP.setText("");
            tfCCExtEquCP.setText("");
            
            cfecPro.setValue(null);
   
            btAdicionar.setText("Adicionar");
            tfIdConces.setDisabled(false);

            
        } catch ( NumberFormatException e ) {
            info("Valor debe ser numerico" );
        }
        
        catch (Exception e) {
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

    public String bconsultar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.ConcesionarioQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)this.stId.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
           
            // simit 10%
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            
            //polca municipio 5%
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            
            // polca polca 5%
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            
            // convenio polca 45%
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            cs.registerOutParameter(++pos, java.sql.Types.NUMERIC);
            
            // CC simit 10% local
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // CC simit 10% externo
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // CC polca 5% local
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // CC polca 5% externo
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // CC polca polca 5% local
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // CC polca polca 5% externo
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // CC convenio polca 5% local
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // CC convenio polca 5% externo
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // fecha prorroga
            cs.registerOutParameter(++pos, java.sql.Types.DATE);

            // resultado
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(58);
            
            this.tfIdConces.setText((String)this.stId.getText());
            this.tfNit.setText(cs.getString(3));
            this.tfNombre.setText(cs.getString(4));
            this.tfCorreo.setText(cs.getString(5));
            
            //simit 10%
            this.tfS_PConces.setText("" + cs.getDouble(6));
            this.tfS_PFondoC.setText("" + cs.getDouble(7));
            this.tfS_PFondoS.setText("" + cs.getDouble(8));
            this.tfS_PSimit.setText("" + cs.getDouble(9));
            this.tfS_PEquilibrio.setText("" + cs.getDouble(10));

            // polca municipo 5%
            this.tfPM_PConces.setText("" + cs.getDouble(11));
            this.tfPM_PFondoC.setText("" + cs.getDouble(12));
            this.tfPM_PFondoS.setText("" + cs.getDouble(13));
            this.tfPM_PSimit.setText("" + cs.getDouble(14));
            this.tfPM_PEquilibrio.setText("" + cs.getDouble(15));

            // polca polca 5%
            this.tfPP_PSimit.setText("" + cs.getDouble(16));
            this.tfPP_PSevial.setText("" + cs.getDouble(17));
            this.tfPP_PEquilibrio.setText("" + cs.getDouble(18));
            
            // convenio polca 45%
            this.tfCP_PPolca.setText("" + cs.getDouble(19));
            this.tfCP_PFcm.setText("" + cs.getDouble(20));
            this.tfCP_PSevial.setText("" + cs.getDouble(21));
            this.tfCP_PEquilibrio.setText("" + cs.getDouble(22));

            // cc Simit 10% local
            this.tfCCLocalConS.setText(cs.getString(23));
            this.tfCCLocalSimS.setText(cs.getString(24));
            this.tfCCLocalFonS.setText(cs.getString(25));
            this.tfCCLocalCobS.setText(cs.getString(26));
            this.tfCCLocalEquS.setText(cs.getString(27));
  
            // cc Simit 10% externo
            this.tfCCExtConS.setText(cs.getString(28));
            this.tfCCExtSimS.setText(cs.getString(29));
            this.tfCCExtFonS.setText(cs.getString(30));
            this.tfCCExtCobS.setText(cs.getString(31));
            this.tfCCExtEquS.setText(cs.getString(32));

            // cc Polca 5% local
            this.tfCCLocalConP.setText(cs.getString(33));
            this.tfCCLocalSimP.setText(cs.getString(34));
            this.tfCCLocalFonP.setText(cs.getString(35));
            this.tfCCLocalCobP.setText(cs.getString(36));
            this.tfCCLocalEquP.setText(cs.getString(37));

            // cc Polca 5% externo
            this.tfCCExtConP.setText(cs.getString(38));
            this.tfCCExtSimP.setText(cs.getString(39));
            this.tfCCExtFonP.setText(cs.getString(40));
            this.tfCCExtCobP.setText(cs.getString(41));
            this.tfCCExtEquP.setText(cs.getString(42));

            // cc Polca Polca 5% local
            this.tfCCLocalSimPP.setText(cs.getString(43));
            this.tfCCLocalSevPP.setText(cs.getString(44));
            this.tfCCLocalEquPP.setText(cs.getString(45));

            // cc Polca Polca 5% externo
            this.tfCCExtSimPP.setText(cs.getString(46));
            this.tfCCExtSevPP.setText(cs.getString(47));
            this.tfCCExtEquPP.setText(cs.getString(48));

            // cc Convenio Polca 5% local
            this.tfCCLocalSimCP.setText(cs.getString(49));
            this.tfCCLocalFcmCP.setText(cs.getString(50));
            this.tfCCLocalSevCP.setText(cs.getString(51));
            this.tfCCLocalEquCP.setText(cs.getString(52));

            // cc Convenio Polca 5% externo
            this.tfCCExtSimCP.setText(cs.getString(53));
            this.tfCCExtFcmCP.setText(cs.getString(54));
            this.tfCCExtSevCP.setText(cs.getString(55));
            this.tfCCExtEquCP.setText(cs.getString(56));

            // fecha prorroga
            if (cs.getDate(57) == null)
                this.cfecPro.setValue(null);
            else
                this.cfecPro.setValue(cs.getDate(57));

            btAdicionar.setText("Actualizar");
            tfIdConces.setDisabled(true);

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
            cs = con.prepareCall(Constants.ConcesionarioDel);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)this.stId.getText());
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            // resultado
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(3);
            info(resultado);

            if (!resultado.equals(Constants.MSG_DEL_OK))
                return "";
            
            this.tfIdConces.setText("");
            this.tfNit.setText("");
            this.tfNombre.setText("");
            this.tfCorreo.setText("");
            
            //simit 10%
            this.tfS_PConces.setText("");
            this.tfS_PFondoC.setText("");
            this.tfS_PFondoS.setText("");
            this.tfS_PSimit.setText("");
            this.tfS_PEquilibrio.setText("");

            // polca municipo 5%
            this.tfPM_PConces.setText("");
            this.tfPM_PFondoC.setText("");
            this.tfPM_PFondoS.setText("");
            this.tfPM_PSimit.setText("");
            this.tfPM_PEquilibrio.setText("");

            // polca polca 5%
            this.tfPP_PSimit.setText("");
            this.tfPP_PSevial.setText("");
            this.tfPP_PEquilibrio.setText("");
            
            // convenio polca 45%
            this.tfCP_PPolca.setText("");
            this.tfCP_PFcm.setText("");
            this.tfCP_PSevial.setText("");
            this.tfCP_PEquilibrio.setText("");

            // cc Simit 10% local
            this.tfCCLocalConS.setText("");
            this.tfCCLocalSimS.setText("");
            this.tfCCLocalFonS.setText("");
            this.tfCCLocalCobS.setText("");
            this.tfCCLocalEquS.setText("");
  
            // cc Simit 10% externo
            this.tfCCExtConS.setText("");
            this.tfCCExtSimS.setText("");
            this.tfCCExtFonS.setText("");
            this.tfCCExtCobS.setText("");
            this.tfCCExtEquS.setText("");

            // cc Polca 5% local
            this.tfCCLocalConP.setText("");
            this.tfCCLocalSimP.setText("");
            this.tfCCLocalFonP.setText("");
            this.tfCCLocalCobP.setText("");
            this.tfCCLocalEquP.setText("");

            // cc Polca 5% externo
            this.tfCCExtConP.setText("");
            this.tfCCExtSimP.setText("");
            this.tfCCExtFonP.setText("");
            this.tfCCExtCobP.setText("");
            this.tfCCExtEquP.setText("");

            
            // cc Polca Polca 5% local
            this.tfCCLocalSimPP.setText("");
            this.tfCCLocalSevPP.setText("");
            this.tfCCLocalEquPP.setText("");

            // cc Polca Polca 5% externo
            this.tfCCExtSimPP.setText("");
            this.tfCCExtSevPP.setText("");
            this.tfCCExtEquPP.setText("");

            // cc Convenio Polca 5% local
            this.tfCCLocalSimCP.setText("");
            this.tfCCLocalFcmCP.setText("");
            this.tfCCLocalSevCP.setText("");
            this.tfCCLocalEquCP.setText("");

            // cc Convenio Polca 5% externo
            this.tfCCExtSimCP.setText("");
            this.tfCCExtFcmCP.setText("");
            this.tfCCExtSevCP.setText("");
            this.tfCCExtEquCP.setText("");
            
            // fecha prorroga
            this.cfecPro.setValue(null);

            btAdicionar.setText("Adicionar");
            tfIdConces.setDisabled(false);
            
            this.concesionarioDataProvider1.refresh();

            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }

}

