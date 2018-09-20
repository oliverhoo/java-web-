<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <script language="javascript">
	window.onload=function (){	
	};
		
		
	</script>
	<style type="text/css">
	body
	{
		position:absolute; 
			top:0; 
			left:0; 
			height:100%; 
			width:100%; 
			background-position: center 0; 
			background-repeat: no-repeat; 
			background-attachment:fixed; 
			background-size: cover; 
			-webkit-background-size: cover;/* 兼容Webkit内核浏览器如Chrome和Safari */ 
			-o-background-size: cover;/* 兼容Opera */ 
			zoom: 1; 
			background-color:#7FFFD4
	}
	div.hh
	{
		position:absolute;
		FILTER: dropshadow(color= offx=0, offy=1);
		font-size:15px;
		left:45%;
		top:25%;
	}
	.bb
	{
		position:absolute;
		top:40%;
		left:38%;
		
	}
	.dd
	{
		position:absolute;
		top:60%;
		left:45%;
	}
	
	</style>
  </head>
  
  <body>

<%

		String msg=(String)request.getAttribute("msg");  
		 if(msg==null)  
		 {  
		     msg=""; 
		 }else
		 {
		 	out.print("<script language=Javascript>alert('"+msg+"');</script>");
		 	request.setAttribute("msg","");
		 }
 %>
  <div>
	   <div class="hh"> 
	   			用户登陆
	   </div>
	   <form class="bb" action="/Business/servlet/loginServlet?action=login" method="post">
			账号 :<input type="text" name="id"><br/>
			密&nbsp;&nbsp;&nbsp;码:<input type="password" name="password"><br/>
			名字 :<input type="text" name="name"><br/>
			<input type="submit" name="login1" value="确定">
		</form>
		
	</div>
  </body>
</html>
