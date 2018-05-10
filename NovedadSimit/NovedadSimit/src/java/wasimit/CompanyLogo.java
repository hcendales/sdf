/*
 * CompanyLogo.java
 *
 * Created on 28 de octubre de 2007, 23:18
 * Copyright Administrador
 */
package wasimit;

import com.sun.rave.web.ui.appbase.AbstractFragmentBean;
import com.sun.rave.web.ui.component.Button;
import com.sun.rave.web.ui.component.ImageComponent;
import com.sun.rave.web.ui.component.MessageGroup;
import java.io.IOException;
import java.util.Date;
import javax.faces.FacesException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.omg.CORBA.Request;

/**
 * <p>Fragment bean that corresponds to a similarly named JSP page
 * fragment.  This class contains component definitions (and initialization
 * code) for all components that you have defined on this fragment, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class CompanyLogo extends AbstractFragmentBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization. <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
    }
    
    private ImageComponent image2 = new ImageComponent();
    
    public ImageComponent getImage2() {
        return image2;
    }
    
    public void setImage2(ImageComponent ic) {
        this.image2 = ic;
    }
    
    private MessageGroup messageGroup = new MessageGroup();
    
    public MessageGroup getMessageGroup() {
        return messageGroup;
    }
    
    public void setMessageGroup(MessageGroup mg) {
        this.messageGroup = mg;
    }
    
    private Button btSalir = new Button();
    
    public Button getBtSalir() {
        return btSalir;
    }
    
    public void setBtSalir(Button b) {
        this.btSalir = b;
    }

    private Button btSalir1 = new Button();

    public Button getBtSalir1() {
        return btSalir1;
    }

    public void setBtSalir1(Button b) {
        this.btSalir1 = b;
    }

    private ImageComponent image3 = new ImageComponent();

    public ImageComponent getImage3() {
        return image3;
    }

    public void setImage3(ImageComponent ic) {
        this.image3 = ic;
    }
    // </editor-fold>
    
    public CompanyLogo() {
    }
    
    /**
     * <p>Callback method that is called whenever a page containing
     * this page fragment is navigated to, either directly via a URL,
     * or indirectly via page navigation.  Override this method to acquire
     * resources that will be needed for event handlers and lifecycle methods.</p>
     *
     * <p>The default implementation does nothing.</p>
     */
    public void init() {
        // Perform initializations inherited from our superclass
        super.init();
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here
        
        
        // <editor-fold defaultstate="collapsed" desc="Visual-Web-managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Page1 Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
        
        // </editor-fold>
        // Perform application initialization that must complete
        // *after* managed components are initialized
        // TODO - add your own initialization code here
        
        
    }
    
    public void prerender() {

        if (Constants.AMBIENTE.equals("PROD")) {
            this.image3.setUrl("/resources/logo_simitProd.gif");
            this.image2.setUrl("/resources/logo_fcmProd.gif");
        }
        
        if (Constants.AMBIENTE.equals("DESA")) {
            this.image3.setUrl("/resources/logo_simitDesa.gif");
            this.image2.setUrl("/resources/logo_fcmDesa.gif");
        }
        
        if (Constants.AMBIENTE.equals("TEST")) {
            this.image3.setUrl("/resources/logo_simitTest.gif");
            this.image2.setUrl("/resources/logo_fcmTest.gif");
        }
    }

    
    /**
     * <p>Callback method that is called after rendering is completed for
     * this request, if <code>init()</code> was called.  Override this
     * method to release resources acquired in the <code>init()</code>
     * resources that will be needed for event handlers and lifecycle methods.</p>
     *
     * <p>The default implementation does nothing.</p>
     */

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
    
    public String btSalir_action(){
        try {
            
            // TODO: Process the button click action. Return value is a navigation
            // case name where null will return to the same page.
      
            // Expire in five minutes (5 * 60)
            //cookie.setMaxAge( 300 );
            
            // Expire after the browser is closed
            // cookie.setMaxAge( -1 );
            
            getSessionBean1().setUser("");
            getExternalContext().redirect(Constants.darPathApp( this.getFacesContext() )) ;
            
//      } catch (IOException ex) {
        } catch (Exception ex){
            info(ex.getMessage());
        }
        return null;
    }
    
    /*
    public void logoff() {
        var logofftime= new Date();
        logofftime="<font color=green>"+logofftime.getHours()+":"+logofftime .getMinutes()+":"+logofftime.getSeconds()+"</font>";
        SetCookie("lastoff",logofftime,largeExpDate,myDoma in);
    }*/

    /**
     * <p>Callback method that is called after rendering is completed for
     * this request, if <code>init()</code> was called.  Override this
     * method to release resources acquired in the <code>init()</code>
     * resources that will be needed for event handlers and lifecycle methods.</p>
     * 
     * <p>The default implementation does nothing.</p>
     */
    public void destroy() {
    }
}
