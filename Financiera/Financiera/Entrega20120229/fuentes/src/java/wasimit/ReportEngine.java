/*
 * ReportEngine.java
 *
 * Created on 8 de noviembre de 2007, 09:40 AM
 */

package wasimit;


import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.TimeZone;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRCsvExporterParameter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;


/**
 *Inicio Parametros
 * @author DSOFTFIN
 * @version
 */
public class ReportEngine extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    
    //http://devzone.skillfusion.com/jasperArticle8.php
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        this.handleSubmit(request, response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        this.handleSubmit(request, response);
    }
    
    protected void handleSubmit(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        
        ServletContext context = this.getServletConfig().getServletContext();
        
        String rptfilename   = request.getParameter("rptfilename");
        
        
        String namefilter    = request.getParameter("NameFilter");
        
        if ( namefilter.equals("CSV") ||  namefilter.equals("CSV1"))
        {
            rptfilename = "csv" + rptfilename;
        }
        
        if ( namefilter.equals("XLS") )
        {
            rptfilename = "xls" + rptfilename;
        }

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd_hhmm");
        String fechahora = formatter.format(new Date());;
        
        String nombre = rptfilename + "_" + fechahora + "." + namefilter;

         if ( namefilter.equals("CSV1"))
            nombre = rptfilename + "_" + fechahora + ".csv";
        
        //PrintWriter out = response.getWriter();
        //out.println("entro a servlet" + rptfilename );
        
        
        
        Connection conn = null;
        try {
            Context c       = new InitialContext();
            DataSource dataSource =(DataSource)c.lookup("java:comp/env/jdbc/dataSource");
            conn = dataSource.getConnection();
                       
            // Adicionar los filtros a la tabla de hash
            HashMap params = new HashMap();
            
            Enumeration nombresParam = request.getParameterNames();
            while(nombresParam.hasMoreElements()) {
                String nombreParam = (String)nombresParam.nextElement();
                String[] valoresParam = request.getParameterValues(nombreParam);                
                String valorParam = valoresParam[0];
                params.put(nombreParam, valorParam);
                
            }

            rptfilename = getServletContext().getRealPath("/repbin") + "/"+ rptfilename + ".jasper";
                      
            JasperPrint jasperprint =
                    JasperFillManager.fillReport( rptfilename, params, conn);
            
            
            if ( namefilter.equals("XLS") ) {
                JRXlsExporter exporter = new JRXlsExporter();

                OutputStream ouputStream = response.getOutputStream();
                response.setContentType("application/xls");
                response.setHeader("Content-Disposition", "inline; filename=\"" + nombre + "\"");
                
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperprint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
                exporter.exportReport();
                
            } else if ( namefilter.equals("PDF") ) {
                // export report to pdf and stream back to browser
                byte[] pdfasbytes = JasperExportManager
                        .exportReportToPdf(jasperprint);
                
                ServletOutputStream outstream = response.getOutputStream();
                response.setContentType("application/pdf");
                response.setContentLength(pdfasbytes.length);
                
                response.setHeader("Content-disposition",
                        "inline; filename=\"" + nombre + "\"");
                outstream.write(pdfasbytes);
                
            } else if ( namefilter.equals("HTML") ) {
                
                JRHtmlExporter exporter = new JRHtmlExporter();
                
                HashMap imagesMap = new HashMap();
                
                request.getSession().setAttribute("IMAGES_MAP", imagesMap);
                request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperprint);
                exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
                exporter.setParameter(JRHtmlExporterParameter.IMAGES_MAP, imagesMap);
                exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "http://"+request.getServerName()+":"+request.getServerPort()+"/cur/servlet/net.sf.jasperreports.j2ee.servlets.ImageServlet?image=" );
                
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperprint);
                exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, response.getWriter());
                
                exporter.exportReport();
                
               
            } else if ( namefilter.equals("CSV") ) {
                
                JRCsvExporter exporter = new JRCsvExporter();
                
                HashMap imagesMap = new HashMap();
                
                request.getSession().setAttribute("IMAGES_MAP", imagesMap);
                request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperprint);

                exporter.setParameter(JRCsvExporterParameter.FIELD_DELIMITER,";");
                exporter.setParameter(JRCsvExporterParameter.RECORD_DELIMITER,"\n");
                exporter.setParameter(JRCsvExporterParameter.JASPER_PRINT,jasperprint);
                exporter.setParameter(JRCsvExporterParameter.OUTPUT_STREAM, response.getOutputStream());
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + nombre + "\"");			
                exporter.exportReport();
                                
            } else if ( namefilter.equals("CSV1") ) {
                
                JRCsvExporter exporter = new JRCsvExporter();
                
                HashMap imagesMap = new HashMap();
                
                request.getSession().setAttribute("IMAGES_MAP", imagesMap);
                request.getSession().setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperprint);

                exporter.setParameter(JRCsvExporterParameter.FIELD_DELIMITER,"\t");
                exporter.setParameter(JRCsvExporterParameter.RECORD_DELIMITER,"\n");
                exporter.setParameter(JRCsvExporterParameter.JASPER_PRINT,jasperprint);
                exporter.setParameter(JRCsvExporterParameter.OUTPUT_STREAM, response.getOutputStream());
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + nombre + "\"");			
                exporter.exportReport();
                                
            }
            
          
       
        
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println("Error en servlet:" + e.getMessage());            
        } finally {
            try {
                if (conn != null)
                    conn.close();
            } catch (Exception sqle) {
            }
        
        }
         
        
        
    }
    
    
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet ReportEngine</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet ReportEngine at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }
       
    
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
