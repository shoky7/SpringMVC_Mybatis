<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:set var="myContext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<C:out value="${myContext}"/>/resources/assets/jquery/jquery-3.2.1.min.js"></script>
		<script>
			function registration() {
				 $("#formReg").submit();
			}
		</script>
	</head>
	<body>
		<form id ="formReg" method="post" action="/SpringMVC_Mybatis/employee/testRegistration">
			<input type="text" name="userName">
			<input type="text" name="userId">
		</form>
		<button type="button" onclick = "registration()" >submit</button>
	</body>
</html>