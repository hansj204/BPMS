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
                    <label for="manager">시작일</label>
                    <input class="form-control" id="startDate" name="startDate" type="text" placeholder="">
                </div>
                <div class="col">
                    <label for="manager">종료일</label>
                    <input class="form-control" id="endDate" name="endDate" type="text" placeholder="">
                </div>
            </div>
            <label for="manager">거래처</label>
            <div>
                <input class="form-control" id="customerId" name="customerId" type="text" placeholder="" value="2018168693">
                <div class="input-group-append">
                    <span class="fa fa-search"></span>
                </div>
            </div>
            <label for="manager">프로젝트 상태</label>
            <select id="statecode" name="statecode" class="form-control">
                <c:forEach items="${stateList}" var="stateList">
                    <option value="${stateList.stateCode}">${stateList.stateName}</option>
                </c:forEach>
            </select>
            <label for="manager">진행여부</label>
            <select id="useYN" name="useYN" class="form-control">
                <option selected>Y</option>
                <option>N</option>
            </select>
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

    $("#startDate").datepicker();
    $("#endDate").datepicker();

    var customerList = ${customerList};

    $('#addRow').on('click', function (){
        $('#addProjectForm').submit();
    })


</script>

