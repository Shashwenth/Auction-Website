<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <h1>Update User</h1>
        <nav>
            <ul>
                <li><a href="rep_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
            </ul>
        </nav>
</header>
<%String selectedButton = request.getParameter("selectedButton");
out.println(selectedButton);
String id = request.getParameter("id");
out.println(id);
if(selectedButton.equals("Update Name")){%>
	<div class="container">
		<div class="form-container">
<form action="change_val.jsp" method="post">
		<input type="hidden" name="id" value=<%=id %>>
		<input type="hidden" name="myParam" value="name">
		<table>
		 <tr>
		  <td> Enter New Name: </td>
		  <td><input type=text id="id" name=item_id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr>  
		 </table>
</form>
</div>
</div>
<%} %>
<%if(selectedButton.equals("Update ID")){%>
	<div class="container">
		<div class="form-container">
	<form action="change_val.jsp" method="post">
		<input type="hidden" name="id" value=<%=id %>>
		<input type="hidden" name="myParam" value="id">
		<table>
		 <tr>
		  <td> Enter User ID to Delete: </td>
		  <td><input type=text id="id" name=item_id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
</form>
</div>
</div>
<%} %>
<%if(selectedButton.equals("Update Email")){%>
	<div class="container">
		<div class="form-container">
		<form action="change_val.jsp" method="post">
		<input type="hidden" name="id" value=<%=id %>>
		<input type="hidden" name="myParam" value="email">
		<table>
		 <tr>
		  <td> Enter New Email: </td>
		  <td><input type=text id="id" name=item_id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
</form>
</div>
</div>
<%} %>
<%if(selectedButton.equals("Update UserName")){%>
	<div class="container">
		<div class="form-container">
		<form action="change_val.jsp" method="post">
		<input type="hidden" name="id" value=<%=id %>>
		<input type="hidden" name="myParam" value="username">
		<table>
		 <tr>
		  <td> Enter New Username </td>
		  <td><input type=text id="id" name=item_id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
</form>
</div>
</div>
<%} %>
</body>
</html>