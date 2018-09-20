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

</head>
<body>
    <div id="top_bg">
            <div id="top">
            <p>您好，欢迎回到孔大爷的商铺！&nbsp;&nbsp;
            <a href = "#">[登陆]</a>
            <a href = "#">[免费注册]</a>
            <span><a href = "#">查看购物车</a>| 
            <a href = "#">个人中心</a>|        
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
                <input type="submit" name = "search" value = "搜索" id = "submit"/>
            </div>
            <!-- 搜索区 end-->

            <!-- 导航区 -->    
            <div id = "shopcar">&nbsp;&nbsp;&nbsp;&nbsp;购物车&nbsp;0</div>
            <div id = "nav">
                <ul>
                    <li><a href="#" class="navlink">首页</a></li>
                    <li><a href="#" class="navlink">时尚化妆品</a></li>
                    <li><a href="#" class="navlink">时尚手表</a></li>
                    <li><a href="#" class="navlink">精美包包</a></li>
                    <li><a href="#" class="navlink">团购商品</a></li>
                    <li><a href="#" class="navlink">优惠活动</a></li>
                    <li><a href="#" class="navlink">EC免费模板</a></li>
                    <li><a href="#" class="navlink">EC商业模板</a></li>
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
                    <ul><h2><a href="#">精美包包</a></h2>
                        <li><a href="#" class="shoplist">双肩包</a></li>
                        <li><a href="#" class="shoplist">手提包</a></li>
                        <li><a href="#" class="shoplist">男包</a></li>
                        <li><a href="#" class="shoplist">女包</a></li>
                    </ul>
                    <div class="box"></div>
                </div>
                <!-- 左侧区域1.2 -->
                <div class="left_part">
                    <ul><h2><a href="#">时尚手表</a></h2>
                        <li><a href="#" class="shoplist">充电器</a></li>
                        <li><a href="#" class="shoplist">男表</a></li>
                        <li><a href="#" class="shoplist">女表</a></li>
                        <li><a href="#" class="shoplist">情侣表</a></li>
                    </ul>
                    <div class="box"></div>
                </div>
                <!-- 左侧区域1.3 -->
                <div class="left_part">
                    <ul><h2><a href="#">时尚化妆品</a></h2>
                        <li><a href="#" class="shoplist">润肤霜</a></li>
                        <li><a href="#" class="shoplist">面膜</a></li>
                        <li><a href="#" class="shoplist">彩妆用品</a></li>
                    </ul>
                    <div class="box"></div>
                </div>  
                <!-- 左侧区域1.4 -->
                <div class="left_part">
                    <ul><h2><a href="#">潮流卫衣</a></h2>
                        <li><a href="#" class="shoplist">男士卫衣</a></li>
                        <li><a href="#" class="shoplist">女式卫衣</a></li>
                        <li><a href="#" class="shoplist">进口卫衣</a></li>
                    </ul>
                    <div class="box"></div>
                </div>  
                <!-- 左侧区域1 end -->  

                <!-- 左侧区域2 -->
                <div class="subtitle">销售排行</div>
                <div class="left_part">
                    <div class="toptitle">
                        <a href = "#"><span>1.</span>
                        芙丽芳丝时尚沐...
                        <span class = "price">￥50元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "#"><span>2.</span>
                        限量版休闲帆布...
                        <span class = "price">￥100元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "#"><span>3.</span>
                        天梭Tisso...
                        <span class = "price">￥600元</span></a>
                    </div>                                      
                    <div class="toptitle">
                        <a href = "#"><span>4.</span>
                        雅诗兰黛15色...
                        <span class = "price">￥20元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "#"><span>5.</span>
                        SUKI 蓝莓...
                        <span class = "price">￥40元</span></a>
                    </div>
                    <div class="toptitle">
                        <a href = "#"><span>6.</span>
                        限量版休闲帆布...
                        <span class = "price">￥100元</span></a>
                    </div>                                                      
                </div>  
                <!-- 左侧区域2 end -->

                <!-- 左侧区域3 -->
                <div class="subtitle">品牌特卖<a href="#"><span>全部品牌</span></a></div>
                <div class="left_part">
                    <div class="pinpai">
                        <img src="/images/1.jpg" alt="" />
                        <img src="/images/2.jpg" alt="" />
                        <img src="/images/3.jpg" alt="" />
                        <img src="/images/4.jpg" alt="" />
                        <img src="/images/5.jpg" alt="" />
                        <img src="/images/6.jpg" alt="" />
                    </div>
                </div>  
                <!-- 左侧区域3 end -->

                <!-- 左侧区域4 -->              
                <div class = "leftpic">
                    <img src = "/images/7.png">
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

                <!-- 左侧区域6 -->
                <div class="subtitle">订单查询</div>
                <div class="left_part">
                    <div class="shopnum">
                        <form action="action.php">
                            <input type="text" name = "shopnum" method = "get"/>
                            <input type="submit" value = "查询该单号" class = "shopnumSub"/>
                        </form>
                    </div>
                </div>
                <!-- 左侧区域6 end-->   
            </div>
            <!-- 左侧 end -->

            <!-- 右侧 -->
            <div id = "right">
                <!-- banner -->
                <div id="banner">
                    banner区域
                </div>
                <!-- banner end-->

                <!-- 右侧商品展示 -->
               
                <div class="na">
                    <ul>
                    <li><a href="#" class="a">首页</a></li>
                    <li><a href="#" class="a">时尚化妆品</a></li>
                    <li><a href="#" class="a">时尚手表</a></li>
                    <li><a href="#" class="a">精美包包</a></li>
                    <li><a href="#" class="a">团购商品</a></li>
                    <li><a href="#" class="a">优惠活动</a></li>
                    <li><a href="#" class="a">EC免费模板</a></li>
                    <li><a href="#" class="a">EC商业模板</a></li>
                </ul>
                </div>
                
                <div class="right_pic_box">
                    <div class="right_pic_title">精品推荐</div>
                </div>
                <div class="right_pic_box">
                    <div class="right_pic_title">新品上市</div>
                </div>
                <div class="right_pic_box">
                    <div class="right_pic_title">时尚化妆品</div>
                </div>
                <div class="right_pic_box">
                    <div class="right_pic_title">精美包包</div>
                </div>                                                              
                <!-- 右侧商品展示 end -->

            </div>
            <!-- 右侧 end -->

        </div>
        <!-- 主体 end -->

        <!-- 脚部 -->
        <div id="footer">
            脚部区域
        </div>
        <!-- 脚部 end-->      
    </div>
    <!-- 母体div end -->
</body>
</html>