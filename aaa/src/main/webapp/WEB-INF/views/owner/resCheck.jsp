<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!--달력-->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript'
    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>



<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">



<meta charset="UTF-8">
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


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>공차자</title>
</head>

<body>

    <!--♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧네비 시작 ♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧-->
	<div class="container">
      <jsp:include page="../nav_top.jsp" />
   </div>
    <!--♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣네비 끝♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧♣♧-->


    <div class="container">
        <div class="card">
            <div class="card-header">
                <span>예약현황 보기</span>
            </div>

            <div class="card-body row">
                <!--왼쪽 화면-->
                <div class="col-4">
                    <div>
                        <div class="my-2">
                            <label>예약시간</label>
                        </div>
                        <div class="ml-3 row">
                            <div class="col-5 p-0">
                                <span>시작 시간: </span>
                                <input type="text" class="form-control" id="startdate">
                            </div>
                            <div class="col-5 p-0 ml-4">
                                <span>끝 시간: </span>
                                <input id="enddate" type="text" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="my-2">
                            <label>구장 선택</label>
                        </div>
                        <div class="ml-3">
                            <select class="form-control">
                                <option>---</option>
                                <option>축구장1</option>
                                <option>축구장2</option>
                            </select>
                        </div>
                    </div>

                    <div class="float-right my-4">
                        <input type="button" class="btn btn-info" value="검색하기">
                    </div>

                </div>

                <!--오른쪽 화면-->
                <div class="col-8">
                    <!--날짜별 예약현황 하루단위-->
                    <div class="card mb-2">
                        <div class="card-header">
                            <span>19년 9월 21일 - 축구장2</span>
                        </div>
                        <div class="card-body">
                            <table class="table" style="font-size:14px;">
                                <thead>
                                    <th>예약시간</th>
                                    <th>예약자</th>
                                    <th>수락여부</th>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>
                                            <span>06:00~08:00</span>
                                        </td>

                                        <td>
                                            <span>예약자1</span>
                                        </td>

                                        <td>
                                            <input type="button" name="" class="btn btn-success" value="수락">
                                            <input type="button" name="" class="btn btn-danger" value="거절">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span>08:00~10:00</span>
                                        </td>

                                        <td>
                                            <span>예약자1</span>
                                        </td>

                                        <td>
                                            <input type="button" name="" class="btn btn-success" value="수락">
                                            <input type="button" name="" class="btn btn-danger" value="거절">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span>10:00~12:00</span>
                                        </td>

                                        <td>
                                            <span>예약자2</span>
                                        </td>

                                        <td>
                                            <input type="button" name="" class="btn btn-success" value="수락">
                                            <input type="button" name="" class="btn btn-danger" value="거절">
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>


                    <!--날짜별 예약현황 하루단위-->
                    <div class="card mb-2">
                        <div class="card-header">
                            <span>19년 9월 22일 - 축구장2</span>
                        </div>
                        <div class="card-body">
                            <table class="table" style="font-size:14px;">
                                <thead>
                                    <th>예약시간</th>
                                    <th>예약자</th>
                                    <th>수락여부</th>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>
                                            <span>06:00~08:00</span>
                                        </td>

                                        <td>
                                            <span>예약자1</span>
                                        </td>

                                        <td>
                                            <input type="button" name="" class="btn btn-success" value="수락">
                                            <input type="button" name="" class="btn btn-danger" value="거절">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span>08:00~10:00</span>
                                        </td>

                                        <td>
                                            <span>예약자1</span>
                                        </td>

                                        <td>
                                            <input type="button" name="" class="btn btn-success" value="수락">
                                            <input type="button" name="" class="btn btn-danger" value="거절">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span>10:00~12:00</span>
                                        </td>

                                        <td>
                                            <span>예약자2</span>
                                        </td>

                                        <td>
                                            <input type="button" name="" class="btn btn-success" value="수락">
                                            <input type="button" name="" class="btn btn-danger" value="거절">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </div>
</body>


<script type='text/javascript'>

    $(function () {
        $('#startdate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
    });

    $(function () {
        $('#enddate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
    });

</script>


</html>