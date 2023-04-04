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
 * Servlet implementation class shop
 */
public class shop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public shop() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productDao prdDao = new productDao();
		ArrayList<product> dataProduct = prdDao.selectAll();
		for (product product : dataProduct) {
			System.out.println("product: " + product.toString());
		}
//
		request.setAttribute("dataProduct", dataProduct);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/shop.jsp");
		rd.forward(request, response);
	}

}
