<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- <link rel="stylesheet" type="text/css" href="styles/style.css" /> -->
<%-- <link href="<c:url value="styles/style.css" />" rel="stylesheet"/> --%>

<nav class="navbar navbar-inverse navbar-fixed-top">

<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar" name="button">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.do"> <span class="logoF">F</span><span
			class="logoL">L</span><span class="logoA">A</span><span class="logoK">K</span></a>
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
								<li><a href="getDashboardByUser.do?id=${group.id}">${group.name}
								</a></li>
								<br />
							</c:forEach>
						</c:if>
							</ul> 
					<li><a href="login.do">LOGIN</a></li>
				</ul>
			</ul>
		</div>
	</div>
</div>
</nav>

