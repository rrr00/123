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
      <jsp:include page="../nav_top.jsp" />
   </div>

     <div class="container">
        <section>
            <form action="gregister" method="post" enctype="multipart/form-data" name="ground">
                <div class="card mx-0 p-3">
                    <div class="card-header bg-white">
                        <label>구장 등록</label>
                    </div>
                    <div class="card-body">

                        <div class="row form-group">
                            <label class="col-2">구장명</label>
                            <input type="text" name="gname" id="gname" class="form-control col-9 ml-4" style="margin-left: 15px;">
                        </div>

                        <div class="row form-group">
                            <label class="col-2">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label>
                            <div class="form-group col-9" id="addr">
                                <div class="form-inline row">
                                    <input type="text" name="zipNo" id="zipNo" class="form-control col-8" style="margin-left: 15px;">
                                    <input type="button" value="주소검색" class="btn ml-2 btn-info" onclick="goPopup();">
                                </div>
                                <div>
                                    <div class="row">
                                        <input type="text" name="roadAddrPart1" id="roadAddrPart1" class="form-control my-2 col-8" style="margin-left: 15px;">
                                    </div>
                                </div>
                                <div class="form-inline row">
                                    <input type="text" name="addrDetail" id="addrDetail"class="form-control col-4" style="margin-left: 15px;">
                                    <input type="text" name="roadAddrPart2" id="roadAddrPart2" class="form-control col-4 ml-2">
                                </div>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-2">구장종류</label>
                            <div class="btn-group btn-group-toggle col-9" data-toggle="buttons" id="btns">
                                <label class="btn btn-success">
                                    <input type="radio" name="type" id="jb-radio-1" value="1">축구
                                </label>
                                <label class="btn btn-success">
                                    <input type="radio" name="type" id="jb-radio-2" value="2">풋살
                                </label>
                            </div>
                        </div>

                        <div class="row form-group">
                            <label class="col-2">편의시설</label>
                            <div class="btn-group-toggle col-9 form-inline" id="comfort" data-toggle="buttons">
                                <c:forEach items="${comflist }" var="comf" varStatus="status">
                                
                                   <c:if test="${status.getCount() == 7}">
                                        <input type="button" class="btn btn-info mr-2 mb-2" value="+" id="btn_etc">
                                        <div class="btn-group-toggle col-10 form-inline ml-0 px-0" id="comfort_etc">
                                    </c:if>
                                    
                                    <label class="btn btn-info mr-2 mb-2">
                                        <input type="checkbox" name="cno_arr" value="${comf.cno }">${comf.cname }
                                    </label>
                                    
	                                  <c:if test="${status.isLast() && status.getCount() > 6  }">
	                                  		<input type="button" class="btn btn-info mr-2 mb-2" value="기타" id="cAddBtn">
	                                  		<input type="text" class="form-control" id="cInput" name="cname" placeholder="기타 편의시설 이름">
	                                    </div>
	                                  </c:if>
                                  	
                                  </c:forEach>
                           </div>
                       </div>

                    <div class="row form-group">
                        <label class="col-2">축구장 이용시간</label>
                        <select name="gstime" id="gstime" class="form-control col-3" style="margin-left: 15px;">
                            <option value="0">시작</option>
                            <c:forEach items="${timelist }" var="time" begin="0" end="7">
                                <option value="${time.tno }">${time.ttime } : 00</option>
                            </c:forEach>
                        </select>
                        <label class="col-1 justify-content-center">&nbsp;~&nbsp;</label>
                        <select class="form-control col-3" id="getime" name="getime">
                            <option value="0">끝</option>
                            <c:forEach items="${timelist }" var="time" begin="0" end="7">
                                <option value="${time.tno }">${time.ttime +2} : 00</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="row form-group">
                        <label class="col-2">대여비용</label>
                        <input type="text" class="form-control col-9" name="money" id="money" style="margin-left: 15px;" placeholder="금액은 , 없이 입력해주세요">
                    </div>
                    <div class="row form-group">
                            <div class="col-2"></div>
                            <span class="col-9">※대여비용은 2시간 기준으로 입력해 주세요.</span>
                        </div>


                    <div class="row form-group">
                        <label class="col-2">주의사항</label>
                        <textarea rows="10" cols="50" class="form-control col-9 ml-3" placeholder="주의사항을 적어주세요" name="text"></textarea>
                    </div>

                    <div class="row form-group">
                        <label class="col-2">사진파일</label>
                        <input type="file" class="col-9" name="image" id="image" multiple>
                    </div>


                    <div class="row justify-content-end mr-2">
                        <input type="button" class="btn btn-info m-2" value="등록하기" id="registerBtn">
                    </div>

                </div>
	    	</div>
	    </form>
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
        $("#cInput").hide();
        $("#cAddBtn").on("click", function(e) {
        	$("#cInput").toggle();
        })
        $("#registerBtn").on("click", function(e) {
        	if($("#gname").val() == '')
        		alert("구장명을 입력해주세요");
        	else if($("#zipNo").val() == '')
        		alert("구장주소를 입력해주세요");
        	else if($("#addrDetail").val() == '')
        		alert("구장 상세주소를 입력해주세요")
        	else if($(':radio[name="type"]:checked').length < 1)
        		alert("구장종류를 선택해주세요")
        	else if($("#cInput").val() == '') {
        		console.log("")	
        	}else if($('#gstime').val() == 0 || $("#getime").val() == 0)
        		alert("축구장 이용시간을 선택해주세요")
        	else if($("#money").val() == '')
        		alert("대여비용을 입력해주세요")
        	else if($("#image").val() == '')
        		alert("이미지를 선택해주세요")
        	else {
        		console.log("else");
        		var form = document.ground;
        		//form.submit();
        	}
        })
    </script>

    <script language="javascript">
        // opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
        //document.domain = "abc.go.kr";

        function goPopup() {
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = window.open("/popup/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");

            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
        }
        /** API 서비스 제공항목 확대 (2017.02) **/
        function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
            , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            //    document.form.roadAddrPart1.value = roadAddrPart1;
            //    document.form.roadAddrPart2.value = roadAddrPart2;
            //    document.form.addrDetail.value = addrDetail;
            //    document.form.zipNo.value = zipNo;

            document.getElementById("roadAddrPart1").value = roadAddrPart1;
            document.getElementById("roadAddrPart2").value = roadAddrPart2;
            document.getElementById("addrDetail").value = addrDetail;
            document.getElementById("zipNo").value = zipNo;
        }
    </script>
</body>

</html>