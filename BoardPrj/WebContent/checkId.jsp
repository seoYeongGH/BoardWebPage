<%@ page import="domain.CheckIdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		CheckIdDAO checkDao = new CheckIdDAO();
		boolean exist = checkDao.checkId(id);

		if (exist) {
	%>
	(<span style="color: red;"><%=id%></span>) 는 이미 사용중인 아이디입니다.
	<br> 다른 아이디를 사용해주세요.<br>
	
	<script type="text/javascript">
		opener.document.getElementById("userid").value = "";
	</script>
	<%
		} else {
	%>
	입력하신 아이디(<span style="color: green;"><%=id%></span>)는 사용가능한 아이디 입니다.<br><br>
	<%
		}
	%>
<input type="button" value="확인" style="float:right;" onclick="close_popup()">

<script type="text/javascript">
	function close_popup() {
		window.open("", '_self', "");
		window.close();
	}
</script>
</body>
</html>