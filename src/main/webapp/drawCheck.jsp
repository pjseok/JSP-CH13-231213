<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 체크</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("userID"); //회원가입 시 입력한 아이디
		String upw = request.getParameter("userPW"); //회원가입 시 입력한 비밀번호
		String uemail = request.getParameter("userEMAIL"); // 회원가입 시 입력한 이메일
		
		String sql = "DELETE FROM membertb WHERE userid='"+uid+"'";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/memberdata";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		try{
			Class.forName(driverName); // 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);// DB 연동
			
			stmt = conn.createStatement();
			int success = stmt.executeUpdate(sql); // SQL문 실행 -> 성공하면 정수 1이 반환
			
			if(success ==1){// 조건이 참이면 sql문 성공적으로 실행
				//out.println("회원가입 성공");
				response.sendRedirect("drawSuccess.jsp");
			} else{
				//out.println("회원가입실패!!");
				response.sendRedirect("drawErr.jsp");
			}
			
			
		} catch(Exception e){
			e.printStackTrace(); // 에러발생시 에러내용 출력
		} finally {
			try{
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
</body>
</html>