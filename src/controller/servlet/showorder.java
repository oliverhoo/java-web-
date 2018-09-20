package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.pojo.User;
import model.pojo.showorders;
import model.service.both_backstage_order;

public class showorder extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public showorder() {
		super();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		showorders we=new showorders();
		HttpSession session=request.getSession();
  		User user =new User();
  		user=(User)request.getSession().getAttribute("user");
  		String userId=user.getUeser_Id();
		int s=we.main(session,userId);
		if(s==-1)
		{
			response.sendRedirect("/Business/web/failure_1.jsp");}
		else {
		response.sendRedirect("/Business/personpage/showorder.jsp");
	}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
