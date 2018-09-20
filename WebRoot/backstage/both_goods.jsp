<%@page import="model.pojo.shangpin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
  <body>
  	<div style="background-color: #245269;">
  		<ul class="nav navbar-nav">
  			<li> <a target="_blank" href="backstage/admin-main.jsp">卖家中心</a></li>
  			<li><a href="web/main.jsp">首页</a></li>
  			<li><a href="">基础设置</a></li>
  			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
        更多 <span class="caret"></span>
      </a>
  				<ul class="dropdown-menu">
  				 <li><a href="#">规则中心</a></li>
       		 <li><a href="#">服务中心</a></li>
       		 <li><a href="#">安全中心</a></li></ul>
  			</li>
  		</ul>
  		  <div class="clearfix"></div>	
  	</div>
  <div class="clearfix"></div>	
  
  
  	<div class="container">
  		
  	<div class="pull-left">
  	<ul class="nav">
  		<li>商品管理</li>
  			<li><a target="_blank" href="backstageServlet?name=both_goods">全部商品</a></li>
  			<li><a target="_blank" href="backstage/shang_goods.jsp">上架商品</a></li>
  			<li><a target="_blank" href="backstageServlet?name=xia_goods">下架商品</a></li>
  			<li><a target="_blank" href="backstageServlet?name=huo_goods">活动商品</a></li>
  		<li>订单管理</li>
  		<li><a target="_blank" href="backstageServlet?name=both_orders">全部订单</a></li>
  		<li><a target="_blank" href="backstageServlet?name=tui_orders">退款订单</a></li>
  		<li>用户管理</li>
  		<li> <a target="_blank" href="backstageServlet?name=both_users">用户列表</a></li>
  		<li><a target="_blank" href="backstage/level_user.jsp">设置用户等级</a></li>
  	</ul>
  	 <div class="clearfix"></div>	
  	</div>
  	
  		<div class="pull-left">
  		<div>
  		<table class="table table-striped">
  		<tbody>  		
  			<tr>
  				<td>SKU</td>
  				<td>名字</td>
  				<td>状态</td>
  				<td>价格</td>
  				<td>库存</td>
  			</tr>
  			<% 
  				if(request.getSession().getAttribute("both_goods_ii")!=null)
  				{
  					int i=(int)request.getSession().getAttribute("both_goods_ii");
  					System.out.println(i);
  					int ss=0;
  			%>
  			<%
  				while(ss<i)
  				{
  					
  				shangpin ass=(shangpin)request.getSession().getAttribute("both_goods_"+ss);
  				System.out.println(ass.getSKU());
  			%>
  			<tr>
  				<td><%=ass.getSKU() %></td>
  				<td><%=ass.getbiaoti() %></td>
  				<td><%=ass.getstate() %></td>
  				<td><%=ass.getjiage()%></td>
  				<td><%=ass.getkucun() %></td>
  			</tr>
  			<%ss++;} %>
  			<%} %>
  			</tbody>
  		</table>
  		</div>
  		
  		<div class="clearfix"></div>
  		</div>
  		</div>
  </body>
</html>