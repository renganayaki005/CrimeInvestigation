package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;

public final class tiral_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");

  String caseId="";
  String caseType="";
  String caseDesc="";
  String officerId="";
  String name="";
  String email="";
  String phoneNo="";
  String agencyName="";
  String deptId="";
  String responsibility="";

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Map Case</title>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("function view(){\n");
      out.write("var Id=document.getElementById(\"Id\").value;\n");
      out.write("var assignId=document.getElementById(\"assignId\").value;\n");
      out.write("window.location.replace(\"trial.jsp?Id=\"+Id+\"&assignId=\"+assignId);\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("function resetValues()\n");
      out.write("    {\n");
      out.write("        window.location.replace(\"mapCase.jsp\");\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("        <style>\n");
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
      out.write(" <link rel=\"stylesheet\" type=\"text/css\" href=\"NavigationBar.css\">\n");
      out.write(" <link rel=\"stylesheet\" type=\"text/css\" href=\"Form.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("  <a href=\"adminHome.jsp\">Home</a>\n");
      out.write("  <div class=\"dropdown\">\n");
      out.write("    <button class=\"dropbtn\">Manage Case\n");
      out.write("    </button>\n");
      out.write("    <div class=\"dropdown-content\">\n");
      out.write("      <a href=\"addCase.jsp\">Add Case</a>\n");
      out.write("      <a href=\"trackCase.jsp\">Track Case</a>\n");
      out.write("      <a href=\"mapCase\">Map Case</a>\n");
      out.write("    </div>   \n");
      out.write("  </div> \n");
      out.write("  <div class=\"dropdown\">\n");
      out.write("  <button class=\"dropbtn\">Manage Officer\n");
      out.write("    </button>\n");
      out.write("    <div class=\"dropdown-content\">\n");
      out.write("      <a href=\"addOfficer.jsp\">Add Officer</a>\n");
      out.write("      <a href=\"removeOfficer.jsp\">Remove Officer</a>\n");
      out.write("    </div>\n");
      out.write("        </div>\n");
      out.write("  <div class=\"signout\"><a href=\"signOut.jsp\">Sign out</a></div>\n");
      out.write("</div> <br/>\n");
      out.write("<form method=\"post\" action=\"mapCaseinDB.jsp\" name=\"mapCase\">\n");
      out.write("  <div class=\"container\">\n");
      out.write("     <h1>Map Case!</h1>\n");
      out.write("    <label for=\"caseIdLabel\"><b>Case Id</b></label>\n");
      out.write("    ");

   try{
   caseId=request.getParameter("Id");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from case where status='Registered'");
   ResultSet rs=pstmt.executeQuery();
      out.write("\n");
      out.write("   <select name=\"caseId\" id=\"Id\" onchange=\"view(this)\">\n");
      out.write("       ");

          if(caseId!=null&&caseId!="")
          {
              
      out.write("\n");
      out.write("              <option value=\"\" disabled=disabled>select...</option>\n");
      out.write("              <option value=\"");
      out.print(caseId);
      out.write("\" selected>");
      out.print(caseId);
      out.write("</option>\n");
      out.write("              ");
  while(rs.next()){ 
                 if(!rs.getString(1).equals(caseId)){
              
      out.write("\n");
      out.write("              <option>");
      out.print(rs.getString(1));
      out.write("</option>\n");
      out.write("        ");
 }
            }
          }
          else
          {
       
      out.write("\n");
      out.write("        <option value=\"\" disabled=disabled selected>select...</option>\n");
      out.write("        ");
  while(rs.next()){ 
      out.write("\n");
      out.write("            <option>");
      out.print(rs.getString(1));
      out.write("</option>\n");
      out.write("        ");
 }
          }
        
      out.write("\n");
      out.write("    </select>");

   }catch(Exception e)
   {
       System.out.println(e);
   }       

      out.write("\n");
      out.write("\n");
      out.write("    <label for=\"caseTypeLabel\"><b>Case type</b></label>\n");
      out.write("    \n");
      out.write(" ");

   try{
    Class.forName("oracle.jdbc.driver.OracleDriver");     
    Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from case where caseId='"+caseId+"'");
    if(rs.next()){
       caseType=rs.getString("caseType");
       caseDesc=rs.getString("caseDesc");
    }
     }catch(Exception e)
   {
       System.out.println(e);
   }  
   
      out.write("\n");
      out.write("   <input type=\"text\" value=\"");
      out.print(caseType);
      out.write("\" name=\"caseType\"/>\n");
      out.write("   \n");
      out.write("    <label for=\"caseDescLabel\"><b>Case description</b></label>\n");
      out.write("    <textarea name=\"caseDesc\" rows=\"10\" cols=\"50\">");
      out.print(caseDesc);
      out.write("</textarea><br/>\n");
      out.write("    \n");
      out.write("    <label for=\"officerIdLabel\"><b>officer Id</b></label>\n");
      out.write("    ");

   try{
   officerId=request.getParameter("assignId");
   
      out.write("\n");
      out.write("   <select name=\"officerId\" Id=\"assignId\" onchange=\"view(this)\">\n");
      out.write("       ");

          if(officerId!=""&&officerId!=null)
          {
              
      out.write("\n");
      out.write("              <option value=\"\" disabled=disabled>select...</option>\n");
      out.write("              <option value=\"");
      out.print(officerId);
      out.write("\" selected>");
      out.print(officerId);
      out.write("</option>\n");
      out.write("              <option>value 1</option>\n");
      out.write("              <option>value 2</option>\n");
      out.write("        ");
 }
          else
          {
       
      out.write("\n");
      out.write("        <option value=\"\" disabled=disabled selected>select...</option>\n");
      out.write("         <option>value 1</option>\n");
      out.write("          <option>value 2</option>\n");
      out.write("        ");
 
          }
        
      out.write("\n");
      out.write("    </select>");

   }catch(Exception e)
   {
       System.out.println(e);
   }       

      out.write("\n");
      out.write("\n");
      out.write("   <label for=\"nameLabel\"><b>Name</b></label>\n");
      out.write("   <input type=\"text\" value=\"somevalue\" name=\"name\"/>\n");
      out.write("     \n");
      out.write("    <label for=\"emailLabel\"><b>Email</b></label>\n");
      out.write("    <input type=\"text\" name=\"email\" value=\"somevalue\" readonly>\n");
      out.write("   \n");
      out.write("    <button type=\"submit\" class=\"btn\">Assign</button>\n");
      out.write("    <button type=\"reset\" class=\"btn\" onclick=\"return resetValues()\">Clear</button><br/>\n");
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
