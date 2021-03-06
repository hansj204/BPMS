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

<h4 style="margin-top: 20px;">프로젝트 담당자</h4>


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
            </div>
        </td>
        <td colspan="2">
    </tr>
</table>

<h6 style="margin-top: 20px;">담당자 목록</h6>
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
                        <a href="javascript:void(0);" id="addAuth" class="btn btn-light"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                    </div>
                    <div class="row">
                        <a href="javascript:void(0);" id="deleteAuth" class="btn btn-light"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>

        </td>
        <td><div id="managerGrid"></div></td>
    </tr>
</table>

<div style="float: right">
<%--    <a href="javascript:void(0);" id="cancelBtn" class="btn btn-dark">닫기</a>--%>
    <a href="javascript:void(0);" id="saveBtn" class="btn btn-dark">저장</a>
</div>
<script>

    var empAllGrid = new tui.Grid({
        el: document.getElementById('empAllGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        disabled : false,
        rowHeaders : ['checkbox'],
        columnOptions: {
            resizable: true
        },
        columns: [
            {
                header: '사용자 ID',
                name: 'userId'
            },
            {
                header: '부서',
                name: 'department',
                formatter: function (value){
                    return value.value.departmentName;
                }
            },
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

    var allUserList = ${allUserList};

    empAllGrid.resetData(${allUserList});
    empAllGrid.refreshLayout();

    var managerGrid = new tui.Grid({
        el: document.getElementById('managerGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        disabled : false,
        rowHeaders : ['checkbox'],
        columnOptions: {
            resizable: true
        },
        columns: [
            {
                header: '사용자 ID',
                name: 'userId'
            },
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

    managerGrid.resetData(${userList});
    managerGrid.refreshLayout();

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

        setViewForm();

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
        $("input").not('#customerInput, #registrar').attr("disabled", true);
        $("#registrar").attr("readonly", true);
        $("textarea").attr("disabled", true);
        $("select").attr("disabled", true);
        empAllGrid.enable();
        managerGrid.enable();
    }

    $("#cancelBtn").on('click', function () {
        location.href = "<c:url value='/manageBizProject' />";
    });

    $("#saveBtn").on('click', function () {

        var userData = managerGrid.getData().map(function(row) { return row.userId });

        $.ajax({
            url: "<c:url value='/detailBizProject' />",
            type : "POST",
            data: {
                projectCode : project.projectCode,
                userList : userData
            },
            success: function (data) {
                location.href = "<c:url value='/manageBizProject' />";
            }
        });
    });
</script>

