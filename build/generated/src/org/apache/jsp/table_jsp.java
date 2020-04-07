package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class table_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Display Selected HTML Table TR Values In Input Text</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        \n");
      out.write("        <style>\n");
      out.write("            table tr:not(:first-child){\n");
      out.write("                cursor: pointer;transition: all .25s ease-in-out;\n");
      out.write("            }\n");
      out.write("            table tr:not(:first-child):hover{background-color: #ddd;}\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"trial.jsp\">\n");
      out.write("       \n");
      out.write("        First Name:<input type=\"text\" name=\"fname\" id=\"fname\"><br><br>\n");
      out.write("        Last Name:<input type=\"text\" name=\"lname\" id=\"lname\"><br><br>\n");
      out.write("        Age:<input type=\"text\" name=\"age\" id=\"age\"><br><br>\n");
      out.write("        \n");
      out.write("        <table id=\"table\" border=\"1\">\n");
      out.write("            <tr>\n");
      out.write("                <th>First Name</th>\n");
      out.write("                <th>Last Name</th>\n");
      out.write("                <th>Age</th>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                <td>FN1</td>\n");
      out.write("                <td>LN1</td>\n");
      out.write("                <td>10</td>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                <td>FN2</td>\n");
      out.write("                <td>LN2</td>\n");
      out.write("                <td>20</td>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                <td>FN3</td>\n");
      out.write("                <td>LN3</td>\n");
      out.write("                <td>30</td>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                <td>FN4</td>\n");
      out.write("                <td>LN4</td>\n");
      out.write("                <td>40</td>\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                <td>FN5</td>\n");
      out.write("                <td>LN5</td>\n");
      out.write("                <td>50</td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("    \n");
      out.write("                var table = document.getElementById('table');\n");
      out.write("                \n");
      out.write("                for(var i = 1; i < table.rows.length; i++)\n");
      out.write("                {\n");
      out.write("                    table.rows[i].onclick = function()\n");
      out.write("                    {\n");
      out.write("                         //rIndex = this.rowIndex;\n");
      out.write("                         document.getElementById(\"fname\").value = this.cells[0].innerHTML;\n");
      out.write("                         document.getElementById(\"lname\").value = this.cells[1].innerHTML;\n");
      out.write("                         document.getElementById(\"age\").value = this.cells[2].innerHTML;\n");
      out.write("                    };\n");
      out.write("                }\n");
      out.write("    \n");
      out.write("         </script>\n");
      out.write("         <button type=\"submit\" class=\"btn\">Assign</button>\n");
      out.write("        </form>\n");
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
