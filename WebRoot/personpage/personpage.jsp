<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PersonPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/PersonPage.css" media="all">
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('#wdsp').mouseover(function(){
			$('#wdsp').addClass("xxx");
			$('#menu_right_wdsp').css("display","inline");
			});
			
		$('#wdsp').mouseleave(function(){
			$('#wdsp').removeClass("xxx");
			$('#menu_right_wdsp').css("display","none");
			});
			
		$('#wdsc').mouseover(function(){//我的收藏
			$('#wdsc').addClass("xxx");
			$('#menu_right_wdsc').css("display","inline");
			});
			
		$('#wdsc').mouseleave(function(){
			$('#wdsc').removeClass("xxx");
			$('#menu_right_wdsc').css("display","none");
			});
			
		$('#sjzc').mouseover(function(){//商家支持
			$('#sjzc').addClass("xxx");
			$('#menu_right_sjzc').css("display","inline");
			});
			
		$('#sjzc').mouseleave(function(){
			$('#sjzc').removeClass("xxx");
			$('#menu_right_sjzc').css("display","none");
			});
			//menu_left_content_singer
		$('.menu_left_content_singer').mouseover(function(e){
			$(this).addClass("www");
			$(this).find('.content_singer_children').addClass("ccc");
			});
		$('.menu_left_content_singer').mouseleave(function(){
			$(this).removeClass("www");
			$(this).find('.content_singer_children').removeClass("ccc");
			});
			//menu_left_content_singer
			
		$('#asdw').mouseover(function(){
			$('#asdw').addClass("xxx1");
			$('#little_content_asdw').css("display","inline");
			});
			
		$('#asdw').mouseleave(function(){
			$('#asdw').removeClass("xxx1");
			$('#little_content_asdw').css("display","none");
			});	
		});
		

</script>
  </head>
  
  <body>
    <!-- page -->
    <div id="page">
    	<!-- head -->
    	<div id="head">
    		<!-- head_menu -->
    		<div class="head_menu">
	    		<ul class="menu_left">
	    			<li><span>欢迎来到孔大爷的商城</span></li>
	    		</ul>
    			<ul class="menu_right">
    				<li>
    					<div class="menu_right_show" id="wdsp">
    						<a href="personpage/changeinfo.jsp">我的中心</a>
    						<div id="menu_right_wdsp" class="menu_right_ss">
	    						<div class="little_menu">
		    						<div class="little_menu_panel">
		    							<a href="javascript:void(1)">已买到的商品</a>
		    							<a href="javascript:void(1)">已卖出的商品</a>
		    						</div>
	    						</div>
    						</div>
    					</div>	
    				</li>
    				<li>
    					<div class="care">
    						<img src="Image/favorite.png"></img>
		    				<a href="javascript:void(1)">
		    					<span>我关注的品牌</span>
		    				</a>
	    				</div>
    				</li>
    				<li>
    					<div class="cart">
    						<img src="Image/cart.png"></img>
		    				<a href="javascript:void(1)">
		    					<span>购物车<b>0</b>件</span>
		    				</a>
	    				</div>
    				</li>
    				<li>
    					<div class="menu_right_show" id="wdsc">
    						<a href="servlet/ShowShouCang">我的收藏</a>
    						<div id="menu_right_wdsc" class="menu_right_ss">
	    						<div class="little_menu">
		    						<div class="little_menu_panel">
		    							<a href="javascript:void(1)">收藏的商品</a>
		    							<a href="javascript:void(1)">收藏的店铺</a>
		    						</div>
	    						</div>
    						</div>
    					</div>	
    				</li>
    				<li>
    					<div class="menu_right_show" id="sjzc">
    						<a href="javascript:void(1)">商家支持</a>
    						<div id="menu_right_sjzc" class="menu_right_ss">
	    						<div class="little_menu">
		    						<div class="little_menu_panel second">
		    							<b>商家：</b>
		    							<div class="little_menu_panel_m"><br/>
			    							<a href="javascript:void(1)">商家中心</a>
			    							<a class="a_left" href="javascript:void(1)">商家入驻</a>
		    							</div>
		    							<div class="little_menu_panel_m">
			    							<a href="javascript:void(1)">商家中心</a>
			    							<a class="a_left" href="javascript:void(1)">商家入驻</a>
		    							</div>
		    						</div>
	    						</div>
    						</div>
    					</div>	
    				</li>
    				<li></li>
    			</ul>
    		</div>
    		<!-- head_menu end -->
    		
    		<!-- head_search -->
    		<div class="head_search">
    			<a href="web/main.jsp"><img src="Image/Logo.jpg"></img><a/>
    			<div class="search_left">
    			   <ul>
    			      <li><a href="javascript:void(1)">首页</a></li>
    			  	<li>
    					<div class="little_content_show" id="asdw">
    						<a href="javascript:void(1)">设置</a>
    						<div id="little_content_asdw" class="little_content_ss">
	    						<div class="little_content">
		    						<div class="little_content_panel">
		    						     <a href="javascript:void(1)">安全设置:</a><br>
		    							 <a href="javascript:void(1)">个人资料</a>
		    							 <a href="javascript:void(1)">手机绑定</a>
		    							 <a href="javascript:void(1)">账户安全</a>	<br>	    			
		    							  <a href="javascript:void(1)">隐私设置</a>
		    							  <a href="javascript:void(1)">收货地址</a>
		    							  <a href="javascript:void(1)">修改头像、昵称</a><br>
		    							  <a href="javascript:void(1)">其他</a>
		    						
		    						</div>
	    						</div>
    						</div>
    					</div>	
    				</li>
    			      <li><a href="javascript:void(1)">消息</a></li>
    			   </ul>
    			  
    			</div>
    			<div class="search_right">
    				<div class="search">
    					<input class="search_content" type="text" placeholder="请输入需要查询的商品"/>
    					<input class="search_button" type="button" value="搜索"/>
    				</div>
    				<div class="search_menu">
    					<ul>
    						<li><a href="javascript:void(1)">连衣裙</a></li>|&nbsp;&nbsp;&nbsp;
    						<li><a href="javascript:void(1)">凉鞋</a></li>|&nbsp;&nbsp;&nbsp;
    						<li><a href="javascript:void(1)">短裙</a></li>|&nbsp;&nbsp;&nbsp;
    						<li><a href="javascript:void(1)">吊带背心</a></li>|&nbsp;&nbsp;&nbsp;
    						<li><a href="javascript:void(1)">防晒衣外套</a></li>|&nbsp;&nbsp;&nbsp;
    					</ul>
    				</div>
    			</div>
    		</div>
    		<!-- head_search end -->
    	</div>
    <!-- head end -->
    <!-- content -->
     <div id="content">
         <!-- content_left -->
         <div id="content_left">
             <ul>
             <li><a href="javascript:void(1)">全部功能</a></li>
             <li><a href="javascript:void(1)">我的购物车</a></li>
             <li><a href="servlet/ShowShouCang">我的收藏</a></li>
             <li><a href="javascript:void(1)">我的足迹</a></li>
             <li><a href="javascript:void(1)">我的优惠</a></li>
             <li><a href="javascript:void(1)">我的积分</a></li>
             <li><a href="javascript:void(1)">我的发票</a></li>
             <li><a href="javascript:void(1)">评价管理</a></li>
            </ul>
         </div>
         <!-- content_left end -->
         
         <!-- content_right -->
         <div id="content_right">
             <!-- content_rigtop -->
           <div id="content_rigtop">
             <img src="Image/head.jpg"></img>
             <ul>
             <li class="top1"><a href="javascript:void(1)">${huiyuan.hyNickName}</a></li>
             <li class="top2"><a href="./servlet/showorder">我的订单</a></li>
             <li class="top2"><a href="personpage/AddressManger.jsp">我的收货地址</a></li>
             <li class="top2"><a href="javascript:void(1)">我的售后</a></li>
             <li class="top2"><a href="javascript:void(1)">我的金币</a></li>
             </ul>
           </div>
             <!-- content_rigtop end-->
             
             <!-- content_rigbottom -->
        <div id="content_rigbottom">
             <div class="content_rigbottom_lefttop">
             <ul>
             <li><a href="javascript:void(1)">根据浏览，猜你喜欢</a></li>
             <img src="Image/fresh.png"></img>
             <li class="h1"><a href="javascript:void(1)">换一组</a></li>
             </ul>
               <div class="content_rigbottom_leftbottom">
                 <img src="Image/picture1.jpg"></img>
                 <img src="Image/picture2.jpg"></img>
                 <img src="Image/picture3.jpg"></img><br> 
                 <img src="Image/picture4.jpg"></img>
                 <img src="Image/picture5.jpg"></img>
                 <img src="Image/picture6.jpg"></img>
               </div>
            </div>
             <div class="content_rigbottom_right">
               <ul>
                <li class="body"><a href="javascript:void(1)">新人大礼包</a></li>
                <img src="Image/head.jpg"></img>
                <li class="center"><a href="javascript:void(1)"></a></li></br>
                <li class="leg">
                <a href="javascript:void(1)">注册会员</a>
                <a href="javascript:void(1)">退出</a>
                </li>
               </ul>
             </div>
       </div>
             <!-- content_rigbottom end-->
         </div> 
         <!-- content_right end -->   
     </div>
   
     </div>
     <!-- page end -->  
  </body>
</html>
