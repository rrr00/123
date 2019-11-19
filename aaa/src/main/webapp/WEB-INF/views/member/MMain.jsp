<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

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
<link href="../resources/css/style_back.css" rel="stylesheet" />


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

      <section>
         <div id="demo" class="carousel slide my-5" data-ride="carousel">
            <ul class="carousel-indicators">
               <li data-target="#demo" data-slide-to="0" class="active"></li>
               <li data-target="#demo" data-slide-to="1"></li>
               <li data-target="#demo" data-slide-to="2"></li>
               <li data-target="#demo" data-slide-to="3"></li>
            </ul>

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
      </section>

      <section>
         <div class="row mx-0">
            <div class="col w-50 card p-3 mr-3">
               <div class="card-header bg-white">
                  <label>구장 검색</label>
                  <a href="gsearch" class="pull-right">상세 검색 ></a>
               </div>
               <form action="gsearch" class="card-body" method="post" name="ground">
                  <div class="row form-group">
                     <label for="addr" id="la_addr" class="col-2">지역</label>
                     <input type="text" class="form-control col-9" id="addr" name="gaddr" placeholder="지역명 입력">
                  </div>
                  <div class="row form-group">
                     <label for="addr" id="la_addr" class="col-2">구장명</label>
                     <input type="text" class="form-control col-9" id="addr" name="gname" placeholder="구장명 입력">
                  </div>
                  <div class="row form-group">
                     <label for="btns" id="la_btns" class="col-2">사용여부</label>
                     <div class="btn-group btn-group-toggle p-0 col-9" data-toggle="buttons" id="btns">
                        <label class="btn btn-secondary"> 
                           <input type="radio" name="type" id="jb-radio-1" value="1">축구
                        </label> 
                        <label class="btn btn-secondary"> 
                           <input type="radio" name="type" id="jb-radio-2" value="2">풋살
                        </label>
                     </div>
                  </div>
                  <div class="my-3">
                     <input type="submit" class="btn btn-info pull-right" value="검색하기">
                  </div>
               </form>
            </div>
            <div class="col w-50 card p-3">
               <div class="card-header bg-white">
                  <label>게시판</label>
                  <a href="list" class="pull-right">더보기 ></a>
               </div>	
                  <div>
                  <div class="card-body">
 
                  		<table width="100%"
                     class="table  table-hover"
                     id="dataTables-example">
                     <thead>
                        <tr>
                           <th>번호</th>
                           <th>제목</th>
                           <th>작성자</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${list }" var="board">
                           <tr>
                              <td>${board.bno }</td>
                              <td>
                                 <a class="move" href="get?bno=${board.bno }"> [${board.tagname}]${board.title } <b>[${board.replycnt }]</b></a>
                              </td>
                              <td>${board.nic }</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  		
                  		
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>


   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"></script>

   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


   <script>
      $('.carousel').carousel({
         interval : 3500
      })
   </script>



</body>


</html>