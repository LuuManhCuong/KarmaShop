package controllers;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.cart;
import models.cartModel;
import models.product;
import models.user;

import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Collectors;


import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONString;

import com.google.gson.Gson;
import com.google.gson.JsonParser;

import database.cartDao;
import database.productDao;

/**
 * Servlet implementation class mainController
 */
//@WebServlet("/cart")
@SuppressWarnings("unused")
public class mainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public mainController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		boolean isLoggedIn = (session != null && session.getAttribute("usernew") != null);
		String action = request.getParameter("action");
//		System.out.println("action: " + action);

		if (action.equals("getCart") && isLoggedIn) {
			getDataCart(request, response);
		}
		if (action.equals("removeCart") && isLoggedIn) {
			removeCart(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		boolean isLoggedIn = (session != null && session.getAttribute("usernew") != null);
		String action = request.getParameter("action");
		cartDao cartDao = new cartDao();
		
//		addToCart
		if (action.equals("addCart") && isLoggedIn) {
			String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			JSONObject jsonObject = new JSONObject(body);
			// Lấy giá trị của idUser và idProduct dưới dạng chuỗi (String)
			String idUser = jsonObject.optString("idUser", "");
			String idProduct = jsonObject.optString("idProduct", "");

			LocalDate now = LocalDate.now();
			Date time = Date.valueOf(now);

			Random rd = new Random();
			String idCart = System.currentTimeMillis() + rd.nextInt(1000) + "";


			cart addCart = new cart(idCart, idUser, idProduct, time);
			cartDao.insert(addCart);
			
			getDataCart(request, response);

		} else {
			// Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập

			System.out.println("Chua dang nhap!");
		}
	}

	private void getDataCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		user currentUser = (user) session.getAttribute("usernew");
//		System.out.println("current user: " + currentUser.getIdUser());

		cartDao cartDao = new cartDao();
		ArrayList<cartModel> dataCart = database.cartDao.selectCart(currentUser.getIdUser());
//		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonProducts = gson.toJson(dataCart);
		out.print(jsonProducts);
		out.flush();
	}

	private void removeCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String remove = request.getParameter("idCart");
		System.out.println("remove product: " + remove);
		cartDao cartDao = new cartDao();
		cartDao.delete(new cart(remove, null, null, null));
		
		getDataCart(request, response);
		

	}

}
