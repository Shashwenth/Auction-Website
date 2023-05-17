<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%
String type=request.getParameter("Type"); %>
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
<h1>Item List</h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
                <li><a href="notifications.jsp">Notifications</a></li>
            </ul>
        </nav>
</header>

<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>
		
		</tr>
		<tr bgcolor="#A52A2A">
		<td><b>item_id</b></td>
		<td><b>Auc_id</b></td>
		<td><b>Name</b></td>
		<td><b>Final High</b></td>
		</tr>
		<%
	try{ 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
		Statement statement=conn.createStatement();
		String sql ="select * from expitems where type='"+type+"'";

		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			String item_id= resultSet.getString("item_id");
		%>
		
		<tr>
		<td><%=item_id %></td>
		<td><%=resultSet.getString("Auc_id") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("high") %></td>
		</tr>
		<% 
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
%>
</body>
</html>
