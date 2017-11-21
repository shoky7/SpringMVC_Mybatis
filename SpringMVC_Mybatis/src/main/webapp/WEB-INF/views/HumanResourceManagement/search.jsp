<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="<C:out value="${myContext}"/>/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<C:out value="${myContext}"/>/resources/assets/commons/css/navbar-top.css" rel="stylesheet">
		<script src="<C:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/vendor/popper.min.js"></script>
		<script src="<C:out value="${myContext}"/>/resources/assets/bootstrap/js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#workingStatus').append("<option value=''>(선택)</option>");
			})
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
        <a class="nav-link" href="#">입력하기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/search">조회하기</a>
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
						<input type="text" name="employeeNum" class="form-control">
					</td>
					<td>성명 &nbsp</td>
					<td>
						<input type="text" name="employeeName" class="form-control">
					</td>
					
					<td>근무상태 &nbsp</td>
					<td> 
						<select id="workingStatus" name="workingStatus" class="form-control">
						</select>
					</td>
					<td>파견상태 &nbsp</td>
					<td> 
						<select name="dispatch" class="form-control">
							<option>(선택)</option>
							<option value="input">투입</option>
							<option value="wait">대기</option>
						</select>
					</td>
				</tr>
				<tr>
				<td>직위 &nbsp</td>
					<td>
						<select name="rank" class="form-control">
							<option>(선택)</option>
							<option value="ceo">사장</option>
							<option value="director">이사</option>
							<option value="conductor">차장</option>
							<option value="exaggeration">과장</option>
							<option value="dary">대리</option>
							<option value="Temple">사원</option>
						</select>
					</td>
					<td>입사일자 &nbsp</td>
					<td>
						<input type="text" name="employeeentEnteringDate" class="form-control">
					</td>
					<td>퇴사일자 &nbsp</td>
					<td>
						<input type="text" name="employeeOutDate" class="form-control">
					</td>
					<td>직종분류 &nbsp</td>
					<td>
						<select name="Job" class="form-control">
							<option>(선택)</option>
							<option value="publisher">퍼블리셔</option>
							<option value="webdesigner">웹디자이너</option>
							<option value="developer">개발자</option>
							<option value="dba">DBA</option>
							<option value="admin">관리자</option>
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