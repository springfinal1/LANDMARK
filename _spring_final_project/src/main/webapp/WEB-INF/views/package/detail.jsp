<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap"
	rel="stylesheet">






<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>Home</title>
</head>
<link rel="stylesheet" href="/resources/css/peyment/user-number.css">
<body>


	<c:set value="${pldto.packvo }" var="packvo" />
	<c:set value="${pldto.pfList }" var="pfList" />
	<c:set value="${pldto.avo }" var="avo" />
	<c:set value="${pldto.hvo }" var="hvo" />
	<c:set value="${pldto.fvo }" var="fvo" />
	<c:set value="${pldto.plvo }" var="plvo" />


	<div class="payment-container-main">

		<div class="payment-box-left">
			<!-- 왼쪽 div  -->




			<div>
				<div class="user-number">

					<div class="user-number-box">
						<span class="tita">${uvo.name }</span>
						<!-- 나중에 여기는 유저 정보로 이동  -->
						<span class="titb">님, 안녕하세요.</span>
					</div>
					<h3>저희 렌드마크에 오신걸 환영합니다.</h3>


					<div class="table-type-top">
						<table id="tourInfoTable">
							<tbody>
								<tr>
									<th>아이디</th>
									<td><span>${uvo.id}</span></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><span>${uvo.phoneNumber}</span></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><span>${uvo.address}</span></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><span>${uvo.email}</span></td>
								</tr>
								<tr>
									<th>맴버쉽</th>
									<td><span>${memShp.grade}</span></td>
								</tr>
								<tr>
									<th>패키지 가격</th>
									<td><span>${memberPrice }원</span></td>
								</tr>

							</tbody>
						</table>
					</div>


				</div>

				<!--할인 쿠폰  -->

				<div class="event-box">
					<div class="user-event-box">
						<h3 class="user-nmuber-top">할인 수단 선택</h3>
					</div>
					<div class="product-amout">
						<span>구매 금액</span> <span class="discounted-price-value">${memberPrice}</span>
					</div>

					<div class="form-group-cupon-mid">
						<input type="text" id="coupon-input"
							placeholder="이벤트로 발급받은 쿠폰을 적어주세요"> <br>
						<button type="button" class="cupon-button" onclick="applyCoupon()">사용
							가능 쿠폰</button>

					</div>
					<div class="product-amout">
						<span> 일반쿠폰 </span> <span class="discounted-coupon-value">
							%</span>
					</div>

					<div class="product-amout">
						<span> 추가쿠폰 </span> <span> - </span>
					</div>
					<div class="product-amout">
						<span> 사용 포인트 </span> <span id="PointValue">
							${memShp.point}</span>
					</div>
					<input type="text" id="point-input" placeholder="사용하실 포인트를 적어주세요">
					<br>
					<button type="button" class="cupon-button" onclick="applyPoint()">포인트
						할인</button>

					<div class="product-amout">
						<span> 맴버쉽 할인</span> <span id="memberDiscountPrice">
							${memberDiscountPrice} </span>
					</div>
					<div class="product-amout">
						<span> 포인트 할인</span><span id="endPoint"> - </span>
					</div>
					<div class="product-amout">
						<span> 최종금액</span><span id="endPrice">${lastTotalCount} </span>
					</div>

					<div class="box-left">
						<div class="box">
							<div class="selectBox">
								<button class="label">결제수단 선택</button>
								<ul class="optionList" id="paymentMethod">
									<li class="optionItem" value="kakaopay" data-v-16d1a795>카카오페이</li>
									<li class="optionItem" value="tosspay">토스</li>
									<li class="optionItem" value="html5_inicis">KG이니시스</li>
									<li class="optionItem" value="payco">페이코</li>
									<li class="optionItem" value="settle">핵토파이낸셜</li>
									<li class="optionItem" value="daou">키움페이</li>
								</ul>

							</div>

						</div>
						<button class="btn-gradient cyan" type="button"
							onclick="requestPay()">
							<span>결제하기</span>
						</button>
					</div>


				</div>



			</div>


			<div class="form-group-rogin">
				<a> "로그인 후 예약하시면" <br> "할인 쿠폰과 추가 이벤트 를 사용하실수 있습니다~!" <br>
				</a>
			</div>
		</div>
		<div class="payment-box-right">

			<div class="payment-box-right-main">
				<div class="product-point">
					<strong>예약 정보</strong>
				</div>
				<!-- 밑에 바뀌는 div -->
				<div id="product-eventTap" class="product-eventTap">
					<div class="table-type-mid">
						<table id="tourInfoTable">
							<tbody>
								<tr>
									<th>상품내용</th>
									<td>${packvo.pkContent }</td>
								</tr>
								<tr>
									<th>이용항공</th>
									<td>대한항공</td>
								</tr>
								<tr>
									<th>이용호텔</th>
									<td>${hvo.htName }</td>
								</tr>
								<tr>
									<th>여행기간</th>
									<td>${avo.apDeparture }~${avo.apArrival }</td>
								</tr>
								<tr>
									<th>인원 수</th>
									<td>${userCount }명</td>
								</tr>
								<tr>
									<th>패키지 가격</th>
									<td><span>${memberPrice }원</span></td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="product-point">
						<strong>취소위약금 및 동의사항</strong> <br>
					</div>
					<div class="table-type-mid-2">
						<ul class="table-type-mid-2">
							<li>결제완료 후 예약확정 시 취소 시점에 따라 위약금이 발생할 수 있습니다.</li>
							<li>취소료 규정은 각 상품 상세 페이지 확인 및 고객센터로 연락 부탁드립니다.</li>
							<li>예약이 완료되면 담당자가 전화로 추가 안내 및 확인 절차를 진행합니다.</li>
							<li>여행상품의 특성 상 경우에 따라 예약이 완료된 후에도 처리가 불가능할 수 있습니다.</li>
							<li>본 여행상품의 세부 약관 규정은 재경부 고시 소비자 피해보상 규정을 바탕으로 합니다.</li>
						</ul>
					</div>
					<div class="bg-box">
						<ul class="table-type-bottom">
							<li><strong>예약하기</strong><span>:</span>담당자가 예약확인 후 상품 결제를
								진행합니다.(홈페이지 예약 취소 가능)</li>
						</ul>
						<ul class="table-type-bottom">
							<li><strong>즉시결제 예약하기</strong><span>:</span>상품 예약과 결제를 동시에
								진행합니다.(담당자에게 요청하시기 바랍니다.)</li>
						</ul>
					</div>
					<div class="item-div">
						<div class="bg-video">
							<video class="bg-video__content" autoplay muted loop>
								<source src="/resources/image/pierrr.mp4" type="video/mp4">
								<source src="img/video.webm" type="video/webm" />
							</video>
						</div>
						<div></div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 예약자 정보 -->

</body>

<script type="text/javascript">
	let pldto = `<c:out value="${packvo}" />`;
	let userA = `<c:out value="${uvo}" />`;
	let userC = `<c:out value="${userCount}" />`;
	let pppp = `<c:out value="${memShp}"/>}`
	let totalPrice = `<c:out value="${memberPrice}"/>}`
</script>

<script type="text/javascript"
	src="/resources/js/peyment/userPayment.js">
	
</script>
</html>
