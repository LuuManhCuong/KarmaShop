package controllers;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import models.cartModel;
import models.product;
import models.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.google.gson.Gson;

import database.cartDao;
import database.productDao;

/**
 * Servlet implementation class mainController
 */
//@WebServlet("/cart")
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
		// TODO Auto-generated method stub
//		HttpSession session = request.getSession();
//		
//		user currentUser = (user) session.getAttribute("usernew");
//		if(currentUser!= null ) {
//			getDataCart(request, response);
//		} else {
//			System.out.println("chưa đăng nhập");
//		}
		HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("usernew") != null);
 
        if (isLoggedIn) {
            // Nếu đã đăng nhập, tiếp tục xử lý yêu cầu
        	getDataCart(request, response);
        } else {
            // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
            System.out.println("chưa đăng nhập");;
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void getDataCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		user currentUser = (user) session.getAttribute("usernew");
//		System.out.println("current user: " + currentUser.getIdUser());
		
		productDao prdDao = new productDao();
		ArrayList<cartModel> dataCart = prdDao.selectCart(currentUser.getIdUser());
//		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonProducts = gson.toJson(dataCart);
		out.print(jsonProducts);
		out.flush();
	}

}
