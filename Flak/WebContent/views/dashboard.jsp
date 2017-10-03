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
<div class="dashboard_container">
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
					</ul>
				</div>
			</div>
</div>
</nav>

<div class="row">
	<div class="col-sm-2 content1-left">
		<h5>QUICK REFERENCE LIST</h5>
		<hr>
		<div class="inner-qrl-container">

			<!-- <ul> -->
			<li>Jimmy Easter <span class="numbers"><br>(304)552-0965</span></li>
			<br>
			<li>Denver Fire Dept. <span class="numbers"><br>(720)
					989-2000</span></li>
			<br>
			<li>Greenwood Village PD<span class="numbers"><br>(303)
					773-2525</span></li>
			<br>
			<li>WIFI Password<span class="numbers"><br>GetSkilled</span></li>
			<br>
			<li>Shanghai Kitchen<span class="numbers"><br>(303)
					290-6666</span></li>
			<br>
			<!-- </ul> -->


		</div>
		<form class="messages" action="index.html" method="post">
			<input type="text" name="qrlItem" value=""> <br>
			<br> &emsp; <input type="submit" name="submit"
				value="Add to QRL">
		</form>


		<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p> -->
	</div>
	<!-- <div class="col-sm-2 content1-center">This is the center</div> -->
	<div class="col-sm-10 content1-right">

		<!-- <h5>Message Board Goes Here! -->
		<br> <br> <br>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Message
					Board</a></li>
			<li><a data-toggle="tab" href="#menu1">Tasks</a></li>
			<li><a data-toggle="tab" href="#menu2">Shopping List</a></li>
			<li><a data-toggle="tab" href="#menu3">Events</a></li>
			<li><a data-toggle="tab" href="#menu4">Calendar</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>Message Board</h3>
				<hr>
				<c:if test="${not empty conversations}">
					<c:forEach var="convo" items="${conversations}">
						<li><a href="getConvos.do?cid=${convo.id}&gid=${group.id}">${convo.title}</a></li>
					</c:forEach>
				</c:if>
				<c:if test="${not empty posts}">
					<c:forEach var="post" items="${posts}">
						<p>${post.timestamp}</p>
						<span class="username">${post.user.username}:</span>&emsp;&emsp;${post.message}
					</c:forEach>
					<!-- Add New Message Form - Only within a thread -->
					<form class="messages" action="newPost.do" method="post">
						<input type="text" style="width: 500px;" name="message" value="">
						<input type="submit" name="submit" value="Post">
					</form>
					<br>
					<a href="getDashboardByUser.do?gid=${group.id}">See All Threads</a>
				</c:if>
				<!-- Message Image -->
				<div class="msg_img">
					<img
						src="http://icons.iconarchive.com/icons/scafer31000/bubble-circle-2/256/Message-icon.png"
						alt="img">
				</div>

			</div>
			<div id="menu1" class="tab-pane fade">
				<h3>Tasks</h3>
				<hr>
				<p>TASKS WILL BE DISPLAYED HERE.</p>
				<c:if test="${not empty list}">
					<table>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.name}</td>
								<td>${item.description}</td>
								<td><a
									href="selectActivity.do?aid=${item.id}&gid=${group.id}"><input
										type="submit" value="Edit" /></a></td>
								<c:if test="${user.admin}">
									<td><a
										href="deleteActivity.do?aid=${item.id}&gid=${group.id}"><input
											type="submit" value="Delete" /></a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<!-- Add a New Task Method Here -->
				<form class="messages" action="index.html" method="post">
					<input type="text" name="message" value=""> <input
						type="submit" name="submit" value="Add Task">
				</form>

				<div class="msg_img">
					<img
						src="https://freeiconshop.com/wp-content/uploads/edd/task-done-flat.png"
						alt="img">
				</div>

			</div>

			<div id="menu2" class="tab-pane fade">
				<h3>Shopping</h3>
				<hr>
				<p>SHOPPING LIST WILL BE DISPLAYED HERE.</p>
				<c:if test="${not empty list}">
					<table>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.name}</td>
								<td>${item.description}</td>
								<td><a
									href="selectActivity.do?aid=${item.id}&gid=${group.id}"><input
										type="submit" value="Edit" /></a></td>
								<c:if test="${user.admin}">
									<td><a
										href="deleteActivity.do?aid=${item.id}&gid=${group.id}"><input
											type="submit" value="Delete" /></a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<!-- Add Grocery Item Method -->
				<form class="messages" action="index.html" method="post">
					<input type="text" name="message" value=""> <input
						type="submit" name="submit" value="Add Grocery Item">
				</form>
				<div class="msg_img">
					<img
						src="http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons-256/3d-glossy-orange-orbs-icons-business/105233-3d-glossy-orange-orb-icon-business-cart4.png"
						alt="img">
				</div>
			</div>

			<div id="menu3" class="tab-pane fade">
				<h3>Events</h3>
				<hr>
				<p>Events WILL BE DISPLAYED HERE.</p>
				<c:if test="${not empty list}">
					<table>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.name}</td>
								<td>${item.description}</td>
								<td><a
									href="selectActivity.do?aid=${item.id}&gid=${group.id}"><input
										type="submit" value="Edit" /></a></td>
								<c:if test="${user.admin}">
									<td><a
										href="deleteActivity.do?aid=${item.id}&gid=${group.id}"><input
											type="submit" value="Delete" /></a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<!-- Add a New Event Method Here -->
				<form class="messages" action="index.html" method="post">
					<input type="text" name="message" value=""> <input
						type="submit" name="submit" value="Add Event">
				</form>

				<div class="msg_img">
					<img
						src="https://freeiconshop.com/wp-content/uploads/edd/task-done-flat.png"
						alt="img">
				</div>

			</div>
			
			
			<div id="menu4" class="tab-pane fade">
				<h3>Calendar</h3>
				<hr>

				<!-- <iframe src="https://calendar.google.com/calendar/embed?src=jmeaster1%40gmail.com&ctz=America/Chicago" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe> -->
				<div class="googleCalendar">
					<iframe
						src="https://calendar.google.com/calendar/embed?title=Put%20your%20Title%20here&amp;showCalendars=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23ffffff&amp;src=8d3fc8l9g04n7r9im45fsn08ak%40group.calendar.google.com&amp;color=%238D6F47&amp;ctz=America%2FDenver"
						style="border-width: 0" width="800" height="600" frameborder="0"
						scrolling="no"></iframe>
				</div>

			</div>
		</div>
		</h5>


	</div>

	</article>
</div>


</section>




</div>

</div>
<div class="footer_bar">{footer}</div>
<div id="footer">

	<div id="footer-content"></div>

</div>
</body>

</html>







<%-- <div class="no-show">
	<h1>hide</h1>
</div>


<c:if test="${not empty conversations}">
	<ul>
		<c:forEach var="convo" items="${conversations}">
			<li><a href="getConvos.do?cid=${convo.id}&gid=${group.id}">${convo.title}</a></li>
		</c:forEach>
	</ul>
</c:if>

<c:if test="${not empty list}">
	<table>
		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.name}</td>
				<td>${item.description}</td>
				<td><a href="selectActivity.do?aid=${item.id}&gid=${group.id}"><input
						type="submit" value="Edit" /></a></td>
				<c:if test="${user.admin}">
					<td><a href="deleteActivity.do?aid=${item.id}&gid=${group.id}"><input
							type="submit" value="Delete" /></a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</c:if>


<div class="buttons">
	<ul>
		<li class="button"><a
			href="getDashboardByUser.do?gid=${group.id}">&nbsp;Message
				Board&nbsp;</a></li>
		<li class="button"><a href="tasks.do?gid=${group.id}">Tasks</a></li>
		<li class="button"><a href="shopping.do?gid=${group.id}">Shopping</a></li>
		<li class="button"><a href="events.do?gid=${group.id}">Events</a></li>
	</ul>
</div>
</body>
</div>
</html> --%>