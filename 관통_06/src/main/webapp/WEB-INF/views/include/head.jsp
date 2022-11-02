<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>WhereIsMyHome</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${root}/resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css"/>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root }/resources/css/styles.css" rel="stylesheet" />
<style>
	#mainNav{
		background-color: rgba(0, 0, 0, 0.2);/*까만색(0,0,0) 80% 불투명도*/
	}
	#mainNav .navbar-brand img {
		height: 50px;
	}
</style>