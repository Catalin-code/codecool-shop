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

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/custom.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>

<div class="jumbotron text-center">
    <h1>Codecool Shop</h1>
</div>

<div class="px-4 px-lg-0">

    <div class="pb-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                    <!-- Shopping cart table -->
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="p-2 px-3 text-uppercase">Product</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Price</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Quantity</div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <div th:each="prod,iterStat : ${cart}">
                                <tr>
                                    <th scope="row" class="border-0">
                                        <div class="p-2">
                                            <div class="ml-3 d-inline-block align-middle">
                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle" th:text="${prod.key}"></a></h5><span class="text-muted font-weight-normal font-italic d-block"></span>
                                            </div>
                                        </div>
                                    </th>
                                    <td class="border-0 align-middle" th:text="${prod.value} + ' $'"><strong></strong></td>
                                    <td class="border-0 align-middle"><strong th:text="${cart2.get(prod.key)}"></strong></td>
                                    <td class="border-0 align-middle">
                                        <form action="/cart" method="post">
                                            <input type="hidden" name="prodName" th:attr="value=${prod.key}"/>
                                            <input type="hidden" name="quantity" th:attr="value=${cart2.get(prod.key)}">
                                            <input type="hidden" name="prodPrice" th:attr="value=${prod.value}"/>
                                            <button name="Add" type="submit" class="btn btn-success"> Add</button>
                                        </form>
                                    <td class="border-0 align-middle"><a href="">
                                        <form action="/cart" method="post">
                                            <input type="hidden" name="prodName" th:attr="value=${prod.key}"/>
                                            <input type="hidden" name="quantity" th:attr="value=${cart2.get(prod.key)}">
                                            <input type="hidden" name="prodPrice" th:attr="value=${prod.value}"/>
                                            <button name="Remove" type="submit"  class="btn btn-danger"> Remove</button>
                                        </form>
                                    <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                                </tr>
                            </div>
                            </tbody>
                        </table>
                    </div>
                    <!-- End -->
                </div>
            </div>

            <div class="row py-5 p-4 bg-white rounded shadow-sm">
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
                    <div class="p-4">
                        <ul class="list-unstyled mb-4">
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                                <h5 class="font-weight-bold" th:text="${total} + ' $'"></h5>
                            </li>
                        </ul><a href="#" class="btn btn-dark rounded-pill py-2 btn-block">Procceed to checkout</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div th:replace="footer.html :: copy"></div>

</body>
</html>