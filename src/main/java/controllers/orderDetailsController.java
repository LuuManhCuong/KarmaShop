package controllers;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.orderDetails;
import java.io.IOException;
import java.util.List;
import database.orderDetailsDao;


public class orderDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public orderDetailsController() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		orderDetailsDao odDetailDao = new orderDetailsDao();
		List<orderDetails> rs = odDetailDao.selectAll();
		

		RequestDispatcher rd = request.getRequestDispatcher("views/index.jsp");
		request.setAttribute("rs", rs);
		rd.forward(request, response);
		
	}

}
