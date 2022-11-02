<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
      </div>
    </header>
 
    <!-- 로그인 폼-->
    <main class="container">
      <div class="login-page">
        <h1>LogIn</h1>
        <div class="form_login">
          <form name="login-form" class="login-form" action="${root}/user/login" method="POST">
            <input id="id" name="userid" type="text" placeholder="ID" />
            <input id="password" name="userpwd" type="password" placeholder="password" />
            <button class="login-btn">로그인</button>
          </form>
          <button onclick="location.href='${root}/user/join'">회원가입</button>
          <a href="${root }/user/findpw.jsp">비밀번호를 잊으셨나요?</a>
        </div>
        		<!-- alert -->
		<c:if test="${!empty msg }">
			<script>
				alert("${msg }");
			</script>
		</c:if>
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
