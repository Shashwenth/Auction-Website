<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
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
<%
String b_id=request.getParameter("b_id");
String item_id=request.getParameter("item_id");
String id=request.getParameter("id");
out.println(b_id);
out.println(item_id);
out.println(id);
int hid=-1;
int tid=-1;
int ta=0;
try{ 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement statement=conn.createStatement();
String sql ="SELECT * FROM ItemList where" + " item_id="+Integer.valueOf(item_id)+";";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	hid= resultSet.getInt("hid");
	
	out.println(hid);
}

} catch (Exception e) {
e.printStackTrace();
}

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement st=conn.createStatement();
int i=st.executeUpdate("delete from bids where" + " b_id="+Integer.valueOf(b_id)+";");
out.println("<h2>Removed ! Go To <a href=Admin_welcome.jsp>Selection</a> to continue.</h2>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

if(hid==Integer.valueOf(id)){
	try{ 
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
		Statement statement=conn.createStatement();
		String sql ="select * from bids where item_id=" + Integer.valueOf(item_id) + " order by amount DESC Limit 1;";

		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			tid= resultSet.getInt("id");
			ta= resultSet.getInt("amount");
			out.println(tid);
			out.println(ta);
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
	try
	{
		out.println(tid);
		out.println(ta);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
	Statement st=conn.createStatement();
	int ix=st.executeUpdate("update ItemList set high =" + Integer.valueOf(ta) + " , hid =" + tid + " where item_id ='"+item_id+"';");
	
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
}

%>


