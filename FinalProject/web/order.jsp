<%-- 
    Document   : cart
    Created on : Jul 5, 2022, 9:05:30 PM
    Author     : Huu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css"/>
    </head>
    <body>
        <c:set var="ad" value="${sessionScope.account}"/>
        <div id="user">
            <c:if test="${ad==null}">
                <ul id="user-nav">
                    <li><a href="login" >Đăng nhập</a></li>
                    <li><a href="signup" >Đăng kí</a></li>
                </ul>
            </c:if>
            <c:if test="${ad!=null}">
                <div id="user-info">
                    Hello ${ad.name}              
                    <a style="color: white;text-decoration: none" href="logout" >Đăng xuất</a>
                    <c:if test="${ad.role==1}">
                        <a style="color: white;text-decoration: none" href="addfilm" >Thêm phim</a>
                    </c:if>
                </div>
            </c:if>


        </div>
        <div id="header">
            <ul id="nav">
                <li><a href="list" >Phim hot</a></li>
                <li><a href="list" >Lịch chiếu phim</a></li>
                <li><a href="list" >Thông tin và ưu đãi</a></li>
                <li><a href="list" >Giá vé</a></li>
                <li><a href="order" >Giỏ hàng</a></li>
            </ul>

        </div>
        <div class="content" style="margin-top: 65px">
            <div style="height: 200px"></div>
            <div id="user-infor">
                <c:set var="user" value="${requestScope.user}"/>
                <h2>Thông tin thanh toán: </h2>
                <p>User:${user.name} &nbsp;&nbsp;&nbsp;Phone: ${user.phonenumber}&nbsp;&nbsp;&nbsp;Email:${user.email}</p>
            </div>
            <div id="cart">
                <c:forEach items="${requestScope.carts}" var="carts">
                    <div class="orderline">
                        <div class="deletecart">
                            <form action="deletecart" method="POST">
                                <input type="text" name="cartid" value="${carts.OID}" hidden>
                                <input type="submit" value="Hoàn tác">
                            </form>
                        </div>
                        <div class="info">
                            <h1>${carts.OID}</h1>
                            <h1>Tên phim: ${carts.filmID}</h1>
                            <h1>Ngày: ${carts.sch.day}</h1>
                            <h1>Giờ: ${carts.sch.startTime}</h1>
                            <h1>Vị trí:
                                <c:forEach items="${carts.positions}" var="po">
                                    ${po}&nbsp;
                                </c:forEach>
                            </h1>
                        </div>


                        <div class="break">

                        </div>
                    </div>

                </c:forEach>
            </div>
            <h2>Tổng tiền: ${requestScope.sum}</h2>
            <c:set var="er" value="${requestScope.failed}"/>
            <c:if test="${er!=null}">
                <h1>Vị trí ${er} đã được đặt</h1>
                <a href="order">Trở lại giỏ hàng</a>
            </c:if>
            <c:if test="${er==null}">
                <form action="order" method="POST">
                    <input type="text" name="uid" value="${user.userID}" hidden><!-- comment -->
                    <input type="submit" value="Thanh toán">
                </form>
            </c:if>

        </div>





        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col">
                        <h4>company</h4>
                        <ul>
                            <li><a href="#">about us</a></li>
                            <li><a href="#">our services</a></li>
                            <li><a href="#">privacy policy</a></li>
                            <li><a href="#">affiliate program</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>get help</h4>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">shipping</a></li>
                            <li><a href="#">returns</a></li>
                            <li><a href="#">order status</a></li>
                            <li><a href="#">payment options</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>online shop</h4>
                        <ul>
                            <li><a href="#">watch</a></li>
                            <li><a href="#">bag</a></li>
                            <li><a href="#">shoes</a></li>
                            <li><a href="#">dress</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>follow us</h4>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
