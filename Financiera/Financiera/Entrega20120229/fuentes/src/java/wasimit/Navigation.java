/*
 * Navigation.java
 *
 * Created on 18 de diciembre de 2007, 04:30 PM
 * Copyright DSOFTFIN
 */
package wasimit;

import com.sun.data.provider.impl.CachedRowSetDataProvider;
import com.sun.rave.web.ui.appbase.AbstractFragmentBean;
import com.sun.rave.web.ui.component.MessageGroup;
import com.sun.rave.web.ui.component.StaticText;
import com.sun.rave.web.ui.component.Tree;
import com.sun.rave.web.ui.component.TreeNode;
import java.io.IOException;
import java.util.List;
import javax.faces.FacesException;

/**
 * <p>Fragment bean that corresponds to a similarly named JSP page
 * fragment.  This class contains component definitions (and initialization
 * code) for all components that you have defined on this fragment, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 */
public class Navigation extends AbstractFragmentBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">
    private int __placeholder;
    
    /**
     * <p>Automatically managed component initialization. <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
        menuDataProvider.setCachedRowSet((javax.sql.rowset.CachedRowSet)getValue("#{SessionBean1.menuRowSet}"));
    }

    private Tree displayTree = new Tree();

    public Tree getDisplayTree() {
        return displayTree;
    }

    public void setDisplayTree(Tree t) {
        this.displayTree = t;
    }

    private StaticText staticText1 = new StaticText();

    public StaticText getStaticText1() {
        return staticText1;
    }

    public void setStaticText1(StaticText st) {
        this.staticText1 = st;
    }

    private CachedRowSetDataProvider menuDataProvider = new CachedRowSetDataProvider();

    public CachedRowSetDataProvider getMenuDataProvider() {
        return menuDataProvider;
    }

    public void setMenuDataProvider(CachedRowSetDataProvider crsdp) {
        this.menuDataProvider = crsdp;
    }

    private StaticText version = new StaticText();

    public StaticText getVersion() {
        return version;
    }

    public void setVersion(StaticText st) {
        this.version = st;
    }
    // </editor-fold>
    
    public Navigation() {
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
        this.prerender();
    }
    
        public void prerender() {
        // If the Request Bean's personId is set, then
        // we just came back from the Trip page
        // and had displayed a selected trip.
        // We use the personId later to determine whether
        // to expand a person's node

        //Integer expandedMenuId = getRequestBean1().getMenuId();
        Integer expandedMenuId = null;
        String parmPadreId = (String)
        getExternalContext().getRequestParameterMap().get("p");
        if (parmPadreId != null) 
            expandedMenuId = new Integer(parmPadreId);
        
        try {
            if ( getSessionBean1().getUser().equals(""))
                throw new Exception("Sin usuario");

            version.setText(Constants.VERSION);
            

            // Set up the variables we will need
            menuDataProvider.refresh();
            getSessionBean1().getMenuRowSet().setObject(1, getSessionBean1().getUser());
            Integer currentPersonId = new Integer(-1);
            Integer currentMenuId = new Integer(-1);
            // If nbrChildren is not 0 then this is a
            // postback and we have our tree already
            int nbrChildren = displayTree.getChildCount();

            if (nbrChildren == 0) {
                // List of outer (person) nodes
                List outerChildren = displayTree.getChildren();
                // Erase previous contents
                outerChildren.clear();
                // List of inner (menu) nodes
                List innerChildren = null;
                // Execute the SQL query
                menuDataProvider.refresh();
                // Iterate over the rows of the result set.
                // Every time we encounter a new person, add first level node.
                // Add second level menu nodes to the parent person node.
                boolean hasNext = menuDataProvider.cursorFirst();
                int i=0;
                while (hasNext) {
                    //Integer newPersonId = new Integer(menuDataProvider.getValue("MENUID").toString());
                    Integer newMenuId = new Integer(menuDataProvider.getValue("PADREID").toString());
                    //System.out.println("newPersonId =>"+ newPersonId.toString());
                    //if (!newPersonId.equals(currentPersonId)) {
                    if (!newMenuId.equals(currentMenuId)) {
                        //currentPersonId = newPersonId;
                        currentMenuId = newMenuId;
                        //TreeNode personNode = new TreeNode();
                        TreeNode menuNode = new TreeNode();
                        menuNode.setId("menu" + newMenuId.toString());
                        menuNode.setText(
                                (String)menuDataProvider.getValue(
                                "NAMEPADRE"));
                        // If the request bean passed a person id,
                        // expand that person's node
                        menuNode.setExpanded(newMenuId.equals
                                (expandedMenuId));
                        outerChildren.add(menuNode);
                        innerChildren = menuNode.getChildren();
                    }

                    // Create a new menu node
                    TreeNode optionNode = new TreeNode();
                    optionNode.setId("option" +
                            menuDataProvider.getValue("IDMENU").toString() + newMenuId.toString());
                    optionNode.setText(
                            menuDataProvider.getValue("NAMEMENU").toString());
                    optionNode.setUrl(menuDataProvider.getValue("PAGE").toString()+"?p="+menuDataProvider.getValue("PADREID").toString());
                    innerChildren.add(optionNode);
                    hasNext = menuDataProvider.cursorNext();
                    i++;
                }
                 
            }

        } catch (Exception ex) {
            try {
                getExternalContext().redirect(  Constants.darPathApp ( this.getFacesContext() );
            } catch (IOException error) {
                info("La sesion expiro, favor ingresar ingresar al aplicativo nuevamente");
            }
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
    public void destroy() {
        menuDataProvider.close();
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
}
