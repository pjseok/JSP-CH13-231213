<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		String userID = request.getParameter("userID");
	
	
		String sql = "SELECT * FROM membertb WHERE userid='"+userID+"'";
		
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/memberdata";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		ResultSet rs = null; //select문 실행시 DB에서 반환해주는 데이터를 받기 위한 객체 준비
		
		String db_userid = "";
		String db_userpw = "";
		String db_useremail = "";
		String db_signuptime = "";
		
		try{
			Class.forName(driverName); // 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);// DB 연동
			
			stmt = conn.createStatement();
			//int success = stmt.executeUpdate(sql); // SQL문 실행 -> 성공하면 정수 1이 반환
			
			rs = stmt.executeQuery(sql); //select문 실행-> executQuery로 SQL문 실행
			// DB에서 보내주는 select문의 실행결과를 ResultSet 클래스로 만든 rs로 받음
			
			
			
			if(rs == null){
				response.sendRedirect("modify.jsp");
			} else{
				while(rs.next()){
					db_userid = rs.getString("userid");
					db_userpw = rs.getString("userpw");
					db_useremail = rs.getString("useremail");
					db_signuptime = rs.getString("signuptime");
				}	
		}
			
			
			
		} catch(Exception e){
			e.printStackTrace(); // 에러발생시 에러내용 출력
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
	
	<h3>수정할 회원 정보</h3>
	<hr>
	아이디 : <%= db_userid  %><br><br>
	비밀번호 : <%= db_userpw  %><br><br>
	이메일 : <%= db_useremail  %><br><br>
	가입일 : <%= db_signuptime  %><br><br>
</body>
</html>