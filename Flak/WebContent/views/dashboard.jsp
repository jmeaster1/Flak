<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- form --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
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
	<div class="dashboard_container">
<body>
		<h1 class="header_class">dashboard.jsp</h1>

		<div class="no-show">
			<h1>hide</h1>
		</div>
		<c:if test="${not empty posts}">
				<ul>
			<c:forEach var="post" items="${posts}">
					<li>${post}</li>
			</c:forEach>
				</ul>
		</c:if>
		
		<c:if test="${not empty conversations}">
				<ul>
			<c:forEach var="convo" items="${conversations}">
					<li><a href="getConvos.do?cid=${convo.id}&gid=${group.id}">${convo.title}</a></li>
			</c:forEach>
				</ul>
		</c:if>
		
		<c:if test="${not empty list}">
				<ul>
			<c:forEach var="item" items="${list}">
					<li>${item.name}: ${item.description}</li>
			</c:forEach>
				</ul>
		</c:if>


		<div class="buttons">
			<ul>
				<li class="button"><a href="getDashboardByUser.do?gid=${group.id}">&nbsp;Message
						Board&nbsp;</a></li>
				<li class="button"><a href="tasks.do?gid=${group.id}">Tasks</a></li>
				<li class="button"><a href="shopping.do?gid=${group.id}">Shopping</a></li>
				<li class="button"><a href="events.do?gid=${group.id}">Events</a></li>
			</ul>
		</div>
</body>
	</div>
</html>