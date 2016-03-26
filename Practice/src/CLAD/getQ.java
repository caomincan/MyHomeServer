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
    private static final String USRANS ="                                        ";
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
		char ans[];
		if(cmd.equals("Start")) {
			id ="1";
			ans = USRANS.toCharArray();
			request.getSession().setAttribute("ans",USRANS);
			request.getSession().setAttribute("right", myquestion.getAnswer());
		} else{
		    id = request.getParameter("NUM");
            x = Integer.valueOf(id);
            ans = ((String)request.getSession().getAttribute("ans")).toCharArray();
            if(request.getParameter("Usrans")!=null) {
			String tmp=(String) request.getParameter("Usrans");	
			// save current value
		    ans[x-1]=tmp.charAt(0);
            }
		    // get next question content
		    if(cmd.equals("Next")){
		    	if(x<myquestion.getSize()) x++;
		    } else if (cmd.equals("Previous")) {
		    	if(x>1) x--;
		    }
		    id = x.toString();
		}
		// store answer
		request.getSession().setAttribute("ans", String.valueOf(ans));
		if(cmd.equals("Submit")) {
			System.out.println("Submit");
			request.getRequestDispatcher("result.jsp").forward(request, response);
			return;
		}
		request.setAttribute("question", myquestion.getQuestion(id));
		request.setAttribute("A", myquestion.getA(id));
		request.setAttribute("B", myquestion.getB(id));
		request.setAttribute("C", myquestion.getC(id));
		request.setAttribute("D", myquestion.getD(id));
		request.setAttribute("id", id);
		request.setAttribute("size", String.valueOf(myquestion.getSize()));
		request.getRequestDispatcher("Practice.jsp").forward(request, response);
	}

}
