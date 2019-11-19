<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="../resources/css/style_back.css" rel="stylesheet" />

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
                <div class="panel-heading">
                    게시글 목록
                    <button id="regBtn" type="button" class="btn btn-xs pull-right">글쓰기</button>
                </div>


                <!-- /.panel-heading -->
                <div class="panel-body row">
                    <div class="col-lg-2">
                        <table width="100%" class="table table-bordered table-hover " id="tagtype">
                            <tr>
                                <form id="searchForm0" action="list" method="get">
                                    <td id="td0" onclick="searchForm0.submit();">모든 게시물
                                        <input type="hidden" id="tagno0" name="tagno" value=0>
                                    </td>
                                </form>
                            </tr>
                            <c:forEach items="${tags }" var="tag">
                                <tr>
                                    <form id="searchForm${tag.tagno }" action="list" method="get">
                                        <td id="td${tag.tagno }" onclick="searchForm${tag.tagno}.submit();">
                                            ${tag.tagname }
                                            <input type="hidden" id="tagno${tag.tagno }" name="tagno" value=${tag.tagno}>
                                        </td>
                                    </form>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="col-lg-10">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="datalist">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list }" var="board">
                                    <tr>
                                        <td>${board.bno }</td>
                                        <td><a class="move" href="${board.bno }">
                                                [${board.tagname}]${board.title } <b>[${board.replycnt }]</b>
                                            </a></td>
                                        <td>${board.nic }</td>
                                        <td>
                                            <fmt:formatDate value="${board.bdate }" pattern="yy/MM/dd" />
                                        </td>
                                        <td>${board.hit }</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="form-inline">
                            <form id="searchForm" action="list" method="get">
                                <select name="type" class="form-control w-20 h-50">
                                    <option value="" <c:out value="${pageMaker.cri.type == null? 'selected' : '' }" />>---</option>
                                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }" />>제목</option>
                                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }" />>내용</option>
                                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }" />>작성자</option>
                                    <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }" />>제목|내용</option>
                                </select>
                                <input type="text" name="keyword" class="form-control w-40" value="${pageMaker.cri.keyword }">
                                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                                <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                                <input type="hidden" name="tagno" value="${pageMaker.cri.tagno }">
                                <button class="btn btn-default">검색</button>
                            </form>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end w-100 mr-4">
                        <ul class="pagination">
                            <c:if test="${pageMaker.prev }">
                                <li class="paginate_button previous"> <a class="page-link"
                                        href="${pageMaker.startPage - 1}" aria-label="Previous"> <span
                                            aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
                                <li class="paginate_button ${pageMaker.cri.pageNum==num?" active":"" }">
                                    <a href="${num }">${num }</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next }">
                                <li class="paginate_button next"><a class="page-link" href="${pageMaker.endPage+1 }"
                                        aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
                                    </a></li>
                            </c:if>
                        </ul>
                    </div>
                    <!-- /.panel-body -->
                </div>

                <form id="actionForm" action="list">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                    <input type="hidden" name="type" value="${pageMaker.cri.type }">
                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                    <input type="hidden" name="tagno" value="${pageMaker.cri.tagno }">
                </form>
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->


    </div>

    <script type="text/javascript">
    	console.log('<c:out value="${pageMaker.cri}" />');
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
                $("#searchForm button").on("click", function (e) {
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


</body>

</html>