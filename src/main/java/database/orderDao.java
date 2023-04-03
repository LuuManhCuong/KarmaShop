package database;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.order;

public class orderDao implements DaoInterface<order> {

	@Override
	public ArrayList<order> selectAll() {

		ArrayList<order> result = new ArrayList<order>();

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from order";
			PreparedStatement st = connect.prepareStatement(sql);

//			3) chạy câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idOrder = rs.getString("idOrder");
				String status = rs.getString("status");
				String paymentBy = rs.getString("paymentBy");
				String statusPayment = rs.getString("statusPayment");
				Double paid = rs.getDouble("paid");
				Double owed = rs.getDouble("owed");
				Date orderDate = rs.getDate("orderDate");
				Date shipDate = rs.getDate("shipDate");

				order order = new order(idOrder, status, paymentBy, statusPayment, paid, owed, orderDate, shipDate);

				result.add(order);

			}

//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public order selectById(order t) {
		order order = null;

		try {
//			1) kết nối csdl
			Connection connect = Connector.getConnection();

//			2) tạo stament
			String sql = "select * from order where idOrder=?";
			PreparedStatement st = connect.prepareStatement(sql);
			st.setString(1, t.getIdOrder());

//			3) chạy câu lệnh sql
			ResultSet rs = st.executeQuery();

//			4) lấy dữ liệu
			while (rs.next()) {
				String idOrder = rs.getString("idOrder");
				String status = rs.getString("status");
				String paymentBy = rs.getString("paymentBy");
				String statusPayment = rs.getString("statusPayment");
				Double paid = rs.getDouble("paid");
				Double owed = rs.getDouble("owed");
				Date orderDate = rs.getDate("orderDate");
				Date shipDate = rs.getDate("shipDate");

				order = new order(idOrder, status, paymentBy, statusPayment, paid, owed, orderDate, shipDate);
				return order;
			}
//			5) đóng kết nối
			Connector.closeConnection(connect);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public int insert(order t) {
		if (this.selectById(t) == null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "INSERT INTO `karmar_shop`.`order` "
						+ "(`idOrder`, `status`, `paymentBy`, `statusPayment`, `paid`, `owed`, `orderDate`, `shipDate`) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdOrder());
				st.setString(2, t.getStatus());
				st.setString(3, t.getPaymentBy());
				st.setString(4, t.getStatusPayment());
				st.setDouble(5, t.getPaid());
				st.setDouble(6, t.getOwed());
				st.setDate(7, t.getOrderDate());
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
	public int insertAll(ArrayList<order> arr) {
		int count = 0;
		for (order order : arr) {
			count += this.insert(order);
		}
		return count;
	}

	@Override
	public int delete(order t) {
		if (this.selectById(t) != null) {
			int count = 0;

			try {
//				1) kết nối csdl
				Connection connect = Connector.getConnection();

//				2) tạo stament
				String sql = "DELETE FROM `karmar_shop`.`order` WHERE (`idorder` = ?);\r\n";
				PreparedStatement st = connect.prepareStatement(sql);
				st.setString(1, t.getIdOrder());

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
	public int deleteAll(ArrayList<order> arr) {
		int count = 0;
		for (order order : arr) {
			count += this.delete(order);
		}
		return count;
	}

	@Override
	public int update(order t) {
		if (this.selectById(t) != null) {
			this.delete(t);
			this.insert(t);
			return 1;
		}
		return 0;
	}

}
