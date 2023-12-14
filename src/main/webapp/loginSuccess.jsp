<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
	<h2>관리자 로그인</h2>
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
		String adminID = request.getParameter("adminid");
		String adminPW = request.getParameter("adminpw");
	
		String sql="SELECT * FROM membertb WHERE userid='"+adminID+"' AND userpw='"+adminPW+"'";
		
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
			
			
			if(rs.next()) {//조건이 참->rs내에 레코드가 1개 들어있다는 것임->amdin 12345 정확하게 입력함->로그인 성공!				
				session.setAttribute("adminID", adminID);//세션에 로그인한 admin 아이디를 생성
				out.println("관리자 " +  adminID + "님 로그인하셨습니다.");
			} else {				
				response.sendRedirect("loginErr.jsp");
			}
			
			
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
	<table border="0">
		<tr>
			<td>
				<form action="memberList.jsp">
					<input type="submit" value="◀ 등록회원 관리하기">
				</form>
			</td>
			<td>
				<form action="logout.jsp">
					<input type="submit" value="로그 아웃하기 ▶">
				</form>
			</td>
		</tr>
	</table>
</body>
</body>
</html>