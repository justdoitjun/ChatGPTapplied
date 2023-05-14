<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let login_form = {
        init:function(){
            $('#login_btn').click(function(){
                login_form.send();
            });
        },
        send:function(){
            $('#login_form').attr({
                'action':'/loginimpl',
                'method':'post'
            });
            $('#login_form').submit();
        }
    };

    $(function(){
        login_form.init();
    });
</script>

<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col">
                <p class="bread"><span><a href="/">Home</a></span> / <span><a href="/register">Register</a></span></p>
            </div>
        </div>
    </div>
</div>


<div id="colorlib-contact">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="contact-wrap">
                    <h3>LOGIN</h3>
                    <form id="login_form" class="contact-form">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="id">ID</label>
                                    <input type="text" name="id" id="id" class="form-control" placeholder="Your ID">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="pwd">Password</label>
                                    <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Your Password">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <button id="login_btn" type="button" class="btn btn-primary">LOGIN</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>