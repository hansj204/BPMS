<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-14
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../project_modal.jsp">
    <jsp:param name="projectList" value="${projectList}"/>
</jsp:include>

<h4 style="margin-top: 20px;">액티비티</h4>

<form id="addActivityForm" action="<c:url value="/detailActivity"/>" method="post">
    <table class="table table-bordered table-form" style="margin: 0 20px 20px 0">
        <colgroup>
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="20%">
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="20%">
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="20%">
        </colgroup>
        <tr>
            <input type="hidden" class="form-control" id="activityCode" name="activityCode" >
            <td><label>작업명</label></td>
            <td><input class="form-control" id="activityName" name="activityName" type="text"></td>
            <td><label for="jobStep">작업단계</label></td>
            <td>
                <select id="jobStep" name="jobStep" class="form-control">
                    <c:forEach items="${jobStepList}" var="jobStepList">
                        <option value="${jobStepList.stepCode}">${jobStepList.stepName}</option>
                    </c:forEach>
                </select>
            </td>
            <td><label>프로젝트</label></td>
            <td>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="projectInput" name="projectInput" disabled>
                    <input type="hidden" id="project" name="project">
                    <div class="input-group-append searchBtn">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#projectModal">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td><label>작업일</label></td>
            <td><input class="form-control" id="workDate" name="workDate" type="text" placeholder=""></td>
            <td><label>작업시간</label></td>
            <td><input class="form-control" id="workingTime" name="workingTime" type="text" placeholder=""></td>
            <td><label>작성자</label></td>
            <td>
                <input class="form-control" id="registrar" name="registrar" type="text" readonly value="${sessionScope.userName}">
            </td>
        </tr>
        <tr>
            <td><label>작업내역</label></td>
            <td colspan="5"><textarea class="form-control" id="activityContents" name="activityContents" rows="18"></textarea></td>
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
    $("#workDate").datepicker({dateFormat : 'yy-mm-dd'});

    var activity = ${activity};

    if(Object.keys(activity).length > 0) {

        setViewForm(true);

        var keys = Object.keys(activity);

        keys.forEach(function(key) {
            var name = "[name=" + key +"]";
            switch (key) {
                case 'jobStep' : $(name).val(activity[key].stepCode); break;
                case 'project' : $("#projectInput").val(activity[key].projectName); $(name).val(activity[key].projectCode); break;
                default:         $(name).val(activity[key]);
            }
        });
    }

    function setViewForm(mode) {

        if(mode) {
            $("#modifyBtn").show();
            $("#deleteBtn").show();;
            $("#saveBtn").hide();
            $("#cancelBtn").hide();
            $(".searchBtn").hide();

            $("input").attr("disabled", true);
            $("textarea").attr("disabled", true);
            $("select").attr("disabled", true);

        } else {
            $("#modifyBtn").hide();
            $("#deleteBtn").hide();
            $("#saveBtn").show();
            $("#cancelBtn").show();
            $(".searchBtn").show();

            $("input").not('#projectInput, #registrar').attr("disabled", false);
            $("textarea").attr("disabled", false);
            $("select").attr("disabled", false);
        }
    }

    $("#addBtn, #saveBtn ").on('click', function () {
        $('#addActivityForm').submit();
    });

    $('#modifyBtn').on('click', function () {
        setViewForm(false);
    });

    $("#cancelBtn").on('click', function () {
        setViewForm(true);
    });

    $("#deleteBtn").on('click', function (){
        $.ajax({
            url: "<c:url value='/deleteActivity' />",
            type : "DELETE",
            data: { activityCode : activity.activityCode },
            success: function (data) {
                location.href = "<c:url value='/manageActivity' />";
            }
        });
    });
</script>

