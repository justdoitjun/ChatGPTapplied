<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="colorlib-loader"></div>

<div id="page">

    <div class="colorlib-product">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
                    <h2> 고객 명단 </h2>
                </div>
            </div>
            <div class="row row-pb-md">
                <c:forEach var="obj" items="${clist}">
                    <div class="col-md-3 col-lg-3 mb-4 text-center">
                        <div class="product-entry border">
                            <a href="/cust/detail?id=${obj.id}" class="prod-img">
                                <img src="/images/cust/all/custall_customer.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
                            </a>
                            <div class="desc">
                                <h2><a href="#">${obj.name}</a></h2>
                                <span class="price">아이디 : ${obj.id}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="block-27">
                        <ul>
                            <li><a href="#"><i class="ion-ios-arrow-back"></i></a></li>
                            <li class="active"><span>1</span></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><i class="ion-ios-arrow-forward"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>




</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
</div>



<%--<div class="col-md-3 col-lg-3 mb-4 text-center">--%>
<%--    <div class="product-entry border">--%>
<%--        <a href="#" class="prod-img">--%>
<%--            <img src="images/item-1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">--%>
<%--        </a>--%>
<%--        <div class="desc">--%>
<%--            <h2><a href="#">Women's Boots Shoes Maca</a></h2>--%>
<%--            <span class="price">$139.00</span>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="w-100"></div>--%>