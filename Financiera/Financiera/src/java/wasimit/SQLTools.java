/*
 * SQLTools.java
 *
 * Created on 29 de octubre de 2007, 01:46
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package wasimit;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Administrador
 */
public class SQLTools {
    public static String buildProcedureCall(String packageName, String procedureName, int paramCount) {
        StringBuffer sb = new StringBuffer("{call "+packageName+"."+procedureName+"(");
        for (int n = 1; n <= paramCount; n++) {
            sb.append("?");
            if (n < paramCount) sb.append(",");
        }
        return sb.append(")}").toString();
    }
    
    public static void close(ResultSet rs, Statement s, Connection c) {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (s != null) s.close(); } catch (Exception e) {}
        try { if (c != null) c.close(); } catch (Exception e) {}
    }
}    
