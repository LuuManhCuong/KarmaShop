package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.product;

import java.io.IOException;
import java.util.ArrayList;

import database.productDao;

@WebServlet("/shopPage/*")
public class shopController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public shopController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		productDao prdDao = new productDao();
		ArrayList<product> dataProduct = prdDao.selectAll();
		request.setAttribute("dataProduct", dataProduct);
		
//		chuyen huong den trang shop
		RequestDispatcher rd = request.getRequestDispatcher("/views/shop.jsp");
		rd.forward(request, response);
		

		
		
	}
	
	

}
