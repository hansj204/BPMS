<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-27
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../project_modal.jsp">
    <jsp:param name="projectList" value="${projectList}"/>
</jsp:include>

<jsp:include page="../user_modal.jsp">
    <jsp:param name="userList" value="${userList}"/>
</jsp:include>

<div id="projectArea">

    <form id="searchActivityForm">
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
                <input type="hidden" class="form-control" id="activityCode" name="activityCode" >
                <td><label>작업명</label></td>
                <td><input class="form-control" id="activityName" name="activityName" type="text"></td>
                <td><label for="jobStep">작업단계</label></td>
                <td>
                    <select id="jobStep" name="jobStep" class="form-control">
                        <option value="">전체</option>
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
                            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#projectModal">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </td>
                <td rowspan="2" style="vertical-align: middle; text-align: center;">
                    <a href="javascript:void(0)" id="searchAreaBtn" class="btn btn-dark">검색</a>
                </td>
            </tr>
            <tr>
                <td><label>작업일</label></td>
                <td>
                    <div class="row">
                        <div class="col">
                            <input class="form-control" id="startDate" name="startDate" type="text">
                        </div>
                        ~
                        <div class="col">
                            <input class="form-control" id="endDate" name="endDate" type="text">
                        </div>
                    </div>
                </td>
                <td><label>작업시간</label></td>
                <td><input class="form-control" id="workingTime" name="workingTime" type="text" ></td>
                <td><label>작성자</label></td>
                <td>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="registrarInput" name="registrarInput" disabled>
                        <input type="hidden" id="registrar" name="registrar">
                        <div class="input-group-append searchBtn">
                            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#userModal">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </form>

    <div style="float: right; margin-bottom: 20px">
        <a href="detailActivity" id="addBtn" class="btn btn-dark">추가</a>
    </div>
    <div id="activityGrid"></div>
</div>

<script>

    $("#gridArea").append($("<div/>").attr("id", "projectArea"))

    var activityGrid = new tui.Grid({
        el: document.getElementById('activityGrid'),
        scrollX: false,
        scrollY: false,
        columns: [
            {
                header: '작업명',
                name: 'activityName'
            },
            {
                header: '작업내역',
                name: 'activityContents'
            },
            {
                header: '작업일',
                name: 'workDate'
            },
            {
                header: '작업시간',
                name: 'workingTime'
            },
            {
                header: '작업단계',
                name: 'jobStep',
                formatter: function (value) {
                    console.log(value);
                    return value.value.stepName;
                }
            },
            {
                header: '프로젝트',
                name: 'project',
                formatter: function (value) {
                    console.log(value);
                    return value.value.projectName;
                }
            }
        ]
    });

    activityGrid.resetData(${activityList});
    activityGrid.refreshLayout();

    activityGrid.on('click', ev => {
        var activity = activityGrid.getRow(ev.rowKey);
        location.href = "<c:url value='/detailActivity' />?activityCode=" + activity.activityCode;
    });

    $("#searchAreaBtn").on('click', function() {

        var arr = $("#searchActivityForm").serializeArray();
        var searchCondition = {};

        arr.forEach(function (obj) {
            searchCondition[obj.name] = obj.value;
        });

        $.ajax({
            url: "<c:url value='/searchActivity' />",
            data: searchCondition,
            type: "GET",
            success: function (data) {
                console.log(data)
                activityGrid.resetData(data);
                activityGrid.refreshLayout();
            }
        })
    })

    $("#startDate").datepicker({
        dateFormat : 'yy-mm-dd'
    });
    $("#endDate").datepicker({
        dateFormat : 'yy-mm-dd'
    });

</script>
