package edm;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class emailsent
 */
@WebServlet(urlPatterns={"/edm/SendEmailServlet"},loadOnStartup=1)
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	java.util.Timer time = null;	
	@Override
	public void init() throws ServletException {
		
		time= new java.util.Timer();
		time.schedule(new java.util.TimerTask(){
			@Override
			public void run() {
				
				/*要DEMO時再把註解打開*/
				EdmMailSend.sendmail();
			}	
		}, new java.util.Date(2017/11/10),1000*60*60*12);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		EdmMain m = new EdmMain();
//        m.start();
		//EdmMailSend ems = new EdmMailSend();
		//EdmMailSend.sendmail();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
