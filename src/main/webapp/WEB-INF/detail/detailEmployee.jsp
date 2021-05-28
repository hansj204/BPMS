<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-14
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h4 style="margin-top: 20px;">사용자</h4>

<form id="editEmployeeForm" action="<c:url value="/detailUser"/>" method="post">
    <table class="table table-bordered table-form" style="margin-top: 20px; margin-bottom: 20px">
        <colgroup>
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="20%">
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="20%">
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="20%">
            <col width="5%">
        </colgroup>
        <tr>
            <td><label>사번</label></td>
            <td><input class="form-control" id="userId" name="userId" type="text" readonly></td>
            <td><label>이름</label></td>
            <td><input class="form-control" id="userName" name="userName" type="text"></td>
            <td><label>비밀번호</label></td>
            <td>
                <div class="input-group mb-3">
                    <input class="form-control" id="password" name="password" type="password">
                    <a href="javascript:void(0);" id="showPW" class="btn btn-dark"><i class="fa fa-eye"></i></a>
                </div>
            </td>
        </tr>
        <tr>
            <td><label>이메일</label></td>
            <td><input class="form-control" id="email" name="email" type="text"></td>
            <td><label>부서</label></td>
            <td>
                <select id="department" name="department" class="form-control">
                    <c:forEach items="${departmentList}" var="departmentList">
                        <option value="${departmentList.departmentCode}">${departmentList.departmentName}</option>
                    </c:forEach>
                </select>
            </td>
            <td><label>직급</label></td>
            <td>
                <select id="position" name="position" class="form-control">
                    <c:forEach items="${positionList}" var="positionList">
                        <option value="${positionList.positionCode}">${positionList.positionName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>권한</label></td>
            <td>
                <select id="authority" name="authority" class="form-control">
                    <c:forEach items="${authList}" var="authList">
                        <option value="${authList.authCode}">${authList.authName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
    </table>
</form>



<div style="float: right;">
    <c:if test="${haveObj ne true}">
        <a href="javascript:void(0);" id="addBtn" class="btn btn-dark">추가</a>
    </c:if>
    <c:if test="${haveObj eq true}">
        <a href="javascript:void(0);" id="modifyBtn" class="btn btn-dark">수정</a>
        <a href="javascript:void(0);" id="deleteBtn" class="btn btn-dark">삭제</a>
        <a href="javascript:void(0);" id="cancelBtn" class="btn btn-dark">취소</a>
        <a href="javascript:void(0);" id="saveBtn" class="btn btn-dark">저장</a>
    </c:if>
</div>

<script>

    var user = ${user};

    if(Object.keys(user).length > 0) {

        setViewForm(true);

        var keys = Object.keys(user);

        keys.forEach(function(key) {
            var name = "[name=" + key +"]";

            switch (key) {
                case 'authority' : $(name).val(user[key].authCode); break;
                case 'department' : $(name).val(user[key].departmentCode); break;
                case 'position' : $(name).val(user[key].positionCode); break;
                default: $(name).val(user[key]);
            }
        });
    }

    $("#addBtn, #saveBtn ").on('click', function () {
        $("#editEmployeeForm").submit();
    });


    $('#modifyBtn').on('click', function () {
        setViewForm(false);
    });

    $("#cancelBtn").on('click', function () {
        setViewForm(true);
    });

    $("#deleteBtn").on('click', function (){

        $.ajax({
            url: "<c:url value='/deleteUser' />",
            type : "DELETE",
            data: { userId : user.userId },
            success: function (data) {
                location.href = "<c:url value='/manageUser' />";
            }
        });

    });

    $("#showPW").on('click', function (){
        ('password' == $('#password').attr('type'))? $('#password').attr('type', 'text') : $('#password').attr('type', 'password')
    });

    function setViewForm(mode) {
        if(mode) {
            $("#modifyBtn").show();
            $("#deleteBtn").show();;
            $("#saveBtn").hide();
            $("#cancelBtn").hide();
            $(".searchBtn").hide();
            $("#showPW").hide();

            $("input").not('#userId').attr("disabled", true);
            $('#userId').attr("readonly", true);
            $("textarea").attr("disabled", true);
            $("select").attr("disabled", true);

        } else {
            $("#modifyBtn").hide();
            $("#deleteBtn").hide();
            $("#saveBtn").show();
            $("#cancelBtn").show();
            $(".searchBtn").show();
            $("#showPW").show();

            $("input").not('#userId').attr("disabled", false);
            $("textarea").attr("disabled", false);
            $("select").attr("disabled", false);
        }
    }

</script>