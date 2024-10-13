<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sach Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-3">
    <form>
        <p>Tên: <input name="keyword" value="${param.keyword}"></p>
        <p>Giá từ: <input name="minPrice" type="number" value="${param.minPrice}"></p>
        <p>Giá đến: <input name="maxPrice" type="number" value="${param.maxPrice}"></p>
        <button class="btn btn-secondary">Tìm kiếm</button>
    </form>
</div>
<div class="container mt-3">
    <h3 class="d-flex justify-content-center mt-3">DANH SÁCH PRODUCT</h3>
    <table class="table table-striped mt-2">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Image</th>
            <th scope="col">Price</th>
            <th scope="col">Available</th>
            <th scope="col">action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="pro">
            <tr>
                <th>${pro.id}</th>
                <th>${pro.name}</th>
                <th>${pro.category.name}</th>
                <td>
                        <%--                    <img src="../../../Image_Phone/${pro.image}" class="img-fluid" alt="Product Image" style="max-width: 100px;">--%>
                        ${pro.image}
                </td>
                <th>${pro.price}</th>
                <th>${pro.available == 1 ? "Còn hàng" : "Hết hàng"}</th>
                <th>
                    <a href="/product/update/${pro.id}" class="btn btn-warning" me-2>Update</a>
                    <a onclick="return confirm('Do you want to delete?')"
                       href="/product/delete/${pro.id}" class="btn btn-danger" me-2>Delete</a>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--    <a href="/product/page?p=0">First</a>--%>
    <%--    <a href="/product/page?p=${page.number-1}">Prev</a>--%>
    <%--    <a href="/product/page?p=${page.number+1}">Next</a>--%>
    <%--    <a href="/product/page?p=${page.totalPages-1}">Last</a>--%>
    <%--    <div>Showing page ${page.number + 1}/${page.totalPages}</div>--%>
    <c:if test="${page.totalPages>0}">
        <c:forEach begin="0" end="${page.totalPages-1}" var="p">
            <a href="/product/hien-thi?p=${p}&keyword=${param.keyword}">${p+1}</a>
        </c:forEach>
    </c:if>
    <br><br>
    <a href="/product/add" class="btn btn-primary">Them sản phẩm</a>
</div>
</body>
</html>
