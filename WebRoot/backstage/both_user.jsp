<%@page import="model.pojo.user_inform"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
<title>所有用户</title>

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
  			<li><a target="_blank" href="backstage/huo_goods.jsp">活动商品</a></li>
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
  		<table class="table table-striped">
  				<tbody>
  					<tr>
  						<td>ID</td>
  						<td>姓名</td>
  						<td>京豆</td>
  						<td>总消费额</td>
  						<td>等级</td>
  						<% 
  							if(request.getSession().getAttribute("both_users_ii")!=null)
  							{
  								int i=(int)request.getSession().getAttribute("both_users_ii");
  								int ss=0;
  						%>
  						<%
  								while(ss<i)
  									{user_inform ass=(user_inform)request.getSession().getAttribute("both_users_"+ss);
  									System.out.println(ass.getuser_id());
  						%>
  						<tr>
  							<td><span><%=ass.getuser_id() %></span></td>
  							<td><%=ass.getname() %></td>
  							<td><%=ass.getjingdou() %></td>
  							<td><%=ass.getsunmoney()%></td>
  							<td><%=ass.getrate() %></td>
  						</tr>
  						<%
  						ss++;} %>
  						<%} %>
  					</tr>
  				</tbody>
  			</table>
  		<div class="clearfix"></div>
  		</div>
  		</div>
  </body>
</html>