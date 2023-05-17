<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      /* CSS styles for the table */
      header {
            background-color: darkblue;
            color: white;
            padding: 10px;
            font-family: Arial, sans-serif;
        }
    /* CSS styles for the navigation bar */
        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav li {
            display: inline;
            margin-right: 10px;
        }

        nav li a {
            color: white;
            text-decoration: none;
        }

        nav li a:hover {
            text-decoration: underline;
        }
		body {
            font-family: Arial, sans-serif;
            background-color: #FBEAEB;
        }
        h1 {
            text-align: center;
            color: #3498db;
        }
        h2 {
            text-align: center;
            color: #3498db;
        }
      
      table {
        border-collapse: collapse;
        width: 100%;
      }

      th, td {
        text-align: center;
        padding: 8px;
      }

      tr:nth-child(even){background-color: #f2f2f2}

      th {
        background-color: #4CAF50;
        color: white;
      }
</style>

</head>
<body>
<header>
<h1> Bid</h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
                <li><a href="notifications.jsp">Notifications</a></li>
            </ul>
        </nav>
</header>
<div align=center>
<%
	int item_id=Integer.valueOf(request.getParameter("item_id"));
int Auc_id=-1;
%>
<h1> Welcome to Bid Page.</h1>
<p>Row ID: <%= item_id %></p>
<% 
try
{
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
String sql= "select * from ItemList where item_id=?";
pstmt = conn.prepareStatement(sql);
ResultSet rs = null;
pstmt.setInt(1, item_id);
rs = pstmt.executeQuery();
out.println("<h1>Users with age greater than " + item_id + ":</h1>");
out.println("<table border='1'>");
out.println("<tr><th>ID</th><th>Name</th><th>Age</th><th>Min Price</th></tr>");
while (rs.next()) {
	Auc_id = rs.getInt("Auc_id");
    int id = rs.getInt("item_id");
    String name = rs.getString("name");
    String age = rs.getString("Type");
    int price = rs.getInt("Min_price");
    out.println("<tr><td>" + id + "</td><td>" + name + "</td><td>" + age + "</td><td>" + price + "</td></tr>");
}
out.println("</table>");

} catch (ClassNotFoundException | SQLException e) {
e.printStackTrace();
} 
%>
<h2> If you like to enter the bid enter the amount.</h2>
<div class="container">
	<div class="form-container">
<form action="Reg_Bid.jsp" method=post >
  <input type="hidden" id="id" name="item_id" value="<%=item_id %>">	
  <input type="hidden" id="ids" name="Auc_id" value="<%=Auc_id %>">	
  <table>
 <tr>
  <td> Enter Bid Amount: </td>
  <td><input type=text name=amount  required></td>
 </tr> 
  <tr>
  <td><input type=submit value=Submit></td>
  <td><input type=reset></td>
 </tr> 
  </table>
</form>
</div>
</div>


</div>

</body>
</html>