<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Result: </h1>
<div>
    <label>${firstNumber}</label>
    <c:set var="operand" value="${operand}"></c:set>
    <c:choose>
        <c:when test="${operand == 'Addition'}">+</c:when>
        <c:when test="${operand == 'Subtraction'}">-</c:when>
        <c:when test="${operand == 'Multiply'}">*</c:when>
        <c:when test="${operand == 'Division'}">/</c:when>
    </c:choose>
    <label>${secondNumber}</label>
    <label>=</label>
    <label>${Result}</label>
</div>


</body>
</html>
