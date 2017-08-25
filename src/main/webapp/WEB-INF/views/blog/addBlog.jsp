<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/24
  Time: 上午11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%--bootstrap模板框架基础--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述的meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>新建博客</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <h2>&nbsp;&nbsp;添加博客</h2>
        <br/>
        <div class="col-md-12">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/addBlog" role="form">
                <div class="form-group">
                    <div class="col-sm-2">
                        <label for="globTitle">
                            标题
                        </label>
                    </div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="globTitle" id="globTitle"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2">
                        <label for="globDes">
                            描述
                        </label>
                    </div>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="globDes" id="globDes"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2">
                        <label for="globContent">
                            内容
                        </label>
                    </div>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="globContent" name="globContent" rows="5"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">
                            提交
                        </button>
                        <button type="reset" class="btn btn-default">
                            返回
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
