<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<%

String name=session.getAttribute("name").toString();
String item_id=request.getParameter("item_id");
String n="";
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement st=conn.createStatement();
String query = "SELECT name FROM login WHERE id= ?";
PreparedStatement statement = conn.prepareStatement(query);
statement.setInt(1,Integer.valueOf(name));
ResultSet resultSet = statement.executeQuery();

while(resultSet.next()){
	n= resultSet.getString("name");
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
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
		    margin-bottom: 4px;
		}
        
    
        h1 {
            text-align: center;
            color: #3498db;
        }
    
        form {
            text-align: center;
            margin-top: 30px;
        }
    
        #submit-button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: red;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            margin-bottom:10px
        }
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }
        .button-container input[type="submit"] {
            margin-bottom: 10px;
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
        <h1>Auto Increment</h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
                <li><a href="notifications.jsp">Notifications</a></li>
            </ul>
        </nav>
</header>
<div class="container">
	<div class="form-container">
<form action="autoinc.jsp" method=post >
	<div class="button-container">
	    <input type="hidden" id="item_id" name="item_id" value="<%=item_id %>">	
		<table>
		 <tr>
		  <td> Enter Increament Amount: </td>
		  <td><input type=text id="amount" name=amount required></td>
		 </tr> 
		 <tr>
		  <td> Enter Maximum Limit: </td>
		  <td><input type=text id="limit" name=limit required></td>
		 </tr>
		 </table>
		 <input type="submit" name="button" value="Submit" id="submit-button">
        <input type=reset id="submit-button">
        </div>
</form>
</div>
</div> 
</body>
</html>