<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-27
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="projectArea">

    <div style="float: right; margin-bottom: 10px">
        <a href="detailUser" id="addBtn" class="btn btn-dark">추가</a>
    </div>

    <div id="userGrid"></div>

</div>


<script>

    $("#gridArea").append($("<div/>").attr("id", "projectArea"));

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
                    return value.value.departmentName;
                }
            },
            {
                header: '직급',
                name: 'position',
                formatter: function (value) {
                    switch (value.value.positionCode) {
                        case 'E': return "프로";
                        case 'J': return "매니저";
                        case 'S': return "책임 매니저";
                        case 'P': return "수석 매니저";
                        case 'V': return "이사";
                        case 'D': return "상무";
                        case 'S': return "전무";
                        default : return value.value.positionCode;
                    }
                }
            },
            {
                header: '등록일',
                name: 'enteredDate'
            },
        ]
    });

    grid.on('click', ev => {
        var user = grid.getRow(ev.rowKey);
        location.href = "<c:url value='/detailUser' />?userId=" + user.userId;
    });
</script>
