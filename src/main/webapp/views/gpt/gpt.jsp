<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>GPT</title>
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

    <!-- Template Main CSS File -->
    <link href="/sales/assets/css/style.css" rel="stylesheet">
    <style>
        body {
            background-color: #000;
            color: #fff;
            margin: 100px;
        }
        .titleBlock {
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .titleBlock img {
            margin-right: 20px;
        }

        .titleBlock q {
            font-size: 18px;
            font-style: italic;
        }
        .input-group .form-control {
            color: #fff;
            background-color: #333;
            border: 1px solid #555;
            border-radius: 4px;
            padding: 6px 12px;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        }

        /*.input-group .btn {*/
        /*    color: #fff;*/
        /*    background-color: #333;*/
        /*    border-color: #555;*/
        /*    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;*/
        /*}*/


        .progress-bar {
            background-color: green;
        }
        #response {
            color: #fff;
            background-color: #333;
            border: 1px solid #555;
            border-radius: 4px;
            padding: 6px 12px;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            width: 100%;
            resize: vertical;
        }
    </style>


</head>
<script>

    let chatGPT = {
        progressBar: null,
        init : ()=>{
            $('#chatGPT_btn').click(()=>{
                let message = $('#request').val();
                console.log("clicked");

                // Hide progress bar initially
                chatGPT.hideProgressBar();
                // Hide progress bar initially
                $('.progress').show();
                $.ajax({
                    url:'/sales/gpt/generate',
                    type: 'GET',
                    data: {
                        message: message
                    }
                }).done(
                    (data)=>{
                        console.log("success");
                        chatGPT.display(data);
                    }
                )
                    .fail(
                        ()=>{
                            console.log("failure");
                        }
                    );
                // Start progress bar animation
                chatGPT.startProgressBar();
            })
        },//chatGPT- init
        display : (data)=>{
            console.log(data);
            $('#response').val(data);
        },
        hideProgressBar: () => {
            if (chatGPT.progressBar) {
                chatGPT.progressBar.stop().css('width', '0');
            }
        },

        startProgressBar: () => {
            chatGPT.progressBar = $('.progress-bar');
            chatGPT.progressBar.css('width', '0').animate({
                width: '100%'
            }, 10000, () => {
                $('.progress').hide();
            });
        }
    }
    $(()=>{
        // Hide progress bar initially
        $('.progress').hide();
        chatGPT.init();

    });
</script>

<body>
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="/sales">KB Finance<span>.</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="/sales/assets/img/logo.png" alt="" class="img-fluid"></a>-->


        <a href="/sales/gpt" class="get-started-btn scrollto">Advice from GPT-4</a>
        <%--        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>--%>

    </div>
</header><!-- End Header -->


<div class="titleBlock">
    <div>
        <img src="/images/openai.jpeg">
    </div>
    <div>
        <q> 정보의 세계가 당신의 손안에 있고,즉각적인 통신이 가능한 네트워크가 전세계를 가로지르고 있습니다.<br>
            하지만, 아직도 우리의 미래에 대한 통합된 비전이 형성되지 않았습니다.<br>
            담대하게 이끌어 지속성 있는 발전을 이룩해주십시오.</q>
    </div>
</div>

<div class="input-group">
    <input type="search" id="request" class="form-control rounded" placeholder="최준혁님. 어떤 조언이 필요하신가요?" aria-label="Search" aria-describedby="search-addon" />
    <button type="button" id="chatGPT_btn" class="btn btn-outline-success">search</button>
</div>
<div class="progress">
    <div class="progress-bar progress-bar-success" role="progressbar"
         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:0%">
    </div>
</div>
<div>
    <h4>Advice</h4>

    <textarea name="response" class="form-control" id="response" rows="15" readonly></textarea>
</div>

</body>
</html>