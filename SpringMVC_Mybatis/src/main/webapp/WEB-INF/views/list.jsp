<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="700" align="center" border="1">
	<tr><th colspan="5">게시글 목록 보기</th></tr>
	<tr>
		<td width="60" align="center">글번호</td>
		<td width="80" align="center">이름</td>
		<td width="400" align="center">제목</td>
		<td width="100" align="center">작성일</td>
		<td width="60" align="center">조회수</td>
	</tr>
	<c:forEach var="vo" items="${list.list}">
	<tr>
		<td>${vo.idx}</td>
		<td>${vo.name}</td>
		<td>
			<c:if test="${vo.lev > 0}">
				<c:forEach var="i" begin="1" end="${vo.lev}" step="1">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				Re. 
			</c:if>
		<!-- useBean을 사용해 컴퓨터의 날짜와 시간을 얻어온다. -->
		<jsp:useBean id="date" class="java.util.Date"/>
			<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
			<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
			<a href="increment?idx=${vo.idx}">${subject}</a>
			<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
				date.date == vo.writeDate.date}">
				<img src="resources/images/new.png"/>
			</c:if>
			<c:if test="${vo.readCount >= 10}">
				<img src="resources/images/hot.gif"/>
			</c:if>
		</td>
		<td align="center">
			<!-- 오늘 입력된 글은 시간만 어제 이전에 입력된 글은 날짜만 출력한다. -->
			<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
				date.date == vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
			</c:if>
			<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month ||
				date.date != vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
			</c:if>
		</td>
		<td>${vo.readCount}</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td align="center" colspan="5">
		<c:if test="${list.startPage > 1}">
			<input type="button" value="start" onclick="location.href='?currentPage=1'"/>
			<input type="button" value="&lt;10" 
				onclick="location.href='?currentPage=${list.startPage - 1}'"/>
		</c:if>
		<c:if test="${list.startPage <= 1}">
			<input type="button" value="start" disabled="disabled"/>
			<input type="button" value="&lt;10" disabled="disabled"/>
		</c:if>
		<c:forEach var="i" begin="${list.startPage}" end="${list.endPage}" step="1">
			<c:if test="${list.currentPage == i}">
				<input type="button" value="${i}" disabled="disabled"/>
			</c:if>
			<c:if test="${list.currentPage != i}">
				<input type="button" value="${i}" onclick="location.href='?currentPage=${i}'"/>
			</c:if>
		</c:forEach>
		<c:if test="${list.endPage < list.totalPage }">
			<input type="button" value="&gt;10" 
				onclick="location.href='?currentPage=${list.endPage + 1}'"/>
			<input type="button" value="end" 
				onclick="location.href='?currentPage=${list.totalPage}'"/>
		</c:if>
		<c:if test="${list.endPage >= list.totalPage }">
			<input type="button" value="&gt;10" disabled="disabled"/>
			<input type="button" value="end" disabled="disabled"/>
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="5" align="right">
			<input type="button" value="글쓰기" onclick="location.href='insert'"/>
		</td>
	</tr>
</table>
</body>
</html>






