<%@page import="model.pojo.Item"%>
<%@page import="model.DAO.ItemsDAO"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
//加入购物车的跳转
    	function selflog_show(id)
    	{
    		var num=document.getElementById("number").value;
    		window.open("servlet/BuinessServlet?id="+id+"&num="+num+"&action=add"); 
      }
         function selflog_buy(id)
    	{
    	alert("dsg");
    		var num=document.getElementById("number").value;
    		
    		window.open("servlet/BuinessServlet?id="+id+"&num="+num+"&action=buy"); 
      }
      //添加数量的js
    	function add()
    	{	 
    		var num=parseInt(document.getElementById("number").value);
    		if(num<100)
    		{
    			document.getElementById("number").value=++num;
    		}
    	}
    	//减少数量的Js
    	function sub()
    	{
    	
    		var num=parseInt(document.getElementById("number").value);
    		
    		if(num>1)
    		{
    			document.getElementById("number").value=--num;
    		}
    	}
    </script>
    <style type="text/css">
	   hr{
	     
	     border-color:FF7F00; 
	   }
	   
	   div{
	      float:left;
	      margin-left: 30px;
	      margin-right:30px;
	      margin-top: 5px;
	      margin-bottom: 5px;
	     
	   }
	   div dd{
	      margin:0px;
	      font-size:10pt;
	   }
	   div dd.dd_name
	   {
	      color:blue;
	   }
	   div dd.dd_city
	   {
	      color:#000;
	   }
	   div #cart
	   {
	     margin:0px auto;
	     text-align:right; 
	   }
	   span{
	     padding:0 2px;border:1px #c0c0c0 solid;cursor:pointer;
	   }
	   a{
	      text-decoration: none; 
	   }
	</style>
  </head>
  
  <body>
    <h1>商品详情</h1>
   
    
    
    
    
    <a href="index.jsp">首页</a><a href="index.jsp">商品列表</a>
    <hr>
    <center>
    	<table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
    		<tr>
    		<!-- 商品详情 -->
    		<%
    			ItemsDAO itemDao=new ItemsDAO();
    			Item item=itemDao.getItemById(Integer.parseInt(request.getParameter("id")));
    				System.out.println(item.getName());
    			if(item!=null)
    			{
    			
    		 %>
    		 <td width="70%" valign="top">
    		 	<table>
    		 		<tr>
    		 		<td rowspan="5"><img alt="" src="images/<%=item.getPicture()%>" width="200" height="160"/></td>	
    		 		</tr>
    		 		<tr>
    		 			<td><B><%=item.getName() %></B></td>
    		 		</tr>
    		 		<tr>
    		 			<td>库存：<%=item.getNumber() %></td>
    		 		</tr>
    		 		<tr>
    		 			<td>价格：<%=item.getPrice() %></td>
    		 		</tr>
    		 		<tr>
    		 			<td>购买数量：<span id="sub" onclick="sub()">-</span><input type="text" id="number" name="number" value="1" size="2"/><span id="add" onclick="add()">+</span></td>
    		 		</tr>
    		 	</table>
    		 	<div id="cart"> 
    		 	<a href="javaScript:void(0)" onclick="selflog_buy(<%=item.getId()%>)"><img src="images/buy_now.png"/>
    		 	<a href="javaScript:void(0)" onclick="selflog_show(<%=item.getId()%>)"><img src="images/in_cart.png"></a>
    		 	<a href="servlet/BuinessServlet?action=show"><img src="images/view_cart.png"/></a>
            	 </div>
    		 	</td>
    		 	<%
    		 		}
    		 	 %>
    		 	 <%
    		 	 	String list="";
    		 	 	//从客户端获得Cookies集合
    		 	 	Cookie[] cookies=request.getCookies();
    		 	 	//遍历这个Cookie集合
    		 	 	if(cookies!=null && cookies.length>0)
    		 	 	{
    		 	 		for(Cookie c: cookies)
    		 	 		{
    		 	 			if(c.getName().equals("ListViewCookie"))
    		 	 			{
    		 	 				list=c.getValue();
    		 	 			}
    		 	 		}
    		 	 	}
    		 	 	list+=request.getParameter("id")+",";
    		 	 	
    		 	 	//如果浏览记录超过1000条，清零
    		 	 	String[] arr =list.split(",");
    		 	 	
    		 	 	if(arr!=null && arr.length>0)
    		 	 	{
    		 	 		if(arr.length>=1000)
    		 	 		{
	    		 	 		list="";
    		 	 		}
    		 	 	}
    		 	 	Cookie cookie =new Cookie("ListViewCookie",list);
    		 	 	//存进去
    		 	 	response.addCookie(cookie);
    		 	  %>
    		 	  <!-- 浏览过的商品 -->
    		 	  <td width="30%" bgcolor="#E6E6FA" align="center">
    		 	  <br>
    		 	  <b><font color="#FF7F00">您浏览过的商品</font></b><br>
    		 	  <!-- 循环开始 -->
    		 	  <%
    		 	  	ArrayList<Item> itemlist=itemDao.getViewList(list);
    		 	  	if(itemlist!= null&& itemlist.size()>0)
    		 	  	{
    		 	  		System.out.println("itemlist.size="+itemlist.size());
    		 	  		for(Item i:itemlist)
    		 	  	{
    		 	   %>
    		 	   <div>
             <dl>
               <dt>
                 <a href="web/detail.jsp?id=<%=i.getId()%>"><img src="images/<%=i.getPicture()%>" width="120" height="90" border="1"/></a>
               </dt>
               <dd class="dd_name"><%=i.getName() %></dd> 
               <dd class="dd_city">库存:<%=i.getNumber() %>&nbsp;&nbsp;价格:<%=i.getPrice() %> ￥ </dd> 
             </dl>
             </div>
             <%
             		}
             	}
              %>
    	</table>
    </center>
  </body>
</html>
