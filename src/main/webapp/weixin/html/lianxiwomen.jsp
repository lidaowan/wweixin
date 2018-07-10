<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/4
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link href="../css/WeUI/weui.min.css" rel="stylesheet" />
    <link href="../css/mui/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/wweixin/weixin/css2/app.css">


    <style > body {
        margin: 0;
        padding: 0;
        font-family: 'Microsoft YaHei';
    }

    img {
        width: 100%;
    }

    h1 {
        text-align: center;
        line-height: 20px;
    }

    .weui-article {
        padding: 5px 15px;
    }

    small {
        color: #1AAC19;
    }

    h2 {
        color: #1AAC19;
    }
    </style>
    <title>联系我们</title>
</head>
<body>
<img src="../images/shuijiao.jpg" />
<article class="weui-article">
    <h1>联&nbsp;系&nbsp;我&nbsp;们<br /><small>Contact Us</small></h1>
    <section>
        <h2 class="title">联系方式</h2>
        <section>
            <h3>售后服务&nbsp;&nbsp;李腾 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="tel:158-1116-8627">158-1116-8627</a></h3>
            <h3>技术支持&nbsp;&nbsp;曹亮亮&nbsp;&nbsp;<a href="tel:136-7108-1083">136-7108-1083</a></h3>

        </section>
        <h2 class="title">地址</h2>
        <section>
            <h3>北京市朝阳区朝阳门联合大厦8层</h3>
        </section>
    </section>
</article>
<div style="height: 80px"></div>
<footer class="footer-nav dis-box">
    <a id="link_index" href="/wweixin/yanzheng/shouye?openid=${ param["openid"] }" class="box-flex nav-list">
        <i class="nav-box i-home"></i><span>首页</span>
    </a>


    <a id="link_user" href="/wweixin/yanzheng/gerenzhongxin?openid=${ param["openid"] }" class="box-flex nav-list" >
        <i class="nav-box i-user"></i><span>我的</span>
    </a>
</footer>
</body>
</html>
