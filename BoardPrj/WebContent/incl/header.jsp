<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="domain.MemberVO"%>
<nav id="top-menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
      <a class="navbar-brand" href="./index.jsp"><img src="./img/logo-top.png" class="img-responsive"><span>Home</span></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
   
      <!--nav icon--> 
      <a id="nav-icon"> <span></span> <span></span> <span></span> </a> 
      <!--nav icon end-->
      <c:choose>
      <c:when test="${!empty member}">
      <ul id="nav-top" class="nav navbar-nav navbar-right">
        <li><a href="/M3/Board.do?action=list" class="page-scroll">글 목록</a></li>
        <li><a href="/M3/Login.do?action=logout" class="page-scroll">로그아웃</a></li>
        <li><a href="/M3/Board.do?action=member" class="page-scroll">마이페이지</a></li>
      </ul>      
      <c:if test="${!empty userid }">
        <br><BR><BR><BR><font size=3 color="white"><B>${userid}님 환영합니다.</B></font>
       </c:if>
		</c:when>
	<c:when test="${empty member}">
	<ul id="nav-top" class="nav navbar-nav navbar-right">
	<li><a href="/M3/Member.do?action=insert" class="page-scroll">회원가입</a>
        <li><a href="/M3/login.jsp" class="page-scroll">로그인</a></li>
        </ul>  
	</c:when>
	</c:choose>
           <nav class="bottom-nav">
          <ul>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Pricing</a></li>
          </ul>
        </nav>
          
          <ul class="social-link">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
        </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>