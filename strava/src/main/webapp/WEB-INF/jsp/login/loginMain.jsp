<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang = "ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file ="/WEB-INF/include/include-header.jspf" %>
<title>로그인</title>

<%@ include file = "/WEB-INF/include/include-body.jspf" %>
<script language="JavaScript">

	function loginsuccess() {
		//alert("로그인중입니다. 기다려주세요 ' -^");
		location.href='/strava/login/loginSuccess.do';
		//frm.submit();
	}
	
	function loginCheck() {
		var param = "MEMBER_ID" + "=" + $("#MEMBER_ID").val() + "&" + "MEMBER_PASSWORD" + "=" + $("#MEMBER_PASSWORD").val();
		$.ajax({
			url:"/strava/login/login.do",
			type:"GET",
			data:param,
			cache:false,
			async:false,
			dataType:"text",
			
			success : function(response) {
				if(response== 1 ){
					loginsuccess();
				} else if(response == 0) {
					alert("아이디 또는 비밀번호가 틀렸습니다. 다시 입력해주세요 ' -^");
					return false;
				}
				alert(check);
			}, error:function(request, status, error) {
				if(request.status != '0') {
					alert("code : " + request.status + "\r\nmessage :" + 
							request.reponseText + "\r\nerror : " + error);
				}
			}
		});
	}
</script>

</head>
<body>
	<br>
	<form id="frm" >
		<P align="center">
			<FONT size="6"><B>로그인 페이지</B></FONT>
		</P>
		<table border="0" align="center" cellspacing="0" bgcolor="PapayaWhip" width="300" height="150">
			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30"><b>로그인</b></td>
			</tr>

			<tr align="center">
				<td bgcolor="PeachPuff" width="100">아이디</td>
				<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" size="12" maxlength="12"></td>
			</tr>

			<tr align="center">
				<td bgcolor="PeachPuff">비밀번호</td>
				<td><input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD" size="12" maxlength="12"></td>
			</tr>

			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30">
					<input type="button" value="로그인" onclick='loginCheck()'> 
					<input type="button" value="회원 가입" onclick="javascript:location.href='/strava/login/memberJoin.do';">
					<input type="button" value="비번찾기" onclick="javascript:location.href='/password_search.do';"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>