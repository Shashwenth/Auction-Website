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
String name=session.getAttribute("name").toString();
String username=request.getParameter("Auc_id");
String password=request.getParameter("No");
String price=request.getParameter("price");
String descr=request.getParameter("descr");
String email=request.getParameter("Type");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
Statement st=conn.createStatement();

//int i=st.executeUpdate("insert into users(fname,lname,email,userid,password)values('"+fname+"','"+lname+"','"+email+"','"+userid+"','"+password+"')");
if(descr.length()>1){
int i=st.executeUpdate("insert into ItemList(id,Auc_id,name,Type,Min_price,description )values('"+name+"','"+username+"','"+password+"','"+email+"','"+price+"','"+descr+"');");
}
else{
	int i=st.executeUpdate("insert into ItemList(id,Auc_id,name,Type,Min_price)values('"+name+"','"+username+"','"+password+"','"+email+"','"+price+"');");
}
ResultSet rs2 = st.executeQuery("SELECT COUNT(*) AS num_items FROM ItemList WHERE auc_id ='" + username +"'");
rs2.next();
int num_items= rs2.getInt("num_items");

	PreparedStatement stmt = conn.prepareStatement("update AuctionList set No_Of_Items=? where auc_id=?");
	stmt.setInt(1,num_items);
	stmt.setString(2,username);
	stmt.executeUpdate();

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
response.sendRedirect("test_user.html");
%>


