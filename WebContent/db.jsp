<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = 'java.sql.*' %>
<%@ page import = 'java.time.*' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
오늘 날짜 : <%= LocalDate.now() %><br/>
현재 시간 : <%= LocalTime.now() %><br/>
<table border="1">
	<tr>
		<th>col1</th>
		<th>col2</th>
	</tr>

<%
//1. JDBC Driver 로딩하기
Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://192.168.35.100:3306/jquery";
String sql = "select * from test";

try(
	//2.DB 서버 접속하기
	Connection conn = DriverManager.getConnection(url,"root","1234");
	// 쿼리 문장객체 준비
	Statement stmt = conn.createStatement();
	//4.SQL 실행
	ResultSet rs = stmt.executeQuery(sql);
	)
{		

	
	while(rs.next()) {
%>
	
		<tr>
			<td><%=rs.getString("col1") %></td>
			<td><%=rs.getString("col2") %></td>
		</tr>
	<%} %>
</table>

<%
//5.자원해제
stmt.close();
conn.close();
%>	


<%
} catch(Exception e) {
	e.printStackTrace();
}



%>
</body>
</html>