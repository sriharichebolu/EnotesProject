<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login  page</title>
<%@include file="allcomponent/allcss.jsp" %>
</head>
<body>
<%@ include file="allcomponent/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
				   <div class="card-header  text-center text-white bg-custom">
				   <i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
				   <h4>Login Page</h4>
				   </div>
				   
				  <%
				       String invalid=(String)session.getAttribute("login-failed");
				  
				        if(invalid!=null){
				        	
				  %>
				      
				       <div class="alert alert-danger" role="alert"><%=invalid %></div>
				       
				       
				  <%
				       session.removeAttribute("login-failed");
				  
				       }
				  %>
				   
				   
				   
				  <% 
				    String withoutLogin=(String)session.getAttribute("login-error");   
				    if(withoutLogin!=null){
				  %>
				  <div class="alert alert-danger" role="alert"><%=withoutLogin %></div>
				  <%
				     session.removeAttribute("login-error");
				    }
				  %> 
				  
				  
				  
				  <%
				     
				       String lgmsg=(String)session.getAttribute("logoutMsg");    
				       if(lgmsg!=null){
				   %>
				      <div class="alert alert-success" role="alert"><%=lgmsg %></div>
				   <%    
				        session.removeAttribute("logoutMsg");
				        }
				  %>
				    
				   <div class="card-body">
				   <form action="loginServlet" method="post">
					<div class="form-group">
					<label>Enter Email</label>
						 <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail">
					</div>
					<div class="form-group">
					<label>Enter Password</label>
						 <input type="password" class="form-control" id="exampleInputPassword1" name="upassword">
					</div>
					<button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
				</form>
				   </div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp" %>
</body>
</html>