<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<%String id=session.getAttribute("name").toString(); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* Add some space between the options */
       select {
      margin-bottom: 10px;
      border: 1px solid #000; /* Add border */
      background-color: #f5f5f5; /* Add background color */
      width: 200px; /* Set width */
      padding: 5px; /* Add padding */
    }

    /* Center align the form */
    .container1 {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    /* Add some margin between the dropdowns */
    select + select {
      margin-top: 10px;
    }

    /* Display dropdowns vertically */
    .dropdown-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      background-color: #d3d3d3; /* Add background color enclosing the options */
      padding: 10px; /* Add padding */
    }  header {
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
                h3 {
            text-align: center;
            color: #3498db;
        }
                h4 {
            text-align: center;
            color: #3498db;
        }
        .container {
		    display: flex;
		    justify-content: center;
		    min-height: 100vh;
		    background-color: #FBEAEB;
		    
		    margin-top:100px;
		}

		.form-container {
		    width: 400px;
		    padding: 20px;
		    background-color: #fff;
		    border-radius: 15px;
		    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		    position: absolute; /* this is needed */
		    margin: auto; /* this is needed */
		}
        
        form {
            text-align: center;
            margin-top: 30px;
        }
    
        #submit-button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            margin-top:5px;
        }
        input[type="text"],
		input[type="password"],
		select {
		    padding: 10px;
		    font-size: 18px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    margin-bottom: 10px; /* Add margin-bottom for gap between inputs */
		    background-color: #fff;
		    color: #333;
		}
 
    </style>
</head>
<body>
<header>
        <h1>Best Sellers</h1>
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
<td><b>id</b></td>
<td><b>Auc_id</b></td>
<td><b>Name</b></td>
<td><b>Type</b></td>
<td><b>Current High</b></td>
<td><b>Bid</b></td>
<td><b>Automate Bidding</b></td>
</tr>
<%
try{ 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
		Statement statement=conn.createStatement();
		String sql ="select * from itemlist where high <> 0 and id <> '"+id+"' order by high desc;";

		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			String item_id= resultSet.getString("item_id");
		%>

		<tr bgcolor="#DEB887">

		<td><%=item_id %></td>
		<td><%=resultSet.getString("id") %></td>
		<td><%=resultSet.getString("Auc_id") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("Type") %></td>
		<td><%=resultSet.getString("high") %></td>
		<td><a href="Bid.jsp?item_id=<%= resultSet.getString("item_id")%>">Bid</a></td>
		<td><a href="inp_auto.jsp?item_id=<%= resultSet.getString("item_id")%>">Click Me</a></td>
		</tr>
		<% 
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
%>
</table>
</body>
</html>