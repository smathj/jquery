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

<%
//1. JDBC Driver 로딩하기
Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://192.168.35.100:3306/jquery";
String sql = "insert into test (col1,col2) value (?,?)";

String col1 = request.getParameter("col1");
String col2 = request.getParameter("col2");

System.out.println(col1);
System.out.println(col2);

Connection conn 		= null;
PreparedStatement stmt  = null;
ResultSet rs 			= null;

try {
	conn = DriverManager.getConnection(url,"root","1234");
	stmt = conn.prepareStatement(sql);
	stmt.setString(1,col1);
	stmt.setString(2,col2);
	stmt.executeUpdate();
} catch (Exception e) {
	System.out.println(e);
} finally {
	stmt.close();
	conn.close();
}


%>
</body>
</html>