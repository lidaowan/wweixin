<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link href="/wweixin/weixin/css/MyCenter.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css/WeUI/weui.min.css" rel="stylesheet" />
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
    <div class="userInfo">
        <img class="uPic" src="http://wx.qlogo.cn/mmopen/uEGacf3tdXdHW1YwvOwevjV9dbHVjHM8FLkFqnib5DO2T4icwiaic9blbvt2iaod1F93t0vVAJ0DveLN9TmDx0CpHGabLny1PThhn/0" /><br />
        <span class="uBalance">本杰明</span>
    </div>
</div><br />
<div class="page__bd" style="height: 100%;">
    <div class="weui-tab">
        <div class="weui-navbar">
            <div class="weui-navbar__item weui-bar__item_on">
                视频购买记录
            </div>

        </div>
<c:forEach items="${dingdanlist }" var="dingdanbean">
        <div class="weui-tab__panel">
            <div id="o1">
                <br />
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">订单金额</label>
                            <em class="weui-form-preview__value">¥${dingdanbean.price}</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">课程名称</label>
                            <span class="weui-form-preview__value">${dingdanbean.myname}</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">购买时间</label>
                            <span class="weui-form-preview__value">${dingdanbean.goumaishijian}</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">课程简介</label>
                            <span class="weui-form-preview__value">${dingdanbean.jianjie}</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default" href="tijiaopinglun?good_id${dingdanbean.goodid}">评价</a>
                        <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="xiangqing?good_id=${dingdanbean.goodid}">立即查看</a>
                    </div>
                </div><br />
                </c:forEach>
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">订单金额</label>
                            <em class="weui-form-preview__value">¥69.00</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">课程名称</label>
                            <span class="weui-form-preview__value">Java基础</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">购买时间</label>
                            <span class="weui-form-preview__value">2018-03-01 13:43:33</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">课程简介</label>
                            <span class="weui-form-preview__value">Java基础课包含字符串简介、类和方法、面向对象...</span>
                        </div>
                    </div>
                    <div class="weui-form-preview__ft">
                        <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">已评价</a>
                        <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="shipinbofangye.html">立即查看</a>
                    </div>
                </div>
                <br />
            </div>
            <div id="o2" style="display:none;">
                <br />
                <div class="weui-form-preview">
                    <div class="weui-form-preview__hd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">订单金额</label>
                            <em class="weui-form-preview__value">¥100.00</em>
                        </div>
                    </div>
                    <div class="weui-form-preview__bd">
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">订单名称</label>
                            <span class="weui-form-preview__value">年费会员</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label">购买时间</label>
                            <span class="weui-form-preview__value">2018-03-01 13:43:33</span>
                        </div>
                    </div>
                </div><br />
            </div>
        </div>
    </div>
</div>
<script src="/wweixin/weixin/js/jquery-1.9.1.min.js"></script>
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
</body>
</html>
