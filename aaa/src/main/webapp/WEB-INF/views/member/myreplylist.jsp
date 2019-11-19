<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

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
            <h3>내 댓글 보기</h3>
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


<!-- 댓글 리스트 -->
            <div class="col-lg-10 col-xs-10">
               <div class="col-lg-10">
                  <table width="100%" class="table table-striped table-bordered table-hover" id="datalist">
                     <thead>
                        <tr>
                           <th>게시물 제목</th>
                           <th>댓글 내용</th>
                           <th>날짜</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${rlist }" var="reply">
                           <tr>
                              <td><a  href="board/get?bno=${reply.bno }">[${reply.tagname}]${reply.title }</a></td>
                              <td>${reply.recontent }</td>
                              <td><fmt:formatDate value="${reply.redate }" pattern="yy/MM/dd" /></td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>

            
            <!-- 페이징 -->
            <div class="pull-right">
               <ul class="pagination">
                  <c:if test="${pageMaker.prev }">
                     <li class="paginate_button previous">
                        <a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous"> 
                           <span aria-hidden="true">&laquo;</span> 
                           <span class="sr-only">Previous</span>
                        </a>
                     </li>
                  </c:if>

                  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
                     <li class="paginate_button ${pageMaker.cri.pageNum==num?"active":"" }">
                        <a href="${num }">${num }</a>
                     </li>
                  </c:forEach>

                  <c:if test="${pageMaker.next }">
                     <li class="paginate_button next">
                        <a class="page-link" href="${pageMaker.endPage+1 }" aria-label="Next"> 
                           <span aria-hidden="true">&raquo;</span> 
                           <span class="sr-only">Next</span>
                        </a>
                     </li>
                  </c:if>
               </ul>
            </div>

            
            
         </div>
      </div>
</body>

    <script type="text/javascript">
        $(document)
            .ready(function () {
                var actionForm = $("#actionForm");
                var searchForm = $("#searchForm");

                $("#regBtn").on("click", function () {
                    self.location = "write"
                });

                $(".paginate_button a").on("click", function (e) {
                    e.preventDefault(); //클릭해서 넘어가는걸 막음(이게 없다면  board/bno의 경로로 이동)
                    console.log('click');
                    actionForm
                        .find("input[name='pageNum']")
                        .val($(this).attr("href")); //a가 여러개인데 내가 클릭한 a태그
                    actionForm.submit();
                });
                $(".move").on("click", function (e) {
                    e.preventDefault();
                    actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
                    actionForm.attr("action", "get");
                    actionForm.submit();
                });
                $("#searchForm button").on("click", function () {
                    if (!searchForm.find("option:selected").val()) {
                        alert("검색 종류를 선택하세요");
                        return false;
                    }

                    if (!searchForm.find("input[name='keyword']").val()) {
                        alert("키워드를 입력하세요");
                        return false;
                    }
                    searchForm.find("input[name='pageNum']").val("1");
                    e.preventDefault();
                    searchForm.submit();
                });
            });
    </script>

</html>