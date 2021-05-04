<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-14
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/js/tui-grid.min.js' />"></script>

<button id="addRow" class="btn btn-primary">추가</button>

<form id="addProjectForm" action="<c:url value="/addProject"/>" method="post">
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="projectName">작업명</label>
            <input class="form-control" id="projectName" name="projectName" type="text" placeholder="">
            <label for="projectcontents">작업내역</label>
            <textarea class="form-control" id="projectContents" name="projectContents" rows="3"></textarea>
            <label for="manager">작업일</label>
            <input class="form-control" id="startDate" name="startDate" type="text" placeholder="">
        </div>
        <div class="col-md-4 mb-3">
            <label for="workingTime">작업시간</label>
            <input class="form-control" id="workingTime" name="workingTime" type="text" placeholder="">
            <label for="stepCode">작업단계</label>
            <select id="stepCode" name="stepCode" class="form-control">
                <c:forEach items="${stepCode}" var="stepCode">
                    <option value="${stepCode.stepCode}">${stepCode.stepName}</option>
                </c:forEach>
            </select>
            <label for="projectCode">프로젝트</label>
            <input class="form-control" id="projectCode" name="projectCode" type="text">
            <div class="input-group-append">
                <span class="fa fa-search"></span>
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
    $("input").attr('autocomplete', 'off');
    $("#startDate").datepicker();
    $("#endDate").datepicker();

    var customerList = ${customerList};

    $('#addRow').on('click', function () {
        $('#addProjectForm').submit();
    });

</script>

