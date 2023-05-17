<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
</head>
<body>
<header>
        <h1>Place Bid</h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
                <li><a href="notifications.jsp">Notifications</a></li>
            </ul>
        </nav>
</header>
<p>Show: <%= session.getAttribute("name") %></p>
<% String item_id=request.getParameter("item_id");
String Auc_id=request.getParameter("Auc_id");
String id=session.getAttribute("name").toString();
String amount=request.getParameter("amount");
int high=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement st=conn.createStatement();

//int i=st.executeUpdate("insert into users(fname,lname,email,userid,password)values('"+fname+"','"+lname+"','"+email+"','"+userid+"','"+password+"')");
PreparedStatement pstmt = conn.prepareStatement("SELECT hid, high AS max_price FROM ItemList WHERE item_id = ?");
pstmt.setInt(1, Integer.valueOf(item_id));
ResultSet rs=pstmt.executeQuery();
PreparedStatement pstmt1 = conn.prepareStatement("SELECT name As name FROM ItemList WHERE item_id = ?");
pstmt1.setInt(1, Integer.valueOf(item_id));
ResultSet rs1=pstmt1.executeQuery();
String callme="";
if(rs1.next()){
	callme=rs1.getString(1);
}
int i=st.executeUpdate("insert into bids(item_id,id,amount,Auc_id )values('"+item_id+"','"+id+"','"+amount+"','"+Auc_id+"');");


if(rs.next()){
	int hid= rs.getInt("hid");
	high=rs.getInt("max_price");
	if(Integer.valueOf(amount)>high){
		int ix=st.executeUpdate("update ItemList set high =" + Integer.valueOf(amount) + " , hid =" + id + " where item_id ='"+item_id+"';");
		if(hid!=-1){
		int is=st.executeUpdate("insert into alert(id,item_id,name )values('"+hid+"','"+item_id+"','"+callme+"');");
	}
	}
}
%>
<h1> <%= amount %></h1>
<h1> <%= high %></h1>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<h3>Bid Successfully Placed. Please wait for Results</h3>
<div class="container">
	<div class="form-container">
<form action="user_welcome.jsp" method="post">
	<input type="submit" value="Go to Selection">
</form>
</div>
</div>


<h1> <%=item_id %></h1>
</body>
</html>