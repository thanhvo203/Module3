<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/user?action=edit">
    <table>
        <tr>
            <td>id: </td>
            <td><input name="id" value="${id}"></td>
        </tr>
        <tr>
            <td>name: </td>
            <td><input name="name" type="text"></td>
        </tr>
        <tr>
            <td>email: </td>
            <td><input name="email" type="text"></td>
        </tr>
        <tr>
            <td>country: </td>
            <td><input name="country" type="text"></td>
        </tr>
        <tr>
            <td><input name="submit" type="submit"></td>
        </tr>
    </table>
</form>

</body>
</html>
