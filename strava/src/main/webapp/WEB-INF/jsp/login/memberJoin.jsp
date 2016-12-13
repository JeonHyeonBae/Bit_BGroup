<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file = "/WEB-INF/include/include-header.jspf" %>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">

	var idCount = 0;
	var nickCount = 0;

	function idCheck(){
		
		var id_temp = $("#MEMBER_ID").val();
		
        var regexp = /[0-9a-zA-Z]/; // 숫자,영문,
        // var regexp = /[0-9]/; // 숫자만
		// var regexp = /[a-zA-Z]/; // 영문만
		// var regexp = /[가-힣]/;//한글만
        
        for(var i=0; i<id_temp.length; i++){
            if(id_temp.charAt(i) != " " && regexp.test(id_temp.charAt(i)) == false ){
				alert("한글이나 특수문자, 공백은 입력불가능 합니다.");
				return false;
			}
        }
        idOverlapCheck();
	}
	
	function idOverlapCheck(){
		var param = "MEMBER_ID" + "=" + $("#MEMBER_ID").val();
		if($("#MEMBER_ID").val() == "" || $("#MEMBER_ID").val()==null)
		{
			alert("아이디를 입력해주세요");
			return false;
		}
		
		$.ajax({
			url : "/strava/login/overlapCheck.do",
			type : "GET",
			data : param,
			cache : false,
			async : false,
			dataType : "text",

			success : function(response) {				
				if( response == 0 )
				{
					idCount = 1;
					alert("사용 가능한 아이디 입니다.")
					
				}
				else
				{
					alert("아이디가 중복 됩니다. 다시 입력 해주세요.");
					return false;
				}	
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code : " + request.status + "\r\nmessage : "
							+ request.reponseText + "\r\nerror : " + error);
				}
			}


		});
	}

	function nickCheck() {

		var nick_temp = $("#MEMBER_NICK").val();

		var regexp = /[0-9a-zA-Z가-힣]/; // 숫자,영문,
		// var regexp = /[0-9]/; // 숫자만
		// var regexp = /[a-zA-Z]/; // 영문만
		// var regexp = /[가-힣]/;//한글만

		for (var i = 0; i < nick_temp.length; i++) {
			if (nick_temp.charAt(i) != " " && regexp.test(nick_temp.charAt(i)) == false) {
				alert("특수문자, 공백은 입력불가능 합니다.");
				return false;
			}
		}
		nickOverlapCheck();
	}

	function nickOverlapCheck() {
		var param = "MEMBER_NICK" + "=" + $("#MEMBER_NICK").val();
		if ($("#MEMBER_NICK").val() == "" || $("#MEMBER_NICK").val() == null) {
			alert("닉네임을 입력해주세요");
			return false;
		}

		$.ajax({
			url : "/strava/login/overlapCheck.do",
			type : "GET",
			data : param,
			cache : false,
			async : false,
			dataType : "text",

			success : function(response) {
				if (response == 0) {
					nickCount = 1;
					alert("사용 가능한 닉네임 입니다.")
				} else {
					alert("닉네임이 중복 됩니다. 다시 입력 해주세요.");
					return false;
				}
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code : " + request.status + "\r\nmessage : "
							+ request.reponseText + "\r\nerror : " + error);
				}
			}

		});
	}

	function formCheck() {
		var member_name = document.getElementById("MEMBER_NAME");
		var member_id = document.getElementById("MEMBER_ID");
		var member_pw = document.getElementById("MEMBER_PASSWORD");
		var member_nick = document.getElementById("MEMBER_NICK");
		var password_check = document.getElementById("PASSWORD_CHECK");
		var hp1 = document.getElementById("hp1");
		var hp2 = document.getElementById("hp2");
		var hp3 = document.getElementById("hp3");
		var hp = hp1.value + hp2.value + hp3.value;
		var email1 = document.getElementById("MEMBER_EMAIL1");
		var email2 = document.getElementById("MEMBER_EMAIL2");
		var email3 = document.getElementById("EMAIL_SELECT");
		var member_email = email1.value + "@" + email2.value + email3.value;

		

		/*핸드폰 번호 길이 체크*/
		if (member_name.value == "" || member_name.value == null) {
			alert("이름을 입력하세요");
			member_name.focus();
			return false;
		}
		
		if (member_id.value == "" || member_id.value == null) {
			alert("ID를 입력하세요");
			member_id.focus();
			return false;
		}
		
		if (member_nick.value == "" || member_nick.value == null) {
			alert("닉네임을 입력하세요");
			member_nick.focus();
			return false;
		}

		if (member_pw.value == "" || member_pw.value == null) {
			alert("비밀번호를 입력하세요");
			member_pw.focus();
			return false;
		}
		
		if (member_pw.value.length < 7 || member_pw.value.length >= 13 ) {
			alert("비밀번호 길이가 올바르지 않습니다.");
			member_pw.focus();
			return false;
		}

		if (password_check.value == "" || password_check.value == null) {
			alert("비밀번호확인란을 입력하세요");
			password_check.focus();
			return false;
		}

		/*비밀번호와 비밀번호확인란 같은지 확인*/
		if (member_pw.value != password_check.value) {
			alert("비밀번호와 비밀번호 확인란이 다릅니다.");
			member_pw.focus();
			return false;
		}
		
		if (hp2.value.length == "" || hp2.value.length == null
				|| hp3.value.length == "" || hp3.value.length == null) {
			alert("연락처를 입력하세요");
			hp2.focus();
			return false;
		}

		/*핸드폰 번호 길이 체크*/
		if (hp2.value.length <= 2 || hp3.value.length != 4) {
			alert("연락처가 잘못됐습니다.");
			hp2.focus();
			return false;
		}
		
		/*핸드폰이 숫자만 들어가는지 체크*/
		if (isNaN(hp2.value) || isNaN(hp3.value)) {
			alert("연락처는 숫자만 들어갈 수 있습니다.");
			hp2.focus();
			return false;
		}
		
		/**/
		if (hp2.value.length > 2 || hp3.value.length == 4) {
			document.getElementById("MEMBER_TEL").value = hp;
		}

		if (idCount == 0 || nickCount == 0) {
			alert("아이디 또는 닉네임 중복확인이 필요합니다.");
			member_id.focus();
			return false;
		}

		else {
			document.getElementById("MEMBER_EMAIL").value = member_email;
			save();
		}

	}

	function checkEmailAdd(email) {
		if (email == 1) {
			document.getElementById("MEMBER_EMAIL2").style.display = "block";
			document.frm.MEMBER_EMAIL2.value = "";
			document.frm.MEMBER_EMAIL2.focus();
		} else {
			document.getElementById("MEMBER_EMAIL2").style.display = "none";
			document.frm.MEMBER_EMAIL2.value = document.frm.EMAIL_SELECT.value;
		}
	}

	function init() {
		idCount = 0;
		nickCount = 0;
	}

	function save() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/login/memberJoinForm.do'/>");
		comSubmit.submit();
		alert("가입이 완료되었습니다. 로그인 화면으로 돌아갑니다.")
	}

	function idCountCheck() {
		if (idCount == 1) {
			idCount = 0;
		}
	}
	
	function nickCountCheck() {
		if (nickCount == 1) {
			nickCount = 0;
		}
	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body bgcolor="#ffffff" text="#000000">
	<P align="center">
		<FONT size="6"><B>회원 가입</B></FONT>
	</P>


	<form id="frm">
		<table width="550" align="center" border="1" bordercolor="ADD8E6"
			cellpadding="5">
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">이름</td>
				<td bgcolor="#E0FFFF">
				<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" size=12 maxlength="12"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">아이디</td>
				<td bgcolor="#E0FFFF">
				<input type="text" size="10" id="MEMBER_ID" name="MEMBER_ID" maxlength="10" onkeydown="idCountCheck();" onkeypress="idCountCheck();">&nbsp;<input type="button" value="중복확인" onclick='idCheck()'></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">닉네임</td>
				<td bgcolor="#E0FFFF">
				<input type="text" size="10" id="MEMBER_NICK" name="MEMBER_NICK" maxlength="10" onkeydown="nickCountCheck();" onkeypress="nickCountCheck();">&nbsp;<input type="button" value="중복확인" onclick='nickCheck()'></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">비밀번호</td>
				<td bgcolor="#E0FFFF">
				<input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD" size=12 maxlength="12"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">비밀번호확인</td>
				<td bgcolor="#E0FFFF"><input type="password" id="PASSWORD_CHECK" name="PASSWORD_CHECK" size=12 maxlength="12"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">이메일</td>
				<td bgcolor="#E0FFFF">
				<input name="MEMBER_EMAIL1" class="box" type="text" id="MEMBER_EMAIL1" size="12">
				 @ <select name="EMAIL_SELECT" class="box" id="EMAIL_SELECT" onChange="checkEmailAdd(this.value);">
    					<option value="" selected>선택하세요</option>
    					<option value="gmail.com">gmail.com</option>
    					<option value="nate.com">nate.com</option>
    					<option value="naver.com">naver.com</option>
    					<option value="hanmail.net">hanmail.net</option>
    					<option value="1" >직접입력</option>
					</select>
				<input name="MEMBER_EMAIL2" class="box" type="text" id="MEMBER_EMAIL2" size="15" style="display:none">
				<input type="hidden" id="MEMBER_EMAIL" name="MEMBER_EMAIL" >
				</td>
			</tr>
			<tr>
				<td rowspan="2" height="30" align="center" bgcolor="#FFDEAD">연락처</td>
				<td bgcolor="#E0FFFF">
					<select id="hp1" name="hp1" style="width:70;">
					   <option value="010"  selected> 010 </option>
					   <option value="02" > 02 </option>
					   <option value="031" > 031 </option>
					   <option value="032" > 032 </option>
					   <option value="033" > 033 </option>
					   <option value="041" > 041 </option>
					   <option value="042" > 042 </option>
					   <option value="043" > 043 </option>
					   <option value="044" > 044 </option>
					   <option value="051" > 051 </option>
					   <option value="052" > 052 </option>
					   <option value="053" > 053 </option>
					   <option value="054" > 054 </option>
					   <option value="055" > 055 </option>
					   <option value="061" > 061 </option>
					   <option value="062" > 062 </option>
					   <option value="063" > 063 </option>
					   <option value="064" > 064 </option>
					</select>
					-
					<input type="text" id="hp2" name="hp2" size="4" maxlength="4">
					-
					<input type="text" id="hp3" name="hp3" size="4" maxlength="4">
					<input type="hidden" id="MEMBER_TEL" name="MEMBER_TEL" >
				</td>
			</tr>
			<tr>
				<td rowspan="2" height="30" align="center" bgcolor="#FFDEAD">주활동지역(나중에추가!!)</td>
			</tr>
			<tr>
				<td rowspan="2" height="30" align="center" bgcolor="#FFDEAD">프로필(나중에추가!!)</td>
			</tr>
			<tr>
				<td colspan="2" height="30" align="center" bgcolor="#FFDEAD">
				<input type="button" id="join" name="join" value="가입하기" onclick="javascript:formCheck();">&nbsp;&nbsp; <input type="reset" value="리셋하기" onclick='init()'>
				<input type="button" id="back" value="뒤로가기" onclick="javascript:location.href='/strava/login/loginMain.do';"></td>
			</tr>
		</table>
	</form>
</body>
</html>