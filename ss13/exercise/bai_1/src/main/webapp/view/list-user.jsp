<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    List Product
</center>
<center>
<table style="text-align: center">
    <tr>
        <th>STT</th>
        <th>Name User</th>
        <th>Email User</th>
        <th>Country User</th>
    </tr>
    <c:forEach items="${users}" varStatus="loop" var="user">
        <tr>
            <td><c:out value="${loop.count}"></c:out></td>
            <td><c:out value="${user.name}"></c:out></td>
            <td><c:out value="${user.email}"></c:out></td>
            <td><c:out value="${user.country}"></c:out></td>
            <td><a href="/user?action=edit&id=${user.id}">Edit</a></td>
            <td><a href="/user?action=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</center>
</body>
</html>
