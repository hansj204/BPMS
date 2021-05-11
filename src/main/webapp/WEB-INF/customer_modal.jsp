<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-05-06
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bd-example-modal-lg" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="customerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customerModalLabel">고객</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="customerGrid"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="customerSearch">확인</button>
            </div>
        </div>
    </div>
</div>

<script>
    var customerGrid = new tui.Grid({
        el: document.getElementById('customerGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        rowHeaders : ['checkbox'],
        data: ${customerList},
        columnOptions: {
            resizable: true
        },
        columns: [
            {
                header: '사업자번호',
                name: 'customerId'
            },
            {
                header: '고객명',
                name: 'customerName'
            },
            {
                header: '주소',
                name: 'address'
            },
            {
                header: '담당자',
                name: 'manager'
            },
            {
                header: '담당자 전화번호',
                name: 'managerNumber'
            }
        ]
    });

    $("#customerSearch").on('click', ev => {
        var row = customerGrid.getCheckedRows()[0];
        $("#customerInput").val(row.customerName);
        $("#customer").val(row.customerId);
        $("#customerModal").modal("hide");
    });
</script>