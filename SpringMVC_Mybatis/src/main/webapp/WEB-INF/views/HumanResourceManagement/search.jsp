<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<style>
		#sabun,#sabun_result,#reg_no_result,#hp_result,#retire_day_result,#join_day_result,#salary_result{ text-align:right; }
		
		</style>
		<meta charset="UTF-8">
		<title>직원리스트</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="<c:out value="${myContext}"/>/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<c:out value="${myContext}"/>/resources/assets/commons/css/navbar-top.css" rel="stylesheet">
		<script src="<c:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script src="<c:out value="${myContext}"/>/resources/assets/vendor/popper.min.js"></script>
		<script src="<c:out value="${myContext}"/>/resources/assets/bootstrap/js/bootstrap.min.js"></script>
		<script>
		function search(){
			$('#searchForm').submit();
		}
		
		
		$(document).ready(function() {
			$("#sabun").keyup(function() {
				var textinput = $("#sabun").val();
				textinput = textinput.replace(/[^0-9]/g, '');
				$("#sabun").val(textinput);
			});
			
		});
		</script>

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
	<form name="searchForm" id="searchForm" action="/SpringMVC_Mybatis/employee/searchCtrl" method="post">
		<table class="table">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>사번 &nbsp</td>
					<td>
						<input type="text" id="sabun" name="sabun" class="form-control">
					</td>
					<td>성명 &nbsp</td>
					<td>
						<input type="text" id="name" name="name" class="form-control">
					</td>

					<td>입사구분 &nbsp</td>
					<td> 
						<select name="join_gbn_code" id="join_gbn_code" class="form-control">
						<option value="">(선택)</option>
						<c:forEach var="map" items="${join_gbn_code}">
							<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
						</c:forEach>
						</select>
					</td>
					
					<td>투입여부 &nbsp</td>
					<td> 
						<select name="put_yn" id="put_yn"class="form-control">
						<option value="">(선택)</option>
						<c:forEach var="map" items="${put_yn}">
							<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
				<td>직위 &nbsp</td>
					<td>
						<select name="pos_gbn_code" id="pos_gbn_code" class="form-control">
						<option value="">(선택)</option>
						<c:forEach var="map" items="${pos_gbn_code}">
							<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
						</c:forEach>
						</select>
					</td>
					<td>입사일자 &nbsp</td>
					<td>
						<input type=date name="join_day" id="join_day" class="form-control" >
					</td>
					<td>퇴사일자 &nbsp</td>
					<td>
						<input type="date" name="retire_day" id="retire_day" class="form-control">
					</td>
					<td>직종분류 &nbsp</td>
					<td>
						<select name="job_type" id="job_type" class="form-control">
						<option value="">(선택)</option>
						<c:forEach var="map" items="${job_type}">
							<option value="${map.get("CODE")}">${map.get("NAME")}</option>						
						</c:forEach>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<div align="right">
			<button type="button" class="btn btn-primary" onclick="search()">검색</button>
			<button type="reset" class="btn btn-primary">초기화</button>
			<button type="button" class="btn btn-primary">이전</button>
		</div>
		<table class="table table-bordered">
			<tr>
				<td>사번</td>
				<td>성명</td>
				<td>주민번호</td>
				<td>핸드폰번호</td>
				<td>직위</td>
				<td>입사일자</td>
				<td>퇴사일자</td>
				<td>투입여부</td>
				<td>연봉</td>
			</tr>
			<c:forEach var="vo" items="${EmployeeVOList}">
			<tr>
				<td id="sabun_result">${vo.sabun}</td>
				<td>${vo.name}</td>
				<td id="reg_no_result">${vo.reg_no}</td>
				<td id="hp_result">${vo.hp}</td>
				<td>${vo.pos_gbn_code}</td>
				<td id="join_day_result">${vo.join_day}</td>
				<td id="retire_day_result">${vo.retire_day}</td>
				<td></td>
				<td id="salary_result">${vo.salary}</td>
			</tr>
			</c:forEach>
		</table>
	</form>
	</body>
</html>