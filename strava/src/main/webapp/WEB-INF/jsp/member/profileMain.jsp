<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file = "/WEB-INF/include/include-header.jspf" %>
<title>Insert title here</title>
</head>
<body>
<form >
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
<br><br><br>
닉네임 : ${MYINFO.MEMBER_NICK}<br>
주소 : ${MYINFO.MEMBER_ADDR}<br>


</form>
<img src="/strava/photo/${MYPIC.STORED_FILE_NAME}"/>
</body>
</html>