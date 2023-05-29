<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/29/2023
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/ChangeMoneyServlet">
    <ul>
        <li>
            <label>Product Discription</label>
            <input type="text" name="discription">
        </li>
        <li>
            <label for="price">List Price</label>
            <input name="price" id="price" type="number">
        </li>
        <li>
            <label for="discount">Discount Percent</label>
            <input name="discount" id="discount" type="number">
        </li>
        <li>
            <input type="submit" value="calculator">
        </li>
    </ul>
</form>

</body>
</html>
