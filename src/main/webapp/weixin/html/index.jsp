
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


    <link rel="stylesheet" href="/wweixin/weixin/css2/app.css">



    <style>
        body {
            font-family: 'Microsoft YaHei';
        }

        p {
            font-size: 4.5vw;
        }
        h5 {
            padding-top: 8px;
            padding-bottom: 8px;
            text-indent: 12px;
        }

        .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body {
            font-size: 15px;
            margin-top: 8px;
            color: #333;
        }
        .mui-bar-nav ~ .mui-content {
            padding-top: 0;
        }
    </style>
    <title>首页</title>
</head>
<body>
<!-- <header class="mui-bar mui-bar-nav">
   <h1 class="mui-title">微信平台视频付费系统</h1>
    <a href="gerenzhongxin" class="mui-pull-right"><img style="width:10vw; height:10vw; margin-top:2vw; margin-right:-1vw;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAEAklEQVR4Xu2agZENQRCG/4sAESACRIAIEAEiQASIABEgAkSACBABIkAE1Kemq8a73bc7O3+ve/V2qq7e3t1ub/fff/d097wTHfk6OXL7tQGwMeDIEdhC4MgJsCXB/xEC5yVdkXRVEtesn5I+S/pSrlcj5loAYOhdSbcl3Ziw7oOkt5JerIHCGgBg+BNJlyqDPhaP43kWAMGI69U938pzrzOByAQAo14Wr2MDRj+XhIfD8F3beAaGABhhwoIN97NCIwsADHlfvPpL0kNJrxo9ea8Adq6w5WYGCBkA1MaT1Ih76LxkERYABxtIknYQMgCA9ngP46HzGN3nAgKgGH+xgEE42JYbAAyG+tCeaxR3LJhA7iAcYAHXluUG4FOJ+0clfi1KFiEkxscF1GsuwU4AiPU3kr7vbHkuXZFDLiEU7pTdoVu2EwCSFXt+hvfDUHaTZ5KoDcgz3csJwI9S0FzuyPpTBpELCDMS64Wpm+f83wUAmRoASH5R3895/5J7MJ5kCAC9O4ytG4zsT7U3VesvMbp+hh2AktmyG7gYsAFQ9v+NASuEQNQa1ALdhZYrBIjR3yVQnTKH8oX1PU5l8QZNi61IGbA+ii36DLbE7uUEgF7/wUSRwj0USxRNFDNBYYzh7xQ3/J2CZ2hFsfW0zAzOFAB1kUJ8DrXAAdI+xRmFDQHAROlredAS/8hyMgB54SGmOITC0AIoDOQzpj5QGjYA0Fhio88gBGxlcAYAeAkDqNTo21unQGPMIDSYM1Bp8o7uCjBe5GYAckNZrh0guOX9A3IGADUIvU0LfQVxz6cDzFMMywKAFxHnKM4go2eRF0iofNpXJgB2ZTMEbgBkoLpHJm1snAmSzeO0CIrzE2eENFWrrGwGxJkgmby1dGU7jYrRtu3topoFAJ5lgrs7t6PgiaOx8Do6BRviaCwKpNAXICh/lx6wjLLJDQAGMLSsDX9XJritRREyqPxuVdojg6GrjRFOAFCWai1mgtHU9CqLvGiiwAJ51ASU293LBQBejwaGBIb33HQlTGBAHKEDCmzoWg4A4iwQRTLPBMLQOBvgdwDpOivsBSCMd58FTnm1PivsAqEHgOjt1zY+wKlBGJshTAG5eB5Qd2i24cSktqdviCEM/1nULC1hAMmIyWxah9YIRDiD3WFsEmWtA2Iyw/7O1ncWFlsi9cK+SdSgnq0MqL8AYZ3MdKIIG9l2m79A0QpA5hcgOjH4O3do/gJFKwDWQ4leiweeb9ZvA6DRC80IN8rvvb1Zv6UM6J3z9Ro69nzoNduu2TeWNwbCWQa45M62a/aNRTP2/dbJjsuouXKYJM1ulVsBmKvEwdy3AXAwrkpSdGNAErAHI3ZjwMG4KknRo2fAHyptzUEKi1ngAAAAAElFTkSuQmCC"/></a>
</header> -->

<div class="mui-content">
    <div id="slider" class="mui-slider">
        <div class="mui-slider-group mui-slider-loop">
            <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="#">
                    <img src="/wweixin/weixin/images/index2.jpeg">
                    <p class="mui-slider-title">网络行业资讯</p>
                </a>
            </div>
            <div class="mui-slider-item">
                <a href="#">
                    <img src="/wweixin/weixin/images/index1.jpeg">
                    <p class="mui-slider-title">求职利器</p>
                </a>
            </div>
            <%--<div class="mui-slider-item">--%>
                <%--<a href="#">--%>
                    <%--<img src="/wweixin/weixin/images/51.jpg">--%>
                    <%--<p class="mui-slider-title">真实简历，全网独家</p>--%>
                <%--</a>--%>
            <%--</div>--%>
            <%--<div class="mui-slider-item">--%>
                <%--<a href="#">--%>
                    <%--<img src="/wweixin/weixin/images/31.jpg">--%>
                    <%--<p class="mui-slider-title">海量简历模板套餐2免费赠送</p>--%>
                <%--</a>--%>
            <%--</div>--%>
            <div class="mui-slider-item">
                <a href="#">
                    <img src="/wweixin/weixin/images/index2.jpeg">
                    <p class="mui-slider-title">网络行业资讯</p>
                </a>
            </div>
            <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="#">
                    <img src="/wweixin/weixin/images/index1.jpeg">
                    <p class="mui-slider-title">求职利器</p>
                </a>
            </div>
        </div>
        <div class="mui-slider-indicator mui-text-right">
            <div class="mui-indicator mui-active"></div>
            <div class="mui-indicator"></div>
            <%--<div class="mui-indicator"></div>--%>
            <%--<div class="mui-indicator"></div>--%>
        </div>
    </div>
</div>
<div class="weui-search-bar" id="searchBar">
    <form class="weui-search-bar__form" style="height: 30px;" onclick="javascript:location.href = '/wweixin/yanzheng/product?openid=${ param["openid"] }'">
        <div class="weui-search-bar__box">
            <i class="weui-icon-search"></i>
            <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required />
            <a  class="weui-icon-clear" id="searchClear"></a>
        </div>
        <label class="weui-search-bar__label" id="searchText">
            <i class="weui-icon-search"></i>
            <span>搜索</span>
        </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
</div>

<div class="mui-content" style="background-color:#fff">
    <h5 style="background-color:#efeff4">真实简历<a href="/wweixin/yanzheng/shangpinliebiao?gclass=jianli&openid=${ param["openid"] }" style="float:right; margin-right:10px;">更多</a></h5>
    <ul class="mui-table-view mui-grid-view">
<c:forEach items="${jianliList }" var="goodbean">
        <li class="mui-table-view-cell mui-media mui-col-xs-6">
            <a href="/wweixin/yanzheng/xiangqing?good_id=${goodbean.id}&openid=${ param["openid"] }">
                <img class="mui-media-object" src="/wweixin/weixin/images/${goodbean.image1}">
                <div class="mui-media-body">${goodbean.gname}</div>
            </a>
        </li>

</c:forEach>


    </ul>
</div>

<div class="mui-content" style="background-color:#fff">
    <h5 style="background-color:#efeff4">免费简历模板<a href="/wweixin/yanzheng/shangpinliebiao?gclass=jianlimuban&openid=${ param["openid"] }" style="float:right; margin-right:10px;">更多</a></h5>
    <ul class="mui-table-view mui-grid-view">
<c:forEach items="${dashujushipinList }" var="goodbean">
        <li class="mui-table-view-cell mui-media mui-col-xs-6">
            <a href="/wweixin/yanzheng/xiangqing?good_id=${goodbean.id}&openid=${ param["openid"] }">
                <img class="mui-media-object" src="/wweixin/weixin/images/${goodbean.image1}">
                <div class="mui-media-body">${goodbean.gname}</div>
            </a>
        </li>
</c:forEach>
    </ul>
</div>

<c:if test="${javashipinList[0]!=null}">
<div class="mui-content" style="background-color:#fff">
    <h5 style="background-color:#efeff4">Java视频<a href="/wweixin/yanzheng/shangpinliebiao?gclass=javashipin&openid=${ param["openid"] }" style="float:right; margin-right:10px;">更多</a></h5>
    <ul class="mui-table-view mui-grid-view">
        <c:forEach items="${javashipinList }" var="goodbean">
            <li class="mui-table-view-cell mui-media mui-col-xs-6">
                <a href="/wweixin/yanzheng/xiangqing?good_id=${goodbean.id}&openid=${ param["openid"] }">
                    <img class="mui-media-object" src="/wweixin/weixin/images/${goodbean.image1}">
                    <div class="mui-media-body">${goodbean.gname}</div>
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
</c:if>

<div style="height: 80px"></div>


<footer class="footer-nav dis-box">
    <a id="link_index" href="/wweixin/yanzheng/shouye?openid=${ param["openid"] }" class="box-flex nav-list">
        <i class="nav-box i-home"></i><span>首页</span>
    </a>


    <a id="link_user" href="/wweixin/yanzheng/gerenzhongxin?openid=${ param["openid"] }" class="box-flex nav-list" >
        <i class="nav-box i-user"></i><span>我的</span>
    </a>
</footer>


<script src="/wweixin/weixin/js/mui.min.js"></script>
<script>
    mui.init({
        swipeBack: true //启用右滑关闭功能
    });
    var slider = mui("#slider");
    slider.slider({
        interval: 5000
    });
</script>
</body>
</html>
