<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 下午4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册页面</title>
    <%--<link href="css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>


<body>

<form:form action="regist" method="post" modelAttribute="user">
    <div class="container">

        <div class="col-md-4">
            <div class="form-group">
                <label for="name">用户名</label>
                <input type="text" name="name" class="form-control" id="name" placeholder="请输入用户名">
                <form:errors path="name" cssStyle="color: red"></form:errors>
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                <form:errors path="password" cssStyle="color: red"></form:errors>
            </div>

            <div class="form-group">
                <label for="repassword">重置密码</label>
                <input type="password" class="form-control" id="repassword" name="repassword" placeholder="请再次输入密码">
                <%--<form:errors path="password" cssStyle="color: red">两次密码不一致</form:errors>--%>
            </div>

            <div class="form-group">
                <label for="tel">电话</label>
                <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入常用电话">
                <form:errors path="tel" cssStyle="color: red"></form:errors>
            </div>
            <div class="form-group">
                <label for="address">地址</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="请输入常用地址">
            </div>
            <button id="btn" type="submit" class="btn btn-default">提交注册</button>
        </div>

    </div>

</form:form>

</body>


<script>

//$("#name").blur(function () {
//    var username = $(this).val();
//
//    if (username != null){
//        $.ajax({
//            type:"POST",
//            url:"/registpage",
//            data:{name: username},
//            success:function (data) {
//                if (data.msg == 1){
//                    $("#name").next().text("该用户已被占用")
//                }else if (data.msg == 2){
//                    $("#name").next().text("该用户可以使用")
//                }
//            },
//            error: function (XMLHttpRequest, textStatus, errorThrown) {
//                alert("网络异常，请稍后再试！");//回调函数
//            }
//        })
//    }
//})


//    $("#btn").click(function () {
//
//        $.ajax({
//            url:"/regist",
//            type:"get",
//            data:{"name":$("#name").val},
//            success:function (result) {
//                console.log(result)
//                var  name = result.valueOf()
//                if (name == null){
//                    alert("用户名不能为空")
//                }
//            }
//        })
//    })
</script>
</html>
