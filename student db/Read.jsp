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
<table  border="1">
<tr>
<th>RollNo</th>
<th>Name</th>
<th>Subject</th>
<th>Internal</th>
<th>External</th>
<th>Total</th>
</tr>
<%
try{
	connection=DriverManager.getConnection(ConnectionUrl+database,userid,password);
	statement=connection.createStatement();
	String sql="select*From studentml";
	resultset=statement.executeQuery(sql);
	while(resultset.next()){
		%>
<tr>
<td><%=resultset.getString("RollNo")%></td>
<td><%=resultset.getString("Name")%></td>
<td><%=resultset.getString("Subject")%></td>
<td><%=resultset.getString("Internal")%></td>
<td><%=resultset.getString("External")%></td>
<td><%=resultset.getString("Total")%></td>
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