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

<c:if test="${haveObj eq true}">
    <jsp:include page="../customer_modal.jsp">
        <jsp:param name="customerList" value="${customerList}"/>
    </jsp:include>
</c:if>

<h4 style="margin-top: 20px;">프로젝트</h4>

<%--<form id="addProjectForm" action="<c:url value="/detailProject"/>" method="post">--%>
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
        <td colspan="2">
    </tr>
</table>

<h6 style="margin-top: 20px;">사용자 권한</h6>
<table style="width: 100%;">
    <colgroup>
        <col width="45%">
        <col width="10%">
        <col width="45%">
    </colgroup>
    <tr>
        <td><div id="empAllGrid"></div></td>
        <td>
            <div style="text-align: center; vertical-align: middle;">
                <div style="display: inline-block;">
                    <div class="row">
                        <button id="addAuth" class="btn btn-light"><i class="fa fa-arrow-right" aria-hidden="true"></i></button>
                    </div>
                    <div class="row">
                        <button id="deleteAuth" class="btn btn-light"><i class="fa fa-arrow-left" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>

        </td>
        <td><div id="managerGrid"></div></td>
    </tr>
</table>

<div style="float: right">
    <a href="manageProject" id="cacleBtn" class="btn btn-dark">닫기</a>
</div>
<script>

    var empAllGrid = new tui.Grid({
        el: document.getElementById('empAllGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        rowHeaders : ['checkbox'],
        columnOptions: {
            resizable: true
        },
        columns: [
            {
                header: '사용자 이름',
                name: 'userName',
                editor : {
                    type : 'text'
                }
            },
            {
                header: 'Email',
                name: 'email',
                editor : {
                    type : 'text'
                }
            }
        ]
    });

    empAllGrid.resetData(${userList});
    empAllGrid.refreshLayout();

    var managerGrid = new tui.Grid({
        el: document.getElementById('managerGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        rowHeaders : ['checkbox'],
        columnOptions: {
            resizable: true
        },
        columns: [
            {
                header: '사용자 이름',
                name: 'userName',
                editor : {
                    type : 'text'
                }
            },
            {
                header: 'Email',
                name: 'email',
                editor : {
                    type : 'text'
                }
            }
        ]
    });

    $("#addAuth").on('click', function () {
        managerGrid.resetData(empAllGrid.getCheckedRows());
        managerGrid.uncheckAll();
        managerGrid.refreshLayout();
    });

    $("#deleteAuth").on('click', function () {
        for(var i = 0; i < managerGrid.getCheckedRows().length; i++) {
            var rowKey = managerGrid.getCheckedRows()[i].rowKey;
            managerGrid.removeRow(rowKey);
        }
        managerGrid.uncheckAll();
        managerGrid.refreshLayout();
    });

    $("#startDate").datePicker({dateFormat : 'yy-mm-dd'});
    $("#endDate").datePicker({dateFormat : 'yy-mm-dd'});

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

            $("input").not('#customerInput, #registrar').attr("disabled", false)
            $("textarea").attr("disabled", false);
            $("select").attr("disabled", false);
        }
    }

    $("#addBtn, #saveBtn ").on('click', function () {
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

