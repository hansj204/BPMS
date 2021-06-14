<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-05-06
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bd-example-modal-lg" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userModalLabel">사용자</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="min-width: 400px">
                <div id="userGrid"> </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="userSearch">확인</button>
            </div>
        </div>
    </div>
</div>

<script>

    var userGrid;

    $("#userModal").on('shown.bs.modal', function(e) {

        userGrid = new tui.Grid({
            el: document.getElementById('userGrid'),
            scrollX: false,
            scrollY: false,
            editable: false,
            rowHeaders : ['checkbox'],
            columnOptions: {
                resizable: true
            },
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
                            case 'M': return "전무";
                            default : return value.value.positionCode;
                        }
                    }
                },
                {
                    header: '권한',
                    name: 'authority',
                    formatter: function (value){
                        return value.value.authName;
                    }
                },
            ]
        });

        userGrid.resetData(${userList});
        userGrid.refreshLayout();
    });

    $("#userModal").on('hidden.bs.modal', function(e) {
        userGrid.destroy();
        $("#userGrid").empty();
    });

    $("#userSearch").on('click', ev => {
        userGrid.destroy();
        var row = userGrid.getCheckedRows()[0];
        $("#registrarInput").val(row.username);
        $("#registrar").val(row.userId);
        $("#userModal").modal("hide");
    });
</script>