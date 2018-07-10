
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link href="/wweixin/weixin/css/MyCenter.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css/WeUI/weui.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="/wweixin/weixin/css2/app.css">

    <title>我的订单</title>
    <style>
        body {
            font-family: 'Microsoft YaHei';
        }

        p {
            font-size: 4.5vw;
        }
    </style>
</head>
<body>
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
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">订单金额</label>
                            <em class="weui-form-preview__value">¥${dingdanbean.price}</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">商品名称</label>
                            <span class="weui-form-preview__value">${dingdanbean.myname}</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">购买时间</label>
                            <span class="weui-form-preview__value">${dingdanbean.goumaishijian}</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">商品简介</label>
                            <span class="weui-form-preview__value">${dingdanbean.jianjie}</span>
                        </div>
                    </div>
                    <c:if test="${dingdanbean.neirong==null || dingdanbean.neirong==''}">
                        <div class="weui-form-preview__ft">
                            <a class="weui-form-preview__btn weui-form-preview__btn_default" href="/wweixin/weixin/html/tijiaopinglun.jsp?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }&image1=${dingdanbean.image1}&name=${dingdanbean.myname}&order_id=${dingdanbean.order_id}">评价</a>
                            <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="xiangqing?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }">立即查看</a>

                        </div>
                    </c:if>


                    <c:if test="${dingdanbean.neirong!=null && dingdanbean.neirong!=''}">
                        <div class="weui-form-preview__ft">
                            <a class="weui-form-preview__btn weui-form-preview__btn_default" href="/wweixin/yanzheng/chakanpingjia?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }&image1=${dingdanbean.image1}&name=${dingdanbean.myname}&order_id=${dingdanbean.order_id}">已评价/查看评价</a>
                            <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="xiangqing?good_id=${dingdanbean.goodid}&openid=${ param["openid"] }">立即查看</a>

                        </div>
                    </c:if>
                </div>

    <br />
</c:forEach>
        </div>
    </div>
</div>
<script src="../js/jquery-1.9.1.min.js"></script>
<script>
    $(function () {
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            if ($('#o1').is(":hidden")) {
                $('#o1').show();
                $('#o2').hide();
            } else {
                $('#o1').hide();
                $('#o2').show();
            }
        });
    });
</script>
<div style="height: 60px"></div>
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
