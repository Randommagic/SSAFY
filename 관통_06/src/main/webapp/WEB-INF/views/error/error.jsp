<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<%-- 페이지만의 내용 --%>
	<div class="container p-4">
	<h3>ERROR!</h3>
		오류가 발생했습니다.
		<div>
			<a href="${root}">메인 화면으로 이동</a>
		</div>
	</div>
	<%-- --%>
</body>
</html>