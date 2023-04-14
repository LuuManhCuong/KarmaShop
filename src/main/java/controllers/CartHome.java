package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.product;

import java.io.IOException;
import java.util.ArrayList;

import database.productDao;

/**
 * Servlet implementation class CartHome
 */
//@WebServlet(name="CartHome", urlPatterns = "/CartHome")
public class CartHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productDao prDao = new productDao();
		ArrayList<product> dataProduct = prDao.selectAll();
		request.setAttribute("dataProduct", dataProduct);
		

		RequestDispatcher rd = request.getRequestDispatcher("/views/index.jsp");
		rd.forward(request, response);
	}

}
