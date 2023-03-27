package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
	public static Connection getConnection() {

		Connection connect = null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
//			String driverName = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/karma_shop?useUnicode=true&characterEncoding=UTF-8";
			String user = "root";
			String pass = "";

			connect = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			System.out.println("kết nối thất bại");
			e.printStackTrace();
		}

		return connect;
	}

	public static void closeConnection(Connection connect) {
		try {
			if(connect != null) {
				connect.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
}
