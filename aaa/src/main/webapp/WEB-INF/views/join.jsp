<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
   integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
   crossorigin="anonymous">

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
   integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
   crossorigin="anonymous">

<link href="./resources/css/style_main.css" rel="stylesheet" />


<meta charset="UTF-8">
<title>공차자</title>
</head>
<body>

<div class="d-flex justify-content-center pt-5"><img src="../resources/img/logobig.png"></div>

   <div class="container">
      <div class="d-flex justify-content-center h-100">
         <div class="card" style="height: 550px">
            <div class="card-header">
               <h3>회원가입</h3>
            </div>

            <div class="card-body">
               <form action="join" method="POST" name="joindata">
                  <div class="input-group form-group form-inline">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-id-badge"></i></span>
                     </div>
                     <div class="form-inline form-group form-control">
	                     <input type="text" id="iddata" name="id" class="mb-3" style="border: none;" placeholder="아이디를 입력해 주세요" onkeyup="idchk();">
	                     <span class="ml-auto mb-3" id="idtext"></span>
                     </div> 
                  </div>
                  <div class="input-group form-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                     </div>
                     <input type="password" name="pw" id="pw" class="form-control"
                        placeholder="비밀번호를 입력해주세요" onkeyup="pwck1();">
                  </div>

                  <div class="input-group form-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                     </div>
                     <input type="password" id="pwck" class="form-control"
                        placeholder="비밀번호를 한번 더 입력해주세요 " onkeyup="pwck1();">
                  </div>

                  <div class="input-group form-group" id="pwtext"></div>
                  
                  <div class="input-group form-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                     </div>
                     <input type="text" name="nam" id="name" class="form-control"
                        placeholder="이름을 입력해주세요">
                  </div>
                  

                  <div class="input-group form-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-users"></i></span>
                     </div>
                     <div class="form-inline form-control align-items-center"
                        style="background-color: #ffffff">
                        <div class="custom-control custom-radio mb-2">
                           <input type="radio" name="jbradio" id="jb-radio-1" class="custom-control-input" value="1">
                           <label class="custom-control-label" for="jb-radio-1">개인(팀)</label>
                        </div>
                        <div class="custom-control custom-radio mb-2 ml-2">
                           <input type="radio" name="jbradio" id="jb-radio-2" class="custom-control-input" value="2">
                           <label class="custom-control-label" for="jb-radio-2">구장관계자</label>
                        </div>
                     </div>
                  </div>

                  <div class="input-group form-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                     </div>
                     <input type="tel" id="tel" name="tel" class="form-control"
                        placeholder="연락받을 전화번호를 입력해주세요">
                  </div>

                  <div class="input-group form-group">
                     <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                     </div>
                     <input type="email" id="email" name="email" class="form-control"
                        placeholder="이메일 주소를 입력해주세요" required>
                  </div>
                  
                  <div id="nic">
                     <div class="input-group form-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text"><i class="fas fa-user-tag"></i></span>
                        </div>
                        <div class="form-inline form-group form-control">
                        	<input type="text" id="nicdata" name="nic" class="mb-3" style="border:none" placeholder="닉네임을 입력해주세요" onkeyup='nicchk();'>
                     		<span class="mb-3" id="nictext"></span>
                     	</div>   
                     </div>
                  </div>

                  <div class="input-group form-group" id="addr">
                     <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text" style="border-radius: 4px 0 0 0;"></span>
                        </div>
                        <input type="text" id="zipNo" name="zipNo" class="form-control" placeholder="우편번호" readonly>
                        <input type="button" value="주소검색" id="btn_join" class="btn login_btn" onclick="goPopup();">
                     </div>
                     <div class="input-group">
                        <div class="input-group-prepend">
                           <span class="input-group-text" style="border-radius: 0;"><i
                              class="fas fa-map-marked-alt"></i></span>
                        </div>
                        <input type="text" id="roadAddrPart1" name="roadAddrPart1" class="form-control" placeholder="도로명주소" readonly>
                     </div>
                     <div class="input-group" >
                        <div class="input-group-prepend">
                           <span class="input-group-text" style="border-radius: 0 0 0 4px;"></span>
                        </div>
                        <input type="text" id="addrDetail" name="addrDetail" class="form-control" placeholder="상세주소" readonly>
                        <input type="text" id="roadAddrPart2" name="roadAddrPart2" class="form-control" placeholder="동/면/읍" readonly>
                     </div>
                  </div>

                  <div class="form-group">
                     <input type="button" value="회원가입" id="btn_join" class="btn float-right login_btn" onclick='click_join();'>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>


</body>

<script type="text/javascript">

var chk = false;
   
   function pwck1() {
      var pw = $('#pw').val();
      var pwck = $('#pwck').val();

      console.log(pw + "/" + pwck);

      if (pw == pwck) {
         $('#pwtext').text('비밀번호가 일치합니다.');
         $('#pwtext').css('color', '#33ff33');
      } else {
         $('#pwtext').text('비밀번호가 일치하지 않습니다.');
         $('#pwtext').css('color', '#ff3333');
      }
   }

   $(document).ready(function() {
      	$("#nic").hide();
      	$("#addr").hide();

      	$('#jb-radio-1').on("click", function(e) {
         	$("#nic").show();
        	$("#addr").hide();
        	$(".card").css('height', '600px');
      	});
      
      	$('#jb-radio-2').on("click", function(e) {
        	$("#nic").hide();
			$("#addr").show();
	      	$(".card").css('height', '690px');
		});
	});
   
   function idchk() { 
		$.ajax({
			type : 'POST',
			url : '/idchk',
			data : {
				id : $('#iddata').val()
			},
			success : function(data) {
				console.log(data);
				if (data == 'NO') {
					$('#idtext').html("사용불가능");
				} else if(data == 'OK'){
					$('#idtext').html("사용가능");
				}
			}
		});
	}
   
   function nicchk() {
		$.ajax({
			type : 'POST',
			url : '/nicchk',
			data : {
				nic : $('#nicdata').val()
			},
			success : function(data) {
				if (data == 'NO') {
					$('#nictext').html("사용불가능");
				} else if(data == 'OK'){
					$('#nictext').html("사용가능");
				}
			}
		});
	}
	
   function click_join(){
	   	var value = $('input[name="jbradio"]:checked').val();
	   	if(value == 1){
	   		if($('#idtext').html() != '사용가능')
	   			alert("아이디를 변경해주세요");
	   		else if($('#pwtext').html() != '비밀번호가 일치합니다.')
	   			alert("패스워드를 맞춰주세요");
	   		else if($('#nam').val() == '')
	   			alert("이름을 입력해주세요");
	   		else if($('#nictext').html() != '사용가능')
	   			alert("닉네임을 변경해주세요");
	   		else if($('#tel').val() == '')
	   			alert("전화번호를 입력해주세요");
	   		else if($('#email').val() == '')
	   			alert("이메일을 입력해주세요");
	   		else{
	   			var form = document.joindata;
	   			form.submit();
	   		}
	   	} else if(value == 2 ){
	   		if($('#idtext').html() != '사용가능')
	   			alert("아이디를 변경해주세요");
	   		else if($('#pwtext').html() != '비밀번호가 일치합니다.')
	   			alert("패스워드를 맞춰주세요");
	   		else if($('#nam').val() == '')
	   			alert("이름을 입력해주세요");
	   		else if($('#roadAddrPart1').val() == '')
	   			alert("주소 검색을 눌러 구장주소를 입력해주세요.");
	   		else if($('#tel').val() == '')
	   			alert("전화번호를 입력해주세요");
	   		else if($('#email').val() == '')
	   			alert("이메일을 입력해주세요");
	   		else{
	   			var form = document.joindata;
	   			form.submit();
	   		}
	   	} else {
	   		alert("사용자 유형 (버튼)을 선택해주세요.");
	   	}
   }
   
   
</script>

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
// 	document.form.roadAddrPart1.value = roadAddrPart1;
// 	document.form.roadAddrPart2.value = roadAddrPart2;
// 	document.form.addrDetail.value = addrDetail;
// 	document.form.zipNo.value = zipNo;
	
	document.getElementById("roadAddrPart1").value = roadAddrPart1;
	document.getElementById("roadAddrPart2").value = roadAddrPart2;
	document.getElementById("addrDetail").value = addrDetail;
	document.getElementById("zipNo").value = zipNo;
}
</script>

</html>