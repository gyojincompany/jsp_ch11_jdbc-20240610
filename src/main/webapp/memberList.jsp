<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String sql = "SELECT * FROM student_tbl";//모든 회원의 목록을 가져오기
		
		String driverName = "com.mysql.jdbc.Driver";//my sql 드라이버 이름
		String url = "jdbc:mysql://localhost:3306/school_db";//DB가 설치된 주소
		String username = "root";//관리자 계정 이름
		String password = "12345";//관리자 계정 비밀번호
		
		Connection conn = null;//DB와의 연결 통로 확보
		Statement stmt = null;//sql문 실행
		ResultSet rs = null;//select 문 실행시 DB에서 반환해주는 결과 레코드를 받기 위한 자료타입을 준비
		
		try{
			Class.forName(driverName);//my sql 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB와의 커넥션 생성
			stmt = conn.createStatement();
			
		 	// int resultNum = stmt.executeUpdate(sql);//sql문을 DB에 실행!!
		 	// 반환되는 int 값이 1이면 sql문 실행 성공, 1이 아니면 실행 실패
		 	
		 	rs = stmt.executeQuery(sql);
		 	
		 	//ArrayList memberList = new ArrayList();
		 	//memberList = null;
		 	
		 	while(rs.next()) {
		 		int sno = rs.getInt("sno");
		 		String name = rs.getString("name");
		 		String dept = rs.getString("dept");
		 		
		 		out.println(sno + " / " + name + " / " + dept + "<br><br>");
		 		
		 	}
		 	
		 	
		} catch(Exception e) {
			out.println("DB연결실패! 회원목록불러오기 실패!");
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	%>
</body>
</html>