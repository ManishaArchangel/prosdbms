<%@page import="java.sql.*" %>
    <%!String driverName="com.mysql.jdbc.Driver"; %>
    <%!String url="jdbc:mysql://localhost:3306/info"; %>
    <%!String user="root"; %>
    <%!String psw=""; %>
    <%
    String Sno=request.getParameter("Sno");
    String RollNo=request.getParameter("Rollnum");
     String Name=request.getParameter("name");
     String Subject=request.getParameter("subject");
     String Internal=request.getParameter("Internal");
     String External=request.getParameter("External");
     String Total=request.getParameter("Total");
     if(Sno!=null){
    	Connection con=null;
    	PreparedStatement ps=null;
    	System.out.println(Sno);
    	int personID=Integer.parseInt(Sno);
    	try
    	{
    		Class.forName(driverName);
    		con=DriverManager.getConnection(url,user,psw);
    		String sql="Update studentml set Sno=?, RollNo=?,Name=?,Subject=?,Internal=?,External=?,Total=? where Sno="+Sno;
    		ps=con.prepareStatement(sql);
    		ps.setString(1,Sno);
    		ps.setString(2,RollNo);
    		ps.setString(3,Name);
    		ps.setString(4,Subject);
    		ps.setString(5,Internal);
    		ps.setString(6,External);
    		ps.setString(7,Total);
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
    