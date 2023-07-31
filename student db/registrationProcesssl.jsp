<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String rollno = request.getParameter("rollno");
String password = request.getParameter("password");
try {
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info", "root", "");
 Statement st = conn.createStatement();
 int i = st.executeUpdate("insert into studentlog(fname,lname,email,rollno,password)values('" + fname + "','" + lname
 + "','" + email + "','" + rollno + "','" + password + "')");
 out.println("Thank you for register ! Please <a href='studentdesign.html'>Login</a> to continue.");
} catch (Exception e) {
 System.out.print(e);
 e.printStackTrace();
}
%>