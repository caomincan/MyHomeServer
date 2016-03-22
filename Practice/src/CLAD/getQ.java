package CLAD;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class getQ
 */
@WebServlet("/getQ")
public class getQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private Qset myquestion;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getQ() {
        super();
    }
	@Override
    public void init() throws ServletException {
          myquestion = new Qset();
          myquestion.init();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id="0";
		Integer x=0;
		// determine button type
		String cmd=  request.getParameter("bnType");
		try{
		switch(cmd){
		case "Start":  // System.out.println("Start\n");
		                id = "1";
		                break;
		case "Next":   // System.out.println("Next\n");
		                id = request.getParameter("NUM");
		                x = Integer.valueOf(id);
		                x++;
		                if(x<=0) x=1;
		                if(x> myquestion.getSize()) x=myquestion.getSize();
		                id = x.toString();
		                break;
		case "Previous"://System.out.println("Previous\n");
		                id = request.getParameter("NUM");
                        x = Integer.valueOf(id);
                        x--;
                        if(x<=0) x=1;
		                if(x> myquestion.getSize()) x=myquestion.getSize();
                        id = x.toString();
                        break;
        default:       System.out.println(cmd+"\n");
		}
		
		}
		catch(Exception e){
			System.out.println("Didn't get command value\n");
		}
		request.setAttribute("question", myquestion.getQuestion(id));
		request.setAttribute("A", myquestion.getA(id));
		request.setAttribute("B", myquestion.getB(id));
		request.setAttribute("C", myquestion.getC(id));
		request.setAttribute("D", myquestion.getD(id));
		request.setAttribute("id", id);
		request.getRequestDispatcher("Practice.jsp").forward(request, response);
	}

}
