<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 네비바 호버/색상 -->
<link href="../resources/css/style_nav.css" rel="stylesheet" />
<!-- 로그인/회원가입 제외 배경이미지 -->
<link href="../resources/css/style_back.css" rel="stylesheet" />
<!-- 마이페이지에서 색때문엥 사용함 -->
<link href="../resources/css/style_info.css" rel="stylesheet" />


<!--Bootsrap 4 CDN-->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
   integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
   crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
   integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
   crossorigin="anonymous">




<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/vendor/metisMenu/metisMenu.min.css"
   rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/vendor/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<meta charset="UTF-8">
<title>공차자</title>
</head>
<body>
   <div class="container">
      <jsp:include page="../nav_top.jsp" />
   </div>
   <div class="container">
      <div class="card">
         <div class="card-header">
            <h3>예약정보 확인</h3>
         </div>


         <div class="card-body table-responsive">

            <div class="col-lg-2 col-xs-2">
               <table width="100%" height="100%"
                  class="table table-bordered table-hover ">
                  <tr>
                     <td onclick="location.href='/myinfo'">내 정보 확인/수정</td>
                  </tr>
                  <tr>
                     <td onclick="location.href='/myres'">예약정보 확인</td>
                  </tr>
                  <tr>
                     <td onclick="location.href='/myboardlist'">내 게시글 보기</td>
                  </tr>
                  <tr>
                     <td onclick="location.href='/myreplylist'">내 댓글 보기</td>
                  </tr>
               </table>
            </div>

            <div class="col-lg-10 col-xs-10">
            
            <c:forEach items="${reslist }" var="reslist" varStatus="status">
            <form action="upResChk" id="upresck" method="get" name="res">
               <div class="row pl-3 mb-4">
                  <div  class="col-2">
                     <a href="ginfo?gno=${ground.gno }" class="glist"> 
                        <img src="../resources/img/carousel1.jpg" id="gimg" style="width: 130px; height: 120px">
                     </a>
                  </div>
                  
                  <div class="col-7">
                     <table class="mt-5">
                        <tr>
                           <td><label class="mr-2">구장명</label>${reslist.gname }</td>
                           <td><label class="mr-2">예약금액</label>${reslist.money }원</td>
                        </tr>
                        <tr>
                           <td>
                           		<label class="mr-2">예약날짜</label>
                           		<label id="rdateLabel">${reslist.rdate }</label>
                           </td>
                           
                           <td><label class="mr-2">예약시간</label>${reslist.ttime }:00~${reslist.ttime+2 }:00</td>                           
                        </tr>
                        <tr>
                           <td colspan="2"><label class="mr-2">구장주소</label>${reslist.gaddr }</td>
                        </tr>
                     </table>
                  </div>
                  
                  <div class="col-2 mt-5">
                     <table>
                        <tr><td><label>예약여부</label></td></tr>
                        <tr><td>
                        <input type="hidden" id="rstime${status.count }" value=${reslist.rstime } name="rstime">
                        <c:set var="rck" value="${reslist.rcheck }"></c:set>
                        <c:choose>
                           <c:when test="${rck == 1 }">
                              <button id="cancle" class="btn btn-info" onclick="$('#upresck').submit()">취소</button>
                           </c:when>
                           <c:when test="${rck == 3 }">
                              <span style="color:red" id="xx">거절됨</span>
                           </c:when>
                           <c:when test="${rck == 2 }">
                              <span style="color:green" id="oo">예약됨</span>
                           </c:when>
                           <c:when test="${rck == 4 }">
                              <span style="color:red" id="cancleok">취소됨</span>
                           </c:when>
                        </c:choose>
                        </td></tr>
                     </table>
                  </div>
               </div>
               <hr>
               </form>
               </c:forEach>               
               
            </div>
         </div>
      </div>
</body>


<script type="text/javascript">
	labelSubstr();
	function labelSubstr() {
		var rdate = $("#rdateLabel").text();
		rdate = rdate.substr(0,10);
		console.log(rdate);
	}
	
</script>
</html>