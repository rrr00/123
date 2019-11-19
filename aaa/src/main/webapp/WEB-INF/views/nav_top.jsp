<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<link href="../resources/css/style_nav.css" rel="stylesheet" />
<nav class="navbar navbar-default navbar-static-top w-100 p-0"
   role="navigation"
   style="background: linear-gradient(rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)), url('../img/bk-2.jpg'); background-size: cover, cover; background-repeat: no-repeat, no-repeat;">
   <div class="navbar-header w-50">
      <a class="navbar-brand p-0" href="Main"><img
         src="../resources/img/logo.png"></a>
   </div>
   <!-- /.navbar-header -->

   <ul class="nav navbar-top-links navbar-right justify-content-end w-50">
      <li class="nav-item"><a class="nav-link" href="#" id="nav_a">구장예약</a></li>
      <li class="nav-item"><a class="nav-link" href="list" id="nav_a">게시판</a></li>

      <li class="dropdown"><a class="dropdown-toggle"
         data-toggle="dropdown" href="myinfo" id="nav_a">마이페이지</a>
         <ul class="dropdown-menu dropdown-user">
            <li><a href="myinfo">내 정보</a></li>
            <li><a href="myres">예약정보 보기</a></li>
            <li><a href="myboardlist">내 게시물 보기</a></li>
            <li><a href="myreplylist">내 댓글 보기</a></li>
         </ul> <!-- /.dropdown-user --></li>
      <!-- /.dropdown -->

      <li class="nav-item"><a class="nav-link" href="logout" id="nav_a">로그아웃</a></li>
   </ul>
   <!-- /.navbar-top-links -->
</nav>