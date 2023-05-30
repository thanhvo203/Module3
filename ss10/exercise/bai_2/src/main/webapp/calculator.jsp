<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Calculator</h1>
<form method="post" action="/calculator">
    <fieldset>
        <legend>Calculator</legend>
        <ul>
            <li>
                <label>First Operand</label>
                <input name="firstNumber" type="number">
            </li>
            <li>
                <label>Operator</label>
                <select name="operator">
                    <option>Addition</option>
                    <option>Subtraction</option>
                    <option>Multiply</option>
                    <option>Division</option>
                </select>
            </li>
            <li>
                <label>Second Operand</label>
                <input name="secondNumber" type="number">
            </li>
            <li>
                <label> </label>
                <input type="submit" name="total" value="Calculate">
            </li>
        </ul>
    </fieldset>
</form>

</body>
</html>
