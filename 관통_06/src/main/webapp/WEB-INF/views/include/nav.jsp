<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="${root }/"><img
            src="${root }/resources/assets/img/logo.png" alt="..." /></a>
        <button 
            class="navbar-toggler" 
            type="button"
            data-bs-toggle="collapse" 
            data-bs-target="#navbarResponsive"
            aria-controls="navbarResponsive" 
            aria-expanded="false"
            aria-label="Toggle navigation"
        >
         Menu 
        <i class="fas fa-bars ms-1"></i>
        </button>
        
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
            	<c:choose>
            		<%-- session에 userInfo 객체 없는 경우(로그인 X) --%>
	           		<c:when test="${empty userinfo}">
		                <div class="first" style="display:flex">
		                    <li class="nav-item"><a class="nav-link" href="${root}/user/login">로그인</a></li>
		                    <li class="nav-item"><a class="nav-link" href="${root}/user/join">회원가입</a></li>
		                </div>
					</c:when>
					<%-- session에 userInfo 객체 있는 경우(로그인 O) --%>
<%--					<c:when test="${userinfo.userId eq 'admin'}">--%>
<%--		                <div class="second" style="display: flex">--%>
<%--		                    <li class="nav-item" id="admin_name"><a class="nav-link" href="${root }/user?action=updateForm&id=${userinfo.userId}">${userinfo.userName}님</a></li>--%>
<%--							<li class="nav-item"><a class="nav-link"  href="${root}/admin/user">회원관리</a></li>--%>
<%--							<li class="nav-item"><a class="nav-link"  href="${root}/user?action=logout">로그아웃</a></li>--%>
<%--		                </div>--%>
<%--	                </c:when>--%>
					<c:otherwise>
						<div class="second" style="display: flex">
							<li class="nav-item" id="login_name"><a class="nav-link" href="${root }/user/update/${userinfo.userId}">${userinfo.userName}님</a></li>
							<li class="nav-item"><a class="nav-link"  href="${root}/user/logout">로그아웃</a></li>
						</div>
					</c:otherwise>
	            </c:choose> 
            </ul>
        </div>
    </div>

</nav>



