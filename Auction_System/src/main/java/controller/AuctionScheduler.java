package controller;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Timer;
import java.util.TimerTask;
import java.sql.*;

public class AuctionScheduler {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/auctionsys";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "sasumithu";
    
	public void start() {
        Timer timer = new Timer();
        timer.schedule(new AuctionExpirationTask(), 0, 60000); 
    }
	 private static class AuctionExpirationTask extends TimerTask {
	        @Override
	        public void run() {
	        	
	            try (Connection connection = getConnection()) {
	                String query = "SELECT * FROM AuctionList WHERE end_time <= ?";
	                try (PreparedStatement statement = connection.prepareStatement(query)) {
	                    Timestamp currentTimestamp = Timestamp.valueOf(LocalDateTime.now());
	                    statement.setTimestamp(1, currentTimestamp);
	                    try (ResultSet resultSet = statement.executeQuery()) {
	                        while (resultSet.next()) {
	                            // Get auction details from result set
	                            int auctionId = resultSet.getInt("Auc_id");
	                            // ... process auction result ...
	                            
	                            String sql= "insert into expired_auc values(?)";
	                            PreparedStatement stmt=connection.prepareStatement(sql);
	                            stmt.setInt(1,auctionId);
	                            stmt.executeUpdate();
	                            
	                            Statement st=connection.createStatement();
	                            String s = "SELECT * FROM itemList WHERE Auc_id= ?";
	                            PreparedStatement state = connection.prepareStatement(s);
	                            state.setInt(1,auctionId);
	                            ResultSet rs = state.executeQuery();
	                            int item_id=0;
	                            while(rs.next()) {
	                            	int id=rs.getInt("hid");
	                            	if(id==-1) {System.out.println("breaking");break;}
	                            	
	                            	System.out.println("Not breaking");item_id=rs.getInt("item_id");
	                            	int amount=rs.getInt("high");
	                            	int o=rs.getInt("id");
	                            	String type=rs.getString("type");
	                            	String name= rs.getString("name");
	                            	float min_price=rs.getFloat("min_price");
	                            	if(amount>min_price) {
	                            	int i=st.executeUpdate("insert into winner(id,Auc_id,item_id,amount,owner,name )values('"+id+"','"+auctionId+"','"+item_id+"','"+amount+"','"+o+"','"+name+"');");
	                            	}
	                            	int i2=st.executeUpdate("insert into expitems(id,Auc_id,item_id,high,name,type)values('"+id+"','"+auctionId+"','"+item_id+"','"+amount+"','"+name+"','"+type+"');");
	 	                           
	                            }
	                            
	                            String deleteQuery1 = "DELETE FROM ItemList WHERE Auc_id = ?";
	                            try (PreparedStatement deleteStatement1 = connection.prepareStatement(deleteQuery1)) {
	                                deleteStatement1.setInt(1, auctionId);
	                                deleteStatement1.executeUpdate();
	                            }

	                            String deleteQuery = "DELETE FROM AuctionList WHERE Auc_id = ?";
	                            try (PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery)) {
	                                deleteStatement.setInt(1, auctionId);
	                                deleteStatement.executeUpdate();
	                            }
	                            
	                            String deleteQuery2 = "DELETE FROM alert WHERE item_id = ?";
	                            try (PreparedStatement deleteStatement2 = connection.prepareStatement(deleteQuery2)) {
	                                deleteStatement2.setInt(1, item_id);
	                                deleteStatement2.executeUpdate();
	                            }
	                        }
	                    }
	                }
	                query = "SELECT * FROM AuctionList WHERE start_time <= ?";
	                try (PreparedStatement statement = connection.prepareStatement(query)) {
	                    Timestamp currentTimestamp = Timestamp.valueOf(LocalDateTime.now());
	                    statement.setTimestamp(1, currentTimestamp);
	                    try (ResultSet resultSet = statement.executeQuery()) {
	                        while (resultSet.next()) {
	                            // Get auction details from result set
	                            int auctionId = resultSet.getInt("Auc_id");
	                            // ... process auction result ...
	                            
	                            String sql= "update auctionlist set islive=true where auc_id=?";
	                            PreparedStatement stmt=connection.prepareStatement(sql);
	                            stmt.setInt(1,auctionId);
	                            stmt.executeUpdate();
	                        }
	                    }
	                }
	                query = "select name,uid,itemlist.item_id,high,hid,inc_amount,maxi,itemlist.auc_id from itemlist join auto on itemlist.item_id=auto.item_id;";
	                try (PreparedStatement statement = connection.prepareStatement(query)) {	                    
	                    try (ResultSet resultSet = statement.executeQuery()) {
	                        while (resultSet.next()) {
	                        	String name=resultSet.getString("name");
	                            int uid = resultSet.getInt("uid");
	                            int hid = resultSet.getInt("hid");
	                            float high = resultSet.getFloat("high");
	                            float limit = resultSet.getFloat("maxi");
	                            int item_id = resultSet.getInt("item_id");
	                            int auc_id = resultSet.getInt("auc_id");
	                            float inc_amount = resultSet.getFloat("inc_amount");
	                            System.out.printf("uid %d hid %d itemid %d name %s high %f maxi %f \n" , uid, hid, item_id,name,high,limit );
	                            if(hid!=uid) {
	                            	if(limit>=(high+inc_amount)) {
	                            		String sql= "update itemlist set high=?, hid=? where item_id=?";
	    	                            PreparedStatement stmt=connection.prepareStatement(sql);
	    	                            stmt.setFloat(1,(high+inc_amount));
	    	                            stmt.setInt(2,uid);
	    	                            stmt.setInt(3,item_id);
	    	                            stmt.executeUpdate();
	    	                            Statement st=connection.createStatement();
	    	                            if(hid!=-1) {
		    	                            int i=st.executeUpdate("insert into alert(id,item_id,name )values('"+hid+"','"+item_id+"','"+name+"');");
	    	                            }
	    	                            int i=st.executeUpdate("insert into bids(item_id,id,amount,Auc_id )values('"+item_id+"','"+uid+"','"+(high+inc_amount)+"','"+auc_id+"');");

	                            	}else {
	                            		String deleteQuery = "DELETE FROM auto WHERE item_Id = ? and uid=?";
	    	                            try (PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery)) {
	    	                            	deleteStatement.setInt(1,item_id);
	    	                            	deleteStatement.setInt(2,uid);
	    	                                deleteStatement.executeUpdate();
	    	                            }
	                            	}
	                            }
	                            
	                        }
	                    }
	                }
	                
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    private static Connection getConnection() throws SQLException {
	        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	    }
}
	
	
		

