<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AppleBasket</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Humberger Begin -->
		<%@ include file="../Humberger.jsp" %>
    <!-- Humberger End -->

   
    <!-- Header Section Begin -->
    <%@ include file="../header.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>재료종류</span>
						</div>
						<ul>
							<li><a href="#">채소</a></li>
							<li><a href="#">과일</a></li>
							<li><a href="#">견과류</a></li>
							<li><a href="#">유제품</a></li>
							<li><a href="#">신선육</a></li>
							<li><a href="#">수산물</a></li>
							<li><a href="#">귤</a></li>
							<li><a href="#">못난이 상점</a></li>
						</ul>
					</div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    전체카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="어떤 재료가 필요하시나요?">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>안전주소</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">Home</a>
                            <span>안전주소 지도보기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Section Begin -->
      <div class="map" id="map"></div>
    <!-- Contact Section End -->
	
    <!-- Contact Form Begin -->

    <!-- Contact Form End -->

    <!-- Footer Section Begin -->
	<%@ include file="../footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f7365c4645c814b3b6164f85f080385"></script>
		
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = { 
    		center: new kakao.maps.LatLng(35.1465728,126.922251), // 지도의 중심좌표
            level: 4// 지도의 확대 레벨
        };
    
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     
    // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
    var positions = [
        {
            content: "<div><a href='MapView.do?safeSeq=86'>계림1동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1585313602363,126.919635405456)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=88'>계림2동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1570873153994,126.925452875099)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=90'>산수1동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1572914534587,126.930734911488)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=92'>산수2동 주민센터</a></div>",
            latlng: new kakao.maps.LatLng(35.1545742072449,126.936137791695)
        }, {
            content: "<div><a href='MapView.do?safeSeq=94'>지산1동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1490064546024,126.932718285376)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=96'>지산2동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.14797635976776,126.93449254979)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=98'>서남동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1449509557856,126.923162976621)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=100'>학동 주민센터</a></div>",
            latlng: new kakao.maps.LatLng(35.1355885950692,126.922595500778)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=102'>학운동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1355885950692,126.922595500778)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=104'>지원1동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1253005996901,126.935176655008)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=106'>지원2동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1204818933072,126.932841797556)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=108'>양동 주민센터</a></div>",
            latlng: new kakao.maps.LatLng(35.1548927370246,126.900876276515)
        }
        ,{
            content: "<div><a href='MapView.do?safeSeq=110'>양3동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1575228532622,126.894000735493)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=112'>농성1동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1566623139159,126.889745969492)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=114'>농성2동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1503790040099,126.890221188067)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=116'>광천동 주민센터</a></div>",
            latlng: new kakao.maps.LatLng(35.1644926014826,126.880161302938)
        },{
            content: "<div><a href='MapView.do?safeSeq=118'>유덕동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1651109574324,126.851826011293)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=120'>치평동 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1499460946986,126.843339813032)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=82'>충장 주민센터</a></div>", 
            latlng: new kakao.maps.LatLng(35.1491844885509,126.912804112004)
        },
        {
            content: "<div><a href='MapView.do?safeSeq=84'>동명동 주민센터</a></div>",
            latlng: new kakao.maps.LatLng(35.1503152394475,126.927876059465)
        } 
    ];
    
    for (var i = 0; i < positions.length; i ++) {
       
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng // 마커의 위치
        });
    
        var infowindow = new kakao.maps.InfoWindow({
            content: positions[i].content // 인포윈도우에 표시할 내용
        });
    
        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseclick', makeOutListener(infowindow));
    }
    
    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }
    
    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }
    </script>	
		
		
</body>

</html>