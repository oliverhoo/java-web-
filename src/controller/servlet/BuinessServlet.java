package controller.servlet;

import java.awt.RadialGradientPaint;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import model.DAO.DB;
import model.DAO.ItemsDAO;
import model.pojo.Cart;
import model.pojo.Item;
import model.pojo.User;

public class BuinessServlet extends HttpServlet {
	DB dbhelp=new DB();
	ItemsDAO idao=new ItemsDAO();
	/**
	 * Constructor of the object.
	 */
	public BuinessServlet() {
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
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
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
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		String actionString=request.getParameter("action");
		if(actionString.equals("classify"))
		//按等级进行跳转
		{
			if(type.equals("1"))//type是级数
			{
				ArrayList<Item> itemlist =getArraylist("type1",id, request, response);
				request.getSession().setAttribute("typeitemlist", itemlist);
				request.getRequestDispatcher("/web/showBy.jsp").forward(request, response);
			}else if(type.equals("2"))
			{
				ArrayList<Item> itemlist =getArraylist("type2", id,request, response);
				request.getSession().setAttribute("typeitemlist", itemlist);
				request.getRequestDispatcher("/web/showBy.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/web/failure_1.jsp").forward(request, response);
			}
		}
		if (actionString.equals("add")) 
		{//如果是添加商品进购物车
			if (addToCart(request,response)) 
			{
				request.getRequestDispatcher("/web/success.jsp").forward(request, response);
			}else 
			{
				request.getRequestDispatcher("/web/failure.jsp").forward(request, response);
			}
		}
		if (actionString.equals("show"))//显示购物车
		{
			request.getRequestDispatcher("/web/cart.jsp").forward(request, response);
		}
		if (actionString.equals("delete"))//如果是执行删除购物车中的商品 
		{
			
			if (deleteFromCart(request,response)) 
			{
				request.getRequestDispatcher("/web/cart.jsp").forward(request, response);
			}
			else 
			{
				request.getRequestDispatcher("/web/cart.jsp").forward(request,response);
			}
		}
		if(actionString.equals("buy"))
		{
			String by=null;
			by=request.getParameter("By");
			if(by!=null && by.equals("1"))//表示购物车结算
			{
				User u=(User)request.getSession().getAttribute("user");
				Cart cart=(Cart)request.getSession().getAttribute("cart");
				if(idao.CreateOder(cart,u.getUeser_Id()))
				{
					request.getSession().setAttribute("cart", null);
					request.getRequestDispatcher("/web/success_1.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/web/failure_1.jsp").forward(request, response);
				}
			}else {
				
				if(buyItem(request, response))
				{
					
		
					request.getRequestDispatcher("/web/success_1.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/web/failure_1.jsp").forward(request, response);
				}
			}
			
		}
		if(actionString.equals("select"))
		{
			String keyString=java.net.URLDecoder.decode(request.getParameter("keyword"),"UTF-8");
			//encode解码 容器自动解除了一次
			//容器默认解码时采用的编码是容器的默认编码，可能是UTF-8，GBK，也可能是其他编码方式。
			//这与你的应用的编码方式未必会一致。所以你直接获取的话可能会出现乱码。
			selectitem(keyString, request, response);
			request.getRequestDispatcher("/web/selectShow.jsp").forward(request, response);
		}
		
	}
	public ArrayList<Item> getArraylist(String type,String id,HttpServletRequest request, HttpServletResponse response)
	//将相应分类的商品以array list形式装填进session里面
	//这个type 是说变量是type1 还是type2
	{
		ArrayList<Item> itemlist =new ArrayList<Item>();
		String idString=null;
		String idString2=null;
		String idString3=null;
		String sqlString=null;
		dbhelp.getConn();
		if(type.equals("type1"))
		{
			idString=id.substring(0, 1);
			sqlString ="select * from goods where type1=?";
			dbhelp.cPtmt(sqlString,idString);
		}else if(type.equals("type2"))
		{
			idString=id.substring(0, 1);
			idString2=id.substring(1, 2);
			sqlString ="select * from goods where type1=? and type2=?";
			dbhelp.cPtmt(sqlString,idString,idString2);
		}	
		/*else if(type.equals("type3"))
		{
			idString=id.substring(0, 1);
			idString2=id.substring(1, 2);
			idString3=id.substring(2, 4);
			sqlString ="select * from Items where type1=? and type2=? and type3=?";
			dbhelp.cPtmt(sqlString,idString,idString2,idString3);
		}*/
			else {
			System.out.println("type错误");
		}
		ResultSet rs =dbhelp.queryDb();
		if(rs==null)
		{
			System.out.println("没有查到结果");
		}
		try {
			while (rs.next()) {
				int id1=rs.getInt("sku");
				int t1=rs.getInt("type1");
				int t2 =rs.getInt("type2");
				String nam =rs.getString("name");
				int p =rs.getInt("money");
				int nu=rs.getInt("stock");
				String picString =rs.getString("picture");
				int state=rs.getInt("state");
				
				Item item =new Item(t1,t2,id1,state,nam,p,nu,picString);
				itemlist.add(item);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return itemlist;
	}
	private boolean buyItem(HttpServletRequest request,HttpServletResponse response)
	//立即购买
	{
		User nowUser =(User)request.getSession().getAttribute("user");
		String userId=nowUser.getUeser_Id();
		String idString =request.getParameter("id");//商品的id
		String num=request.getParameter("num");//商品的数量
		Item item =idao.getItemById(Integer.parseInt(idString));
		Cart cart =new Cart();
		cart.addGoodsInCart(item, Integer.parseInt(num));
		idao.CreateOder(cart, userId);
		return true;
	}
	private boolean addToCart(HttpServletRequest request,HttpServletResponse response)
	{
	//添加商品进购物车

		String id= request.getParameter("id");
		String number =request.getParameter("num");
		Item item =idao.getItemById(Integer.parseInt(id));
		
		//是否是第一次给购物车添加商品，需要给session中创建一个新的购物车
		if(request.getSession().getAttribute("cart")==null)
		{
			Cart cart =new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		//获取session里面的cart 然后进行赋值
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		if (cart.addGoodsInCart(item, Integer.parseInt(number))) {
			return true;
		}
		else {
			return false;
		}
	}
	
	//从购物车中删除商品
	private boolean deleteFromCart(HttpServletRequest request,HttpServletResponse response)
	{
		String id =request.getParameter("id");
		//获取session里面的cart
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		Item item =idao.getItemById(Integer.parseInt(id));
		//移除商品
		if (cart.removeGoodsFromCart(item)) {
			System.out.println("成功删除");
			return true;
		}
		else {
			return false;
		}
	}
	
	public void selectitem(String key,HttpServletRequest request,HttpServletResponse response)
	
	//查找搜索的内容
	//传入关键字 对keywords 表进行对比
	{
		dbhelp.getConn();
		
		String sql="select * from keywords";
		dbhelp.cPtmt(sql);
		ResultSet rs=dbhelp.queryDb();
		String idString=null;
		try {
			while(rs.next())
			{
				String kString=rs.getString("keyword");
				idString =rs.getString("id");
				String[] keylist = kString.split("\\|");
				//存关键词
				for(int i=0;i<keylist.length;i++)
				{
					if(keylist[i].equals(key))
					{
						ArrayList<Item> itemlist =getArraylist("type2",idString,request, response);
						//搜索出来的所有商品 type2 是第二级 
						
						if(itemlist!=null)
						{
							
							if(request.getSession().getAttribute("skey")!=null)
							{
								ArrayList<Item> tt =(ArrayList<Item>)request.getSession().getAttribute("skey");
								//取已经存入的关键词集合
								itemlist.addAll(tt);
							}
							request.getSession().setAttribute("skey", itemlist);
							
							//所有搜索出来的商品存进session skey 里面
						}
						break;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("selectitem出错");
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
