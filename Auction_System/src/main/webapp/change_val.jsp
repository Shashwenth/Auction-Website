<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
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
        <h1>Edit Information</h1>
        <nav>
            <ul>
                <li><a href="rep_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
                <li><a href="notifications.jsp">Notifications</a></li>
            </ul>
        </nav>
</header>
<%
String s=request.getParameter("myParam");
//out.println(s);
String s1=request.getParameter("item_id");
//out.println(s1);
String id=request.getParameter("id");
//out.println(id);
if(s.equals("name")){
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
	Statement st=conn.createStatement();
	int i= st.executeUpdate("update login set name= '"+s1+"' where id= '"+id+"';");
}catch(Exception e){
System.out.println(e);
e.printStackTrace();
}
%><h2>Successfully Changed <%=s %> to <%=s1 %> <a href=rep_welcome.jsp> Click here</a> to Continue</h2><%
}
if(s.equals("email")){
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
	Statement st=conn.createStatement();
	int i= st.executeUpdate("update login set email= '"+s1+"' where id= '"+id+"';");
}catch(Exception e){
System.out.println(e);
e.printStackTrace();
}
%><h2>Successfully Changed <%=s %> to <%=s1 %> <a href=rep_welcome.jsp> Click here</a> to Continue</h2><%
}
if(s.equals("id")){
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
	Statement st=conn.createStatement();
	int i= st.executeUpdate("delete from login where id= '"+id+"';");
}catch(Exception e){
System.out.println(e);
e.printStackTrace();
}
%><h2>Successfully Deleted <%=s %> Number <%=s1 %> <a href=rep_welcome.jsp> Click here</a> to Continue</h2><%
}
if(s.equals("username")){
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
	Statement st=conn.createStatement();
	PreparedStatement pstmt = conn.prepareStatement("select * from login where username=?");
	pstmt.setString(1,s1);
	ResultSet rs=pstmt.executeQuery();
	if(rs.next()){
	%>
		<h3>Username Already taken <a href=rep_welcome.jsp> Try Again</a></h3>
	<%
	}
	else{
	int i= st.executeUpdate("update login set username= '"+s1+"' where id= '"+id+"';");
	%><h2>Successfully Changed <%=s %> to <%=s1 %> <a href=rep_welcome.jsp> Click here</a> to Continue</h2><%

	}
	}catch(Exception e){
System.out.println(e);
e.printStackTrace();
}
}

%>


</body>
</html>