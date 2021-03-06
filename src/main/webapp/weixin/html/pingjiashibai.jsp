<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/6
  Time: 9:34
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
    <style>
        body {
            font-family: 'Microsoft YaHei';
        }

        p {
            font-size: 4.5vw;
        }
    </style>
    <title>评论完成</title>
</head>
<body>
<div class="weui-msg">

    <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">评价失败，重复评价或评价内容为空</h2>
        <p class="weui-msg__desc"></p>
    </div>
    <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
            <a href="/wweixin/yanzheng/wodedingdan?openid=${ param["openid"] }" class="weui-btn weui-btn_primary">返回我的订单</a>
            <a href="/wweixin/yanzheng/shouye?openid=${ param["openid"] }" class="weui-btn weui-btn_default">返回首页</a>
        </p>
    </div>
    <!--<div class="weui-msg__extra-area">
        <div class="weui-footer">
            <p class="weui-footer__links">
                <a href="javascript:void(0);" class="weui-footer__link">底部链接文本</a>
            </p>
            <p class="weui-footer__text">Copyright &copy; 2008-2016 weui.io</p>
        </div>
    </div>-->
</div>
</body>
</html>
