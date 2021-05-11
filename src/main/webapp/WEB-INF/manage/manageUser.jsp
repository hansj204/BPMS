<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-27
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="panel panel-default" style="width: calc(100% - 300px); height: 400px; position: absolute; bottom: 0px; padding-top: 15px">
    <div class="panel-body">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#userDetail">기본정보</a>
            </li>
        </ul>
        <div id="userDetail">
            <form id="addProjectForm" action="<c:url value="/addProject"/>" method="post">
                <div class="form-row">
                    <div class="col-lg-6">
                        <label for="userId">사번</label>
                        <input class="form-control" id="userId" name="userId" type="text" placeholder="">
                        <label for="userName">이름</label>
                        <input class="form-control" id="userName" name="userName" type="text" placeholder="">
                        <label for="password">비밀번호</label>
                        <input class="form-control" id="password" name="password" type="password" placeholder="">
                    </div>
                    <div class="col-lg-6">
                        <label for="email">이메일</label>
                        <input class="form-control" id="email" name="email" type="email" placeholder="">
                        <label for="positionCode">직급</label>
                        <select id="positionCode" name="positionCode" class="form-control">
                           <option value="E">프로</option>
                            <option value="J">매니저</option>
                            <option value="S">책임 매니저</option>
                            <option value="P">수석 매니저</option>
                            <option value="V">이사</option>
                            <option value="D">상무</option>
                            <option value="S">전무</option>
                        </select>
                        <label for="department">부서</label>
                        <div>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" id="departmentInput" disabled>
                                <input type="hidden" id="department" name="department">
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#departmentModal">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <footer id="panel-footer" class="panel-footer" style="float: right">
        <a href="javascript:void(0);" id="addBtn" class="btn btn-primary" v-on:click="saveInfo">추가</a>
        <a href="javascript:void(0);" id="modifyBtn" class="btn btn-primary" v-on:click="modfifyInfo">수정</a>
        <a href="javascript:void(0);" id="deleteBtn" class="btn btn-primary" v-on:click="deleteInfo">삭제</a>
    </footer>
</div>

<script>

    $("#gridArea").append($("<div/>").attr("id", "userGrid"));

    tui.Grid.applyTheme('clean') ;

    tui.Grid.setLanguage('ko') ;

    var grid = new tui.Grid({
        el: document.getElementById('userGrid'),
        scrollX: false,
        scrollY: false,
        data: ${userList},
        columns: [
            {
                header: '사용자 ID',
                name: 'userId'
            },
            {
                header: '사용자 이름',
                name: 'userName'
            },
            {
                header: 'Email',
                name: 'email'
            },
            {
                header: '부서',
                name: 'department',
                formatter: function (value){
                    return value.value.department.departmentName;
                }
            },
            {
                header: '직급',
                name: 'positionCode',
                formatter: function (value) {
                    switch (value.value.positionCode) {
                        case 'E': return "프로";
                        case 'J': return "매니저";
                        case 'S': return "책임 매니저";
                        case 'P': return "수석 매니저";
                        case 'V': return "이사";
                        case 'D': return "상무";
                        case 'S': return "전무";
                        default : return value.value.stepCode;
                    }

                }
            },
            {
                header: '등록일',
                name: 'enteredDate'
            },
        ]
    });
</script>
