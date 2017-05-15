package connectivity;

import java.sql.Connection;
	import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
public class DatabaseConnectivity {
	
	private String url;
	private String port;
    private String dbName;
    private String driver ;
    private String userName;
    private String password;
    
		 
		public Connection conn;
	    private PreparedStatement statement;
	  public static DatabaseConnectivity db;
	    public DatabaseConnectivity() {
	        url= "sensor-database.ckxiqr8myjaj.us-west-2.rds.amazonaws.com";
	        port="3306";
	        dbName = "cloudtrade1";
	        driver = "com.mysql.jdbc.Driver";
	        userName = "root";
	        password = "mysqlroot";
	        try {
	        	
	        	
	             Class.forName(driver).newInstance();
	             this.conn = (Connection)DriverManager.getConnection("jdbc:mysql://" + url + ":" + port + "/" + dbName + "?useSSL=false",
	 					userName,password );
	        	
	        }
	        catch (Exception sqle) {
	            sqle.printStackTrace();
	        }
	        
	    }
	   
	   /* public static synchronized DatabaseConnectivity getDbCon() {
	        if ( db == null ) {
	            db = new DatabaseConnectivity();
	        }
	        return db;
	 
	    }*/
	    
	    public ResultSet query(String query) throws SQLException{
	    	
	    	
	    	ResultSet res=null;
	    	
	    	
	    	
	    	
	    	 
	    	
	        
	    	statement = conn.prepareStatement(query);
	        res= statement.executeQuery(query);
	    	//statement.close();
	       
	        
	           
	        return res;
	    	
	    	
	       
	    }
	   
	    public int crud(String Query) throws SQLException {
	    	
	    		
	    	boolean result=false;
	    	int res=0;
	    	
	    	
	        statement = conn.prepareStatement(Query);
	        
	         result = statement.execute();
	    	//  statement.close();
	       
	        
	        if(result)
	        {
	        	res=1;
	        }
	        else
	        {
	        	res=-1;
	        }
	     
	      
	        return res ;
	 
	    }
	    public String getLastPkID(String tablename,String columnname) throws SQLException{
	    	
	    	int tempNo;
	    	String newPkID=null;
	    	String[] tempArr;
	    	String q="select * from " + tablename + " order by " + columnname + " DESC LIMIT 1";
	    	
	    	
	        ResultSet re = query(q);
	       
	        while(re.next())
	        {
	          newPkID=re.getString(columnname);
	        }
	        tempArr=newPkID.split("_");
	        newPkID=tempArr[1];
	        tempNo=Integer.valueOf(newPkID)+1;
	        newPkID= tempArr[0] + "_" + String.valueOf(tempNo);
	        return newPkID;
	    }
	    
	  
	    public void closeConnections()
	    {
	    	try {
	    		if(statement!=null)
	    		{
				    statement.close();
	    		}
	    		if(conn!=null)
	    		{
				    conn.close();
	    		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    }
	    
	  
	   
	 
		
	}
	
	


