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
		<div class="no-show">
			<h1>hide</h1>
		</div>
		
	<form action="save.do" method="post" modelAttribute="task">
			<input type="hidden" name="id" value="${activity.id}"></input>
			Name: <input name="item" value="${activity.name}"></form><br>
			Description: <input name="description" value="${activity.description}"></form><br>
			Type:
			<select value="${}">
				<c:forEach var="type" items="${}">
					<option value="${type}">${type}</option>
				</c:forEach>
			</select>
			Assigned: <form:input path="priority" name="priority" value="${activity.assigned}"></form:input><br>
			<input type="submit" name="submit" value="Save"></input>
		</form>


</body>
	</div>
</html>