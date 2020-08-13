import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet{
    public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String name,uname,pword,email,mobile;
        
        uname = req.getParameter("username");
        pword = req.getParameter("pword");
         
        out.println( 
        "<html>\n" + 
        "<body>\n" +
        "<p> Welcome " + name + "</p>\n" +
        "</body>\n" + 
        "</html>");
    }
}