<%@page import="com.Db.Dbconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img{
   background:url("img/pen3.jpg");
   height:80vh;
   width:100%;
   background-size:100% 100%;
   background-repeat:no-repeat;
}
</style>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="allcomponent/allcss.jsp" %>
</head>
<body >
<%@include file="allcomponent/navbar.jsp" %>

<div class="container-fluid back-img">
   <div class="text-center">
     <h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i>E Notes-save your Notes</h1>
     <a href="login.jsp" class="btn btn-light"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
     <a href="Register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
   </div>
</div>


<%@include file="allcomponent/footer.jsp" %>
</body>
</html>