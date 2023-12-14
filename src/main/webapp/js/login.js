/**
 * 
 */

function checkLogin() {
	if(document.loginForm.adminid.value == "") {//아이디가 공란인지 체크
		alert("아이디를 입력해 주세요.");
		return false;
	}
	if(document.loginForm.adminpw.value == "") {//비밀번호가 공란인지 체크
		alert("비밀번호를 입력해 주세요.");
		return false;
	}
	
	return true;
}