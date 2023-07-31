<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String codeno = request.getParameter("usr");
session.putValue("codeno", codeno);
String password = request.getParameter("password");
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/info", "root", "");
Statement st = con.createStatement();
String sql="select * from teacherlog where codeno='"+ codeno +"' and password='" + password + "'";
//rs=statement.executeQuery(sql);
ResultSet rs = st.executeQuery(sql);
boolean i = rs.next();
System.out.println(i);
if(i)
	out.println("Logged In ");

else
{
	out.println("False");
	response.sendRedirect("teacherportal.html");
	}
%>