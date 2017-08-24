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
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
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
                    <li><a href="${pageContext.request.contextPath}/addBlogPage">新建博客</a></li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" id="search" class="form-control" placeholder="输入搜索的内容">
                    </div>
                    <button type="button" id="btn1" class="btn btn-default">提交</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">${loginUser.name}</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">切换用户</a>
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
                </tbody>
            </table>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <nav aria-label="Page navigation">
                        <ul class="pagination" id="page">
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
    function getAllGlob(pageNum,pageSize,search) {
        if (search == null){
            search = "";
        }
        $.ajax({
            url:"/getAllGlob",
            type:"get",
            data:{"pageNum": pageNum, "pageSize": pageSize,"search":search},
            success: function (result) {
                console.log(result);
                var list = result.list;
                // 调用分页方法
                // 传入两个参数,一个结果集,一个地址
                $("#tbody1").html("");
                $("#page").html("");
                showPage(result, "/getAllGlob",search)
                for (var i = 0; i < list.length; i++) {
                    showGlob(list[i].globId, list[i].globTitle, list[i].globDes, list[i].globContent);
                }
            }
        })
    }
    function showGlob(globId, globTitle, globDes, globContent) {
        var td1 = $("<td width='135'><a href='getBlogById?blogId=" + globId + "'> " + globTitle + " </a></td>");
        var td2 = $("<td width='135'>" + globDes + "</td>");
        var td3 = $("<td width='20'><a href='#'>删除</a></td>");
        var th = $("<tr></tr>").append(td1).append(td2).append(td3);
        $("#tbody1").append(th);
    }
    function showPage(result, url ,search) {
        // 上一页
        var beforeLiFalse = $("<li class='disabled'> <span> <span aria-hidden='true'>&laquo;</span> </span> </li>");
        var beforeLiTrue = $("<li> <a href='#' onclick='getAllGlob("+ result.prePage +",5," + search + ")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a> </li>");
        var beforePage = result.hasPreviousPage ? beforeLiTrue : beforeLiFalse;
        $("#page").append(beforePage);

        // 页码显示
        var pages = result.pages;
        for (var i = 1; i <= pages; i++) {
            var pageTrue = $("<li class='active'> <span>" + i + "<span class='sr-only'>(current)</span></span></li>");
            var pageFalse = $("<li><a href='#' onclick='getAllGlob("+ i +",5," + search + ")'>" + i + "</a></li>");
            var somePage = result.pageNum == i ? pageTrue : pageFalse;

            $("#page").append(somePage);
        }

        // 下一页
        var afterLiFalse = $("<li class='disabled'> <span> <span aria-hidden='true'>&raquo;</span> </span> </li>");
        var afterLiTrue = $("<li> <a href='#' onclick='getAllGlob(" + result.nextPage + ",5," + search + ")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a> </li>");
        var afterPage = result.hasNextPage ? afterLiTrue : afterLiFalse;

        $("#page").append(afterPage);
    }
    $("#btn1").click(function () {
        var val = $("#search").val();

        getAllGlob("1","5",val);
    })

    getAllGlob("1","5");
</script>
</html>
