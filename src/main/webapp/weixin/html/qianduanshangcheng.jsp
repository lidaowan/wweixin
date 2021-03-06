
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>爱到家-社区生鲜</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/alongsty.css" rel="stylesheet">
    
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="css/swiper.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv_min.js"></script>
      <script src="js/respond_min.js"></script>
    <![endif]-->
    
    <style type="text/css">
		<!--
		body{ background:#ffffff;  font-family:"微软雅黑"； }
		-->
    </style>
</head>
  <body >
    <div class="toper navbar-fixed-top">
    	<div class="row color_white " >
      	  <div class="col-xs-2">&nbsp;</div>
          <div class="col-xs-8 text-center font20">酷炫前端</div>
          <div class="col-xs-2"><a href="#"><div class="photo_25" style="margin-top:3px;"><img src="images/icon_soso.png" alt="搜索"></div></a></div>
      	</div>
    </div><!-- toper -->
    <div class="height53"></div>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            	<div class="homephoto"><img src="images/jdt1.jpg"></div>
            </div>
            <div class="swiper-slide">
            	<div class="homephoto"><img src="images/jdt2.jpg"></div>
            </div>
            <div class="swiper-slide">
            	<div class="homephoto"><img src="images/jdt3.jpg"></div>
            </div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
    <!-- Swiper JS -->
    <script src="js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true
    });
    </script><!-- 焦点图 -->
    <div class="height20"></div>
    <div class=" container-fluid">
    	<div class="row">
          <div class="col-xs-3 text-center" >
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_03.jpg"><br>平价蔬菜</div></a>
          </div>
          <div class="col-xs-3  text-center">
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_05.jpg"><br>原生态菜</div></a>
          </div>
          <div class="col-xs-3  text-center" >
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_07.jpg"><br>新鲜水果</div></a>
          </div>
          <div class="col-xs-3  text-center" >
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_09.jpg"><br>水果套餐</div></a>
          </div>
          <div class="height20"></div>
          <div class="col-xs-3 text-center" >
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_15.jpg"><br>散养禽蛋</div></a>
          </div>
          <div class="col-xs-3  text-center">
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_16.jpg"><br>菜谱搭配</div></a>
          </div>
          <div class="col-xs-3  text-center" >
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_17.jpg"><br>农场采摘</div></a>
          </div>
          <div class="col-xs-3  text-center" >
          		<a class="cgray" href="list.html"><div class="photo_60"><img src="images/pic_18.jpg"><br>有机食物</div></a>
          </div>
        </div>
        <div class="height20"></div>
        <a href="#"><div class="adphoto"><img src="images/ad1.jpg" class="img-rounded"></div></a>
        <div class="height20"></div>
        <a href="#"><div class="adphoto"><img src="images/jdt2.jpg" class="img-rounded"></div></a>
        <div class="height20"></div>
        <div class="height60"></div>
    </div>
    <div class="height20"></div>
	<div class="footer navbar-fixed-bottom">
    	<div class="row">
          <div class="col-xs-3 text-center" style=" padding-top:5px;">
          		<a class="cgreen" href="index.html"><div class="photo_30"><img src="images/nav11.png"><br>首页</div></a>
          </div>
          <div class="col-xs-3  text-center" style=" padding-top:5px;">
          		<a class="cgray" href="market_info.html"><div class="photo_30"><img src="images/nav2.png"><br>附近</div></a>
          </div>
          <div class="col-xs-3  text-center" style=" padding-top:5px;">
          		<a class="cgray" href="login.html"><div class="photo_30"><img src="images/nav3.png"><br>购物车</div></a>
          </div>
          <div class="col-xs-3  text-center" style="padding-top:5px;">
          		<a class="cgray" href="login.html"><div class="photo_30"><img src="images/nav4.png"><br>我的</div></a>
          </div>
        </div>
    </div><!-- footer -->
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery_min1_11_2.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>