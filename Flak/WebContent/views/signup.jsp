<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/views/navbar.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
<jsp:include page="navbar.jsp"></jsp:include>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Cabin+Sketch"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles/style.css" />
</head>
<body class="login_body">
	<h1 class="header_class">
		<!-- login.jsp -->
	</h1>
	<div class="login_container">
	<div class="login_content1">
		<c:if test="${not empty message}">
			<h3>${message}</h3>
		</c:if>
		
		
		<form action="signUp.do" method="POST">
			<br>
			<!-- <div class="signup_field" >
				<label>First Name: <input class="signup_field" type="text" name="firstName" value="" /></label> 
			</div>
			<br>
			<div class="signup_field" >
				<label>Last Name: <input class="signup_field" type="text" name="lastName" value="" /></label>
			</div> -->
			<br>
			<div class="signup_field">
				<label>User Name: <input class="signup_field" type="text"
					name="username" value="" /></label>
			</div>
			
			<div class="signup_field">
				<label>Password:<input class="signup_field" type="password"
					name="password1" value="" /></label>
			</div>
			
			<div class="signup_field">
				<label>Confirm Password: <input class="signup_field"
					type="password" name="password2" value="" /></label>
			</div>
			<br> <input class="signup_button" type="submit"
				name="submit" value="Create Account" />

			<div></div>
		</form>
	</div>
	</div>
</body>


	<%-- <div class="login_container">
		<div class="login_content1"></div>
		<h2 id="signup_header">Sign Up</h2>

		<c:if test="${not empty message}">
			<h3>${message}</h3>
		</c:if>
		
		
		<form action="signUp.do" method="POST">
			<br>
			<!-- <div class="signup_field" >
				<label>First Name: <input class="signup_field" type="text" name="firstName" value="" /></label> 
			</div>
			<br>
			<div class="signup_field" >
				<label>Last Name: <input class="signup_field" type="text" name="lastName" value="" /></label>
			</div> -->
			<br>
			<div class="signup_field">
				<label>User Name: <input class="signup_field" type="text"
					name="username" value="" /></label>
			</div>
			<br>
			<div class="signup_field">
				<label>Password:<input class="signup_field" type="password"
					name="password1" value="" /></label>
			</div>
			<br>
			<div class="signup_field">
				<label>Confirm Password: <input class="signup_field"
					type="password" name="password2" value="" /></label>
			</div>
			<br> <br> <input class="signup_button" type="submit"
				name="submit" value="Create Account" />

			<div></div>
		</form>
	</div>
	</div>
</body>
</html> --%>