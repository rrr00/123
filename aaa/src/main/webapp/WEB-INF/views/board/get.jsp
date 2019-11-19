<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<!-- 네비바 호버/색상 -->
<link href="../resources/css/style_nav.css" rel="stylesheet" />
<!-- 로그인/회원가입 제외 배경이미지 -->
<link href="../resources/css/style_back.css" rel="stylesheet" />

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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


<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>


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
      <div class="row">
         <div class="col-lg-12">
            <h1 class="page-header">게시판</h1>
         </div>
         <!-- /.col-lg-12 -->
      </div>
      <!-- /.row -->
      <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-body">
               <!-- 게시글 영역  -->
               <div class="card mb-3">
                  <div class="card-header">
                     <label>${board.title }</label> | <span>${board.tagname }</span> 
                     <span class="float-right"><fmt:formatDate value="${board.bdate }" pattern="yy/MM/dd" /></span>
                  </div>
                  <div class="card-body">
                     <div class="mb-5">
                        <i class="fas fa-user mr-1"></i><span>${board.nic}</span>
                     </div>
                     <div>${board.content}</div>
                     <c:if test="${info.mno == board.mno }">
	                     <form action="update" method="get">
		                     <div class="float-right mt-3">
		                     	<input type="hidden" value="${board.bno }" name="bno">
		                     	<input type="submit" class="btn btn-info" value="수정">	
		                        <input type="button" class="btn btn-danger" value="삭제" onclick="location.href='delete?bno=${board.bno}'">
		                     </div>
	                     </form>
                     </c:if>
                    
                  </div>
               </div>

<div class='row'>
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<div class="form-inline ml-3 mb-3 row">
                        <textarea rows="5" cols="100" class="form-control mr-2 col-9" id="recontent" name="recontent"></textarea>
                        <button type="button" id="modalRegisterBtn" class="btn btn-info ml-2 btn-lg col-2" style="height: 90px; width: 125px;" >등록</button>
                </div>
			</div>
			
			<!-- /.panel-heading-->
			<div class="panel-body">

				<ul class="chat">
					<!--  start reply  -->
					<li class="left clearfix" data-rno='12'>
						<div>
							<div class="header">
								<strong class="primary-font"></strong> <small
									class="pull-right text-muted"></small>
							</div>
							<p>등록된 댓글이 없습니다.</p>
						</div>
					</li>
					<!--  end reply  -->
				</ul>
				<!--  ./end ul -->
			</div>
			<!--  /.panel .chat-panel -->
			<div class="panel-footer">
			
			</div>
		</div>
	</div>
	<!--  ./ end row -->
</div>
               
               <div class="float-right mt-3">
               	   <form action='/list' method='get'>
		               <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			           <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			           <input type="hidden" name="type" value="${pageMaker.cri.type }">
			           <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			           <input type="hidden" name="tagno" value="${pageMaker.cri.tagno }">
		               <input type="submit" class="btn btn-success" value="목록으로">
	               </form>
               </div>
            </div>
         </div>
         <!-- /.panel -->
      </div>
      <!-- /.col-lg-12 -->
   </div>
   <!-- /.row -->
</body>

<script type="text/javascript" src="../resources/js/reply.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var bnoValue = '<c:out value="${board.bno}"/>';
						var mnoValue ='<c:out value="${info.mno}"/>';
						console.log("bnoValue : " + bnoValue);
						console.log("mnoValue : " + mnoValue);
						console.log('<c:out value="${info.nic}"/>')
						var replyUL = $(".chat");

						showList(1);

						function showList(page) {
							console.log("show list : " + page);
							replyService.getList({ bno : bnoValue,	page : page || 1},
											function(list, replyCnt) {
												console.log(list);
												console.log(replyCnt);
												console.log("replyCnt: " + replyCnt);
												console.log("list : " + list);
												console.log("list.length : "+list.length);
												
												if(page == -1){
													console.log("page가 -1 이다 이녀석아");
													pageNum = Math.ceil(replyCnt/10.0);
													showList(pageNum);
													return ;
												}
												
												var str = "";
												
												if (list == null || list.length == 0) {
													return;
												}

												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class = 'left clearfix' data-rno='"+list[i].reno+"'>";
													str += "	<div><div class='header'><strong class='primary-font'><i class='fas fa-user mr-2'></i>"+ list[i].nic	+ "</strong>";
													str += "	<small class='pull-right text-mute'>"	+ replyService.displayTime(list[i].redate) + "</small></div>";
													str += "	<p>"+ list[i].recontent+ "</p>";
													if('<c:out value="${info.mno}"/>' == list[i].mno){			
														str += "<div class='btndiv pull-right'>"
															 + "<button id='modalModBtn" +list[i].reno+ "' class='modalModBtn btn btn-info mr-2' onclick=\"var replychange = prompt('변경할 댓글을 입력하세요.', ''); var reply = { reno:"+list[i].reno+", recontent: replychange}; replyService.update(reply, function(result){location.reload();});\">수정</button>"
															 + "<button id='modalRemoveBtn' class='modalRemoveBtn btn btn-danger' onclick=\"var reno = "+list[i].reno+";replyService.remove(reno, function(result){location.reload();});\">삭제</button></div>";
													}
													str += "</div></li>";
												}
												replyUL.html(str);
												showReplyPage(replyCnt);
											});
						} //end showList
						var modal = $(".panel-heading");
						var modalInputReply = modal.find("textarea[name='recontent']");
						var modalInputReplyer = modal.find("input[name='mno']");
						var modalInputReplyDate = modal.find("input[name='replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						modalRegisterBtn.on("click", function(e) {
							var reply = 
							{
								recontent : modalInputReply.val(),
								mno : mnoValue,
								bno : bnoValue
							};
							
							console.log(reply);
							
							replyService.add(reply, function(result) {
								modal.find("input").val("");
								showList(-1);
							});
						});
						
						var pageNum=1;
						var replyPageFooter=$(".panel-footer");
						
						function showReplyPage(replyCnt){
							console.log("showREplyPage replyCnt : " + replyCnt);
							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;
							var prev = startNum != 1;
							var next = false;
							
							if(endNum * 10 >= replyCnt){
								endNum = Math.ceil(replyCnt/10.0);
							}
							
							if(endNum * 10 < replyCnt){
								next = true;
							}
							
							var str = "<ul class='pagination pull-right'>";
							
							if(prev){
								str += "<li class = 'page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
							}
							
							for(var i = startNum; i<= endNum; i++){
								var active = pageNum == i ? "active":"";
								
								str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
							}
							
							if(next){
								str+= "<li class='page-item'><a class='page-link' href='" + (endNum +1 ) + "'>Next</a></li>";
							}
							
							str += "</ul></div>";
							
							console.log(str);
							replyPageFooter.html(str);
						}
						
						replyPageFooter.on("click", "li a", function(e){
							e.preventDefault();
							console.log("page click");
							var targetPageNum = $(this).attr("href");
							console.log("targetPageNum: " + targetPageNum);
							pageNum = targetPageNum;
							showList(pageNum);
						})
					});
</script>
<!--  Reply JS End -->

</html>