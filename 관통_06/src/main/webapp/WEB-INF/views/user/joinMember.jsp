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
        <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
      </div>
    </header>

    <!-- 로그인 폼-->
    <main class="container">
      <div class="login-page">
        <h1>Regist</h1>
        <div class="form_login">
          <form name="register-form" class="register-form" action="${root }/user/join" method="POST">
            <input type="hidden" name="action" value="regist">
            <input id="id" name="userId" type="text" placeholder="id" />
            <input id="password" name="userPwd" type="password" placeholder="password" />
            <input id="email" name="userEmail" type="email" placeholder="email address" />
            <input id="name" name="userName" type="text" placeholder="name" />
            <button type="submit">회원 등록</button>
          </form>
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
    <script>
      let isUseId = false;
      document.querySelector("#userid").addEventListener("keyup", function () {
        let userid = this.value;
        let resultDiv = document.querySelector("#idcheck-result");
        if(userid.length < 6 || userid.length > 16) {
          resultDiv.setAttribute("class", "mb-3 text-dark");
          resultDiv.textContent = "아이디는 6자 이상 16자 이하 입니다.";
          isUseId = false;
        } else {
          fetch("${root}/user/" + userid)
                  .then(response => response.text())
                  .then(data => {
                    if(data == 0) {
                      console.log(data);
                      resultDiv.setAttribute("class", "mb-3 text-primary");
                      resultDiv.textContent = userid + "는 사용할 수 있습니다.";
                      isUseId = true;
                    } else {
                      resultDiv.setAttribute("class", "mb-3 text-danger");
                      resultDiv.textContent = userid + "는 사용할 수 없습니다.";
                      isUseId = false;
                    }
                  });
        }
      });

      document.querySelector("#btn-join").addEventListener("click", function () {
        if (!document.querySelector("#username").value) {
          alert("이름 입력!!");
          return;
        } else if (!document.querySelector("#userid").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#userpwd").value) {
          alert("비밀번호 입력!!");
          return;
        } else if (document.querySelector("#userpwd").value != document.querySelector("#pwdcheck").value) {
          alert("비밀번호 확인!!");
          return;
        } else if (!isUseId) {
          alert("아이디 확인!!");
          return;
        } else {
          let form = document.querySelector("#form-join");
          form.setAttribute("action", "${root}/user/join");
          form.submit();
        }
      });
    </script>
  </body>
</html>