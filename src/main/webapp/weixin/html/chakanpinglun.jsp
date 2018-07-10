<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link href="/wweixin/weixin/css/WeUI/weui.min.css" rel="stylesheet" />
    <link href="/wweixin/weixin/css/mui/mui.min.css" rel="stylesheet" />


    <style>
        body {
            font-family: 'Microsoft YaHei';
        }

        p {
            font-size: 4.5vw;
        }
    </style>
    <title>购买完成</title>
</head>





<img src="/wweixin/weixin/images/${param["image1"]}" style="width:100%;">
<div class="weui-cells__title" id="nn">${param["name"]}</div>
<form onsubmit="return mycheck();" action="/wweixin/yanzheng/pingjia?openid=${param["openid"] }&good_id=${param["good_id"]}&order_id=${param["order_id"]}" method="post">

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <textarea readonly="readonly" id="nr" name="pingjianeirong" class="weui-textarea" rows="3" >${neirong}</textarea>

            </div>

        </div>
    </div>
    <div class="weui-btn-area">
        <a  href="javascript:window.location.href = document.referrer" class="weui-btn weui-btn_primary"  id="showTooltips">返回</a>
    </div>
</form>
</body>
</html>