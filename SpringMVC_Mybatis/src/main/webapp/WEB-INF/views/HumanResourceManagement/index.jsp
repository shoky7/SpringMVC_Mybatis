<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>인사시스템</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="<C:out value="${myContext}"/>/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<C:out value="${myContext}"/>/resources/assets/commons/css/cover.css" rel="stylesheet">
		<script src="<C:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/vendor/popper.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		 <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <header class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">IT & Biz</h3>
              <nav class="nav nav-masthead">
                <a class="nav-link active" href="#">Home</a>
                <a class="nav-link" href="#">Input</a>
                <a class="nav-link" href="employee/search">Search</a>
              </nav>
            </div>
          </header>

          <main role="main" class="inner cover">
            <h1 class="cover-heading">인사 관리 시스템</h1>
            <p class="lead">인사관리를 입력하겠습니다. &nbsp;&nbsp;&nbsp; <a href="#" class="btn btn-lg btn-secondary">입력</a></p>
            <p class="lead">인사관리를 조회하겠습니다. &nbsp;&nbsp;&nbsp; <a href="employee/search" class="btn btn-lg btn-secondary">조회</a></p>
          </main>

          <footer class="mastfoot">
            <div class="inner">
              <p>서울시 금천구 서부샛길 606 A-1306(가산동 대성디폴리스 지식산업센터)/ Tel <a href="">02-6049-1114</a>/Fax
              02-861-9883 Copyright@ 2015<a href="">IT&BIZ co.LTD</a>.All rights reserved by </p><a>itnbiz@naver.com</a>
            </div>
          </footer>

        </div>

      </div>
    </div>
	</body>
</html>