<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid = request.getParameter("usr");
session.putValue("userid", userid);
String password = request.getParameter("password");
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/info", "root", "");
Statement st = con.createStatement();
String sql="select * from users where userid='"+ userid +"' and password='" + password + "'";
//rs=statement.executeQuery(sql);
ResultSet rs = st.executeQuery(sql);
boolean i = rs.next();
System.out.println(i);
if(i)
{	out.println("Logged In ");
response.sendRedirect("adminportal.html");
}
else
	out.println("False");
%>