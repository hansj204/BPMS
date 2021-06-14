<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-05-06
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bd-example-modal-lg" id="projectModal" tabindex="-1" role="dialog" aria-labelledby="projectModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="projectModalLabel">프로젝트</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="min-width: 400px">
                <div id="projectGrid"> </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="projectSearch">확인</button>
            </div>
        </div>
    </div>
</div>

<script>

    var projectGrid;

    $("#projectModal").on('shown.bs.modal', function(e) {

        projectGrid = new tui.Grid({
            el: document.getElementById('projectGrid'),
            scrollX: false,
            scrollY: false,
            editable: false,
            rowHeaders : ['checkbox'],
            columnOptions: {
                resizable: true
            },
            columns: [
                {
                    header: '프로젝트명',
                    name: 'projectName',
                },
                {
                    header: '담당자',
                    name: 'manager',
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
                }
            ]
        });

        projectGrid.resetData(${projectList});
        projectGrid.refreshLayout();
    });

    $("#projectModal").on('hidden.bs.modal', function(e) {
        projectGrid.destroy();
        $("#projectGrid").empty();
    });

    $("#projectSearch").on('click', ev => {
        var row = projectGrid.getCheckedRows()[0];
        $("#projectInput").val(row.projectName);
        $("#project").val(row.projectCode);
        $("#projectModal").modal("hide");
    });
</script>