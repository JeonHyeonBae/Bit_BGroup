<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){
    	$("#search").on("click", function(e){ 
			e.preventDefault();
			fn_searchFriend($(this));
		});
	});
	
	function fn_searchFriend(obj){
		
	}
</script>
<body>
	<form id = "frm" >
	<h2>친구 검색</h2>
	아이디 또는 닉네임을 입력해주세요
	<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" size=12 maxlength="12">
	<a href="#this" id = "search">검색</a>
	
	<table style="border: 1px solid #ccc">
		<colgroup>
			<col width="25%" />
			<col width="25" />
			<col width="25%" />
			<col width="15%" />
		</colgroup>
		<tr>
			<th scope="col">프로필사진
			<th scope="col">닉네임
			<th scope="col">주활동지역
			<th scope="col">
		</tr>
		<tbody>
		<c:choose>
			<c:when test = "${fn:length(FRIEND_LIST)>0}">
				<c:forEach items = "${FRIEND_LIST }" var = "row">
					<tr>
					<td>${row.MEMBER_PROF_IMG }</td>
					<td><a href = "#this" name = "memberNick">${row.MEMBER_NICK }</a>
					<input type = "hidden" id = "friendDetail" name="friendDetail" value = "${row.MEMBER_IDX}"></td>	
					<td>${row.MEMBER_ADDR }</td>
					<td>
						<a href = #this name = "delete">삭제</a>
						<input type = "hidden" id = "friendListDel" name="friendListDel" value = "${row.MEMBER_IDX}">
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
		</tbody>
	</table>
	</form>
</body>
</html>