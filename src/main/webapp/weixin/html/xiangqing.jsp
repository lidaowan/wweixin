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
    课程介绍
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
    用户购买本站资料后仅供在本平台使用学习，不得在第三方平台进行传播售卖
</p>
<br />
<div>
    <div class="weui-mask" id="iosMask" style="display: none"></div>
    <div class="weui-actionsheet" id="iosActionsheet">
        <!--   <div class="weui-actionsheet__title">
              <p class="weui-actionsheet__title-text">购买后才能播放该视频</p>
          </div> -->
          <div class="weui-actionsheet__menu">
              <div class="weui-actionsheet__cell" onclick="buy()">立即购买</div>
            <!--  <div class="weui-actionsheet__cell" onclick="buy()">开通会员免费观看</div> -->
        </div>
        <div class="weui-actionsheet__action">
            <div class="weui-actionsheet__cell" id="iosActionsheetCancel">取消</div>
        </div>
    </div>
</div>
<div id="loadingToast" style="display:none;">
    <div class="weui-mask_transparent"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content">购买中</p>
    </div>
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
</script>
</body>
</html>
