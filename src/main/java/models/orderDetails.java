package models;

public class orderDetails {
	public orderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String idOrderDetails;
	private order order;
	private product product;
	private int quantity;
	private double initPrice, saleOf, price, vat, totalPrice;
	public String getIdOrderDetails() {
		return idOrderDetails;
	}
	public void setIdOrderDetails(String idOrderDetails) {
		this.idOrderDetails = idOrderDetails;
	}
	public order getOrder() {
		return order;
	}
	public void setOrder(order order) {
		this.order = order;
	}
	public product getProduct() {
		return product;
	}
	public void setProduct(product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getInitPrice() {
		return initPrice;
	}
	public void setInitPrice(double initPrice) {
		this.initPrice = initPrice;
	}
	public double getSaleOf() {
		return saleOf;
	}
	public void setSaleOf(double saleOf) {
		this.saleOf = saleOf;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getVat() {
		return vat;
	}
	public void setVat(double vat) {
		this.vat = vat;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public orderDetails(String idOrderDetails, models.order order, models.product product, int quantity,
			double initPrice, double saleOf, double price, double vat, double totalPrice) {
		super();
		this.idOrderDetails = idOrderDetails;
		this.order = order;
		this.product = product;
		this.quantity = quantity;
		this.initPrice = initPrice;
		this.saleOf = saleOf;
		this.price = price;
		this.vat = vat;
		this.totalPrice = totalPrice;
	}


}
