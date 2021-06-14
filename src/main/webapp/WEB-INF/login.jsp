<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-08
  Time: 오후 6:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<style>
    .container { width: 100%; }

    @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
    body, .tui-grid-container { font-family: "Nanum Gothic"; }
</style>
<body>
<script>
    $("input").attr('autocomplete', 'off');
</script>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form action="<c:url value="/login"/>" method="post" class="form-signin">
                        <div class="form-label-group">
                            <label for="inputUserId">Id</label>
                            <input type="text" id="inputUserId" name="userId" class="form-control" placeholder="ID" required autofocus>
                        </div>
                        <div class="form-label-group">
                            <label for="inputPassword">Password</label>
                            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="비밀번호" required>
                        </div>

                        <div style="margin-top: 5px; margin-bottom: 5px;">
                            <span style="color: red">${errorMsg}</span>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</body>
</html>
