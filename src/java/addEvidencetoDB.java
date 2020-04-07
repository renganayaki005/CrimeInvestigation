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
@WebServlet(urlPatterns = {"/addEvidencetoDB"})
@MultipartConfig(maxFileSize = 16177215)
public class addEvidencetoDB extends HttpServlet {
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
                String evidenceType=request.getParameter("evidenceType");
                String evidenceDesc=request.getParameter("evidenceDesc");
                String History="Added Evidence "+evidenceId;
                String Id=(String) session.getAttribute("Id");
                Part filePart = request.getPart("evidence");
                
                if (filePart != null) 
                {
                    inputStream = filePart.getInputStream();
                }    
                
                 String sql = "insert into evidence(evidenceId, caseId, evidenceType, evidenceDesc, evidence) values(?,?,?,?,?)";
                 statement = con.prepareStatement(sql);
                 statement.setString(1, evidenceId);
                 statement.setString(2,caseId);
                 statement.setString(3,evidenceType);
                 statement.setString(4,evidenceDesc);
                 if(inputStream != null) 
                    {
                        statement.setBinaryStream(5, inputStream,(int)filePart.getSize());
                      
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
                       out.println("alert('Evidence Added!');");
                       out.println("</script>");
                       con.close();                         
                       RequestDispatcher rd = request.getRequestDispatcher("addEvidence.jsp");
                       rd.include(request, response);
                    }
                    
                }
catch(Exception e)
{
    e.printStackTrace();
}
                       
                 
 }
    
}


