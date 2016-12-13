<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>전체 저장 경로 검색</title>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
	<h2>DB 전체 경로 목록</h2>
	<table style = "border:1px solid #ccc">
		<colgroup>
			<col width = "10%"/>
			<col width = "*"/>
			<col width = "25%"/>
			<col width = "10%"/>
			<col width = "10%"/>
			<col width = "10%"/>
			<col width = "10%"/>
		</colgroup>
		<thread>
			<tr>
				<th scope = "col">번호
				<th scope = "col">제목
				<th scope = "col">날짜
				<th scope = "col">시간
				<th scope = "col">거리
				<th scope = "col">고도
				<th scope = "col">
			</tr>
		</thread>
		<tbody>
			<c:choose>
				<c:when test = "${fn:length(list)>0}">
					<c:forEach items = "${list }" var = "row">
						<tr>
							<td>${row.RIDE_IDX }</td>
							<td>${row.RIDE_TITLE }</td>
							<td>${row.RIDE_DATE }</td>
							<td>${row.RIDE_DURATION }</td>
							<td>${row.RIDE_DISTANCE }</td>
							<td>${row.RIDE_ELEVATION }</td>
							<td>좋아요</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan = "7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>		
</body>
</html>