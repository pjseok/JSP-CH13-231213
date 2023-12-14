<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<h2>회원 리스트</h2>
	<hr>
	아이디 / 이메일 / 가입일시<br> 
	<%
		if(session.getAttribute("adminID") == null) {
			response.sendRedirect("login.jsp");
		}//로그인이 되어 있지 않은 상태에서 이 페이지를 실행하면 login.jsp 페이지로 강제 이동
		
	
		String sql="SELECT userid, useremail, signuptime FROM membertb";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/memberdata";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		ResultSet rs = null;//select문 실행시 DB에서 반환해주는 데이터를 받기위한 객체 준비
		
		try {
			Class.forName(driverName);//jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			
			stmt = conn.createStatement();
			//int success = stmt.executeUpdate(sql);//SQL 문 실행->성공하면 정수 1이 반환
			
			rs = stmt.executeQuery(sql);//select문 실행->executeQuery로 SQL문 실행
			//DB에서 보내주는 select문의 실행결과를 ResultSet 클래스로 만든 rs로 받음
			
			int count = 0;
			while(rs.next()) {				
				String uid = rs.getString("userid");
				String uemail = rs.getString("useremail");
				String signuptime = rs.getString("signuptime");
				
				out.println(uid + " / " + uemail + " / " + signuptime + "<br>");
				
				count++;
			}
			
			out.println("총 회원 수 : "+count+" 명");
			
			
		} catch(Exception e) {
			e.printStackTrace();//에러발생시 에러내용 출력
		} finally {
			try{
				if(rs != null) {
					rs.close();
				}				
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>	
	<br>
	<hr>
	<input type="button" value="◀ 회원탈퇴시키기" onclick="script:window.location.href='withdraw.jsp'">
	<input type="button" value="로그아웃 ▶" onclick="script:window.location.href='logout.jsp'">
</body>
</html>