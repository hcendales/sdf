/*
 * CtaConcesionario.java
 *
 * Created on November 12, 2007, 3:19 PM
 * Copyright cristina
 */
package wasimit;

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
import com.sun.rave.web.ui.component.TextArea;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import javax.faces.FacesException;
import javax.faces.event.ValueChangeEvent;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
public class CtaConcesionario extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        concesionarioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddTipoFcmDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        concesionarioDataProvider1.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet}"));
        ddTipoSevialDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoPolcaDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoAvvDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoLiqDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoLiq1DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoLiq2DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
        ddTipoLiq3DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("000", "000: Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "AHO: Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "CTE: Corriente")});
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
    
    private DropDown ddConcesionario = new DropDown();
    
    public DropDown getDdConcesionario() {
        return ddConcesionario;
    }
    
    public void setDdConcesionario(DropDown dd) {
        this.ddConcesionario = dd;
    }
    
    private CachedRowSetDataProvider concesionarioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getConcesionarioDataProvider() {
        return concesionarioDataProvider;
    }
    
    public void setConcesionarioDataProvider(CachedRowSetDataProvider crsdp) {
        this.concesionarioDataProvider = crsdp;
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
    
    private DropDown ddBancoLiq = new DropDown();
    
    public DropDown getDdBancoLiq() {
        return ddBancoLiq;
    }
    
    public void setDdBancoLiq(DropDown dd) {
        this.ddBancoLiq = dd;
    }
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private Label label3 = new Label();
    
    public Label getLabel3() {
        return label3;
    }
    
    public void setLabel3(Label l) {
        this.label3 = l;
    }
    
    private SingleSelectOptionsList ddTipoFcmDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoFcmDefaultOptions() {
        return ddTipoFcmDefaultOptions;
    }
    
    public void setDdTipoFcmDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoFcmDefaultOptions = ssol;
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
    
    private TextField tfCuentaLiq = new TextField();
    
    public TextField getTfCuentaLiq() {
        return tfCuentaLiq;
    }
    
    public void setTfCuentaLiq(TextField tf) {
        this.tfCuentaLiq = tf;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    private TextField tfNitLiq = new TextField();
    
    public TextField getTfNitLiq() {
        return tfNitLiq;
    }
    
    public void setTfNitLiq(TextField tf) {
        this.tfNitLiq = tf;
    }
    
    private DropDown ddBancoFon = new DropDown();
    
    public DropDown getDdBancoFon() {
        return ddBancoFon;
    }
    
    public void setDdBancoFon(DropDown dd) {
        this.ddBancoFon = dd;
    }
    
    private DropDown ddTipoFon = new DropDown();
    
    public DropDown getDdTipoFon() {
        return ddTipoFon;
    }
    
    public void setDdTipoFon(DropDown dd) {
        this.ddTipoFon = dd;
    }
    
    private TextField tfCuentaFon = new TextField();
    
    public TextField getTfCuentaFon() {
        return tfCuentaFon;
    }
    
    public void setTfCuentaFon(TextField tf) {
        this.tfCuentaFon = tf;
    }
    
    private TextField tfNitFon = new TextField();
    
    public TextField getTfNitFon() {
        return tfNitFon;
    }
    
    public void setTfNitFon(TextField tf) {
        this.tfNitFon = tf;
    }
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private DropDown ddBancoCon = new DropDown();
    
    public DropDown getDdBancoCon() {
        return ddBancoCon;
    }
    
    public void setDdBancoCon(DropDown dd) {
        this.ddBancoCon = dd;
    }
    
    private DropDown ddTipoCon = new DropDown();
    
    public DropDown getDdTipoCon() {
        return ddTipoCon;
    }
    
    public void setDdTipoCon(DropDown dd) {
        this.ddTipoCon = dd;
    }
    
    private TextField tfCuentaCon = new TextField();
    
    public TextField getTfCuentaCon() {
        return tfCuentaCon;
    }
    
    public void setTfCuentaCon(TextField tf) {
        this.tfCuentaCon = tf;
    }
    
    private TextField tfNitCon = new TextField();
    
    public TextField getTfNitCon() {
        return tfNitCon;
    }
    
    public void setTfNitCon(TextField tf) {
        this.tfNitCon = tf;
    }
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private DropDown ddBancoFcm = new DropDown();
    
    public DropDown getDdBancoFcm() {
        return ddBancoFcm;
    }
    
    public void setDdBancoFcm(DropDown dd) {
        this.ddBancoFcm = dd;
    }
    
    private DropDown ddTipoFcm = new DropDown();
    
    public DropDown getDdTipoFcm() {
        return ddTipoFcm;
    }
    
    public void setDdTipoFcm(DropDown dd) {
        this.ddTipoFcm = dd;
    }
    
    private TextField tfCuentaFcm = new TextField();
    
    public TextField getTfCuentaFcm() {
        return tfCuentaFcm;
    }
    
    public void setTfCuentaFcm(TextField tf) {
        this.tfCuentaFcm = tf;
    }
    
    private TextField tfNitFcm = new TextField();
    
    public TextField getTfNitFcm() {
        return tfNitFcm;
    }
    
    public void setTfNitFcm(TextField tf) {
        this.tfNitFcm = tf;
    }
    
    private Label label9 = new Label();
    
    public Label getLabel9() {
        return label9;
    }
    
    public void setLabel9(Label l) {
        this.label9 = l;
    }
    
    private Button btActualizar = new Button();
    
    public Button getBtActualizar() {
        return btActualizar;
    }
    
    public void setBtActualizar(Button b) {
        this.btActualizar = b;
    }
    
    private CachedRowSetDataProvider concesionarioDataProvider1 = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getConcesionarioDataProvider1() {
        return concesionarioDataProvider1;
    }
    
    public void setConcesionarioDataProvider1(CachedRowSetDataProvider crsdp) {
        this.concesionarioDataProvider1 = crsdp;
    }
    
    private TextField tfCuentaSevial = new TextField();
    
    public TextField getTfCuentaSevial() {
        return tfCuentaSevial;
    }
    
    public void setTfCuentaSevial(TextField tf) {
        this.tfCuentaSevial = tf;
    }
    
    private Label label10 = new Label();
    
    public Label getLabel10() {
        return label10;
    }
    
    public void setLabel10(Label l) {
        this.label10 = l;
    }
    
    private TextField tfNitSevial = new TextField();
    
    public TextField getTfNitSevial() {
        return tfNitSevial;
    }
    
    public void setTfNitSevial(TextField tf) {
        this.tfNitSevial = tf;
    }
    
    private DropDown ddTipoSevial = new DropDown();
    
    public DropDown getDdTipoSevial() {
        return ddTipoSevial;
    }
    
    public void setDdTipoSevial(DropDown dd) {
        this.ddTipoSevial = dd;
    }
    
    private DropDown ddBancoSevial = new DropDown();
    
    public DropDown getDdBancoSevial() {
        return ddBancoSevial;
    }
    
    public void setDdBancoSevial(DropDown dd) {
        this.ddBancoSevial = dd;
    }
    
    private SingleSelectOptionsList ddTipoSevialDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoSevialDefaultOptions() {
        return ddTipoSevialDefaultOptions;
    }
    
    public void setDdTipoSevialDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoSevialDefaultOptions = ssol;
    }
    
    private TextField tfNitPolca = new TextField();
    
    public TextField getTfNitPolca() {
        return tfNitPolca;
    }
    
    public void setTfNitPolca(TextField tf) {
        this.tfNitPolca = tf;
    }
    
    private Label label11 = new Label();
    
    public Label getLabel11() {
        return label11;
    }
    
    public void setLabel11(Label l) {
        this.label11 = l;
    }
    
    private DropDown ddBancoPolca = new DropDown();
    
    public DropDown getDdBancoPolca() {
        return ddBancoPolca;
    }
    
    public void setDdBancoPolca(DropDown dd) {
        this.ddBancoPolca = dd;
    }
    
    private DropDown ddTipoPolca = new DropDown();
    
    public DropDown getDdTipoPolca() {
        return ddTipoPolca;
    }
    
    public void setDdTipoPolca(DropDown dd) {
        this.ddTipoPolca = dd;
    }
    
    private TextField tfCuentaPolca = new TextField();
    
    public TextField getTfCuentaPolca() {
        return tfCuentaPolca;
    }
    
    public void setTfCuentaPolca(TextField tf) {
        this.tfCuentaPolca = tf;
    }
    
    private SingleSelectOptionsList ddTipoPolcaDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoPolcaDefaultOptions() {
        return ddTipoPolcaDefaultOptions;
    }
    
    public void setDdTipoPolcaDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoPolcaDefaultOptions = ssol;
    }
    
    private Label label12 = new Label();
    
    public Label getLabel12() {
        return label12;
    }
    
    public void setLabel12(Label l) {
        this.label12 = l;
    }
    
    private DropDown ddBancoAvv = new DropDown();
    
    public DropDown getDdBancoAvv() {
        return ddBancoAvv;
    }
    
    public void setDdBancoAvv(DropDown dd) {
        this.ddBancoAvv = dd;
    }
    
    private DropDown ddTipoAvv = new DropDown();
    
    public DropDown getDdTipoAvv() {
        return ddTipoAvv;
    }
    
    public void setDdTipoAvv(DropDown dd) {
        this.ddTipoAvv = dd;
    }
    
    private SingleSelectOptionsList ddTipoAvvDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoAvvDefaultOptions() {
        return ddTipoAvvDefaultOptions;
    }
    
    public void setDdTipoAvvDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoAvvDefaultOptions = ssol;
    }
    
    private TextField tfCuentaAvv = new TextField();
    
    public TextField getTfCuentaAvv() {
        return tfCuentaAvv;
    }
    
    public void setTfCuentaAvv(TextField tf) {
        this.tfCuentaAvv = tf;
    }
    
    private TextField tfNitAvv = new TextField();
    
    public TextField getTfNitAvv() {
        return tfNitAvv;
    }
    
    public void setTfNitAvv(TextField tf) {
        this.tfNitAvv = tf;
    }
    
    private DropDown ddBancoRec = new DropDown();
    
    public DropDown getDdBancoRec() {
        return ddBancoRec;
    }
    
    public void setDdBancoRec(DropDown dd) {
        this.ddBancoRec = dd;
    }
    
    private Label label13 = new Label();
    
    public Label getLabel13() {
        return label13;
    }
    
    public void setLabel13(Label l) {
        this.label13 = l;
    }
    
    private DropDown ddTipoLiq = new DropDown();
    
    public DropDown getDdTipoLiq() {
        return ddTipoLiq;
    }
    
    public void setDdTipoLiq(DropDown dd) {
        this.ddTipoLiq = dd;
    }
    
    private SingleSelectOptionsList ddTipoLiqDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoLiqDefaultOptions() {
        return ddTipoLiqDefaultOptions;
    }
    
    public void setDdTipoLiqDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoLiqDefaultOptions = ssol;
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

    private Label label16 = new Label();

    public Label getLabel16() {
        return label16;
    }

    public void setLabel16(Label l) {
        this.label16 = l;
    }

    private DropDown ddBancoLiq1 = new DropDown();

    public DropDown getDdBancoLiq1() {
        return ddBancoLiq1;
    }

    public void setDdBancoLiq1(DropDown dd) {
        this.ddBancoLiq1 = dd;
    }

    private DropDown ddBancoLiq2 = new DropDown();

    public DropDown getDdBancoLiq2() {
        return ddBancoLiq2;
    }

    public void setDdBancoLiq2(DropDown dd) {
        this.ddBancoLiq2 = dd;
    }

    private DropDown ddBancoLiq3 = new DropDown();

    public DropDown getDdBancoLiq3() {
        return ddBancoLiq3;
    }

    public void setDdBancoLiq3(DropDown dd) {
        this.ddBancoLiq3 = dd;
    }

    private DropDown ddTipoLiq1 = new DropDown();

    public DropDown getDdTipoLiq1() {
        return ddTipoLiq1;
    }

    public void setDdTipoLiq1(DropDown dd) {
        this.ddTipoLiq1 = dd;
    }

    private SingleSelectOptionsList ddTipoLiq1DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoLiq1DefaultOptions() {
        return ddTipoLiq1DefaultOptions;
    }

    public void setDdTipoLiq1DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoLiq1DefaultOptions = ssol;
    }

    private DropDown ddTipoLiq2 = new DropDown();

    public DropDown getDdTipoLiq2() {
        return ddTipoLiq2;
    }

    public void setDdTipoLiq2(DropDown dd) {
        this.ddTipoLiq2 = dd;
    }

    private SingleSelectOptionsList ddTipoLiq2DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoLiq2DefaultOptions() {
        return ddTipoLiq2DefaultOptions;
    }

    public void setDdTipoLiq2DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoLiq2DefaultOptions = ssol;
    }

    private DropDown ddTipoLiq3 = new DropDown();

    public DropDown getDdTipoLiq3() {
        return ddTipoLiq3;
    }

    public void setDdTipoLiq3(DropDown dd) {
        this.ddTipoLiq3 = dd;
    }

    private SingleSelectOptionsList ddTipoLiq3DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoLiq3DefaultOptions() {
        return ddTipoLiq3DefaultOptions;
    }

    public void setDdTipoLiq3DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoLiq3DefaultOptions = ssol;
    }

    private TextField tfCuentaLiq1 = new TextField();

    public TextField getTfCuentaLiq1() {
        return tfCuentaLiq1;
    }

    public void setTfCuentaLiq1(TextField tf) {
        this.tfCuentaLiq1 = tf;
    }

    private TextField tfCuentaLiq2 = new TextField();

    public TextField getTfCuentaLiq2() {
        return tfCuentaLiq2;
    }

    public void setTfCuentaLiq2(TextField tf) {
        this.tfCuentaLiq2 = tf;
    }

    private TextField tfCuentaLiq3 = new TextField();

    public TextField getTfCuentaLiq3() {
        return tfCuentaLiq3;
    }

    public void setTfCuentaLiq3(TextField tf) {
        this.tfCuentaLiq3 = tf;
    }

    private TextField tfNitLiq1 = new TextField();

    public TextField getTfNitLiq1() {
        return tfNitLiq1;
    }

    public void setTfNitLiq1(TextField tf) {
        this.tfNitLiq1 = tf;
    }

    private TextField tfNitLiq2 = new TextField();

    public TextField getTfNitLiq2() {
        return tfNitLiq2;
    }

    public void setTfNitLiq2(TextField tf) {
        this.tfNitLiq2 = tf;
    }

    private TextField tfNitLiq3 = new TextField();

    public TextField getTfNitLiq3() {
        return tfNitLiq3;
    }

    public void setTfNitLiq3(TextField tf) {
        this.tfNitLiq3 = tf;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public CtaConcesionario() {
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
            log("CtaConcesionario Initialization Failure", e);
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
        concesionarioDataProvider.close();
        bancoDataProvider.close();
        concesionarioDataProvider1.close();
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
    
    /**
     * <p>Return a reference to the scoped data bean.</p>
     */
    protected RequestBean1 getRequestBean1() {
        return (RequestBean1)getBean("RequestBean1");
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
    
    public String btActualizar_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {
            
            if (ddConcesionario.getValue() == null)
                throw new Exception("Seleccione Concesionario");
            if (ddConcesionario.getValue().toString().equals("00"))
                throw new Exception("Seleccione Concesionario");
            
            if (ddBancoRec.getValue() == null)
                throw new Exception("Seleccione Banco Recaudador");
            if (ddBancoRec.getValue().toString().equals("00"))
                throw new Exception("Seleccione Banco Recaudador");
            
            
            //Liquidacion Otros Bancos
            if(ddBancoLiq.getValue() == null )
                throw new Exception("Seleccione Banco Liquidacion Externo Simit");
            if(ddBancoLiq.getValue().toString().equals("00") )
                throw new Exception("Seleccione Banco Liquidacion Externo Simit");

            if(ddBancoLiq1.getValue() == null )
                throw new Exception("Seleccione Banco Liquidacion Externo Polca");
            if(ddBancoLiq1.getValue().toString().equals("00") )
                throw new Exception("Seleccione Banco Liquidacion Externo Polca");

            if(ddBancoLiq2.getValue() == null )
                throw new Exception("Seleccione Banco Liquidacion Local Simit");
            if(ddBancoLiq2.getValue().toString().equals("00") )
                throw new Exception("Seleccione Banco Liquidacion Local Simit");

            if(ddBancoLiq3.getValue() == null )
                throw new Exception("Seleccione Banco Liquidacion Local Polca");
            if(ddBancoLiq3.getValue().toString().equals("00") )
                throw new Exception("Seleccione Banco Liquidacion Local Polca");

            if(ddTipoLiq.getValue() == null )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Externo Simit");
            if(ddTipoLiq.getValue().toString().equals("000") )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Externo Simit");
            
            if(ddTipoLiq1.getValue() == null )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Externo Polca");
            if(ddTipoLiq1.getValue().toString().equals("000") )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Externo Polca");

            if(ddTipoLiq2.getValue() == null )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Local Simit");
            if(ddTipoLiq2.getValue().toString().equals("000") )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Local Simit");

            if(ddTipoLiq3.getValue() == null )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Local Polca");
            if(ddTipoLiq3.getValue().toString().equals("000") )
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion Local Polca");

            if (tfCuentaLiq.getText() == null)
                throw new Exception("Ingrese Cuenta Liquidacion Externo Simit");
            if ( ((String)tfCuentaLiq.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta Liquidacion Externo Simit");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaLiq.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta Liquidacion Externo Simit Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Liquidacion Externo Simit debe ser numerica");
            }

            if (tfCuentaLiq1.getText() == null)
                throw new Exception("Ingrese Cuenta Liquidacion Externo Polca");
            if ( ((String)tfCuentaLiq1.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta Liquidacion Externo Polca");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaLiq1.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta Liquidacion Externo Polca Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Liquidacion Externo Polca debe ser numerica");
            }

            if (tfCuentaLiq2.getText() == null)
                throw new Exception("Ingrese Cuenta Liquidacion Local Simit");
            if ( ((String)tfCuentaLiq2.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta Liquidacion Local Simit");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaLiq2.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta Liquidacion Local Simit Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Liquidacion Local Simit debe ser numerica");
            }


            if (tfCuentaLiq3.getText() == null)
                throw new Exception("Ingrese Cuenta Liquidacion Local Polca");
            if ( ((String)tfCuentaLiq3.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta Liquidacion Local Polca");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaLiq3.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta Liquidacion Local Polca Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Liquidacion Local Polca debe ser numerica");
            }

            if (tfNitLiq.getText() == null)
                throw new Exception("Ingrese Nit Liquidacion Externo Simit");
            if ( ((String)tfNitLiq.getText()).length() == 0)
                throw new Exception("Ingrese Nit Liquidacion Externo Simit");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitLiq.getText());
                if (vlr < 1)
                    throw new Exception("Nit Liquidacion Externo Simit Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Nit Liquidacion Externo Simit debe ser numerica");
            }
           
            float vlr_NitLiq = Float.parseFloat((String)this.tfNitLiq.getText());
            if (vlr_NitLiq < 1000000000)
                throw new Exception("Nit Liquidacion Externo Simit Incompleto");
            
            
            if (tfNitLiq1.getText() == null)
                throw new Exception("Ingrese Nit Liquidacion Externo Polca");
            if ( ((String)tfNitLiq1.getText()).length() == 0)
                throw new Exception("Ingrese Nit Liquidacion Externo Polca");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitLiq1.getText());
                if (vlr < 1)
                    throw new Exception("Nit Liquidacion Externo Polca Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Nit Liquidacion Externo Polca debe ser numerica");
            }
           
            vlr_NitLiq = Float.parseFloat((String)this.tfNitLiq1.getText());
            if (vlr_NitLiq < 1000000000)
                throw new Exception("Nit Liquidacion Externo Polca Incompleto");
            
            if (tfNitLiq2.getText() == null)
                throw new Exception("Ingrese Nit Liquidacion Local Simit");
            if ( ((String)tfNitLiq2.getText()).length() == 0)
                throw new Exception("Ingrese Nit Liquidacion Local Simit");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitLiq2.getText());
                if (vlr < 1)
                    throw new Exception("Nit Liquidacion Local Simit Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Nit Liquidacion Local Simit debe ser numerica");
            }
           
            vlr_NitLiq = Float.parseFloat((String)this.tfNitLiq2.getText());
            if (vlr_NitLiq < 1000000000)
                throw new Exception("Nit Liquidacion Local Simit Incompleto");
            

            if (tfNitLiq3.getText() == null)
                throw new Exception("Ingrese Nit Liquidacion Polca Simit");
            if ( ((String)tfNitLiq3.getText()).length() == 0)
                throw new Exception("Ingrese Nit Liquidacion Polca Simit");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitLiq3.getText());
                if (vlr < 1)
                    throw new Exception("Nit Liquidacion Local Polca Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Nit Liquidacion Local Polca debe ser numerica");
            }
           
            vlr_NitLiq = Float.parseFloat((String)this.tfNitLiq3.getText());
            if (vlr_NitLiq < 1000000000)
                throw new Exception("Nit Liquidacion Local Polca Incompleto");
                        
//Fondo Cobertura
            if(ddBancoFon.getValue() == null )
                throw new Exception("Seleccione Banco Fondo Cobertura");
            if(ddBancoFon.getValue().toString().equals("00") )
                throw new Exception("Seleccione Banco Fondo Cobertura");
            
            if(ddTipoFon.getValue() == null )
                throw new Exception("Seleccione Tipo de Cuenta Fondo Cobertura");
            if(ddTipoFon.getValue().toString().equals("000") )
                throw new Exception("Seleccione Tipo de Cuenta Fondo Cobertura");
            
            if (tfCuentaFon.getText() == null)
                throw new Exception("Ingrese Cuenta Fondo Cobertura");
            if ( ((String)tfCuentaFon.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta Fondo Cobertura");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaFon.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta Fondo Cobertura Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Fondo Cobertura debe ser numerica");
            }
            
            if (tfNitFon.getText() == null)
                throw new Exception("Ingrese Nit Fondo Cobertura");
            if ( ((String)tfNitFon.getText()).length() == 0)
                throw new Exception("Ingrese Nit Fondo Cobertura");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitFon.getText());
                if (vlr < 1)
                    throw new Exception("Nit Fondo Cobertura Incorrecto");
            } catch (NumberFormatException Err) {
                throw new Exception("Nit Fondo Cobertura debe ser numerico");
            }
            
            float vlr_NitFon = Float.parseFloat((String)this.tfNitFon.getText());
            if (vlr_NitFon < 1000000000)
                throw new Exception("Nit Fondo Cobertura Incompleto");
            
            //Contravencional
            if( ddBancoCon.getValue() == null )
                throw new Exception("Seleccione Banco Contravencional");
            if( ddBancoCon.getValue().toString().equals("00") )
                throw new Exception("Seleccione Banco Contravencional");
            
            if(ddTipoCon.getValue() == null )
                throw new Exception("Seleccione Tipo de Cuenta Contravencional");
            if(ddTipoCon.getValue().toString().equals("000") )
                throw new Exception("Seleccione Tipo de Cuenta Contravencional");
            
            if (tfCuentaCon.getText() == null)
                throw new Exception("Ingrese Contravencional");
            if ( ((String)tfCuentaCon.getText()).length() == 0)
                throw new Exception("Ingrese Contravencional");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaCon.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta Contravencional Incorrecta");
            } catch (NumberFormatException Err) {
                throw new Exception("Cuenta Contravencional debe ser numerica");
            }
            
            if (tfNitCon.getText() == null)
                throw new Exception("Ingrese Nit Contravencional");
            if ( ((String)tfNitCon.getText()).length() == 0)
                throw new Exception("Ingrese Nit Contravencional");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitCon.getText());
                if (vlr < 1)
                    throw new Exception("Nit Contravencional Incorrecto");
            } catch (NumberFormatException Err) {
                throw new Exception("Nit Contravencional debe ser numerico");
            }
            
            float vlr_NitCon = Float.parseFloat((String)this.tfNitCon.getText());
            if (vlr_NitCon < 1000000000)
                throw new Exception("Nit Contravencional Incompleto");
                          
            //Contravencional FCM
            if (this.ddBancoFcm.getValue() == null)
                throw new Exception("Seleccione Banco Contravencional FCM ");
            if (this.ddBancoFcm.getValue().toString().equals("00"))
                throw new Exception("Seleccione Banco Contravencional FCM ");

            if (this.ddTipoFcm.getValue() == null)
                throw new Exception("Seleccione Tipo de Cuenta Contravencional FCM");
            if (this.ddTipoFcm.getValue().toString().equals("000"))
                throw new Exception("Seleccione Tipo de Cuenta Contravencional FCM");
            
            if (tfCuentaFcm.getText() == null)
                throw new Exception("Ingrese Cuenta Contravencional FCM");
            if ( ((String)tfCuentaFcm.getText()).length() == 0)
                throw new Exception("ingrese Cuenta Contravencional FCM");
                        
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaFcm.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta FCM Incorrecta");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta FCM debe ser numerica");
            }

            if (tfNitFcm.getText() == null)
                throw new Exception("Ingrese Nit Contravencional FCM");
            if ( ((String)tfNitFcm.getText()).length() == 0)
                throw new Exception("ingrese Nit Contravencional FCM");
                        
            try {
                float vlr = Float.parseFloat((String)this.tfNitFcm.getText());
                if (vlr < 1)
                    throw new Exception("Nit Contravencional FCM Incorrecto");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Nit Contravencional FCM debe ser numerico");
            }
            
            float vlr_NitFcm = Float.parseFloat((String)this.tfNitFcm.getText());
            if (vlr_NitFcm < 1000000000)
                throw new Exception("Nit Contravencional FCM Incompleto");
             
            //SEVIAL
            if (this.ddBancoSevial.getValue() == null)
                throw new Exception("Seleccione Banco SEVIAL");
            if (this.ddBancoSevial.getValue().toString().equals("00"))
                throw new Exception("Seleccione Banco SEVIAL");
            
            if (this.ddTipoSevial.getValue() == null)
                throw new Exception("Seleccione Tipo de Cuenta SEVIAL");
            if (this.ddTipoSevial.getValue().toString().equals("000"))
                throw new Exception("Seleccione Tipo de Cuenta SEVIAL");
            
            if (tfCuentaSevial.getText() == null)
                throw new Exception("Ingrese Cuenta SEVIAL");
            if ( ((String)tfCuentaSevial.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta SEVIAL");
            
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaSevial.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta SEVIAL Incorrecta");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta SEVIAL debe ser numerica");
            }
            
            if (tfNitSevial.getText() == null)
                throw new Exception("Ingrese Nit SEVIAL");
            if ( ((String)tfNitSevial.getText()).length() == 0)
                throw new Exception("Ingrese Nit SEVIAL");
            
            try {
                float vlr = Float.parseFloat((String)this.tfNitSevial.getText());
                if (vlr < 1)
                    throw new Exception("Nit SEVIAL Incorrecto");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Nit SEVIAL debe ser numerico");
            }
            float vlr_NitSevial = Float.parseFloat((String)this.tfNitSevial.getText());
            if (vlr_NitSevial < 1000000000)
                throw new Exception("Nit SEVIAL Incompleto");
            
            
            //POLCA
            if (this.ddBancoPolca.getValue() == null)
                throw new Exception("Seleccione Banco POLCA");
            if (this.ddBancoPolca.getValue().toString().equals("00"))
                throw new Exception("Seleccione Banco POLCA");

            if (this.ddTipoPolca.getValue() == null)
                throw new Exception("Seleccione Tipo de Cuenta POLCA");
            if (this.ddTipoPolca.getValue().toString().equals("000"))
                throw new Exception("Seleccione Tipo de Cuenta POLCA");

            if (tfCuentaPolca.getText() == null)
                throw new Exception("Ingrese Cuenta POLCA");
            if ( ((String)tfCuentaPolca.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta POLCA");
            try {
                float vlr = Float.parseFloat((String)this.tfCuentaPolca.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta POLCA Incorrecta");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta POLCA debe ser numerica");
            }
            
            if (tfNitPolca.getText() == null)
                throw new Exception("Ingrese Nit POLCA");
            if ( ((String)tfNitPolca.getText()).length() == 0)
                throw new Exception("Ingrese Nit POLCA");
            try {
                float vlr = Float.parseFloat((String)this.tfNitPolca.getText());
                if (vlr < 1)
                    throw new Exception("Nit POLCA Incorrecta");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Nit POLCA debe ser numerica");
            }
            
            float vlr_NitPolca = Float.parseFloat((String)this.tfNitPolca.getText());
            if (vlr_NitPolca < 1000000000)
                throw new Exception("Nit POLCA Incompleto");
           
            //Liquidacion Avvillas Local
            if (this.ddBancoAvv.getValue() == null)
                throw new Exception("Seleccione Banco Liquidacion AvVillas Local");
            if (this.ddBancoAvv.getValue().toString().equals("00"))
                throw new Exception("Seleccione Banco Liquidacion AvVillas Local");

            if (this.ddTipoAvv.getValue() == null)
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion AvVillas Local");
            if (this.ddTipoAvv.getValue().toString().equals("000"))
                throw new Exception("Seleccione Tipo de Cuenta Liquidacion AvVillas Local");

            if (tfCuentaAvv.getText() == null)
                throw new Exception("Ingrese Cuenta Liquidacion AvVillas Local");
            if ( ((String)tfCuentaAvv.getText()).length() == 0)
                throw new Exception("Ingrese Cuenta Liquidacion AvVillas Local");
           
            try {
            float vlr = Float.parseFloat((String)this.tfCuentaAvv.getText());
                if (vlr < 1)
                    throw new Exception("Cuenta Liquidacion AvVillas Local Incorrecta");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Cuenta Liquidacion AvVillas Local debe ser numerica");
            }
            
            if (tfNitAvv.getText() == null)
                throw new Exception("Ingrese Nit Liquidacion AvVillas Local");
            if ( ((String)tfNitAvv.getText()).length() == 0)
                throw new Exception("Ingrese Nit Liquidacion AvVillas Local");
           
            try {
            float vlr = Float.parseFloat((String)this.tfNitAvv.getText());
                if (vlr < 1)
                    throw new Exception("Nit Liquidacion AvVillas Local Incorrecto");
            }
            catch (NumberFormatException Err)
            {
                throw new Exception("Nit Liquidacion AvVillas Local debe ser numerico");
            }

            float vlr = Float.parseFloat((String)this.tfNitAvv.getText());
            if (vlr < 1000000000)
                throw new Exception("Nit Liquidacion Avvillas Local Incompleto");


            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.CtaDisConAdd);
                        
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String) this.ddConcesionario.getValue());
            cs.setString(++pos, (String) this.ddBancoRec.getValue());
            
            cs.setString(++pos, (String) this.ddBancoLiq.getValue());
            cs.setString(++pos, (String) this.ddTipoLiq.getValue());
            cs.setString(++pos, (String) this.tfCuentaLiq.getText());
            cs.setString(++pos, (String) this.tfNitLiq.getText());

            cs.setString(++pos, (String) this.ddBancoLiq1.getValue());
            cs.setString(++pos, (String) this.ddTipoLiq1.getValue());
            cs.setString(++pos, (String) this.tfCuentaLiq1.getText());
            cs.setString(++pos, (String) this.tfNitLiq1.getText());

            cs.setString(++pos, (String) this.ddBancoLiq2.getValue());
            cs.setString(++pos, (String) this.ddTipoLiq2.getValue());
            cs.setString(++pos, (String) this.tfCuentaLiq2.getText());
            cs.setString(++pos, (String) this.tfNitLiq2.getText());

            cs.setString(++pos, (String) this.ddBancoLiq3.getValue());
            cs.setString(++pos, (String) this.ddTipoLiq3.getValue());
            cs.setString(++pos, (String) this.tfCuentaLiq3.getText());
            cs.setString(++pos, (String) this.tfNitLiq3.getText());

            cs.setString(++pos, (String) this.ddBancoFon.getValue());
            cs.setString(++pos, (String) this.ddTipoFon.getValue());
            cs.setString(++pos, (String) this.tfCuentaFon.getText());
            cs.setString(++pos, (String) this.tfNitFon.getText());
            
            cs.setString(++pos, (String) this.ddBancoCon.getValue());
            cs.setString(++pos, (String) this.ddTipoCon.getValue());
            cs.setString(++pos, (String) this.tfCuentaCon.getText());
            cs.setString(++pos, (String) this.tfNitCon.getText());
            
            cs.setString(++pos, (String) this.ddBancoFcm.getValue());
            cs.setString(++pos, (String) this.ddTipoFcm.getValue());
            cs.setString(++pos, (String) this.tfCuentaFcm.getText());
            cs.setString(++pos, (String) this.tfNitFcm.getText());
            
            cs.setString(++pos, (String) this.ddBancoSevial.getValue());
            cs.setString(++pos, (String) this.ddTipoSevial.getValue());
            cs.setString(++pos, (String) this.tfCuentaSevial.getText());
            cs.setString(++pos, (String) this.tfNitSevial.getText());
            
            cs.setString(++pos, (String) this.ddBancoPolca.getValue());
            cs.setString(++pos, (String) this.ddTipoPolca.getValue());
            cs.setString(++pos, (String) this.tfCuentaPolca.getText());
            cs.setString(++pos, (String) this.tfNitPolca.getText());
            
            cs.setString(++pos, (String) this.ddBancoAvv.getValue());
            cs.setString(++pos, (String) this.ddTipoAvv.getValue());
            cs.setString(++pos, (String) this.tfCuentaAvv.getText());
            cs.setString(++pos, (String) this.tfNitAvv.getText());

            cs.setString(++pos, getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(pos);
            
            info(resultado);

            if (!resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK))
                return "";
            
            this.ddConcesionario.setValue("00");
            this.ddBancoRec.setValue("00");
            
            limpiar();
            
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }
    
    public String Consultar() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        try {

            if (this.ddConcesionario.getValue().toString().equals("00"))
                throw new Exception("Seleccione Concesionario - consultar");
                
            if (this.ddBancoRec.getValue().toString().equals("00"))
                throw new Exception("Seleccione Banco Recaudador");

            con = getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.CtaDisConQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, (String)this.ddConcesionario.getValue());
            cs.setString(++pos, (String)this.ddBancoRec.getValue());
            
            cs.setString(++pos, getSessionBean1().getUser());
            
            // Liquidacion
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Fondo Cobertura
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Contravencional
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Contravencional Fcm
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // sevial
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // polca
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            // avvillas
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);

            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString(44);
            
            // liquidacion
            this.ddBancoLiq.setValue(cs.getString(4));
            this.ddTipoLiq.setValue(cs.getString(5));
            this.tfCuentaLiq.setText(cs.getString(6));
            this.tfNitLiq.setText(cs.getString(7));
            
            this.ddBancoLiq1.setValue(cs.getString(8));
            this.ddTipoLiq1.setValue(cs.getString(9));
            this.tfCuentaLiq1.setText(cs.getString(10));
            this.tfNitLiq1.setText(cs.getString(11));
            
            this.ddBancoLiq2.setValue(cs.getString(12));
            this.ddTipoLiq2.setValue(cs.getString(13));
            this.tfCuentaLiq2.setText(cs.getString(14));
            this.tfNitLiq2.setText(cs.getString(15));
            
            this.ddBancoLiq3.setValue(cs.getString(16));
            this.ddTipoLiq3.setValue(cs.getString(17));
            this.tfCuentaLiq3.setText(cs.getString(18));
            this.tfNitLiq3.setText(cs.getString(19));
            
            // fondo cobertura
            this.ddBancoFon.setValue(cs.getString(20));
            this.ddTipoFon.setValue(cs.getString(21));
            this.tfCuentaFon.setText(cs.getString(22));
            this.tfNitFon.setText(cs.getString(23));
            
            // contravencional
            this.ddBancoCon.setValue(cs.getString(24));
            this.ddTipoCon.setValue(cs.getString(25));
            this.tfCuentaCon.setText(cs.getString(26));
            this.tfNitCon.setText(cs.getString(27));
            
            
            // contravencional fcm
            this.ddBancoFcm.setValue(cs.getString(28));
            this.ddTipoFcm.setValue(cs.getString(29));
            this.tfCuentaFcm.setText(cs.getString(30));
            this.tfNitFcm.setText(cs.getString(31));
            
            // sevial
            this.ddBancoSevial.setValue(cs.getString(32));
            this.ddTipoSevial.setValue(cs.getString(33));
            this.tfCuentaSevial.setText(cs.getString(34));
            this.tfNitSevial.setText(cs.getString(35));
            
            // polca
            this.ddBancoPolca.setValue(cs.getString(36));
            this.ddTipoPolca.setValue(cs.getString(37));
            this.tfCuentaPolca.setText(cs.getString(38));
            this.tfNitPolca.setText(cs.getString(39));
            
            // avvillas
            this.ddBancoAvv.setValue(cs.getString(40));
            this.ddTipoAvv.setValue(cs.getString(41));
            this.tfCuentaAvv.setText(cs.getString(42));
            this.tfNitAvv.setText(cs.getString(43));

            info(resultado);
            
            
        } catch (Exception e) {
            info(e.getMessage());
            limpiar();

        } finally {
            SQLTools.close(rs, cs, con);
        }
        return resultado;
    }

    public void ddConcesionario_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
            if (!this.ddConcesionario.getValue().toString().equals("00") &&
                !this.ddBancoRec.getValue().toString().equals("00") )
                Consultar();
            else
                limpiar();
    }

    public void ddBancoRec_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
            if (!this.ddConcesionario.getValue().toString().equals("00") &&
                !this.ddBancoRec.getValue().toString().equals("00") )
                Consultar();
            else
                limpiar();
    }
    
    
    public void limpiar() {
            
            //Liquidación Otros Bancos
            this.ddBancoLiq.setValue("00");
            this.ddTipoLiq.setValue("000");
            this.tfCuentaLiq.setText("");
            this.tfNitLiq.setText("");
            
            this.ddBancoLiq1.setValue("00");
            this.ddTipoLiq1.setValue("000");
            this.tfCuentaLiq1.setText("");
            this.tfNitLiq1.setText("");

            this.ddBancoLiq2.setValue("00");
            this.ddTipoLiq2.setValue("000");
            this.tfCuentaLiq2.setText("");
            this.tfNitLiq2.setText("");

            this.ddBancoLiq3.setValue("00");
            this.ddTipoLiq3.setValue("000");
            this.tfCuentaLiq3.setText("");
            this.tfNitLiq3.setText("");

            // fondo cobertura
            this.ddBancoFon.setValue("00");
            this.ddTipoFon.setValue("000");
            this.tfCuentaFon.setText("");
            this.tfNitFon.setText("");
            
            // contravencional
            this.ddBancoCon.setValue("00");
            this.ddTipoCon.setValue("000");
            this.tfCuentaCon.setText("");
            this.tfNitCon.setText("");
            
            // contravencional fcm
            this.ddBancoFcm.setValue("00");
            this.ddTipoFcm.setValue("000");
            this.tfCuentaFcm.setText("");
            this.tfNitFcm.setText("");
            
            // sevial
            this.ddBancoSevial.setValue("00");
            this.ddTipoSevial.setValue("000");
            this.tfCuentaSevial.setText("");
            this.tfNitSevial.setText("");
            
            // polca
            this.ddBancoPolca.setValue("00");
            this.ddTipoPolca.setValue("000");
            this.tfCuentaPolca.setText("");
            this.tfNitPolca.setText("");
            
            // avvillas
            this.ddBancoAvv.setValue("00");
            this.ddTipoAvv.setValue("000");
            this.tfCuentaAvv.setText("");
            this.tfNitAvv.setText("");

    
    }


    
}

