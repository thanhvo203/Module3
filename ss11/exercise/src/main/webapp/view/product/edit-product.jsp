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

<p>
    <a href="/product?action=backToMeu">Back To Menu</a>
</p>
<form method="post" action="/product?action=editProduct">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" value="${id}" name="id" readonly></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="number" name="price"></td>
            </tr>
            <tr>
                <td>Description: </td>
                <td><input type="text" name="description"></td>
            </tr>
            <tr>
                <td>Manufacturer: </td>
                <td><input type="text" name="manufacturer"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Edit Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
