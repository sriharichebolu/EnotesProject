package com.Servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.userDao;
import com.Db.Dbconnect;
import com.user.UserDetails;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		userDao dao=new userDao(Dbconnect.getConn());
		UserDetails user=dao.loginuser(us);
		if(user!=null) {
			
			HttpSession session=request.getSession();
			session.setAttribute("userD", user);
			
			response.sendRedirect("Home.jsp");
		}
		else {
			
			HttpSession session=request.getSession();
			session.setAttribute("login-failed","invalid Username and password" );
			response.sendRedirect("login.jsp");
		}
		
	}

}
