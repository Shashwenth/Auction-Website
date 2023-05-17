<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controller.AuctionScheduler" %>
<%@page import="java.sql.*,java.util.*"%>

<%
    
   AuctionScheduler auctionScheduler = new AuctionScheduler();
    
   auctionScheduler.start();
%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/style.css"/> 
<head>

<style type="text/css"> 
		
		body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
        }
        
        .container {
		    display: flex;
		    justify-content: center;
		    min-height: 100vh;
		    background-color: #f8f8f8;
		}

		.form-container {
		    width: 400px;
		    padding: 20px;
		    background-color: #fff;
		    border-radius: 15px;
		    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		    position: absolute; /* this is needed */
		    margin: auto; /* this is needed */
		    margin-top: 10px;
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
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
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
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<header>
        <h1>Welcome To Our Auction Website</h1>
       
</header>
<canvas id="canvas"></canvas>
<div class="container">
	<div class="form-container">
		<h1> User Login</h1>
			 <form action=login method=post>
					 <table>
					 <tr>
					  <td> Enter UserName:     </td>
					  <td><input type=text name=txtName required></td>
					 </tr> 
					 
					 <tr>
					  <td> Enter Password: </td>
					  <td><input type=password name=txtPwd required></td>
					 </tr>
					 <tr> 
					 </tr>
					  <tr>
					  <td><input type=submit value=Login id="submit-button"> </td>
					  <td><input type=reset id="submit-button"></td>
					 </tr> 
					  </table>
					  <p>New user. <a href="register.html">Register Here</a>.
			</form>
		 </div> 
</div>
</body>
</html>