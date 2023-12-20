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
<link rel="stylesheet" href="/resources/css/product/product_list.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	 
	 
	 
	<div class="product-container">
		<div class="sub-container">
			
			<div class="place-container">
			<!-- 서치라인 -->
				<div class="place-h2">
					<h2>
						<a href="#" id="placeAll">지역보기</a>
					</h2>		
				</div>
				
				<div class="placeDiv" id="placeDiv">
				
					<div class="place-drop-menu">
						<span>
							<a href="/product/list?pkContinent=동북아">동북아</a>
						</span>
						
						<span>
							<a href="/product/list?pkContinent=동남아">동남아</a>
						</span>
							
						<span>
							<a href="/product/list?pkContinent=유럽">유럽</a>
						</span>
							
						<span>
							<a href="/product/list?pkContinent=아메리카">아메리카</a>
						</span>
						<span>
							<a href="/product/list?pkContinent=아메리카">아메리카</a>
						</span>	
						<span>
							<a href="/product/list?pkContinent=아메리카">아메리카</a>
						</span>	
						<span>
							<a href="/product/list?pkContinent=아메리카">아메리카</a>
						</span>	
						<span>
							<a href="/product/list?pkContinent=아메리카">아메리카</a>
						</span>	
						<span>
							<a href="http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList">테스트2</a>
						</span>	
						<span>
							<a href="http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList?ServiceKey=ijQL0nu774ZPOX%2B4O4A1liiipYbCGKpoAGKZfExa6pDSbgqb4r1kI33P%2Byoz1pZ3MuNh4YuLM8SH%2BHI57KBwEQ%3D%3D&pageNo=1">테스트해보기]</a>
						</span>	
																									
					</div>
					
				</div>
			</div>
			
			
			
			 
			
			
			
			<!-- 리스트  -->
			<div class="list-container">			
				<c:forEach items="${pldto }" var="pldto">

						<input type="hidden" value="${pldto.packvo.pkNo }" name="pkNo"> 
						<input type="hidden" id="textNumber" value="${pldto.packvo.pkNo }">

					<div class="itemBox">										
						<div class="imgZone">
							<c:forEach items="${pldto.pfList }" var="pfList">
								<img class="listImg" src="/product_upload/${fn:replace(pfList.pfSaveDir,'-','/')}/${pfList.pfUuid}_${pfList.pfName}">
							</c:forEach>
						</div>							
						<div class="textDiv">
							<div class="list-product">
								<div>
									<h5>상품명</h5>
									${pldto.packvo.pkName }
								</div>
								
								<div id="countryZone">
									<h5>나라</h5>
									${pldto.plvo.plCountry }
								</div>
								
								<div id="festivalZone">
									<h5>축제</h5>
									${pldto.fvo.fvName }
								</div>
							
								<div id="airZone">
									<h5>출발 ~ 도착일</h5>
									${pldto.avo.apArrival } ~ ${pldto.avo.apDeparture }
								</div>
							</div>
							<div class="list-price">
								<div class="list-price-heart">
									<div>
										가격
									</div>
									<div>
										<i class="fa-solid fa-heart heart-btn" id="heartBtn" data-heart="${pldto.packvo.pkNo }"></i>
									</div>
								</div>
								<div class="list-product-price"><fmt:formatNumber value="${pldto.packvo.pkPrice}" pattern="#,###"/> 원</div>
								<div>
									<a href="/product/detail?pkNo=${pldto.packvo.pkNo }"><button type="button" class="detailBtn">자세히보기</button></a>
								</div>
							</div>
						</div>					
					</div>			
				</c:forEach>
			
			</div>
		</div>
	</div>
	 
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script type="text/javascript">
	let idVal=`<c:out value='${uvo.id}'/>`;
	let idPk = `<c:out value='${faList}'/>`;
</script>
<script type="text/javascript" src="/resources/js/product/product_list.js"></script>


</body>
</html>