<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>경로 상세 정보</title>
<%@ include file = "/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<h2>${map.RIDE_TITLE }</h2>
	<table style = "border:1px solid #ccc">
		<colgroup>
			<col width = "15%"/>
			<col width = "*"/>
			<col width = "20%"/>
			<col width = "10%"/>
			<col width = "10%"/>
			<col width = "20%"/>
			<col with =  "25%"/>
		</colgroup>
		<thread>
			<tr>
				<th scope = "col">날짜
				<th scope = "col">제목
				<th scope = "col">시간
				<th scope = "col">거리
				<th scope = "col">고도
				<th scope = "col">메모
				<th scope = "col">경로 저장 파일
				<th scope = "col">사진
				
			</tr>
		</thread>
		<tbody>
			<tr>
				<td>${map.RIDE_DATE }</td>
				<td>${map.RIDE_TITLE }</td>
				<td>${map.RIDE_DURATION }</td>
				<td>${map.RIDE_DISTANCE }</td>
				<td>${map.RIDE_ELEVATION }</td>
				<td>${map.RIDE_CONTENT }</td>
				<c:choose>
				<c:when test = "${fn:length(MYRIDEPIC)>0}">
					<c:forEach items = "${MYRIDEPIC}" var = "pic">
						<tr>
						<td>
							<img src="/strava/photo/${pic.STORED_FILE_NAME}" width="200"/>
						</td>
						
						</tr>
					</c:forEach>
				</c:when> 
				<c:otherwise>
					<tr>
						<td colspan = "6">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
				
				<td>
					<c:forEach var = "row" items = "${list }">
						<input type = "hidden" id = "file_idx" value = ${row.RIDE_RECORD_FILE_IDX }>
						<a href = "#this" name = "file">${row.ORIGINAL_FILE_NAME }</a>
						(${ row.FILE_SIZE}kb)
					</c:forEach>
				</td>
			</tr>
		</tbody>		
	</table>
	<br/><br/><br/>
	
	<h2>랭킹 테이블</h2>	
	<table style = "border:1px solid #ccc">
		<colgroup>
			<col width = "10%"/>
			<col width = "*"/>
			<col width = "30%"/>
			<col width = "20%"/>
			<col width = "15%"/>
		</colgroup>
		<thread>
			<tr>
				<th scope = "col">순위
				<th scope = "col">이름
				<th scope = "col">날짜
				<th scope = "col">속도
				<th scope = "col">시간
			</tr>
		</thread>
		<tbody>
			<tr>
				<td>순위 DB 조회값</td>
				<td>회원 ID + 해당 회원 상세 페이지</td>
				<td>구간 기록 DB 저장 날짜</td>
				<td>구간 기록 DB 저장 속도</td>
				<td>구간 기록 DB 저장 시간</td>
			</tr>
		</tbody>		
	</table>
		페이징 넘버

	<%@ include file = "/WEB-INF/include/include-body.jspf" %>
	<script type = "text/javascript">
		$(document).ready(function(){
			$("a[name='file']").on("click", function(e){ //파일 이름
		    	e.preventDefault();
		        fn_downloadFile($(this));
		    });
		});
		
		function fn_downloadFile(obj){
			var file_idx = obj.parent().find("#file_idx").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/file/downloadFile.do' />");
			comSubmit.addParam("RIDE_RECORD_FILE_IDX", file_idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>