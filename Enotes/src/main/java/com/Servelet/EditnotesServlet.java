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
@WebServlet("/EditnotesServlet")
public class EditnotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
		
		try {
			Integer noteid=Integer.parseInt(request.getParameter("noteid"));
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			PostDao dao=new PostDao(Dbconnect.getConn());
			boolean f=dao.PostUpdate(noteid, title, content);
			if(f) {
				System.out.println("data update successfully");
				HttpSession session=request.getSession();			
				session.setAttribute("updateMsg","Notes Updated successfully");
				response.sendRedirect("showNotes.jsp");
			}
			else
			{
				System.out.println("data not updated");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
