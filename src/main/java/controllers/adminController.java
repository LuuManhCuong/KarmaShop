package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.product;
import models.user;
import util.MaHoaMatKhau;

import java.awt.Desktop.Action;
import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;
import java.util.stream.Collectors;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import database.productDao;
import database.userDao;

public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		System.out.println("action: " + action);
		if (action.equals("getWarehouse")) {
			getWareHouse(request, response);
		}
		if (action.equals("getDataCustomer")) {
			getDataCustomer(request, response);
		}
		if (action.equals("deleteUser")) {
			deleteUser(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		System.out.println("action: " + action);
		if (action.equals("editUser")) {

			// Đọc dữ liệu từ request body
			BufferedReader reader = request.getReader();
			StringBuilder stringBuilder = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				stringBuilder.append(line);
			}
			String json = stringBuilder.toString();

			// Phân tích dữ liệu JSON
			JsonObject data = JsonParser.parseString(json).getAsJsonObject();
			String idUser = data.get("idUser").getAsString();
			String username = data.get("username").getAsString();
			String getPassword = data.get("password").getAsString();
			String email = data.get("email").getAsString();
			String phone = data.get("phone").getAsString();
			String address = data.get("address").getAsString();
			int isAdmin = data.get("isAdmin").getAsInt();
			String gender = data.get("gender").getAsString();
			String avatarUrl = data.get("avatarUrl").getAsString();
			String password = MaHoaMatKhau.toSHA1(getPassword);
//			System.out.println(idUser);
//			System.out.println(username);
//			System.out.println(password);

			LocalDate now = LocalDate.now();
			Date createAtDate = Date.valueOf(now);

			userDao userDao = new userDao();
			userDao.update(new user(idUser, username, password, email, phone, address, gender, avatarUrl, isAdmin,
					createAtDate));

			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String jsonProducts = gson.toJson("succes");
			out.print(jsonProducts);
			out.flush();

		}
		if (action.equals("addProduct")) {

			Random rd = new Random();
			String idProduct = System.currentTimeMillis() + rd.nextInt(1000) + "";
			// Đọc dữ liệu từ request body
			BufferedReader reader = request.getReader();
			StringBuilder stringBuilder = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				stringBuilder.append(line);
			}
			String json = stringBuilder.toString();

			// Phân tích dữ liệu JSON
			JsonObject data = JsonParser.parseString(json).getAsJsonObject();
			String name = data.get("name").getAsString();
			String category = data.get("category").getAsString();
			String brand = data.get("brand").getAsString();
			String size = data.get("size").getAsString();
			String color = data.get("color").getAsString();
			int quantity = data.get("quantity").getAsInt();
			double price = data.get("price").getAsDouble();
			String description = data.get("description").getAsString();
			String thumbnail = data.get("thumbnail").getAsString();
			int like = 0;

			productDao productDao = new productDao();
			product newProduct = new product(idProduct, name, description, category, brand, size, thumbnail, color,
					quantity, like, price);

			productDao.insert(newProduct);

			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String jsonProducts = gson.toJson("succes");
			out.print(jsonProducts);
			out.flush();
		}

	}

//	getWareHouse
	public void getWareHouse(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		productDao productDao = new productDao();
		ArrayList<product> dataProducts = productDao.selectAll();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonProducts = gson.toJson(dataProducts);
		out.print(jsonProducts);
		out.flush();
	}

//	getDataCustomer
	public void getDataCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		userDao userDao = new userDao();
		ArrayList<user> dataCustomers = userDao.selectAll();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonProducts = gson.toJson(dataCustomers);
		out.print(jsonProducts);
		out.flush();
	}

//	deleteUser
	public void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deleteUser = request.getParameter("idUser");
		System.out.println("xóa uesr: " + deleteUser);
		userDao userDao = new userDao();
		userDao.delete(new user(deleteUser, deleteUser, deleteUser, deleteUser, deleteUser, deleteUser, deleteUser,
				deleteUser, 0, null));

	}

}
