<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
        <h1>Representative Selection</h1>
        <nav>
            <ul>
                <li><a href="rep_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
            </ul>
        </nav>
</header>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/auctionsys"
         user = "root"  password = "sasumithu"/>
	<h1>Auction details</h1>
	<c:choose>
        
    <c:when test="${param.button=='Add Auction'}">
    <div class="container">
	<div class="form-container">
		<form action="Add_Auction.jsp" method="post">
		<table>
		 <tr>
		  <td> Enter Name: </td>
		  <td><input type=text id="N" name="name" required></td>
		 </tr>
		 <tr>
		  <td> Start Time:  </td>
		  <td><input type="datetime-local" name="start_time" pattern="\d{4}-\d{2}-\d{2}T\d{2}:\d{2}" required></td>
		 </tr>
		 <tr>
		  <td> End Time: </td>
		  <td><input type="datetime-local" name="end_time" pattern="\d{4}-\d{2}-\d{2}T\d{2}:\d{2}" required></td>
		 </tr>
		 <tr>
		   <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		</form>
       </div>
     </div>  
        <br />
    </c:when>
    <c:when test="${param.button=='Remove Auction'}">
    <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from auctionlist ;
      </sql:query>
 
      <table>
         <tr>
            <th>Auc_id</th>
            <th>Name</th>
            <th>Start Time</th>
            <th>End Time</th>
            
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Auc_id}"/></td>
               <td><c:out value = "${row.name}"/></td>
                <td><c:out value = "${row.start_time}"/></td>
                <td><c:out value = "${row.end_time}"/></td>
            </tr>
         </c:forEach>
      </table>
    <div class="container">
	<div class="form-container">
		<form action="Remove_Auction.jsp" method="post">
		<table>
		 <tr>
		  <td> Enter Auction ID: </td>
		  <td><input type=text id="id" name=Auc_id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		</form>
      </div>
     </div>   
        <br />
    </c:when>
    
    <c:when test="${param.button=='Edit Auction Info'}">
    <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from AuctionList;
      </sql:query>
 
      <table>
         <tr>
            <th>Auc_id</th>
            <th>Name</th>
            <th>Start Time</th>
            <th>End Time</th>
            
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Auc_id}"/></td>
               <td><c:out value = "${row.name}"/></td>
                <td><c:out value = "${row.start_time}"/></td>
                <td><c:out value = "${row.end_time}"/></td>
            </tr>
         </c:forEach>
      </table>
    <div class="container">
	<div class="form-container">
		<form action="Make_Live.jsp" method="post">
		<table>
		 <tr>
		  <td> Enter Auction ID To Edit: </td>
		  <td><input type=text id="id" name=Auc_id required></td>
		 </tr> 
		 <tr>
		  <td> Enter New Auction Name </td>
		  <td><input type=text id="id" name=Auc_id required></td>
		 </tr> 
		 <tr> 
		 <tr>
		 <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		</form>
      </div>
     </div>   
        <br />
    </c:when>
    <c:when test="${param.button=='Edit User Info'}">
        <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from login where isadmin=false and isrep=false;
      </sql:query>
 
      <table>
         <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Username</th>
            
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.id}"/></td>
               <td><c:out value = "${row.name}"/></td>
                <td><c:out value = "${row.username}"/></td>
            </tr>
         </c:forEach>
      </table>
    <div class="container">
	<div class="form-container">
		<form action="select_update.jsp" method="post">
		<table>
		 <tr>
		  <td> Enter User ID To Edit: </td>
		  <td><input type=text id="id" name=id required></td>
		 </tr>
		 <tr>
		  <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		</form>
      </div>
     </div>   
        <br />
    </c:when>
    <c:when test="${param.button=='Remove Bid'}">
    <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from itemlist;
      </sql:query>
 
      <table>
         <tr>
            <th>Auc_id</th>
            <th>Name</th>
            <th>Start Time</th>
            <th>End Time</th>
            
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Auc_id}"/></td>
               <td><c:out value = "${row.name}"/></td>
                <td><c:out value = "${row.start_time}"/></td>
                <td><c:out value = "${row.end_time}"/></td>
            </tr>
         </c:forEach>
      </table>
    <div class="container">
	<div class="form-container">
		<form action="Bid_select.jsp" method="post">
		<table>
		 <tr>
		  <td> Enter Item ID: </td>
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
        <br />
    </c:when>
    <c:when test="${param.button=='Add Customer Representative'}">
		
		<div class="container">
	<div class="form-container">
	<form action="Add_rep.jsp" method="post">
		<table>
		 <tr>
		  <td> Enter User ID: </td>
		  <td><input type=text id="id" name=id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit value=Submit id="submit-button"></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		</form>
        </div>
     </div> 
        <br />
    </c:when>
</c:choose>
</body>
</html>