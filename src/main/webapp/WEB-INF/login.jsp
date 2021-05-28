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
<link rel="stylesheet" type="text/css" href="css/jquery.slim.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
    .container {
        width: 100%;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row no-gutter">
        <div class="col-md-6 col-lg-6">
            <div class="login d-flex align-items-center py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-lg-8 mx-auto">
                            <h3 class="login-heading mb-4">Welcome back!</h3>
                            <form action="<c:url value="/login"/>" method="post">
                                <div class="form-label-group">
                                    <input type="text" id="inputUserId" name="userId" class="form-control" placeholder="Email address" required autofocus>
                                    <label for="inputUserId">Email address</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                                    <label for="inputPassword">Password</label>
                                </div>

                                <div class="custom-control custom-checkbox mb-3">
                                    <span style="color: red">${errorMsg}</span>
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">Remember password</label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">로그인</button>
                                <div class="text-center">
                                    <a class="small" href="#">Forgot password?</a></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
