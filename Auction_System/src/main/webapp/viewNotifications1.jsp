<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String[] notifications = request.getParameterValues("notification[]");
  if (notifications != null) {
    for (String notification : notifications) {
      String[] parts = notification.split(":");
      String value = parts[0];
      String id = parts[1];
      %>
      <h2>Notification <%= value %> (ID <%= id %>)</h2><%
	try
		{
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
		String deleteQuery = "DELETE FROM Ialert WHERE t_id = ?";
		try (PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery)) {
		    deleteStatement.setInt(1, Integer.valueOf(id));
		    deleteStatement.executeUpdate();
		}
		
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
    }
  } else {
    %>
    <h2>No notifications selected</h2>
    <%
  }
  response.sendRedirect("notifications.jsp");
%>

</body>
</html>