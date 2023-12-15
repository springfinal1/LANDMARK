<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/product/product_reservation.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


	<c:set value="${pldto.packvo }" var="packvo"/>
	<c:set value="${pldto.pfList }" var="pfList"/>
	<c:set value="${pldto.avo }" var="avo"/>
	<c:set value="${pldto.hvo }" var="hvo"/>
	<c:set value="${pldto.fvo }" var="fvo"/>
	<c:set value="${pldto.plvo }" var="plvo"/>
	
	<!-- 최종 합계금액, 국적 , 비행 -->
	<div class="product-container">
		<div class="sub-container">			
			<div class="reservation-title">
				<strong>상품 예약하기</strong>
				<p>예약하시면 빠른 시간 내에 담당 직원이 연락 드리겠습니다.</p>
			</div>
				
			<div class="reservation-info">
				<div class="reservation-info-div">				
					<div class="reservation-info-div-img">
						<c:forEach items="${pfList }" var="flist">
							<img class="reservation-img" alt="그림없음" src="/product_upload/${fn: replace(flist.pfSaveDir,'\\','/')}/${flist.pfUuid }_${flist.pfName}">
						</c:forEach>
					</div>
					<div class="reservation-info-div-text">
						<div>
							<strong>상품명</strong>
							<div>${packvo.pkName }</div>
						</div>
						<div>
							<strong>가격</strong>
							<div><fmt:formatNumber value="${packvo.pkPrice}" pattern="#,###"/> 원</div>
						</div>
						<div>
							<strong>출발/도착일</strong>
							<div>${avo.apArrival } ~ ${avo.apDeparture }</div>
						</div>
					</div>					
				</div>
				
				<div class="reservation-agree">
					<div class="reservation-agree-strong">
						<strong>약관동의</strong>
					</div>
					
					<div class="reservation-agree-span">
						<i class="fa-solid fa-check all-check" id="icon-check"></i><span class="all-agree-span">약관 전체 동의</span> <span class="all-agree-span2">약관 전문을 모두 동의 하셔야 예약이 완료됩니다.</span>
					</div>
					
					<div class="reservation-agree-div">
						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check" id="check-btn1"></i>
								<span class="reservation-agree-check">특별약관 설명 및 확인 (필수)</span>
							</div>
							<span>
								<a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>
						
						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check" id="check-btn2"></i>
								<span class="reservation-agree-check">약관동의 (필수)</span>
							</div>						
							<span>
								<a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>
						
						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check" id="check-btn3"></i>
								<span class="reservation-agree-check">개인정보 수집 및 이용동의 (필수)</span>
							</div>
							<span>
								<a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>
						
						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"  id="check-btn4"></i>
								<span class="reservation-agree-check">개인정보 3자 제공 (필수)</span>
							</div>
							<span>
								<a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>
						
						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check" id="check-btn5"></i>
								<span class="reservation-agree-check">고유식별정보 수집안내 (필수)</span>
							</div>
							<span>
								<a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>
						
					</div>
					<div class="agree-span">
						<span class="material-symbols-outlined">error</span> <span>개인정보의 수집, 제공 및 활용에 동의하지 않을 권리가 있으며, 미동의 시 여행서비스의 제공이 제한됩니다.</span>
					</div>
				</div>
				
				<div class="reservation-information">
					<div class="reservation-information-div-strong">
						<strong class="reservation-information-strong">예약 정보</strong>
					</div>	
					<div class="reservation-information-div">
						<table class="reservation-information-table">
							<tr>
								<th class="reservation-information-table-th">상품명</th>
								<td class="reservation-information-table-td" >${packvo.pkName }</td>
							</tr>
							<tr>
								<th class="reservation-information-table-th">여행기간</th>
								<td class="reservation-information-table-td">출발 ${avo.apArrival } → 도착 ${avo.apDeparture }</td>
								
							</tr>
							<tr>
								<th class="reservation-information-table-th">금액</th>
								<td class="reservation-information-table-td" ><fmt:formatNumber value="${packvo.pkPrice}" pattern="#,###"/> 원</td>
							</tr>
							<tr>
								<th class="reservation-information-table-th">마일리지 적립비율</th>
								<td class="reservation-information-table-td" >4</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="reservation-peple-div">
					<div class="reservation-peple-strong">					
						<strong>예약자 정보</strong>
					</div>
					<div class="reservation-peple-info">
						<table class="reservation-peple-info-table">
							<tr>
								<th class="reservation-peple-info-table-th">예약자명</th>
								<td class="reservation-peple-info-table-td"><input type="text"></td>
							</tr>
							<tr>
								<th class="reservation-peple-info-table-th">휴대폰 번호</th>
								<td class="reservation-peple-info-table-td">
									<input type="text">
								</td>
							</tr>
							<tr>
								<th class="reservation-peple-info-table-th">이메일</th>
								<td class="reservation-peple-info-table-td">
									<input type="text"> @ <input type="text"> 
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="reservation-trip-inpo">
					<div class="reservation-footer-strong">
						<strong>여행자 정보</strong>
					</div>
					
					<div class="reservation-peple-price">
						<table>
							<tr>
								<th class="reservation-peple-price-th">인원</th>
								<td class="reservation-peple-price-td">
									<div class="reservation-peple-count">
										<button type="button" id="minus-btn">-</button>
										<input type="text" readonly="readonly" class="peple-input" id="peple-input" value="${peple }">
										<button type="button" id="plus-btn">+</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="reservation-peple-price-th">최종 합계금액</th>
								<td class="reservation-peple-price-td">
									<div>
										<input type="text" value="${price }" readonly="readonly" id="reservation-price"> 원
										<input type="hidden" value="${packvo.pkPrice }" id="package-price">
									</div>
								</td>
							</tr>
						</table>
					</div>
					
				</div>
				<div class="reservation-footer">
					<div class="reservation-footer-strong">
						<strong>취소위약금 및 동의사항</strong>
					</div>
					<div class="reservation-footer-div">
						<ul>
							<li>결제완료 후 예약확정 시 취소 시점에 따라 위약금이 발생할 수 있습니다.</li>
							<li>취소료 규정은 각 상품 상세 페이지에서 확인 가능합니다.</li>
							<li>예약이 완료되면 담당자가 전화로 추가 안내 및 확인 절차를 거칩니다.</li>
							<li>여행상품의 특성 상 경우에 따라 예약이 완료된 후에도 처리가 불가능할 수 있습니다.</li>
							<li>본 여행상품의 세부 약관 규정은 재경부 고시 소비자 피해보상 규정을 바탕으로 합니다.</li>
						</ul>
					</div>
				</div>
				
				<div class="reservation-footer-button">
					<a href="/product/detail?pkNo=${packvo.pkNo }">		
						<button type="button" class="x-btn">취소</button>
					</a>
					
					<a href="#" class="reservation-btn-a" id="reservation-btn-a">
						<button type="button" class="reservation-btn" id="reservation-btn">예약하기</button>
					</a>
				</div>
			</div>
		
		
		
		
		
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>		
<script type="text/javascript" src="/resources/js/product/reservation.js"></script>
<!-- <script type="text/javascript" src="/resources/js/product/product_price.js"></script>
<script type="text/javascript">
printPrice()
</script>
 -->

</body>
</html>