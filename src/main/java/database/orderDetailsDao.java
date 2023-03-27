package database;

import java.util.ArrayList;

import models.order;
import models.orderDetails;

public class orderDetailsDao implements DaoInterface<orderDetails> {
	private ArrayList<orderDetails> data = new ArrayList<>();

	@Override
	public ArrayList<orderDetails> selectAll() {
		return data;
	}

	@Override
	public orderDetails selectById(orderDetails t) {
		for (orderDetails orderDetails : data) {
			System.out.println("orderDetailsDao: " + orderDetails);
			if (orderDetails.equals(t)) {
				return orderDetails;
			}

		}
		return null;
	}

	@Override
	public int insert(orderDetails t) {
		if (this.selectById(t) == null) {
			this.data.add(t);
			return 1;
		}
		return 0;
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
			this.data.remove(t);
			return 1;
		}
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<orderDetails> arr) {
		int count = 0;
		for (orderDetails orderDetails : arr) {
			count += this.delete(orderDetails);
		}
		return count;
	}

	
	public int deleteAll(order order) {
		int count = 0;
		for (orderDetails orderDetails : data) {
			if (orderDetails.getOrder().equals(order)) {
				count += this.delete(orderDetails);

			}
		}
		return count;
	}

	@Override
	public int update(orderDetails t) {
		if (this.selectById(t) != null) {
			this.data.remove(t);
			this.data.add(t);
			return 1;
		}
		return 0;
	}

}
