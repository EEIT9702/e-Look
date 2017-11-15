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
		//System.out.println(new java.util.Date(1510885390824L));
		time= new java.util.Timer();
		time.scheduleAtFixedRate(new java.util.TimerTask(){
			@Override
			public void run() {
				
				/*要DEMO時再把註解打開*/
				EdmMailSend2.sendmail();
			}	
			//1510885390824L
		}, new java.util.Date("2017/11/12"),1000*60*60*24*3);// 11/17 10:20
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
