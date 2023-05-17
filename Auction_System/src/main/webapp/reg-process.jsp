<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("name");
String username=request.getParameter("username");
String password=request.getParameter("password");
String email=request.getParameter("email");
System.out.println(email);

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement st=conn.createStatement();
String sql="select* from login where username='"+username+"';";
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
	response.sendRedirect("wrong_username.jsp");
}
else{
	int i=st.executeUpdate("insert into login(name,username,password,email)values('"+name+"','"+username+"','"+password+"','"+email+"')");
	response.sendRedirect("Address.jsp");
	}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>


