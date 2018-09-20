<%@page import="model.pojo.both_orderss"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="model.pojo.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showorder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  		<div>
  		<%

  		if(request.getSession().getAttribute("ss_both_orders_ii")!=null)
		{
				int i=(int)request.getSession().getAttribute("ss_both_orders_ii");
				int ss=0; %>
		<%
  				while(ss<i)
  					{both_orderss ass=(both_orderss)request.getSession().getAttribute("ss_both_orders_"+ss);
  					String aa=ass.getSKU_id();
  					String bb=ass.getSKU_number();
  					String cc=ass.getSKU_name();
  					String dd=ass.getSKU_MONEY();
  					String order_id=ass.getorder_id();
  					String name=ass.getname();
  					String order_sate=ass.getorder_sate();
  					String money=ass.getSUN_MONEY();
  					String[] aaa=aa.split(",");
  					String[] bbb=bb.split(",");
  					String[] ccc=cc.split(",");
  					String[] ddd=dd.split(",");					
  		%>
  		<table class="table">
  			<tr>
  				<td>订单号:<%=order_id %></td>
  				<td>姓名：<%=name %></td>
  				<td>总金额：<%=money %></td>
  				<td>状态:<%=order_sate %></td>
  			</tr>
  			<tr>
  			<td>SKU</td>
  			<td>图片</td>
  			<td>名字</td>
  			<td>价格</td>
  			<td>单位</td>
  			</tr>
  			<% for(int tt=0;tt<aaa.length;tt++){%>
  			<tr>
  				<td><%=aaa[tt] %></td>
  				<td><img src="images/<%=aa %>.jpg" /></td>
  				<td><%=ccc[tt] %></td>
  				<td><%=ddd[tt] %></td>
  				<td><%=bbb[tt] %></td>
  			</tr>
  			<%} %>
  		</table>
  		<%ss++;} %>
  		<%} %>
  		</div>
  </body>
</html>
