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

<div class="row">
	<div class="col-sm-2 content1-left">
		<h5>QUICK REFERENCE LIST</h5>
		<hr>
		<div class="inner-qrl-container">

			<!-- <ul> -->
			<li>Jimmy Easter <span class="numbers"><br>(304)552-0965</span></li>
			<br>
			<li>Denver Fire Dept. <span class="numbers"><br>(720)
					989-2000</span></li> <br>
			<li>Greenwood Village PD<span class="numbers"><br>(303)
					773-2525</span></li> <br>
			<li>WIFI Password<span class="numbers"><br>GetSkilled</span></li>
			<br>
			<li>Shanghai Kitchen<span class="numbers"><br>(303)
					290-6666</span></li> <br>
			<!-- </ul> -->


		</div>
		<form class="messages" action="index.html" method="post">
			<input type="text" name="qrlItem" value=""> <br> <br>
			&emsp; <input type="submit" name="submit" value="Add to QRL">
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
				<div class="msg_img">
					<img src="https://image.flaticon.com/icons/png/128/131/131155.png"
						alt="img">
				</div>
				<br>
				<hr>
				<c:if test="${not empty conversations}">
					<c:forEach var="convo" items="${conversations}">
						<li><a href="getConvos.do?cid=${convo.id}&gid=${group.id}">${convo.title}</a>
							<!-- Edit Thread Method --> <c:if test="${user.admin}">
								<a href="editThread.do?cid=${convo.id}&gid=${group.id}"> <input
									type="submit" name="submit" value="Edit Thread" /></a>
							</c:if></li>
					</c:forEach>
					<form class="messages" action="newThread.do" method="post">
						<input type="hidden" name="gid" value="${group.id}"></input> <input
							id="input_bar" type="text" name="newthread" value="">
						<!-- <input type="text" style="width: 500px;" name="message" value=""> -->
						<input type="submit" name="submit" value="New Thread">
					</form>
				</c:if>
				<c:if test="${not empty posts}">
					<c:forEach var="post" items="${posts}">
						<p>${post.timestamp}</p>
						<div class="message_display">
							<span class="username">${post.user.username}:</span>&emsp;&emsp;${post.message}
						</div>
					</c:forEach>

					<!-- Add New Message Form - Only within a thread -->
					<form class="messages" action="newPost.do" method="post">
						<input type="hidden" name="gid" value="${group.id}"></input> <input
							type="hidden" name="cid" value="${cid}"></input> <input
							type="text" style="width: 400px;" name="message" value="">
						<input type="submit" name="submit" value="Post">
					</form>
					<br>
					<a href="getDashboardByUser.do?gid=${group.id}">See All Threads</a>
				</c:if>
				<!-- Message Image -->


			</div>
			<div id="menu1" class="tab-pane fade">
				<h3>Tasks</h3>
				<div class="msg_img">
					<img src="https://image.flaticon.com/icons/png/128/1/1560.png"
						alt="img"> 
				</div>
				<br>
				<br>

				<hr>
				<p>TASKS WILL BE DISPLAYED HERE.</p>
				<c:if test="${not empty tasklist}">
					<table>
						<c:forEach var="item" items="${tasklist}">
							<tr>
								<td>${item.name}</td>
								<td>${item.description}</td>
								<td><a
									href="editActivity.do?aid=${item.id}&gid=${group.id}"><input
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



			</div>

			<div id="menu2" class="tab-pane fade">
				<h3>Shopping</h3><div class="msg_img">
					<img
						src="data:image/png;base64,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"
						alt="img">
				</div>
				<br>
				<br>
				<hr>
				<p>SHOPPING LIST WILL BE DISPLAYED HERE.</p>
				<c:if test="${not empty shoplist}">
					<table>
						<c:forEach var="item" items="${shoplist}">
							<tr>
								<td>${item.name}</td>
								<td>${item.description}</td>
								<td><a
									href="editActivity.do?aid=${item.id}&gid=${group.id}"><input
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
				
			</div>

			<div id="menu3" class="tab-pane fade">
				<h3>Events</h3>
				<hr>
				<p>Events WILL BE DISPLAYED HERE.</p>
				<c:if test="${not empty eventlist}">
					<table>
						<c:forEach var="item" items="${eventlist}">
							<tr>
								<td>${item.name}</td>
								<td>${item.description}</td>
								<td><a
									href="editActivity.do?aid=${item.id}&gid=${group.id}"><input
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