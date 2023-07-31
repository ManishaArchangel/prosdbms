<%@page import="java.sql.*" %>
    <%!String driverName="com.mysql.jdbc.Driver"; %>
    <%!String url="jdbc:mysql://localhost:3306/info"; %>
    <%!String user="root"; %>
    <%!String psw=""; %>
    <%
    String Sno=request.getParameter("Sno");
    String RollNo=request.getParameter("RollNo");
     String Name=request.getParameter("Name");
     String Age=request.getParameter("Age");
     String Department=request.getParameter("Department");
     String Gender=request.getParameter("Gender");
     String Year=request.getParameter("Year");
     if(Sno!=null){
    	Connection con=null;
    	PreparedStatement ps=null;
    	System.out.println(Sno);
    	int personID=Integer.parseInt(Sno);
    	try
    	{
    		Class.forName(driverName);
    		con=DriverManager.getConnection(url,user,psw);
    		String sql="Update studentil set Sno=?, RollNo=?,Name=?,Age=?,Department=?,Gender=?,Year=? where Sno="+Sno;
    		ps=con.prepareStatement(sql);
    		ps.setString(1,Sno);
    		ps.setString(2,RollNo);
    		ps.setString(3,Name);
    		ps.setString(4,Age);
    		ps.setString(5,Department);
    		ps.setString(6,Gender);
    		ps.setString(7,Year);
    		int i=ps.executeUpdate();
    		if(i>0)
    		{
    			out.print("Record Update successfully");
    		}
    		else
    		{
    			out.print("There is a problem in updating record");
    			
    		}} 
    		catch(SQLException sql)
    		{
    			request.setAttribute("error",sql);
    			out.println(sql);
    		}
    	
    	
     }
     %>
    