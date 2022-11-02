<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
  <head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
  </head>
  <body id="page-top">
    <!-- Navigation-->
	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	
    <!-- Masthead-->
    <header class="masthead">
      <div class="container">
        <div class="masthead-heading text-uppercase">My Page</div>
      </div>
    </header>

    <!-- 로그인 폼-->
    <main class="container">
      <div class="login-page">
        <h1></h1>
        <div class="form_login">
          <form name="register-form" class="register-form" action="${root }/user/update" method="POST">
            <input type="hidden" name="action" value="modify">
            <input id="id" name="userId" type="text" value="${userinfo.userId }" readonly/>
            <input id="name" name="userName" type="text" value="${userinfo.userName }" />
            <input id="email" name="userEmail" type="text" value="${userinfo.userEmail }" />
            <button type="submit" >회원 수정</button>
          </form>
        <!-- alert -->
		<c:if test="${!empty msg }">
			<script>
				alert("${msg }");
			</script>
		</c:if>
          <button onclick="confirm_alert()">탈퇴 하기</button>
          <script>
	          function confirm_alert(){
		          var result = confirm("회원 탈퇴하시겠습니까?");
		          if(result){
		        	  location.href='${root}/user/delete/${userinfo.userId}';
		          }
	          }
          </script>
        </div>
      </div>
    </main>
    <!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./js/main.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  </body>
</html>