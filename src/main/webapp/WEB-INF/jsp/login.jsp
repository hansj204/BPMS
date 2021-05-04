<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-08
  Time: 오후 6:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
</head>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
    .container {
        width: 100%;
    }
</style>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-5 mx-auto">
            <div id="first">
                <div class="myform form ">
                    <div class="logo mb-3">
                        <div class="col-md-12 text-center">
                            <h1>Login</h1>
                        </div>
                    </div>
                    <form action="getList" method="get" name="login">
                        <div class="form-group">
                            <label>Email address</label>
                            <input type="email" name="email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                        </div>
                        <div class="form-group">
                            <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                        </div>
                        <div class="col-md-12 text-center ">
                            <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
