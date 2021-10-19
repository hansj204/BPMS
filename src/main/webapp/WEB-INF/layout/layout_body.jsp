<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-13
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex" id="wrapper">

    <div class="bg-light border-right" id="sidebar-wrapper">
        <div class="sidebar-heading">사업 프로젝트 관리</div>
        <div class="list-group list-group-flush">
        <c:if test="${sessionScope.userAuthCode eq 'ALL' or sessionScope.userAuthCode eq 'HR'}">
            <a href="manageUser" class="list-group-item list-group-item-action bg-light">사용자 관리</a>
        </c:if>
        <c:if test="${sessionScope.userAuthCode eq 'ALL' or sessionScope.userAuthCode eq 'BT'}">
            <a href="manageCustomer" class="list-group-item list-group-item-action bg-light">고객 관리</a>
        </c:if>
        <c:if test="${sessionScope.userAuthCode eq 'ALL' or sessionScope.userAuthCode eq 'BT' or sessionScope.userAuthCode eq 'PM'}">
            <a href="manageProject" class="list-group-item list-group-item-action bg-light">사업프로젝트 관리</a>
        </c:if>
        <c:if test="${sessionScope.userAuthCode eq 'ALL' or sessionScope.userAuthCode eq 'PM'}">
            <a href="manageBizProject" class="list-group-item list-group-item-action bg-light">프로젝트담당자 관리</a>
        </c:if>
        <c:if test="${sessionScope.userAuthCode ne 'BT' and sessionScope.userAuthCode ne 'HR'}">
            <a href="manageActivity" class="list-group-item list-group-item-action bg-light">액티비티 관리</a>
        </c:if>
        </div>
    </div>

    <div id="page-content-wrapper">

        <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            <button class="btn btn-dark" id="menu-toggle">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle userName" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${sessionScope.userName}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">${sessionScope.userAuthName}</a>
                            <div class="dropdown-divider"></div>
                            <a id="logoutBtn" class="dropdown-item">로그아웃</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid">
            <div id="gridArea"></div>
            <jsp:include page="../${pageLink}"></jsp:include>
        </div>
    </div>
</div>

<script>

    $("input").attr('autocomplete', 'off');

    localStorage.setItem('authCode', "<%=session.getAttribute("userAuthCode")%>");

    if(localStorage.getItem('authCode') == 'null' || localStorage.getItem('authCode') == 'undefined') {
        console.log(localStorage.getItem('authCode'))
        location.href = "<c:url value='/logout' />";
    }

    tui.Grid.applyTheme('clean') ;
    tui.Grid.setLanguage('ko') ;

    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
        $("body").find("tui-grid-container").refreshLayout();
    });

    $("#logoutBtn").click(function () {
        localStorage.removeItem('authCode');
        location.href = "<c:url value='/logout' />";
    })

    function isEmail(value) {
        var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        return regExp.test(value);
    }

    function checkCompanyNumber(value) {
        var valueMap = value.replace(/-/gi, '').split('').map(function(item) {
            return parseInt(item, 10);
        });

        if (valueMap.length === 10) {
            var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
            var checkSum = 0;

            for (var i = 0; i < multiply.length; ++i) {
                checkSum += multiply[i] * valueMap[i];
            }

            checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
            return Math.floor(valueMap[9]) === (10 - (checkSum % 10));
        }

        return false;
    }

    function checkPhoneNumber(value) {
        var regExp = /^\d{3,4}-\d{4}$/;
        return regExp.test(value);
    }

    function checkPassWord(value) {
        var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
        return reg.test(value)
    }


</script>

