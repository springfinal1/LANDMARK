<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/event/EventList.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


		
			
	<div class="event-now">
			<c:choose>
				<c:when test="${msg eq 'on' }">
					<p>
						<strong>NOW</strong> <strong>진행 중인 이벤트</strong>
					</p>
				</c:when>
				<c:otherwise>
					<p>
						<strong>END</strong> <strong>지나간 이벤트</strong>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
		
		
		<div class="event-list-container">
			<div class="event-tap">
				<div class="event-tap-side">
					<ul>
						<li>
							<a href="/event/OneventList" id="on">진행중인 이벤트<span>></span></a>
						</li>
						<li>
							<a href="/event/LasteventList" id="last">지난 이벤트<span>></span></a>
						</li>
						<li>
							<a href="/event/eventRegister">이벤트 추가 <span>></span></a>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="item-list-div">
			<ul class="item-list-ul">
				<c:forEach items="${list}" var="evo">
					<li>
						<div class="event-item">
							<div class="event-img">
								<img src="${evo.thumbnail}">
							</div>
							<div class="event-title">
								<a href="/event/eventDetail?evNo=${evo.evNo}"> <strong>
										${evo.evName} </strong>
								</a>
							</div>
							<div class="event-period">${evo.evStart} ~ ${evo.evEnd}</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		</div>
		<script type="text/javascript">
			let msg = `<c:out value='${msg}'/>`;
			let uid=`<c:out value='${uvo.id}'/>`;
			console.log(msg);
		</script>
	
		<script type="text/javascript" src="/resources/js/event/EventList.js"></script>
		<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script charset="UTF-8" src="https://gamekiki.com/kshop/kwidget/js/kwidget.js"></script>
	 <script type="text/javascript" src="/resources/js/event/gamekiki.js"></script> -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>