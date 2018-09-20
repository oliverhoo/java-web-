<%@page language="java" import="java.util.*"
		contentType="text/html; charset=utf-8"%> <%@page
		import="model.pojo.Cart"%> <%@page
		import="model.pojo.Item"%> <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'success.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" rel="stylesheet" href="css/style1.css">
<script type="text/javascript">
 		function delcfm(){
 			if(!confirm("确定要删除？"))
 			{
 				window.evevnt.returnValue=false;
 			}
 		}
 	</script>
</head>

<body>
	<h1>我的购物车</h1>
	<a href="index.jsp">首页</a>
	<a href="index.jsp">商品列表</a>
	<hr>
	<div id="shopping">
		<form action="/Business/servlet/BuinessServlet?action=buy&By=1" method="post">
			<table>
				<tr>
					<th>商品名称</th>
					<th>商品单价</th>
					<th>商品价格</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
			<% 
    		//首先判断session 中是否有购物车对象
    		if(request.getSession().getAttribute("cart")!=null)
    		{
    		 %>
				<!-- 循环开始 -->
				<%
    		 	Cart cart =(Cart)request.getSession().getAttribute("cart");
    			HashMap<Item,Integer> goods=cart.getGoods();
    			Set<Item> items =goods.keySet();
    			Iterator<Item> it =items.iterator();
    			
    			while(it.hasNext())
    			{
    				Item i=it.next();
    	
    		  %>
				<tr name="products" id="product_id_1">
					<td class="thumb"><img src="images/<%=i.getPicture()%>"><a
						href=""><%=i.getName() %></a></td>
					<td class="number"><%=i.getPrice() %></td>
					<td class="price" id="price_id_1"><span><%= i.getPrice()*goods.get(i) %></span>
						<input type="hidden" value=""></td>
					<td class="number"><%=goods.get(i) %></td>
					<td class="delete"><a
						href="servlet/BuinessServlet?action=delete&id=<%=i.getId()%>"
						onclick="delcfm()">删除</a></td>
				</tr>
				<%
    		  	}
    		   %>
				<!-- 循环的结束 -->
			</table>
			<div class="total">
				<span id="total">总计：<%=cart.getTotalPrice() %></span>
			</div>
			<%
    		}
    	 %>
    	 <input type="submit" value="结算"/></div>
		</form>
	</div>
</body>
	</html>