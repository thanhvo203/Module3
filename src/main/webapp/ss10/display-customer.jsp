<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/30/2023
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<a href="/CustomerServlet?action=list"></a>--%>
<form method="post" action="CustomerServlet">
    <h1 style="margin-left: 40%">Danh sách khách hàng</h1>
    <table style="margin-left: 30% ; width: 50%">
        <tr style="height: 50px; text-align: left">
            <th>STT</th>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa Chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach items="${list}" var="display" varStatus="loop">
             <tr style="height: 50px; text-align: left">
                 <td>
                     <c:out value="${loop.count}"></c:out>
                 </td>
                 <td>
                     <c:out value="${display.name}"></c:out>
                 </td>
                 <td>
                     <c:out value="${display.date}"></c:out>
                 </td>
                 <td>
                     <c:out value="${display.address}"></c:out>
                 </td>
                 <td>
                     <img src="<c:out value="${display.image}"></c:out>" style="height: 70px; width: 100px">
                 </td>
             </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
