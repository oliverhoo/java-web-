package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



import model.pojo.shangpin;
import model.service.setlevel;
import model.service.shang_goods;
import model.service.both_backstage_order;
import model.service.both_goods;
import model.service.both_users;
import model.service.huo_goods;
import model.service.*;


@WebServlet("/backstageServlet")
@MultipartConfig(location = "C://Users//暗暗//Documents//Tencent Files//1198605200//FileRecv//Business//WebRoot//images")
public class backstageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    public backstageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String type12=request.getParameter("name");
		System.out.println(type12);
		switch(type12)
		{
		case "shang_goods":
			shang_goods(request, response);
			break;
		case "level":
			level(request, response);
			break;
		case "huo_goods":
			System.out.println("555");
			huo_goods(request,response);
			break;
		case "both_goods":
			both_goods(request,response);
			break;
		case "both_users":
			both_users(request,response);
			break;
		case "both_orders":
			both_orders(request,response);
			break;
		case "xia_goods":
			xia_goods(request,response);
			break;
		case "xiaa_goods":
			xia1_goods(request,response);
			break;
		case "tui_orders":
			tui_orders(request,response);
			break;
		case "tuii_orders":
			tuii_orders(request,response);
			break;
		default:
			System.out.println("错误传参");
			response.sendRedirect("/Business/backstage/error.jsp");
			break;
		}
	}
	
	private void tuii_orders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String[] ss=(String[]) request.getParameterValues("tuikuann");
		tui1_orders we=new tui1_orders();
		int sd=we.main(ss);
		if(sd==1)
		{response.sendRedirect("/Business/backstage/sucess.jsp");}
		else {response.sendRedirect("/Business/backstage/error.jsp");}
	}
	
	private void tui_orders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		tui_orders we=new tui_orders();
		HttpSession session=request.getSession();
		int s=we.main(session);
		System.out.println(s);
		if(s==-1)
		{response.sendRedirect("/Business/backstage/error.jsp");}
		else {
		response.sendRedirect("/Business/backstage/refund_order.jsp");
		}
	}
	
	private void xia1_goods(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String[] ss=(String[]) request.getParameterValues("xiajiaa");
		xia1_goods we=new xia1_goods();
		int sd=we.main(ss);
		if(sd==1)
		{response.sendRedirect("/Business/backstage/sucess.jsp");}
		else {response.sendRedirect("/Business/backstage/error.jsp");}
	}
	
	private void xia_goods(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		xia_goods we=new xia_goods();
		HttpSession session=request.getSession();
		int s=we.main(session);
		System.out.println(s);
		if(s==-1)
		{response.sendRedirect("/Business/backstage/error.jsp");}
		else {
		response.sendRedirect("/Business/backstage/xia_goods.jsp");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private void both_orders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		both_backstage_order we=new both_backstage_order();
		HttpSession session=request.getSession();
		int s=we.main(session);
		if(s==-1)
		{
			response.sendRedirect("/Business/backstage/error.jsp");}
		else {
		response.sendRedirect("/Business/backstage/both_order.jsp");
	}}
	private void both_users(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		both_users we=new both_users();
		HttpSession session=request.getSession();
		int s=we.main(session);
		if(s==-1)
		{
			response.sendRedirect("/Business/backstage/error.jsp");}
		else {
		response.sendRedirect("/Business/backstage/both_user.jsp");
	}}
	private void both_goods(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		both_goods we=new both_goods();
		HttpSession session=request.getSession();
		int s=we.main(session);
		System.out.println(s);
		if(s==-1)
		{response.sendRedirect("/Business/backstage/error.jsp");}
		else {
		response.sendRedirect("/Business/backstage/both_goods.jsp");
		}
	}
	private void huo_goods(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		String biaoti=request.getParameter("biaoti");
		String jiage=request.getParameter("jiage");
		String kucun=request.getParameter("kucun");
		String starttime=request.getParameter("starttime");
		String stoptime=request.getParameter("stoptime");
		Part imgs=request.getPart("baobeitupian");
		Part imgss=request.getPart("baobeitupian");
		System.out.println(kucun);
		shangpin tt=new shangpin(biaoti, jiage, kucun);
		huo_goods we=new huo_goods();
		String zzx=we.main(tt,starttime,stoptime);
		if (zzx.equals("0")){
			 response.sendRedirect("/Business/backstage/error.jsp"); 
		}
		else {
		String[] arr=zzx.split(",");
		System.out.println("arr[0]"+arr[0]);
		System.out.println("arr[1]"+arr[1]);
		imgs.write(arr[0]);
		System.out.println("成功");
		imgss.write(arr[1]);//出现问题
		System.out.println("成功");
		response.sendRedirect("/Business/backstage/succes.jsp"); 
		}
	}
	private void level(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException  {
		String chuji= request.getParameter("chuji");
		String gaoji=request.getParameter("gaoji");
		String VIP=request.getParameter("VIP");
		System.out.println(VIP);
		setlevel a=new setlevel();
		boolean b=a.setlevel1(chuji, gaoji, VIP);
		if (b==true){
				response.sendRedirect("/Business/backstage/succes.jsp");
		}
		else {
			 response.sendRedirect("/Business/backstage/error.jsp"); 
		}
	}
	
	private void shang_goods(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String biaoti=request.getParameter("biaoti");
		String jiage=request.getParameter("jiage");
		String kucun=request.getParameter("kucun");
		System.out.println(kucun);
		Part imgs=request.getPart("baobeitupian");
		Part imgss=request.getPart("xiangxixinxi");
		System.out.println(kucun);
		shangpin tt=new shangpin(biaoti, jiage, kucun);
		System.out.println(kucun);
		shang_goods we=new shang_goods();
		String zzx=we.main(tt);
		System.out.println("145896:"+zzx);
		if (zzx.equals("0")){
			 response.sendRedirect("/Business/backstage/error.jsp"); 
		}
		else {
		String[] arr=zzx.split(",");
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		imgs.write(arr[0]);
		imgss.write(arr[1]);
		response.sendRedirect("/Business/backstage/succes.jsp"); 
		}
	}
}
