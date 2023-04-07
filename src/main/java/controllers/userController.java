package controllers;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import database.userDao;

@WebServlet("/home")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public userController() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		
		userDao usDao = new userDao();
		List<user> rs = usDao.selectAll();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonProducts = gson.toJson(rs);
		out.print(jsonProducts);
		out.flush();
		
		
//		RequestDispatcher rd = request.getRequestDispatcher("views/index.jsp");
//		
//		request.setAttribute("userList", rs);
//		rd.forward(request, response);

	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		
		userDao usDao = new userDao();
		List<user> rs = usDao.selectAll();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonProducts = gson.toJson(rs);
		out.print(jsonProducts);
		out.flush();
		
		
	}

}
