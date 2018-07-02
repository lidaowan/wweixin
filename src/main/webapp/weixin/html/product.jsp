<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="zh-CN">

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
    <div id="pjax-container" style="padding-bottom: 60px">
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
                    <ul id="j-product-box">
                        <li>
                            <div class="product-div">
                                <a class="product-div-link" href="/app/product/detail?id=50"></a>
                                <img class="product-list-img" src="http://qingful.com/public/uploads/2017-01-11/0c6ef3f0-d7d6-11e6-b4ee-4d604fc4e35b.jpg">
                                <div class="product-text">
                                    <h4>掌微小银耳古田银耳干货白木耳雪耳新鲜银耳糯银耳特产无硫160克</h4>
                                    <p class="dis-box p-t-remark">
                                        <!-- <span class="box-flex">库存：184</span> -->
                                        <p>
                                            <span class="p-price t-first ">￥0.01元
                                        <!-- <small><del>￥569.00元</del></small> -->
                                    </span>
                                        </p>
                                    </p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="product-div">
                                <a class="product-div-link" href="/app/product/detail?id=48"></a>
                                <img class="product-list-img" src="http://qingful.com/public/uploads/2017-01-11/ab236bd0-d7d5-11e6-b4ee-4d604fc4e35b.jpg">
                                <div class="product-text">
                                    <h4>买3送1 相思莲 新鲜百合干 食用百合干百合片粮油干货特产250g</h4>
                                    <p class="dis-box p-t-remark">
                                        <!-- <span class="box-flex">库存：184</span> -->
                                        <p>
                                            <span class="p-price t-first ">￥0.01元
                                        <!-- <small><del>￥569.00元</del></small> -->
                                    </span>
                                        </p>
                                    </p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
        <div class="filter-top" id="scrollUp">
            <i class="iconfont icon-dingbu"></i>
        </div>
        <div id="j-filter-div" class="j-filter-div filter-div ts-5 c-filter-div">
            <div class="mask-filter-div"></div>
            <section class="close-filter-div j-close-filter-div">
                <div class="close-f-btn">
                    <i class="iconfont icon-fanhui"></i>
                    <span>关闭</span>
                </div>
            </section>
            <section class="con-filter-div">
                <form class="hold-height" method="get" id="formFilter" action="/app/product/index">
                    <input type="hidden" name="menu_id" value="70" />
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="price-range padding-all m-top08">
                                <label>价格</label>
                                <div class="price-slider">
                                    <div id="slider-range" class="slider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 0%; width: 0%;"></div>
                                        <a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%;"></a>
                                        <a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%;"></a>
                                    </div>
                                    <div class="slider-info">
                                        <span id="slider-range-amount">0 ~ 0</span>
                                    </div>
                                </div>
                                <input type="hidden" id="min" name="price_min" value="0">
                                <input type="hidden" id="max" name="price_max" value="0">
                            </div>
                            <div class="select-two">
                                <a class="select-title padding-all j-menu-select">
                                    <label class="fl">品牌</label>
                                    <span class="fr t-jiantou j-t-jiantou jian001" id="j-t-jiantou">
                                <em class="fl">全部</em><i class="iconfont icon-jiantou tf-180 ts-2"></i>
                            </span>
                                </a>
                                <ul class="j-sub-menu padding-all j-get-one" data-istrue="true" style="display: none;">
                                    <li class="ect-select" data-attr="0">
                                        <label class="ts-1">全部<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="1">
                                        <label class="ts-1">中外名酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="2">
                                        <label class="ts-1">食品饮料<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="3">
                                        <label class="ts-1">居家生活<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="4">
                                        <label class="ts-1">超市<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="5">
                                        <label class="ts-1">速冻食品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="6">
                                        <label class="ts-1">新鲜水果<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="7">
                                        <label class="ts-1">茶水饮料<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="8">
                                        <label class="ts-1">坚果炒货<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="9">
                                        <label class="ts-1">蔬菜<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="10">
                                        <label class="ts-1">家乐福<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="11">
                                        <label class="ts-1">沃尔玛<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="12">
                                        <label class="ts-1">大润发<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="13">
                                        <label class="ts-1">礼品箱包<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="14">
                                        <label class="ts-1">饿了么<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="15">
                                        <label class="ts-1">简易家具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="16">
                                        <label class="ts-1">护肤美妆<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="17">
                                        <label class="ts-1">美妆护肤<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="18">
                                        <label class="ts-1">白酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="19">
                                        <label class="ts-1">家居清洁<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="20">
                                        <label class="ts-1">大众点评<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="21">
                                        <label class="ts-1">西瓜汁<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="22">
                                        <label class="ts-1">美妆工具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="23">
                                        <label class="ts-1">美食/生鲜<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="24">
                                        <label class="ts-1">休闲食品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="25">
                                        <label class="ts-1">饼干糕点<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="26">
                                        <label class="ts-1">生鲜果蔬<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="27">
                                        <label class="ts-1">粮油干货<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="28">
                                        <label class="ts-1">茶水饮料<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="29">
                                        <label class="ts-1">葡萄酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="30">
                                        <label class="ts-1">居家日用<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="31">
                                        <label class="ts-1">收纳用品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="32">
                                        <label class="ts-1">蜜饯果干<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="33">
                                        <label class="ts-1">糖果/巧克力<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="34">
                                        <label class="ts-1">无糖食品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="35">
                                        <label class="ts-1">啤酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="36">
                                        <label class="ts-1">洋酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="37">
                                        <label class="ts-1">汽车挂件<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="38">
                                        <label class="ts-1">宠物园艺<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="39">
                                        <label class="ts-1">五金工具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="40">
                                        <label class="ts-1">运动户外<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="41">
                                        <label class="ts-1">医药保健<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="42">
                                        <label class="ts-1">鸡尾酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="43">
                                        <label class="ts-1">龙舌兰<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="44">
                                        <label class="ts-1">朗姆酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="45">
                                        <label class="ts-1">金酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="46">
                                        <label class="ts-1">养生酒<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="47">
                                        <label class="ts-1">威士忌<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="48">
                                        <label class="ts-1">果味/无醇<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="49">
                                        <label class="ts-1">牛奶<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="50">
                                        <label class="ts-1">进口咖啡<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="51">
                                        <label class="ts-1">铁观音<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="52">
                                        <label class="ts-1">运动饮料<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="53">
                                        <label class="ts-1">营养冲调<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="54">
                                        <label class="ts-1">乳酸饮料<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="55">
                                        <label class="ts-1">进口零食<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="56">
                                        <label class="ts-1">香水<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="57">
                                        <label class="ts-1">彩妆<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="58">
                                        <label class="ts-1">美甲<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="59">
                                        <label class="ts-1">润肤<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="60">
                                        <label class="ts-1">洗发护理<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="61">
                                        <label class="ts-1">美体工具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="62">
                                        <label class="ts-1">传统滋补<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="63">
                                        <label class="ts-1">禽类蛋品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="64">
                                        <label class="ts-1">肉类<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="65">
                                        <label class="ts-1">火锅食材<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="66">
                                        <label class="ts-1">海产干货<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="67">
                                        <label class="ts-1">新鲜蔬菜<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="68">
                                        <label class="ts-1">面点食品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="69">
                                        <label class="ts-1">洗发护理<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="70">
                                        <label class="ts-1">粮油干货<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="71">
                                        <label class="ts-1">清洁用品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="72">
                                        <label class="ts-1">衣物清洁<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="73">
                                        <label class="ts-1">家庭清洁<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="74">
                                        <label class="ts-1">厨具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="75">
                                        <label class="ts-1">家纺<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="76">
                                        <label class="ts-1">灯具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="77">
                                        <label class="ts-1">床品套件<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="78">
                                        <label class="ts-1">地毯坐垫<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="79">
                                        <label class="ts-1">餐具用品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="80">
                                        <label class="ts-1">母婴用品<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="81">
                                        <label class="ts-1">海外直采<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="82">
                                        <label class="ts-1">男士护理<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="83">
                                        <label class="ts-1">面膜<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="84">
                                        <label class="ts-1">爽肤水<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="85">
                                        <label class="ts-1">润手霜<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="86">
                                        <label class="ts-1">礼品文具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="87">
                                        <label class="ts-1">头枕腰靠<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="88">
                                        <label class="ts-1">运动配件<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="89">
                                        <label class="ts-1">山地车<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="90">
                                        <label class="ts-1">多肉植物<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="91">
                                        <label class="ts-1">鞋靴/箱包<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="92">
                                        <label class="ts-1">内衣配饰<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="93">
                                        <label class="ts-1">手机数码<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="94">
                                        <label class="ts-1">珠宝/配饰<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="95">
                                        <label class="ts-1">运动户外<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="96">
                                        <label class="ts-1">鲜花/宠物<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="97">
                                        <label class="ts-1">图书乐器<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="98">
                                        <label class="ts-1">畅销书<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="99">
                                        <label class="ts-1">小说<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="100">
                                        <label class="ts-1">当代文学<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="101">
                                        <label class="ts-1">历史<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="102">
                                        <label class="ts-1">文学<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="103">
                                        <label class="ts-1">世界名著<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="104">
                                        <label class="ts-1">散文散笔<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="105">
                                        <label class="ts-1">传记<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="106">
                                        <label class="ts-1">外国文学<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="107">
                                        <label class="ts-1">宠物服饰<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="108">
                                        <label class="ts-1">宠物笼子<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="109">
                                        <label class="ts-1">宠物玩具<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="110">
                                        <label class="ts-1">宠物窝垫<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="111">
                                        <label class="ts-1">狗狗<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="112">
                                        <label class="ts-1">狗狗零食<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="113">
                                        <label class="ts-1">狗狗主粮<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="114">
                                        <label class="ts-1">猫咪<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="115">
                                        <label class="ts-1">猫咪零食<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="116">
                                        <label class="ts-1">猫咪主粮<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="117">
                                        <label class="ts-1">VIVO<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="118">
                                        <label class="ts-1">HuaWei/华为<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="119">
                                        <label class="ts-1">老年手机<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="120">
                                        <label class="ts-1">Meizu/魅族<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="121">
                                        <label class="ts-1">Apple/苹果<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="122">
                                        <label class="ts-1">Samsung/三星<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="123">
                                        <label class="ts-1">MIUI/小米<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="124">
                                        <label class="ts-1">保暖套装<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="125">
                                        <label class="ts-1">发饰<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="126">
                                        <label class="ts-1">睡衣/家居服套装<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="127">
                                        <label class="ts-1">戒指指环<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="128">
                                        <label class="ts-1">文胸<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="129">
                                        <label class="ts-1">腰带/皮带/腰链<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="130">
                                        <label class="ts-1">短袖T恤<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="131">
                                        <label class="ts-1">情侣运动装<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="132">
                                        <label class="ts-1">球服<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="133">
                                        <label class="ts-1">套头衫<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="134">
                                        <label class="ts-1">运动短裤<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="135">
                                        <label class="ts-1">运动夹克<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="136">
                                        <label class="ts-1">运动套装<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="137">
                                        <label class="ts-1">运动长裤<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="138">
                                        <label class="ts-1">长袖T恤<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="139">
                                        <label class="ts-1">动感单车<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="140">
                                        <label class="ts-1">篮球<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="141">
                                        <label class="ts-1">溜冰鞋<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="142">
                                        <label class="ts-1">跑步机<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="143">
                                        <label class="ts-1">甩脂机<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="144">
                                        <label class="ts-1">踏步机<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="145">
                                        <label class="ts-1">哑铃<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="146">
                                        <label class="ts-1">羽毛球拍<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="147">
                                        <label class="ts-1">指压板<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="148">
                                        <label class="ts-1">Casio<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="149">
                                        <label class="ts-1">cK<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="150">
                                        <label class="ts-1">zippo<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="151">
                                        <label class="ts-1">菜百首饰<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="152">
                                        <label class="ts-1">潮宏基<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="153">
                                        <label class="ts-1">京润珍珠<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="154">
                                        <label class="ts-1">六福珠宝<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="155">
                                        <label class="ts-1">通灵珠宝<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="156">
                                        <label class="ts-1">谢瑞麟<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="157">
                                        <label class="ts-1">壹博千金<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="158">
                                        <label class="ts-1">中国黄金<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="159">
                                        <label class="ts-1">周大福<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="160">
                                        <label class="ts-1">周大生<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="161">
                                        <label class="ts-1">周生生<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="162">
                                        <label class="ts-1">佐卡伊<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="163">
                                        <label class="ts-1">单肩包<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="164">
                                        <label class="ts-1">迷你包<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="165">
                                        <label class="ts-1">手提包<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="166">
                                        <label class="ts-1">斜挎包<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="167">
                                        <label class="ts-1">单鞋<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="168">
                                        <label class="ts-1">短靴<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="169">
                                        <label class="ts-1">帆布鞋<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="170">
                                        <label class="ts-1">防水台单鞋<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="171">
                                        <label class="ts-1">过膝靴<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="172">
                                        <label class="ts-1">妈妈鞋<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="173">
                                        <label class="ts-1">马丁靴<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="174">
                                        <label class="ts-1">平底鞋<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="175">
                                        <label class="ts-1">小白鞋<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="176">
                                        <label class="ts-1">靴子<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="177">
                                        <label class="ts-1">雪地靴<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="178">
                                        <label class="ts-1">运动风<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="179">
                                        <label class="ts-1">中筒靴<i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <li class="ect-select" data-attr="180">
                                        <label class="ts-1"><i class="fr iconfont icon-gou ts-1"></i></label>
                                    </li>
                                    <input type="hidden" name="category" value="0">
                                </ul>
                            </div>
                            <div class="ect-button-more dis-box padding-all">
                                <a class="box-flex btn-reset j-filter-reset" onclick="javascript:clear_filter();">清空选项</a>
                                <button type="submit" class="box-flex btn-submit">确定</button>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
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
            <form name="formSrh" class="validforms" action="/app/product/index" method="get" onsubmit="searchClose()">
                <div class="text-all dis-box j-text-all">
                    <!--<a class="a-icon-back j-close-search" href="javascript:"><i-->
                    <!--        class="iconfont icon-jiantou is-left-font"></i></a>-->
                    <div class="box-flex input-text">
                        <input id="newinput" name="name" class="j-input-text" type="text" placeholder="请输入搜索关键词！" autofocus="autofocus" maxlength="10" required>
                        <i class="iconfont icon-guanbi2 is-null j-is-null"></i>
                    </div>
                    <button type="submit" class="btn-submit">搜索</button>
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
        <a id="link_index" href="index.html" class="box-flex nav-list">
            <i class="nav-box i-home"></i><span>首页</span>
        </a>

        <a id="link_user" href="user.html" class="box-flex nav-list">
            <i class="nav-box i-user"></i><span>我的</span>
        </a>
    </footer>
    <script type="text/javascript" src="/wweixin/weixin/js3/jquery.pjax.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/nprogress.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/jquery.json.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/common.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/jquery.more.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/utils.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/jquery.swiper.min.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/bootstrap.min.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/jquery.scrollUp.min.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/validform.js"></script>
    <script type="text/javascript" src="/wweixin/weixin/js3/app.js"></script>
    <script type="text/javascript">
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
