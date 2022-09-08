<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AppliBasket | Checkout</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
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

  <%
  t_memberVO mem_vo = (t_memberVO)session.getAttribute("vo"); 
  ArrayList<SelectBasketVO> list = (ArrayList<SelectBasketVO>)session.getAttribute("list");
  String price = request.getParameter("totalprice");
  String[] memadd = mem_vo.getMbAddr().split(" ");
  String[] memname = mem_vo.getMbName().split("");
  %>

   <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>결제</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>결제하기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> 쿠폰을 동록하시려면 <a href="#">여기</a> 를 누르세요.
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>배송정보</h4>
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>성<span>*</span></p>
                                        <input type="text" placeholder="<%=memname[0] %>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>명<span>*</span></p>
                                        <input type="text" placeholder="<%=memname[1]+memname[2] %>">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="<%=memadd[0]+memadd[1]+memadd[2]+memadd[3]+memadd[4]%>" class="checkout__input__add">
                            </div>
                            <div class="checkout__input">
                                <p>상세주소<span>*</span></p>
                                <input type="text" placeholder="<%=memadd[5]%>">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>전화<span>*</span></p>
                                        <input type="text" placeholder="<%=vo.getMbPhone()%>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이메일<span>*</span></p>
                                        <input type="text" placeholder="<%=vo.getMbId()%>">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                            </div>
                            </div>
                              <div class="col-lg-4 col-md-6">
		                            <div class="checkout__order">
		                                <h4>주문</h4>
		                                <div class="checkout__order__products">제품<span>금액</span></div>
		                                <ul>
		                                <%for(int i=0; i<list.size();i++){ %>
		                                    <li><%=list.get(i).getItemName() %><span><fmt:formatNumber value='<%=list.get(i).getItemPrice() %>' pattern='#,###' /></span></li>
		                                <%} %>
		                                </ul>
		                                <div class="checkout__order__subtotal">소계 <span><fmt:formatNumber value='<%=price%>' pattern='#,###' /></span></div>
		                                <div class="checkout__order__subtotal">할인금액 <span>0원</span></div>
		                                <div class="checkout__order__total">총 금액 <span><fmt:formatNumber value='<%=price%>' pattern='#,###' /></span></div>
		                                   <form name=AppleMaketWeb action = "./payMent.do" method=post>
										        <input type='hidden' name='sndGoodname' value='<%=vo.getMbName()%> 외 <%=list.size()%>건' size='30'>
												<input type='hidden' name='sndAmount' value='1004' size='15' maxlength='9'>
												<input type='hidden' name='sndOrdername' value='<%=vo.getMbName()%>' size='30'>
												<input type='hidden' name='sndEmail' value='<%=vo.getMbId()%>' size='30'>
												<input type='hidden' name='sndMobile' value='<%=vo.getMbPhone().replace("-","")%>' size='12' maxlength='12'>
												<input type='hidden' name='a' value="<%=mem_vo.getMbId()%>"/>
												<input type='hidden' name='b' value="<%=list.get(0).getItemSeq()%>"/>
												<input type='hidden' name='c' value="<%=list.get(0).getBasketSeq()%>"/>
												<input type="hidden" name="sndPaymethod" value="1000000000">
												<input type='hidden' name='sndStoreid' value='2999199999' size='15' maxlength='10'>
												<input type='hidden' name='sndOrdernumber' value='carrot_1234' size='30'>
												<input type=hidden  name='sndServicePeriod'  value="2022년06월20일~2022년12월14일">
												<input type=hidden	name='sndReply' value="">
												<input type=hidden  name=sndGoodType value="1">
												<input type=hidden  name=sndShowcard value="I,M">
												<input type=hidden	name=sndCurrencytype value="WON">
												<input type=hidden	name=sndInstallmenttype value="ALL(0:2:3:4:5:6:7:8:9:10:11:12)">
												<input type=hidden	name=sndInteresttype value="NONE">
												<input type=hidden	name=sndEscrow value="1">
												<input type=hidden	name=sndWptype value="1">
												<input type=hidden	name=sndAdulttype value="1">
												<input type=hidden  name=sndCashReceipt value="0">        
												<input type=hidden  name=sndMembId value="userid"> 
												<input type=hidden name=reWHCid 	value="">
												<input type=hidden name=reWHCtype 	value="">
												<input type=hidden name=reWHHash 	value="">	
													<button class="site-btn" onclick="Confirm(document.AppleMaketWeb)">주문하기</button>
										</form>
		                            </div>
		                        </div>
                        </div>
                    </div>
            </div>
        </div>
        
        <input type="hidden" class="name" value="<%=vo.getMbName()%>">
		<input type="hidden" class="e_mail" value="<%=vo.getMbId()%>">
		<input type="hidden" class="tel" value="<%=vo.getMbPhone()%>">
        
    </section>
    <!-- Checkout Section End -->

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
    <script src="js/main.js"></script>

 	<script type="text/javascript">
 	function Confirm(_frm){
 		_frm.sndReply.value           = getLocalUrl("mony_rcv.jsp") ;

		var agent = navigator.userAgent;
		var midx		= agent.indexOf("MSIE");
		var out_size	= (midx != -1 && agent.charAt(midx+5) < '7');
    	
		var width_	= 500;
		var height_	= out_size ? 568 : 518;
		var left_	= screen.width;
		var top_	= screen.height;
    	
		left_ = left_/2 - (width_/2);
		top_ = top_/2 - (height_/2);
		
		op = window.open('about:blank','AuthFrmUp',
		        'height='+height_+',width='+width_+',status=yes,scrollbars=no,resizable=no,left='+left_+',top='+top_+''); //결과 반환전달

		if (op == null) //결과 페이지에 문제가될경우
		{
			alert("팝업이 차단되어 결제를 진행할 수 없습니다.");
			return false;
		}
		
		_frm.target = 'AuthFrmUp';
		_frm.action ='https://kspay.ksnet.to/store/KSPayFlashV1.3/KSPayPWeb.jsp?sndCharSet=utf-8'; //결제서버 정보체크
		_frm.submit();
    }

	function getLocalUrl(mypage) 
	{ 
		var myloc = location.href; 
		return myloc.substring(0, myloc.lastIndexOf('/')) + '/' + mypage;
	} 
	
	function goResult(){
		document.AppleMaketWeb.target = "";
		document.AppleMaketWeb.action = "./payMent.do";
		document.AppleMaketWeb.submit();
	}
	
	function eparamSet(rcid, rctype, rhash){ //서버에서 받은 반환값 전달.
		document.AppleMaketWeb.reWHCid.value 	= rcid;
		document.AppleMaketWeb.reWHCtype.value   = rctype  ;
		document.AppleMaketWeb.reWHHash.value 	= rhash  ;
	}
 	</script>

</body>

</html>