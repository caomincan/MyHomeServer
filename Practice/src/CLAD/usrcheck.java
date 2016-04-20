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
 * Servlet implementation class usrcheck
 */
@WebServlet("/usrcheck")
public class usrcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DEFAULT_DBURL="jdbc:mysql://localhost/CLAD";
    private static final String DEFAULT_USR="usradmin";
    private static final String DEFAULT_PSD="admin";
    private String user;          // user name
    private String password;     // password
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public usrcheck() {
        super();
        // TODO Auto-generated constructor stub
       
    }
    public void init(){
    	 this.user=DEFAULT_USR;
         this.password=DEFAULT_PSD;
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
			if(request.getParameter("username")== "" || request.getParameter("psd")== ""){
				request.setAttribute("warning", "Not input right user name and password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				break;
			}
			 String name = request.getParameter("username");
			 String psd  = request.getParameter("psd");
			 // connect to database
				Connection myConn;  // JDBC connection
				Statement mySmt;    // JDBC sql statement
				ResultSet myRs;     // JDBC query result
				try{
					myConn = DriverManager.getConnection(DEFAULT_DBURL,this.user,this.password);
					mySmt  = myConn.createStatement();
					String query = "select ID,usrpsd from users where usrname=\""+name+"\";";
					myRs=mySmt.executeQuery(query);
					String rightpsd = null;
					String userid = null;
					while(myRs.next()){
						rightpsd = myRs.getString("usrpsd");
						userid = myRs.getString("ID");
						//System.out.println(myRs.getString("usrpsd"));
					}
					if(rightpsd == null){
						request.setAttribute("warning", "Not find right match for user name and password");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					    myConn.close();
						break;
					} else{
						if(rightpsd.equals(psd)){
							request.getSession().setAttribute("user", name);
							request.getSession().setAttribute("userid",userid);
							request.getRequestDispatcher("Practice.jsp").forward(request, response);
						} else{
							request.setAttribute("warning", "Not find right match for user name and password");
							request.getRequestDispatcher("login.jsp").forward(request, response);
						}
					}
					myConn.close();
			    } catch(Exception e){
			    	request.setAttribute("warning","Error at Database Connection" );
			    	request.getRequestDispatcher("login.jsp").forward(request, response);
			    }
			 break;
		case"Create User":
			request.getRequestDispatcher("createusr.jsp").forward(request, response);
			break;
		case"Logout":
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("userid");
			request.getRequestDispatcher("Practice.jsp").forward(request, response);
			break;
		}

	}

}
