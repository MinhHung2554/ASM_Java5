<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update user</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-3">
    <h3 class="d-flex justify-content-right mt-3">CHỈNH SỬA NGƯỜI DÙNG</h3>
    <form:form action="/account/update/${account.username}" method="post" modelAttribute="account">
        <form:hidden path="username"/>
        <form:hidden path="password"/>
        <p>fullname:
            <form:input path="fullname"/>
            <form:errors path="fullname"/>
        </p>
        <p>email:
            <form:input path="email"/>
            <form:errors path="email"/>
        </p>
        <p>activated:
            <form:checkbox path="activated" value="1"/>
        </p>
        <p>admin:
            <form:checkbox path="admin" value="1"/>
        </p>
        <button class="btn btn-warning">Update</button>
    </form:form>
</div>
</body>
</html>