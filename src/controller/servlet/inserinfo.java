package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.DAO.userinfodao;
import model.pojo.User;

public class inserinfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public inserinfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String aa=null,bb = null, cc = null;
        aa = request.getParameter("user_id");
        bb = request.getParameter("name");
        cc = request.getParameter("password");
        System.out.println(aa);
        User user =new User();
        
        user.setUeser_Id(aa);
        user.setUser_name(bb);
        user.setPassword(cc);
        
        userinfodao xx = new userinfodao();
        xx.inserinfo(user);

        System.out.println("success");
        request.getRequestDispatcher("../web/success_1.jsp").forward(request,response);
	}
	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
