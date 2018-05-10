/*
 * DiasDispersion.java
 *
 * Created on November 7, 2007, 3:28 PM
 * Copyright cristina
 */
package wasimit;

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
import java.text.DecimalFormat;
import java.util.Date;
import javax.faces.FacesException;
import javax.faces.context.ExternalContext;
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
public class ConsNovedadDevolucion extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        municipioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.municipioRowSet}"));
        bancoDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.bancoRowSet1}"));
        ddTipoIdeDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("9", "Seleccione"), new com.sun.rave.web.ui.model.Option("C", "Cedula Ciudadania"), new com.sun.rave.web.ui.model.Option("E", "Cedula Extranjeria"), new com.sun.rave.web.ui.model.Option("T", "Tarjeta Identidad"), new com.sun.rave.web.ui.model.Option("N", "Nit")});
        ddTipoCtaDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("999", "Seleccione"), new com.sun.rave.web.ui.model.Option("AHO", "Ahorros"), new com.sun.rave.web.ui.model.Option("CTE", "Corriente")});
        ddTipoComDefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("99999", "Seleccione"), new com.sun.rave.web.ui.model.Option("SIMIT", "SIMIT"), new com.sun.rave.web.ui.model.Option("POLCA", "POLCA")});
        concesionarioDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.concesionarioRowSet}"));
        vw_cuentaorigendevDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.vw_cuentaorigendevRowSet}"));
        ddTipoIde1DefaultOptions.setOptions(new com.sun.rave.web.ui.model.Option[] {new com.sun.rave.web.ui.model.Option("C", "Cedula Ciudadania"), new com.sun.rave.web.ui.model.Option("T", "Tarjeta Identidad"), new com.sun.rave.web.ui.model.Option("E", "Cedula extranjeria"), new com.sun.rave.web.ui.model.Option("N", "NIT")});
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
    
    private CachedRowSetDataProvider bancoDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getBancoDataProvider() {
        return bancoDataProvider;
    }
    
    public void setBancoDataProvider(CachedRowSetDataProvider crsdp) {
        this.bancoDataProvider = crsdp;
    }
    
    private Label lbBanco = new Label();
    
    public Label getLbBanco() {
        return lbBanco;
    }
    
    public void setLbBanco(Label l) {
        this.lbBanco = l;
    }
    
    private SingleSelectOptionsList ddMunicipio1DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDdMunicipio1DefaultOptions() {
        return ddMunicipio1DefaultOptions;
    }
    
    public void setDdMunicipio1DefaultOptions(SingleSelectOptionsList ssol) {
        this.ddMunicipio1DefaultOptions = ssol;
    }
    
    private SingleSelectOptionsList dropDown1DefaultOptions = new SingleSelectOptionsList();
    
    public SingleSelectOptionsList getDropDown1DefaultOptions() {
        return dropDown1DefaultOptions;
    }
    
    public void setDropDown1DefaultOptions(SingleSelectOptionsList ssol) {
        this.dropDown1DefaultOptions = ssol;
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
    
    private TextField txtValorsevial = new TextField();
    
    public TextField getTxtValorsevial() {
        return txtValorsevial;
    }
    
    public void setTxtValorsevial(TextField tf) {
        this.txtValorsevial = tf;
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
    
    private TextField txtValorContravCon = new TextField();
    
    public TextField gettxtValorContravCon() {
        return txtValorContravCon;
    }
    
    public void settxtValorContravCon(TextField tf) {
        this.txtValorContravCon = tf;
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
    
    private Button btReimprimir = new Button();
    
    public Button getBtReimprimir() {
        return btReimprimir;
    }
    
    public void setBtReimprimir(Button b) {
        this.btReimprimir = b;
    }
    
    private Button btAnular = new Button();
    
    public Button getBtAnular() {
        return btAnular;
    }
    
    public void setBtAnular(Button b) {
        this.btAnular = b;
    }
    
    private TextField tfNumero = new TextField();
    
    public TextField getTfNumero() {
        return tfNumero;
    }
    
    public void setTfNumero(TextField tf) {
        this.tfNumero = tf;
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
    
    private CachedRowSetDataProvider fcmDataProvider = new CachedRowSetDataProvider();
    
    public CachedRowSetDataProvider getFcmDataProvider() {
        return fcmDataProvider;
    }
    
    public void setFcmDataProvider(CachedRowSetDataProvider crsdp) {
        this.fcmDataProvider = crsdp;
    }
    
    // </editor-fold>
    
    private String Director_Ejecutivo;
    private String Director_Nacional;
    private String Contador_General;
    private String Coordinador_Financiero;
    private String resultadoVal = "";
    
    private Label label9 = new Label();
    
    public Label getLabel9() {
        return label9;
    }
    
    public void setLabel9(Label l) {
        this.label9 = l;
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

    private TextField txtValorDev1 = new TextField();

    public TextField getTxtValorDev1() {
        return txtValorDev1;
    }

    public void setTxtValorDev1(TextField tf) {
        this.txtValorDev1 = tf;
    }

    private Label lbBanco21 = new Label();

    public Label getLbBanco21() {
        return lbBanco21;
    }

    public void setLbBanco21(Label l) {
        this.lbBanco21 = l;
    }

    private Label lbBanco22 = new Label();

    public Label getLbBanco22() {
        return lbBanco22;
    }

    public void setLbBanco22(Label l) {
        this.lbBanco22 = l;
    }

    private TextField txtValorSevial27 = new TextField();

    public TextField getTxtValorSevial27() {
        return txtValorSevial27;
    }

    public void setTxtValorSevial27(TextField tf) {
        this.txtValorSevial27 = tf;
    }

    private Label lbBanco23 = new Label();

    public Label getLbBanco23() {
        return lbBanco23;
    }

    public void setLbBanco23(Label l) {
        this.lbBanco23 = l;
    }

    private TextField txtNumLiq = new TextField();

    public TextField getTxtNumLiq() {
        return txtNumLiq;
    }

    public void setTxtNumLiq(TextField tf) {
        this.txtNumLiq = tf;
    }

    private Label lbBanco24 = new Label();

    public Label getLbBanco24() {
        return lbBanco24;
    }

    public void setLbBanco24(Label l) {
        this.lbBanco24 = l;
    }

    private Calendar cfechaLiq = new Calendar();

    public Calendar getCfechaLiq() {
        return cfechaLiq;
    }

    public void setCfechaLiq(Calendar c) {
        this.cfechaLiq = c;
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

    private TextField txtNumIdentificacion1 = new TextField();

    public TextField getTxtNumIdentificacion1() {
        return txtNumIdentificacion1;
    }

    public void setTxtNumIdentificacion1(TextField tf) {
        this.txtNumIdentificacion1 = tf;
    }

    private Label label12 = new Label();

    public Label getLabel12() {
        return label12;
    }

    public void setLabel12(Label l) {
        this.label12 = l;
    }

    private TextField txtDns = new TextField();

    public TextField getTxtDns() {
        return txtDns;
    }

    public void setTxtDns(TextField tf) {
        this.txtDns = tf;
    }

    private Label lbBanco25 = new Label();

    public Label getLbBanco25() {
        return lbBanco25;
    }

    public void setLbBanco25(Label l) {
        this.lbBanco25 = l;
    }

    private TextField txtVlrTercero = new TextField();

    public TextField getTxtVlrTercero() {
        return txtVlrTercero;
    }

    public void setTxtVlrTercero(TextField tf) {
        this.txtVlrTercero = tf;
    }

    private Label lbBanco26 = new Label();

    public Label getLbBanco26() {
        return lbBanco26;
    }

    public void setLbBanco26(Label l) {
        this.lbBanco26 = l;
    }

    private Calendar cfechaCom = new Calendar();

    public Calendar getCfechaCom() {
        return cfechaCom;
    }

    public void setCfechaCom(Calendar c) {
        this.cfechaCom = c;
    }
    
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public ConsNovedadDevolucion() {
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
        
//        tfNumero.setValue(getSessionBean1().getnovedad());
        tfNumero.setValue(getSessionBean1().getnovedad());
        CargarNovedadDevolucion();
        
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
        bancoDataProvider.close();
        concesionarioDataProvider.close();
        vw_cuentaorigendevDataProvider.close();
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
    
    
    public String bsugerirValor_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        
        return null;
    }
    
    public String btReimprimir_action() {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        try {
            
            
            String [] Novedad = getSessionBean1().getnovedad().split("-");
            
            String estadoNew = "";
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOFINANCIERA))
                if (ddTipoCom.getValue().equals("SIMIT") )
                    estadoNew = Constants.VOBOFINANCIERA;
                else
                    estadoNew = Constants.VOBOSIMIT;
            
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOSIMIT))
                estadoNew = Constants.VALIDADA;
            
            if (getSessionBean1().getTipoVoBo().equals(Constants.VOBOPOLCA))
                estadoNew =  Constants.VALIDADA;
            
            if (estadoNew.equals(""))
                throw new Exception("Nuevo estado invalido");
            
            ActualizarEstadoNovedad(Novedad[0], Novedad[1], estadoNew);
            
            info(resultadoVal);
            
            this.btAnular.setDisabled(true);
            this.btReimprimir.setDisabled(true);
            
        } catch (Exception e) {
            info(e.getMessage());
        }
        
        return null;
        
    }
    
    private void ActualizarEstadoNovedad(String tipoNov, String numeroNov, String estado){
        try{
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovDevolucionUpdEst);
            pos = 0;
            
            // Cargamos los parametros de entrada IN
            cs.setString(++pos, tipoNov);
            cs.setString(++pos, numeroNov);
            cs.setString(++pos, getSessionBean1().getUser());
            cs.setString(++pos, estado);
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter(++pos, java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString(5);
        } catch (Exception e) {
            resultadoVal = e.toString();
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return;
    }
    
    
    
    public void reporteNovedad(String numNovedad) {
        // TODO: Process the button click action. Return value is a navigation
        // case name where null will return to the same page.
        String PageReport;
        String rptName = "";
        
        rptName = "novDevolucion";
        
        String tipoNovedad = numNovedad.substring(0,2);
        String numeroNovedad = numNovedad.substring(4);
        
        
        PageReport =  "/SimitBanco/ReportEngine?NameFilter=PDF" +
                "&P_TIPO_NOVEDAD=" + tipoNovedad +
                "&P_NUMERO_NOVEDAD=" + numeroNovedad +
                "&rptfilename=" + rptName;
        
        
        ExternalContext externalContext = getFacesContext().getExternalContext();
        
        try {
            externalContext.redirect(PageReport);
            
        } catch (Exception ex) {
            info("Fallo generando reporte novedad " + ex.getMessage());
        }
        
        
    }
    
    private String  CargarNovedadDevolucion() {
        try {
            
            String [] Novedad = getSessionBean1().getnovedad().split("-");
            
            
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.NovDevolucionQue);
            
            // Cargamos los parametros de entrada IN
            cs.setString("V_TIPONOV", Novedad[0]);
            cs.setString("V_NUMERONOV", Novedad[1]);
            cs.setString("V_USUARIO", getSessionBean1().getUser());
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("V_TIPOIDENTIFICACION", java.sql.Types.CHAR);
            cs.registerOutParameter("V_IDENTIFICACION", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_NOMBRE", java.sql.Types.CHAR);
            cs.registerOutParameter("V_IDBANCO", java.sql.Types.CHAR);
            cs.registerOutParameter("V_TIPOCUENTA", java.sql.Types.CHAR);
            cs.registerOutParameter("V_CUENTA", java.sql.Types.CHAR);
            cs.registerOutParameter("V_TIPOIDENTIFICACIONC", java.sql.Types.CHAR);
            cs.registerOutParameter("V_IDENTIFICACIONC", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_DNS", java.sql.Types.CHAR);
            cs.registerOutParameter("V_CUENTAREC", java.sql.Types.CHAR);
            cs.registerOutParameter("V_IDMUNICIPIO", java.sql.Types.CHAR);
            cs.registerOutParameter("V_IDCONCESIONARIO", java.sql.Types.CHAR);
            cs.registerOutParameter("V_INDTIPO", java.sql.Types.CHAR);
            cs.registerOutParameter("V_NUMLIQUIDACION", java.sql.Types.CHAR);
            cs.registerOutParameter("V_FECLIQ", java.sql.Types.DATE);
            cs.registerOutParameter("V_FECCOM", java.sql.Types.DATE);
            cs.registerOutParameter("V_MOTIVO", java.sql.Types.CHAR);
            cs.registerOutParameter("V_INDIVA", java.sql.Types.CHAR);
            cs.registerOutParameter("V_INDRETE", java.sql.Types.CHAR);
            cs.registerOutParameter("V_VDEVOLUCION", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VADICIONAL", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VCONCESIONARIO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFCM", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFONDOCOBERTURAFCM", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFONDOCOBERTURALIQ", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VEQUILIBRIOECONOMICO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VSEVIAL", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VPOLCA", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFCMPOLCA", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_SEVIAL27", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VMUNICIPIO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VFCMCONTRAVENCIONAL", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VCONCONTRAVENCIONAL", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_VTERCERO", java.sql.Types.NUMERIC);
            cs.registerOutParameter("V_FECHAACT", java.sql.Types.DATE);
            cs.registerOutParameter("V_ERROR", java.sql.Types.CHAR);
            
            // Ejecutamos
            cs.execute();
            
            // Captura los parametros de salida OUT
            resultadoVal = cs.getString("V_ERROR");
            
            //Ingresa cada uno de los valores de la novedad
            txtNombre.setText(cs.getString("V_NOMBRE"));
            ddTipoIde.setValue(cs.getString("V_TIPOIDENTIFICACION"));
            
            Double numIde = new Double(cs.getDouble("V_IDENTIFICACION"));
            
            String str = new DecimalFormat("#").format(numIde);
            
            txtNumIdentificacion.setText(str);
            
            ddBanco.setValue(cs.getString("V_IDBANCO"));
            ddTipoCta.setValue(cs.getString("V_TIPOCUENTA"));
            txtCuenta.setText(cs.getString("V_CUENTA"));
            ddTipoIde1.setValue(cs.getString("V_TIPOIDENTIFICACIONC"));
            
            Double numIdeC = new Double(cs.getDouble("V_IDENTIFICACIONC"));
            
            String strC = new DecimalFormat("#").format(numIdeC);
            
            txtNumIdentificacion1.setText(strC);
            
            txtDns.setText(cs.getString("V_DNS"));
            
            ddMunicipio.setValue(cs.getString("V_IDMUNICIPIO"));
            ddConcesionario.setValue(cs.getString("V_IDCONCESIONARIO"));
            ddTipoCom.setValue(cs.getString("V_INDTIPO"));
            ddCuenta.setValue(cs.getString("V_CUENTAREC"));
            this.txtNumLiq.setText(cs.getString("V_NUMLIQUIDACION"));
            cfechaLiq.setSelectedDate(cs.getDate("V_FECLIQ"));
            cfechaCom.setSelectedDate(cs.getDate("V_FECCOM"));
            
            txtMotivo.setText(cs.getString("V_MOTIVO"));
            
            txtValorDev.setText("" + cs.getDouble("V_VDEVOLUCION"));
            txtValorDev1.setText("" + cs.getDouble("V_VADICIONAL"));
            txtValorConces.setText("" + cs.getDouble("V_VCONCESIONARIO"));
            txtValorFcm.setText("" + cs.getDouble("V_VFCM"));
            txtValorFonSim.setText("" + cs.getDouble("V_VFONDOCOBERTURAFCM"));
            txtValorFonCon.setText("" + cs.getDouble("V_VFONDOCOBERTURALIQ"));
            txtValorEquil.setText("" + cs.getDouble("V_VEQUILIBRIOECONOMICO"));
            txtValorPolca.setText("" + cs.getDouble("V_VPOLCA"));
            txtValorFcmPolca.setText("" + cs.getDouble("V_VFCMPOLCA"));
            txtValorsevial.setText("" + cs.getDouble("V_VSEVIAL"));
            txtValorSevial27.setText("" + cs.getDouble("V_SEVIAL27"));
            
            txtValorMunicipio.setText("" + cs.getDouble("V_VMUNICIPIO"));
            txtValorContravFcm.setText("" + cs.getDouble("V_VFCMCONTRAVENCIONAL"));
            txtValorContravCon.setText("" + cs.getDouble("V_VCONCONTRAVENCIONAL"));
            txtVlrTercero.setText("" + cs.getDouble("V_VTERCERO"));
            
            cfechaAct.setSelectedDate(cs.getDate("V_FECHAACT"));
            
            if (getSessionBean1().getTipoVoBo().equals("")) {
                this.btReimprimir.setDisabled(true);
                this.btAnular.setDisabled(true);
            }
            
            
        } catch (Exception e) {
            if (e.getMessage() == null)
                resultadoVal = e.toString();
            else
                resultadoVal = e.getMessage();
        } finally {
            SQLTools.close(rs, cs, con);
        }
        return null;
    }
    
    public String btAnular_action() {
        // TODO: Replace with your code
        
        try {
            String [] Novedad = getSessionBean1().getnovedad().split("-");
            ActualizarEstadoNovedad(Novedad[0], Novedad[1], "ANULADA");
            info(resultadoVal);
            this.btAnular.setDisabled(true);
            this.btReimprimir.setDisabled(true);
            
            
        } catch (Exception e) {
            info(e.getMessage());
        }
        return "";
    }
    
    
}

