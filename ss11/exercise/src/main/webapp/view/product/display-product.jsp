<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="margin-left: 40%">Product Management</h1>
<table style="margin-left: 25%; width: 50%">
    <tr>
        <td>
            <a href="/product?action=addNewProduct">Add new Product</a>
        </td>
    </tr>
    <tr style="height: 50px; text-align: left">
        <th>Sequence Number</th>
        <th>Name Product</th>
        <th>Price Product</th>
        <th>Description Product</th>
        <th>Manufacturer Product</th>
    </tr>
    <c:forEach var="display" items="${list}" varStatus="loop">
        <tr style="height: 50px; text-align: left">
            <td>
                <c:out value="${loop.count}"></c:out>
            </td>
            <td>
                <c:out value="${display.name}"></c:out>
            </td>
            <td>
                <c:out value="${display.price}"></c:out>
            </td>
            <td>
                <c:out value="${display.description}"></c:out>
            </td>
            <td>
                <c:out value="${display.manufacturer}"></c:out>
            </td>
            <td>
                <button><a href="/product?action=editProduct&id=${display.id}">Edit</a></button>
                <button><a href="/product?action=deleteProduct&id=${display.id}">Delete</a></button>
                <button><a href="/product?action=detailProduct">Detail</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
