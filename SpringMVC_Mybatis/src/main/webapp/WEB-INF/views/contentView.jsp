<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
		function delete1(id) {
			id.action = "delete";		// form의 action 속성을 변경한다.
			id.submit();				// 전송한다.	
		}
		</script>
	</head>
	<body>
	<c:set var="id" value="form${vo.idx}"/>
		<form action="update" id="${id}" method="post">
			<table width="500" align="center" border="1">
				<tr><th colspan="2">게시글 보기</th></tr>
				<tr>
					<td width="100">번호</td>
					<td>${vo.idx}<input type="hidden" name="idx" value="${vo.idx}"/></td>
				</tr>
				<tr>
					<td width="100">조회수</td>
					<td>${vo.readCount}</td>
				</tr>
				<tr>
					<td width="100">이름</td>
					<td>${vo.name}</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td width="100">제목</td>
					<td>
						<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
						<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
						<input type="text" name="subject" value="${subject}"/>
					</td>
				</tr>
				<tr>
					<td width="100">내용</td>
					<td>
						<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
						<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
						<textarea rows="10" cols="55" name="content">${content}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기"/>
						<input type="button" value="삭제하기" onclick="delete1(${id})"/>
						<input type="button" value="답글달기" onclick="location.href='reply?idx=${vo.idx}'"/>
						<input type="button" value="목록보기" onclick="location.href='list'"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>