<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>친구목록</title>
</head>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#addFriend").on("click", function(e){
			e.preventDefault();
			fn_addFriend();
		});
		
		//친구 닉네임 클릭
		$("a[name='memberNick']").on("click", function(e) {
        	e.preventDefault();
        	fn_friendDetail($(this));
		})
		
		//친구 삭제 클릭
		$("a[name='delete']").on("click", function(e) {
           	e.preventDefault();
           	fn_friendListDel($(this));
		})
		
	});
	
	function fn_addFriend(){ //친구추가!!!
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/member/addFriend.do' />");
        comSubmit.submit();
    }
    
    function fn_friendDetail(obj){ //친구 상세보기
        var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/member/friendDetail.do'/>");
        comSubmit.addParam("FRIEND_IDX",obj.parent().find("#friendDetail").val());
       	comSubmit.submit();
    }
    
    function fn_friendListDel(obj){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/member/friendDelete.do'/>");
        comSubmit.addParam("FRIEND_IDX", obj.parent().find("#friendListDel").val());
        comSubmit.submit();
    }
	
</script>
<body>
<h3>친구목록</h3>
	<form id="frm">
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
				<th scope="col">삭제
			</tr>
			<tbody>
			<c:choose>
				<c:when test = "${fn:length(FRIEND_LIST)>0}">
					<c:forEach items = "${FRIEND_LIST }" var = "row">
						<tr>
						<td>
							<c:when test="${row.STORED_FILE_NAME }">
							</c:when>
						</td>
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
	<a href="#this" id = "addFriend">친구추가</a>
</body>
</html>