create or replace and compile java source named shell as
import java.io.*;
public class Shell
{
  public static void entry()
  {
  }
  
  public static String Run(String command)
  {
   try
      {
       Runtime rt = java.lang.Runtime.getRuntime();
       Process p = rt.exec(command);
       p.waitFor();
       int r = p.exitValue();
       
       if (r == 0) 
          return "0:" + command;
       else
          return "" + r + "   :" +  command;   
      }
   catch(Exception e)
   {
    return "999:" + e.getMessage();
   }
  }
}
/

