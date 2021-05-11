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
<jsp:include page="../customer_modal.jsp">
    <jsp:param name="customerList" value="${customerList}"/>
</jsp:include>

<div id="projectInfo">
    <form id="addProjectForm" action="<c:url value="/addProject"/>" method="post">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="projectName">프로젝트명</label>
                <input class="form-control" id="projectName" name="projectName" type="text" placeholder="">
                <label for="projectcontents">프로젝트 내용</label>
                <textarea class="form-control" id="projectContents" name="projectContents" rows="3"></textarea>
                <label for="manager">담당자</label>
                <input class="form-control" id="manager" name="manager" type="text" placeholder="">
            </div>
            <div class="col-md-4 mb-3">
                <div class="row">
                    <div class="col">
                        <label for="startDate">시작일</label>
                        <input class="form-control" id="startDate" name="startDate" type="text" placeholder="">
                    </div>
                    <div class="col">
                        <label for="endDate">종료일</label>
                        <input class="form-control" id="endDate" name="endDate" type="text" placeholder="">
                    </div>
                </div>
                <label for="customer">거래처</label>
                <div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="customerInput" name="customerInput" disabled>
                        <input type="hidden" id="customer" name="customer">
                        <div class="input-group-append">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#customerModal">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <label for="projectState">프로젝트 상태</label>
                <select id="projectState" name="projectState" class="form-control">
                    <c:forEach items="${stateList}" var="stateList">
                        <option value="${stateList.stateCode}">${stateList.stateName}</option>
                    </c:forEach>
                </select>
                <label for="useYN">진행여부</label>
                <select id="useYN" name="useYN" class="form-control">
                    <option selected>Y</option>
                    <option>N</option>
                </select>
            </div>
        </div>
    </form>
    <div>
        <button class="form-control" class="btn btn-secondary" onclick="location='addProject'">추가</button>
        <button class="form-control" class="btn btn-secondary" onclick="location='modifyProject'">수정</button>
        <button class="form-control" class="btn btn-secondary" onclick="location='deleteProjectBtn'">삭제</button>
    </div>

</div>

<script>
    $("input").attr('autocomplete', 'off');
    $("#startDate").datepicker();
    $("#endDate").datepicker();

    $('#addRow').on('click', function () {
        $('#addProjectForm').submit();
    });

</script>

