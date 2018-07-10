<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link href="/wweixin/weixin/css/MyCenter.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css/WeUI/weui.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="/wweixin/weixin/css2/app.css">

    <style>
        body {
            font-family: 'Microsoft YaHei';
        }

        p {
            font-size: 4.5vw;
        }
    </style>
    <title>个人中心</title>
</head>
<body>
<div class="top_div">
    <img src="/wweixin/weixin/images/bac.jpg" class="top_img">
    <div class="userInfo">
        <%--<img class="uPic" src="http://wx.qlogo.cn/mmopen/uEGacf3tdXdHW1YwvOwevjV9dbHVjHM8FLkFqnib5DO2T4icwiaic9blbvt2iaod1F93t0vVAJ0DveLN9TmDx0CpHGabLny1PThhn/0" /><br />--%>

        <span class="uName" style="color:#302e2e; font-weight:bold;">

            </span><br />
        <span class="uBalance"></span>
    </div>
</div>

    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="/wweixin/yanzheng/wodedingdan?openid=${ param["openid"] }">
                    <div class="weui-cell__hd"><img src="data:image/png;base64,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" alt="" style="width:20px;margin-right:5px;display:block"></div>
                    <div class="weui-cell__bd weui-cell_primary">
                        <p>我的订单</p>
                    </div>
                    <span class="weui-cell__ft"></span>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="weui-panel">
    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_small-appmsg">
            <div class="weui-cells">
                <a class="weui-cell weui-cell_access" href="/wweixin/weixin/html/lianxiwomen.jsp?openid=${ param["openid"] }">
                    <div class="weui-cell__hd"><img src="data:image/png;base64,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" alt="" style="width:20px;margin-right:5px;display:block"></div>
                    <div class="weui-cell__bd weui-cell_primary">
                        <p>联系我们</p>
                    </div>
                    <span class="weui-cell__ft"></span>
                </a>
            </div>
        </div>
    </div>
</div>

<footer class="footer-nav dis-box">
    <a id="link_index" href="/wweixin/yanzheng/shouye?openid=${ param["openid"] }&token=${ param["token"] }" class="box-flex nav-list">
        <i class="nav-box i-home"></i><span>首页</span>
    </a>


    <a id="link_user" href="/wweixin/yanzheng/gerenzhongxin?openid=${ param["openid"] }&token=${ param["token"] }" class="box-flex nav-list" >
        <i class="nav-box i-user"></i><span>我的</span>
    </a>
</footer>
</body>
</html>