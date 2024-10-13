<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sach Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-3">
    <h3 class="d-flex justify-content-center mt-3">DANH SÁCH Account</h3>
    <table class="table table-striped mt-2">
        <thead>
        <tr>
            <th scope="col">username</th>
            <th scope="col">password</th>
            <th scope="col">fullname</th>
            <th scope="col">email</th>
            <th scope="col">activated</th>
            <th scope="col">admin</th>
            <th scope="col">action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="u" items="${listAccount}">
            <tr>
                <th>${u.username}</th>
                <th>${u.password}</th>
                <th>${u.fullname}</th>
                <th>${u.email}</th>
                <th>${u.activated == 1 ? "Đang hoạt động" : "Không hoạt động"}</th>
                <th>${u.admin == 1 ? "Admin" : "User"}</th>
                <th>
                    <a href="/account/update/${u.username}" class="btn btn-warning" me-2>Update</a>
                    <a onclick="return confirm('Do you want to delete?')"
                       href="/account/delete/${u.username}" class="btn btn-danger" me-2>Delete</a>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br><br>
    <a href="/account/add" class="btn btn-primary">Them nguoi dung</a>
</div>
</body>
</html>
