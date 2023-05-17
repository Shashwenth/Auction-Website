<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
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
        
        p {
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
        <h1>Query</h1>
        <nav>
            <ul>
                <li><a href="rep_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
            </ul>
        </nav>
</header>
<%
String id=request.getParameter("id");
String question=request.getParameter("question");
String qid=request.getParameter("qid");
%>
<div class="container">
	<div class="form-container">
		<form action="Add_answer.jsp" method=post >
		    <div class="button-container">
		    	<input type="hidden" id="qid" name="qid" value="<%=qid %>">	
		    	<input type="hidden" id="id" name="id" value="<%=id %>">	
  				<input type="hidden" id="ids" name="question" value="<%=question %>">	
				<p><%=question %></p>
		        <textarea id="P" name=answer maxlength="200" rows="5" cols="30"  required></textarea>
		        <input type="submit" name="button" value="Submit" id="submit-button">
		    </div>
		</form>
</div>
</div>
</body>
</html>