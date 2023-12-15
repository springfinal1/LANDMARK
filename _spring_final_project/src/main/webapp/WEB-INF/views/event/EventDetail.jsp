<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/event/EventDetail.css" rel="stylesheet">
<!-- <link href="/resources/css/event/Roulette.css"> -->
<style type="text/css">
@font-face {
    font-family: 'Orbit-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/Orbit-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
canvas {
    /* font-family: Pretendard; */
    font-family: Orbit-Regular;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="event-detail-container">
		<div class="event-tap">
			<div class="event-tap-side">
				<ul>
					<li>
						<a href="/event/OneventList" id="on">진행중인 이벤트<span>></span></a>
					</li>
					<li>
						<a href="/event/LasteventList" id="last">지난 이벤트<span>></span></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="event-detail-div">
			<div class="event-detail-title">${evo.evName }</div>
			<div class="event-detail-period">${evo.evStart } ~ ${evo.evEnd}</div>
			<div class="event-detail-content" id="contentArea">
				${fn:replace(evo.evContent,'\\','/')}
			</div>
			<div class="detail-lower-div">
				<a href="/event/OneventList"><button type="button" class="listbtn">목록보기</button></a>
			</div>
		</div>
	</div>

	

	<a href="/event/eventRemove?evNo=${evo.evNo}"><button type="button">삭제</button></a>
	<a href="/event/eventModify?evNo=${evo.evNo}"><button type="button">수정</button></a>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- <script type="text/javascript" src="/resources/js/event/RouletteEvent.js"></script> -->
	<script type="text/javascript">
		let uid=`<c:out value='${uvo.id}'/>`;
		let evType=`<c:out value='${evo.evType}'/>`;
	</script>
		
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script charset="UTF-8" src="https://gamekiki.com/kshop/kwidget/js/kwidget.js"></script>
	 <script type="text/javascript" src="/resources/js/event/gamekiki.js"></script>
</body>
</html>