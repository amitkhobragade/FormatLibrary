package db_connection;

import java.sql.*;

public class Database
{
	public static Connection getConnection() {
        try  {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection
                    ("jdbc:mysql://localhost/try", "root", "");
            System.out.println("connection established");
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	//System.out.println(date);
            return con;
        }
        catch(Exception ex) {
            System.out.println("Database.getConnection() Error -->" + ex.getMessage());
            return null;
        }
    }

     public static void close(Connection con) {
        try  {
            con.close();
        }
        catch(Exception ex) {
        	ex.printStackTrace();
        }
    }

}
