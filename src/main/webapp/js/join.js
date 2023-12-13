/**
 * 
 */

 function checkJoin() {
	if(document.joinForm.userID.value.length < 4 || document.joinForm.userID.value.length > 15) {
		alert("아이디는 4~15자 사이로 작성하세요.");
		return false;
	}
	
	if(document.joinForm.userPW.value.length < 5) {
		alert("비밀번호는 5자 이상으로 작성하세요.");
		return false;
	}
	
	if(document.joinForm.userEMAIL.value.length == 0) {
		alert("이메일은 필수 입력사항입니다.");
		return false;
	}
}	