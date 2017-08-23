<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 下午3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<html>
<head>
    <%--bootstrap模板框架基础--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述的meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>博客页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
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
            <jsp:include page="../page.jsp"/>
        </div>
        <div class="col-md-2">
            <div class="panel panel-default">
                <div class="panel-body">
                    Panel content方法方法付
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function getAllGlob() {
        $.ajax({
            url:"/getAllGlob",
            data:{"pageNum":"1","pageSize":"5"},
            success: function(result){
                console.log(result.list);
                var list =result.list;
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
    getAllGlob();
</script>
</html>
