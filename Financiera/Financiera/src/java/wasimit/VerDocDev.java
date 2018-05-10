/*
 * VerDoc.java
 *
 * Created on 25 de febrero de 2011, 10:31 AM
 */

package wasimit;

import java.io.*;
import java.math.BigDecimal;
import java.net.*;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author user
 * @version
 */
public class VerDocDev extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    
    Connection con = null;
    ResultSet rs = null;
    CallableStatement cs = null;
    String resultado = "";
    int pos = 0;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
            con = Constants.getJdbcDataSource().getConnection();
            cs = con.prepareCall(Constants.verDocDev);
            
            String idDoc   = request.getParameter("IdDoc");
            String idUser = request.getParameter("idUser");
            
            BigDecimal numDoc =  new BigDecimal(idDoc);
            
            // Cargamos los parametros de entrada IN
            
            cs.setBigDecimal("p_id_documento", numDoc);
            cs.setString("p_usuario", idUser);
            
            // Registramos los parametro de salida OUT
            cs.registerOutParameter("p_nombrearchivo", java.sql.Types.CHAR);
            cs.registerOutParameter("p_nombreDocumento", java.sql.Types.CHAR);
            cs.registerOutParameter("p_extensionArchivo", java.sql.Types.CHAR);
            cs.registerOutParameter("p_datosarchivo", java.sql.Types.BLOB);
            cs.registerOutParameter("p_error", java.sql.Types.CHAR);
            
            cs.execute();
            
            String extension = cs.getString("p_extensionArchivo");
            String nomArchivo = cs.getString("p_nombrearchivo");
            Blob archivo = cs.getBlob("p_datosarchivo");
            
            InputStream stream = archivo.getBinaryStream();
            int length = (int) archivo.length();
            int bufferSize = 1024;
          
            
            if (extension.equals("xls") || extension.equals("xlsx") )
                response.setContentType("APPLICATION/VND.MS-EXCEL");
            
            if (extension.equals("doc") || extension.equals("docx") )
                response.setContentType("APPLICATION/msword");
            
            if (extension.equals("jpg") || extension.equals("jpeg") )
                response.setContentType("image/jpeg");
            
            if (extension.equals("pdf") )
                response.setContentType("application/pdf");
            
            if (extension.equals("tif") || extension.equals("tiff") )
                response.setContentType("image/tiff");
            
            if (extension.equals("txt") )
                response.setContentType("text/plain");
            
            if (extension.equals("bmp") )
                response.setContentType("image/bmp");
      
            response.setContentType("application/octet-stream");
      
            response.setHeader("Content-Disposition", "inline; filename=\"" + nomArchivo + "\"");
            //response.setHeader("pragma", "no-cache");
            //response.setHeader("cache-control", "private");
            
            ServletOutputStream out = response.getOutputStream();
            
            byte[] buffer = new byte[bufferSize];
            while ((length = stream.read(buffer)) != -1) {
                 out.write(buffer, 0, length);
            }
            out.close();
            stream.close();
            
            
        } catch (Exception ex) {
            
            PrintWriter out = response.getWriter();
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerDoc</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Error " + ex.getMessage() + "</h1>" );
            out.println("</body>");
            out.println("</html>");
            
            out.close();
            
        }
        finally {
            try {
                if (con != null)
                    con.close();
            } catch (Exception ex) {
            }
        
        }
        
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
