package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import model.DAO.DB;
import model.pojo.*;

public class loginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public loginServlet() {
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
	 * The doDelete method of the servlet. <br>
	 *
	 * This method is called when a HTTP delete request is received.
	 * 
	 * @param request the request send by the User to the server
	 * @param response the response send by the server to the User
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the User to the server
	 * @param response the response send by the server to the User
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	doGet(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the User to the server
	 * @param response the response send by the server to the User
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
		System.out.println(action);
		if(request.getParameter("action")!=null)
		{
			if(action.equals("login"))
			{
				System.out.println("呵呵");
				if (CreateUserList()) {
					System.out.println("检查名字");
					CheckName(request, response);
				}
			}
			if(action.equals("register"))
			{
				if (CreateUserList()) {
					register(request, response);
				}	
			}
		}
		
	}
	public boolean CreateUserList()
	//用于向application 中间存在库用户表
	{
		DB dbhelperDb =new DB();
		dbhelperDb.getConn();
		String sqlString ="select * from USER_login";
		dbhelperDb.cPtmt(sqlString);
		ResultSet rSet =dbhelperDb.queryDb();
		ServletContext application =getServletConfig().getServletContext();
		List<User> UserList =(List)application.getAttribute("clist");//在库用户
		if(UserList==null)  
	     {  

	         UserList=new ArrayList(); 
	     	if(rSet==null) {
				System.out.println("表中没有用户");
				return false;
			}
			
			try {
				while (rSet.next()) {
					User User=new User();
					User.setUeser_Id(rSet.getString("USER_id"));;
					User.setUser_name(rSet.getString("name"));
					User.setPassword(rSet.getString("PASSWORD"));
					System.out.println("用户id:"+rSet.getString("USER_id"));
					UserList.add(User);
					
				}
			} catch (Exception e) {
				// TODO: handle exception
				return false;
			}
			application.setAttribute("clist",UserList);
			return true;
			
	     }else {
	    	 System.out.println("3");
			return true;
		}
	}
	private int CheckName(HttpServletRequest request, HttpServletResponse response) //登陆时用来检测账号密码的
	{
		String username=request.getParameter("name");
		String pass=request.getParameter("password");
		String useridString=request.getParameter("id");;

		ServletContext application =getServletConfig().getServletContext();
		HttpSession session = request.getSession();
		//声明application 对象
		if(useridString.trim().length()==0||pass.trim().length()==0)  
	     {  
			request.setAttribute("msg","账号或密码没有填全");   
			try{
				request.getRequestDispatcher("/web/login.jsp").forward(request,response);
	         }catch(Exception e)
	         {
	        	 e.printStackTrace();
	         }
	        return 1;  //数字1 代表账户密码为空 
	     }  
		
		
		//进行判断是否登陆  账号密码是否正确
		User User=new User();
		User.setUeser_Id(useridString);
		User.setPassword(pass);
		User.setUser_name(username);
		
		List<User> users=(List)application.getAttribute("users");//登陆中的用户
		if(users==null)  
	     {  
	         users=new ArrayList(); 
	     } 
		
		List<User> UserList =(List)application.getAttribute("clist");//在库用户
		
		if(UserList==null)  
	     {  
	         UserList=new ArrayList(); 
	     } 
	     //查看当前列表中是否包含当前的登陆用户  
	     if(have(users, User))  
	     {  
	         //设置提示信息  
	         request.setAttribute("msg","该用户已经登陆，请重新登陆");  
	         //转发到login.jsp  
	         try{
	        	 request.getRequestDispatcher("/web/login.jsp").forward(request,response);
	         }catch(Exception e)
	         {
	        	 e.printStackTrace();
	         }
	           
	         return 2;  // 数字2 代表账户密码为空
	     }
	     //查看用户是否在库
	     if(have(UserList,User))
	     {
	    	//将当前登陆用户名加入该用户列表  
		     users.add(User);  
		     //将用户列表存放在application作用域中  
		     application.setAttribute("users",users);   

			request.getSession().setAttribute("user", User);
		     //重定向到主页面  
		     try{
		    	 response.sendRedirect("http://localhost:9999/Business/web/main.jsp?");
		    	 return 1;
	         }catch(Exception e)
	         {
	        	 e.printStackTrace();
	         }
		     return 0;
	     }else {
	    	 request.setAttribute("msg","账号或者密码有错");   
				try{
					request.getRequestDispatcher("/web/login.jsp").forward(request,response);
		         }catch(Exception e)
		         {
		        	 e.printStackTrace();
		         }
				System.out.println("1");
			return 0;
		}
	     
	}
	private int register(HttpServletRequest request, HttpServletResponse response) //注册用的  bug：账户只能为数字
	{
		ServletContext application =getServletConfig().getServletContext();
		HttpSession session = request.getSession();
		List<User> UserList =(List)application.getAttribute("clist");//在库用户
		if(UserList==null)  
	     {  
			UserList=new ArrayList(); 
	     } 
		for(int i=0;i<UserList.size();i++){
		    User n = (User)UserList.get(i);
		    if(n.getUeser_Id().equals(request.getParameter("id")))
		    {
		    	request.setAttribute("msg","该账号已经注册");   
				try{
					request.getRequestDispatcher("/web/login.jsp").forward(request,response);
		         }catch(Exception e)
		         {
		        	 e.printStackTrace();
		         }
				return 0;
		    }
		}
		String useridString=request.getParameter("id");
		String username=request.getParameter("name");
		String pass=request.getParameter("password");
		User User=new User();
		User.setUeser_Id(useridString);;
		User.setUser_name(username);
		User.setPassword(pass);
		
		UserList.add(User);
		application.setAttribute("clist",UserList);
		request.setAttribute("msg","注册成功");   
		
		try{
			request.getRequestDispatcher("/web/login.jsp").forward(request,response);
         }catch(Exception e)
         {
        	 e.printStackTrace();
         }
		return 0;
	}
	public boolean have(List cList,User a) {
		if(cList==null){
			return false;
		}else{
		for(int i=0;i<cList.size();i++){
   		 User n = (User)cList.get(i);
   		 System.out.println("库的id"+n.getUeser_Id()+"传来的id"+a.getUeser_Id());
	   		if(n.getUeser_Id().equals(a.getUeser_Id()))
	   		{return true;}
   	 	}
		return false;
		}
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
