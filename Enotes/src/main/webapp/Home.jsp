<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	  UserDetails user2=(UserDetails)session.getAttribute("userD");
	  
	  if(user2==null){
		  response.sendRedirect("login.jsp");
		  session.setAttribute("login-error", "please Login...");
	  }
	%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notes Page</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@include file="allcomponent/navbar.jsp"%>
		<div class="card py-5">
			<div class="card-body text-center">
				<img src="img/pb2.jpg" class="img-fluid mx-auto"style="max-width: 325px;">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="addnotes.jsp" class="btn btn-outline-primary">Start Here</a>
			</div>
		</div>
	</div>
	
	<%@include file="allcomponent/footer.jsp" %>
</body>
</html>