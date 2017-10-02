<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nav Bar</title>
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
<link rel="stylesheet" type="text/css" href="style.css" />
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
			<a class="navbar-brand" href="practice.html"> <span
				class="logoF">F</span><span class="logoL">L</span><span
				class="logoA">A</span><span class="logoK">K</span></a>
			<div class="login-link"></div>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">


			<!-- <ul class="nav navbar-nav ">
          <li class="active">
            <a href="#">Home</a>
          </li>

          <li>
            <a href="#">Contact</a>
          </li>
        </ul> -->
			<ul class="nav navbar-nav navbar-right">

				<ul class="nav navbar-nav ">

					<!--  <li class="active">
              <a href="#">HOME</a>
            </li> -->

					<li><a href="about.jsp">What is Flak?</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span class="caret"></span>&nbsp;GROUPS</a>
						<ul class="dropdown-menu">

							<%-- 	<li><a href="#">${group.name}</a></li>
							<li><a href="#">${group }</a></li>
							<li><a href="#">Stuff 3</a></li> --%>

						</ul> <c:forEach var="group" items="${user.groups}">
							<li><a href="getGroups.do?id=${user.group.id}">${user.group.name}
							</a></li>
							<br />
						</c:forEach>
					<li><a href="login.jsp">LOGIN</a></li>
					</li>
		</div>
	</div>
	</nav>

</body>
</html>