<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertOK" method="post">
<table width="530" align="center" border="1">
	<tr><th colspan="2">글 쓰기</th></tr>
	<tr>
		<td width="130" align="center">이름</td>
		<td width="400"><input type="text" name="name"/></td>
	</tr>
	<tr>
		<td align="center">비밀빈호</td>
		<td><input type="password" name="password"/></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><input type="text" name="subject"/></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td><textarea rows="10" cols="60" name="content"></textarea> </td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="저장하기"/>
			<input type="reset" value="다시쓰기"/>
			<input type="button" value="목록보기" onclick="location.href='list'"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>