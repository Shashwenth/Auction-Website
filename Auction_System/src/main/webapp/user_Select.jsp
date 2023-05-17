<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String id= session.getAttribute("name").toString(); 
out.println(id);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  <script>
    // Function to populate the second dropdown based on the selection of the first dropdown
    function populateSecondDropdown() {
      var firstDropdown = document.getElementById("firstDropdown");
      var secondDropdown = document.getElementById("secondDropdown");
      var selectedOption = firstDropdown.options[firstDropdown.selectedIndex].value;

      // Clear the options in the second dropdown
      secondDropdown.innerHTML = "";

      // Populate the options in the second dropdown based on the selection in the first dropdown
      if (selectedOption === "price") {
        var option1 = document.createElement("option");
        option1.text = "Low To High";
        secondDropdown.add(option1);
        var option2 = document.createElement("option");
        option2.text = "High to Low";
        secondDropdown.add(option2);
      } else if (selectedOption === "type") {
        var option3 = document.createElement("option");
        option3.text = "Furniture";
        secondDropdown.add(option3);
        var option4 = document.createElement("option");
        option4.text = "Auto";
        secondDropdown.add(option4);
        var option5 = document.createElement("option");
        option5.text = "Gardening";
        secondDropdown.add(option5);
        var option6 = document.createElement("option");
        option6.text = "Kitchen";
        secondDropdown.add(option6);
        var option7 = document.createElement("option");
        option7.text = "Fashion";
        secondDropdown.add(option7);
        var option8 = document.createElement("option");
        option8.text = "Electrical";
        secondDropdown.add(option8);
      }else if (selectedOption === "live") {
          var option9 = document.createElement("option");
          option9.text = "Live Auctions";
          secondDropdown.add(option9);
          var option10 = document.createElement("option");
          option10.text = "Upcoming Auction";
          secondDropdown.add(option10);
      }
    }
  </script>
</head>
<body>
<header>
<h1>Auction Website</h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
                <li><a href="notifications.jsp">Notifications</a></li>
            </ul>
        </nav>
</header>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/auctionsys"
         user = "root"  password = "sasumithu"/>
	<h1>Auction details</h1>
	<c:choose>
    <c:when test="${param.button=='Show Auction List'}">
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
        
       <br />
    </c:when>    
    <c:when test="${param.button=='Add Item'}">
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
		<form action="Add_Item.jsp" method="post">
		<table>
		 <tr>
		  <td> Enter Auction ID: </td>
		  <td><input type=text id="id" name=Auc_id required></td>
		 </tr> 
		 <tr>
		  <td> Enter Item Name: </td>
		  <td><input type=text id="N" name=No required></td>
		 </tr>
		 <tr>
		  <td> Enter Min Price </td>
		  <td><input type=text id="P" name=price required></td>
		 </tr> 
		 <tr>
		  <td> Enter Description </td>
		  <td><textarea id="P" name=descr maxlength="200" rows="5" cols="30"></textarea></td>
		 </tr> 
		 </table>		 
		 <select name="Type"> 
  			<option value="Furniture">Furniture</option> 
		    <option value="Auto">Auto</option> 
		    <option value="Gardening">Gardening</option> 
		    <option value="Kitchen">Kitchen</option> 
		    <option value="Electrical">Electrical</option> 
		    <option value="Kitchen">Kitchen</option> 
		    <option value="Fashion">Fashion</option> 
		  </select>
		  <table>
		  <tr>
		  <td><input type=submit id="submit-button" value=Submit></td>
		  <td><input type=reset id="submit-button"></td>
		  </tr> 
		  </table>
		</form>
    
		 </div> 
</div>
        <br />
    </c:when>
    <c:when test="${param.button=='Remove Item'}">
<sql:query dataSource="${snapshot}" var="result">
    SELECT * FROM itemlist WHERE id='${id}'
</sql:query>
 
      <table align="center" cellpadding="5" cellspacing="5" border="1">
         <tr>
            <th>Auc_id</th>
            <th>Name</th>
            <th>Item Id</th>
            
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Auc_id}"/></td>
               <td><c:out value = "${row.name}"/></td>
                <td><c:out value = "${row.item_id}"/></td>
            </tr>
         </c:forEach>
      </table>
<div class="container">
	<div class="form-container">
		<form action="Remove_Item.jsp" method="post">
		
		<table>
		 <tr>
		  <td> Enter Item ID: </td>
		  <td><input type=text id="id" name=Auc_id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit id="submit-button" value=Submit></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		</form>
        
		 </div> 
</div>
        <br />
    </c:when>
    <c:when test="${param.button=='Search Using Type'}">
    <div class="container1">
<div class="container">
	<div class="form-container">
		<form action="Filter_Type.jsp" method="post">
		<div class="dropdown-container">
		 <label for="firstDropdown">Select Option:</label>
		 <select id="firstDropdown" name="firstDropdown" onchange="populateSecondDropdown()">
		 <option value="">Select</option>
      	 <option value="price">Price</option>
         <option value="type">Type</option>
         <option value="live">Live Auctions</option>
    	</select>
    
	    <label for="secondDropdown">Dependent Option:</label>
	    <select id="secondDropdown" name="secondDropdown">
	      <option value="">Select</option>
	    </select>
	    </div>
	    <br>
	    <input type="submit" value="Submit" id="submit-button">
  </form>
  
		 </div> 
</div>    
    </div>  
        <br>
    </c:when>
    <c:when test="${param.button=='List your Bids'}">
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
		<form action="List_Bids.jsp" method="post">
		
		<table>
		 <tr>
		  <td> Enter Auction ID: </td>
		  <td><input type=text id="id" name=Auc_id required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit id="submit-button" value=Submit></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		 <h4> If you want to look at all your bids <a href="List_all.jsp">Click me!</a></h4>
		</form>
		
		 </div> 
</div>
        
        <br />
    </c:when>
    <c:when test="${param.button=='FAQs'}">
	<div class="container">
		<div class="form-container">
    	<form action="faq.jsp" method="post">
		
		<table>
		 <tr>
		  <td> Enter  Search Keyword: </td>
		  <td><input type=text id="id" name=word required></td>
		 </tr> 
		 <tr>
		  <td><input type=submit id="submit-button" value=Submit></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		 </form>
		 
		 </div> 
</div>
        
        <br />
    </c:when>
    <c:when test="${param.button=='HELP'}">
		<div class="container">
			<div class="form-container">
    	<form action="Cust_Question.jsp" method="post">
		
		<table>
		 <tr>
		  <td> Enter Your Query: </td>
		  <td><textarea id="P" name=question maxlength="200" rows="5" cols="30" required></textarea></td>
		 </tr> 
		 <tr>
		  <td><input type=submit id="submit-button" value=Submit></td>
		  <td><input type=reset id="submit-button"></td>
		 </tr> 
		 </table>
		 </form>
		 
		 </div> 
		</div>
        
        <br />
    </c:when>
    <c:when test="${param.button=='Expired Auctions'}">
		<div class="container">
			<div class="form-container">
    	<form action="show_exp.jsp" method="post">
		
		<table>
		 <tr>
		  <td> Select Type </td>
		 </tr>
		 </table> 
		 <select name="Type"> 
  			<option value="Furniture">Furniture</option> 
		    <option value="Auto">Auto</option> 
		    <option value="Gardening">Gardening</option> 
		    <option value="Kitchen">Kitchen</option> 
		    <option value="Electrical">Electrical</option> 
		    <option value="Kitchen">Kitchen</option> 
		    <option value="Fashion">Fashion</option> 
		  </select>
		 <table>
		 <tr>
		  <td><input type=submit id="submit-button" value=Submit></td>
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