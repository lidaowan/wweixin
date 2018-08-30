
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <meta content="telephone=no" name="format-detection"/>
    <link href="/wweixin/weixin/css/style.css" rel="stylesheet" type="text/css"/>

    <link href="/wweixin/weixin/css/MyCenter.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css/WeUI/weui.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="/wweixin/weixin/css2/app.css">

    <script type="text/javascript" src="/wweixin/weixin/js/jquery.min.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js/tab.js"></script>

</head>
<body>



<section class="aui-flexView">

    <section class="aui-scrollView">
        <div class="aui-tab" data-ydui-tab>


            <div class="top_div">
                <img src="/wweixin/weixin/images/bac.jpg" class="top_img">

            </div><br />
            <div class="page__bd" style="height: 100%;">
                <div class="weui-tab">
                    <div class="weui-navbar">
                        <div class="weui-navbar__item weui-bar__item_on">
                            购买记录
                        </div>

                    </div>

                    <div class="weui-tab__panel">

                        <br />

<c:forEach items="${dingdanlist }" var="dingdanbean">
            <div class="divHeight"></div>
            <div class="tab-panel">
                <div class="tab-panel-item tab-active">
                    <div class="tab-item">

                        <div class="aui-mail-product">
                            <a href="javascript:;" class="aui-mail-product-item">
                                <div class="aui-mail-product-item-hd">
                                    <img src="/wweixin/weixin/images/${dingdanbean.image1}" alt="">
                                </div>
                                <div class="aui-mail-product-item-bd">
                                    <p>${dingdanbean.myname}</p>
                                </div>
                            </a>
                        </div>
                        <a href="javascript:;" class="aui-mail-payment">
                            <p>

                                购买时间 <em>${dingdanbean.goumaishijian}</em> &nbsp;&nbsp;&nbsp; 实付款: ￥<i>${dingdanbean.price}</i>
                            </p>
                        </a>
<c:if test="${dingdanbean.neirong==null || dingdanbean.neirong==''}">
                        <div class="aui-mail-button">
                            <a  href="xiangqing?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }">立即查看</a>
                            <a href="/wweixin/weixin/html/tijiaopinglun.jsp?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }&image1=${dingdanbean.image1}&name=${dingdanbean.myname}&order_id=${dingdanbean.order_id}" class="aui-df-color">评价</a>

                        </div>
</c:if>

<c:if test="${dingdanbean.neirong!=null && dingdanbean.neirong!=''}">

    <div class="aui-mail-button">
        <a  href="xiangqing?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }">立即查看</a>
        <a href="/wweixin/yanzheng/chakanpingjia?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }&image1=${dingdanbean.image1}&name=${dingdanbean.myname}&order_id=${dingdanbean.order_id}" class="aui-df-color">查看评价</a>

    </div>
</c:if>
                    </div>
                    </c:forEach>
                    <div style="height: 60px"></div>

            </div>
        </div>
    </section>

</section>

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
