<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.ResultSet" %>
    <%@page import="java.sql.Statement" %>
    <%@page import="java.sql.Connection" %>
    <%
    String Sno=request.getParameter("Sno");
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
    <%
    try{
    connection=DriverManager.getConnection(connectionUrl+database,userid,password);
    statement=connection.createStatement();
    String sql="select * From studentml where Sno="+Sno;
    resultSet=statement.executeQuery(sql);
    while(resultSet.next()){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>
update data from database in JSP</h1>
<form method="post"action="update.process.jsp">

<input type="hidden"name="Sno"value = <%=resultSet.getString("Sno") %>>
<input type="text"name="Sno"value= <%=resultSet.getString("Sno")%>>
<br>
RollNo:
<input type="number" name="Rollnum"value=<%=resultSet.getString("RollNo") %>><br>
Name:
<input type="text" name="name"value=<%=resultSet.getString("Name") %>><br>
Subject:
<input type="text" name="subject"value=<%=resultSet.getString("Subject") %>><br>
Internal
<input type="number" name="Internal"value=<%=resultSet.getString("Internal") %>>:<br>
External:
<input type="number" name="External"value=<%=resultSet.getString("External") %>><br>
Total:
<input type="number" name="Total"value=<%=resultSet.getString("Total") %>><br>

<br><br>
<input type="submit"value="submit">
</form>
<%
}
    connection.close();
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>
</body>
</html>


