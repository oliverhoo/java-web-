<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inserinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <script type="text/javascript">
function display(clock){
    var now=new Date();   //创建Date对象
    var year=now.getFullYear(); //获取年份
    var month=now.getMonth(); //获取月份
    var date=now.getDate();  //获取日期
    var day=now.getDay();  //获取星期
    var hour=now.getHours(); //获取小时
    var minu=now.getMinutes(); //获取分钟
    var sec=now.getSeconds(); //获取秒钟
    month=month+1;
    var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
    var week=arr_week[day];  //获取中文的星期
    var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间
    clock.innerHTML="当前时间："+time; //显示系统时间
}
window.onload=function(){
    window.setInterval("display(clock)", 1000);
}
</script>
    <div id="clock" ></div>
    <form action="./servlet/inserinfo" method="post">
<table align="center" width="450">
		<tr>
			<td align="center" colspan="2">
				<h2>添加用户信息</h2>
				<hr>
			</td>
		</tr>
		<tr>
			<td align="right">用户id</td>
			<td><input type="text" name="user_id"></td>
		</tr>
		<tr>
			<td align="right">姓名</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td align="right">密码</td>
			<td><input type="text" name="password" /></td>
		</tr>
		 <tr>
			<td align="center" colspan="2"><input type="submit" value="添加">
			</td>
			<a href="./personpage/changeinfo.jsp">更改用户信息</a>
		</tr>
	</table>
</form>
  </body>
</html>
