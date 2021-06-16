<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-14
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h4 style="margin-top: 20px;">고객</h4>

<form id="editCustomerForm" action="<c:url value="/detailCustomer"/>" method="post">
    <table class="table table-bordered table-form" style="margin-top: 20px; margin-bottom: 20px">
        <colgroup>
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="25%">
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="20%">
            <col width="10%" style="background: #f5f5f5; border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd">
            <col width="25%">
        </colgroup>
        <tr>
            <td><label>고객ID<br>(사업자등록번호)</label></td>
            <td><input class="form-control" id="customerId" name="customerId" type="text"></td>
            <td><label>고객명</label></td>
            <td><input class="form-control" id="customerName" name="customerName" type="text"></td>
            <td><label>주소</label></td>
            <td><input class="form-control" id="address" name="address" type="text" placeholder=""></td>
        </tr>
        <tr>
            <td><label>CEO</label></td>
            <td><input class="form-control" id="manager" name="manager" type="text" placeholder=""></td>
            <td><label>CEO 전화번호</label></td>
            <td><input class="form-control" id="managerNumber" name="managerNumber" type="text" placeholder=""></td>
            <td><label>사용여부</label></td>
            <td>
                <select id="useYN" name="useYN" class="form-control">
                    <option value="Y">Y</option>
                    <option value="N">N</option>
                </select>
            </td>
        </tr>
    </table>
</form>

<div style="float: right;">
    <c:if test="${haveObj ne true}">
        <a href="javascript:void(0);" id="addBtn" class="btn btn-dark">추가</a>
    </c:if>
    <c:if test="${haveObj eq true}">
        <a href="javascript:void(0);" id="modifyBtn" class="btn btn-dark">수정</a>
<%--        <a href="javascript:void(0);" id="deleteBtn" class="btn btn-dark">삭제</a>--%>
        <a href="javascript:void(0);" id="cancelBtn" class="btn btn-dark">취소</a>
        <a href="javascript:void(0);" id="saveBtn" class="btn btn-dark">저장</a>
    </c:if>
</div>

<script>

    var customer = ${customer};

    if(Object.keys(customer).length > 0) {

        setViewForm(true);

        var keys = Object.keys(customer);

        keys.forEach(function(key) {
            var name = "[name=" + key +"]";
            $(name).val(customer[key]);
        });
    }

    $('#modifyBtn').on('click', function () {
        setViewForm(false);
    });

    $("#cancelBtn").on('click', function () {
        setViewForm(true);
    });

    $("#addBtn, #saveBtn ").on('click', function () {
        $("#editCustomerForm").submit();
    })

    $("#deleteBtn").on('click', function (){
        $.ajax({
            url: "<c:url value='/deleteCustomer' />",
            type : "DELETE",
            data: { customerId : customer.customerId },
            success: function (data) {
                location.href = "<c:url value='/manageCustomer' />";
            }
        });
    });

    function setViewForm(mode) {
        if(mode) {
            $("#modifyBtn").show();
            $("#deleteBtn").show();;
            $("#saveBtn").hide();
            $("#cancelBtn").hide();
            $(".searchBtn").hide();

            $("input").not('#customerId').attr("disabled", true);
            $("#customerId").attr("readonly", true);
            $("textarea").attr("disabled", true);
            $("select").attr("disabled", true);

        } else {
            $("#modifyBtn").hide();
            $("#deleteBtn").hide();
            $("#saveBtn").show();
            $("#cancelBtn").show();
            $(".searchBtn").show();

            $("input").not('#customerId').attr("disabled", false);
            $("textarea").attr("disabled", false);
            $("select").attr("disabled", false);
        }
    }

</script>
