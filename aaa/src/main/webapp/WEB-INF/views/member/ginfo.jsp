<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
   integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
   integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript'
    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>

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

<!-- 네비바 호버/색상 -->
<link href="../resources/css/style_nav.css" rel="stylesheet" />
<!-- 로그인/회원가입 제외 배경이미지 -->
<link href="../resources/css/style_back.css" rel="stylesheet" />
<link href="../resources/css/style_ginfo.css" rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<title>공차자 구장정보</title>
</head>
<body>
<div class="container">
   <jsp:include page="../nav_top.jsp" />
   <section class="form-group">
      <div class="card p-3">
         <div class="card-header bg-white ">
            <label>구장 상세 정보</label>
         </div>
         <form action="revInsert" method="POST" id="insertForm" name="rev">
            <input type="hidden" name="gno" value=${ginfo.gno }>
            <input type="hidden" name="ono" value=${ginfo.ono }>
         <div class="card-body">
            <div class="row">
               <div id="demo" class="carousel slide mt-3 col-lg-6 col-md-12" data-ride="carousel">                  
                  <!-- 게시글 사진 들어갈 곳 -->
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <img class="d-block w-100" height="300px"
                           src="../resources/img/carousel1.jpg" alt="First slide">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" height="300px"
                           src="../resources/img/carousel2.jpg" alt="Second slide">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" height="300px"
                           src="../resources/img/carousel3.jpg" alt="Third slide">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" height="300px"
                           src="../resources/img/carousel4.jpg" alt="Fourth slide">
                     </div>
                  </div>
         
                  <a class="carousel-control-prev" href="#demo" data-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                     <span class="sr-only">Previous</span>
                  </a> <a class="carousel-control-next" href="#demo" data-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                  </a>
               </div>
               
               <!-- 구장 정보 시작 -->
               <div class="col-lg-6 mt-3 col-md-12" id="ground_info">
                  <div class="row form-group">
                     <label class="col-2">구장이름</label>
                     <label class="col-8">
                        ${ginfo.gname }
                        <input type="hidden" name="gname" value="${ginfo.gname }">
                     </label>
                  </div>
                  <div class="row form-group">
                     <label class="col-2">구장종류</label>
                     <label class="col-8">
                        <c:choose>
                           <c:when test="${ginfo.type == 1 }">축구</c:when>
                           <c:when test="${ginfo.type == 2 }">족구</c:when>                           
                        </c:choose>
                     </label>
                  </div>
                  <div class="row form-group">
                     <label class="col-2">구장주소</label>
                     <label class="col-8">
                        ${ginfo.gaddr }
                        <input type="hidden" name="gaddr" value="${ginfo.gaddr }">
                     </label>
                  </div>
                  <div class="row form-group comfort">
                     <label class="col-2">편의 시설</label>
                     <div class="col-8">
                        <c:forEach items="${cnameList }" var="cname">
                           <span class="label label-info mb-2">${cname }</span>
                        </c:forEach>
                     </div>
                  </div>
                  <div class="row form-group">
                     <label class="col-2">대여비용</label>
                     <label class="col-8">${ginfo.money }원</label>
                  </div>
                  <div class="row form-group">
                     <label class="col-2">예약날짜</label>
                     <input type="text" class="col-8 form-control" id="rdate" name="rdate" placeholder="클릭하여 날짜를 선택해주세요">
                  </div>
                  <div class="row">
                     <label class="col-2 pt-2">예약시간</label>
                     <div class="btn-group btn-group-toggle col-8" data-toggle="buttons" id="booktime">
                        <c:forEach items="${chkRstime }" var="rstime" varStatus="status">
                           <c:choose>
                              <c:when test="${rstime.rstime == 0 || rstime.rcheck == 3 || rstime.rcheck == 4}">
                                 <label class="btn btn-outline-secondary mr-2 mb-2"> 
                                    <input type="checkbox" value="${status.count }" id="revChk" name="rstime_arr" class="chk">${rstime.ttime }:00~${rstime.ttime+2 }:00
                                 </label>
                              </c:when>
                              <c:when test="${rstime.rcheck == 1 || rstime.rcheck == 2}">
                                 <label class="btn btn-outline-danger mr-2 mb-2 disabled"> 
                                    <input type="checkbox" value="${status.count }">예약 완료
                                 </label>
                              </c:when>
                           </c:choose>
                        </c:forEach>                        
                     </div>
                  </div>
               </div>               
               <div class="row pl-4 ml-auto form-group">
                  <input type="button" class='btn btn-success mr-2' value="메인으로" onclick="location.href='/Main'">
                  <input type="button" class='btn btn-info mr-2' value="목록가기" onclick="location.href='/gsearch'">
                  <input type="button" id='rev_btn' class='btn btn-danger mr-5' value="예약하기">                                    
               </div>
            </div>
            <!-- 구장 정보 끝 -->
            <div class="p-3">
            <c:forEach items="${rcheck }" var="rcheck" varStatus="status">
               <c:if test="${not doneLoop }">
               <c:if test="${rcheck == 2 }">
                  <hr>
                     <div class="row pl-4 form-group d-block">
                        <input type="text" class="form-control w-25" value="${info.mname }" readonly>
                     </div>
                     <div class="row pl-4">
                        <textarea rows="3" col="50" class="col-9"></textarea>
                        <input type="button" class="btn btn-info col-2 ml-3" id="review_btn" value="리뷰쓰기">
                     </div>
                     <c:set var="doneLoop" value="true"/>
                   </c:if>
                </c:if>
            </c:forEach>
            </div>
         </div>
         </form>
      </div>
   </section>
   
   <section>
      <div class="card mb-4">
         <div class="card-header">
            <label>Review</label>
         </div>
         <div class="card-body">
            <c:forEach items="${reviewList }" var="review">
               <div class="row">
                  <div class="col-2">
                     <span><i class="fas fa-user-circle"></i></span>
                     <label class="ml-1">${review.nic }</label>
                  </div>
                  <label class="col-6">${review.view_text }</label>
                  <label class="col-3">${review.view_date }</label>
               </div>
               <hr>
            </c:forEach>
         </div>            
      </div>
   </section>
   <div class="rePopup">
      <div id="reWindow" class="card p-2">
         <div class="card-header">
            <label>예약 정보 확인</label>
            <span class="pull-right" id="closeBtn"><i class="fas fa-times text-secondary fa-lgx"></i></span>
         </div>         
         <div class="card-body">
            <div class="row form-group">
               <label class="col-2">구장이름</label>
               <label class="col-9 form-control">
                  ${ginfo.gname }
               </label>
            </div>
            <div class="row form-group">
               <label class="col-2">구장주소</label>
               <label class="col-9 form-control">
                  ${ginfo.gaddr }
               </label>
            </div>
            <div class="row form-group">
               <label class="col-2">예약자</label>
               <label class="col-9 form-control">
                  ${info.mname }
               </label>
            </div>
            <div class="row form-group" id="divRstime">
               <label class="col-2">예약날짜</label>
               <label class="col-9 form-control" id="rdateLabel">
               </label>
            </div>
            <div class="row form-group" id="divRstime">
               <label class="col-2">예약시간</label>
               <label class="col-9 form-control" id="rstimeLabel">
               </label>
            </div>
         </div>
         <div class="card-footer text-center">
            <input type="button" id="okBtn" class="w-25 btn btn-danger btn-info mr-2" value="확인">
            <input type="button" id="cancelBtn" class="w-25 btn btn-info" value="취소">
         </div>
      </div>
   </div>
</div>



<script type="text/javascript">
   $("#closeBtn").on("click", function(e) {
      $(".rePopup").hide();
   })
   $("#okBtn").on("click", function(e) {
      $(".rePopup").hide();
   })
   $("#cancelBtn").on("click", function(e) {
      $(".rePopup").hide();
   })
   $(document).ready(
      function() {
         var insertForm = $("#insertForm");         
         
         $(".rePopup").hide();
         $("#rev_btn").on("click", function() {
            if($("#rdate").val() == "") {
                alert("예약날짜를 선택해주세요");
             }else if($('input:checkbox[id="revChk"]:checked').length == 0) {
               alert("예약시간을 선택해주세요");
            }else {                  
               var rstime = $('input:checkbox[id="revChk"]:checked').parent('label').text();
               $('#rstimeLabel').text(rstime);
               $('#rdateLabel').text($("#rdate").val());
               
               $(".rePopup").show();
            }
         })
         $("#okBtn").on("click", function() {
             insertForm.submit();
         })
      }
   )
   $(function () {
      var sysdate = new Date();
      console.log(sysdate);
        $('#rdate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            minDate: sysdate,
            autoclose: true,
            format: "yy/mm/dd",
            language: "kr"
        });
    });
</script>
</body>
</html>