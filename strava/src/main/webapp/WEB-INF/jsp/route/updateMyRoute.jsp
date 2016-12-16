<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang = "ko">
<head>
<%@ include file = "/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id = "frm" name="frm" enctype="multipart/form-data">
	
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
		<div id = "fileDiv">
			<p>
				<input type = "file" id = "file" name = "file_0">
				<a href = "#this" id = "delete" name = "delete"> 삭제 </a>
			</p>
		</div>
		
		<br><br><br>
	 <a href="#this" id = "addFile">사진파일 추가</a>
	 <a href="#this" id="update" >수정</a>
     <a href="#this" id="list" >목록으로</a>
	</form>
	
	 <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    var gfv_count = '${fn:length(list)+1}';
    
    $(document).ready(function(){
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openMyRouteList();
        });
         
        $("#update").on("click", function(e){ //업로드 버튼
            e.preventDefault();
            fn_updateMyRoute();
        });
        
        $("#addFile").on("click", function(e){ //파일 추가 버튼
        	e.preventDefault();
        	fn_addFile();
   		 });
        
        $("a[name='delete']").on("click", function(e){ //파일삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
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
    function fn_addFile(){
        var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' name='delete'>삭제</a></p>";
        $("#fileDiv").append(str);
        $("a[name='delete']").on("click", function(e){ //파일삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
        });
    }
    
    function fn_deleteFile(obj){
        obj.parent().remove();
    }

    </script>
	
</body>
</html>