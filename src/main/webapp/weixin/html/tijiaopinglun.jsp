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
    <title>购买完成</title>
</head>

<script type="text/javascript" src="/wweixin/weixin/js/check.js"></script>
<script type="text/javascript">
    function mycheck() {
        var ispost = true;
        em = get("nr").value;
        if (isNull(em)) {
            get("youxiang").innerHTML = "评价不能为空";
            ispost = false;
        }

        return ispost;
    }



    function get(id){

        return document.getElementById(id);
    }
</script>
<body>



<img src="../images/${param["image1"]}" style="width:100%;">
<div class="weui-cells__title" id="nn">${param["name"]}</div>
<form onsubmit="return mycheck();" action="/wweixin/yanzheng/pingjia?openid=${param["openid"] }&good_id=${param["good_id"]}&order_id=${param["order_id"]}" method="post">

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <textarea id="nr" name="pingjianeirong" class="weui-textarea" placeholder="请输入内容" rows="3"></textarea>

            <div class="weui-textarea-counter" ><span>0</span>/200</div>
        </div>
        <font id="youxiang" color="red" ></font>
    </div>
</div>
<div class="weui-btn-area">
    <button type="submit" class="weui-btn weui-btn_primary"  id="showTooltips">立即提交</button>
</div>
</form>
</body>
</html>