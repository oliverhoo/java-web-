<%@page import="model.pojo.Item"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowBy.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  <h1>搜索结果如下：</h1>
    <%
    if(request.getSession().getAttribute("skey")!=null)
    {
    	ArrayList<Item> itemlist=(ArrayList<Item>)request.getSession().getAttribute("skey");
    	for(int i=0;i<itemlist.size();i++)
    	{
    		Item item= itemlist.get(i);
   %>
       	<div>
    		<dl>
    			<dt>
    				<a href="web/detail.jsp?id=<%=item.getId()%>"><img src="images/<%=item.getPicture()%>" width="120" height="90" border="1"></a>
				</dt>
    				<dd class="dd_name"><%=item.getName() %></dd>
    				<dd class="dd_number">库存：<%=item.getNumber() %>&nbsp;&nbsp;价格：<%=item.getPrice() %></dd>
    		</dl>
    	</div>
<!-- 商品循环结束 --> 
   <%
    	}
    	request.getSession().setAttribute("skey", null);
    }else{
     %>
     <h1>未找到相应关键词对应的商品</h1>
     <%
      }
     
      %>
     
  </body>
</html>
