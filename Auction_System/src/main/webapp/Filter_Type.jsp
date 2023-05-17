<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String f = request.getParameter("firstDropdown");
String type = request.getParameter("secondDropdown");
String namexx=session.getAttribute("name").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      /* CSS styles for the table */
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
        h1 {
            text-align: center;
            color: #3498db;
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
</head>
<body>
<header>
<h1> Filter</h1>
        <nav>
            <ul>
                <li><a href="user_welcome.jsp">Home</a></li>
                <li><a href="StartPage.jsp">Logout</a></li>
                <li><a href="notifications.jsp">Notifications</a></li>
            </ul>
        </nav>
</header>

<%
if(f.equals("price")){
	if(type.equals("Low To High")){
	%><table align="center" cellpadding="5" cellspacing="5" border="1">
				
			<tr>
			<th><b>item_id</b></th>
			<th><b>id</b></th>
			<th><b>Auc_id</b></th>
			<th><b>Name</b></th>
			<th><b>Type</b></th>
			<th><b>Current High</b></th>
			<th><b>Bid</b></th>
			<th><b>Automate Bidding</b></th>
			</tr>
		<%
	try{ 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
		Statement statement=conn.createStatement();
		String sql ="select * from itemlist join auctionlist on auctionlist.auc_id= itemlist.auc_id where auctionlist.islive=true and id <> '"+namexx+"' order by itemlist.high asc;";

		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			String item_id= resultSet.getString("item_id");
		%>
		
		<tr>
		<td><%=item_id %></td>
		<td><%=resultSet.getString("id") %></td>
		<td><%=resultSet.getString("Auc_id") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("Type") %></td>
		<td><%=resultSet.getString("high") %></td>
		<td><a href="Bid.jsp?item_id=<%= resultSet.getString("item_id")%>">Bid</a></td>
		<td><a href="inp_auto.jsp?item_id=<%= resultSet.getString("item_id")%>">Click Me</a></td>
		</tr>
		<% 
		}
		%></table><%
		} catch (Exception e) {
		e.printStackTrace();
		}
	}else{
		%>
		<table align="center" cellpadding="5" cellspacing="5" border="1">
			
			<tr>
			<th><b>item_id</b></th>
			<th><b>id</b></th>
			<th><b>Auc_id</b></th>
			<th><b>Name</b></th>
			<th><b>Type</b></th>
			<th><b>Current High</b></th>
			<th><b>Bid</b></th>
			<th><b>Automate Bidding</b></th>
			</tr>
			<%
		try{ 
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
			Statement statement=conn.createStatement();
			String sql ="select * from itemlist join auctionlist on auctionlist.auc_id= itemlist.auc_id where auctionlist.islive=true and id <> '"+namexx+"' order by itemlist.high desc;";

			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				String item_id= resultSet.getString("item_id");
			%>
			

			<tr>

			<td><%=item_id %></td>
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("Auc_id") %></td>
			<td><%=resultSet.getString("name") %></td>
			<td><%=resultSet.getString("Type") %></td>
			<td><%=resultSet.getString("high") %></td>
			<td><a href="Bid.jsp?item_id=<%= resultSet.getString("item_id")%>">Bid</a></td>
			<td><a href="inp_auto.jsp?item_id=<%= resultSet.getString("item_id")%>">Click Me</a></td>
			</tr>
			<% 
			}
			%></table><%
			} catch (Exception e) {
			e.printStackTrace();
			}
		}
	}

else if(f.equals("type")){
	try{ 
		%>
		<table align="center" cellpadding="5" cellspacing="5" border="1">
			
			<tr>
			<th><b>item_id</b></th>
			<th><b>id</b></th>
			<th><b>Auc_id</b></th>
			<th><b>Name</b></th>
			<th><b>Type</b></th>
			<th><b>Current High</b></th>
			<th><b>Bid</b></th>
			<th><b>Automate Bidding</b></th>
			</tr>
			<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
		Statement statement=conn.createStatement();
		String sql ="select * from itemlist join auctionlist on auctionlist.auc_id= itemlist.auc_id where auctionlist.islive=true and itemlist.type='"+type+"' and id <> '"+namexx+"';";

		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			String item_id= resultSet.getString("item_id");
		%>
		
		
		<tr>
		<td><%=item_id %></td>
		<td><%=resultSet.getString("id") %></td>
		<td><%=resultSet.getString("Auc_id") %></td>
		<td><%=resultSet.getString("name") %></td>
		<td><%=resultSet.getString("Type") %></td>
		<td><%=resultSet.getString("high") %></td>
		<td><a href="Bid.jsp?item_id=<%= resultSet.getString("item_id")%>">Bid</a></td>
		<td><a href="inp_auto.jsp?item_id=<%= resultSet.getString("item_id")%>">Click Me</a></td>
			
		</tr>
		<% 
		}
		%></table><%
		} catch (Exception e) {
		e.printStackTrace();
		}
		
}else if(f.equals("live")){
	if(type.equals("Live Auctions")){
		%>
		<table align="center" cellpadding="5" cellspacing="5" border="1">
			<tr>
			
			</tr>
			<tr>
			<th><b>item_id</b></th>
			<th><b>id</b></th>
			<th><b>Auc_id</b></th>
			<th><b>Name</b></th>
			<th><b>Type</b></th>
			<th><b>Current High</b></th>
			<th><b>Bid</b></th>
			<th><b>Automate Bidding</b></th>
			</tr>
			<%
		try{ 
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
			Statement statement=conn.createStatement();
			String sql ="SELECT ItemList.* FROM ItemList Join AuctionList on ItemList.Auc_id=AuctionList.Auc_id where AuctionList.IsLive=true and id <> '"+namexx+"';";
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				String item_id= resultSet.getString("item_id");
			%>
			
			<tr>

			<td><%=item_id %></td>
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("Auc_id") %></td>
			<td><%=resultSet.getString("name") %></td>
			<td><%=resultSet.getString("Type") %></td>
			<td><%=resultSet.getString("high") %></td>
			<td><a href="Bid.jsp?item_id=<%= resultSet.getString("item_id")%>">Bid</a></td>
			<td><a href="inp_auto.jsp?item_id=<%= resultSet.getString("item_id")%>">Click Me</a></td>
			
			</tr>
			<% 
			}
			%></table><%
			} catch (Exception e) {
			e.printStackTrace();
			}
		}else{
			try{ 
				%>
				<table align="center" cellpadding="5" cellspacing="5" border="1">
					
					<tr>
					<th><b>item_id</b></th>
					<th><b>id</b></th>
					<th><b>Auc_id</b></th>
					<th><b>Name</b></th>
					<th><b>Type</b></th>
					<th><b>Current High</b></th>
					<th><b>Set Alert</b></th>
					</tr>
					<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
				Statement statement=conn.createStatement();
				String sql ="SELECT ItemList.* FROM ItemList Join AuctionList on ItemList.Auc_id=AuctionList.Auc_id where AuctionList.IsLive=false and id <> '"+namexx+"';";

				ResultSet resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					String item_id= resultSet.getString("item_id");
				%>
				
				<tr>
				<td><%=item_id %></td>
				<td><%=resultSet.getString("id") %></td>
				<td><%=resultSet.getString("Auc_id") %></td>
				<td><%=resultSet.getString("name") %></td>
				<td><%=resultSet.getString("Type") %></td>
				<td><%=resultSet.getString("high") %></td>
				<td><a href="set_alert.jsp?Auc_id=<%=resultSet.getString("Auc_id")%>&item_id=<%=item_id%>&id=<%=Integer.valueOf(namexx)%>&name=<%=resultSet.getString("name")%>">Set Alert When Item Is Live</a></td>
				
			
				</tr>
				<% 
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
			}
		}

%>	
</table>
</body>
</html>