<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*"%>
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
String Subject=request.getParameter("Subject");
String Internal=request.getParameter("Internal");
String External=request.getParameter("External");
String Total=request.getParameter("Total");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/info","root","");
	Statement st=conn.createStatement();
	int i=st.executeUpdate("insert into studentml(RollNo,Name,Subject,Internal,External,Total)values('"+RollNo+"','"+Name+"','"+Subject+"','"+Internal+"','"+External+"','"+Total+"')");
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