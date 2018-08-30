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
    <meta charset="UTF-8">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0,minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link href="/wweixin/weixin/css/css4/iconfont.css" rel="stylesheet"  />
    <link href="/wweixin/weixin/css/css4/basestyle.css" rel="stylesheet"  />
    <link href="/wweixin/weixin/css/css4/common.css" rel="stylesheet"  />
    <link href="/wweixin/weixin/css/css4/style.css" rel="stylesheet"  />
    <link rel="stylesheet" href="/wweixin/weixin/css3/reset.css">
    <link rel="stylesheet" href="/wweixin/weixin/css3/index.css">

    <link href="/wweixin/weixin/css2/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="/wweixin/weixin/css2/app.css">


    <title>详情页</title>
</head>
<body>
<div id="wrapper">
    <div class="video details_back">
        <div class="deta_pic topline">
            <div class="deta_box"><img src="/wweixin/weixin/images/${goodbean.image1}" /></div>

            <span style="float:right; margin-right:20px; color:#6d6d72; font-size:3vw;"><img onclick="dianzan(${goodbean.id})" style="width:6vw; height:6vw;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAADlElEQVR4Xu2bQVbbMBCGZ5LarNrCru+V+MGmtVcNJyicoNyA9ASlJyCcoPQEJCdoewLoCaCrmG6gDrzXHYFdrZLpc0L6QmJZkoOwIpNlPHI0n0aj0S8FoeQfLLn/8AjgMQIMIXDiuTtEtA4IdST42mdsN/gNZ7q7Z8QU6NScFiJu3XWWepUb2Hh1wY51QjACQOg5lwC4OO0o9ShmazojwRAALnFHmejQ77INXVFQOIDO8pN1rFQOshys3NCarqkwFwCgT5/9c7atIwqKB1BzGoi4n+UcEX0PumzdSgDhsrMHFfwgcs6PYi2DpeWlImfGn4eeewoAK6I2FMerOlaDQgF0XsAKugMAwg/1+xvB+d9DoaGiQaEAZMM/8ck6AKeLsPjnmXOaXgCllES2RUDHc5sIsCMbsVZFgMrcHwFauI6XVnvQkwUma1dIDghrzgEgKq3r1iyDoedsA+An2REaJECAX0EUC5dKlXeObB80An6+dOr9Kh6pdtSKSnA4750j2aw/DokAdoMobqqCk7F/kAi4XfIOALAu06lJGyJ6H3RZK09bURvtAGZ1fpADNJXBybu1ArgX5zUmQK0AhgkP9vOG/f/QJfjmd+NNUSjnfZ4aAbcjt4WpOt3UDD17HbH2+LezJLwpR4gOETH3JoiAegvXrM0rolIBhN4gW8snrAnFRkbmyjti+drxFWYOgAyRMrUH1PMjtjR6ZB6AJJOmi6v3BABgvFQ1EgDc7WNmJRh6qhFgGYBOzUkSz1uV+WZ+BNCVH7Gpw5fUKWAjAN5+okwA2kGXNSajujwAOBuqdACKclVC1fQcwJPUSgOAJ6mVAkCWolQKAJCxoUoHIHFkPZlNzc4B9NGP2F5aXVMKAFlnCqUAkCWpWw9ApChnCCLupQ17AZGizNUEVXeEpiZB0Zmi9QBER2p2A5AQVPkAas4xIL6RzQNmTgH++i88G1TVBEwEIHO/kBsB8w5A9kTZXgBEqQKIlCCSGKlcYDJRD5A9UOVHgKIoYloOkL1SYycAoh9+l0mdbNkJAMTLn3AZPKlVNwmrX+axDlC5T8CPAEVRZDwHDE+X1TZTsqCFdhLV3/g7tABIfkC1jhA6Jmkg2vxIL4Oqozi56Ri0f+q2AOGdZN9nN8vxx4rMKzLDO33QBMDnvN4lFRcAtHi3uJKTYkBsIEBdZW+hRoOuoA+tPP8q0XpHSM2JYqwfARTD3ZxfLX0E/AOhKSJfhYv1tQAAAABJRU5ErkJggg==" />
          <span id="zan">${goodbean.dianzancishu}</span></span>

            <p class="deta_con" style="font-size: 0.8rem">${goodbean.gname}</p>

            <h4 class="weui-media-box__title" style="color: #ff0000; font-weight: 900;">￥${goodbean.price}元&nbsp;&nbsp;<del style="font-size:4vw; color:#6d6d72;">${goodbean.zhiqianjiage}元</del></h4>



            <h4 class="weui-media-box__title" style="color: #D02090; font-weight: 600;"><c:if test="${goodbean.openid!=null && goodbean.openid!=''}"><a href="${goodbean.wangpandizhi}"><div style="width:120px;height:40px"><img src="/wweixin/weixin/images/54.png"></div></a></c:if></h4>
            <h4 class="weui-media-box__title" style="color: #D02090; font-weight: 600;"><c:if test="${goodbean.openid!=null && goodbean.openid!=''}">网盘密码（轻点复制）：<a href="tel:${goodbean.wangpanmima}">${goodbean.wangpanmima}</a></c:if></h4>


            <h4 class="weui-media-box__title" style="color: #D02090; font-weight: 600;"><c:if test="${goodbean.shifoumianfei=='Y'}"><a style="width:120px;height:40px" href="${goodbean.wangpandizhi}"><img src="/wweixin/weixin/images/54.png"></a></c:if></h4>
            <h4 class="weui-media-box__title" style="color: #D02090; font-weight: 600;"><c:if test="${goodbean.shifoumianfei=='Y' }">网盘密码（轻点复制）：<a href="tel:${goodbean.wangpanmima}">${goodbean.wangpanmima}</a></c:if></h4>

        </div>
        <div class="perform topline">
            <div class="fill_name clearfix topline">
                <ul>
                    <li class="fill fl name_color">图文详情</li>
                    <li class="addr_name fill fr">评价</li>
                </ul>
            </div>
            <div class="name_perf details_padding">
                <div class="name_box " style="display: block;">
                    <div style="margin-bottom: 5px;margin-top: 5px;padding: 3px; width:100%;  min-height:3rem;background-color: #fff"><p style="font-size: 16px">${goodbean.describes}</p></div>
                    <img style="padding-left: 10px;padding-right: 10px" src="/wweixin/weixin/images/${goodbean.jieshaotupian}" />
                    <div style="height: 60px"></div>
                </div>
                <div class="name_box detail_width_con">
                    <div id="wrapper">
                        <div id="scroller" class="commentBox">

                            <ul id="list" style="padding-bottom:1rem;">
<c:forEach items="${pingjia }" var="pjbean">
                                <li>
                                    <div >
                                        <div class="commentTxt">
                                            <div class="tab">&nbsp;  <span class="fr grey_s">${pjbean.pingjiashijian}</span><span class="fl font1_6 txt-gre-s">${pjbean.username}</span>&nbsp; </div>
                                            <div class="tab"><span>${pjbean.neirong}</span>&nbsp; </div>
                                        </div>
                                    </div>
                                    <div style="background-color:#D5D5D5;width:800px;height:1px;margin:0px auto;padding:0px;overflow:hidden;"></div>
                                </li>
</c:forEach>


                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${goodbean.shifoumianfei!='Y'}">
    <div class="filter-btn dis-box">
        <a type="button" class="btn-cart box-flex n-iphone5-top1 j-goods-attr j-show-div" onclick="yuzhifu(${goodbean.id})">立即购买</a>
    </div>
</c:if>


<script type="text/javascript" src="/wweixin/weixin/js/rem.js" ></script>
<script type="text/javascript" src="/wweixin/weixin/js/jquery-1.11.3.min.js" ></script>
<script type="text/javascript" src="/wweixin/weixin/js/fill_name.js" ></script>

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
    function dianzan(shangpinid) {
        // alert('nihao');
        //  $('#zan').html(parseInt($('#zan').html()) + 1);

        $.ajax(
            { dataType: "text",
                url:"/wweixin/yanzheng/dianzan?shangpinid="+shangpinid+"&openid=${ param["openid"] }",
                async:true,
                dataType: "text",
                success: function (data) {
                    if(data=="chenggong"){
                        $('#zan').html(parseInt($('#zan').html()) + 1);
                    }
                }
            })

    }
    function yuzhifu(shangpinid) {
        var pwd = '';
        $.ajax(
            { dataType: "text",
                url:"/wweixin/yanzheng/yuzhifu?shangpinid="+shangpinid+"&openid=${ param["openid"] }",
                async:true,
                dataType: "text",
                success: function (data) {
                    var json=eval('(' + data + ')');
                    function onBridgeReady(){
                        WeixinJSBridge.invoke(
                            'getBrandWCPayRequest', {
                                "appId":json.appId,     //公众号名称，由商户传入
                                "timeStamp":json.timeStamp+"",         //时间戳，自1970年以来的秒数
                                "nonceStr":json.nonceStr+"", //随机串
                                "package":json.mpackage+"",
                                "signType":json.signType+"",         //微信签名方式：
                                "paySign":json.paySign+""  //微信签名
                            },
                            function(res){
                                //   alert(JSON.stringify(res));
                                if(res.err_msg == "get_brand_wcpay_request:ok" ) {
                                    window.location.href="/wweixin/weixin/html/goumaiwancheng.jsp?shangpinid="+shangpinid+"&openid=${ param["openid"] }";
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


    /* @author:Romey
 * 动态点赞
 * 此效果包含css3，部分浏览器不兼容（如：IE10以下的版本）
*/
    $(function(){
        $("#praise").click(function(){
            var praise_img = $("#praise-img");
            var text_box = $("#add-num");
            var praise_txt = $("#praise-txt");
            var num=parseInt(praise_txt.text());
            if(praise_img.attr("src") == ("/wweixin/weixin/images/yizan.png")){
                $(this).html("<img src='/wweixin/weixin/images/zan.png' id='praise-img' class='animation' />");
                praise_txt.removeClass("hover");
                text_box.show().html("<em class='add-animation'>-1</em>");
                $(".add-animation").removeClass("hover");
                num -=1;
                praise_txt.text(num)
            }else{
                $(this).html("<img src='/wweixin/weixin/images/yizan.png' id='praise-img' class='animation' />");
                praise_txt.addClass("hover");
                text_box.show().html("<em class='add-animation'>+1</em>");
                $(".add-animation").addClass("hover");
                num +=1;
                praise_txt.text(num)
            }
        });
    })
</script>




</body>
</html>
