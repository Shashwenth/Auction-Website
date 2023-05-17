<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="com.itextpdf.text.Document" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="org.eclipse.core.resources.*" %>
<%@ page import="org.eclipse.core.runtime.*" %>

<%@ page import="com.itextpdf.text.pdf.PdfPCell" %>
<%@ page import="com.itextpdf.text.pdf.PdfPTable" %>
<!DOCTYPE html>
<html>
<head>
<style>
		.spinner {
			margin: 100px auto;
			width: 40px;
			height: 40px;
			position: relative;
		}
		
		.spinner .rect1,
		.spinner .rect2,
		.spinner .rect3 {
			background-color: #333;
			height: 100%;
			width: 6px;
			display: inline-block;
			position: absolute;
			top: 0;
			left: 0;
			-webkit-animation: spinner 1.2s ease-in-out infinite;
			animation: spinner 1.2s ease-in-out infinite;
		}
		
		.spinner .rect2 {
			-webkit-animation-delay: -1.1s;
			animation-delay: -1.1s;
		}
		
		.spinner .rect3 {
			-webkit-animation-delay: -1.0s;
			animation-delay: -1.0s;
		}
		
		@-webkit-keyframes spinner {
			0% {
				-webkit-transform: scale(0);
				transform: scale(0);
			}
			50% {
				-webkit-transform: scale(1);
				transform: scale(1);
			}
			100% {
				-webkit-transform: scale(0);
				transform: scale(0);
			}
		}
		
		@keyframes spinner {
			0% {
				-webkit-transform: scale(0);
				transform: scale(0);
			}
			50% {
				-webkit-transform: scale(1);
				transform: scale(1);
			}
			100% {
				-webkit-transform: scale(0);
				transform: scale(0);
			}
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String jdbcDriver = "com.mysql.jdbc.Driver";
    String dbUrl = "jdbc:mysql://localhost:3306/auctionsys";
    String username = "root";
    String password = "sasumithu";
    Connection conn = null;
    Statement stmt = null;
    String[] a={"SELECT auc_id, SUM(high) AS total_amount FROM expitems GROUP BY auc_id order by total_amount desc;",
    		"SELECT auc_id, SUM(high) AS total_amount FROM itemlist GROUP BY auc_id order by total_amount desc;",
    		"SELECT id, SUM(high) AS total_amount FROM expitems GROUP BY id order by total_amount desc;",
    		"SELECT id, SUM(high) AS total_amount FROM itemlist GROUP BY id order by total_amount desc;",
    		"SELECT type, SUM(high) AS total_amount FROM itemlist GROUP BY type order by total_amount desc;",
    		"SELECT type, SUM(high) AS total_amount FROM expitems GROUP BY type order by total_amount desc;",
    		"SELECT item_id,name, high AS total_amount FROM itemlist order by total_amount desc;",
    		"SELECT item_id,name, high AS total_amount FROM expitems order by total_amount desc;"};
    try {
        Class.forName(jdbcDriver);
        
        //stmt = conn.createStatement();
        //String query = "SELECT auc_id, SUM(high) AS total_amount FROM expitems GROUP BY auc_id;";
        //rs = stmt.executeQuery(query);
        Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream("C:/Users/shash/git/repository/Auction_System/src/main/webapp/table.pdf"));
        document.open();
        Paragraph title = new Paragraph("Table Data");
        title.setSpacingAfter(20);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(title);
        Paragraph para = new Paragraph("Auction Report");
        para.setSpacingAfter(10);
        document.add(para);
        
        conn = DriverManager.getConnection(dbUrl, username, password);
        try{
        	stmt=conn.createStatement();
        	try{
        		int i=0;
        		for(String q : a){
        			i=i+1;
        			System.out.println(i);
					ResultSet rs = stmt.executeQuery(q);
					try{
						if(i==1){
						Paragraph para1 = new Paragraph("List Of All Expired Auctions And Their Total Sales");
				        para1.setSpacingAfter(10);
				        document.add(para1);
						}
				        if(i==2){
							Paragraph para1 = new Paragraph("List Of All Live Auctions And Their Total Sales *");
					        para1.setSpacingAfter(10);
					        document.add(para1);
							}
				        if(i==3){
							Paragraph para1 = new Paragraph("List Of All Users And Their Total Purchases in Expired Auctions ");
					        para1.setSpacingAfter(10);
					        document.add(para1);
							}
				        if(i==4){
							Paragraph para1 = new Paragraph("List Of All Users And Their Total Purchases in Current Live Auctions *");
					        para1.setSpacingAfter(10);
					        document.add(para1);
							}
				        if(i==5){
							Paragraph para1 = new Paragraph("List Of Item Type And Their Total Purchases in Current Live Auctions *");
					        para1.setSpacingAfter(10);
					        document.add(para1);
							}
				        if(i==6){
							Paragraph para1 = new Paragraph("List Of All Item Type And Their Total Purchases in Expired Auctions ");
					        para1.setSpacingAfter(10);
					        document.add(para1);
							}
				        if(i==7){
							Paragraph para1 = new Paragraph("List Of All Items And Their Total Purchases in Current Live Auctions *");
					        para1.setSpacingAfter(10);
					        document.add(para1);
							}
				        if(i==8){
							Paragraph para1 = new Paragraph("List Of All Items And Their Total Purchases in Expired Auctions ");
					        para1.setSpacingAfter(10);
					        document.add(para1);
							}
						PdfPTable table = new PdfPTable(2); // 2 columns
				        table.setWidthPercentage(100);
				        table.setSpacingBefore(10);
				        table.setSpacingAfter(10);

				        // Add column headers to the table
				        if(i<=2){
				        	PdfPCell header1 = new PdfPCell(new Paragraph("Auction ID"));
					        header1.setHorizontalAlignment(Element.ALIGN_CENTER);
					        header1.setPadding(5);
					        table.addCell(header1);
				        }
				        else if(i==3 || i==4){
				        	PdfPCell header1 = new PdfPCell(new Paragraph("User ID"));
					        header1.setHorizontalAlignment(Element.ALIGN_CENTER);
					        header1.setPadding(5);
					        table.addCell(header1);
				        }
				        else if(i==5 || i==6){
				        	PdfPCell header1 = new PdfPCell(new Paragraph("Item Type"));
					        header1.setHorizontalAlignment(Element.ALIGN_CENTER);
					        header1.setPadding(5);
					        table.addCell(header1);
				        }
				        else{
				        	PdfPCell header1 = new PdfPCell(new Paragraph("Item Name"));
					        header1.setHorizontalAlignment(Element.ALIGN_CENTER);
					        header1.setPadding(5);
					        table.addCell(header1);
				        }
				        
				        PdfPCell header2 = new PdfPCell(new Paragraph("Total Sales (in $)"));
				        header2.setHorizontalAlignment(Element.ALIGN_CENTER);
				        header2.setPadding(5);
				        table.addCell(header2);
				        
				        while (rs.next()) {
				        	if(i<=2){
				        		PdfPCell cell1 = new PdfPCell(new Paragraph(rs.getString("auc_id")));
					            cell1.setPadding(5);table.addCell(cell1);
				        	}
				        	else if(i>2 && i<=4){
				        	PdfPCell cell1 = new PdfPCell(new Paragraph(rs.getString("id")));
				            cell1.setPadding(5);table.addCell(cell1);
				            }
				        	else if(i>4 && i<=6){
					        	PdfPCell cell1 = new PdfPCell(new Paragraph(rs.getString("type")));
					            cell1.setPadding(5);table.addCell(cell1);
					            }
				        	else{
					        	PdfPCell cell1 = new PdfPCell(new Paragraph(rs.getString("name")));
					            cell1.setPadding(5);table.addCell(cell1);
					            }
				        	
				            PdfPCell cell2 = new PdfPCell(new Paragraph(rs.getString("total_amount")));
				            cell2.setPadding(5);
				            
				            table.addCell(cell2);
				        }
				        document.add(table);

					}finally{
				    	rs.close();
				    }
        		}
        	}finally{
            	stmt.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    
        
        // Add table data to the PDF document
        /*PdfPTable table = new PdfPTable(2); // 2 columns
        table.setWidthPercentage(100);
        table.setSpacingBefore(10);
        table.setSpacingAfter(10);

        // Add column headers to the table
        PdfPCell header1 = new PdfPCell(new Paragraph("Co 1"));
        header1.setHorizontalAlignment(Element.ALIGN_CENTER);
        header1.setPadding(5);
        PdfPCell header2 = new PdfPCell(new Paragraph("Co 2"));
        header2.setHorizontalAlignment(Element.ALIGN_CENTER);
        header2.setPadding(5);
        table.addCell(header1);
        table.addCell(header2);
        
        while (rs.next()) {
        	PdfPCell cell1 = new PdfPCell(new Paragraph(rs.getString("auc_id")));
            cell1.setPadding(5);
            PdfPCell cell2 = new PdfPCell(new Paragraph(rs.getString("total_amount")));
            cell2.setPadding(5);
            table.addCell(cell1);
            table.addCell(cell2);
        }
        document.add(table);
        "SELECT auc_id, SUM(high) AS total_amount FROM itemlist GROUP BY auc_id;",
		"SELECT id, SUM(high) AS total_amount FROM expitems GROUP BY id;",
		"SELECT id, SUM(high) AS total_amount FROM itemlist GROUP BY id;"
		*/
        // Close the document and database resources
        Paragraph footer = new Paragraph("* - Current Live auction values are bound to change");
        footer.setAlignment(Paragraph.ALIGN_CENTER);
        footer.setSpacingBefore(20);
        document.add(footer);
        document.close();
        
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
        // Display the PDF file in an iframe
        
    
%>
	
	<%
		// Halt execution for 3 seconds
		Thread.sleep(10000);
	%>
 
<iframe src="table.pdf" width="100%" height="600"></iframe>
 
        
</body>
</html>