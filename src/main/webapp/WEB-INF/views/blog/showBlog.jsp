<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 下午3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%--bootstrap模板框架基础--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述的meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>博客页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script>

    </script>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">博客</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">新建博客</a></li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="输入搜索的内容">
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">用户名</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">切换用户 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th width="135">博客标题</th>
                    <th width="135">博客描述</th>
                    <th width="20">操作</th>
                </tr>
                </thead>
                <tbody id="tbody1">
                <%--<tr>--%>
                    <%--<td width="135">1111</td>--%>
                    <%--<td width="135">22222</td>--%>
                    <%--<td width="20">删除</td>--%>
                <%--</tr>--%>
                </tbody>
            </table>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <nav aria-label="Page navigation">
                        <ul class="pagination" id="page">
                            <%--<c:forEach begin="0" end="${page.pages}" var="i">--%>
                                <%--<c:if test="${page.pageNum} == i">--%>
                                    <%--<li class="active">--%>
                                        <%--<span>${i} <span class="sr-only">(current)</span></span>--%>
                                    <%--</li>--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${page.pageNum} != i">--%>
                                    <%--<li><a href="#">${i} </a></li>--%>
                                <%--</c:if>--%>
                            <%--</c:forEach>--%>

                            <%--<c:if test="${page.hasNextPage == false}">--%>
                                <%--<li class="disabled">--%>
                                <%--<span>--%>
                                    <%--<span aria-hidden="true">&raquo;</span>--%>
                                <%--</span>--%>
                                <%--</li>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${page.hasNextPage == true}">--%>
                                <%--<li>--%>
                                    <%--<a href="#" aria-label="Next">--%>
                                        <%--<span aria-hidden="true">&raquo;</span>--%>
                                    <%--</a>--%>
                                <%--</li>--%>
                            <%--</c:if>--%>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
<script>
    function getAllGlob() {
        $.ajax({
            url:"/getAllGlob",
            data:{"pageNum":"1","pageSize":"5"},
            success: function(result){
                console.log(result);
                var list =result.list;
                showPage(result)
                for (var i = 0;i<list.length;i++){
                    showGlob(list[i].globId,list[i].globTitle,list[i].globDes,list[i].globContent);
                }
            }
        })
    }
    function showGlob(globId,globTitle,globDes,globContent) {
        var td1 = $("<td width='135'>" + globTitle + "</td>");
        var td2 = $("<td width='135'>" + globDes + "</td>");
        var td3 = $("<td width='20'><a href='#'>删除</a></td>");
        var th = $("<tr></tr>").append(td1).append(td2).append(td3);
        $("#tbody1").append(th);
    }
    function showPage(result) {
        // 上一页
        var beforeLiFalse = $("<li class='disabled'> <span> <span aria-hidden='true'>&laquo;</span> </span> </li>");
        var beforeLiTrue = $("<li> <a href='' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a> </li>");
        var beforePage = result.hasPreviousPage ? beforeLiTrue : beforeLiFalse;

        var pages = result.pages;
        alert(pages);
        var pageSum = "";
        alert(result.pageNum)

        for (var i = 0; i < pages.length ; i++){
            var pageTrue = $("<li class='active'> <span><span class='sr-only'>(current)</span></span></li>").html(i);
            var pageFalse = $("<li><a href='#'></a></li>").html(i);
            alert(pageTrue)
            alert(pageFalse)

            var somePage = result.pageNum == i ? pageTrue : pageFalse;
            pageSum += somePage;
        }

        var afterLiFalse = $("<li class='disabled'> <span> <span aria-hidden='true'>&raquo;</span> </span> </li>");
        var afterLiTrue = $("<li> <a href='' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a> </li>");
        var afterPage = result.hasNextPage ? afterLiTrue : afterLiFalse;

        $("#page").append(beforePage).append(pageSum).append(afterPage);


    }

    getAllGlob();
</script>
</html>
