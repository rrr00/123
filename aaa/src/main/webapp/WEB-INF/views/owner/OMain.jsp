<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="../resources/css/style_back.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

    <link href="../resources/css/style_nav.css" rel="stylesheet" />
    <!-- 로그인/회원가입 제외 배경이미지 -->
    <!--구ㅜㅜㅜㅜㅜㅜㅜㅜㅜ장ㅇㅇㅇㅇ멩ㅇㅇ인ㄴㄴㄴㄴㅣㅣㅣ에ㅔㅔㅔ스ㅡㅡㅡㅡ에ㅔㅔㅔ스ㅡㅡ-->
    <link href="../resources/css/style_omain.css" rel="stylesheet" />

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>


    <!-- Bootstrap Core CSS -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
      <jsp:include page="../nav_top.jsp" />
   </div>
<!--구장 메인-->
    <div class="container h-100">
        <div class="panel panel-default row h-100">

            <!-- 등록 버튼-->

            <div id="omain_1" class="panel-body col-6 h-100 p-0">
                <a href="gregister">
                    <div class="text-center h-100 d-flex justify-content-center align-items-center"
                        style="background-image: url(../resources/img/omain1.jpg); background-size:cover; background-repeat:no-repeat">
                        등록
                    </div>
                </a>
            </div>


            <!-- 예약현황 버튼-->

            <div class="panel-body col-6 h-100 p-0" id="omain_2">
                <a href="resCheck">
                    <div class="text-center h-100 d-flex justify-content-center align-items-center"
                        style="background-image: url(../resources/img/omain2.jpg); background-size:cover; background-repeat:no-repeat">
                        예약확인
                    </div>
                </a>
            </div>

        </div>
    </div>


</body>

<script>
    $(function () {
        $('#omain_1').hover(function () {
            $('#omain_2').css('opacity', '0.5');
        }, function () {
            // on mouseout, reset the background colour
            $('#omain_2').css('opacity', '');
        });
    });

    $(function () {
        $('#omain_2').hover(function () {
            $('#omain_1').css('opacity', '0.5');
        }, function () {
            // on mouseout, reset the background colour
            $('#omain_1').css('opacity', '');
        });
    });
</script>


</html>