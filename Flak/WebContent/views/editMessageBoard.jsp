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


			<c:if test="${not empty conversation}">
				<form action="saveThread.do" method="post">
					<input type="hidden" name="cid" value="${conversation.id}"></input>
					<input type="hidden" name="gid" value="${group.id}"></input> Title:<br>
					<input name="title" value="${conversation.title}"></input><br>
					<a><input type="submit" name="submit" value="Save Changes"></input></a>
				</form>
				<br>
		Posts:
		<c:forEach var="post" items="${posts}">
					<p>${post.timestamp}</p>
					<div class="message_display">
						<span id="user_span">${post.user.username}</span> <span
							id="message_span">${post.message}</span><br> <a
							href="editPost.do?pid=${post.id}&gid=${group.id}"> <br>
						<input type="submit" name="submit" value="Edit"></input></a> <a
							href="deletePost.do?pid=${post.id}&gid=${group.id}"> <input
							type="submit" name="submit" value="Delete"></input></a>

					</div>
				</c:forEach>
			</c:if>
			<c:if test="${not empty pid}">
				<form action="savePost.do" method="post">
					<input type="hidden" name="pid" value="${pid}"></input> <input
						type="hidden" name="gid" value="${group.id}"></input>
					<p>${post.timestamp}</p>
					<br> Message: <input name="message" value="${post.message}"></input><br>
					<input type="submit" name="submit" value="Save"></input>
				</form>
			</c:if>
</body>
</html>