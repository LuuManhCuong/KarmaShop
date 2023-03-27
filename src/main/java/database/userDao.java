package database;

import java.util.ArrayList;

import models.user;

public class userDao implements DaoInterface<user> {

	@Override
	public ArrayList<user> selectAll() {
		return data;
	}

	@Override
	public user selectById(user t) {
		for (user user : data) {
			System.out.println("userDao: " + user);
			if (user.equals(t)) {
				return user;
			}
			
		}
		return null;
	}

	@Override
	public int insert(user t) {
		if (this.selectById(t) == null) {
			this.data.add(t);
			return 1;
		}
		return 0;
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
			this.data.remove(t);
			return 1;
		}
		return 0;
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
			this.data.remove(t);
			this.data.add(t);
			return 1;
		}
		return 0;
	}

}
