<%@page import="java.io.IOException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 목록</title>
<%@ include file="/incl/staticHeader.jsp" %>
</head>
<body class="page">
<%@ include file="/incl/header.jsp" %>
<div id="page-banner" >
  <div class="content  wow fdeInUp">
    <div class="container ">
      <h1>게시글 목록</h1>
    </div>
  </div>
</div>

<!--page body-->

<div id="page-body">
  <div class="container">
    <div class="row wow fdeInUp"> 
      <!--blog posts container-->
      <div class="col-md-12 page-block">
	<span style="font-size:20px;">List</span> 
	<button style="float:right;" onclick="location.href='/M3/Board.do?action=write'">Writing</button>
	<br><br>
	<table class="table table-striped table-bordered" style="text-align:right;">
	<thead >
	<tr>
	<th style="text-align:right;">작성자</th>
	<th style="text-align:right;">제목</th>
	<th style="text-align:right;">조회수</th>
	</tr>
	</thead>
		<c:forEach var="board" items="${lists}">
			<tr>
				<td>${board.name}</td>
				<td><a href='<c:url value="/Board.do?action=view&bbsno=${board.bbsno}&page=${page}"/>'>${board.subject}</a></td>
				<td>${board.readcount}</td>
			</tr>
		</c:forEach>
	</table>
			<h6 align="center">	<%
					Integer tempTotalPageCount = (Integer) pageContext.getAttribute("totalPageCount",
							PageContext.REQUEST_SCOPE);
			if (tempTotalPageCount == null)
				tempTotalPageCount = new Integer(1);
			Integer tempNowPage = (Integer) pageContext.getAttribute("page", PageContext.REQUEST_SCOPE);
			if (tempNowPage == null)
				tempNowPage = new Integer(1);
			int totalPageCount = tempTotalPageCount.intValue();
			int nowPage = tempNowPage.intValue();
			int totalPageBlock = (int) (Math.ceil(totalPageCount / 10.0));
			int nowPageBlock = (int) Math.ceil(nowPage / 10.0);
			int startPage = (nowPageBlock - 1) * 10 + 1;
			int endPage = 0;
			String contextName = pageContext.getServletContext().getServletContextName();
			if (contextName == null || contextName.trim().equals("")) {
				contextName = "";
			} else {
				contextName = "/" + contextName;
			}
			if (totalPageCount > nowPageBlock * 10) {
				endPage = nowPageBlock * 10;
			} else {
				endPage = totalPageCount;
			}
			try {
				if (nowPageBlock > 1) {
					out.print("<a href=\"" + contextName + "/M3/Board.do?page=" + (startPage - 1) + "&action=list\">");
					out.print("◀</a>");
				}
				for (int i = startPage; i <= endPage; i++) {
					out.print(" [");
					out.print("<a href=\"" + contextName + "/M3/Board.do?page=" + (i) + "&action=list\">");
					out.print(i);
					out.print("</a>] ");
				}
				if (nowPageBlock < totalPageBlock) {
					out.print("<a href=\"" + contextName + "/M3/Board.do?page=" + (endPage + 1) + "&action=list\">");
					out.print("▶</a>");
				}
			} catch (IOException ioe) {
				throw new JspException(ioe);
			} finally {
			}
				%>
				</h6>
				  </div>
      <!--blog posts container-->
      <div class="clearfix"></div>
    </div>
  </div>
</div>
	<%@ include file="/incl/footer.jsp" %>
	
</body>
</html>