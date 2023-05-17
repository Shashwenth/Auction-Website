<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String cardno = request.getParameter("cardno");
	String name = request.getParameter("name");
	String cvv = request.getParameter("cvv");
	String email = request.getParameter("email");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	
  String billName = request.getParameter("bill-name");
  String billAddress = request.getParameter("bill-address");
  String billCity = request.getParameter("bill-city");
  String billState = request.getParameter("bill-state");
  String billZip = request.getParameter("bill-zip");

  String delName = request.getParameter("del-name");
  String delAddress = request.getParameter("del-address");
  String delCity = request.getParameter("del-city");
  String delState = request.getParameter("del-state");
  String delZip = request.getParameter("del-zip");
  String id="";

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement st=conn.createStatement();

//int i=st.executeUpdate("insert into users(fname,lname,email,userid,password)values('"+fname+"','"+lname+"','"+email+"','"+userid+"','"+password+"')");
PreparedStatement pstmt = conn.prepareStatement("SELECT max(id) as max_id FROM login");
ResultSet rs=pstmt.executeQuery();
while(rs.next()){
	id=rs.getString("max_id");
}

int i=st.executeUpdate("insert into cardDetails(id, cardno, name, cvv, exp_month, exp_year, email) values ('"+id+"','"+cardno+"','"+name+"','"+cvv+"','"+month+"','"+year+"','"+email+"');");
int ix=st.executeUpdate("insert into billing_address(id, name, street, city, state, zip) values ('"+id+"','"+billName+"','"+billAddress+"','"+billCity+"','"+billState+"','"+billZip+"');");
int ic=st.executeUpdate("insert into delivery_address(id, name, street, city, state, zip) values ('"+id+"','"+delName+"','"+delAddress+"','"+delCity+"','"+delState+"','"+delZip+"');");
response.sendRedirect("test.html");
}catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>