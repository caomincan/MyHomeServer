package little;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class hello extends HttpServlet {
	private static final String dbURL="jdbc:mysql://localhost:3306/cansql";
	private static final String usr="student";
	private static final String psw="";
	
	private static Random rnd;
    private Integer[] var;
    private static Integer MAX_NUM = 20;
    private Connection myConn;
    private Statement myStmt;
    private ResultSet myRs;
	@Override
    public void init() throws ServletException {
		 Integer n = MAX_NUM; 
	     var = new Integer[n];
	     rnd = new Random();
	     for(int i=0;i<n;i++){
	    		var[i]=rnd.nextInt(100);
	    }
    }
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
		//myRs = myStmt.executeQuery("select * from person");
    	PrintWriter out= resp.getWriter();
    	out.println("<html>");
    	out.println("<head>");
    	out.println("<title> My Database Result </title>");
    	out.println("</head>");
    	out.println("<body> <h5>| ID | First Name | Last Name | Date of Birth | </h5> ");
    	try{
    		myConn = DriverManager.getConnection(dbURL,usr,psw);
	    	myStmt = myConn.createStatement();
    		myRs = myStmt.executeQuery("select * from person");
    		out.println("<p>");
    		while(myRs.next()){
    			out.println( myRs.getString("id")+" |"+myRs.getString("firstname")+" |"+
    		    myRs.getString("lastname")+" |" + myRs.getString("dob")+"|<br>");
    		}
    		out.println("</p>");
    	} catch(Exception e){
    		out.println("<p> Unseccessful connect to database </p>");
    	}
    	out.println("</body>");
    	out.println("</html>");
    	try{
    		myConn.close();
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	out.close();
    }
}
