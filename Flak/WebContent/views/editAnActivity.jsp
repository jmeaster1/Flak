<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- form --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<title>Flak | stay connected.</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">


<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cabin+Sketch|Special+Elite"
	rel="stylesheet">


<link rel="stylesheet" type="text/css" href="styles/style.css" />

<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

</head>
<body class="login_body">
	<h1 class="header_class">
		<!-- login.jsp -->
	</h1>
	<div class="login_container">
		<div class="login_content4">
			<form action="saveActivity.do" method="post">
				<input type="hidden" name="aid" value="${activity.id}"></input> <input
					type="hidden" name="gid" value="${group.id}"></input> Name: <input
					name="name" value="${activity.name}"></input><br> Description:
				<input name="description" value="${activity.description}"></input><br>
				Type:<br> <select name="tid">
					<c:forEach var="type" items="${types}">
							<c:choose>
								<c:when test="${type.name == activity.type.name}">
									<c:set var="defaultOption" value=" selected"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="defaultOption" value=""></c:set>
								</c:otherwise>
							</c:choose>
							<option value="${type.id}" ${defaultOption}>${type.name}</option>
					</c:forEach>
				</select> <br><%-- Assigned: <input name="assigned" value="${activity.assigned}"></input> --%><br>
				Current Users:
				<c:forEach var="au" items="${aUsers}">
					<p>${au.username}</p>
				</c:forEach><br>
				Assign a User:<br> <select name="assignedUser">
					<c:forEach var="u" items="${users}">
					<c:choose>
						<c:when test="${u.username == user.username}">
							<c:set var="defaultOption" value=" selected"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="defaultOption" value=""></c:set>
						</c:otherwise>
					</c:choose>
						<option value="${u.id}" ${defaultOption}>${u.username}</option>
					</c:forEach>
				</select> <input type="submit" name="submit" value="Save"></input>
			</form>
		</div>
	</div>

</body>



<%-- <body>
		<div class="no-show">
			<h1>hide</h1>
		</div>
		
	<form action="saveActivity.do" method="post">
			<input type="hidden" name="aid" value="${activity.id}"></input>
			<input type="hidden" name="gid" value="${group.id}"></input>
			Name: <input name="name" value="${activity.name}"></input><br>
			Description: <input name="description" value="${activity.description}"></input><br>
			Type:
			<select name="tid">
				<c:forEach var="type" items="${types}">
					<option value="${type.id}">${type.name}</option>
				</c:forEach>
			</select>
			Assigned: <input name="assigned" value="${activity.assigned}"></input><br>
			Current Users:
				<c:forEach var="au" items="${aUsers}">
					<p>${au.username}</p>
				</c:forEach>
			Assign a User:
			<select name="assignedUser">
				<c:forEach var="u" items="${users}">
					<option value="${u.id}">${u.username}</option>
				</c:forEach>
			</select>
			<input type="submit" name="submit" value="Save"></input>
	</form>


</body> --%>
</html>