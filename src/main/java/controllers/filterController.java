package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.product;
import models.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

import database.productDao;
import database.userDao;

/**
 * Servlet implementation class filterController
 */
public class filterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public filterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		String body = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
		JSONObject jsonObject = new JSONObject(body);

		JSONArray categoryArray = jsonObject.getJSONArray("category");
		String category = categoryArray.getString(0);

		JSONArray brandArray = jsonObject.getJSONArray("brands");
//	    System.out.println("brandArray: "+ brandArray);
		List<String> brands = new ArrayList<>();
		for (int i = 0; i < brandArray.length(); i++) {
			brands.add(brandArray.getString(i));
		}

		JSONArray sizeArray = jsonObject.getJSONArray("sizes");
		List<String> sizes = new ArrayList<>();
		for (int i = 0; i < sizeArray.length(); i++) {
			sizes.add(sizeArray.getString(i));
		}

		ArrayList<product> dataProducts = new ArrayList<>();
		productDao productDao = new productDao();

//		System.out.println("filter ");
		dataProducts = productDao.handleFilter(category, brandArray, sizeArray);

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonProducts = gson.toJson(dataProducts);
		out.print(jsonProducts);
		out.flush();

	}

}
