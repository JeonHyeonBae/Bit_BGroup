<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">

</script>
<body>
프로필사진보여주는거 추가해야됩니다
	<h2>${FRIEND_DETAIL.MEMBER_NICK }</h2><h3>의 프로필입니다.</h3>
	<table style = "border:1px solid #ccc">
		<colgroup>
			<col width = "20%"/>
			<col width = "10%"/>
			<col width = "10%"/>
			<col width = "10%"/>
			<col width = "20%"/>
		</colgroup>
		<tr>
			<th scope = "col">프로필사진
			<th scope = "col">이름
			<th scope = "col">연락처
			<th scope = "col">EMAIL
			<th scope = "col">주 활동 지역			
		</tr>
		<tbody>
			<tr>
				<td>${FRIEND_DETAIL.MEMBER_PROF_IMG }</td>
				<td>${FRIEND_DETAIL.MEMBER_NAME }</td>
				<td>${FRIEND_DETAIL.MEMBER_TEL }</td>
				<td>${FRIEND_DETAIL.MEMBER_EMAIL }</td>
				<td>${FRIEND_DETAIL.MEMBER_ADDR }</td>
			</tr>
		</tbody>
	</table>

</body>
</html>