package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;

public final class addEvidence_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");

  String caseId="";
  String officerId=(String)session.getAttribute("Id");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add Suspect</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"NavigationBar.css\">\n");
      out.write(" <link rel=\"stylesheet\" type=\"text/css\" href=\"Form.css\">\n");
      out.write("        <script>\n");
      out.write("         window.onload = function(){\n");
      out.write("             //if(document.getElementById(\"suspectIdvalue\").value!=null)\n");
      out.write("                document.getElementById(\"suspectIdValue\").value = \"EVI\"+Math.floor((Math.random() * 10000) + 100);\n");
      out.write("        };  \n");
      out.write("        </script>\n");
      out.write("       <style>\n");
      out.write("           input[type=file]{\n");
      out.write("               width: 95%;\n");
      out.write("               padding: 14px;\n");
      out.write("               margin: 5px 0 22px 0;\n");
      out.write("               display: inline-block;\n");
      out.write("               border: none;\n");
      out.write("           }\n");
      out.write("    .btn {\n");
      out.write("  width: auto;\n");
      out.write("  padding: 10px 18px;\n");
      out.write("  background-color: black;\n");
      out.write("  color: white;\n");
      out.write("  margin: 8px 0;\n");
      out.write("  border: none;\n");
      out.write("  cursor: pointer;\n");
      out.write("  opacity: 0.9; \n");
      out.write("  -webkit-transition: width 2s; \n");
      out.write("  transition: width 2s;\n");
      out.write("}\n");
      out.write("button {\n");
      out.write("  background-color: #4CAF50;\n");
      out.write("  color: white;\n");
      out.write("  padding: 10px 18px;\n");
      out.write("  margin: 8px 0;\n");
      out.write("  border: none;\n");
      out.write("  cursor: pointer;\n");
      out.write("  width: auto;\n");
      out.write("  opacity: 0.9; \n");
      out.write("  -webkit-transition: width 2s; \n");
      out.write("  transition: width 2s;\n");
      out.write("}\n");
      out.write(".btn:hover {\n");
      out.write("  width: 70px;\n");
      out.write("  height: 50px;\n");
      out.write("\n");
      out.write("}\n");
      out.write("  .navbar {\n");
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
      out.write(" </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("  <a href=\"InvestigationOfficerHome.jsp\">Home</a>\n");
      out.write("  <div class=\"dropdown\">\n");
      out.write("    <button class=\"dropbtn\">Case\n");
      out.write("    </button>\n");
      out.write("    <div class=\"dropdown-content\">\n");
      out.write("      <a href=\"viewAssignedCase.jsp\">View Assigned Case</a>\n");
      out.write("      <a href=\"updateCaseStatus.jsp\">Update Case Status</a>\n");
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
      out.write("        </div><br/>\n");
      out.write("<form method=\"post\" action=\"addSuspectinDB.jsp\" name=\"viewAssignedCase\">\n");
      out.write("  <div class=\"container\">\n");
      out.write("     <h1>Add Suspect!</h1>\n");
      out.write("    <label for=\"suspectIdLabel\"><b>Evidence Id</b></label>\n");
      out.write("    <input type=\"text\" placeholder=\"\" name=\"suspectId\" id=\"suspectIdValue\" readonly required>\n");
      out.write("\n");
      out.write("     <label for=\"caseIdLabel\"><b>Case Id</b></label>\n");
      out.write("    ");

   try{
   caseId=request.getParameter("Id");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from case where caseId=(select caseId from caseMapping where officerId='"+officerId+"')");
   ResultSet rs=pstmt.executeQuery();
      out.write("\n");
      out.write("   <select name=\"caseId\" id=\"Id\">\n");
      out.write("              <option value=\"\" disabled=disabled selected>select...</option>\n");
      out.write("              ");
  while(rs.next()){ 
      out.write("\n");
      out.write("              <option>");
      out.print(rs.getString(1));
      out.write("</option>\n");
      out.write("        ");
 
              }             
         
      out.write("\n");
      out.write("    </select>");

   }catch(Exception e)
   {
       System.out.println(e);
   }       

      out.write("\n");
      out.write("    <label for=\"evidenceTypeLabel\"><b>Evidence Type</b></label>\n");
      out.write("    <select name=\"evidenceType\" required>\n");
      out.write("        <option value=\"\" disabled=disabled selected>select...</option>\n");
      out.write("        <option value=\"Logical\">Logical</option>\n");
      out.write("        <option value=\"Physical\">Physical</option>\n");
      out.write("    </select>\n");
      out.write("     \n");
      out.write("    <label for=\"evidenceDescLabel\"><b>Address</b></label>\n");
      out.write("    <textarea name=\"evidenceDesc\" rows=\"10\" cols=\"50\" placeholder=\"Evidence description\" required></textarea><br/>\n");
      out.write("    \n");
      out.write("    <label for=\"evidenceLabel\"><b>Evidence</b></label>\n");
      out.write("    <input type=\"file\" name=\"evidence\" accept=\"image/x-png,image/gif,image/jpeg\" />\n");
      out.write("     \n");
      out.write("    \n");
      out.write("    <button type=\"submit\" class=\"btn\">Add</button>\n");
      out.write("    <button type=\"reset\" class=\"btn\">Clear</button><br/>\n");
      out.write("  </div>\n");
      out.write("</form>\n");
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
