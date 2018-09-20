<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changeinfo.jsp' starting page</title>
    
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
    
<center><h2>更改用户信息</h2></center>
<form class="form-horizontal" role="form" action="./servlet/changeinfo" method="post">
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">用户ID</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  name="user_Id"
				   placeholder="请输入user_Id">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label" name="name">姓名</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name="name" 
				   placeholder="请输入name">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label" name="name">密码</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name="password"
				   placeholder="password">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<div class="checkbox">
				<label>
					<input type="checkbox"> 请记住我
				</label>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default" value="更改">更改</button>
		</div>
	</div>
</form>
<center><a href="personpage/inserinfo.jsp">添加用户信息</a></center>
  </body>
</html>
