package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.user;
import util.MaHoaMatKhau;

import java.io.IOException;
import java.util.Random;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import database.userDao;

/**
 * Servlet implementation class Register
 */

@WebServlet(name = "Register", urlPatterns = "/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String confirmPassword = request.getParameter("confirmPassword");
		
		request.setAttribute("username", username);
		request.setAttribute("password", password);
		request.setAttribute("email", email);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
		request.setAttribute("gender", gender);
		
		String url = "";
		
		String baoLoi = "";
		
		userDao usd = new userDao();
		
		if(usd.kiemTraTenDangNhap(username)) {
			baoLoi += "Tên đăng nhập đã tồn tại";
		}
		
		if (!password.equals(confirmPassword)) {
			baoLoi += "Mật khẩu không khớp";
		} else {
			password = MaHoaMatKhau.toSHA1(password);
		}
		
		request.setAttribute("baoLoi", baoLoi);
		
		if (baoLoi.length()>0) {
			url = "/view/register.jsp";		
		} else {
			Random rd = new Random();
			String idUser = System.currentTimeMillis() + rd.nextInt(1000) +"";
			user us = new user(idUser, username, password, email, phone, address, gender, url, 0, null);
			usd.insert(us);
			
			request.setAttribute("thongbao", "Đăng ký tài khoản thành công!");
			
			url = "/views/login.jsp";
			
			   ExecutorService executor = Executors.newSingleThreadExecutor();
		        Future<String> future = executor.submit(() -> {
		            // Perform a long operation here
		            Thread.sleep(5000);
		            return "Operation completed successfully!";
		            
		        });

		        try {
		            String result = future.get(3, TimeUnit.SECONDS);
		            System.out.println(result);
		        } catch (TimeoutException e) {
		            System.err.println("Đăng ký thành công");
		        } catch (InterruptedException | ExecutionException e) {
		            System.err.println("Error occurred: " + ((Throwable) e).getMessage());
		        }

		        executor.shutdown();
		}
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
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
