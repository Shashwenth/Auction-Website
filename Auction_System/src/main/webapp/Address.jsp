<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        h5 {
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
		    width: 600px;
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
fieldset {
    margin-bottom: 20px;
  }
  td {
    margin-bottom: 10px;
  }
 
    </style>
</head>
<body>
<header>
        <h1>Registration Successful</h1>
        
</header>
<h3> Enter Billing Address to Continue</h3>
<div class="container">
	<div class="form-container">
<form action="details.jsp" method="post">
<fieldset>
<legend>Card Details</legend>
<table>
<tr>
  <td> Enter Card Number: </td>
  <td><input type=text name=cardno required></td>
 </tr>
 <tr>
  <td> Enter Name on Card: </td>
  <td><input type=text name=name required></td>
 </tr> 
 <tr>
  <td> Enter CVV: </td>
  <td><input type=password name=cvv required></td>
 </tr>
 <tr>
 <tr>
  <td> Enter email: </td>
  <td><input type=text name=email required></td>
 </tr>
 </table>
 <label for="month">Expiration Month:</label>
  <select name="month" id="month">
    <option value="01">Jan</option>
    <option value="02">Feb</option>
    <option value="03">Mar</option>
    <option value="04">Apr</option>
    <option value="05">May</option>
    <option value="06">Jun</option>
    <option value="07">Jul</option>
    <option value="08">Aug</option>
    <option value="09">Sep</option>
    <option value="10">Oct</option>
    <option value="11">Nov</option>
    <option value="12">Dec</option>
  </select>
	<br>
  <label for="year">Expiration Year:</label>
  <select name="year" id="year">
    <option value="2023">2023</option>
    <option value="2024">2024</option>
    <option value="2025">2025</option>
    <option value="2026">2026</option>
    <option value="2027">2027</option>
    <option value="2028">2028</option>
    <option value="2029">2029</option>
    <option value="2030">2030</option>
  </select>
 </fieldset>
 <fieldset>
 <legend>Billing Address</legend>
 <table>
<tr>
  <td> Name: </td>
  <td><input type="text" name="bill-name" id="bill-name" required></td>
 </tr>
 <tr>
  <td> Street Address: </td>
  <td><input type="text" name="bill-address" id="bill-address" required></td>
 </tr> 
 <tr>
  <td> City: </td>
  <td><input type="text" name="bill-city" id="bill-city" required></td>
 </tr>
 <tr>
 <tr>
  <td> State: </td>
  <td><input type="text" name="bill-state" id="bill-state" required></td>
 </tr>
 <tr>
  <td> Zip: </td>
  <td><input type="text" name="bill-zip" id="bill-zip" required></td>
 </tr>
 </table>
</fieldset>
<fieldset>
 <legend>Delivery Address</legend>
 <table>
<tr>
  <td> Same As Billing Address: </td>
  <td><input type="checkbox" id="same-as-billing" name="same-as-billing" onchange="fillDeliveryAddress()"></td>
 </tr>
 <tr>
  <td> Name: </td>
  <td><input type="text" name="del-name" id="del-name" required></td>
 </tr> 
 <tr>
  <td> Street Address: </td>
  <td><input type="text" name="del-address" id="del-address" required></td>
 </tr>
 <tr>
 <tr>
  <td> City: </td>
  <td><input type="text" name="del-city" id="del-city" required></td>
 </tr>
 <tr>
  <td> State: </td>
  <td><input type="text" name="del-state" id="del-state" required></td>
 </tr>
 <tr>
  <td> Zip: </td>
  <td><input type="text" name="del-zip" id="del-zip" required></td>
 </tr>
 
 </table>
</fieldset>
 <table>
 <tr>
  <td><input type=submit value=Submit id="submit-button"></td>
  <td><input type=reset id="submit-button"></td>
 </tr> 
 </table>


</form>
</div>
</div>
<script>
  function fillDeliveryAddress() {
    if (document.getElementById('same-as-billing').checked) {
      document.getElementById('del-name').value = document.getElementById('bill-name').value;
      document.getElementById('del-address').value = document.getElementById('bill-address').value;
      document.getElementById('del-city').value = document.getElementById('bill-city').value;
      document.getElementById('del-state').value = document.getElementById('bill-state').value;
      document.getElementById('del-zip').value = document.getElementById('bill-zip').value;
    } else {
      document.getElementById('del-name').value = '';
      document.getElementById('del-address').value = '';
      document.getElementById('del-city').value = '';
      document.getElementById('del-state').value = '';
      document.getElementById('del-zip').value = '';
    }
  }
</script>
</body>
</html>