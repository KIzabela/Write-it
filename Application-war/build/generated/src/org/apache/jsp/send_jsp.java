package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class send_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\" \"http://www.w3.org/TR/html4/frameset.dtd\">\n");
      out.write("\n");
      out.write("        \n");
      out.write("        ");

            
            SimpleDateFormat formatdaty = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date(); 
     
            String dzis = formatdaty.format(date);
            
            
            Connection conn =null;
            Statement stmt = null; 
             ResultSet rs = null; 
 
 
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/notatnik";
    String username = "root";
    String password = "";
try {
    Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url, username, password);
    stmt = conn.createStatement();
     } catch (SQLException e){
            out.println("Nie polaczyles sie z baza");
        }


    rs = stmt.executeQuery("select idwydarzenia, adres, opis from wydarzeniaoczekujace");
    

    if(rs.first())
  { 
      String id = rs.getString(1);
      int x = Integer.valueOf(id);
      
      String recipientEmail =  rs.getString(2); 
      String content = rs.getString(3); 
      
      stmt.executeUpdate("delete from wydarzeniaoczekujace where idwydarzenia = "+id+" ");
     
              
            
            
      out.write("\n");
      out.write("            \n");
      out.write("        <html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <form action=\"email\" method=\"POST\" name=\"przekierowanie\">\n");
      out.write("<input type=\"hidden\" name=\"email\" value=\"");
      out.print(recipientEmail);
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"zawartosc\" value=\"");
      out.print(content);
      out.write("\">\n");
      out.write("<input type=\"submit\" name=\"submit\" value=\"kliknij tutaj, jeżeli przeglądarka nie przekierowała Cie sam\">\n");
      out.write("</form>\n");
      out.write("<script type='text/javascript'>document.przekierowanie.submit();</script>\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("    ");

         } 
rs.close(); 
stmt.close();
 

            
            
      out.write("\n");
      out.write("    \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
