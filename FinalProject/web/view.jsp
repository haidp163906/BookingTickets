<%-- 
    Document   : view
    Created on : Jun 21, 2022, 9:41:05 PM
    Author     : Huu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết phim</title>        
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
        <div class="content">
            <div class="moviein4">
                <c:set var="p" value="${requestScope.movie}"/>

                <h1 style="margin-top: 66px; text-align: center">${p.filmID}</h1>
                <div style="width: 30%; float: left;text-align: center;text-decoration: none">
                    <img src="movie/image?name=${p.image}" width="auto" height="auto" style="display: block;margin-left: auto; margin-right: auto;height: 336px;width: 228px;"/>
                    <br/>
                    <c:if test="${ad.role==1}">
                        <a href="addschedulefilm?id=${p.filmID}">Thêm Phòng chiếu</a>
                        <a href="deletefilm?id=${p.filmID}">Xóa phim</a>
                        <a href="changefilm?id=${p.filmID}">Sửa phim</a>
                    </c:if>

                </div>

                <div style="width: 55%; float: left">
                    ${p.information}
                </div>
            </div>
            <div class="break">

            </div>
            <div class="chart_movie">
                <h2>Sở thích theo giới tính</h2>
                <canvas id="myChart"></canvas>
            </div>
            <div class="break">

            </div>
            <div class="schedule">

                <c:forEach items="${requestScope.listday}" var="ld">
                    <p>Ngày:  ${ld}</p>
                    <c:forEach items="${p.schedules}" var="s">
                        <c:if test="${s.day==ld}">
                            <p>Giờ chiếu: <a href="booking?film=${p.filmID}&sid=${s.SID}">${s.startTime}-${s.endTime}</a> </p>
                        </c:if>

                    </c:forEach>
                    <br/> 
                </c:forEach>

            </div>
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
                            <li><a href="#"> </a></li>
                            <li><a href="#"> </a></li>
                            <li><a href="#"> </a></li>
                            <li><a href="#"> </a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>online shop</h4>
                        <ul>
                            <li><a href="#"> </a></li>
                            <li><a href="#"> </a></li>
                            <li><a href="#"> </a></li>
                            <li><a href="#"> </a></li>
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
                <script>
            const data = {
            labels: [
            'nam','nu'
            ],
                    datasets: [{
                    label: 'My First Dataset',
                            data: [
                                ${p.male},${p.female}
                            ],
                            backgroundColor: [
                                    'rgb(255, 99, 132)',
                                    'rgb(54, 162, 235)',
                            ],
                            hoverOffset: 4
                    }]
            };
            const config = {
            type: 'pie',
                    data: data,
            };
            const myChart = new Chart(
                    document.getElementById('myChart'),
                    config
                    );
        </script>
    </body>
</html>
