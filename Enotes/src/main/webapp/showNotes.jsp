<%@page import="com.user.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.Dbconnect"%>
<%@page import="com.Dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "please Login...");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show Notes</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponent/navbar.jsp"%>
	
	<%
	  String updatemsg=(String)session.getAttribute("updateMsg");
	  if(updatemsg!=null){
		  %>
		  <div class="alert alert-success" role="alert"><%=updatemsg%></div>
		  <% 
		  session.removeAttribute("updateMsg");
	  }
	%>
	
	<%
	  String wrongMsg=(String)session.getAttribute("wrongMsg");
	  if(wrongMsg!=null){
		  %>
		  <div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
		  <% 
		  session.removeAttribute("wrongMsg");
	  }
	%>

	<div class="container">
		<h2 class="text-center">All Notes:</h2>

		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					PostDao ob = new PostDao(Dbconnect.getConn());
					List<Post> post = ob.getData(user3.getId());
					for (Post po : post) {
				%>

				  <div class="card mt-3">
					<img alt="" src="img/pb2.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px;">
					 <div class="card-body p-4">
                          
						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>

						<p>
							<b class="text-success">Published By:<%=user3.getName() %></b><br>
							<b class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date:<%=po.getPdate()%></b><br>
							<b class="text-primary"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete</a>
						    <a href="edit.jsp?note_id=<%=po.getId() %>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>

				<%
				  }
				}
				%>
                 
			</div>
		</div>
	</div>
</body>
</html>