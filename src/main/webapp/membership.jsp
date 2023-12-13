<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 전용 공간</title>
</head>
<body>
	<h2>회원 전용 공간</h2>
		<hr>
		<h3>여기는 회원 전용공간입니다.</h3>
		<h3>회원을 탈퇴하려면 회원 탈퇴하기 버튼을 눌러주세요</h3>
		<br><br>
		<table border="0">
			<tr>
				<td>
					<form action="main.jsp">
						<input type="submit" value="◀ 메인 화면">
					</form>
				</td>
				<td>
					<form action="modify.jsp">
						<input type="submit" value="▼ 회원정보 수정하기">
					</form>
				</td>
				<td>
					<form action="withdraw.jsp">
						<input type="submit" value="회원 탈퇴하기 ▶">
					</form>
				</td>
			</tr>
		</table>
	
</body>
</html>