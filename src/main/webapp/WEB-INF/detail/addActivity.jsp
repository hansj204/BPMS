<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-14
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/static/js/tui-grid.min.js' />"></script>
<jsp:include page="../project_modal.jsp">
    <jsp:param name="projectList" value="${projectList}"/>
</jsp:include>

<button id="addRow" class="btn btn-primary">추가</button>

<form id="addActivityForm" action="<c:url value="/addProject"/>" method="post">
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="activityName">작업명</label>
            <input class="form-control" id="activityName" name="activityName" type="text" placeholder="">
            <label for="activityContents">작업내역</label>
            <textarea class="form-control" id="activityContents" name="activityContents" rows="5"></textarea>

        </div>
        <div class="col-md-4 mb-3">
            <label for="workDate">작업일</label>
            <input class="form-control" id="workDate" name="workDate" type="text" placeholder="">
            <label for="workingTime">작업시간</label>
            <input class="form-control" id="workingTime" name="workingTime" type="text" placeholder="">
        </div>
        <div class="col-md-4 mb-3">
            <label for="jobStep">작업단계</label>
            <select id="jobStep" name="jobStep" class="form-control">
                <c:forEach items="${jobStepList}" var="jobStepList">
                    <option value="${jobStepList.stepCode}">${jobStepList.stepName}</option>
                </c:forEach>
            </select>
            <label for="projectCode">프로젝트</label>
            <input type="text" class="form-control" id="projectInput" disabled>
            <input type="hidden" id="projectCode" name="projectCode">
            <div class="input-group-append">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#projectModal">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
    </div>
</form>

<div class="modal fade" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="customerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customerModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="customerGrid"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>
</div>

<script>

    /*var data = ${jobStepList};

    console.log(data.toString());*/

    $("input").attr('autocomplete', 'off');
    $("#startDate").datepicker();
    $("#endDate").datepicker();

    $('#addRow').on('click', function () {
        $('#addProjectForm').submit();
    });

</script>
