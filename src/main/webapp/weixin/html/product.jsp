
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Expires" CONTENT="0">
    <meta http-equiv="Cache-Control" CONTENT="no-cache">
    <meta http-equiv="Pragma" CONTENT="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="description" content="">
    <meta name="keywords" content="0">
    <title>微信商城</title>
    <link rel="stylesheet" href="/wweixin/weixin/css3/bootstrap.min.css">
    <link rel="stylesheet" href="/wweixin/weixin/css3/swiper.min.css">
    <link rel="stylesheet" href="/wweixin/weixin/css3/font-awesome.min.css">
    <link rel="stylesheet" href="/wweixin/weixin/css3/app.css">
    <link rel="stylesheet" href="/wweixin/weixin/css3/style.css">
    <link rel="stylesheet" href="/wweixin/weixin/css3/nprogress.css">
    <script type="text/javascript" src="/wweixin/weixin/js3/jquery.min.js"></script>
</head>

<body style="max-width:640px;">
<div  style="padding-bottom: 60px">
    <style>
        a.a-sequence {
            line-height: 3.8rem;
            margin-right: 0.5rem;
        }

        a.s-filter {
            line-height: 3rem;
            padding-left: 0rem;
        }
    </style>
    <div class="con">
        <div class="category">
            <section class="search">
                <div class="text-all dis-box j-text-all text-all-back">
                    <a class="a-icon-back j-close-search" href="javascript:history.go(-1)"><i
                            class="iconfont icon-jiantou is-left-font"></i></a>
                    <div class="box-flex input-text n-input-text i-search-input">
                        <a class="a-search-input j-search-input" href="javascript:void(0)" onclick="searchOpen()"></a>
                        <i class="iconfont icon-sousuo"></i>
                        <input class="j-input-text" type="text" placeholder="请输入您搜索的关键词!">
                        <i class="iconfont icon-guanbi1 is-null j-is-null"></i>
                    </div>
                    <a class="a-sequence j-a-sequence" onclick="jSequence(this)"><i class="iconfont icon-pailie" data="1"></i></a>
                </div>
            </section>
            <section class="product-sequence dis-box">
                <a class="box-flex active" onclick="goSort(this)" data-sort="rank" data-rule="desc">默认</a>
                <a class="box-flex" onclick="goSort(this)" data-sort="sale" data-rule="asc">销量<i class="iconfont icon-xiajiantou"></i></a>
                <a class="box-flex" onclick="goSort(this)" data-sort="visit" data-rule="asc">人气<i class="iconfont icon-xiajiantou"></i></a>
                <a class="box-flex" onclick="goSort(this)" data-sort="price" data-rule="asc">价格<i class="iconfont icon-xiajiantou"></i></a>
                <!-- <a href="#j-filter-div" class="box-flex s-filter j-s-filter">筛选</a> -->
            </section>
            <section class="product-list j-product-list product-list-medium" data="1">
                <div id="pjax-container">
                <ul id="j-product-box">
<c:forEach items="${list }" var="goodbean">
                    <li>
                        <div class="product-div">
                            <a class="product-div-link" href="/wweixin/yanzheng/xiangqing?good_id=${goodbean.id}&openid=${ param["openid"] }"></a>
                            <img class="product-list-img" src="/wweixin/weixin/images/${goodbean.image1}">
                            <div class="product-text">
                                <h4>${goodbean.gname}</h4>

                                     <span class="box-flex">销量：${goodbean.xiaoliang}</span>

                                            <span class="p-price t-first ">￥${goodbean.price}元
                                                <!-- <small><del>￥569.00元</del></small> -->
                                    </span>
                                </p>
                                </p>
                            </div>
                        </div>
                    </li>
</c:forEach>

                </ul>
                </div>
            </section>
        </div>
    </div>


    <script type="text/javascript">
        function goSort(obj) {
            obj = $(obj);
            var url = window.location.href;
            if (url.indexOf('sort') > 0) {
                var link = url.split('&');
                link.pop();
                url = link.join('&');
            }

            url += '&sort=' + obj.attr('data-sort') + '_' + obj.attr('data-rule');
            $.pjax({
                url: url,
                container: '#pjax-container'
            })
        }

        $(function() {
            $('.ect-select').click(function() {
                var data = $(this).attr('data-attr');
                $(this).siblings('input[type="hidden"]').val(data);
            })
        })
    </script>
</div>
<div class="search-div ts-3">
    <section class="search">
        <form name="formSrh" class="validforms" action="/wweixin/yanzheng/product" method="get" onsubmit="searchClose()">
            <div class="text-all dis-box j-text-all">
                <!--<a class="a-icon-back j-close-search" href="javascript:"><i-->
                <!--        class="iconfont icon-jiantou is-left-font"></i></a>-->
                <div class="box-flex input-text">
                    <input name="openid" value="${ param["openid"] }" style="display:none">
                    <input id="newinput" name="name" class="j-input-text" type="text" placeholder="请输入搜索关键词！" autofocus="autofocus" maxlength="10" required>
                    <i class="iconfont icon-guanbi2 is-null j-is-null"></i>
                </div>
                <button onclick="btn();" type="button" class="btn-submit">搜索</button>
            </div>
        </form>
    </section>
    <section class="search-con">
        <div class="swiper-scroll history-search swiper-container-vertical swiper-container-free-mode">
            <div class="swiper-wrapper" style="transition-duration: 0ms;">
                <div class="swiper-slide swiper-slide-active">
                    <p>
                        <label class="fl">热门搜索</label>
                    </p>
                    <ul class="hot-search a-text-more">
                        <li class="w-3">
                            <a href="/app/product/index?name=零食" onclick="searchClose()" style="border:1px solid #efefef;border-radius:4px;"><span>零食</span></a>
                        </li>
                        <li class="w-3">
                            <a href="/app/product/index?name=羊排" onclick="searchClose()" style="border:1px solid #efefef;border-radius:4px;"><span>羊排</span></a>
                        </li>
                        <li class="w-3">
                            <a href="/app/product/index?name=芒果" onclick="searchClose()" style="border:1px solid #efefef;border-radius:4px;"><span>芒果</span></a>
                        </li>
                        <li class="w-3">
                            <a href="/app/product/index?name=一动网" onclick="searchClose()" style="border:1px solid #efefef;border-radius:4px;"><span>一动网</span></a>
                        </li>
                    </ul>
                    <p class="hos-search">
                        <label class="fl">最近搜索</label>
                        <!--<span class="fr" onclick="javascript:clearHistroy();"><i-->
                        <!--class="iconfont icon-xiao10 is-xiao10 jian-top fr"></i></span>-->
                    </p>
                    <ul class="hot-search a-text-more a-text-one" id="search_histroy">
                        <li>
                            <a href="/app/product/index?name=羊排" onclick="searchClose()">
                                <span>羊排</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=零食" onclick="searchClose()">
                                <span>零食</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=85" onclick="searchClose()">
                                <span>85</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=芒果" onclick="searchClose()">
                                <span>芒果</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=零食" onclick="searchClose()">
                                <span>零食</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=零食" onclick="searchClose()">
                                <span>零食</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=零食" onclick="searchClose()">
                                <span>零食</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=酸" onclick="searchClose()">
                                <span>酸</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=零食" onclick="searchClose()">
                                <span>零食</span>
                            </a>
                        </li>
                        <li>
                            <a href="/app/product/index?name=芒果" onclick="searchClose()">
                                <span>芒果</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="swiper-scrollbar" style="opacity: 0; transition-duration: 400ms;">
                <div class="swiper-scrollbar-drag" style="transition-duration: 0ms;"></div>
            </div>
        </div>
    </section>
    <footer class="close-search j-close-search" onclick="searchClose()">
        点击关闭
    </footer>
</div>
<footer class="footer-nav dis-box">
    <a id="link_index" href="/wweixin/yanzheng/shouye?openid=${ param["openid"] }" class="box-flex nav-list">
        <i class="nav-box i-home"></i><span>首页</span>
    </a>

    <a id="link_user" href="/wweixin/yanzheng/gerenzhongxin?openid=${ param["openid"] }" class="box-flex nav-list">
        <i class="nav-box i-user"></i><span>我的</span>
    </a>
</footer>
<script type="text/javascript" src="/wweixin/weixin/js3/jquery.pjax.js"></script>


<script type="text/javascript" src="/wweixin/weixin/js3/common.js"></script>
<%--<script type="text/javascript" src="/wweixin/weixin/js3/jquery.json.js"></script>--%>
<%--<script type="text/javascript" src="/wweixin/weixin/js3/jquery.more.js"></script>--%>
<%--<script type="text/javascript" src="/wweixin/weixin/js3/jquery.swiper.min.js"></script>--%>



<script type="text/javascript" src="/wweixin/weixin/js3/app.js"></script>
<script type="text/javascript">
    function btn() {
        searchClose();
       var nr = document.getElementById('newinput').value;

var url = '/wweixin/yanzheng/product?openid=${ param["openid"] }&name='+nr+'&sort=';
        $.pjax({
            url: url,
            container: '#pjax-container'
        })

    }


    function changeNav() {
        $('#link_index').removeClass('active');
        $('#link_menu').removeClass('active');
        $('#link_cart').removeClass('active');
        $('#link_user').removeClass('active');

        // 改变导航
        var link = location.pathname;
        if (link == '/') {
            $('#link_index').addClass('active');
        }
        if (link.indexOf('app/index') > 0) {
            $('#link_index').addClass('active');
        } else if (link.indexOf('app/menu') > 0) {
            $('#link_menu').addClass('active');
        } else if (link.indexOf('app/cart') > 0) {
            $('#link_cart').addClass('active');
        } else if (link.indexOf('app/user') > 0) {
            $('#link_user').addClass('active');
        } else if (link.indexOf('app/order') > 0) {
            $('#link_user').addClass('active');
        } else if (link.indexOf('app/public') > 0) {
            $('#link_user').addClass('active');
        } else if (link.indexOf('app/product') > 0) {
            $('#link_menu').addClass('active');
        } else {
            $('#link_index').addClass('active');
        }
    }

    (function($) {
        changeNav();

        NProgress.configure({
            template: '<div class="bar" role="bar" style="background: #18ac16;height: 3px"><div class="peg" style="box-shadow: 0 0 10px #fff, 0 0 5px #18ac16;"></div></div>'
        });
        if ($.support.pjax) {
            $.pjax.defaults.timeout = 6000;
            $(document).on('click', 'a[target!=_blank][target!=_self]', function(event) {
                if ($(this).attr('pjax-push-false') == undefined) {
                    $.pjax.click(event, '#pjax-container');
                } else {
                    $.pjax.click(event, '#pjax-container', {
                        push: false
                    });
                }
            });
            $(document).on('pjax:send', function() {
                NProgress.start();
            });
            $(document).on('pjax:complete', function() {
                NProgress.done();
                changeNav();
            });
            $(document).on('pjax:popstate', function() {
                changeNav();
            });
            $(document).on('pjax:timeout', function(event) {
                // Prevent default timeout redirection behavior
                event.preventDefault()
            });
            $(document).on('pjax:beforeReplace', function(contents, options) {
                //处理服务器返回的json通知
                if (options['0'].data != undefined) {
                    options['0'].data = '';
                }
            });
            $(document).on('submit', 'form', function(event) {
                //隐藏返回值
                $.pjax.submit(event, '#pjax-container', {
                    push: false
                });
            });
            $(document).on('pjax:success', function(event, data, status, xhr) {

                //正则匹配JSON
                if (data.match("^\{(.+:.+,*){1,}\}$")) {
                    var data = JSON.parse(data);

                    if (data.data) {
                        if (data.data.indexOf('/app/pay/wxpay/index') != -1 || data.data.indexOf('/app/pay/alipay/index') != -1) {
                            pay(data.data);
                        } else {
                            $.pjax({
                                url: data.data,
                                container: '#pjax-container',
                                push: false
                            })
                        }
                    }
                }
            });
        }
    })(jQuery);
</script>
</body>

</html>
