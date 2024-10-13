<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.4.0/nouislider.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.4.0/nouislider.min.js"></script>
</head>
<body>
<div class="container my-4">
    <div class="row">
        <!-- Sidebar tìm kiếm -->
        <div class="col-3 p-3 card">
            <form method="get" action="/product/hien-thi">
                <div class="product-search-info mt-3">
                    <label class="mb-1"><b>Tên sản phẩm:</b></label>
                    <input name="keyword" value="${param.keyword}" class="form-control" placeholder="Nhập tên sản phẩm để tìm" />
                </div>

                <div class="brand-search-info mt-3">
                    <label><b>Loại sản phẩm:</b></label>
                    <div class="mt-2">
                        <input type="radio" name="categoryId" checked value="" />
                        <span>Tất cả</span>
                    </div>
                    <c:forEach var="c" items="${categoryList}">
                        <div class="mt-1">
                            <input name="categoryId" type="radio" value="${c.id}"
                                   <c:if test="${param.categoryId==c.id}">checked</c:if>
                            />
                            <span>${c.name}</span>
                        </div>
                    </c:forEach>
                </div>

                <div class="price-search-info mt-3">
                    <label><b>Mức giá:</b></label>
                    <div id="priceRange"></div>
                    <input type="hidden" name="minPrice" id="minPrice" value="${param.minPrice}">
                    <input type="hidden" name="maxPrice" id="maxPrice" value="${param.maxPrice}">
                </div>
                <button type="submit" class="btn btn-primary mt-4 mb-4">Tìm kiếm</button>
            </form>
        </div>

        <!-- Danh sách sản phẩm -->
        <div class="col-9">
            <h3 class="text-center mt-3">DANH SÁCH PRODUCT</h3>
            <ul class="list-unstyled row">
                <c:forEach var="p" items="${productList}">
                    <li class="list-item col-sm-4 mt-3">
                        <div class="item-container">
                            <a href="/detail/${p.id}" class="product-item">
                                <img src="${p.image}" class="product-image" alt="${p.name}" style="width: 100%; height: auto;"/>
                                <div class="item-info mt-2">
                                    <div>
                                        <span class="product-name">${p.name}</span>
                                    </div>
                                    <div>
                                        <span class="price-title">Giá bán:</span>
                                        <span class="price">${p.price} ₫</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${page.number == 0 ? 'disabled' : ''}">
                        <a class="page-link" href="?p=0&keyword=${param.keyword}&categoryId=${param.categoryId}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">&laquo;</a>
                    </li>
                    <li class="page-item ${page.number == 0 ? 'disabled' : ''}">
                        <a class="page-link" href="?p=${page.number - 1}&keyword=${param.keyword}&categoryId=${param.categoryId}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">&lsaquo;</a>
                    </li>
                    <c:forEach begin="0" end="${page.totalPages - 1}" var="p">
                        <li class="page-item ${page.number == p ? 'active' : ''}">
                            <a class="page-link" href="?p=${p}&keyword=${param.keyword}&categoryId=${param.categoryId}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">${p + 1}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${page.number == page.totalPages - 1 ? 'disabled' : ''}">
                        <a class="page-link" href="?p=${page.number + 1}&keyword=${param.keyword}&categoryId=${param.categoryId}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">&rsaquo;</a>
                    </li>
                    <li class="page-item ${page.number == page.totalPages - 1 ? 'disabled' : ''}">
                        <a class="page-link" href="?p=${page.totalPages - 1}&keyword=${param.keyword}&categoryId=${param.categoryId}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">&raquo;</a>
                    </li>
                </ul>
                <span>Hiển thị ${page.number * page.size + 1}-${Math.min((page.number + 1) * page.size, page.totalElements)} trên tổng số ${page.totalElements} sản phẩm</span>
            </nav>
            <div class="text-center mt-3">
                <a href="/product/add" class="btn btn-primary">Thêm sản phẩm</a>
            </div>
        </div>
    </div>
</div>
<script>
    var priceRange = document.getElementById('priceRange');
    var minPrice = parseFloat(document.getElementById('minPrice').value) || 0;
    var maxPrice = parseFloat(document.getElementById('maxPrice').value) || 10000;

    noUiSlider.create(priceRange, {
        start: [minPrice, maxPrice],
        connect: true,
        range: {
            'min': 0,
            'max': 10000
        },
        tooltips: [true, true],
        format: {
            to: function (value) {
                return value.toFixed(0);
            },
            from: function (value) {
                return Number(value);
            }
        }
    });

    priceRange.noUiSlider.on('update', function (values, handle) {
        document.getElementById('minPrice').value = values[0];
        document.getElementById('maxPrice').value = values[1];
    });
</script>
</body>
</html>
