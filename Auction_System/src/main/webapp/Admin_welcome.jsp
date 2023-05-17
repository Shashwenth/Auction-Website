<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<% 
String name=session.getAttribute("name").toString();
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
<html>
<head>
<meta charset="UTF-8">
<title>Admin Welcome Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/> 
<head>
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
        
</style>

</head>
<body>
<header>
        <h1>Welcome <%=n %></h1>
        <nav>
            <ul>
                <li><a href="Admin_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
            </ul>
        </nav>
</header>
    <main>
<div align=center>
<h1> Hi <%=n %>. What would you like to do today</h1>
</div>
<div class="container">
	<div class="form-container">
		<form action="Admin_Select.jsp" method=post >
		    <div class="button-container">
				
		        <input type="submit" name="button" value="Show Auction List" id="submit-button">
		        <input type="submit" name="button" value="Add Customer Representative" id="submit-button">
		        <input type="submit" name="button" value="Report" formaction="generatePDF.jsp" id="submit-button">
		    </div>
		</form>
</div>
</div>
</main>
</body>
</html>