package CLAD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class usrcreate
 */
@WebServlet("/usrcreate")
public class usrcreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DEFAULT_DBURL="jdbc:mysql://localhost/CLAD";
    private static final String DEFAULT_USR="usradmin";
    private static final String DEFAULT_PSD="admin";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public usrcreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String bntype = request.getParameter("bnType");
		switch(bntype){
		case"Login":
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		case"Submit":
			 String name = request.getParameter("username");
			 String psd  = request.getParameter("psd");
			 String cfpsd = request.getParameter("cfpsd");
			 String firstname = request.getParameter("firstname");
			 String lastname = request.getParameter("lastname");
			 String tel = request.getParameter("mobile");
			 
			 String warning = "";
			 if(name=="") warning +="The username couldn't be blank<br>";
			 else if(name.length()>10) warning+="The username exceed limits<br>";
			 else if(!name.matches("^[a-zA-Z]+$"))   warning+="The username format is not right<br>";
			 if(psd=="") warning +="The password couldn't be blank<br>";
			 else if(psd.length()> 10) warning+="The password exceed limits<br>";
			 else if(!psd.matches("^[a-zA-Z]\\w{5,10}$")) warning+="The password format is not right,at least 5 characters, start with letter<br>";
			 if(!psd.equals(cfpsd)) warning +="The password do not match<br>";
			 if(firstname == "") warning += "The first name couldn't be blank<br>";
			 if(lastname == "") warning += "The last name couldn't be blank<br>";
			 if(warning.equals("")){
				 // connect to database
					Connection myConn;  // JDBC connection
					Statement mySmt;    // JDBC sql statement
					ResultSet myRs;     // JDBC query result
					try{
						myConn = DriverManager.getConnection(DEFAULT_DBURL,DEFAULT_USR,DEFAULT_PSD);
						mySmt  = myConn.createStatement();
						String query = "select usrname from users where usrname=\""+name+"\";";
						myRs=mySmt.executeQuery(query);
						String empty = null;
						// check username unqiue
						while(myRs.next()){
							empty = myRs.getString("usrname");
						}
						if(empty == null){
							query = "insert into users(usrname,usrpsd) value(\'"+name+"\',\'"+psd+"\');";
							mySmt.execute(query);
							//et id
							query = "select ID from users where usrname=\""+name+"\";";
							myRs=mySmt.executeQuery(query);
							String usrid=null;
							while(myRs.next()){
								usrid = myRs.getString("ID");
							}
							query = "insert into userprofile value("+usrid+",\'"+firstname+"\',\'"+lastname+"\',\'"+tel+"\');";
							mySmt.execute(query);
							// create user view and grant 
							
							request.getRequestDispatcher("login.jsp").forward(request, response);
						} else{
							warning += "The user name is occupied<br>";
							request.setAttribute("warning", warning);
							request.getRequestDispatcher("createusr.jsp").forward(request, response);
						}
						myConn.close();
				    } catch(Exception e){
				    	request.setAttribute("warning","Error at Database Connection" );
				    	request.getRequestDispatcher("createusr.jsp").forward(request, response);
				    }
			 }
			 else{
				 request.setAttribute("warning", warning);
				 request.getRequestDispatcher("createusr.jsp").forward(request, response);
			 }
			break;
		}
	}

}
