package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import models.product;

public class productDao implements DaoInterface<product> {
	@Override
	public ArrayList<product> selectAll() {
		ArrayList<product> result = new ArrayList<product>();

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from product";
			PreparedStatement st = connect.prepareStatement(sql);

//			3) chạy câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idProduct = rs.getString("idProduct");
				String name = rs.getString("name");
				String description = rs.getString("description");
				String brand = rs.getString("brand");
				String category = rs.getString("category");
				String thumbnail = rs.getString("thumbnail");
				String size = rs.getString("size");
				String color = rs.getString("color");
				int quantity = rs.getInt("quantity");
				int like = rs.getInt("like");

				product product = new product(idProduct, name, description, category, brand, size, thumbnail, color,
						quantity, like);
				result.add(product);

			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public product selectById(product t) {
		product product = null;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from product where idproduct=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, t.getIdProduct());

//			3) chạy câu lệnh sql
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idProduct = rs.getString("idProduct");
				String name = rs.getString("name");
				String description = rs.getString("description");
				String brand = rs.getString("brand");
				String category = rs.getString("category");
				String thumbnail = rs.getString("thumbnail");
				String size = rs.getString("size");
				String color = rs.getString("color");
				int quantity = rs.getInt("quantity");
				int like = rs.getInt("like");

				product = new product(idProduct, name, description, category, brand, size, thumbnail, color, quantity,
						like);
				return product;
			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;
	}

	@Override
	public int insert(product t) {
		if (this.selectById(t) == null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "INSERT INTO `karmar_shop`.`product` "
						+ "(`idProduct`, `name`, `description`, `category`, `brand`, `size`, `color`, `thumbnail`, `quantity`, `like`) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdProduct());
				st.setString(2, t.getName());
				st.setString(3, t.getDescription());
				st.setString(4, t.getCategory());
				st.setString(5, t.getBrand());
				st.setString(6, t.getSize());
				st.setString(7, t.getColor());
				st.setString(8, t.getThumbnail());
				st.setInt(9, t.getQuantity());
				st.setInt(10, t.getLike());

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
	public int insertAll(ArrayList<product> arr) {
		int count = 0;
		for (product product : arr) {
			count += this.insert(product);
		}

		return count;
	}

	@Override
	public int delete(product t) {
		if (this.selectById(t) != null) {
			int count = 0;

			try {
//			1) kết nối csdl
				Connection connect = Connector.getConnection();

//			2) tạo stament
				String sql = "DELETE FROM `karmar_shop`.`product` WHERE (`idProduct` = ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdProduct());

//			3) chạy câu lệnh sql
				System.out.println(sql);
				count = st.executeUpdate();

//			4) lấy dữ liệu
				System.out.println("có " + count + " dòng bị xóa");

//			5) đóng kết nối
				Connector.closeConnection(connect);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		} else {
			System.out.println("ko tìm thấy product này để xóa");
			return 0;
		}
	}

	@Override
	public int deleteAll(ArrayList<product> arr) {
		int count = 0;
		for (product product : arr) {
			count += this.delete(product);
		}
		return count;
	}

	@Override
	public int update(product t) {
		if (this.selectById(t) != null) {
			this.delete(t);
			this.insert(t);
			return 1;
		}
		return 0;
	}

	public static void main(String[] args) {
		productDao prdDao = new productDao();
		ArrayList<product> r = prdDao.selectAll();
		product spProduct = new product("10", "áo thun", "đây là áo thun", null, null, null, null, null, 0, 0);
//		prdDao.selectById(spProduct);
//		prdDao.insert(spProduct);
		prdDao.delete(spProduct);
		System.out.println("xin chào");
		for (product product : r) {
			System.out.println("product: " + product.toString());
		}

	}

}
