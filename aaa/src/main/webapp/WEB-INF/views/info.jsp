<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <jsp:include page="./nav_top.jsp" />
   </div>
   <div class="container">
      <div class="card">
         <div class="card-header">
            <h3>회원 정보확인/수정</h3>
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
               <form action="join" method="POST" class="">

                  <table class="table" id="stytabel">
                     <tr>
                        <td><label>아이디</label></td>
                        <td><div class="row">
                              <input type="text" name="id" class="form-control col-8 ml-4" value="${info.id }"
                                 readonly>
                           </div></td>
                     </tr>

                     <tr>
                        <td><label>비밀번호</label></td>
                        <td><span><i class="fas fa-exclamation-circle"></i>
                              비밀번호는 8자 이상을 권장하며 변경을 원하지 않으면 그대로 두시면 됩니다.</span> <br>
                        <br>
                           <div class="form-inline">
                              <span>현재 비밀번호 </span>
                              <input type="password" name="pw" class="form-control ml-2">
                           </div>
                           <br>
                           <div class="form-inline">
                              <span>신규 비밀번호 </span><input type="password" class="form-control ml-2" id="newpw"  onkeyup="newpwck1();"> 
                              <span class="ml-2" id="newpwtext"></span>
                           </div>
                           <br>
                           <div class="form-inline" >
                              <span>비밀번호 확인 </span><input type="password" class="form-control ml-2"  id="newpwck" onkeyup="newpwck1();">
                           </div></td>
                     </tr>

                     <tr>
                        <td><label>이름</label></td>
                        <td><div class="row">
                              <input type="text" name="nam" class="form-control col-8 ml-4" value="${member == null? info.oname : info.mname}" readonly>
                           </div></td>
                     </tr>

                     <tr>
                        <td><label>전화번호</label></td>
                        <td><div class="row">
                              <input type="text" name="tel" class="form-control col-8 ml-4" value="${member == null? info.otel : info.mtel}">
                           </div></td>
                     </tr>

                     <tr>
                        <td><label>이메일</label></td>
                        <td><div class="row">
                              <input type="text" name="email" class="form-control col-8 ml-4" value="${member == null? info.oemail : info.memail}">
                           </div></td>
                     </tr>
					<c:if test="${member != null }">
                     <tr>
                        <td><label>닉네임</label></td>
                        <td>
                           <div class="form-inline">
                              <input type="text" name="nic" class="form-control" id="newnicdata" value="${member.nic }" onkeyup='newnicchk();'> 
                              <span class="ml-2" id="newnictext"></span>
                           </div>
                        </td>
                     </tr>
                     </c:if>
					<c:if test="${owner != null }">
                     <tr>
                        <td><label>주소</label></td>
                        <td>
                           <div id="nochange" class="form-inline row">
                              <input type="text" name="addr" class="form-control col-8 ml-4" value="${owner.addr }" readonly> 
                              <input type="button" id="popup" value="변경" class="btn ml-2">
                           </div>
                           <div id="change" style="display: none">
                              <div class="form-inline row">
                                 <input type="text" name="addr" class="form-control col-8 ml-4" readonly> 
                                 <input type="button" value="주소검색" class="btn ml-2">
                              </div>
                              <div>
                                 <div class="row">
                                    <input type="text" name="addr" class="form-control my-2  col-8 ml-4" readonly>
                                 </div>
                              </div>
                              <div class="form-inline">
                                 <input type="text" name="addr" class="form-control" readonly>
                                 <input type="text" name="addr" class="form-control ml-2" readonly>
                              </div>
                           </div>
                        </td>
                     </tr>
                     </c:if>

                  </table>

                  <div class="float-right">
                     <input type="submit" value="수정하기" id="update" class="btn btn-info mr-2"> 
                     <input type="button" value="뒤로가기" id="update" class="btn mr-2">
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</body>

<script type="text/javascript">
   $(document).ready(function() {
      $("#popup").on("click", function(e) {
         $("#change").css("display", "block");
         $("#nochange").css("display", "none");
      });
   });

   function newpwck1() {
      var pw = $('#newpw').val();
      var pwck = $('#newpwck').val();

      if (pw == pwck) {
         $('#newpwtext').text('비밀번호가 일치합니다.');
         $('#newpwtext').css('color', '#008000');
      } else {
         $('#newpwtext').text('비밀번호가 일치하지 않습니다.');
         $('#newpwtext').css('color', '#ff3333');
      }
   }

   function newnicchk() {
      $.ajax({
         type : 'POST',
         url : '/nicchk',
         data : {
            nic : $('#newnicdata').val()
         },
         success : function(data) {
            if (data == 'NO') {
               $('#newnictext').html("사용불가능");
               $('#newnictext').css('color', '#ff3333');
            } else if (data == 'OK') {
               $('#newnictext').html("사용가능");
               $('#newnictext').css('color', '#008000');
            }
         }
      });
   }
</script>
</html>