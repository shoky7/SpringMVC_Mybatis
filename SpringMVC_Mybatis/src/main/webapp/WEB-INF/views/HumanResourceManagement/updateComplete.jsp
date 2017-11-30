<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>인사 수정 완료</title>
	<script src="<c:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
	<script>
		function complete() {
			$('#copleteForm').submit();
		}	
	</script>
	</head>
	<body>
		<form id="copleteForm" action="/SpringMVC_Mybatis/employee/employeeUpdateForm" method="post">
			업데이트가 완료 되었습니다.
			<button type="button" onclick="complete()">확인</button>
			<input type="hidden" name="sabun" value="${employeeVO.sabun}">
			<input type="hidden" name="join_day" value="${employeeVO.join_day}">
			<input type="hidden" name="retire_day" value="${employeeVO.retire_day}">
		</form>
	</body>
</html>