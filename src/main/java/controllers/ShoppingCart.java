package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.cartModel;
import models.cart;
import models.cartModel;
import models.product;
import models.user;

import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

import database.cartDao;

/**
 * Servlet implementation class ShoppingCart
 */

@WebServlet(name = "ShoppingCart", urlPatterns = "/ShoppingCart")
public class ShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String idCart = request.getParameter("idCart");
		
		HttpSession session = request.getSession();
		
//		lấy usernew tren session vaf add kieu voi user(Object) = us
		
		user currentUser = (user) session.getAttribute("usernew");
		
		String baoLoi = "";
		String url = "";
		
		cartDao cartDao = new cartDao();
		cartModel cartModel = new cartModel();
		cartModel.getIdCart();
		
		if (currentUser != null) {
			
			ArrayList<cartModel> dataCart = database.cartDao.selectCart(currentUser.getIdUser());
			
			double total = cartDao.totalCart(dataCart);
			request.setAttribute("total", total);
			
			
			
			request.setAttribute("listCart", dataCart);
			url = "/views/shoppingCart.jsp";
//			
		}
//		else if (currentUser != null && cartDao.kiemTraTontaiSP(idCart)) {
//			baoLoi += "Chua co san pham";
//			url = "/views/shoppingCart.jsp";
//		}
		else {
			baoLoi += "Vui lòng đăng nhập";
			url = "/views/login.jsp";
		}
		
		request.setAttribute("baoLoi", baoLoi);
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
