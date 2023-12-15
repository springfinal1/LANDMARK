<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.uvo.authList" var="auths"/>
	</sec:authorize>
	<div class="detail-container">
	
		<div class="user-infomation">
			<div>
				<div>
					<span>${uvo.id}님, 안녕하세요.</span>
					<span><i class="fa-regular fa-face-smile"></i></span>
				</div>
			</div>
			
			<div>
				<div>
					<span>포인트</span>
					<span>10000<i id="p" class="fa-solid fa-p"></i></span>
				</div>
				<div>
					<span>회원등급</span>
					<span>브론즈</span>
				</div>
				<div>
					<span>누적결제금액</span>
					<span>1000000 원</span>
				</div>
			</div>
			<div class="user-detail-top">
				<div>
					<div>포인트는 10000P가 있어요.</div>
					<div>회원등급별로 누적되는 포인트는</div>
					<div>브론즈 5%, 실버 7%, 골드 10% 입니다.</div>
					<div>포인트는 예약시 사용할수 있습니다.</div>
				</div>
				<div>
					<div>누적금액에 따라 등급이 정해집니다.</div>
					<div>기본 (브론즈)</div>
					<div>500만원 이상 ~ 1000만원 미만 (실버)</div>
					<div>1000만원 이상 (골드)</div>
				</div>
			</div>
		</div>
		
		
		<div class="user-detail-mid">
		
			<div class="user-package-reservation">
				<div>
					<span>예약 내역</span>
				</div>
				<div class="my-list">
					<!-- 패키지예약내역 영역 -->
					<div class="noHistory"><i class="fa-solid fa-cart-shopping"></i>예약내역이 없습니다.</div>
				</div>
			</div>
			
			<div class="user-airplane-reservation">
				<div>
					<span>항공권 예약 내역</span>
				</div>
				<div class="my-list">
					<!-- 항공예약내역 영역 -->
					<div class="noHistory"><i class="fa-solid fa-plane-slash"></i>예약내역이 없습니다.</div>
				</div>
			</div>
			
		</div>
		
		<div class="user-detail-bottom">
		
			<div class="user-wishlist">
				<div>
					<span>관심 상품</span>
				</div>
				<div class="my-list">
					<!-- 관심상품 영역 -->
					<div class="noHistory"><i class="fa-solid fa-cart-shopping"></i>관심상품이 없습니다.</div>
				</div>
			</div>
			
			<div class="user-inquiryHistory">
				<div>
					<span>나의 문의내역</span>
				</div>
				<div class="my-list">
					<!-- 문의내역 영역 -->
					<c:choose>
						<c:when test="${not empty hList}">
							<div class="list-items">
								<div class="fixed-title">
									<span class="inquiry-type">문의유형</span>
									<span class="inquiry-title">문의제목</span>
									<span class="inquiry-answer">답변여부</span>
								</div>
								<c:forEach items="${hList}" var="hList">
								<div class="qa-list">
									<span class="inquiry-type">${hList.type}</span>
									<span class="inquiry-title"><a href="/help/detail?helpNo=${hList.helpNo}">${hList.title}</a></span>
									<span class="inquiry-answer ${hList.answer eq 'n' ? '' : 'answer-yes'}">${hList.answer eq 'n' ? '답변대기' : '답변완료'}
									</span>
								</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="noHistory"><i class="fa-regular fa-comments"></i>문의내역이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			
		</div>
		
		<div class="user-category">
			<div>
				<a href="#">
					<span><i class="fa-regular fa-pen-to-square"></i></span>
					<span>내가쓴리뷰</span>
				</a>
			</div>
			<div>
				<a href="/help/list?pageNo=1&answer=">
					<span><i class="fa-regular fa-circle-question"></i></span>
					<span>문의내역</span>
				</a>
			</div>
			<!-- 자체회원만 수정허용 -->
			<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_USER')).get()}">
			<div>
				<a href="/user/modify">
					<span><i class="fa-regular fa-user"></i></span>
					<span>회원정보수정</span>
				</a>
			</div>
			</c:if>
		</div>
				
	</div> 	
	
	<!-- 회원가입 완료시 모달창 오픈 -->
	<div class="join-background">
		<div class="join-modal">
			<span class="material-symbols-outlined" id="confirm-btn">close</span>
			<span class="modal-text"></span>
			<span><button type="button" id="confirm-btn">확인</button></span>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>