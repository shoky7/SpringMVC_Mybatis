<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>직원리스트</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="<C:out value="${myContext}"/>/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<C:out value="${myContext}"/>/resources/assets/commons/css/navbar-top.css" rel="stylesheet">
		<script src="<C:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/vendor/popper.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/bootstrap/js/bootstrap.min.js"></script>

	</head>
	<body>
    <nav class="navbar navbar-expand-md navbar-light bg-light mb-4">
      <a class="navbar-brand" href="/SpringMVC_Mybatis/index">IT & Biz</a>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
        </ul>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/SpringMVC_Mybatis/employee/registration">입력하기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/SpringMVC_Mybatis/employee/search">조회하기</a>
      </li>
    </ul>
      </div>
    </nav>

	<h3>&nbsp &nbsp직원리스트</h3>
	<form>
		<table class="table">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>사번 &nbsp</td>
					<td>
						<input type="text" name="sabun" class="form-control">
					</td>
					<td>성명 &nbsp</td>
					<td>
						<input type="text" name="name" class="form-control">
					</td>
					
					<td>입사구분 &nbsp</td>
					<td> 
						<select name="join_gbn_code" class="form-control">
						<option>(선택)</option>
						<C:forEach var="map" items="${join_gbn_code}">
							<option value="${map.get("JOIN_GBN_CODE")}">${map.get("JOIN_GBN_CODE")}</option>						
						</C:forEach>
						</select>
					</td>
					<td>투입여부 &nbsp</td>
					<td> 
						<select name="put_yn" class="form-control">
						<option>(선택)</option>
						<C:forEach var="map" items="${put_yn}">
							<option value="${map.get("PUT_YN")}">${map.get("PUT_YN")}</option>						
						</C:forEach>
						</select>
					</td>
				</tr>
				<tr>
				<td>직위 &nbsp</td>
					<td>
						<select name="pos_gbn_code" class="form-control">
						<option>(선택)</option>
						<C:forEach var="map" items="${pos_gbn_code}">
							<option value="${map.get("POS_GBN_CODE")}">${map.get("POS_GBN_CODE")}</option>						
						</C:forEach>
						</select>
					</td>
					<td>입사일자 &nbsp</td>
					<td>
						<input type=date name="join_day" class="form-control" >
					</td>
					<td>퇴사일자 &nbsp</td>
					<td>
						<input type="date" name="retire_day" class="form-control">
					</td>
					<td>직종분류 &nbsp</td>
					<td>
						<select name="job_type" class="form-control">
						<option>(선택)</option>
						<C:forEach var="map" items="${job_type}">
							<option value="${map.get("JOB_TYPE")}">${map.get("JOB_TYPE")}</option>						
						</C:forEach>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<div align="right">
			<button type="button" class="btn btn-primary">검색</button>
			<button type="button" class="btn btn-primary">초기화</button>
			<button type="button" class="btn btn-primary">이전</button>
		</div>
	</form>
	</body>
</html>