<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String rollno = request.getParameter("usr");
session.putValue("rollno", rollno);
String password = request.getParameter("password");
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/info", "root", "");
Statement st = con.createStatement();
String sql="select * from studentlog where rollno='"+ rollno +"' and password='" + password + "'";
//rs=statement.executeQuery(sql);
ResultSet rs = st.executeQuery(sql);
boolean i = rs.next();
System.out.println(i);
if(i)
{	out.println("Logged In ");
response.sendRedirect("studentportal.html");
}
else
	out.println("False");
%>