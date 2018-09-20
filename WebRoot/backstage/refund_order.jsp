<%@page import="model.pojo.both_orderss"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
<title>退款订单</title>

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function check()
		{
			alert("54163");
			document.tuii_orders.action="backstageServlet?name=tuii_orders";
		}
	</script>
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
  		<form action="" name="tuii_orders" method="post">
  			<table class="table table-striped" >
  				<tbody>
  					<tr >
  						<td>订单号</td>
  						<td>状态</td>
  						<td>用户姓名</td>
  					</tr>
  					<% 
  						if(request.getSession().getAttribute("tui_orders_ii")!=null)
  						{int i=(int)request.getSession().getAttribute("tui_orders_ii");
  							System.out.println(i);
  							int ss=0;
  							while(ss<i)
  							{both_orderss ass=(both_orderss)request.getSession().getAttribute("tui_orders_"+ss);
  							String a=ass.getorder_id();
  							String b=ass.getname();
  					%>
  					<tr>
  					<td><input name="tuikuann" type="checkbox" value="<%=a %>" /><%=a %></td>
  					<td>未同意退款</td>
  					<td><%=b %> </td>
  					</tr>
  							<%ss++;} %>
  					<%} %>
  				</tbody>
  			</table>
  			<button class="btn btn-default" onclick="check()">同意退款</button>
  			</form>
  		<div class="clearfix"></div>
  		</div>
  		</div>
  </body>
</html>