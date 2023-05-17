<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% String name=session.getAttribute("name").toString(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mark as Read and Delete Messages</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function markAsReadAndDelete() {
        var ids = [];
        $("input:checkbox[name=messageIds]:checked").each(function(){
            ids.push($(this).val());
      
        });
        session.setAttributes("ids",ids);
        $.ajax({
            type: "POST",
            url: "mark-as-read-and-delete.jsp",
            data: {ids: [ids]},
            success: function(response) {
                alert("Messages marked as read and deleted successfully.");
                location.reload();
            },
            error: function(xhr, status, error) {
                alert("Error occurred while marking messages as read and deleting them.");
            }
        });
    }
</script>
</head>
<body>
<header>
        <h1> Notifications </h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
            </ul>
        </nav>
</header>
<%
int x=0;
try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement statement1=conn.createStatement();
String sql1 ="SELECT * FROM alert where" + " id="+Integer.valueOf(name)+";";
ResultSet resultSet1 = statement1.executeQuery(sql1);
int j=0;
%>
    <form>
        <%-- display the list of messages with checkboxes --%>
        <table>
            <thead>
                <tr>
                    <th>Message</th>
                    <th>Mark as Read</th>
                </tr>
            </thead>
            <tbody>
                <%-- iterate through the list of messages and display them --%>
                <%while(resultSet1.next()){
					String s= resultSet1.getString("name");
					j+=1;
					x=1;
				%>
                <tr>
                    <td>OHH!! The item <%=s%> is over bid <%=resultSet1.getString("a_id")%></td>
                    <td><input type="checkbox" name="messageIds" value="<%=resultSet1.getString("a_id")%>"></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%-- add a button to mark selected messages as read and delete them --%>
        <button type="button" onclick="markAsReadAndDelete()">Mark as Read and Delete</button>
    </form>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}%>
</body>
</html>
