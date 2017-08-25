<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/8/23
  Time: 下午4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页面</title>
    <%--<link href="../css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>

<form action="/login" method="post">
    <div class="container">

        <div class="col-md-4">
            <div class="form-group">
                <label for="name">用户名</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
            </div>
            <div class="check-box">
                <label>
                    <input type="checkbox">自动登录
                </label>
            </div>

            <button type="submit" id="registbtn" class="btn btn-default">登录</button>
            <a href="/registpage" class="btn btn-default">注册</a>

        <%--<button type="submit" class="btn btn-default" onclick="window.location.href='/registpage'">注册</button>--%>
        </div>
    </div>

</form>
</body>

<script>
    function Login() {
        $.ajax({
            url:"/login",
            data:{"string":"name","string":"password"},
            success: function(result){
                console.log(result);
                var name =result.val();
                var password = result.val();
                if (name == null || password == null){
                    $("#registbtn").click()
                }else {

                }
            }
        })
    }

    Login();
</script>

</html>
