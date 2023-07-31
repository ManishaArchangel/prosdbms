<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String RollNo=request.getParameter("RollNo");
String Name=request.getParameter("Name");
String Age=request.getParameter("Age");
String Department=request.getParameter("Department");
String Gender=request.getParameter("Gender");
String Year=request.getParameter("Year");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/info","root","");
	Statement st=conn.createStatement();
	int i=st.executeUpdate("insert into studentil(RollNo,Name,Age,Department,Gender,Year)values('"+RollNo+"','"+Name+"','"+Age+"','"+Department+"','"+Gender+"','"+Year+"')");
	out.println("data is successfully inserted !");
}
catch(Exception e)
{
	out.println(e);
	e.printStackTrace();
}
%>
</body>
</html>