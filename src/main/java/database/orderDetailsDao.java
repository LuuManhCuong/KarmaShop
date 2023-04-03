package database;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.orderDetails;
import models.order;
import models.product;

public class orderDetailsDao implements DaoInterface<orderDetails> {

	@Override
	public ArrayList<orderDetails> selectAll() {

		ArrayList<orderDetails> result = new ArrayList<orderDetails>();

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from orderDetails";
			PreparedStatement st = connect.prepareStatement(sql);

//			3) chạy câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idOrderDetails = rs.getString("idOrderDetails");
				String idOrder = rs.getString("idOrder");
				String idProduct = rs.getString("idProduct");
				int quantity = rs.getInt("quantity");
				Double initPrice = rs.getDouble("initPrice");
				Double saleOf = rs.getDouble("saleOf");
				Double price = rs.getDouble("price");
				Double vat = rs.getDouble("vat");
				Double totalPrice = rs.getDouble("totalPrice");

				
//				tạo ra 2 đối tượng order và product mới nhưng thực ra chỉ cần lấy id để select
//				cần tối ưu hàm selectById dựa vào dữ liệu truyền vào
				order order = new orderDao()
						.selectById(new order(idOrder, null, idOrder, idProduct, quantity, quantity, null, null));
				product product = new productDao().selectById(new product(idProduct, idProduct, idProduct, idProduct,
						sql, idOrderDetails, idOrder, idProduct, quantity, quantity));

				orderDetails orderDetails = new orderDetails(idOrderDetails, order, product, quantity, initPrice, saleOf, price, vat, totalPrice);
				result.add(orderDetails);

			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public orderDetails selectById(orderDetails t) {
		orderDetails orderDetails = null;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from orderDetails where idorderDetails=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, t.getIdOrderDetails());

//			3) chạy câu lệnh sql
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idorderDetails = rs.getString("idorderDetails");
				String status = rs.getString("status");
				String paymentBy = rs.getString("paymentBy");
				String statusPayment = rs.getString("statusPayment");
				Double paid = rs.getDouble("paid");
				Double owed = rs.getDouble("owed");
				Date orderDetailsDate = rs.getDate("orderDetailsDate");
				Date shipDate = rs.getDate("shipDate");

				orderDetails = new orderDetails(idorderDetails, status, paymentBy, statusPayment, paid, owed,
						orderDetailsDate, shipDate);
				return orderDetails;
			}
//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderDetails;
	}

	@Override
	public int insert(orderDetails t) {
		if (this.selectById(t) == null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "INSERT INTO `karmar_shop`.`orderDetails` "
						+ "(`idorderDetails`, `status`, `paymentBy`, `statusPayment`, `paid`, `owed`, `orderDetailsDate`, `shipDate`) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdorderDetails());
				st.setString(2, t.getStatus());
				st.setString(3, t.getPaymentBy());
				st.setString(4, t.getStatusPayment());
				st.setDouble(5, t.getPaid());
				st.setDouble(6, t.getOwed());
				st.setDate(7, t.getorderDetailsDate());
				st.setDate(8, t.getShipDate());
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
	public int insertAll(ArrayList<orderDetails> arr) {
		int count = 0;
		for (orderDetails orderDetails : arr) {
			count += this.insert(orderDetails);
		}
		return count;
	}

	@Override
	public int delete(orderDetails t) {
		if (this.selectById(t) != null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "DELETE FROM `karmar_shop`.`orderDetails` WHERE (`idorderDetails` = ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdorderDetails());

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
	public int deleteAll(ArrayList<orderDetails> arr) {
		int count = 0;
		for (orderDetails orderDetails : arr) {
			count += this.delete(orderDetails);
		}
		return count;
	}

	@Override
	public int update(orderDetails t) {
		if (this.selectById(t) != null) {
			this.delete(t);
			this.insert(t);
			return 1;
		}
		return 0;
	}

}
