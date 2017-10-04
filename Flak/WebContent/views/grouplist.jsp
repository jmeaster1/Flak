<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Group List</title>
<%-- <jsp:include page="navbar.jsp"></jsp:include> --%>
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
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">

			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar" name="button">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.do"> <span class="logoF">F</span><span
						class="logoL">L</span><span class="logoA">A</span><span
						class="logoK">K</span></a>
					<div class="login-link"></div>
				</div>

				<div class="collapse navbar-collapse" id="myNavbar">

			<ul class="nav navbar-nav navbar-right">
				<ul class="nav navbar-nav ">
				<c:choose>
					<c:when test="${not empty user}">
					
					</c:when>
						<c:otherwise>
							<li><a href="about.do">What is Flak?</a></li>
						</c:otherwise>
				</c:choose>
						 <c:if test="${not empty groups}">
					<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><span class="caret"></span>&nbsp;GROUPS</a>
							<ul class="dropdown-menu">
							<c:forEach var="group" items="${groups}">
								<li><a href="getDashboardByUser.do?gid=${group.id}">${group.name}
								</a></li>
								<br />
							</c:forEach>
						</c:if>
							</ul> 
					<li><a href="logout.do">LOGOUT</a></li>
				</ul>
			</ul>
		</div>
			</div>
</div>
</nav>
<!-- Allows User to Choose a Group -->
	<div class="login_container3">
		<div class="login_content3">
			<h1>Choose A Group</h1><br>
			<c:forEach var="group" items="${groups}">
				<a href="getDashboardByUser.do?gid=${group.id}">${group.name}
				</a><br><br>
			</c:forEach>
		</div>
	<!-- User Can Create a New Group -->	
		<div class="new_group">
			<form action="newGroup.do" method="POST">
				Group Name: <input type="text" name="newGroup">
				<input type="submit" name="submit" value="Create Group">			
			</form>
		</div>
	</div>
	
</body>
</html>