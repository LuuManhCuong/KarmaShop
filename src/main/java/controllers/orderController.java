package controllers;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.order;

import java.io.IOException;
import java.util.List;

import database.orderDao;


public class orderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public orderController() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		orderDao odDao = new orderDao();
		List<order> rs = odDao.selectAll();
		

		RequestDispatcher rd = request.getRequestDispatcher("views/index.jsp");
		request.setAttribute("rs", rs);
		rd.forward(request, response);
		
	}

}
