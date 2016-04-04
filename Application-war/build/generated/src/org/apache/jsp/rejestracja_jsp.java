package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class rejestracja_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Write it</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    \t\n");
      out.write("\t<link rel=\"Stylesheet\" type=\"text/css\" href=\"style.css\"  media=\"all\"/> </head>\n");
      out.write("<body>\n");
      out.write("    <div id=\"top\"></br>\n");
      out.write("    Write it...\n");
      out.write("    </div>\n");
      out.write("   \n");
      out.write(" \n");
      out.write("        <div style=\"clear: both\" align=\"center\">\n");
      out.write("          <h1>Rejestracja</h1><br/><br/>\n");
      out.write("        <form action=\"rejestracjadanych.jsp\" method=\"post\">\n");
      out.write("         Login: <input  type=\"text\" name=\"login\" value=\"\" /><br/><br/>\n");
      out.write("         Has?o: <input   type=\"text\" name=\"haslo\" value=\"\" /><br/><br/>\n");
      out.write("         Imie: <input type=\"text\" name=\"imie\" value=\"\" /><br/><br/>\n");
      out.write("         Nazwisko: <input type=\"text\" name=\"nazwisko\" value=\"\" /><br/><br/>\n");
      out.write("         Miejscowosc: <input type=\"text\" name=\"miejscowosc\" value=\"\" /><br/><br/>\n");
      out.write("         E-mail: <input type=\"text\" name=\"email\" value=\"\" /><br/><br/><br/>\n");
      out.write("         \n");
      out.write("       <input type=\"submit\" value=\"Wy?lij\" />\n");
      out.write("       <input type=\"reset\" value=\"Resetuj\" /><br/>\n");
      out.write("        </form></div>\n");
      out.write("         <div id=\"3\" style=\"clear: both\"><a href='index.jsp'>Powrót do strony g?ównej</a></div>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
