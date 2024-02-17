package com.Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.PostDao;
import com.Db.Dbconnect;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
          
		Integer noteid=Integer.parseInt(request.getParameter("note_id"));
		
		PostDao dao=new PostDao(Dbconnect.getConn());
		boolean f=dao.deleteNotes(noteid);
		HttpSession session=null;
		if(f) {
			
		    session=request.getSession();
			session.setAttribute("updateMsg","Notes deleted suuccessfully...");
			response.sendRedirect("showNotes.jsp");
		}
		else {
			 session=request.getSession();
			 session.setAttribute("wrongMsg","Something went wrong on server");
			 response.sendRedirect("showNotes.jsp");
		}
	}
}
