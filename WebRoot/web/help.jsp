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
    <title></title>

  </head>
  
  <body>
  <div style="margin:0 auto;width:990px">
  <div id="top_bg">
            <div id="top">
            <p>您好，欢迎回到孔大爷的商铺！&nbsp;&nbsp;
            <a href = "login.jsp">[登陆]</a>
            <a href = "register.jsp">[免费注册]</a>
            <span>
            <select onchange="window.location=this.value;">
  <option value="网站导航">网站导航</option>
  <option value="left.jsp">首页</option>
  <option href = "#" value="个人中心">个人中心</option>
  <option href = "#" value="购物车">购物车</option>
</select>|
            <a href = "#">查看购物车</a>| 
            <a href = "#">个人中心</a>|        
            <a href = "#">客服</a></span></p>                        
        </div>      
    </div>
  <div class="footer">
  <img src="../images/a1.png" alt="" />
  <img src="../images/a2.png" alt="" />
  <img src="../images/a3.png" alt="" />
  <img src="../images/a4.png" alt="" />
  <img src="../images/a5.png" alt="" />

  
   ……………………………………………………………………………………………………………………………………………………………………
            <br />承办单位：洛阳图创电子科技有限公司&nbsp;洛阳市通信息咨询有限公司<br />
            本站信息所有权&nbsp;未经许可不得转载<br />
            增值业务经营许可证：皖B2-200112923482<br />
            互联网商品信息服务资格证书：（皖）-经营性-2013-0001<br />
            国家商务部首批中商品电子商务平台<br />
            公司地址：河南省洛阳市洛神（经州）洛龙国际中商城第一期D-8栋102号<br />
  </div>
  </div>
  </body>
</html>
