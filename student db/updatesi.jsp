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
    String sql="select * From studentil where Sno="+Sno;
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
<form method="post"action="update.process.si.jsp">

<input type="hidden"name="Sno"value = <%=resultSet.getString("Sno") %>>
<input type="text"name="Sno"value= <%=resultSet.getString("Sno")%>>
<br>
RollNo:
<input type="number" name="Rollnum"value=<%=resultSet.getString("RollNo") %>><br>
Name:
<input type="text" name="Name"value=<%=resultSet.getString("Name") %>><br>
Age:
<input type="number" name="Age"value=<%=resultSet.getString("Age") %>><br>
Department:
<input type="text" name="Department"value=<%=resultSet.getString("Department") %>>:<br>
Gender:
<input type="text" name="Gender"value=<%=resultSet.getString("Gender") %>><br>
Year:
<input type="number" name="Year"value=<%=resultSet.getString("Year") %>><br>

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


