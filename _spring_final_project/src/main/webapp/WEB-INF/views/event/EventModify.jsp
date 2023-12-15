<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/tmpCss.css" rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<form action="/event/eventModify" method="post">
		<table>
			<tr>
				<th>이벤트 번호</th>
				<td><input type="text" name="evNo" value="${evo.evNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>이벤트 제목</th>
				<td><input type="text" name="evName" value="${evo.evName}"></td>
			</tr>
			<tr>
				<th>이벤트 시작일</th>
				<td><input type="datetime-local" name="evStart" value="${evo.evStart}"></td>
			</tr>
			<tr>
				<th>이벤트 종료일</th>
				<td><input type="datetime-local" name="evEnd" value="${evo.evEnd}"></td>
			</tr>
			<tr>
				<th>이벤트 타입</th>
				<td><select name="evType" >
						<option>선택...</option>
						<option value="prboxEv">선물상자</option>
						<option value="rouletteEv">룰렛</option>
						<option value="AttendanceEv">출석체크</option>
				</select></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="summernote" name="evContent">${evo.evContent}</textarea></td>
			</tr>
		</table>

		<button type="submit">등록</button>
	</form>
	

	<script type="text/javascript" src="/resources/js/review/summernote.js"></script>
	<script type="text/javascript">
	function uploadImage(file) {
		var formData = new FormData();
		formData.append('file', file);

		$.ajax({
			url : '/event/image',
			method : 'POST',
			data : formData,
			contentType : false,
			processData : false,
			enctype : 'multipart/form-data',
			success : function(url) {
				console.log('Image uploaded successfully. URL:', url);
				var imgTag = '<img src="' + url + '" />';
				$('#summernote').summernote('pasteHTML', imgTag);
			},
			error : function() {
				console.error('Error uploading image');
			}
		});
	}
	</script>

</body>
</html>