package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signIn_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Sign in</title>\n");
      out.write("        <style>\n");
      out.write("            .btn {\n");
      out.write("  width: auto;\n");
      out.write("  padding: 10px 18px;\n");
      out.write("  background-color: #f44336;\n");
      out.write("  color: white;\n");
      out.write("  margin: 8px 0;\n");
      out.write("  border: none;\n");
      out.write("  cursor: pointer;\n");
      out.write("  opacity: 0.9; \n");
      out.write("  -webkit-transition: width 2s; \n");
      out.write("  transition: width 2s;\n");
      out.write("}\n");
      out.write("        </style>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"NavigationBar.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"Form.css\">\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("       function check()\n");
      out.write("        {\n");
      out.write("        var xmlhttp = new XMLHttpRequest();\n");
      out.write("         \n");
      out.write("        var uId= document.signIn.uId.value;\n");
      out.write("        var url= \"IdCheck.jsp?uId=\" + uId;\n");
      out.write("       if(document.signIn.uId.value!=\"\"){\n");
      out.write("        xmlhttp.onreadystatechange = function(){\n");
      out.write("               \n");
      out.write("          if(xmlhttp.readyState == 4 && xmlhttp.status == 200){\n");
      out.write("              \n");
      out.write("                document.getElementById(\"Idfield\").innerHTML=xmlhttp.responseText;\n");
      out.write("                \n");
      out.write("        }\n");
      out.write("      };\n");
      out.write("      try{\n");
      out.write("      xmlhttp.open(\"GET\",url,true);\n");
      out.write("      xmlhttp.send();\n");
      out.write("         }catch(e){\n");
      out.write("                alert(\"Server failed to connect\");\n");
      out.write("            }\n");
      out.write("    }\n");
      out.write("        }\n");
      out.write("</script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <ul>\n");
      out.write("            <li><a class=\"active\" href=\"Home.jsp\">Home</a></li>\n");
      out.write("            <li><a href=\"#news\">News</a></li>\n");
      out.write("            <li><a href=\"#contact\">Contact</a></li>\n");
      out.write("            <li><a href=\"#about\">About</a></li>\n");
      out.write("            <li><a href=\"signIn.jsp\">Sign in</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <form action=\"signInCheck.jsp\" method=\"post\" name=\"signIn\" onsubmit=\"return validate()\">\n");
      out.write("  <div class=\"imgcontainer\">\n");
      out.write("       <img src=\"avatar.png\" alt=\"Avatar\" class=\"avatar\">\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <div class=\"container\">\n");
      out.write("    <label for=\"uname\"><b>User Id</b></label>\n");
      out.write("    <input type=\"text\" placeholder=\"Enter User Id\" name=\"uId\" onblur=\"check()\">\n");
      out.write("    <span id=\"Idfield\" style=\"color:red\"></span><br/>\n");
      out.write("\n");
      out.write("    <label for=\"psw\"><b>Password</b></label>\n");
      out.write("    <input type=\"password\" placeholder=\"Enter Password\" name=\"password\" required>\n");
      out.write("        \n");
      out.write("    <button type=\"submit\">Login</button>\n");
      out.write("    <button type=\"reset\" class=\"btn\">Clear</button><br/>\n");
      out.write("    <label>\n");
      out.write("      <input type=\"checkbox\" checked=\"checked\" name=\"remember\"> Remember me\n");
      out.write("    </label>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"container\" style=\"background-color:#f1f1f1\">\n");
      out.write("    <span class=\"psw\">Forgot <a href=\"#\">password?</a></span>\n");
      out.write("    <br/>\n");
      out.write("  </div>\n");
      out.write("</form>\n");
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
