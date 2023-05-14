<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="breadcrumbs">
  <div class="container">
    <div class="row">
      <div class="col">
        <p class="bread"><span><a href="index.jsp">Home</a></span> / <span>About</span></p>
      </div>
    </div>
  </div>
</div>


<div class="colorlib-about">
  <div class="container">
    <div class="row row-pb-lg">
      <div class="col-sm-6 mb-3">
        <div class="video colorlib-video" style="background-image: url(images/about.jpg);">
          <a href="https://vimeo.com/channels/staffpicks/93951774" class="popup-vimeo"><i class="icon-play3"></i></a>
          <div class="overlay"></div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="about-wrap">
          <h2>${custInfo.name}</h2>
          <p> ${custInfo.id}</p>
          <p> ${custInfo.pwd}</p>
        </div>
      </div>
    </div>
  </div>
</div>


</div>

<div class="gototop js-top">
  <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
</div>