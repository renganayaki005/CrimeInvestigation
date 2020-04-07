/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RengaNayagi
 */
@WebServlet(urlPatterns = {"/addReporttoDB"})
@MultipartConfig(maxFileSize = 16177215)
public class addReporttoDB extends HttpServlet {
         @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException 
    {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                 
                try 
                {
                HttpSession session=request.getSession(); 
                Class.forName("oracle.jdbc.OracleDriver");
                Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
                ResultSet rs;
                PreparedStatement statement;
                InputStream inputStream = null;
                String caseId=request.getParameter("caseId");
                String evidenceId=request.getParameter("evidenceId");
                String reportId=request.getParameter("reportId");
                String reportDesc=request.getParameter("reportDesc");
                String History="Added Report "+reportId;
                String Id=(String) session.getAttribute("Id");
                
                
                Part filePart = request.getPart("report");
                
                if (filePart != null) 
                {
                    inputStream = filePart.getInputStream();
                }    
                
                
                
                 String sql = "insert into report(reportId, reportDesc, evidenceId, report) values(?,?,?,?)";
                 statement = con.prepareStatement(sql);
                 statement.setString(1, reportId);
                 statement.setString(2, reportDesc);
                 statement.setString(3, evidenceId);
                 
                 if(inputStream != null) 
                    {
                        statement.setBinaryStream(4, inputStream,(int)filePart.getSize());
                      
                    }
                  PreparedStatement pstmt= con.prepareStatement("insert into caseHistory(caseId, History, updatedDate, Id)values(?,?,SYSDATE,?)");
                  pstmt.setString(1,caseId);
                  pstmt.setString(2, History);
                  pstmt.setString(3, Id);
                  pstmt.executeUpdate();
                   
                    int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                       out.println("<script type=\"text/javascript\">");
                       out.println("alert('Report Updated!');");
                       out.println("</script>");
                       con.close();                         
                       RequestDispatcher rd = request.getRequestDispatcher("updateReport.jsp");
                       rd.include(request, response);
                    }
                    
                }
catch(Exception e)
{
    e.printStackTrace();
}
                       
                 
 }
    
}
