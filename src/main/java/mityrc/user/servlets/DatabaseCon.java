package mityrc.user.servlets;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
@WebServlet("/DatabaseCon")
public class DatabaseCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Connection initialiseDB() throws SQLException, ClassNotFoundException { 
	    String url = "jdbc:mysql://localhost:3306/";  
	    String dbname = "wtproj"; 
	    String username = "root"; 
	    String password = ""; 
		    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection(url + dbname, username, password); 
	    return con; 
	}
}
