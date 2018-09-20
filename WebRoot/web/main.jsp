<%@page import="model.DAO.*"%>
<%@page import="model.pojo.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" href="../css/index.css" />
    <title>jd</title>
<script type="text/javascript">
    	function select_button()
    	{
    		
    		var num=document.getElementById("content").value;
    		num=encodeURI(encodeURI(num));//encode 编码两次
    		var url="../servlet/BuinessServlet?keyword="+num+"&action=select";
    		window.open(url); 
    		
      }</script>
      <style type="text/css">
        #banner1
        {
            position: relative;
            width: 780px;
            height: 286px;
            border: 1px solid #666;
            overflow: hidden;
        }
        #banner1_list img
        {
            border: 0px;
        }
        #banner1_bg
        {
            position: absolute;
            bottom: 0;
            background-color: #000;
            height: 30px;
            filter: Alpha(Opacity=30);
            opacity: 0.3;
            z-index: 1000;
            cursor: pointer;
            width: 780px;
        }
        #banner1_info
        {
            position: absolute;
            bottom: 0;
            left: 5px;
            height: 22px;
            color: #fff;
            z-index: 1001;
            cursor: pointer;
        }
        #banner1_text
        {
            position: absolute;
            width: 120px;
            z-index: 1002;
            right: 3px;
            bottom: 3px;
        }
        #banner1 ul
        {
            position: absolute;
            list-style-type: none;
            filter: Alpha(Opacity=80);
            opacity: 0.8;
            border: 1px solid #fff;
            z-index: 1002;
            margin: 0;
            padding: 0;
            bottom: 3px;
            right: 5px;
        }
        #banner1 ul li
        {
            padding: 0px 8px;
            float: left;
            display: block;
            color: #FFF;
            border: #e5eaff 1px solid;
            background: #6f4f67;
            cursor: pointer;
        }
        #banner1 ul li.on
        {
            background: #900;
        }
        #banner1_list a
        {
            position: absolute;
        }
        /*让四张图片都可以重叠在一起 */
    </style>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script type="text/javascript">
	var t = n = 0, count;
	$(document).ready(function(){	
		count=$("#banner1_list a").length;
		$("#banner1_list a:not(:first-child)").hide();
		$("#banner1_info").html($("#banner1_list a:first-child").find("img").attr('alt'));
		$("#banner1_info").click(function(){window.open($("#banner1_list a:first-child").attr('href'), "_blank")});
		$("#banner1 li").click(function() {
			var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
			n = i;
			if (i >= count) return;
			$("#banner1_info").html($("#banner1_list a").eq(i).find("img").attr('alt'));
			$("#banner1_info").unbind().click(function(){window.open($("#banner1_list a").eq(i).attr('href'), "_blank")})
			$("#banner1_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
			document.getElementById("banner1").style.background="";
			$(this).toggleClass("on");
			$(this).siblings().removeAttr("class");
		});
		t = setInterval("showAuto()", 4000);
		$("#banner1").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
	})
	function showAuto()
	{
		n = n >=(count - 1) ? 0 : ++n;
		$("#banner1 li").eq(n).trigger('click');
	}
    </script>
</head>
<body>
  <div style="margin:0 auto;width:990px">
    <div id="top_bg">
            <div id="top">
            <p>您好，欢迎回到孔大爷的商铺！&nbsp;&nbsp;
            <a href = "login.jsp">[登陆]</a>
            <a href = "regist.jsp">[免费注册]</a>
            <span>
            <select onchange="window.location=this.value;">
            <option value="网站导航">网站导航</option>
            <option value="main.jsp">首页</option>
            <option href = "#" value="个人中心">个人中心</option>
            <option href = "#" value="购物车">购物车</option>
            </select>|
            <a href = "#">查看购物车</a>| 
            <a href = "../personpage/personpage.jsp">个人中心</a>|        
            <a href = "#">客服</a></span></p>                        
        </div>      
    </div>
    <!-- 母体div -->
    <div id="matrix">

        <!-- 头部 -->
        <div id="header">
            <!-- logo区 -->
            <div id="logo"></div>

            <!-- 搜索区 -->
            <div id="search" >
                <input type="text" name = "content" id = "content"/>
                <input type="button" name = "search" value = "搜索" id = "submit" onclick="select_button();"/>
            </div>
            <!-- 搜索区 end-->

            <!-- 导航区 -->    
            <div id = "shopcar">&nbsp;&nbsp;&nbsp;&nbsp;购物车&nbsp;0</div>
            <div id = "nav">
                <ul>
                    <li><a href="#" class="navlink">首页</a></li>
                    <li><a href="../servlet/BuinessServlet?type=1&id=1000&action=classify" target="_blank" class="navlink">精美包包</a></li>
                    <li><a href="../servlet/BuinessServlet?type=1&id=2000&action=classify" target="_blank" class="navlink">时尚手表</a></li>
                    <li><a href="../servlet/BuinessServlet?type=1&id=3000&action=classify"  target="_blank" class="navlink">时尚化妆品</a></li>
                    <li><a href="../servlet/BuinessServlet?type=1&id=4000&action=classify"  target="_blank" class="navlink">潮流卫衣</a></li>
                    <li><a href="../servlet/BuinessServlet?type=1&id=5000&action=classify" target="_blank"  class="navlink">优惠活动</a></li>
                    <li><a href="#" class="navlink">平台介绍</a></li>
                    <li><a href="#" class="navlink">销售排行榜</a></li>
                </ul>
            </div>
            
            <!-- 导航区 end--> 
        </div>
        <!-- 头部 end-->      

        <!-- 主体 -->
        <div id="main">
            <!-- 左侧 -->
            <div id = "left">

                <!-- 左侧区域1.1 -->
                <div class="subtitle">所有分类</div>
                <div class="left_part">
                    <ul><h2><a href="../servlet/BuinessServlet?type=1&id=1000&action=classify" target="_blank">精美包包</a></h2>
                        <li><a href="../servlet/BuinessServlet?type=2&id=1100&action=classify"  target="_blank" class="shoplist">双肩包</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=1200&action=classify"  target="_blank" class="shoplist">手提包</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=1300&action=classify"  target="_blank" class="shoplist">男包</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=1400&action=classify"  target="_blank" class="shoplist">女包</a></li>
                    </ul>
                    <div class="box"></div>
                </div>
                <!-- 左侧区域1.2 -->
                <div class="left_part">
                    <ul><h2><a href="../servlet/BuinessServlet?type=1&id=2000&action=classify" target="_blank">时尚手表</a></h2>
                        <li><a href="../servlet/BuinessServlet?type=2&id=2100&action=classify"  target="_blank" class="shoplist">充电器</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=2200&action=classify"  target="_blank" class="shoplist">男表</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=2300&action=classify"  target="_blank" class="shoplist">女表</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=2400&action=classify"  target="_blank" class="shoplist">情侣表</a></li>
                    </ul>
                    <div class="box"></div>
                </div>
                <!-- 左侧区域1.3 -->
                <div class="left_part">
                    <ul><h2><a href="../servlet/BuinessServlet?type=1&id=3000&action=classify" target="_blank">时尚化妆品</a></h2>
                        <li><a href="../servlet/BuinessServlet?type=2&id=3100&action=classify"  target="_blank" class="shoplist">润肤霜</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=3200&action=classify"  target="_blank" class="shoplist">面膜</a></li>
                        <li><a href="../servlet/BuinessServlet?type=2&id=3300&action=classify" target="_blank" class="shoplist">彩妆用品</a></li>
                    </ul>
                    <div class="box"></div>
                </div>  
                <!-- 左侧区域1.4 -->
                <div class="left_part">
                    <ul><h2><a href="../servlet/BuinessServlet?type=1&id=4000&action=classify" target="_blank">潮流卫衣</a></h2>
                        <li><a href="../servlet/BuinessServlet?type=1&id=4100&action=classify"  target="_blank" class="shoplist">男士卫衣</a></li>
                        <li><a href="../servlet/BuinessServlet?type=1&id=4200&action=classify" target="_blank"  class="shoplist">女式卫衣</a></li>
                        <li><a href="../servlet/BuinessServlet?type=1&id=4300&action=classify"  target="_blank" class="shoplist">进口卫衣</a></li>
                    </ul>
                    <div class="box"></div>
                </div>  
                <!-- 左侧区域1 end -->  
<%
	ItemsDAO iDao=new ItemsDAO();
	DB dbhelper =new DB();
	String[] todayStrings=dbhelper.activity("1");//存储六个随机商品的id
	if(todayStrings!=null)
	{
		ArrayList<Item> activitylist=new ArrayList<Item>();//只包含六个商品
		activitylist=iDao.getatcivityItem(todayStrings);
		if(activitylist!=null)
		{
 %>
                <!-- 左侧区域2 -->
                <div class="subtitle">销售排行</div>
                <div class="left_part">
                    <div class="toptitle">
                        <a href = "detail.jsp?id=<%=activitylist.get(0).getId() %>"><span>1.</span>
                        <%=activitylist.get(0).getName() %>
                        <span class = "price">￥<%=activitylist.get(0).getPrice() %>元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "detail.jsp?id=<%=activitylist.get(1).getId() %>"><span>2.</span>
                        <%=activitylist.get(1).getName() %>
                        <span class = "price">￥<%=activitylist.get(1).getPrice() %>元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "detail.jsp?id=<%=activitylist.get(2).getId() %>"><span>3.</span>
                       <%=activitylist.get(2).getName() %>
                        <span class = "price">￥<%=activitylist.get(2).getPrice() %>元</span></a>
                    </div>                                      
                    <div class="toptitle">
                        <a href = "detail.jsp?id=<%=activitylist.get(3).getId() %>"><span>4.</span>
                        <%=activitylist.get(3).getName() %>
                        <span class = "price">￥<%=activitylist.get(3).getPrice() %>元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "detail.jsp?id=<%=activitylist.get(4).getId() %>"><span>5.</span>
                    <%=activitylist.get(4).getName() %>
                        <span class = "price">￥<%=activitylist.get(4).getPrice() %>元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "detail.jsp?id=<%=activitylist.get(5).getId() %>"><span>6.</span>
                        <%=activitylist.get(5).getName() %>
                        <span class = "price">￥<%=activitylist.get(5).getPrice() %>元</span></a>
                    </div>                                                      
                </div>  
                <!-- 左侧区域2 end -->
<%
	}
}
String[] brands=dbhelper.activity("2");
if(brands!=null)
{
 %>
                <!-- 左侧区域3 -->
                <div class="subtitle">品牌特卖<a href="#"><span>全部品牌</span></a></div>
                <div class="left_part">
                    <div class="pinpai">
                        <img src="../images/<%=brands[0] %>" alt="" />
                        <img src="../images/<%=brands[1] %>" alt="" />
                        <img src="../images/<%=brands[2] %>" alt="" />
                        <img src="../images/<%=brands[3] %>" alt="" />
                        <img src="../images/<%=brands[4] %>" alt="" />
                        <img src="../images/<%=brands[5] %>" alt="" />                                      "
                    </div>
                </div>  
                <!-- 左侧区域3 end -->
<%
}
 %>
                <!-- 左侧区域4 -->              
                <div class = "leftpic">
                    <img src = "../images/wg.png">
                </div>
                <!-- 左侧区域4 end -->

                <!-- 左侧区域5 -->
                <div class="subtitle">发货查询</div>
                <div class="left_part">
                    <div class="note">
                        <span>订单号</span>2009061909851<br />
                        <span>发货号</span>232421<br />
                    </div>
                    <div class="note">
                        <span>订单号</span>2009061909851<br />
                        <span>发货号</span>1123344<br />
                    </div>                  
                </div>
                <!-- 左侧区域5 end-->   


                <!-- 左侧区域6 end-->   
            </div>
            <!-- 左侧 end -->

            <!-- 右侧 -->
            <div id = "right">
                <!-- banner -->
                <div id="banner">
                <div id="banner1">
              <div id="left">
        <div id="banner1_bg">
        </div>
        <!--标题背景-->
        <div id="banner1_info">
        </div>
        <!--标题-->
        <ul>
            <li class="on">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
        </ul>
        <div id="banner1_list">
        
            <a href="#" target="_blank">
                <img src="../images/lunfan-7.jpg"height=286px width=780px title="精美包包"alt="" />
            </a> 
            <a href="#" target="_blank">
                <img src="../images/lunfan-5.jpg"height=286px width=780px title="精美包包" alt="" />
            </a> 
            <a href="#" target="_blank">
                <img src="../images/lunfan-6.jpg"height=286px width=780px title="时尚手表" alt="" />
            </a> 
            <a href="#" target="_blank">
                <img src="../images/lunfan-7.jpg"height=286px width=780px title="时尚手表" alt="" />
            </a>
            
        </div>
        </div>


                </div>
                <!-- banner end-->

                <!-- 右侧商品展示 -->
               <div class="right_pic_box">
               <div id = "nav1">
                <ul>
                    <li><a href="#" class="navlink2">热销商品</a></li>
                    <li><a href="#" class="navlink1">更多</a></li>
                    <li><a href="#" class="navlink1">面膜</a></li>
                    <li><a href="#" class="navlink1">润肤霜</a></li>
                    <li><a href="#" class="navlink1">全部商品</a></li>
                </ul>
                <ul>
                   <li><a  href="#" style="float:left">
                        <img src="../images/1.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/2.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/3.png" height=150px width=150px class="pad"  style="float:left" alt="" />
                        <img src="../images/4.png" height=150px width=150px class="pad" style="float:left" alt="" />
                   </a>
	</li>
                </ul>
            </div>
               </div> 
                <div class="right_pic_box">
                     <div id = "nav1">
                <ul>
                    <li><a href="#" class="navlink2">精品推荐</a></li>
                    <li><a href="#" class="navlink1">更多</a></li>
                    <li><a href="#" class="navlink1">彩妆用品</a></li>
                    <li><a href="#" class="navlink1">时尚化妆品</a></li>
                    <li><a href="#" class="navlink1">全部商品</a></li>
                </ul>
                 <ul>
                   <li><a  href="#" style="float:left">
                        <img src="../images/5.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/6.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/7.png" height=150px width=150px class="pad"  style="float:left" alt="" />
                        <img src="../images/8.png" height=150px width=150px class="pad" style="float:left" alt="" />
                   </a></li>
                </ul>
            </div>
                </div>
                <div class="right_pic_box">
                    <div id = "nav1">  
                 <ul>
                   <li><a  href="#" style="float:left">
                        <img src="../images/9.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/10.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/11.png" height=150px width=150px class="pad"  style="float:left" alt="" />
                        <img src="../images/12.png" height=150px width=150px class="pad" style="float:left" alt="" />
                   </a></li>
                </ul>
            </div>
                </div>
                
                
                <div class="right_pic_box">
                     <div id = "nav1">
                <ul>
                    <li><a href="#" class="navlink2">时尚化妆品</a></li>
                    <li><a href="#" class="navlink1">更多</a></li>
                </ul>
                 <ul>
                   <li><a  href="#" style="float:left">
                        <img src="../images/13.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/14.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/15.png" height=150px width=150px class="pad"  style="float:left" alt="" />
                        <img src="../images/16.png" height=150px width=150px class="pad" style="float:left" alt="" />
                   </a></li>
                </ul>
            </div>
                </div>
                <div class="right_pic_box">
                    <div id = "nav1">
                <ul>
                    <li><a href="#" class="navlink2">精美包包</a></li>
                    <li><a href="#" class="navlink1">更多</a></li>
                </ul>

                  <ul>
                   <li><a  href="#" style="float:left">
                        <img src="../images/9.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/1.png" height=150px width=150px class="pad" style="float:left" alt="" />
                        <img src="../images/6.png" height=150px width=150px class="pad"  style="float:left" alt="" />
                        <img src="../images/12.png" height=150px width=150px class="pad" style="float:left" alt="" />
                   </a></li>
                </ul>
            </div>
                </div>                                                               
                <!-- 右侧商品展示 end -->



            </div>
            <!-- 右侧 end -->

        </div>
        <!-- 主体 end -->

        <!-- 脚部 -->
<div id="footer">
        <div id = "nav3">
                   <div class="hh" style="position:static;float:none;clear:both;">
                    <div style="text-align: center; position: relative;top: 10px;">
                        &nbsp;<a href="" >首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;                        
                            <a href="" style="color:white">关于商铺</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="" style="color:white">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="" style="color:white">隐私政策</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="" style="color:white">相关法律</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="https://www.alipay.com/" style="color:white">支付方式</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="https://www.alimama.com/index.htm?spm=a21bo.2017.1997523009.8.5af911d9S5ToOx" style="color:white">阿里妈妈</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="help.jsp" style="color:white">商城帮助</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="http://www.fliggy.com/?spm=a21bo.2017.1997523009.9.5af911d9S5ToOx" style="color:white">飞猪</a>                                  
                    </div>
                </div>
                <img src="../images/99.JPG" width=990px height=110px alt="" />
         </div>
          ……………………………………………………………………………………………………………………………………………………………………
            <br />承办单位：洛阳图创电子科技有限公司&nbsp;洛阳市通信息咨询有限公司<br />
            本站信息所有权&nbsp;未经许可不得转载<br />
            增值业务经营许可证：皖B2-200112923482<br />
            互联网商品信息服务资格证书：（皖）-经营性-2013-0001<br />
            国家商务部首批中商品电子商务平台<br />
            公司地址：河南省洛阳市洛神（经州）洛龙国际中商城第一期D-8栋102号<br />
        </div>
        <!-- 脚部 end-->      
    </div>
    <!-- 母体div end -->
</body>
</html>
</div>