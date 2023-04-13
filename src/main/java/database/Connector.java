package database;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {

	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/karmar_shop?useSSL=false&allowPublicKeyRetrieval=true";
			String username = "root";
			String password = "thuan2002";
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(Connection connect) {
		try {
			if (connect != null) {
				connect.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
