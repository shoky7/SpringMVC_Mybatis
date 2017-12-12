<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>인사 삭제 완료</title>
	<script src="<c:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
	<script>
		function complete() {
			$('#copleteForm').submit();
		}	
	</script>
	</head>
	<body>
		<form id="copleteForm" action="/SpringMVC_Mybatis/employee/search" method="get">
			${sabun}번이 삭제 되었습니다.
			<button type="button" onclick="complete()">확인</button>
		</form>
	</body>
</html>