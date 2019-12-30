<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 작성 화면</title>
<%@ include file="/incl/staticHeader.jsp" %>
</head>
<body class="page">
<%@ include file="/incl/header.jsp" %>
	<div id="page-banner">
		<div class="content  wow fdeInUp">
			<div class="container">
				<h1>WRITING</h1>
			</div>
		</div>
	</div>
	<div id="page-body">
		<div class="container">
			<div class="row">
				<!--blog posts container-->
				<div class="col-md-offset-3 col-md-6 page-block">
					<h3 align=center>글 내용을 작성해주세요.</h3>
					<form action='<c:url value="/Board.do"/>' method="post">
						<table class="table table-striped table-bordered">
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" value="${member.name}" readonly></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" value="${member.email}" readonly></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="password"
									value="${board.password}"></td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type="text" name="subject" size="20"
									value="${board.subject}"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea cols="30" rows="5" name="content">${board.content}</textarea></td>
							</tr>

							<tr>
								<td colspan="2"><input type="hidden" name="action"
									value="${action}"> <input type="hidden" name="bbsno"
									value="${board.bbsno}"> <input type="hidden"
									name="masterid" value="${board.masterid}"> <input
									type="hidden" name="replynumber" value="${board.replynumber}">
									<input type="hidden" name="replystep"
									value="${board.replystep}"> <input type="submit"
									value="저 장"> <input type="reset" value="취 소"></td>
							</tr>
						</table>
					</form>
					<!--blog posts container-->

				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<%@ include file="/incl/footer.jsp" %>
</body>
</html>