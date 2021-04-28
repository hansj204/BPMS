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
<script type="text/javascript" src="<c:url value='/js/tui-grid.min.js' />"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

<button class="form-control" onclick="location='addProject'">추가</button>

<div id="grid" style="display: block; "></div>

<script>

    console.log(${projectList});

    tui.Grid.applyTheme('clean') ;

    tui.Grid.setLanguage('ko') ;

    var grid = new tui.Grid({
        el: document.getElementById('grid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        data: ${projectList},
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
                name: 'customerId',
                formatter: function (value) {
                  return value.value.customerName;
                }
            },
            {
                header: '프로젝트 단계',
                name: 'statecode',
                formatter: function (value) {
                    return value.value.stateName;
                },
                editor : {
                    type: 'select'
                }
            }
        ]
    });

    grid.on('click', ev => {
        console.log(grid.getRow(ev.rowKey));
    });

 /*   grid.on('beforeChange', ev => {
        console.log('before change:', ev);
    });
    grid.on('afterChange', ev => {
        console.log('after change:', ev);
    })*/

//    grid.resetData(gridData);

    // $("#addRow").on('click', function(e) {
    //     grid.appendRow();
    // })

</script>

</body>
</html>
