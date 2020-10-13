<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="<c:url value='/driverCarpool/index.jsp'/>">YCAR</a>
    <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav nav ml-auto">
        <li class="nav-item"><a href="<c:url value='/driverCarpool/index.jsp'/>" class="nav-link"><span>카풀등록</span></a></li>
        <%-- <li class="nav-item"><a href="<c:url value='/driverCarpool/carpool.jsp'/>" class="nav-link"><span>카풀요청</span></a></li> --%>
        <li class="nav-item"><a href="<c:url value='/driverCarpool/carpool.jsp'/>" class="nav-link"><span>카풀요청</span></a></li>        
        <li class="nav-item"><a href="<c:url value='/driverCarpool/carpoolList.jsp'/>" class="nav-link"><span>나의카풀</span></a></li>
        <li class="nav-item"><a href="<c:url value='/paymentAndReview/payment/driverPayList.jsp'/>" class="nav-link"><span>결제</span></a></li>
        <li class="nav-item"><a href="<c:url value='/paymentAndReview/review/driverReviewList.jsp'/>" class="nav-link"><span>후기</span></a></li>
        <li class="nav-item"><a href="<c:url value='/mypage'/>" class="nav-link"><span>마이페이지</span></a></li>
        <li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link"><span>로그아웃</span></a></li>
      </ul>
    </div>
  </div>
</nav>