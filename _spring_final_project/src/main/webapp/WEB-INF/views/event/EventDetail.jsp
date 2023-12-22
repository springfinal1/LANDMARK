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
<link href="/resources/css/event/AttendenceEvent.css" rel="stylesheet">
<link href="/resources/css/event/Roulette.css" rel="stylesheet">
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css'
	rel='stylesheet' media='print' />
	
<!-- <link href="/resources/css/event/Roulette.css"> -->
<style type="text/css">
@font-face {
	font-family: 'Orbit-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/Orbit-Regular.woff2')
		format('woff2');
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
                  <a href="/event/OneventList" class="event-show" id="on">진행중인 이벤트<span>></span></a>
               </li>
               <li>
                  <a href="/event/LasteventList" class="event-show" id="last">지난 이벤트<span>></span></a>
               </li>
               <li>
                  <a href="/event/OneventList" class="event-list-show">목록보기<span>></span></a>
               </li>
            </ul>
         </div>
      </div>
      
      <div class="event-detail-div">
         <div>
            <div class="event-detail-title">${evo.evName }</div>
            <div class="event-detail-period">${evo.evStart }~${evo.evEnd}</div>
         </div>
         <div class="event-detail-content" id="contentArea">
            ${fn:replace(evo.evContent,'\\','/')}
         </div>
         <div class="button-box">
            <button class="play-event">이벤트 참여하기</button>
             <div class="event-edit">
               <a href="/event/eventModify?evNo=${evo.evNo}"><button type="button">수정</button></a>
               <a href="/event/eventRemove?evNo=${evo.evNo}"><button type="button">삭제</button></a>
             </div>
         </div>
      </div>
      
      
      <div class="play-div">
         <div class="roulette-div">
            <div>
               <div class="canvas-box">
                  <i class="fa-solid fa-caret-down fa-xl"></i>
                  <canvas width='650' height='650'></canvas>
               </div>
               <div class="moving-box">
                  <i class="fa-solid fa-backward" id="play"></i><button onclick="rotate()" id="roulette-btn">룰렛 돌리기</button>
               </div>
            </div>
         </div>
      </div>
   </div>

   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script type="text/javascript">
      let uid = `<c:out value='${uvo.id}'/>`;
      let evType = `<c:out value='${evo.evType}'/>`;
      let evNo = `<c:out value='${evo.evNo}'/>`;
   </script>
   <script type="text/javascript"
      src="/resources/js/event/RouletteEvent.js"></script>
</body>
</html>