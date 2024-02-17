b<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@ include file="allcomponent/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header  text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>
					
					<% 
					 String regmsg=(String)session.getAttribute("reg-sucess");
					
					if(regmsg!=null){
					%>
					<div class="alert alert-success" role="alert"><%=regmsg %>Login <a href="login.jsp">Click here</a></div>
					<%
					   session.removeAttribute("reg-sucess");
					   }
					%>
					
					<%
					  
					 String failedmsg=(String)session.getAttribute("failed-msg");
					 if(failedmsg  != null){
					%>
					<div class="alert alert-danger" role="alert"><%= failedmsg %></div>
					<%
					session.removeAttribute("failed-msg");
					   }
					%>
						
					<div class="card-body">
						<form action="UserServelet" method="post">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text" name="fname"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">
							</div>
							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									class="form-control" id="exampleInputPassword1"
									name="upassword">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>