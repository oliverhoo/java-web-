<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
	<title>上架商品</title>

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script> 
	function check()
	{
		var biaoti=document.shang_goods.biaoti.value;
		var jiage=document.shang_goods.jiage.value;
		var kucun=document.shang_goods.kucun.value;
		document.shang_goods.action="backstageServlet?name=shang_goods&biaoti="+biaoti+"&jiange="+jiage+"&kucun="+kucun;
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
  		<div>
  			<center>发布商品</center>
  			<form  name="shang_goods" action="" method="post" enctype="multipart/form-data">
  				<p>标题：<input class="form-control" type="text" name="biaoti"><br /></p>
  				<p>价格：<input class="form-control" type="text" name="jiage"><br /></p>
  				<p>库存：<input class="form-control" type="text" name="kucun"><br /></p>
  				<p>宝贝图片：<input class="form-control" type="file" multiple="multiple"  name="baobeitupian"><br /></p>
  				<p>详细信息：<input class="form-control" type="file" multiple="multiple" name="xiangxixinxi"><br /></p>
  				<p><center><button class="btn btn-default" onclick="check()">发布商品</button></center></p>
  			</form>
  		</div>
  		<div class="clearfix"></div>
  		</div>
  		</div>
  </body>
</html>