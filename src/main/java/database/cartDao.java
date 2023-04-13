package database;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import models.cart;
import models.cartModel;

public class cartDao implements DaoInterface<cart> {
	
	public static ArrayList<cartModel> selectCart(String u) {
		ArrayList<cartModel> result = new ArrayList<cartModel>();

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();
			String sql = "SELECT \r\n" + "    cart.idCart, \r\n" + "    product.thumbnail, \r\n"
					+ "    product.inCart, \r\n" + "    product.description,\r\n" + "    user.username, \r\n"
					+ "    product.name as productName, \r\n" + "    product.price, \r\n" + "    product.idProduct\r\n"
					+ "    FROM cart\r\n" + "    INNER JOIN user\r\n" + "    ON cart.idUser = user.idUser\r\n"
					+ "    INNER JOIN product\r\n" + "    ON cart.idProduct = product.idProduct \r\n"
					+ "    where cart.idUser = ?" + "    order by cart.time desc";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, u);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String idCart = rs.getString("idCart");
				String idProduct = rs.getString("idProduct");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				String username = rs.getString("username");
				String productName = rs.getString("productName");
				Double price = rs.getDouble("price");
				int inCart = rs.getInt("inCart");

				cartModel cartItem = new cartModel(idCart, idProduct, thumbnail, description, username, productName, inCart, price);
				result.add(cartItem);

			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

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
				System.out.println("added to cart!");
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
	
	
//	kiem tra ton tai san pham
	public boolean kiemTraTontaiSP(String idCart) {
		boolean ketQua = false;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from cart where idCart=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, idCart);

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
				st.setDate(4, t.getTime());
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
//				System.out.println(sql);
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
	
//	delete cart shopping
	public void deleteCart(String idCart) {

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "DELETE FROM `karmar_shop`.`cart` WHERE (`idcart` = ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, idCart);

//				3) chạy câu lệnh sql
//				System.out.println(sql);
				st.executeUpdate();

//				4) lấy dữ liệu
				System.out.println("removed:" +idCart);

//				5) đóng kết nối
				Connector.closeConnection(connect);

			} catch (Exception e) {
				e.printStackTrace();
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
