<%--
  Created by IntelliJ IDEA.
  User: hansj
  Date: 2021-04-13
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="layout_head.jsp"></jsp:include>
</head>
<style>
    @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
    body, .tui-grid-container { font-family: "Nanum Gothic"; }
</style>
<body>

<jsp:include page="layout_body.jsp">
    <jsp:param name="pageLink" value="${pageLink}"/>
</jsp:include>

</body>
</html>
