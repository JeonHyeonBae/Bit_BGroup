<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang = "ko">
<head>
<%@ include file = "/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id = "frm">
	
	<input type = "hidden" id = "ride_idx" name = "ride_idx" value = ${map.RIDE_IDX }> 
		<table>
			<colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>내 경로 수정</caption>
            <tbody>
            	<tr>
            		<th>제목</th>
            		<td><input type = "text" id = "RIDE_TITLE" name = "RIDE_TITLE"></input></td>
            	</tr>
            	<tr>
            		<th>설명</th>
            		<td colspan="2">
            		<textarea rows = "20" cols="100" id = "RIDE_CONTENT" name = "RIDE_CONTENT"></textarea>
            	</tr>
			</tbody>
		</table>
	 <a href="#this" id="update" >수정</a>
     <a href="#this" id="list" >목록으로</a>
	</form>
	
	 <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_MyRouteList();
        });
         
        $("#update").on("click", function(e){ //업로드 버튼
            e.preventDefault();
            fn_updateMyRoute();
        });
    });
     
    function fn_openMyRouteList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/route/openMyRouteList.do' />");
        comSubmit.submit();
    }
     
    function fn_updateMyRoute(){
    	var comSubmit = new ComSubmit("frm");
    	comSubmit.setUrl("<c:url value='/route/updateMyRoute.do' />");
        comSubmit.addParam("RIDE_IDX",$("#ride_idx").val());
        comSubmit.submit();
    }

    </script>
	
</body>
</html>