<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<link href="../resources/css/style_back.css" rel="stylesheet" />

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

   <div>
      <!-- 게시판 -->
      <form action="update" method="POST" id="frm">
         <div class="container">
            <div class="row mx-0 mb-4 form-inline"> 
               <select id="cate" name="tagno" class="form-control col w-25 mr-3" style="height: 34px;">
                    <option value=0 <c:out value="${board.tagno == null? 'selected' : '' }" />>카테고리선택</option>
               		<c:forEach items="${tags}" var="tags" varStatus="vs">
               			<option value="${tags.tagno }" <c:out value="${board.tagno == tags.tagno? 'selected' : '' }" />>${tags.tagname }</option>
               		</c:forEach>
               </select>
            
               <input type="text" class="form-control form-control-lg w-75" name="title" id="title" placeholder="제목" value="${board.title }">
            </div>


            <textarea id="summernote" name="content">${board.content }</textarea>

            <div class="my-3 pull-right">
               <input type="hidden" name="bno" value="${board.bno }">
               <input type="button" value="수정" style="width: 100px" class="btn btn-info btn-lg active" onclick="btn_insert();"> 
               <input type="button" value="취소" style="width: 100px" class="btn btn-info btn-lg active" onclick="location.href('get?bno=${board.bno}')">
            </div>
         </div>
      </form>
   </div>



</body>

<script type="text/javascript">
	console.log("<c:out value='${board}' />");
   $(document).ready(function() {
      $('#summernote').summernote({
         height : 400, // set editor height
         minHeight : null, // set minimum height of editor
         maxHeight : null, // set maximum height of editor
         focus : true
      // set focus to editable area after initializing summernote
      });
   });
   
   function btn_insert(){
	   var cate = $("#cate").val();
	   if(cate == 0)
		   alert("카테고리 선택해주세요.");
	   else{
		   document.getElementById('frm').submit()
	   }
   }
</script>


</html>