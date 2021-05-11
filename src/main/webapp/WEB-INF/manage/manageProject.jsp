<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-09
  Time: 오전 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>사업프로젝트 관리</title>
</head>
<body>

<div id="projectArea">
    <div style="float: right">
        <a href="detailProject" id="addBtn" class="btn btn-primary">추가</a>
    </div>
    <div id="projectGrid"/>
</div>

<script>

    $("#gridArea").append($("<div/>").attr("id", "projectArea"))

    tui.Grid.applyTheme('clean') ;

    tui.Grid.setLanguage('ko') ;

    var grid = new tui.Grid({
        el: document.getElementById('projectGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        columns: [
            {
                header: '프로젝트명',
                name: 'projectName',
                editor : {
                    type: 'text'
                }
            },
            {
                header: '담당자',
                name: 'manager',
                editor : {
                    type: 'text',
                }
            },
            {
                header: '시작일',
                name: 'startDate',
                editor: {
                    type: 'datePicker',
                    options: {
                        format: 'dd/MM/yyyy'
                    }
                }
            },
            {
                header: '마감일',
                name: 'endDate',
                editor: {
                    type: 'datePicker',
                    options: {
                        format: 'dd/MM/yyyy'
                    }
                }
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
                },
                editor : {
                    type: 'select'
                }
            }
        ]
    });

    grid.resetData(${projectList});
    grid.refreshLayout();

    grid.on('click', ev => {
        var project = grid.getRow(ev.rowKey);
        location.href = "<c:url value='/detailProject' />?projectCode=" + project.projectCode;
    });

</script>

</body>
</html>
