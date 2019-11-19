<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">



<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- 네비바 호버/색상 -->
<link href="../resources/css/style_nav.css" rel="stylesheet" />
<!-- 로그인/회원가입 제외 배경이미지 -->
<link href="../resources/css/style_back.css" rel="stylesheet" />
<!-- a태그 hover제거/img 크기 고정 -->
<link href="../resources/css/style_gsearch.css" rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>공차자</title>
</head>

<body>
    <div class="container">
        <jsp:include page="../nav_top.jsp"></jsp:include>
        <section>
            <form action="gsearch" method="post" name="ground">
                <div class="card mx-0 p-3">
                    <div class="card-header bg-white">
                        <label>구장 상세 검색</label>
                    </div>
                    <div class="card-body">
                        <div class="row form-group">
                            <label class="col-1">구장명</label>
                            <input type="text" name="gname" class="form-control col-10" style="margin-left: 15px;">
                        </div>
                        <div class="row form-group">
                            <label class="col-1">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label>
                            <input type="text" name="gaddr" class="form-control col-10" style="margin-left: 15px;">
                        </div>
                        <div class="row form-group">
                            <label class="col-1">구장종류</label>
                            <div class="btn-group btn-group-toggle col-10" data-toggle="buttons" id="btns">
                                <label class="btn btn-success">
                                    <input type="radio" name="type" id="jb-radio-1" value="1">축구
                                </label>
                                <label class="btn btn-success">
                                    <input type="radio" name="type" id="jb-radio-2" value="2">풋살
                                </label>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label class="col-1">편의시설</label>
                            <div class="btn-group-toggle col-10 form-inline" data-toggle="buttons">
                                <c:forEach items="${comflist }" var="comf" varStatus="status">
                                
                                   <c:if test="${status.getCount() == 7}">
                                        <input type="button" class="btn btn-info mr-2 mb-2" value="+" id="btn_etc">
                                        <div class="btn-group-toggle col-10 form-inline ml-0 px-0" id="comfort_etc">
                                    </c:if>
                                    
                                    <label class="btn btn-info mr-2 mb-2">
                                        <input type="checkbox" name="cno_arr" value="${comf.cno }">${comf.cname }
                                    </label>
                                    
	                                  <c:if test="${status.isLast() && status.getCount() > 6  }">
	                                    </div>
	                                  </c:if>
                                  	
                                  </c:forEach>
                           </div>
                       </div>
                       <div class="row form-group">
                           <label class="col-1">예약시간</label>
                           <select name="rstime" class="form-control col-3" align="center" style="margin-left: 15px;">
                               <option value="0">시작</option>
                               <c:forEach items="${timelist }" var="time" begin="0" end="7">
                                   <option value="${time.tno }">${time.ttime } : 00</option>
                               </c:forEach>
                           </select>
                           <label class="col-1 justify-content-center">&nbsp;~&nbsp;</label>
                           <select class="form-control col-3" name="retime">
                               <option value="0">끝</option>
                               <c:forEach items="${timelist }" var="time" begin="0" end="7">
                                   <option value="${time.tno }">${time.ttime +2} : 00</option>
                               </c:forEach>
                           </select>
                       </div>
                       <div class="row form-group">
                           <label class="col-1">대여비용</label>
                           <select name="money" class="form-control col-3" style="margin-left: 15px;">
                               <option value="0">---</option>
                               <option value="1">~2만원</option>
                               <option value="2">2만원~3만원</option>
                               <option value="3">3만원~4만원</option>
                               <option value="4">4만원~5만원</option>
                               <option value="5">5만원~</option>
                           </select>
                       </div>
                       <div class="row pull-right">
                           <input type="button" class="btn btn-success m-2" value="메인으로" id="mainBtn" onclick="location.href='/Main'">
                           <input type="submit" class="btn btn-info m-2" value="검색하기" id="searchBtn">
                       </div>
                   </div>
       </div>
       </form>
    <!-- 검색 누르면 구장 리스트 나오는 곳 -->

    <div class="card mx-0 p-3" id="searchResult">
        <div class="card-header bg-white">
            <label>구장 검색 결과</label>
        </div>
        <div class="card-body">
            <c:forEach items="${groundlist }" var="ground">
               <a href="ginfo?gno=${ground.gno }" class="glist">
                <div class="row pl-3 mb-4">                    
                    <img src="../resources/img/carousel1.jpg" class="col-3" id="gimg">
                    <div class="col-8">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>구장 이름</th>
                                    <th>대여비용</th>
                                    <th>주소</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${ground.gname }</td>
                                    <td>${ground.money }</td>
                                    <td>${ground.gaddr }</td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table">
                            <tr>
                                <c:forEach items="${timelist }" var="time" varStatus="vs" begin="0" end="7">
                                    <c:choose>
                                        <c:when test="${time.tno == 1 }">
                                            <td id="${vs.count }${ground.gno}" style="text-align:center;">
                                                0${time.ttime } ~ 0${time.ttime + 2}
                                        </c:when>
                                        <c:when test="${time.tno == 2 }">
                                            <td id="${vs.count }${ground.gno}" style="text-align:center;">
                                                0${time.ttime } ~ ${time.ttime + 2 }
                                        </c:when>
                                        <c:otherwise>
                                            <td id="${vs.count }${ground.gno}" style="text-align:center;">
                                                ${time.ttime } ~ ${time.ttime + 2 }
                                        </c:otherwise>
                                    </c:choose>
                                    <c:forEach items="${reslist }" var="rtime" varStatus="rvs">
                                        <c:if test="${ground.gno == rtime.gno}">
                                            <c:if test="${rtime.rstime == time.tno }">
                                                <script>
                                                    var ggno = '<c:out value="${ground.gno}"/>';
                                                    var rgno = '<c:out value="${rtime.gno}"/>';
                                                    console.log("g : " + ggno + " // r : " + rgno);
                                                    var idname = '<c:out value="${vs.count}"/>';
                                                    var realid = "" + idname + ggno;
                                                    document.getElementById(realid).style.color = "red";
                                                </script>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>
                        </table>
                    </div>
                </div>
                </a>
            </c:forEach>
        </div>
    </div>

    </section>
   </div>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $("#comfort_etc").hide();
        $("#btn_etc").on("click", function (e) {
            $("#comfort_etc").toggle();
        })
    </script>

</body>

</html>