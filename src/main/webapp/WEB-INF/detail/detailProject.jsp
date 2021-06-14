<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-14
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="haveObj" value="${haveObj}"/>

<jsp:include page="../customer_modal.jsp">
    <jsp:param name="customerList" value="${customerList}"/>
</jsp:include>

<h4 style="margin-top: 20px;">프로젝트</h4>

<form id="addProjectForm" action="<c:url value="/detailProject"/>" method="post">
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
            <input type="hidden" class="form-control" id="projectCode" name="projectCode" >
                <input type="hidden" tex>
            <td><label>프로젝트명</label></td>
            <td><input class="form-control" id="projectName" name="projectName" type="text"></td>
            <td><label>프로젝트 기간</label></td>
            <td>
                <div class="row">
                    <div class="col">
                        <input class="form-control" id="startDate" name="startDate" type="text" placeholder="">
                    </div>
                    ~
                    <div class="col">
                        <input class="form-control" id="endDate" name="endDate" type="text" placeholder="">
                    </div>
                </div>
            </td>
            <td><label>프로젝트 상태</label></td>
            <td>
                <select id="projectState" name="projectState" class="form-control">
                    <c:forEach items="${stateList}" var="stateList">
                        <option value="${stateList.stateCode}">${stateList.stateName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="manager">담당자</label></td>
            <td><input class="form-control" id="manager" name="manager" type="text" placeholder=""></td>
            <td><label>총 사업예산</label></td>
            <td><input class="form-control" id="totalBudget" name="totalBudget" type="number"></td>
            <td><label>화폐단위</label></td>
            <td>
                <select id="budgetUnit" name="budgetUnit" class="form-control">
                    <option value="W">원</option>
                    <option value="D">달러</option>
                    <option value="Y">엔화</option>
                    <option value="E">유로</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>고객</label></td>
            <td>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="customerInput" name="customerInput" disabled>
                    <input type="hidden" id="customer" name="customer">
                    <div class="input-group-append searchBtn">
                        <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#customerModal">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </td>
            <td><label>진행여부</label></td>
            <td>
                <select id="useYN" name="useYN" class="form-control">
                    <option selected>Y</option>
                    <option>N</option>
                </select>
            </td>
            <td><label>등록자</label></td>
            <td>
                <input class="form-control" id="registrar" name="registrar" type="text" readonly value="${sessionStorage.getItem("userName")}">
            </td>
        </tr>
        <tr>
            <td><label for="projectcontents">프로젝트 내용</label></td>
            <td colspan="5">
                <textarea class="form-control" id="projectContents" name="projectContents" rows="17"></textarea>
            </td>
        </tr>
    </table>

    <div id="userAuthGrid"></div>

</form>
<div style="float: right">
    <c:if test="${haveObj ne true}">
        <a href="javascript:void(0);" id="addBtn" class="btn btn-dark">추가</a>
    </c:if>
    <c:if test="${haveObj eq true}">
        <a href="javascript:void(0);" id="modifyBtn" class="btn btn-dark">수정</a>
        <a href="javascript:void(0);" id="deleteBtn"  class="btn btn-dark">삭제</a>
        <a href="javascript:void(0);" id="cancelBtn" class="btn btn-dark">취소</a>
        <a href="javascript:void(0);" id="saveBtn" class="btn btn-dark">저장</a>
    </c:if>
</div>
<script>

    $("#startDate").datepicker({dateFormat: 'yy-mm-dd'});
    $("#endDate").datepicker({dateFormat: 'yy-mm-dd'});

    var project = ${project};

    if(Object.keys(project).length > 0) {

        setViewForm(true);

        var keys = Object.keys(project);

        keys.forEach(function(key) {
            var name = "[name=" + key +"]";

            switch (key) {
                case 'projectState' : $(name).val(project[key].stateCode); break;
                case 'customer' :     $("#customerInput").val(project[key].customerName); $(name).val(project[key].customerId); break;
                default:              $(name).val(project[key]);
            }
        });
    }

    function setViewForm(mode) {
        if(mode) {
            $("#modifyBtn").show();
            $("#deleteBtn").show();
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

            $("input").not('#customerInput, #registrar').attr("disabled", false)
            $("textarea").attr("disabled", false);
            $("select").attr("disabled", false);
        }
    }

    $("#addBtn, #saveBtn ").on('click', function () {
        $('#addProjectForm').submit();
    });

    $("#saveBtn ").on('click', function () {
        $('#addProjectForm').submit();
    });

    $('#modifyBtn').on('click', function () {
        setViewForm(false);
    });

    $("#cancelBtn").on('click', function () {
        setViewForm(true);
    });

    $("#deleteBtn").on('click', function (){

        $.ajax({
            url: "<c:url value='/deleteProject' />",
            type : "DELETE",
            data: { projectCode : project.projectCode },
            success: function (data) {
                location.href = "<c:url value='/manageProject' />";
            }
        });

    });

</script>

