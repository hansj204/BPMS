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
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
    .container { width: 100%; }

   /* @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
    body, .tui-grid-container { font-family: "Nanum Gothic"; }*/
</style>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="<c:url value="/login"/>" method="post" autocomplete="off">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
                <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-view-subtitles" style="font-size: 120px"></i>
					</span>

                <div class="wrap-input100 validate-input" data-validate = "Enter Id">
                    <input class="input100" type="text" name="userId">
                    <span class="focus-input100" data-placeholder="ID"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                    <input class="input100" type="password" name="password">
                    <span class="focus-input100" data-placeholder="PASSWORD"></span>
                </div>
                <div style="margin-top: 5px; margin-bottom: 5px;">
                    <span style="color: red">${errorMsg}</span>
                </div>
                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn" style="background: gray"></div>
                        <button class="login100-form-btn">
                            Login
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/animsition/js/animsition.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<script src="vendor/countdowntime/countdowntime.js"></script>
<script src="js/main.js"></script>
</body>
</html>
