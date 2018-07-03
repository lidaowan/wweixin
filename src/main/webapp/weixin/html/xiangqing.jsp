<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/11
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link href="/wweixin/weixin/css/MyCenter.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css/WeUI/weui.min.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css/mui/mui.min.css" rel="stylesheet" />

<!-- 商城2 css和js引入 -->
    <link href="/wweixin/weixin/css2/mui.min.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css2/style.css" rel="stylesheet" />




    <link rel="stylesheet" href="/wweixin/weixin/css2/app.css">


    <style>
        body {
            font-family: 'Microsoft YaHei';
        }

        p {
            font-size: 4.5vw;
        }
        .title {
            margin: 20px 15px 10px;
            color: #6d6d72;
            font-size: 15px;
        }
        .userimg{
            border-radius:50px;
        }
    </style>
    <title>详情页</title>
</head>
<body>

<img src="/wweixin/weixin/images/${goodbean.image1}" style="width:100%;">
<!--
<div id="showIOSActionSheet" style="width:100%; height:70vw; text-align:center; line-height:80vw; position:absolute; top:0; ">
    <img style="width:20vw; height:20vw;" src="/wweixin/weixinimages/play.png" />
</div>-->
<div class="weui-panel weui-panel_access" style="margin-top:0;">
    <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_text">
            <h4 class="weui-media-box__title">${goodbean.gname}<span style="float:right; margin-right:10px; color:#6d6d72; font-size:3vw;">
                                                            <img onclick="dianzan()" style="width:6vw; height:6vw;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADlElEQVR4Xu2bQVbbMBCGZ5LarNrCru+V+MGmtVcNJyicoNyA9ASlJyCcoPQEJCdoewLoCaCrmG6gDrzXHYFdrZLpc0L6QmJZkoOwIpNlPHI0n0aj0S8FoeQfLLn/8AjgMQIMIXDiuTtEtA4IdST42mdsN/gNZ7q7Z8QU6NScFiJu3XWWepUb2Hh1wY51QjACQOg5lwC4OO0o9ShmazojwRAALnFHmejQ77INXVFQOIDO8pN1rFQOshys3NCarqkwFwCgT5/9c7atIwqKB1BzGoi4n+UcEX0PumzdSgDhsrMHFfwgcs6PYi2DpeWlImfGn4eeewoAK6I2FMerOlaDQgF0XsAKugMAwg/1+xvB+d9DoaGiQaEAZMM/8ck6AKeLsPjnmXOaXgCllES2RUDHc5sIsCMbsVZFgMrcHwFauI6XVnvQkwUma1dIDghrzgEgKq3r1iyDoedsA+An2REaJECAX0EUC5dKlXeObB80An6+dOr9Kh6pdtSKSnA4750j2aw/DokAdoMobqqCk7F/kAi4XfIOALAu06lJGyJ6H3RZK09bURvtAGZ1fpADNJXBybu1ArgX5zUmQK0AhgkP9vOG/f/QJfjmd+NNUSjnfZ4aAbcjt4WpOt3UDD17HbH2+LezJLwpR4gOETH3JoiAegvXrM0rolIBhN4gW8snrAnFRkbmyjti+drxFWYOgAyRMrUH1PMjtjR6ZB6AJJOmi6v3BABgvFQ1EgDc7WNmJRh6qhFgGYBOzUkSz1uV+WZ+BNCVH7Gpw5fUKWAjAN5+okwA2kGXNSajujwAOBuqdACKclVC1fQcwJPUSgOAJ6mVAkCWolQKAJCxoUoHIHFkPZlNzc4B9NGP2F5aXVMKAFlnCqUAkCWpWw9ApChnCCLupQ17AZGizNUEVXeEpiZB0Zmi9QBER2p2A5AQVPkAas4xIL6RzQNmTgH++i88G1TVBEwEIHO/kBsB8w5A9kTZXgBEqQKIlCCSGKlcYDJRD5A9UOVHgKIoYloOkL1SYycAoh9+l0mdbNkJAMTLn3AZPKlVNwmrX+axDlC5T8CPAEVRZDwHDE+X1TZTsqCFdhLV3/g7tABIfkC1jhA6Jmkg2vxIL4Oqozi56Ri0f+q2AOGdZN9nN8vxx4rMKzLDO33QBMDnvN4lFRcAtHi3uJKTYkBsIEBdZW+hRoOuoA+tPP8q0XpHSM2JYqwfARTD3ZxfLX0E/AOhKSJfhYv1tQAAAABJRU5ErkJggg==" />


                                                            <span id="zan">111</span></span></h4>
            <h4 class="weui-media-box__title" style="color: #ff0000; font-weight: 600;">￥${goodbean.price}元&nbsp;&nbsp;<del style="font-size:3.5vw; color:#6d6d72;">${goodbean.zhiqianjiage}元</del></h4>
            <h4 class="weui-media-box__title" style="color: #D02090; font-weight: 600;"><c:if test="${goodbean.openid!=null && goodbean.openid!=''}">百度网盘地址：${goodbean.wangpandizhi}</c:if></h4>
            <h4 class="weui-media-box__title" style="color: #D02090; font-weight: 600;"><c:if test="${goodbean.openid!=null && goodbean.openid!=''}">网盘密码：${goodbean.wangpanmima}</c:if></h4>

            <p class="weui-media-box__desc">${goodbean.describes}</p>
        </div>
    </div>
</div>
<div class="title">
    详情
</div>
<img style="width:100%;" src="/wweixin/weixin/images/${goodbean.jieshaotupian}" />
<div class="title">
    用户评论
</div>
<ul class="mui-table-view">
    <li class="mui-table-view-cell mui-media">
        <a href="javascript:;">
            <img class="mui-media-object mui-pull-left userimg" src="/wweixin/weixinimages/shuijiao.jpg">
            <div class="mui-media-body">
                幸福
                <p class='mui-ellipsis'>这个视频真的特别棒！！！</p>
            </div>
        </a>
    </li>
    <li class="mui-table-view-cell mui-media">
        <a href="javascript:;">
            <img class="mui-media-object mui-pull-left userimg" src="/wweixin/weixinimages/shuijiao.jpg">
            <div class="mui-media-body">
                幸福
                <p class='mui-ellipsis'>这个视频真的特别棒！！！</p>
            </div>
        </a>
    </li>
    <li class="mui-table-view-cell mui-media">
        <a href="javascript:;">
            <img class="mui-media-object mui-pull-left userimg" src="/wweixin/weixinimages/shuijiao.jpg">
            <div class="mui-media-body">
                幸福
                <p class='mui-ellipsis'>这个视频真的特别棒！！！</p>
            </div>
        </a>
    </li>

</ul>
<p style="margin: 10px 15px 0;">
    用户须知：
</p>

<p style="margin: 0 15px 0;">
    用户购买本站资料后仅供自己学习使用，不得在第三方平台进行传播
</p>
<br />

<div style="height: 80px"></div>


<div class="filter-btn dis-box">

    <a type="button" class="btn-cart box-flex n-iphone5-top1 j-goods-attr j-show-div" onclick="yuzhifu(${goodbean.id})">立即购买</a>

</div>




<script src="/wweixin/weixin/js/jquery-1.9.1.min.js"></script>


<script type="text/javascript">
    // ios
    $(function () {
        var $iosActionsheet = $('#iosActionsheet');
        var $iosMask = $('#iosMask');

        function hideActionSheet() {
            $iosActionsheet.removeClass('weui-actionsheet_toggle');
            $iosMask.fadeOut(200);
        }

        $iosMask.on('click', hideActionSheet);
        $('#iosActionsheetCancel').on('click', hideActionSheet);
        $("#showIOSActionSheet").on("click", function () {
            $iosActionsheet.addClass('weui-actionsheet_toggle');
            $iosMask.fadeIn(200);
        });
    });
    function buy() {
        $('#loadingToast').show();
        setTimeout(function () {
            location.href = "goumaiwancheng.html";
        }, 3000);
    }
    function dianzan() {
       // alert('nihao');
        $('#zan').html(parseInt($('#zan').html()) + 1)
    }


    function yuzhifu(shangpinid) {

        var pwd = '';

        $.ajax(
            { dataType: "text",
            url:"/wweixin/yanzheng/yuzhifu?shangpinid="+shangpinid+"&openid=${ param["openid"] }&token=${ param["token"] }",
            async:true,
            dataType: "text",
            success: function (data) {

                var json=eval('(' + data + ')');

                function onBridgeReady(){
                    // alert("kaishi");
                    // alert(json.appId);
                    // alert(json.timeStamp);
                    // alert(json.nonceStr);
                    // alert(json.mpackage);
                    // alert(json.signType);
                    // alert(json.paySign);

                    WeixinJSBridge.invoke(
                        'getBrandWCPayRequest', {
                             "appId":"wx565d4d363899f0cd",     //公众号名称，由商户传入
                            "timeStamp":json.timeStamp+"",         //时间戳，自1970年以来的秒数
                            "nonceStr":json.nonceStr+"", //随机串
                            "package":json.mpackage+"",
                            "signType":json.signType+"",         //微信签名方式：
                            "paySign":json.paySign+""  //微信签名

                        },
                        function(res){


                            alert(JSON.stringify(res));

                            if(res.err_msg == "get_brand_wcpay_request:ok" ) {
                             alert("支付成功");

                            }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                        }
                    );
                };
                if (typeof WeixinJSBridge == "undefined"){
                    if( document.addEventListener ){
                        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                    }else if (document.attachEvent){
                        document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                    }
                }else{
                    onBridgeReady();
                }


            }
        });



    }


</script>
</body>
</html>
