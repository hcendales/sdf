/*
 * DiasDispersion.java
 *
 * Created on November 7, 2007, 3:28 PM
 * Copyright cristina
 */
package wasimit;

import com.sun.data.provider.RowKey;
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
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.Page;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Table;
import com.sun.rave.web.ui.component.TableColumn;
import com.sun.rave.web.ui.component.TableRowGroup;
import com.sun.rave.web.ui.component.TextField;
import com.sun.rave.web.ui.model.DefaultTableDataProvider;
import com.sun.rave.web.ui.model.SingleSelectOptionsList;
import java.util.Date;
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
public class novDevolucion extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        ddTipoIdeDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"), new com.sun.rave.web.ui.model.Option("C", "Cedula Ciudadania"), new com.sun.rave.web.ui.model.Option("E", "Cedula Extranjeria"), new com.sun.rave.web.ui.model.Option("T", "Tarjeta Identidad"), new com.sun.rave.web.ui.model.Option("N", "Nit")});
        ddTipoCtaDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("999", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "Corriente")});
        ddTipoComDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99999", "Seleccione"), new com.sun.rave.web.ui.model.Option("SIMIT", "SIMIT"), new com.sun.rave.web.ui.model.Option("POLCA", "POLCA")});
        concesionarioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet}"));
        vw_cuentaorigendevDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_cuentaorigendevRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet}"));
        ddTipoIde1DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("0", "Seleccione"), new com.sun.rave.web.ui.model.Option("C", "Cedula Ciudadania"), new com.sun.rave.web.ui.model.Option("E", "Cedula Extranjeria"), new com.sun.rave.web.ui.model.Option("T", "Tarjeta Identidad"), new com.sun.rave.web.ui.model.Option("N", "Nit")});
        ddMotivoDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("Comparendo de otra cedula", "Comparendo de otra cedula"), new com.sun.rave.web.ui.model.Option("Pago doble del usuario", "Pago doble del usuario"), new com.sun.rave.web.ui.model.Option("Organismo duplico informacion", "Organismo duplico informacion"), new com.sun.rave.web.ui.model.Option("Organismo no cargo pago inicial", "Organismo no cargo pago inicial"), new com.sun.rave.web.ui.model.Option("Liquidacion generada errada", "Liquidacion generada errada"), new com.sun.rave.web.ui.model.Option("Otro", "Otro")});
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
    
    private DropDown ddMunicipio = new DropDown();
    
    public DropDown getDdMunicipio() {
        return ddMunicipio;
    }
    
    public void setDdMunicipio(DropDown dd) {
        this.ddMunicipio = dd;
    }
    
    private Label label1 = new Label();
    
    public Label getLabel1() {
        return label1;
    }
    
    public void setLabel1(Label l) {
        this.label1 = l;
    }
    
    private CachedRowSetDataProvider municipioDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getMunicipioDataProvider() {
        return municipioDataProvider;
    }
    
    public void setMunicipioDataProvider(CachedRowSetDataProvider crsdp) {
        this.municipioDataProvider = crsdp;
    }
    
    private DropDown ddBanco = new DropDown();
    
    public DropDown getDdBanco() {
        return ddBanco;
    }
    
    public void setDdBanco(DropDown dd) {
        this.ddBanco = dd;
    }
    
    private Label lbBanco = new Label();
    
    public Label getLbBanco() {
        return lbBanco;
    }
    
    public void setLbBanco(Label l) {
        this.lbBanco = l;
    }
    
    private Button btAdicionar = new Button();
    
    public Button getBtAdicionar() {
        return btAdicionar;
    }
    
    public void setBtAdicionar(Button b) {
        this.btAdicionar = b;
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
    
    private Label lbBanco1 = new Label();
    
    public Label getLbBanco1() {
        return lbBanco1;
    }
    
    public void setLbBanco1(Label l) {
        this.lbBanco1 = l;
    }
    
    private Label lbBanco2 = new Label();
    
    public Label getLbBanco2() {
        return lbBanco2;
    }
    
    public void setLbBanco2(Label l) {
        this.lbBanco2 = l;
    }
    
    private Label label6 = new Label();
    
    public Label getLabel6() {
        return label6;
    }
    
    public void setLabel6(Label l) {
        this.label6 = l;
    }
    
    private Label lbBanco3 = new Label();
    
    public Label getLbBanco3() {
        return lbBanco3;
    }
    
    public void setLbBanco3(Label l) {
        this.lbBanco3 = l;
    }
    
    private Label lbBanco4 = new Label();
    
    public Label getLbBanco4() {
        return lbBanco4;
    }
    
    public void setLbBanco4(Label l) {
        this.lbBanco4 = l;
    }
    
    private Label lbBanco5 = new Label();
    
    public Label getLbBanco5() {
        return lbBanco5;
    }
    
    public void setLbBanco5(Label l) {
        this.lbBanco5 = l;
    }
    
    private Label lbBanco6 = new Label();
    
    public Label getLbBanco6() {
        return lbBanco6;
    }
    
    public void setLbBanco6(Label l) {
        this.lbBanco6 = l;
    }
    
    private Label lbBanco7 = new Label();
    
    public Label getLbBanco7() {
        return lbBanco7;
    }
    
    public void setLbBanco7(Label l) {
        this.lbBanco7 = l;
    }
    
    private Label label7 = new Label();
    
    public Label getLabel7() {
        return label7;
    }
    
    public void setLabel7(Label l) {
        this.label7 = l;
    }
    
    private Label lbBanco8 = new Label();
    
    public Label getLbBanco8() {
        return lbBanco8;
    }
    
    public void setLbBanco8(Label l) {
        this.lbBanco8 = l;
    }
    
    private Label lbBanco9 = new Label();
    
    public Label getLbBanco9() {
        return lbBanco9;
    }
    
    public void setLbBanco9(Label l) {
        this.lbBanco9 = l;
    }
    
    private Label lbBanco10 = new Label();
    
    public Label getLbBanco10() {
        return lbBanco10;
    }
    
    public void setLbBanco10(Label l) {
        this.lbBanco10 = l;
    }
    
    private Label lbBanco11 = new Label();
    
    public Label getLbBanco11() {
        return lbBanco11;
    }
    
    public void setLbBanco11(Label l) {
        this.lbBanco11 = l;
    }
    
    private Label lbBanco12 = new Label();
    
    public Label getLbBanco12() {
        return lbBanco12;
    }
    
    public void setLbBanco12(Label l) {
        this.lbBanco12 = l;
    }
    
    private Label lbBanco13 = new Label();
    
    public Label getLbBanco13() {
        return lbBanco13;
    }
    
    public void setLbBanco13(Label l) {
        this.lbBanco13 = l;
    }
    
    private Label lbBanco14 = new Label();
    
    public Label getLbBanco14() {
        return lbBanco14;
    }
    
    public void setLbBanco14(Label l) {
        this.lbBanco14 = l;
    }
    
    private Label lbBanco15 = new Label();
    
    public Label getLbBanco15() {
        return lbBanco15;
    }
    
    public void setLbBanco15(Label l) {
        this.lbBanco15 = l;
    }
    
    private Label lbBanco16 = new Label();
    
    public Label getLbBanco16() {
        return lbBanco16;
    }
    
    public void setLbBanco16(Label l) {
        this.lbBanco16 = l;
    }
    
    private Label lbBanco17 = new Label();
    
    public Label getLbBanco17() {
        return lbBanco17;
    }
    
    public void setLbBanco17(Label l) {
        this.lbBanco17 = l;
    }
    
    private Label lbBanco18 = new Label();
    
    public Label getLbBanco18() {
        return lbBanco18;
    }
    
    public void setLbBanco18(Label l) {
        this.lbBanco18 = l;
    }
    
    private TextField txtNombre = new TextField();
    
    public TextField getTxtNombre() {
        return txtNombre;
    }
    
    public void setTxtNombre(TextField tf) {
        this.txtNombre = tf;
    }
    
    private TextField txtNumIdentificacion = new TextField();
    
    public TextField getTxtNumIdentificacion() {
        return txtNumIdentificacion;
    }
    
    public void setTxtNumIdentificacion(TextField tf) {
        this.txtNumIdentificacion = tf;
    }
    
    private DropDown ddTipoIde = new DropDown();
    
    public DropDown getDdTipoIde() {
        return ddTipoIde;
    }
    
    public void setDdTipoIde(DropDown dd) {
        this.ddTipoIde = dd;
    }
    
    private SingleSelectOptionsList ddTipoIdeDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoIdeDefaultOptions() {
        return ddTipoIdeDefaultOptions;
    }
    
    public void setDdTipoIdeDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoIdeDefaultOptions = ssol;
    }
    
    private DropDown ddTipoCta = new DropDown();
    
    public DropDown getDdTipoCta() {
        return ddTipoCta;
    }
    
    public void setDdTipoCta(DropDown dd) {
        this.ddTipoCta = dd;
    }
    
    private SingleSelectOptionsList ddTipoCtaDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoCtaDefaultOptions() {
        return ddTipoCtaDefaultOptions;
    }
    
    public void setDdTipoCtaDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoCtaDefaultOptions = ssol;
    }
    
    private TextField txtCuenta = new TextField();
    
    public TextField getTxtCuenta() {
        return txtCuenta;
    }
    
    public void setTxtCuenta(TextField tf) {
        this.txtCuenta = tf;
    }
    
    private DropDown ddTipoCom = new DropDown();
    
    public DropDown getDdTipoCom() {
        return ddTipoCom;
    }
    
    public void setDdTipoCom(DropDown dd) {
        this.ddTipoCom = dd;
    }
    
    private SingleSelectOptionsList ddTipoComDefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdTipoComDefaultOptions() {
        return ddTipoComDefaultOptions;
    }
    
    public void setDdTipoComDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoComDefaultOptions = ssol;
    }
    
    private TextField txtMotivo = new TextField();
    
    public TextField getTxtMotivo() {
        return txtMotivo;
    }
    
    public void setTxtMotivo(TextField tf) {
        this.txtMotivo = tf;
    }
    
    private TextField txtValorDev = new TextField();
    
    public TextField getTxtValorDev() {
        return txtValorDev;
    }
    
    public void setTxtValorDev(TextField tf) {
        this.txtValorDev = tf;
    }
    
    private TextField txtValorConces = new TextField();
    
    public TextField getTxtValorConces() {
        return txtValorConces;
    }
    
    public void setTxtValorConces(TextField tf) {
        this.txtValorConces = tf;
    }
    
    private TextField txtValorFcm = new TextField();
    
    public TextField getTxtValorFcm() {
        return txtValorFcm;
    }
    
    public void setTxtValorFcm(TextField tf) {
        this.txtValorFcm = tf;
    }
    
    private TextField txtValorFonSim = new TextField();
    
    public TextField getTxtValorFonSim() {
        return txtValorFonSim;
    }
    
    public void setTxtValorFonSim(TextField tf) {
        this.txtValorFonSim = tf;
    }
    
    private TextField txtValorFonCon = new TextField();
    
    public TextField getTxtValorFonCon() {
        return txtValorFonCon;
    }
    
    public void setTxtValorFonCon(TextField tf) {
        this.txtValorFonCon = tf;
    }
    
    private TextField txtValorEquil = new TextField();
    
    public TextField getTxtValorEquil() {
        return txtValorEquil;
    }
    
    public void setTxtValorEquil(TextField tf) {
        this.txtValorEquil = tf;
    }
    
    private TextField txtValorPolca = new TextField();
    
    public TextField getTxtValorPolca() {
        return txtValorPolca;
    }
    
    public void setTxtValorPolca(TextField tf) {
        this.txtValorPolca = tf;
    }
    
    private TextField txtValorFcmPolca = new TextField();
    
    public TextField getTxtValorFcmPolca() {
        return txtValorFcmPolca;
    }
    
    public void setTxtValorFcmPolca(TextField tf) {
        this.txtValorFcmPolca = tf;
    }
    
    private TextField txtValorsevial27 = new TextField();
    
    public TextField getTxtValorsevial27() {
        return txtValorsevial27;
    }
    
    public void setTxtValorsevial27(TextField tf) {
        this.txtValorsevial27 = tf;
    }
    
    private TextField txtValorMunicipio = new TextField();
    
    public TextField getTxtValorMunicipio() {
        return txtValorMunicipio;
    }
    
    public void setTxtValorMunicipio(TextField tf) {
        this.txtValorMunicipio = tf;
    }
    
    private TextField txtValorContravFcm = new TextField();
    
    public TextField getTxtValorContravFcm() {
        return txtValorContravFcm;
    }
    
    public void setTxtValorContravFcm(TextField tf) {
        this.txtValorContravFcm = tf;
    }
    
    private TextField txtValorContravConc = new TextField();
    
    public TextField getTxtValorContravConc() {
        return txtValorContravConc;
    }
    
    public void setTxtValorContravConc(TextField tf) {
        this.txtValorContravConc = tf;
    }
    
    private Label lbBanco19 = new Label();
    
    public Label getLbBanco19() {
        return lbBanco19;
    }
    
    public void setLbBanco19(Label l) {
        this.lbBanco19 = l;
    }
    
    private Calendar cfechaAct = new Calendar();
    
    public Calendar getCfechaAct() {
        return cfechaAct;
    }
    
    public void setCfechaAct(Calendar c) {
        this.cfechaAct = c;
    }
    
    private Label label8 = new Label();
    
    public Label getLabel8() {
        return label8;
    }
    
    public void setLabel8(Label l) {
        this.label8 = l;
    }
    
    private Button bsugerirValor = new Button();
    
    public Button getBsugerirValor() {
        return bsugerirValor;
    }
    
    public void setBsugerirValor(Button b) {
        this.bsugerirValor = b;
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
    
    private Label lbBanco20 = new Label();
    
    public Label getLbBanco20() {
        return lbBanco20;
    }
    
    public void setLbBanco20(Label l) {
        this.lbBanco20 = l;
    }
    
    private DropDown ddCuenta = new DropDown();
    
    public DropDown getDdCuenta() {
        return ddCuenta;
    }
    
    public void setDdCuenta(DropDown dd) {
        this.ddCuenta = dd;
    }
    
    private CachedRowSetDataProvider vw_cuentaorigendevDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getVw_cuentaorigendevDataProvider() {
        return vw_cuentaorigendevDataProvider;
    }
    
    public void setVw_cuentaorigendevDataProvider(CachedRowSetDataProvider crsdp) {
        this.vw_cuentaorigendevDataProvider = crsdp;
    }

    private Label lbBanco21 = new Label();

    public Label getLbBanco21() {
        return lbBanco21;
    }

    public void setLbBanco21(Label l) {
        this.lbBanco21 = l;
    }

    private TextField txtValorAdicional = new TextField();

    public TextField getTxtValorAdicional() {
        return txtValorAdicional;
    }

    public void setTxtValorAdicional(TextField tf) {
        this.txtValorAdicional = tf;
    }

    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }

    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }

    private Checkbox civa = new Checkbox();

    public Checkbox getCiva() {
        return civa;
    }

    public void setCiva(Checkbox c) {
        this.civa = c;
    }

    private Checkbox crete = new Checkbox();

    public Checkbox getCrete() {
        return crete;
    }

    public void setCrete(Checkbox c) {
        this.crete = c;
    }

    private Label lbBanco22 = new Label();

    public Label getLbBanco22() {
        return lbBanco22;
    }

    public void setLbBanco22(Label l) {
        this.lbBanco22 = l;
    }

    private TextField txtDns = new TextField();

    public TextField getTxtDns() {
        return txtDns;
    }

    public void setTxtDns(TextField tf) {
        this.txtDns = tf;
    }

    private Label lbBanco23 = new Label();

    public Label getLbBanco23() {
        return lbBanco23;
    }

    public void setLbBanco23(Label l) {
        this.lbBanco23 = l;
    }

    private TextField txtLiq = new TextField();

    public TextField getTxtLiq() {
        return txtLiq;
    }

    public void setTxtLiq(TextField tf) {
        this.txtLiq = tf;
    }

    private DropDown ddMotivo = new DropDown();

    public DropDown getDdMotivo() {
        return ddMotivo;
    }

    public void setDdMotivo(DropDown dd) {
        this.ddMotivo = dd;
    }

    private SingleSelectOptionsList ddMotivoDefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdMotivoDefaultOptions() {
        return ddMotivoDefaultOptions;
    }

    public void setDdMotivoDefaultOptions(SingleSelectOptionsList ssol) {
        this.ddMotivoDefaultOptions = ssol;
    }

    private Label label9 = new Label();

    public Label getLabel9() {
        return label9;
    }

    public void setLabel9(Label l) {
        this.label9 = l;
    }

    private DropDown ddTipoIde1 = new DropDown();

    public DropDown getDdTipoIde1() {
        return ddTipoIde1;
    }

    public void setDdTipoIde1(DropDown dd) {
        this.ddTipoIde1 = dd;
    }

    private SingleSelectOptionsList ddTipoIde1DefaultOptions = new SingleSelectOptionsList();

    public SingleSelectOptionsList getDdTipoIde1DefaultOptions() {
        return ddTipoIde1DefaultOptions;
    }

    public void setDdTipoIde1DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddTipoIde1DefaultOptions = ssol;
    }

    private Label label10 = new Label();

    public Label getLabel10() {
        return label10;
    }

    public void setLabel10(Label l) {
        this.label10 = l;
    }

    private TextField txtNumIdentificacion1 = new TextField();

    public TextField getTxtNumIdentificacion1() {
        return txtNumIdentificacion1;
    }

    public void setTxtNumIdentificacion1(TextField tf) {
        this.txtNumIdentificacion1 = tf;
    }

    private Label lbBanco24 = new Label();

    public Label getLbBanco24() {
        return lbBanco24;
    }

    public void setLbBanco24(Label l) {
        this.lbBanco24 = l;
    }

    private TextField txtValorsevial3 = new TextField();

    public TextField getTxtValorsevial3() {
        return txtValorsevial3;
    }

    public void setTxtValorsevial3(TextField tf) {
        this.txtValorsevial3 = tf;
    }

    private Calendar cfechaLiq = new Calendar();

    public Calendar getCfechaLiq() {
        return cfechaLiq;
    }

    public void setCfechaLiq(Calendar c) {
        this.cfechaLiq = c;
    }

    private Label lbBanco25 = new Label();

    public Label getLbBanco25() {
        return lbBanco25;
    }

    public void setLbBanco25(Label l) {
        this.lbBanco25 = l;
    }

    private Label lbBanco26 = new Label();

    public Label getLbBanco26() {
        return lbBanco26;
    }

    public void setLbBanco26(Label l) {
        this.lbBanco26 = l;
    }

    private TextField txtVlrTercero = new TextField();

    public TextField getTxtVlrTercero() {
        return txtVlrTercero;
    }

    public void setTxtVlrTercero(TextField tf) {
        this.txtVlrTercero = tf;
    }

    private Label lbBanco27 = new Label();

    public Label getLbBanco27() {
        return lbBanco27;
    }

    public void setLbBanco27(Label l) {
        this.lbBanco27 = l;
    }

    private Calendar cfechaCom = new Calendar();

    public Calendar getCfechaCom() {
        return cfechaCom;
    }

    public void setCfechaCom(Calendar c) {
        this.cfechaCom = c;
    }
    
    // </editor-fold>
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public novDevolucion() {
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
            log("DiasDispersion Initialization Failure", e);
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
        municipioDataProvider.close();
        concesionarioDataProvider.close();
        vw_cuentaorigendevDataProvider.close();
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
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
    
    public String btAdicionar_action() {
        try {
            
            if (txtNombre.getValue() == null)
                throw new Exception("Ingrese nombre del infractor");
            
            if (txtNombre.getValue().toString().length() == 0)
                throw new Exception("Ingrese nombre del infractor");
            
            if(this.ddTipoIde.getValue().toString().compareTo("0") == 0) {
                throw new Exception("Seleccione tipo identificacion");
            }
            
            if (this.ddTipoIde1.getValue().toString().compareTo("0") == 0) {
                throw new Exception("Seleccione tipo identificacion");
            }
            
            if (txtNumIdentificacion.getValue() == null)
                throw new Exception("Ingrese numero de identificacion");
            
            if (txtNumIdentificacion.getValue().toString().length() == 0)
                throw new Exception("Ingrese numero de identificacion");
            
            if (txtNumIdentificacion1.getValue() == null)
                throw new Exception("Ingrese numero de identificacion");
            
            if (txtNumIdentificacion1.getValue().toString().length() == 0)
                throw new Exception("Ingrese numero de identificacion");
       
            if (txtDns.getValue() == null)
                throw new Exception("Ingrese DNS");
            
            if (txtDns.getValue().toString().length() == 0)
                throw new Exception("Ingrese DNS");
            
            if (txtLiq.getValue() == null)
                throw new Exception("Ingrese Numero Liquidacion");
            
            if (txtLiq.getValue().toString().length() == 0)
                throw new Exception("Ingrese Numero Liquidacion");
           
            if (ddMotivo.getValue().toString().equals("Otro"))
            {
               if (txtMotivo.getValue().toString().length() == 0)
                throw new Exception("Ingrese motivo devolucion");
            
               if (txtMotivo.getValue() == null)
                 throw new Exception("Ingrese motivo devolucion");
                
            }
            
            try {
                double vlr = Double.parseDouble(this.txtNumIdentificacion.getValue().toString());
                
            } catch (NumberFormatException Err) {
                throw new Exception("Numero identificacion debe ser numerico");
            }
            
            
            if(this.ddBanco.getValue().toString().compareTo("00") == 0) {
                throw new Exception("Seleccione el Banco");
            }
            
            if(this.ddTipoCta.getValue().toString().compareTo("999") == 0) {
                throw new Exception("Seleccione tipo de cuenta");
            }
            
            if (txtCuenta.getValue() == null)
                throw new Exception("Ingrese numero de cuenta");
            
            if (txtCuenta.getValue().toString().length() == 0)
                throw new Exception("Ingrese numero de cuenta");
            
            try {
                double vlr = Double.parseDouble(this.txtCuenta.getValue().toString());
                
            } catch (NumberFormatException Err) {
                throw new Exception("Numero de cuenta debe ser numerico");
            }
            
            if (this.ddCuenta.getValue() == null )
                throw new Exception("Seleccione Cuenta de recaudo");
            
            if(this.ddMunicipio.getValue().toString().compareTo("00000000") == 0) {
                throw new Exception("Seleccione el Municipio");
            }
            
            if(this.ddConcesionario.getValue().toString().compareTo("00") == 0) {
                throw new Exception("seleccione Concesionario");
            }
            
            if(this.ddTipoCom.getValue().toString().compareTo("99999") == 0) {
                throw new Exception("Seleccione el tipo de comparendo");
            }
            
            /*Object ctaSel = ddCuenta.getSelected();
            RowKey rowKey = this.vw_cuentaorigendevDataProvider.findFirst("CUENTA",ctaSel);
            String nomCta = vw_cuentaorigendevDataProvider.getValue(vw_cuentaorigendevDataProvider.getFieldKey("nomCuenta" ),rowKey).toString();
            */
            String nomCta = ddCuenta.getValue().toString();
            
            if (!nomCta.contains(this.ddTipoCom.getValue().toString()))
                throw new Exception("Tipo de comparendo no coincide con cuenta de recaudoo" + nomCta);
            
                 
            validarNum(txtValorDev,"Valor de devolucion");
            
            double ValorDev = Double.parseDouble(this.txtValorDev.getValue().toString());
            
            if (ValorDev <= 0)
                throw new Exception("Valor devolucion debe ser mayor a cero");
            
            validarNum(txtValorAdicional,"Valor adicional");
            
            double ValorAdi = Double.parseDouble(this.txtValorAdicional.getValue().toString());
            
            if (ValorAdi < 0)
                throw new Exception("Valor adicional debe ser mayor o igual a cero");
        
       
            validarNum(txtValorConces,"Valor del concesionario");
            validarNum(txtValorFcm,"Valor FCM");
            validarNum(txtValorFonSim,"Valor Fondo de Cobertura SIMIT");
            validarNum(txtValorFonCon,"Valor Fondo de Cobertura Concesionario");
            validarNum(txtValorEquil,"Valor Equilibrio Economico");
            validarNum(txtValorsevial3,"Valor SEVIAL 3.0%");
            validarNum(txtValorPolca,"Valor POLCA");
            validarNum(txtValorFcmPolca,"Valor FCM-POLCA");
            validarNum(txtValorsevial27,"Valor SEVIAL 1.8%");
            validarNum(txtValorMunicipio,"Valor Municipio");
            validarNum(txtValorContravFcm,"Valor Contravencional FCM");
            validarNum(txtValorContravConc,"Valor Contravencional Concesionario");
            validarNum(txtVlrTercero,"Valor Tercero");
            
            
            double ValorConces = Double.parseDouble(this.txtValorConces.getValue().toString());
            double ValorFcm = Double.parseDouble(this.txtValorFcm.getValue().toString());
            double ValorFonSim = Double.parseDouble(this.txtValorFonSim.getValue().toString());
            double ValorFonCon = Double.parseDouble(this.txtValorFonCon.getValue().toString());
            double ValorEquil = Double.parseDouble(this.txtValorEquil.getValue().toString());
            double Valorsevial3 = Double.parseDouble(this.txtValorsevial3.getValue().toString());
          
            double ValorPolca = Double.parseDouble(this.txtValorPolca.getValue().toString());
            double ValorFcmPolca = Double.parseDouble(this.txtValorFcmPolca.getValue().toString());
            double Valorsevial27 = Double.parseDouble(this.txtValorsevial27.getValue().toString());
            
            double ValorMunicipio = Double.parseDouble(this.txtValorMunicipio.getValue().toString());
            double ValorContravFcm = Double.parseDouble(this.txtValorContravFcm.getValue().toString());
            double ValorContravConc = Double.parseDouble(this.txtValorContravConc.getValue().toString());
            double ValorTercero = Double.parseDouble(this.txtVlrTercero.getValue().toString());
            
            double dif = ValorDev - ValorConces - ValorFcm - ValorFonSim - ValorFonCon -
                    ValorEquil - Valorsevial3 - ValorPolca - ValorFcmPolca  - Valorsevial27 - ValorMunicipio
                    - ValorContravFcm - ValorContravConc - ValorTercero;
            
            if (Math.abs(dif) > 0.0001)
                throw new Exception("Valores devolucion debe ser igual al valor de devolucion " + Math.abs(dif));
            
              if (this.cfechaLiq.getSelectedDate() == null)
                throw new Exception("Seleccione Fecha Liquidacion");
          
            //Fecha Activacion
            if (this.cfechaAct.getSelectedDate() == null)
                throw new Exception("Seleccione Fecha Activación");
            
            //java.util.Calendar fecha_hoy = java.util.Calendar.getInstance();
            //if (this.cfechaAct.getSelectedDate().compareTo(fecha_hoy.getTime()) < 0 )
            //    throw new Exception("Fecha Activación inválida");
            
            if (txtDns.getValue() == null)
                throw new Exception("Ingrese numero de DNS");
            
            if (txtDns.getValue().toString().length() == 0)
                throw new Exception("Ingrese numero de DNS");
            
            con = Constants.getJdbcDataSource().getConnection();
            
            cs = con.prepareCall(Constants.NovDevolucionAdd);
            
            
            cs.setString("V_TIPOIDENTIFICACION", (String) this.ddTipoIde.getValue());
            cs.setDouble("V_IDENTIFICACION", Double.parseDouble((String) this.txtNumIdentificacion.getText()));
            cs.setString("V_NOMBRE", (String) this.txtNombre.getText());
            
            cs.setString("V_IDBANCO", (String) this.ddBanco.getValue());
            cs.setString("V_TIPOCUENTA", (String) this.ddTipoCta.getValue());
            cs.setString("V_CUENTA", (String) this.txtCuenta.getText());
            
            String cta = ddCuenta.getValue().toString().substring(0,ddCuenta.getValue().toString().indexOf("-"));
            
            cs.setString("V_CUENTAREC", cta);
            cs.setString("V_IDMUNICIPIO", (String) this.ddMunicipio.getValue());
            cs.setString("V_IDCONCESIONARIO", (String) this.ddConcesionario.getValue());
            cs.setString("V_INDTIPO", (String) this.ddTipoCom.getValue());
            cs.setString("V_DNS", (String) this.txtDns.getText());
            
            if (ddMotivo.getValue().toString().equals("Otro"))
                cs.setString("V_MOTIVO", (String) this.txtMotivo.getText());
            else
                cs.setString("V_MOTIVO", this.ddMotivo.getValue().toString() );
                
            cs.setDouble("V_VDEVOLUCION", Double.parseDouble(txtValorDev.getValue().toString()));
            cs.setDouble("V_VADICIONAL", Double.parseDouble(txtValorAdicional.getValue().toString()));

            if (this.civa.getValue() == null)
                cs.setString("V_INDIVA", "N");
            else
                cs.setString("V_INDIVA", "S");
   
            if (this.crete.getValue() == null)
                cs.setString("V_INDRETE", "N");
            else
                cs.setString("V_INDRETE", "S");

            cs.setDouble("V_VCONCESIONARIO", Double.parseDouble(txtValorConces.getValue().toString()));
            cs.setDouble("V_VFCM", Double.parseDouble(txtValorFcm.getValue().toString()));
            cs.setDouble("V_VFONDOCOBERTURAFCM", Double.parseDouble(txtValorFonSim.getValue().toString()));
            cs.setDouble("V_VFONDOCOBERTURALIQ", Double.parseDouble(txtValorFonCon.getValue().toString()));
            cs.setDouble("V_VEQUILIBRIOECONOMICO", Double.parseDouble(txtValorEquil.getValue().toString()));
            cs.setDouble("V_VPOLCA", Double.parseDouble(txtValorPolca.getValue().toString()));
            cs.setDouble("V_VFCMPOLCA", Double.parseDouble(txtValorFcmPolca.getValue().toString()));
            cs.setDouble("V_VSEVIAL3", Double.parseDouble(txtValorsevial3.getValue().toString()));
            cs.setDouble("V_VSEVIAL27", Double.parseDouble(txtValorsevial27.getValue().toString()));
            cs.setDouble("V_VMUNICIPIO", Double.parseDouble(txtValorMunicipio.getValue().toString()));
            cs.setDouble("V_VFCMCONTRAVENCIONAL", Double.parseDouble(txtValorContravFcm.getValue().toString()));
            cs.setDouble("V_VCONCONTRAVENCIONAL", Double.parseDouble(txtValorContravConc.getValue().toString()));
            cs.setDouble("V_VTERCERO", Double.parseDouble(txtVlrTercero.getValue().toString()));
            
            // Fecha Activacion
            java.util.Calendar cal =  java.util.Calendar.getInstance();
            
            Date fecha_act = this.cfechaAct.getSelectedDate();
            cal.setTime(fecha_act);
            
            cs.setInt("V_FECHA_ACT_ANO",cal.get(java.util.Calendar.YEAR));
            cs.setInt("V_FECHA_ACT_MES",cal.get(java.util.Calendar.MONTH) + 1);
            cs.setInt("V_FECHA_ACT_DIA",cal.get(java.util.Calendar.DAY_OF_MONTH));

            cs.setString("V_NUMLIQ", (String) this.txtLiq.getText().toString());
            cs.setString("V_TIPOIDENTIFICACION1", (String) this.ddTipoIde1.getValue());
            cs.setDouble("V_IDENTIFICACION1", Double.parseDouble((String) this.txtNumIdentificacion1.getText()));
           
            Date fecha_liq = this.cfechaLiq.getSelectedDate();
            cal.setTime(fecha_liq);
           
            cs.setInt("V_FECHA_LIQ_ANO",cal.get(java.util.Calendar.YEAR));
            cs.setInt("V_FECHA_LIQ_MES",cal.get(java.util.Calendar.MONTH) + 1);
            cs.setInt("V_FECHA_LIQ_DIA",cal.get(java.util.Calendar.DAY_OF_MONTH));
           
            Date fecha_com = this.cfechaCom.getSelectedDate();
            cal.setTime(fecha_com);
           
            cs.setInt("V_FECHA_COM_ANO",cal.get(java.util.Calendar.YEAR));
            cs.setInt("V_FECHA_COM_MES",cal.get(java.util.Calendar.MONTH) + 1);
            cs.setInt("V_FECHA_COM_DIA",cal.get(java.util.Calendar.DAY_OF_MONTH));
            
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("V_ERROR", java.sql.Types.CHAR);
            cs.registerOutParameter("V_NOVEDAD", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString("V_ERROR");
            info(resultado);
            
            if (!resultado.equals(Constants.MSG_INS_OK) && !resultado.equals(Constants.MSG_UPD_OK))
                return "";
            
            String numNovedad = cs.getString("V_NOVEDAD");
            
            info("Numero de novedad: " + numNovedad);
            
            txtNombre.setText("");
            ddTipoIde.setValue("0");
            txtNumIdentificacion.setText("");
            ddTipoIde1.setValue("0");
            txtNumIdentificacion1.setText("");
            
            ddBanco.setValue("00");
            ddTipoCta.setValue("999");
            txtCuenta.setText("");
            
            ddMunicipio.setValue("00000000");
            ddConcesionario.setValue("00");
            ddTipoCom.setValue("99999");
            
            txtValorDev.setText("");
            txtValorAdicional.setText("");
            
            txtValorConces.setText("");
            txtValorFcm.setText("");
            txtValorFonSim.setText("");
            txtValorFonCon.setText("");
            txtValorEquil.setText("");
            txtValorPolca.setText("");
            txtValorFcmPolca.setText("");
            txtValorsevial27.setText("");
            txtValorMunicipio.setText("");
            txtValorContravFcm.setText("");
            txtValorContravConc.setText("");
            txtMotivo.setText("");
            txtDns.setText("");
            txtLiq.setText("");
            txtVlrTercero.setText("");
            txtValorsevial3.setText("");
    
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return null;
        
        
        
    }
    
    public void validarNum(TextField valor, String nombre) throws Exception {
        if (valor.getValue() == null)
            throw new Exception("Ingrese " + nombre);
        
        if (valor.getValue().toString().length() == 0)
            throw new Exception("Ingrese " + nombre);
        
        try {
            double vlr = Double.parseDouble(valor.getValue().toString());
            
        } catch (NumberFormatException Err) {
            throw new Exception(nombre + " debe ser numerico");
        }
        
    }
    
    public String bsugerirValor_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            validarNum(txtValorDev,"Valor de devolucion");
            
            double ValorDev = Double.parseDouble(this.txtValorDev.getValue().toString());
            
            if (ValorDev <= 0)
                throw new Exception("Valor devolucion debe ser mayor a cero");
         
           validarNum(txtValorAdicional,"Valor adicional");
            
            ValorDev = Double.parseDouble(this.txtValorAdicional.getValue().toString());
            
            if (ValorDev < 0)
                throw new Exception("Valor adicional debe ser mayor o igual a cero");
        
           if (this.cfechaLiq.getSelectedDate() == null)
                throw new Exception("Seleccione Fecha Liquidacion");

           if (this.cfechaCom.getSelectedDate() == null)
                throw new Exception("Seleccione Fecha Comparendo");

            con = Constants.getJdbcDataSource().getConnection();
            
            cs = con.prepareCall(Constants.NovDevolucionSugImp);
            
            
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            
            String cta = ddCuenta.getValue().toString().substring(0,ddCuenta.getValue().toString().indexOf("-"));
            
            cs.setString("V_CUENTAREC", cta);
            cs.setString("V_IDMUNICIPIO", (String) this.ddMunicipio.getValue());
            cs.setString("V_IDCONCESIONARIO", (String) this.ddConcesionario.getValue());
            cs.setString("V_INDTIPO", (String) this.ddTipoCom.getValue());
            cs.setDouble("V_VDEVOLUCION", Double.parseDouble(txtValorDev.getValue().toString()));
            cs.setDouble("V_ADICIONAL", Double.parseDouble(txtValorAdicional.getValue().toString() ) );
            cs.setString("V_NUMLIQ", (String) this.txtLiq.getText().toString());
            
            cs.setString("V_INDIVA", "S");
            cs.setString("V_INDRETE", "S");
            
            java.sql.Date fec = new java.sql.Date(this.cfechaLiq.getSelectedDate().getTime());
            cs.setDate("V_FECLIQ", fec);
        
            java.sql.Date fecCom = new java.sql.Date(this.cfechaCom.getSelectedDate().getTime());
            cs.setDate("V_FECCOM", fecCom);
        
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("V_VCONCESIONARIO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFCM", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFONDOCOBERTURAFCM", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFONDOCOBERTURALIQ", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VEQUILIBRIOECONOMICO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VPOLCA", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFCMPOLCA", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VSEVIAL3", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VSEVIAL27", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VMUNICIPIO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFCMCONTRAVENCIONAL", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VCONCONTRAVENCIONAL", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VTERCERO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_ERROR", java.sql.Types.CHAR);
            
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultado = cs.getString("V_ERROR");
            
            if (!resultado.equals("OK") )
            {
                info("Error en calculo de sugerencia: " + resultado);
                return "";
            }
            txtValorConces.setText("" + cs.getDouble("V_VCONCESIONARIO"));
            txtValorFcm.setText("" + cs.getDouble("V_VFCM"));
            txtValorFonSim.setText("" + cs.getDouble("V_VFONDOCOBERTURAFCM"));
            txtValorFonCon.setText("" + cs.getDouble("V_VFONDOCOBERTURALIQ"));
            txtValorEquil.setText("" + cs.getDouble("V_VEQUILIBRIOECONOMICO"));
            txtValorPolca.setText("" + cs.getDouble("V_VPOLCA"));
            txtValorFcmPolca.setText("" + cs.getDouble("V_VFCMPOLCA"));
            txtValorsevial27.setText("" + cs.getDouble("V_VSEVIAL27"));
            txtValorsevial3.setText("" + cs.getDouble("V_VSEVIAL3"));
            txtValorMunicipio.setText("" + cs.getDouble("V_VMUNICIPIO"));
            txtValorContravFcm.setText("" + cs.getDouble("V_VFCMCONTRAVENCIONAL"));
            txtValorContravConc.setText("" + cs.getDouble("V_VCONCONTRAVENCIONAL"));
            txtVlrTercero.setText("" + cs.getDouble("V_VTERCERO"));
           
            info("Valores sugeridos correctamente");
            
        } catch (Exception e) {
            info(e.getMessage());
        } finally {
            SQLTools.close(rs, cs, con);
        }
        
        return null;
    }

    public void ddMotivo_processValueChange(ValueChangeEvent event) {
        // TODO: Replace with your code
        txtMotivo.setDisabled(true);
        txtMotivo.setText("");
        if (ddMotivo.getValue().toString().equals("Otro"))
            txtMotivo.setDisabled(false);
    }
    
    
    
}

