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

@WebServlet("/UserServelet")
public class UserServelet extends HttpServlet {

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		
		String name=request.getParameter("fname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		
		userDao dao=new userDao(Dbconnect.getConn());
		boolean f=dao.adduser(us);
		 HttpSession session;
		if(f)
		{
			 session=request.getSession();
			 session.setAttribute("reg-sucess","Registration Sucessfully...");
			 response.sendRedirect("Register.jsp");
		}
		else {
			session=request.getSession();
			 session.setAttribute("failed-msg","Something went wrong on server");
			 response.sendRedirect("Register.jsp");
		}
	}
	
}
