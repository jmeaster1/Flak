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


<link rel="stylesheet" type="text/css" href="styles/dashboard.css" />

<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

</head>

<body>
	<div class="no-show">
		<h1>hide</h1>
	</div>

	<form action="saveThread.do" method="post">
		<input type="hidden" name="cid" value="${conversation.id}"></input>
		<input type="hidden" name="gid" value="${group.id}"></input>
		Title: <input name="title" value="${conversation.title}"></input><br>
		Posts:
		<c:forEach var="post" items="${posts}">
			<p>${post.timestamp}</p>
			<div class="message_display">
				<span>${post.user.username}</span>
				<span>${post.message}</span><a href="editPost.do?pid=${post.id}&gid=${group.id}">
				<input type="submit" name="submit" value="Edit"></input></a>
			</div>
		</c:forEach>
		<input type="submit" name="submit" value="Save"></input>
	</form>

</body>
</html>