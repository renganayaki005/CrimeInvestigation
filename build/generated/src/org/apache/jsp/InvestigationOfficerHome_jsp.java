package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class InvestigationOfficerHome_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Home</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"NavigationBar.css\">\n");
      out.write("        <style>\n");
      out.write("            .navbar {\n");
      out.write("  overflow: hidden;\n");
      out.write("  background-color: #333;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".navbar a {\n");
      out.write("  float: left;\n");
      out.write("  font-size: 16px;\n");
      out.write("  color: white;\n");
      out.write("  text-align: center;\n");
      out.write("  padding: 14px 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown {\n");
      out.write("  float: left;\n");
      out.write("  overflow: hidden;\n");
      out.write("}\n");
      out.write(".signout{\n");
      out.write("    float: right;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown .dropbtn {\n");
      out.write("  font-size: 16px;  \n");
      out.write("  border: none;\n");
      out.write("  outline: none;\n");
      out.write("  color: white;\n");
      out.write("  padding: 14px 16px;\n");
      out.write("  background-color: inherit;\n");
      out.write("  font-family: inherit;\n");
      out.write("  margin: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".navbar a:hover, .dropdown:hover .dropbtn {\n");
      out.write("  background-color: #111;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content {\n");
      out.write("  display: none;\n");
      out.write("  position: absolute;\n");
      out.write("  background-color: #f9f9f9;\n");
      out.write("  min-width: 160px;\n");
      out.write("  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);\n");
      out.write("  z-index: 1;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content a {\n");
      out.write("  float: none;\n");
      out.write("  color: black;\n");
      out.write("  padding: 12px 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  display: block;\n");
      out.write("  text-align: left;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content a:hover {\n");
      out.write("  background-color: #ddd;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown:hover .dropdown-content {\n");
      out.write("  display: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write("      </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("  <a href=\"InvestigationOfficerHomw.jsp\">Home</a>\n");
      out.write("  <div class=\"dropdown\">\n");
      out.write("    <button class=\"dropbtn\">Case\n");
      out.write("    </button>\n");
      out.write("    <div class=\"dropdown-content\">\n");
      out.write("      <a href=\"#\">View Assigned Case</a>\n");
      out.write("      <a href=\"#\">Update Case</a>\n");
      out.write("    </div>   \n");
      out.write("  </div> \n");
      out.write("  <div class=\"dropdown\">\n");
      out.write("  <button class=\"dropbtn\">Suspect\n");
      out.write("    </button>\n");
      out.write("    <div class=\"dropdown-content\">\n");
      out.write("      <a href=\"#\">Add Suspect</a>\n");
      out.write("      <a href=\"#\">View Suspect</a>\n");
      out.write("    </div>\n");
      out.write("        </div>\n");
      out.write("  <div class=\"dropdown\">\n");
      out.write("  <button class=\"dropbtn\">Evidence\n");
      out.write("    </button>\n");
      out.write("    <div class=\"dropdown-content\">\n");
      out.write("      <a href=\"#\">Add Evidence</a>\n");
      out.write("      <a href=\"#\">View Evidence</a>\n");
      out.write("    </div>\n");
      out.write("        </div>\n");
      out.write("  <div class=\"signout\"><a href=\"signOut.jsp\">Sign out</a></div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        <br/>\n");
      out.write("        <font color=\"white\"><strong>Welcome</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.Id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("!</font>\n");
      out.write("    </body>\n");
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
