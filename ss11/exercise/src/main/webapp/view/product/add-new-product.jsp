<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/product?action=addNewProduct">
<table>
    <tr>
        <th>Add New Product</th>
    </tr>
    <tr>
        <td>
            Name Product:
        </td>
        <td>
            <input type="text" name="name">
        </td>
    </tr>
    <tr>
        <td>
            Price Product:
        </td>
        <td>
            <input type="text" name="price">
        </td>
    </tr>
    <tr>
        <td>
            Description Product:
        </td>
        <td>
            <input type="text" name="description">
        </td>
    </tr>
    <tr>
        <td>
            Manufacturer Product:
        </td>
        <td>
            <input type="text" name="manufacturer">
        </td>
    </tr>
    <tr>
        <td>
           <input type="submit" value="Submit" name="submit">
        </td>
    </tr>
</table>
</form>
<a href="/product?action=backToMeu">Back To Menu</a>
</body>
</html>
