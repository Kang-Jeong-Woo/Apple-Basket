<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodsharing.DAO.*"%>
<%@page import="com.foodshring.VO.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>AppleBasket | shop detail</title>

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
    <style type="text/css">
    	.starYellow{
    		color:yellow;
    		text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
    	}
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Humberger Begin -->
		<%@ include file="./Humberger.jsp" %>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <%@ include file="./header.jsp" %>
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
    <% 
    	t_memberVO mem_vo = (t_memberVO)session.getAttribute("vo");
	    t_itemDAO item_dao = new t_itemDAO();
    	int itemName = Integer.parseInt(request.getParameter("itemSeq"));
    	ArrayList<t_itemJoinVO> list = item_dao.getdetail(itemName);
    	System.out.println(list.size());
		String str = list.get(0).getMbId();
		String[] str_id = str.split("@");
	%>
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><%= list.get(0).getItemName()%></h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">Home</a>
                            <span><%= list.get(0).getItemName()%></span>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="./img/<%= list.get(0).getItemImg1()%>" alt="fresh">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
  							<img src="./img/<%= list.get(0).getItemImg1()%>" alt="fresh">
                            <img src="./img/<%= list.get(0).getItemImg2()%>" alt="fresh">
                            <img src="./img/<%= list.get(0).getItemImg3()%>" alt="fresh">
                        </div>
                      
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%= list.get(0).getItemName()%></h3>
                        <div class="product__details__rating">
                            <% 
                            t_reviewDAO reviewdao = new t_reviewDAO();
                            ArrayList<t_reviewVO> review = reviewdao.itemSelect(itemName); 
                            int review_rating = review.get(0).getRoundReview();
                            
                            if(review_rating == 1){
								out.println("<span class='starYellow' style='color: yellow;'>★☆☆☆☆</span>");
							} else if(review_rating == 2){
								out.println("<span class='starYellow' style='color: yellow;'>★★☆☆☆</span>");
							} else if(review_rating == 3){
								out.println("<span class='starYellow' style='color: yellow;'>★★★☆☆</span>");
							} else if(review_rating == 4){
								out.println("<span class='starYellow' style='color: yellow;'>★★★★☆</span>");
							} else if(review_rating == 5){
								out.println("<span class='starYellow' style='color: yellow;'>★★★★★</span>");
							} else {
								out.println("<span class='starYellow' style='color: yellow;'>☆☆☆☆☆</span>");
							}
                      
                            %>
                            <span>(<%=review.get(0).getReviewCount()%> reviews)</span>
                        </div>
                        <div class="product__details__price">
                        <fmt:formatNumber value="<%= list.get(0).getItemPrice()%>" pattern="#,###" />원
                         <h3>(1인당 <fmt:formatNumber value="<%= list.get(0).getItemPrice()/4%>" pattern="#,###"/>원)</h3></div>
                        
                        <p><%= list.get(0).getItemDesc()%></p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" style="width: 100px" id = "SSS" value=
                                    <% if(list.get(0).getItemCate().equals("fish")){%>
	                            <%=list.get(0).getItemQuant()/4%>마리
	                             <%}else if(list.get(0).getItemCate().equals("dairy")){%>
	                            <%=list.get(0).getItemQuant()/4%>ml 
	                         <%}else{%>
	                            <%=list.get(0).getItemQuant()/4%>g 
	                            <%}%>>
                                </div>
                            </div>
                        </div>
                        <%if(vo!=null){ %>
                        <a href="shopping-cart.do?itemSeq=<%=list.get(0).getItemSeq() %>&MbId=<%= vo.getMbId() %>" class="primary-btn">장바구니 추가</a>
                        <%} else { %>
                        <a href="needlogin.jsp" class="primary-btn">장바구니 추가</a>
                        <%} %>
                        <ul>
                        	<li><b>남은 시간</b><span class="clock" data-time="<%= list.get(0).getItemDeadline()%>"> clock</span></li>
                        	<li><b>신청인</b><span> <%= list.get(0).getCurQuant() %>/4
                        	<%
                            	if(list.get(0).getCurQuant()>=3){%>
                            		<span style="color: red;">마감임박!!</span>
                            	<%}
                            %>
                        	</span></li>
                            <li><b>판매자</b><span>
                            <%
                            
                            String userId=list.get(0).getMbId();
                            t_memberDAO fm=new t_memberDAO();
                            t_memberVO tvo=fm.SearchMember(userId);
                            out.print(tvo.getMbName());
                            %>&nbsp;
                            (&nbsp;<%= str_id[0] %>&nbsp;)</span></li>
	                            
                            <li><b>안전주소</b>
                              <%
                              	int r_SafeSeq=0;
                              	String lat=null;
                              	String loc=null;
                              	String m_center=null;
                      			t_safeDAO safe_dao = new t_safeDAO();
                      			ArrayList<t_safeVO> list2 = safe_dao.safeSelect();
                      			for(int i=0; i<list2.size(); i++){
                      				if(list2.get(i).getSafeSeq()==list.get(0).getSafeSeq()){
                      					r_SafeSeq=list2.get(i).getSafeSeq();
                      					lat=list2.get(i).getLatitude();
                      					loc=list2.get(i).getLongitude();
                      					m_center=list2.get(i).getSafeCenter();
                      					out.println(list2.get(i).getSafeAddr());
                      				}
                      			}
							%>
                            </li>
                            <li style="display: none"><b>공유</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
       <br/><br/><br/>
			<div class="container">
				<div class="map__detail__class"><br/>
				   <div class="section-title">
						<h2>판매장소 보기</h2>
					</div>
				</div>
				<div id="map" style="width:100%;height:750px;"></div>
			</div>
			<br/><br/><br/>
			<div class="container">
				<div class="reple__detail__class">
				   <div class="section-title">
						<h2>판매후기</h2>
					</div>
				</div>
				<div>
						<div class="row" align="left"  class="text-left">
							<div class='col-md-12' align="right">
								<%
									if(mem_vo!=null){
								%>
								<form name="fm" action="reviewWrite.do" method="post">
									<input type="hidden" class="itemName" name="itemName" value="<%=itemName%>">
									<input type="hidden" class="form-control" id="mbId" name='mbId' value="<%=mem_vo.getMbId()%>" style='width: 300px; float: left; margin: 1px'>
									<input type="hidden" class="form-control" id="itemSeq" name='itemSeq' value="<%=list.get(0).getItemSeq()%>" style='width: 300px; float: left; margin: 1px'>
									<input type="hidden" class="form-control" id="reviewRating" name="reviewRating">
									${sessionScope.vo.mbName}&nbsp;(&nbsp;${sessionScope.vo.mbId}&nbsp;)&nbsp;&nbsp;&nbsp;
									<div class="rating">
								          <div class="ratefill"></div>
								          <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
								          <label for="rating1"></label>
								          <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
								          <label for="rating2"></label>
								          <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
								          <label for="rating3"></label>
								          <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
								          <label for="rating4"></label>
								          <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
								          <label for="rating5"></label>
                                     </div>
									<button type="button" class="btn btn-primary" id='btnSave' name='btnSave' style='float: right; margin: 1px' onclick="javaScript:submit()">등록하기</button>
									<input type="text" class="form-control" id="reviewContent" name='reviewContent' value="" placeholder="후기를 남겨주세요." style='width: 825px; float: left; margin: 1px'>
									
								</form>
								<%
									}
								%>
								
							</div>
						</div>
						<br/>
						<table class="table table-hover">
							<thead>
							<tr>
								<th style="width: 10%" scope="row" class="text-right">번호</th>
								<th  scope="row" class="text-center" style="width: 10%">평점</th>
								<th  scope="row" class="text-center">내용</th>
								<th style="width: 15%" scope="row" class="text-right">작성자</th>
								<th style="width: 20%" scope="row" class="text-right">작성일자</th>
							</tr>
							</thead>
							<tbody>
							<%
								t_reviewDAO r_dao = new t_reviewDAO();
								int itemSeq=list.get(0).getItemSeq();
								ArrayList<t_reviewVO> reviewList=r_dao.farmerSelect(itemSeq);
								for(int i=0; i<reviewList.size(); i++){
							%>
							<tr>
								<td  scope="row" class="text-right"><%=reviewList.get(i).getReviewSeq()%></td>
								<td  scope="row" class="text-right">
								<%
								if(reviewList.get(i).getReviewRating() == 1){
									out.println("<div class='starYellow'>★☆☆☆☆</div>");
								} else if(reviewList.get(i).getReviewRating() == 2){
									out.println("<div class='starYellow'>★★☆☆☆</div>");
								} else if(reviewList.get(i).getReviewRating() == 3){
									out.println("<div class='starYellow'>★★★☆☆</div>");
								} else if(reviewList.get(i).getReviewRating() == 4){
									out.println("<div class='starYellow'>★★★★☆</div>");
								} else if(reviewList.get(i).getReviewRating() == 5){
									out.println("<div class='starYellow'>★★★★★</div>");
								} else {
									out.println("<div class='starYellow'>☆☆☆☆☆</div>");
								}
								%>
								</td>
								<td  scope="row" class="text-center"><%=reviewList.get(i).getReviewContent()%><%-- &nbsp;&nbsp;(&nbsp;<a href="reviewDel.do?mbId=<%=reviewList.get(i).getMbId()%>&reviewSeq=<%=reviewList.get(i).getReviewSeq()%>">삭제</a>&nbsp;) --%></td>
								<td scope="row" class="text-right"><%=reviewList.get(i).getMbId()%></td>
								<td scope="row" class="text-right"><%=reviewList.get(i).getReviewDate()%></td>
							</tr>
							<%}%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
    </section>
	<!-- Product Details Section End -->

    <!-- Footer Section Begin -->
   	<%@ include file="./footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f7365c4645c814b3b6164f85f080385"></script>
    <script type="text/javascript" src="js/rating.js"></script>
    
    <script>
    $(document).ready(function() {
        $('input[type=checkbox][name=rating]').change(function() {
        	 if ($(this).prop("checked")) {
                 $("#reviewRating").val($(this).val());
             }
        });
    });
	
    	function submit(){
    			document.fm.submit();
    	}
    
    	var mapContainer = document.getElementById('map'),
	    mapOption = { 
	        center: new kakao.maps.LatLng(<%=lat%>, <%=loc%>),
	        level: 1 
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var markerPosition  = new kakao.maps.LatLng(<%=lat%>, <%=loc%>); 
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
		var iwContent = "<div style='padding:5px;'><%=m_center%></div>", 
		    iwPosition = new kakao.maps.LatLng(<%=lat%>, <%=loc%>);
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		infowindow.open(map, marker);
		
		
	    let date1 = moment(); //"YYYY-MM-DD HH:mm:ss"
	    let date2 = document.getElementsByClassName("clock");
    	function clock() {
			for(let i = 0; i < date2.length; i++) {
				let date1 = moment();
				let now_date = date1.format("YYYY-MM-DD HH:mm:ss");
			    let due_date = moment(date2[i].getAttribute('data-time'));
			    let time = due_date.diff(now_date, "seconds");
			    let day = parseInt(time/86400);
			    time %= 86400;
			    let hour = parseInt(time/3600);
			    time %= 3600;
			    let minute = parseInt(time/60);
			    let second = parseInt(time%60);
				date2[i].innerText = `\${day}일 `+
				`\${hour < 10 ? `0\${hour}` : hour}:`+
				`\${minute < 10 ? `0\${minute}` : minute}:`+
				`\${second < 10 ? `0\${second}` : second}`;
			}
			console.log("clock()실행")
	    }
	    setInterval(function() {clock()}, 1000); // 1초마다 실행
    </script>
	

</body>

</html>