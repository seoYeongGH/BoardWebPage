<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력</title>
<%@ include file="/incl/staticHeader.jsp" %>
</head>
<body class="page">
<%@ include file="/incl/header.jsp" %>
	<div id="page-banner"
		style="background-image: url(img/photo-typo.jpg);">
		<div class="content  wow fdeInUp">
			<div class="container ">
				<h1>${message}</h1>
			</div>
		</div>
	</div>
	<div id="page-body">
		<div class="container">
			<div class="row">
				<!--blog posts container-->
				<div class="col-md-offset-3 col-md-6 page-block">
<h3 align=center>회원 정보 입력</h3>
<form action="/M3/Member.do" method="post">
<fieldset>
<legend>회원 정보 <span style="font-size:12px">( *은 필수항목입니다.)</span></legend>
<table class="table table-striped table-bordered">
<tr>
	<td >*아이디</td>
	<td ><input type="text" name="userid" id="userid"
	value = "${member.userid}" ${empty member.userid ? "": "readonly"}>
	<button style="border-radius:0; color:dark-gray; float:right;" id="checkId" onclick="return checkUserId()">중복 확인</button></td>
</tr>
<tr>
	<td >*비밀번호</td>
	<td ><input type="password" name="password" id="password" value="${member.password}"/>
	<span class="pw_check" id="pw" style="display:none; color:red;">4~12의 길이로 입력해주세요.</span></td>
</tr>
<tr>
	<td >*비밀번호 확인</td>
	<td ><input type="password" id="pw_confirm" />
	<span class="pw_check"  id="repeat" style="display:none; color:red;">비밀번호가 일지하지 않습니다.</span></td>
</tr>
<tr>
	<td >*이름</td>
	<td ><input type="text" name="name" id="name"
	value="${member.name}"></td>
</tr>
<tr>
	<td >*이메일</td>
	<td ><input type="text" name="email" id="email"
	value="${member.email}"></td>
</tr>
<tr >
	<td >주소</td>
	<td><textarea name="address" cols="2">${member.address}</textarea></td>
</tr>
</table>
	<input type="hidden" name="action" value="${action}" >
	<input type="submit" value="저 장" id="submit" onClick="return submitCheck()">
	<input type="reset" value="취 소">
</fieldset>
</form>
<script type="text/javascript" src="js/checkMemberform.js"></script>
</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<%@ include file="/incl/footer.jsp" %>
</body>
</html>