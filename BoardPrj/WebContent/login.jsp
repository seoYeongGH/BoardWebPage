<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인 화면</title>
<%@ include file="/incl/staticHeader.jsp"%>
</head>
<body class="page">
	<%@ include file="/incl/header.jsp"%>
	<div id="page-banner">
		<div class="content  wow fdeInUp">
			<div class="container ">
				<h1>Login</h1>
			</div>
		</div>
	</div>
	<div id="page-body">
		<div class="container">
			<div class="row wow fdeInUp">
				<!--blog posts container-->
				<div class="col-md-12 page-block">
				<c:if test="${!empty message}">
				${message}
				</c:if>
				<h2></h2>
					<h3>로그인 페이지</h3>
					<form action='<c:url value="/Login.do"/>' method="post">
						아이디: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userid" ><br>
						비밀번호: &nbsp;<input type="password" name="password"><br><br>
				<input style="width:290px" type="submit" value="로그인">
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/incl/footer.jsp"%>
</body>
</html>