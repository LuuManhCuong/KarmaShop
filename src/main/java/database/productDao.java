package database;

import java.util.ArrayList;

import models.product;

public class productDao implements DaoInterface<product> {
	private ArrayList<product> data = new ArrayList<>();

	@Override
	public ArrayList<product> selectAll() {
		return data;
	}

	@Override
	public product selectById(product t) {
		for (product product : data) {
			System.out.println("productDao: " + product);
			if (product.equals(t)) {
				return product;
			}
		}
		return null;
	}

	@Override
	public int insert(product t) {
		if (this.selectById(t) == null) {
			this.data.add(t);
			return 1;
		}
		return 0;
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
			this.data.remove(t);
			return 1;
		}
		return 0;
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
			this.data.remove(t);
			this.data.add(t);
			return 1;
		}
		return 0;
	}

}
