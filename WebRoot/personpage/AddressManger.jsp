<%@page import="model.DAO.orderdao"%>
<%@page import="model.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddressManger.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <%
 User user=new User();
 user=(User)request.getSession().getAttribute("user");
 String user_id=user.getUeser_Id();
 orderdao odao =new orderdao();
 String [] allAdress=odao.getAlladdress(user_id);
  %>
  <body>
<h1>用户的收货地址</h1>
<div>
<table border="0">
  <tr>
    <th>收货地址一：</th>
    <th><%=allAdress[0] %></th>
  </tr>
  <tr>
    <td>收货地址二：</td>
    <td><%=allAdress[1] %></td>
  </tr>
  <tr>
    <th>收货地址三：</th>
    <th><%=allAdress[2]%></th>
  </tr>
    <tr>
    <th>收货地址四：</th>
    <th><%=allAdress[3] %></th>
  </tr>
    <tr>
    <th>收货地址五：</th>
    <th><%=allAdress[4] %></th>
  </tr>
    <tr>
    <th>收货地址六：</th>
    <th><%=allAdress[5] %></th>
  </tr>
</table>
</div>

<div>
<h2>修改收获地址</h2>
<form action="./servlet/addressServlet" method="post">
地址编号: <input type="text" name="addressid" value="1"><br>
地址内容: <input type="text" name="addressname" ><br>
<input type="submit" value="提交">
</div>
</form>

  </body>
</html>
