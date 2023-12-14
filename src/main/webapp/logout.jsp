<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>관리자 로그 아웃</h2>
	<hr>
	관리자 로그 아웃을 실행합니다.<br><br>
	<%
		session.invalidate(); //로그아웃 -> 세션 삭제
	%>
	<form action="main.jsp">
		<input type="submit" value="메인화면으로 이동 ▶">
	</form>
	
</body>
</html>