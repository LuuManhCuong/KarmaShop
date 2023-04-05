package database;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.user;

public class userDao implements DaoInterface<user> {

	@Override
	public ArrayList<user> selectAll() {
		
		ArrayList<user> result = new ArrayList<user>();

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from user";
			PreparedStatement st = connect.prepareStatement(sql);

//			3) chạy câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idUser = rs.getString("idUser");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String gender = rs.getString("gender");
				String avatarUrl = rs.getString("avatarUrl");
				int isAdmin = rs.getInt("isAdmin");
				Date createAtDate = rs.getDate("createAtDate");

				user user = new user(idUser, username, password, email, phone, address, gender, avatarUrl, isAdmin, createAtDate);
				result.add(user);

			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		} 

		return result;
	}

	@Override
	public user selectById(user t) {
		user user = null;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from user where idUser=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, t.getIdUser());

//			3) chạy câu lệnh sql
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idUser = rs.getString("idUser");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String gender = rs.getString("gender");
				String avatarUrl = rs.getString("avatarUrl");
				int isAdmin = rs.getInt("isAdmin");
				Date createAtDate = rs.getDate("createAtDate");

				user = new user(idUser, username, password, email, phone, address, gender, avatarUrl, isAdmin, createAtDate);
				return user;
			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public int insert(user t) {
		if (this.selectById(t) == null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "INSERT INTO `karmar_shop`.`user` "
						+ "(`idUser`, `username`, `password`, `email`, `phone`, `address`, `gender`, `avatarUrl`, `isAdmin`, `createAtDate`) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdUser());
				st.setString(2, t.getUsername());
				st.setString(3, t.getPassword());
				st.setString(4, t.getEmail());
				st.setString(5, t.getPhone());
				st.setString(6, t.getAddress());
				st.setString(7, t.getGender());
				st.setString(8, t.getAvatarUrl());
				st.setInt(9, t.getIsAdmin());
				st.setDate(10, t.getCreateAtDate());

//				3) chạy câu lệnh sql
				count = st.executeUpdate();

//				4) lấy dữ liệu
				System.out.println("có " +count+ " dòng dc insert");

//				5) đóng kết nối
				Connector.closeConnection(connect);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		} else {
			System.out.println("dữ liệu đã tồn tại");
			return 0;
		}
	}

	@Override
	public int insertAll(ArrayList<user> arr) {
		int count = 0;
		for (user user : arr) {
			count += this.insert(user);
		}
		return count;
	}

	@Override
	public int delete(user t) {
		if (this.selectById(t) != null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "DELETE FROM `karmar_shop`.`user` WHERE (`idUser` = ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdUser());
				
//				3) chạy câu lệnh sql
				System.out.println(sql);
				count = st.executeUpdate();

//				4) lấy dữ liệu
				System.out.println("có " +count+ " dòng bị xóa");

//				5) đóng kết nối
				Connector.closeConnection(connect);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		} else {
			System.out.println("ko tìm thấy uesr này để xóa");
			return 0;
		}
	}

	@Override
	public int deleteAll(ArrayList<user> arr) {
		int count = 0;
		for (user user : arr) {
			count += this.delete(user);
		}
		return count;
	}

	@Override
	public int update(user t) {
		if (this.selectById(t) != null) {
			this.delete(t);
			this.insert(t);
			return 1;
		}
		return 0;
	}
	
//	kiem tra ten dang nhap
	public boolean kiemTraTenDangNhap(String username) {
		boolean ketQua = false;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from user where username=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, username);

//			3) chạy câu lệnh sql
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				return true;
			}
//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ketQua;
	}
	
//	chuc nang dang nhap
	public user Login(user t) {
		user ketQua = null;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from user where username=? and password=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, t.getUsername());
			st.setString(2, t.getPassword());

//			3) chạy câu lệnh sql
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idUser = rs.getString("idUser");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String gender = rs.getString("gender");
				String avatarUrl = rs.getString("avatarUrl");
				int isAdmin = rs.getInt("isAdmin");
				Date createAtDate = rs.getDate("createAtDate");

				ketQua = new user(idUser, username, password, email, phone, address, gender, avatarUrl, isAdmin, createAtDate);
				return ketQua;
			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ketQua;
	}


//	public static void main(String[] args) {
//		userDao usDao = new userDao();
//		ArrayList<user> r = usDao.selectAll();
//		for (user user : r) {
//			System.out.println("user" + user.toString())	;
//		}
//		
//		user fUser1 = new user("1", "Zin2", "zin123f", "zi1n@gmail.com", null, null, null, null, 0, null);
//		
//		user findUser = usDao.selectById(fUser1);
//		
//		System.out.println("xin chào " + findUser.getUsername());
//	}

}
