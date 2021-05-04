<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-27
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/js/tui-grid.min.js' />"></script>

<button class="form-control" onclick="location='addActivity'">추가</button>

<div id="activityGrid"></div>

<script>

    tui.Grid.applyTheme('clean') ;

    tui.Grid.setLanguage('ko') ;

    var grid = new tui.Grid({
        el: document.getElementById('activityGrid'),
        scrollX: false,
        scrollY: false,
        data: ${activityList},
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
                name: 'stepCode',
                formatter: function (value) {
                    return value.value.stepCode;
                }
            },
            {
                header: '프로젝트',
                name: 'projectCode'
            }
        ]
    });

</script>
