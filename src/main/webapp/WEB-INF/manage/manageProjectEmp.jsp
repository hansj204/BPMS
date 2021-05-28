<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-09
  Time: 오전 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../customer_modal.jsp">
    <jsp:param name="customerList" value="${customerList}"/>
</jsp:include>

<div id="projectArea">

    <form id="searchProjectForm">
        <table class="table table-bordered table-form" style="margin-top: 20px; margin-bottom: 20px">
            <colgroup>
                <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
                <col width="20%">
                <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
                <col width="25%">
                <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
                <col width="20%">
                <col width="5%">
            </colgroup>
            <tr>
                <td><label>프로젝트명</label></td>
                <td><input class="form-control" id="projectName" name="projectName" type="text"></td>
                <td><label for="startDate">등록 기간</label></td>
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
                <td><label>프로젝트 상태</label></td>
                <td>
                    <select id="projectState" name="projectState" class="form-control">
                        <option value="">전체</option>
                        <c:forEach items="${stateList}" var="stateList">
                            <option value="${stateList.stateCode}">${stateList.stateName}</option>
                        </c:forEach>
                    </select>
                </td>
                <td rowspan="2" style="vertical-align: middle; text-align: center;">
                    <a href="javascript:void(0)" id="searchAreaBtn" class="btn btn-dark">검색</a>
                </td>
            </tr>
            <tr>
                <td><label>등록자</label></td>
                <td><input class="form-control" id="registrar" name="registrar" type="text" placeholder=""></td>
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
                <td colspan="2"></td>
            </tr>
        </table>
    </form>

    <div style="float: right; margin-bottom: 10px">
        <a href="detailBizProject" id="addBtn" class="btn btn-dark">추가</a>
    </div>

    <div id="projectGrid"/>
</div>

<script>

    $("#gridArea").append($("<div/>").attr("id", "projectArea"))

    var grid = new tui.Grid({
        el: document.getElementById('projectGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        columns: [
            {
                header: '프로젝트ID',
                name: 'projectCode'
            },
            {
                header: '프로젝트명',
                name: 'projectName',
            },
            {
                header: '담당자',
                name: 'manager',
            },
            {
                header: '시작일',
                name: 'startDate',
                editor: 'datePicker',
            },
            {
                header: '마감일',
                name: 'endDate',
            },
            {
                header: '고객',
                name: 'customer',
                formatter: function (value) {
                  return value.value.customerName;
                }
            },
            {
                header: '프로젝트 단계',
                name: 'projectState',
                formatter: function (value) {
                    return value.value.stateName;
                }
            },
            {
                header: '등록자',
                name: 'registrar'
            }
        ]
    });

    console.log(${projectList});

    grid.resetData(${projectList});
    grid.refreshLayout();

    grid.on('click', ev => {
        var project = grid.getRow(ev.rowKey);
        location.href = "<c:url value='/detailBizProject' />?projectCode=" + project.projectCode;
    });

    $("#searchAreaBtn").on('click', function() {

        var arr = $("#searchProjectForm").serializeArray();
        var searchCondition = {};

        arr.forEach(function (obj) {
            searchCondition[obj.name] = obj.value;
        });

       $.ajax({
           url: "<c:url value='/searchProject' />",
           data: searchCondition,
           type: "GET",
           success: function (data) {
               grid.resetData(data);
               grid.refreshLayout();
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
