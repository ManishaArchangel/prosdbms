<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet" %>
    <%@page import="java.sql.Statement" %>
    <%@page import="java.sql.Connection" %>
    <%
    String RollNo=request.getParameter("RollNo");
    String driver="com.mysql.jdbc.Driver";
    String ConnectionUrl="jdbc:mysql://localhost:3306/";
    String database="info";
    String userid="root";
    String password="";
    try{
    	Class.forName(driver);
    }catch(ClassNotFoundException e)
    {
    	e.printStackTrace();
    }
    Connection connection=null;
    Statement statement=null;
    ResultSet resultset=null;
    
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
<th>CodeNo</th>
<th>Name</th>
<th>Age</th>
<th>Department</th>
<th>DateOfJoining</th>
<th>Salary</th>
<th>Gender</th>
</tr>
<%
try{
	connection=DriverManager.getConnection(ConnectionUrl+database,userid,password);
	statement=connection.createStatement();
	String sql="select*From teacheril";
	resultset=statement.executeQuery(sql);
	while(resultset.next()){
		%>
<tr>
<td><%=resultset.getString("CodeNo")%></td>
<td><%=resultset.getString("Name")%></td>
<td><%=resultset.getString("Age")%></td>
<td><%=resultset.getString("Department")%></td>
<td><%=resultset.getString("DateOfJoining")%></td>
<td><%=resultset.getString("Salary")%></td>
<td><%=resultset.getString("Gender") %></td>
</tr>
<%
	}
	connection.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</body>
</html>