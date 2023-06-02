<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/1/2023
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
<link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>

    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/user?action=create">Add New User</a>
    </h2>
    <div class="col-6 mb-3">
        <form>
            <input type="hidden" name="action" value="search">
            <talbe>
                <tr>
                    <td>
                        <input type="text" name="country" placeholder="Enter country">
                    </td>
                    <td>
                        <button type="submit" class="btn btn-primary">
                            Search
                        </button>
                    </td>
                </tr>
            </talbe>
        </form>
    </div>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption>
            <h2>List of Users</h2>
        </caption>
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="loop" var="list" items="${list}">
            <tr>
                <td>
                    <c:out value="${loop.count}"/>
                </td>
                <td><c:out value="${list.name}"/></td>
                <td><c:out value="${list.email}"/></td>
                <td><c:out value="${list.country}"/></td>
                <td>
                    <button>
                        <a href="/user?action=edit&id=${list.id}">Edit</a>
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick="remove(${list.id},'${list.name}')">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete User</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Are you sure delete this user:
                    <span style="color:red" id="nameDelete"></span>
                </h3>
            </div>
            <div class="modal-footer">
                <form action="/user?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    function remove(id,name){
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</body>
</html>
