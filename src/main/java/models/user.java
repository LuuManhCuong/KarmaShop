package models;

import java.sql.Date;

public class user {
	private String idUser, username, password, email, phone, address, gender, avatarUrl;
	private boolean isAdmin;
	private Date createAtDate;

	public user(String idUser, String username, String password, String email, String phone, String address,
			String gender, String avatarUrl, boolean isAdmin, Date createAtDate) {
		super();
		this.idUser = idUser;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.gender = gender;
		this.avatarUrl = avatarUrl;
		this.isAdmin = isAdmin;
		this.createAtDate = createAtDate;
	}

	public String getIdUser() {
		return idUser;
	}

	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Date getCreateAtDate() {
		return createAtDate;
	}

	public void setCreateAtDate(Date createAtDate) {
		this.createAtDate = createAtDate;
	}

	@Override
	public String toString() {
		return "user [idUser=" + idUser + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", gender=" + gender + ", avatarUrl=" + avatarUrl
				+ ", isAdmin=" + isAdmin + ", createAtDate=" + createAtDate + "]";
	}

}
