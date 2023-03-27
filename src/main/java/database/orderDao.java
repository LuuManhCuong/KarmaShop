package database;

import java.util.ArrayList;
import models.order;

public class orderDao implements DaoInterface<order> {
	private ArrayList<order> data = new ArrayList<>();

	@Override
	public ArrayList<order> selectAll() {
		return data;
	}

	@Override
	public order selectById(order t) {
		for (order order : data) {
			System.out.println("orderDao: " + order);
			if (order.equals(t)) {
				return order;
			}

		}
		return null;
	}

	@Override
	public int insert(order t) {
		if (this.selectById(t) == null) {
			this.data.add(t);
			return 1;
		}
		return 0;
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

//			xóa chi tiết đơn hàng => xóa đơn hàng
			orderDetailsDao orderDetail = new orderDetailsDao();
			orderDetail.deleteAll(t);

			this.data.remove(t);
			return 1;
		}
		return 0;
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
			this.data.remove(t);
			this.data.add(t);
			return 1;
		}
		return 0;
	}

}
