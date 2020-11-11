<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8" />
    <meta name="author" content="Codecool" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <title>Codecool Shop</title>

    <!-- Bootstrap components -->
    <!-- Latest compiled and minified Jquery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

    <!--Latest compiled and minified Popper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <!-- Latest compiled and minified CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <!-- End of Bootstrap components -->

    <link rel="stylesheet" type="text/css" href="/static/css/custom.css" />
</head>

<body>

<div class="jumbotron text-center">
    <h1>Codecool Shop</h1>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Filter by :</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Category
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a href="/" class="dropdown-item"> All </a>
                    <a class="dropdown-item" th:each="cat : ${category}" th:text="${cat.name}" th:attr="href='/category?id=' + ${cat.id}">Action</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Supplier
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a href="/" class="dropdown-item"> All </a>
                    <a class="dropdown-item" th:each="sup : ${supplier}" th:text="${sup.name}" th:attr="href='/supplier?id=' + ${sup.id}">Action</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" method="get" action="/search">
            <input class="form-control mr-sm-2" name="search" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container">

    <div id="products" class="row">
        <div class="col col-sm-12 col-md-6 col-lg-4" th:each="prod : ${products}">
            <div class="card">
                <img class="" src="http://placehold.it/400x250/000/fff" th:attr="src='/static/img/product_' + ${prod.id} + '.jpg'" alt="" />
                <div class="card-header">
                    <h4 class="card-title" th:text="${prod.name}">Product name</h4>
                    <p class="card-text" th:text="${prod.description}">Product description... </p>
                </div>
                <div class="card-body">
                    <div class="card-text">
                        <p class="lead" th:text="${prod.getPrice()}">100 USD</p>
                    </div>
                    <div class="card-text">
                        <a class="btn btn-success" href="#">Add to cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div th:replace="footer.html :: copy"></div>

</body>
</html>