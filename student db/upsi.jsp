<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.ResultSet" %>
    <%@page import="java.sql.Statement" %>
    <%@page import="java.sql.Connection" %>
    <%
    String driver="com.mysql.jdbc.Driver";
    String connectionUrl="jdbc:mysql://localhost:3306/";
    String database="info";
    String userid="root";
    String password="";
    try{
    Class.forName(driver);
    }catch(ClassNotFoundException e){
     e.printStackTrace();
    }
    Connection connection=null;
    Statement statement=null;
    ResultSet resultSet=null;
   
    %>
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Retrieve data from database in JSP</h1>
<table border="1">
<tr>
<th>Sno</th>
<th>RollNo</th>
<th>Name</th>
<th>Age</th>
<th>Department</th>
<th>Gender</th>
<th>Year</th>
<th>update</th>
<th>delete</th>
</tr>
<% 
try
{
connection=DriverManager.getConnection(connectionUrl+database,userid,password);
statement=connection.createStatement();
String sql="Select*from studentil";
resultSet=statement.executeQuery(sql);
while(resultSet.next()){
	%>
<tr>
<td><%=	resultSet.getString("Sno")%></td>
<td><%=	resultSet.getString("RollNo")%></td>
<td><%=resultSet.getString("Name")%></td>
<td><%=resultSet.getString("Age")%></td>
<td><%=resultSet.getString("Department")%></td>
<td><%=	resultSet.getString("Gender")%></td>
<td><%=	resultSet.getString("Year")%></td>
<td><a href="updatesi.jsp?Sno=<%=resultSet.getString("Sno") %>">update</a></td>
<td><a href="deletesi.jsp?Sno=<%=resultSet.getString("Sno") %>">delete</a></td>
</tr>
<%
}
connection.close();
}
catch(Exception e){
e.printStackTrace();
}
%></table>
</body>
</html>
