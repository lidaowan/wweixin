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
    <title>视频列表</title>
</head>
<body>
<div class="weui-search-bar" id="searchBar" onclick="location.href = '/wweixin/yanzheng/product?openid=${ param["openid"] }'">
    <form class="weui-search-bar__form" style="height: 30px;">
        <div class="weui-search-bar__box">
            <i class="weui-icon-search"></i>
            <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required />
            <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
        </div>
        <label class="weui-search-bar__label" id="searchText">
            <i class="weui-icon-search"></i>
            <span>搜索</span>
        </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
</div>
<c:forEach items="${list }" var="goodbean">
<div class="mui-card" onclick="location.href = '/wweixin/yanzheng/xiangqing?good_id=${goodbean.id}&openid=${ param["openid"] }'">
    <div class="mui-card-content">
        <img src="/wweixin/weixin/images/${goodbean.image1}" alt="" width="100%" />
    </div>
    <div class="mui-card-footer">
        <h5>${goodbean.gname}</h5>
    </div>
</div>
</c:forEach>






</body>
</html>