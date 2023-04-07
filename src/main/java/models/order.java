package models;

import java.sql.Date;
import java.util.Objects;

public class order {
	private String idOrder, status, paymentBy, statusPayment;
	private double paid, owed;
	private Date orderDate, shipDate;

	public String getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(String idOrder) {
		this.idOrder = idOrder;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentBy() {
		return paymentBy;
	}

	public void setPaymentBy(String paymentBy) {
		this.paymentBy = paymentBy;
	}

	public String getStatusPayment() {
		return statusPayment;
	}

	public void setStatusPayment(String statusPayment) {
		this.statusPayment = statusPayment;
	}

	public double getPaid() {
		return paid;
	}

	public void setPaid(double paid) {
		this.paid = paid;
	}

	public double getOwed() {
		return owed;
	}

	public void setOwed(double owed) {
		this.owed = owed;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getShipDate() {
		return shipDate;
	}

	public void setShipDate(Date shipDate) {
		this.shipDate = shipDate;
	}
	
	

	public order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public order(String idOrder, String status, String paymentBy, String statusPayment, double paid, double owed,
			Date orderDate, Date shipDate) {
		super();
		this.idOrder = idOrder;
		this.status = status;
		this.paymentBy = paymentBy;
		this.statusPayment = statusPayment;
		this.paid = paid;
		this.owed = owed;
		this.orderDate = orderDate;
		this.shipDate = shipDate;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		order other = (order) obj;
		return Objects.equals(idOrder, other.idOrder);
	}
}
