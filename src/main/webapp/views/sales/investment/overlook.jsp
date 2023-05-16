<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Admin</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Favicons -->
    <link href="/sales/assets/img/favicon.png" rel="icon">
    <link href="/sales/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/sales/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="/sales/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/sales/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/sales/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/sales/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="/sales/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/sales/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <!-- Template Main CSS File -->
    <link href="/sales/assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Gp
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>
<style>
    .dropbtn {
        background-color: #04AA6D;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }

    .dropbtn:hover, .dropbtn:focus {
        background-color: #3e8e41;
    }

    #myInput {
        box-sizing: border-box;
        background-image: url('searchicon.png');
        background-position: 14px 12px;
        background-repeat: no-repeat;
        font-size: 16px;
        padding: 14px 20px 12px 45px;
        border: none;
        border-bottom: 1px solid #ddd;
    }

    #myInput:focus {outline: 3px solid #ddd;}

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f6f6f6;
        min-width: 230px;
        overflow: auto;
        border: 1px solid #ddd;
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown a:hover {background-color: #ddd;}
    .progress-bar {
        background-color: blueviolet;
    }
    .show {display: block;}
</style>
<script>

    let stocksearch = {
        init : ()=>{
            $('#stockSearch_btn').click(()=>{
                $('.progress').show();
                stocksearch.startProgressBar();
                let keywords = $('#searchCompany').val();
                console.log("clicked");
                $.ajax({
                    url:'/sales/investment/search',
                    type: 'GET',
                    data: {
                        keywords : keywords
                    }
                }).done(
                    (data)=>{

                        console.log("success");
                        stocksearch.display(data);
                    }
                ).fail(
                        ()=>{
                            console.log("failure");
                        }
                    );

                stockexchange.display();
            })
        },//stocksearch.init;
        display : (data)=>{
            $('#tableFX').show();
            const bestMatches = JSON.parse(data).bestMatches;
            console.log(bestMatches);
            const tableBody = $('.table tbody');
            tableBody.empty(); // 기존 테이블 내용 제거
            for (let seq in bestMatches) {
                let item = bestMatches[seq];
                const row = $('<tr></tr>');
                let symbol = $('<td></td>').text(item["1. symbol"]);
                console.log(item["1. symbol"]);
                let name = $('<td></td>').text(item["2. name"]);
                let region = $('<td></td>').text(item["4. region"]);
                let button = $('<button></button>').text('+');
                button.on('click', function() {
                    // Handle the button click event here
                    console.log('Button clicked for symbol:', item["1. symbol"]);
                    let symbol2 = item["1. symbol"];
                    stockexchange.click(symbol2);
                });
                row.append(symbol);
                row.append(name);
                row.append(region);
                row.append(button);
                tableBody.append(row);
            }
        },
        hideProgressBar: () => {
            if (stocksearch.progressBar) {
                stocksearch.progressBar.stop().css('width', '0');
            }
        },
        startProgressBar: () => {
            stocksearch.progressBar = $('.progress-bar');
            stocksearch.progressBar.css('width', '0').animate({
                width: '100%'
            }, 1000, () => {
                $('.progress').hide();
            });
        },
    }


    // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
    let stockexchange = {
        init : ()=>{
            $('#chatGPT_btn').click(()=>{
                let symbol = $('#request').val();
                console.log("clicked");
                $('.progress').show();
                stockexchange.startProgressBar();
                $.ajax({
                    url:'/sales/investment/generate',
                    type: 'GET',
                    data: {
                        symbol : symbol
                    }
                }).done(
                    (data)=>{
                        console.log("success");
                        stockexchange.display(data);
                    }
                )
                    .fail(
                        ()=>{
                            console.log("failure");
                        }
                    );

                stockexchange.display();
            })

        },
        click: (symbol2)=>{
            $('.progress').show();
            $.ajax({
                url:'/sales/investment/generate',
                type: 'GET',
                data: {
                    symbol : symbol2
                }

            }).done(
                (data)=>{
                    console.log("success");
                    stockexchange.display(data);
                }
            )
                .fail(
                    ()=>{
                        console.log("failure");
                    }
                );
        },
        hideProgressBar: () => {
            if (stockexchange.progressBar) {
                stockexchange.progressBar.stop().css('width', '0');
            }
        },
        startProgressBar: () => {
            stockexchange.progressBar = $('.progress-bar');
            stockexchange.progressBar.css('width', '0').animate({
                width: '100%'
            }, 10000, () => {
                $('.progress').hide();
            });
        },
        display : (data)=>{
            const obj = JSON.parse(data);
            console.log(obj);
            //chart
            const set = obj["Time Series (Daily)"];
            let ranges = [];
            let averages = [];
            for (let date in set) {
                let item = set[date];
                let low = parseInt(item["3. low"]);
                let high = parseInt(item["2. high"]);
                let open = parseInt(item["1. open"]);
                ranges.push([low, high]);
                averages.push([open]);
            }

            console.log("=====1======");
            console.log(ranges);
            console.log("=====2======");
            console.log(averages);
            Highcharts.chart('container', {

                title: {
                    text: 'STOCK TREND : ' + obj["Meta Data"]["2. Symbol"].toUpperCase(),
                    align: 'left'
                },

                subtitle: {
                    text: '통화기준 : $USD'+' __ powered by Alpha Vantage in NYSE',
                    align: 'left'
                },

                xAxis: {
                    type: 'datetime',
                    accessibility: {
                        rangeDescription: 'Range: Jul 1st 2022 to Jul 31st 2022.'
                    }
                },

                yAxis: {
                    title: {
                        text: 'Stock Price - USD'
                    }
                },

                tooltip: {
                    crosshairs: true,
                    shared: true,
                    valueSuffix: '$'
                },

                plotOptions: {
                    series: {
                        pointStart: Date.UTC(2022, 12, 19),
                        pointIntervalUnit: 'day'
                    }
                },

                series: [{
                    name: obj["Meta Data"]["2. Symbol"].toUpperCase(),
                    data: averages,//변수 data
                    zIndex: 1,
                    marker: {
                        fillColor: 'white',
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[0]
                    }
                }, {
                    name: '최고가 - 최저가',
                    data: ranges,//변수 data
                    type: 'arearange',
                    lineWidth: 0,
                    linkedTo: ':previous',
                    color: Highcharts.getOptions().colors[0],
                    fillOpacity: 0.3,
                    zIndex: 0,
                    marker: {
                        enabled: false
                    }
                }]
            });

        }//display
    }//



    $(()=>{
        $('#tableFX').hide();
        $('.progress').hide();
        stocksearch.init();
        stockexchange.init();

    })
</script>

<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="index.html">KB Finance<span>.</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="/sales/assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                <li><a class="nav-link scrollto" href="#about">About</a></li>
                <li><a class="nav-link scrollto" href="#services">Services</a></li>
                <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>
                <li><a class="nav-link scrollto" href="#team">Team</a></li>
                <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="#">Drop Down 1</a></li>
                        <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">Deep Drop Down 1</a></li>
                                <li><a href="#">Deep Drop Down 2</a></li>
                                <li><a href="#">Deep Drop Down 3</a></li>
                                <li><a href="#">Deep Drop Down 4</a></li>
                                <li><a href="#">Deep Drop Down 5</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Drop Down 2</a></li>
                        <li><a href="#">Drop Down 3</a></li>
                        <li><a href="#">Drop Down 4</a></li>
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

        <a href="/sales/gpt" class="get-started-btn scrollto">Advice from GPT-4</a>
<%--        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>--%>

    </div>
</header><!-- End Header -->

<!-- ======= Hero Section ======= -->


<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">

            <div class="row">
                <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                    <figure class="highcharts-figure">
                        <div id="container"></div>
                        <p class="highcharts-description">
                        </p>
                    </figure>
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
                    <h3>당신은 역사를 쓰고 있는 경영인입니다.</h3>
                    <p class="fst-italic">
                        주식시장은 파도와 같습니다. 큰파도와 작은 파도가 반복됩니다. 면밀하게 확인하세요.
                    </p>
                    <p>
                    <div class="input-group">
                    <input type="search" id="searchCompany" class="form-control rounded" placeholder="어떤 회사를 찾으시나요?" aria-label="Search" aria-describedby="search-addon" />
                    <button type="button" id="stockSearch_btn" class="btn btn-outline-warning">search</button>
                    </div>
                    <div class="input-group">
                    <input type="search" id="request" class="form-control rounded" placeholder="최준혁님. 빠른 검색을 위해선 코드를 직접 넣으세요!" aria-label="Search" aria-describedby="search-addon" />
                        <button type="button" id="chatGPT_btn" class="btn btn-outline-warning">search</button>
                    </div>
                    <div class="progress">
                        <div class="progress-bar progress-bar-success" role="progressbar"
                             aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                        </div>
                    </div>
                    <div>
                        <table class="table" id="tableFX">
                            <h4 id="fXtableTitle"> </h4>
                            <thead>
                            <tr>
                                <th>코드</th>
                                <th>이름</th>
                                <th>상장국가</th>
                                <th>차트선택</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    </p>


                </div>
            </div>

        </div>
    </section><!-- End About Section -->



    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
        <div class="container" data-aos="fade-up">

            <div class="row">
                <div class="image col-lg-6" style='background-image: url("/views/sales/earning/assets/img/features.jpg");' data-aos="fade-right"></div>
                <div class="col-lg-6" data-aos="fade-left" data-aos-delay="100">

                </div>
            </div>

        </div>
    </section><!-- End Features Section -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-6">
                    <div class="footer-info">
                        <h3>Gp<span>.</span></h3>
                        <p>
                            A108 Adam Street <br>
                            NY 535022, USA<br><br>
                            <strong>Phone:</strong> +1 5589 55488 55<br>
                            <strong>Email:</strong> info@example.com<br>
                        </p>
                        <div class="social-links mt-3">
                            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Our Services</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Our Newsletter</h4>
                    <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
                    <form action="" method="post">
                        <input type="email" name="email"><input type="submit" value="Subscribe">
                    </form>

                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong><span>Gp</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
</footer><!-- End Footer -->

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="/sales/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="/sales/assets/vendor/aos/aos.js"></script>
<script src="/sales/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/sales/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/sales/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/sales/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="/sales/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/sales/assets/js/main.js"></script>





</body>

</html>