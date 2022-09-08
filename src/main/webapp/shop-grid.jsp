<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.foodshring.VO.t_itemJoinVO"%>
<%@page import="com.foodshring.VO.t_safeVO"%>
<%@page import="com.foodsharing.DAO.t_safeDAO"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.foodshring.VO.t_itemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodsharing.DAO.t_itemDAO"%>
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
<title>AppleBasket | shop grid</title>

<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
   rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
</head>

<body>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>

   <!-- Humberger Begin -->
   <%@ include file="./Humberger.jsp"%>
   <!-- Humberger End -->

   <!-- Header Section Begin -->
   <%@ include file="./header.jsp"%>
   <!-- Header Section End -->

   <%
      t_itemDAO item_dao = new t_itemDAO(); 
      ArrayList<t_itemJoinVO> list = item_dao.getAll1();
   %>

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
                           전체카테고리 <span class="arrow_carrot-down"></span>
                        </div>
                        <input type="text" style="display:none;">
                        <input type="text" placeholder="어떤 재료가 필요하시나요?" name="input_str" onkeyup="enterSearch()">
                        <button type="button"  class="site-btn" onclick="search()">검색</button>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Hero Section End -->

   <!-- Breadcrumb Section Begin -->
   <section class="breadcrumb-section set-bg"
      data-setbg="img/breadcrumb.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="breadcrumb__text">
                  <h2>Apple Basket</h2>
                  <div class="breadcrumb__option">
                     <a href="./index.jsp">Home</a> <span>Shop</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
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
                        <div class="sidebar__item">
                            <h4>가격 검색</h4>
                         
                                <div class="range">
                                    <div class="price-input1" >
                                    <div class="input-group mb-3">
                             <input style="text-align: right" type="text" class="form-control" placeholder="원" name="minprice">
                             <span >~</span>
                             <input style="text-align: right" type="text" class="form-control" placeholder="원" name="maxprice">
                           </div>
                                       
                                  <button type="button" onclick="products_filter()" class="btn btn-outline-success">검색</button>
                                </div>
                            </div>
                        </div>
                        
               <!--  잠깐 대기!! -->
                     
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>마감 임박!!</h4>
                                <div class="latest-product__slider owl-carousel">
                                
                                    
                                    <%
                                    Comparator<t_itemJoinVO> comparator = new Comparator<t_itemJoinVO>(){
                                       public int compare(t_itemJoinVO a, t_itemJoinVO b){
                                          return b.getItemSeq()-a.getItemSeq();
                                       }
                                    };
                                    Collections.sort(list, comparator);
                                    
                                    for(int i=0;i<list.size();i++){ 
                                    %>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="shop-details.jsp?itemSeq=<%=list.get(i).getItemSeq()%>" class="latest-product__item">
                                            <span class="latest-product__item__pic">
                                               <img alt="freshmeat" src="./img/<%= list.get(i).getItemImg1()%>">
                                            </span>
                                            <span class="latest-product__item__text">
                                                <span><%=list.get(i).getItemName() %></span>
                                                <span><fmt:formatNumber value='<%=list.get(i).getItemPrice()%>' pattern='#,###'/></span><br/>
                                                <span class="clock_only" data-time="<%= list.get(i).getItemDeadline() %>">clock</span>
                                            </span>
                                        </a>
                                    </div>
                                    <%} %>
   
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!--  잠깐 대기!! -->
                
                <!-- 정우코드 -->
                
                <%
               System.out.print(list.get(0).getItemDeadline());
            %>
            
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option><a href ="javascript:recent list()">등록순</a></option>
                                        <option><a href ="javascript:pricelist()">낮은가격순</a></option>
                                        <option><a href ="javascript:pricelistdesc()">높은가격순</a></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span id="findNum"><%=list.size() %></span> 개의 제품을 찾았습니다</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" id = 'priceSelectId'>
                    <%
                     for(int i=0; i<9;i++){
                     String str = list.get(i).getMbId();
                     String[] str_id = str.split("@");
                     
                     String str2 = list.get(i).getSafeCenter();
                     String[] str2_id = str2.split(" ");
                 	%>
                    
                    
                    
                        <div class="col-lg-4 col-md-6 col-sm-6"  >
                            <div class="product__item" >     
                                <div class="product__item__pic set-bg">
                               <span><a href="shop-details.jsp?itemSeq=<%=list.get(i).getItemSeq()%>"><img alt="freshmeat"
                           src="./img/<%= list.get(i).getItemImg1()%>"></a></span>
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <div>
                                    <span class="clock"
                                    data-time="<%= list.get(i).getItemDeadline() %>">clock</span>
                                     <span><a href="./shop-details.jsp" style="text-decoration: none !important;
                                                          color: inherit !important;"><%=list.get(i).getItemName()%></a></span>
                                 </div>
                                  <div>
                                     <span class="seller"><i class="fa fa-solid fa-user"></i><%= str_id[0] %></span>
                                     
                  
                                    <span class="location"><i class="fa fa-solid fa-map"></i><%= str2_id[0]%></span>
                           
                              <span class="price"><i class="fa fa-solid fa-won"></i><fmt:formatNumber value="<%= list.get(i).getItemPrice()/4 %>" pattern="#,###" /></span>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <%} %>
               </div>
               
               <div class="product__pagination">
                  <a href="shop-grid.jsp">1</a> 
                  <a href="shop-grid2.jsp">2</a> 
                  <a href="shop-grid3.jsp">3</a>
                  <a href="shop-grid4.jsp">4</a> 
                  <a href="shop-grid2.jsp"><i class="fa fa-long-arrow-right"></i></a>
               </div>
               
            </div>
          <!-- 정우코드 끝 -->
          
         </div>
      </div>
   </section>
   <!-- Product Section End -->

   <!-- Footer Section Begin -->
   <%@ include file="./footer.jsp"%>
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


   <script>
       let date1 = moment(); // "YYYY-MM-DD HH:mm:ss"
       let date2 = document.getElementsByClassName("clock");
       let date_only = document.getElementsByClassName("clock_only");
       
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
       
       function clock_oney(){
          for(let i = 0; i < date_only.length; i++) {
            let date1 = moment();
            let now_date = date1.format("YYYY-MM-DD HH:mm:ss");
             let due_date = moment(date_only[i].getAttribute('data-time'));
             let time = due_date.diff(now_date, "seconds");
             let day = parseInt(time/86400);
             time %= 86400;
             let hour = parseInt(time/3600);
             time %= 3600;
             let minute = parseInt(time/60);
             let second = parseInt(time%60);
             date_only[i].innerText = `00일 `+
            `\${hour < 10 ? `0\${hour}` : hour}:`+
            `\${minute < 10 ? `0\${minute}` : minute}:`+
            `\${second < 10 ? `0\${second}` : second}`;
         }
       }
       setInterval(function() {clock()}, 1000); // 1초마다 실행
       setInterval(function() {clock_oney()}, 1000); // 1초마다 실행
       
       
       function products_filter(){
	    	$('#priceSelectId').children().remove();
	    	 $.ajax ({
	    		url : "PriceFilter.do",
	    		type : "post",
	    		data : {
	    			"minprice" : $('input[name=minprice]').val(),
	    			"maxprice" : $('input[name=maxprice]').val()
		            },
		        dataType : "json",
		        success : function(res) {
		        	console.log('가져온 데이터는',res)
		        	$('#findNum').text(res.length);
		        	let priceSelectList  = "";
		               if(res.length == 0){
				        	$('#findNum').text("0");
		            	   alert('검색 상품이 없습니다.\n입력하신 내용을 다시 확인해주세요.');
		               }else {
		        		
		                  for(let k = 0; k<res.length; k++){
		                	  let id = res[k].mbId.split("@");
		                	  let dong = res[k].safeCenter.split(" ");
		                	  
		                	  console.log(res[k])
		                	  priceSelectList = "<div class='col-lg-4 col-md-6 col-sm-6'>";
		                      priceSelectList += "<div class='product__item'>";
		                      priceSelectList += "<div class='product__item__pic set-bg'>";
		                      priceSelectList += "<span><a href='shop-details.jsp?itemSeq="+res[k].itemSeq;
		                      priceSelectList += "'><img alt='freshmeat' src='./img/"+res[k].itemImg1 ;
		                      priceSelectList += "'></a></span>";
		                      priceSelectList += "<ul class='product__item__pic__hover'>";
		                      priceSelectList += "<li><a href='#'><i class='fa fa-heart'></i></a></li>";
		                      priceSelectList += "<li><a href='#'><i class='fa fa-retweet'></i></a></li>";
		                      priceSelectList += "<li><a href='#'><i class='fa fa-shopping-cart'></i></a></li></ul></div>";
		                      priceSelectList += "<div class='product__item__text'>";
		                      priceSelectList += "<div>";
		                      priceSelectList += "<span class='clock' data-time='";
		                      priceSelectList += res[k].itemDeadline;
		                      priceSelectList += "'>clock</span>";
		                      priceSelectList += "<span><a href='./shop-details.jsp' style='text-decoration: none !important; color: inherit !important;'>";
		                      priceSelectList += res[k].itemName;
		                      priceSelectList += "</a></span></div>";
		                      priceSelectList += "<div>";
		                      priceSelectList += "<span class='seller'><i class='fa fa-solid fa-user'></i>";
		                      priceSelectList += id[0];
		                      priceSelectList += "</span>";
							  priceSelectList +="<span class='location'><i class='fa fa-solid fa-map'></i>";
							  priceSelectList += dong[0];
							  priceSelectList += "</span>";
							  priceSelectList += "<span class='price'><i class='fa fa-solid fa-won'></i>";
							  priceSelectList += res[k].itemPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							  priceSelectList += "</span></div></div></div></div>";
							 
							  
							  $('#priceSelectId').append(priceSelectList);
	                                    
		                  }
		                  
		               }
		            },
		            error : function(){
		               alert('실패');
		            }
		         }); 
	    	}
       function search(){
	    	$('#priceSelectId').children().remove();
	    	 $.ajax ({
	    		url : "Search.do",
	    		type : "get",
	    		data : {
	    			"input_str" : $('input[name=input_str]').val()
	    		
		            },
		        dataType : "json",
		        success : function(res) {
		        	console.log('가져온 데이터는',res)
		        	$('#findNum').text(res.length);
		        	let priceSelectList  = "";
		               if(res.length == 0){
		            	   alert('검색 상품이 없습니다.\n입력하신 내용을 다시 확인해주세요.');
		               }else {
		        		
		                  for(let k = 0; k<res.length; k++){
		                	  let id = res[k].mbId.split("@");
		                	  let dong = res[k].safeCenter.split(" ");
		                	  
		                	  console.log(res[k])
		                	  priceSelectList = "<div class='col-lg-4 col-md-6 col-sm-6'>";
		                      priceSelectList += "<div class='product__item'>";
		                      priceSelectList += "<div class='product__item__pic set-bg'>";
		                      priceSelectList += "<span><a href='shop-details.jsp?itemSeq="+res[k].itemSeq;
		                      priceSelectList += "'><img alt='freshmeat' src='./img/"+res[k].itemImg1 ;
		                      priceSelectList += "'></a></span>";
		                      priceSelectList += "<ul class='product__item__pic__hover'>";
		                      priceSelectList += "<li><a href='#'><i class='fa fa-heart'></i></a></li>";
		                      priceSelectList += "<li><a href='#'><i class='fa fa-retweet'></i></a></li>";
		                      priceSelectList += "<li><a href='#'><i class='fa fa-shopping-cart'></i></a></li></ul></div>";
		                      priceSelectList += "<div class='product__item__text'>";
		                      priceSelectList += "<div>";
		                      priceSelectList += "<span class='clock' data-time='";
		                      priceSelectList += res[k].itemDeadline;
		                      priceSelectList += "'>clock</span>";
		                      priceSelectList += "<span><a href='./shop-details.jsp' style='text-decoration: none !important; color: inherit !important;'>";
		                      priceSelectList += res[k].itemName;
		                      priceSelectList += "</a></span></div>";
		                      priceSelectList += "<div>";
		                      priceSelectList += "<span class='seller'><i class='fa fa-solid fa-user'></i>";
		                      priceSelectList += id[0];
		                      priceSelectList += "</span>";
							  priceSelectList +="<span class='location'><i class='fa fa-solid fa-map'></i>";
							  priceSelectList += dong[0];
							  priceSelectList += "</span>";
							  priceSelectList += "<span class='price'><i class='fa fa-solid fa-won'></i>";
							  priceSelectList += res[k].itemPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							  priceSelectList += "</span></div></div></div></div>";
							 
							  
							  $('#priceSelectId').append(priceSelectList);
	                                    
		                  }
		                  
		               }
		            },
		            error : function(){
		               alert('실패');
		            }
		         }); 
	    	 return false;
	    	}
     
       function enterSearch(){
    	   if(window.event.keyCode == 13){
    		   search();
    	   }
    	   
       }
       function Alert() {
   		alert('반드시 장바구니를 지참하여 환경을 지키는데 도움을 주세요!!', 'success');
	   	}
	   	
	   	var alert = function(msg, type) {
	   		swal({
	   			title : '알고계셨나요?',
	   			text : msg,
	   			type : type,
	   			button: "지잠할게요!!"
	   		});
	   	}
       
       	
       </script>
       </body>
       </html>