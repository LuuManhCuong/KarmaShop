package database;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.cart;

public class cartDao implements DaoInterface<cart> {

	@Override
	public ArrayList<cart> selectAll() {

		ArrayList<cart> result = new ArrayList<cart>();

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from cart";
			PreparedStatement st = connect.prepareStatement(sql);

//			3) chạy câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idCart = rs.getString("idCart");
				String idUser = rs.getString("idUser");
				String idProduct = rs.getString("idProduct");
				Date time = rs.getDate("time");

				cart cart = new cart(idCart, idUser, idProduct, time);

				result.add(cart);

			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public cart selectById(cart t) {
		cart cart = null;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from cart where idCart=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, t.getIdCart());

//			3) chạy câu lệnh sql
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idCart = rs.getString("idCart");
				String idUser = rs.getString("idUser");
				String idProduct = rs.getString("idProduct");
				Date time = rs.getDate("time");

				cart = new cart(idCart, idUser, idProduct, time);

				return cart;
			}
//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cart;
	}

	@Override
	public int insert(cart t) {
		if (this.selectById(t) == null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "INSERT INTO `karmar_shop`.`cart` "
						+ "(`idCart`, `idUser`, `idProduct`, `time`) "
						+ "VALUES (?, ?, ?, ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdCart());
				st.setString(2, t.getIdUser());
				st.setString(3, t.getIdProduct());
				st.setDate(8, t.getTime());
//				3) chạy câu lệnh sql
				count = st.executeUpdate();

//				4) lấy dữ liệu
				System.out.println("có " + count + " dòng dc insert");

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
	public int insertAll(ArrayList<cart> arr) {
		int count = 0;
		for (cart cart : arr) {
			count += this.insert(cart);
		}
		return count;
	}

	@Override
	public int delete(cart t) {
		if (this.selectById(t) != null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "DELETE FROM `karmar_shop`.`cart` WHERE (`idcart` = ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdCart());

//				3) chạy câu lệnh sql
				System.out.println(sql);
				count = st.executeUpdate();

//				4) lấy dữ liệu
				System.out.println("có " + count + " dòng bị xóa");

//				5) đóng kết nối
				Connector.closeConnection(connect);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		} else {
			System.out.println("ko tìm thấy đơn hàng này để xóa");
			return 0;
		}
	}

	@Override
	public int deleteAll(ArrayList<cart> arr) {
		int count = 0;
		for (cart cart : arr) {
			count += this.delete(cart);
		}
		return count;
	}

	@Override
	public int update(cart t) {
		if (this.selectById(t) != null) {
			this.delete(t);
			this.insert(t);
			return 1;
		}
		return 0;
	}

}
