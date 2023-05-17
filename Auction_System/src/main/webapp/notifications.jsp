<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
        h5 {
            text-align: center;
            color: #3498db;
        }
        
        
       .container {
    display: flex;
    justify-content: center;
    min-height: 100vh;
    background-color: #FBEAEB;
    margin-top: 10px;
  }

  .form-container {
    width: 400px;
    padding: 20px;
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin: auto;
    margin-top:30px;
  }

  form {
    text-align: center;
    margin-top: 30px;
  }

  .container {
    display: flex;
    flex-direction: column; /* stack the forms vertically */
    align-items: center; /* center the forms horizontally */
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
fieldset {
    margin-bottom: 20px;
  }
  td {
    margin-bottom: 10px;
  }
 
    </style>
<body>
<header>
        <h1>Notifications</h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
            </ul>
        </nav>
</header>
<div class="container">
	<div class="form-container">
<form action="checkout.jsp" method="post">
<fieldset>
<legend>Wins</legend>
<table>
<thead>
<tr>
<th>Messages</th>
</tr>
</thead>
<%

String name=session.getAttribute("name").toString();
String n="";
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement st=conn.createStatement();
String query = "SELECT username FROM login WHERE id= ?";
PreparedStatement statement = conn.prepareStatement(query);
statement.setInt(1,Integer.valueOf(name));
ResultSet resultSet = statement.executeQuery();

while(resultSet.next()){
	n= resultSet.getString("username");
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}%>
<%
try
{
	int i=0;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement statement1=conn.createStatement();
String sql1 ="SELECT * FROM winner where" + " id="+Integer.valueOf(name)+";";
ResultSet resultSet1 = statement1.executeQuery(sql1);
int j=0;
while(resultSet1.next()){
	String s= resultSet1.getString("name");
	i=1;
	j+=1;
%>
	<tr>
       <td>Congratulations !!! You have won the bid for <%=s %></td>
    </tr>
<%
	}

if(i==0){%>
<tr>
       <td>No Wins Right Now</td>
</tr>
<%} 

}catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<tr>
  <td><input type=submit value="Check Out" id="submit-button"></td>
</tr>
</table>
</fieldset>
</form>
</div>


<%
/*
try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
String deleteQuery = "DELETE FROM winner WHERE id = ?";
try (PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery)) {
    deleteStatement.setInt(1, Integer.valueOf(name));
    deleteStatement.executeUpdate();
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
*/
%>
<div class="form-container">
<form action="viewNotifications.jsp" method="post">
<fieldset>
<legend>Bid Alerts</legend>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<thead>
          <tr>
            <th>Message</th>
            <th>Select</th>
          </tr>
</thead>
<tbody>
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
while(resultSet1.next()){
	String s= resultSet1.getString("name");
	j+=1;
	x=1;
%>
	<tr>
       <td>Ohh!! The item  <%=s %> is over Bid</td>
       <td><input type="checkbox" name="notification[]" value="<%=j %>:<%=resultSet1.getString("a_id") %>"></td>
    </tr>
<%
}
if(j==0){%>
	<tr>
    <td>No Notifications</td>
     </tr>
<%
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</tbody>
</table>
<br>
      <input type="submit" value="Mark As Read" id="submit-button">
</fieldset>
</form>
</div>
<div class="form-container">
<form action="viewNotifications1.jsp" method="post">
<fieldset>
<legend>Item Alerts</legend>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<thead>
          <tr>
            <th>Message</th>
            <th>Select</th>
          </tr>
</thead>
<tbody>
<%
/*
try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
String deleteQuery = "DELETE FROM alert WHERE id = ?";
try (PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery)) {
    deleteStatement.setInt(1, Integer.valueOf(name));
    deleteStatement.executeUpdate();
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
*/
int aflag=0;
try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement statement1=conn.createStatement();
String sql1 ="select Ialert.* from Ialert join AuctionList on Ialert.Auc_id=AuctionList.Auc_id where AuctionList.isLive=true and" + " id="+Integer.valueOf(name)+";";
ResultSet resultSet1 = statement1.executeQuery(sql1);
int j=0;
while(resultSet1.next()){
	String s= resultSet1.getString("name");
	aflag=1;
	j+=1;
	x=1;
	
%>
	<tr>
       <td>The item  <%=s %> is available for Bid now</td>
       <td><input type="checkbox" name="notification[]" value="<%=j %>:<%=resultSet1.getString("t_id") %>"></td>
    </tr>
<%
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
/*
try
{
if(aflag==1){	
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
String deleteQuery = "DELETE FROM Ialert WHERE id = ?";
try (PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery)) {
    deleteStatement.setInt(1, Integer.valueOf(name));
    deleteStatement.executeUpdate();
}

}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}*/
%>
<%if(x==0){%>
	<tr>
    <td>No Notifications</td>
    </tr>
<%} %>
</tbody>
</table>
<br>
      <input type="submit" value="Mark As Read" id="submit-button">
</fieldset>
</form>
</div>
</div>
<%
try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement statement1=conn.createStatement();
String sql1 ="SELECT * FROM qalert where" + " id="+Integer.valueOf(name)+";";
ResultSet resultSet1 = statement1.executeQuery(sql1);
while(resultSet1.next()){
%>
	<h4> Your query is resolved.</h4>
	<h4> Query: <%=resultSet1.getString("question")%></h4>
	<h4> Answer: <%=resultSet1.getString("answer")%></h4>
<%
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

try
{
	
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
String deleteQuery = "DELETE FROM qalert WHERE id = ?";
try (PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery)) {
    deleteStatement.setInt(1, Integer.valueOf(name));
    deleteStatement.executeUpdate();
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



</body>
</html>