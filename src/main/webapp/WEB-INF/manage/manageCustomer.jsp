<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-09
  Time: 오전 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="customerArea">
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
                <td><label>고객ID</label></td>
                <td><input class="form-control" id="customerId" name="customerId" type="text"></td>
                <td><label>고객명</label></td>
                <td><input class="form-control" id="customerName" name="customerName" type="text"></td>
                <td><label>담당자</label></td>
                <td><input class="form-control" id="manager" name="manager" type="text" placeholder=""></td>
                <td rowspan="2" style="vertical-align: middle; text-align: center;">
                    <a href="javascript:void(0)" id="searchAreaBtn" class="btn btn-dark">검색</a>
                </td>
            </tr>
        </table>
    </form>

    <div style="float: right; margin-bottom: 10px">
        <a href="detailCustomer" id="addBtn" class="btn btn-dark">추가</a>
    </div>

    <div id="customerGrid"/>
</div>

<script>

    $("#gridArea").append($("<div/>").attr("id", "customerArea"))

    var customerGrid = new tui.Grid({
        el: document.getElementById('customerGrid'),
        scrollX: false,
        scrollY: false,
        editable: false,
        rowHeaders : ['checkbox'],
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
                header: 'CEO',
                name: 'manager'
            },
            {
                header: 'CEO 전화번호',
                name: 'managerNumber'
            },
            {
                header: '사용여부',
                name: 'useYN'
            }
        ]
    });

    customerGrid.resetData(${customerList});
    customerGrid.refreshLayout();

    customerGrid.on('click', ev => {
        var customer = customerGrid.getRow(ev.rowKey);
        location.href = "<c:url value='/detailCustomer' />?customerId=" + customer.customerId;
    });

    $("#searchAreaBtn").on('click', function() {

        var arr = $("#searchProjectForm").serializeArray();
        var searchCondition = {};

        arr.forEach(function (obj) {
            searchCondition[obj.name] = obj.value;
        });

       $.ajax({
           url: "<c:url value='/searchCustomer' />",
           data: searchCondition,
           type: "GET",
           success: function (data) {
               customerGrid.resetData(data);
               customerGrid.refreshLayout();
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
