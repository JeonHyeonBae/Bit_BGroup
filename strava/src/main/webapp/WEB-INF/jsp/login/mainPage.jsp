<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "/WEB-INF/include/include-header.jspf" %>
</head>

<body>
<h1>로그인성공화면입니다</h1>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">

$(document).ready(function(){
	$("#logout").on("click", function(e){//로그아웃 버튼
		e.preventDefault();
		fn_Logout();
	});
	
	$("#friendList").on("click", function(e){//친구추가 버튼
		e.preventDefault();
		fn_FriendList();
	});
});

function fn_Logout() {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/logout/logout.do' />");
	comSubmit.submit();
}

function fn_FriendList() {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/member/friendListView.do' />");
	comSubmit.submit();
}

</script>
<br/><br/>
<%
out.print(session.getAttribute("MEMBER_IDX"));
%>

<br/><br/>
	<a href = "/strava/route/map/openMap.do">기본 지도 화면</a><br/>
	<a href = "/strava/route/openAllRouteList.do">DB 저장 전체 경로 목록화면</a><br/>
	<a href = "/strava/route/openMyRouteList.do">특정 아이디 경로 전체 목록</a><br/>
	<a href = "/strava/androidtest.jsp">안드로이드 테스트</a>
<br/><br/>
<input type="button" value="친구목록" id="friendList">
<input type="button" value="로그아웃" id="logout">
</body>
</html>