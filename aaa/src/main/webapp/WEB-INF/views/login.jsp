<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String chk = request.getParameter("chk");
%>

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

<link href="./resources/css/style_main.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>공차자 로그인</title>
</head>
<body>

<div class="d-flex justify-content-center pt-5"><img src="../resources/img/logobig.png"></div>


	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>로그인</h3>
				</div>

				<div class="card-body">
					<form action="Main" method="post">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="ID"
								name="id" value="b2">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control"
								placeholder="Password" name="pw" value="2222">
						</div>

						<div class="form-group">
							<input type="submit" value="로그인"
								class="btn float-right login_btn">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						아직 회원이 아니신가요?<a href="/join">회원가입</a>
					</div>
					<div class="d-flex justify-content-center links">
						<a href="#">도움이 필요하신가요?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var getParameter = function(param) {
		var returnValue;
		var url = location.href;
		var parameters = (url.slice(url.indexOf('?') + 1, url.length))
				.split('&');
		for (var i = 0; i < parameters.length; i++) {
			var varName = parameters[i].split('=')[0];
			if (varName.toUpperCase() == param.toUpperCase()) {
				returnValue = parameters[i].split('=')[1];
				return decodeURIComponent(returnValue);
			}
		}
	};
	
	var chk = getParameter('chk');
	
	if(chk == 'false')
		alert("로그인 실패하셨습니다.");
	else if(chk == 'true')
		alert("가입이 완료되었습니다.");
</script>
</html>