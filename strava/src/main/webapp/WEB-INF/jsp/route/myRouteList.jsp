<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>유저 저장 경로 검색</title>

</head>
<body>
	<form id = "frm">
	<h2>유저 저장 경로 목록</h2>
	<table style = "border:1px solid #ccc">
		<colgroup>
			<col width = "25%"/>
			<col width = "*"/>
			<col width = "25%"/>
			<col width = "15%"/>
			<col width = "15%"/>
		</colgroup>
		<thread>
			<tr>
				<th scope = "col">날짜
				<th scope = "col">제목
				<th scope = "col">시간
				<th scope = "col">거리
				<th scope = "col">고도
			</tr>
		</thread>
		<tbody>
			<c:choose>
				<c:when test = "${fn:length(list)>0}">
					<c:forEach items = "${list }" var = "row">
						<tr>
						<td>${row.RIDE_DATE }</td>
							<td><a href = "#this" name = "ride_title">${row.RIDE_TITLE }</a>
							<input type = "hidden" id = "ride_idx_detail" value = "${row.RIDE_IDX}"></td>	
							<td>${row.RIDE_DURATION }</td>
							<td>${row.RIDE_DISTANCE }</td>
							<td>${row.RIDE_ELEVATION}</td>
							<td><a href = #this name = "update">수정</a>
							<input type = "hidden" id = "ride_idx_update" value = "${row.RIDE_IDX}"> / 
							<a href = #this name = "delete">삭제</a>
							<input type = "hidden" id = "ride_idx_delete" value = "${row.RIDE_IDX}">
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
   
    <a href="#this" id = "upload">경로 업로드</a>
    <a href="#this" id = "index">메인으로</a>
    
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#upload").on("click", function(e){ 
                e.preventDefault();
                fn_uploadRouteForm();
            });
            
            $("a[name='ride_title']").on("click", function(e) {
            	e.preventDefault();
            	fn_openRouteDetail($(this));
			})
			
			 
            $("a[name='update']").on("click", function(e) {
            	e.preventDefault();
            	fn_updateMyRoute($(this));
			})
			
			 
            $("a[name='delete']").on("click", function(e) {
            	e.preventDefault();
            	fn_deleteMyRoute($(this));
			})
			
			$("#index").on("click", function(e){ 
                e.preventDefault();
                fn_toIndex();
            });
       
        });
         
         
        function fn_uploadRouteForm(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/route/openRouteUpload.do' />");
            comSubmit.submit();
        }
        
        function fn_openRouteDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/route/openRouteDetail.do'/>");
            comSubmit.addParam("RIDE_IDX",obj.parent().find("#ride_idx_detail").val());
           	comSubmit.submit();
        }
        
        function fn_updateMyRoute(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/route/openUpdateMyRoute.do'/>");
            comSubmit.addParam("RIDE_IDX", obj.parent().find("#ride_idx_update").val());
            comSubmit.submit();
        }
        
        function fn_deleteMyRoute(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/route/deleteMyRoute.do'/>");
            comSubmit.addParam("RIDE_IDX",obj.parent().find("#ride_idx_delete").val());
           	comSubmit.submit();
        }
        
        function fn_toIndex(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/index.jsp' />");
            comSubmit.submit();
        }
       
    </script>
</body>
</html>