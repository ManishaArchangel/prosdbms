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

String CodeNo=request.getParameter("CodeNo");
String Name=request.getParameter("Name");
String Age=request.getParameter("Age");
String Department=request.getParameter("Department");
String DateOfJoining=request.getParameter("DateOfJoining");
String Gender=request.getParameter("Gender");
String Salary=request.getParameter("Salary");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/info","root","");
	Statement st=conn.createStatement();
	int i=st.executeUpdate("insert into teacheril(CodeNo,Name,Age,Department,DateOfJoining,Gender,Salary)values('"+CodeNo+"','"+Name+"','"+Age+"','"+Department+"','"+DateOfJoining+"','"+Gender+"','"+Salary+"')");
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