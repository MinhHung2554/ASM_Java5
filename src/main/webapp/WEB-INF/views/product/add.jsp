<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Them product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-3">
    <h3 class="d-flex justify-content-right mt-3">THÊM SẢN PHẨM</h3>
    <form:form action="/product/add" method="post" modelAttribute="pro">
        <form:hidden path="id"/>
        <p>name:
            <form:input path="name"/>
            <form:errors path="name"/>
        </p>
        <p>categoryId:
            <form:select path="category">
                <form:option value="">---------</form:option>
                <form:options items="${dsCate}" itemValue="id" itemLabel="name"/>
            </form:select>
            <form:errors path="category"/>
        </p>
        <p>image:
            <form:input path="image"/>
            <form:errors path="image"/>
        </p>
        <p>NgayTao:
            <form:input path="createDate"/>
            <form:errors path="createDate"/>
        </p>
        <p>price:
            <form:input path="price"/>
            <form:errors path="price"/>
        </p>
        <p>available:
            <form:checkbox path="available" value="1"/>
        </p>
        <button class="btn btn-primary">Luu lai</button>
    </form:form>
</div>
</body>
</html>