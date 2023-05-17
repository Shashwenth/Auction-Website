<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{ 
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
			Statement statement=conn.createStatement();
			String sql ="SELECT auc_id, SUM(high) AS total_amount FROM auctionlist JOIN itemlist ON auctionlist.auc_id = itemlist.auc_id GROUP BY auctionlist.auc_id;";
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				String Auc_id= resultSet.getString("Auc_id");
			%>

			<tr bgcolor="#DEB887">

			<td><%=resultSet.getString("total_amount") %></td>
			<td><%=resultSet.getString("Auc_id") %></td>
			</tr>
			<% 
			}

			} catch (Exception e) {
			e.printStackTrace();
			}

%>
<%
try{ 
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
			Statement statement=conn.createStatement();
			String sql ="SELECT auc_id, SUM(high) AS total_amount FROM expitems GROUP BY auc_id;";
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				String Auc_id= resultSet.getString("Auc_id");
			%>

			<tr bgcolor="#DEB887">

			<td><%=resultSet.getString("total_amount") %></td>
			<td><%=resultSet.getString("Auc_id") %></td>
			</tr>
			<% 
			}

			} catch (Exception e) {
			e.printStackTrace();
			}

%>
<% 
try{ 
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
			Statement statement=conn.createStatement();
			String sql ="SELECT auc_id, SUM(high) AS total_amount FROM expitems GROUP BY auc_id;";
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				String Auc_id= resultSet.getString("Auc_id");
			%>

			<tr bgcolor="#DEB887">

			
			<td><%=resultSet.getString("total_amount") %></td>
			<td><%=resultSet.getString("Auc_id") %></td>
			</tr>
			<% 
			}

			} catch (Exception e) {
			e.printStackTrace();
			}

%>
</body>
</html>