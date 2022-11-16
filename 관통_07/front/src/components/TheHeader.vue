<!-- 자식이 없는 vue -> TheName.vue -->
<template>
  <div class="header">
    <router-link to="/">
      <img src="@/assets/ssafy_logo.png" alt="" />
    </router-link>
    <div>
      <!-- <router-link to="/user">로그인</router-link> -->
      <!-- <router-link to="/board">게시판</router-link> -->
      <b-navbar toggleable="lg" type="dark" variant="info">
        <b-navbar-brand href="#">메뉴</b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item :to="'/'">홈페이지</b-nav-item>
          </b-navbar-nav>

          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto">

            <b-nav-item-dropdown text="QnA 게시판" right>
              <b-dropdown-item :to="'/board'">글 목록보기</b-dropdown-item>
              <b-dropdown-item :to="'/board/write'">글 작성하기</b-dropdown-item>
            </b-nav-item-dropdown>

            <b-nav-item-dropdown text="사용자">
              <b-dropdown-item href="#">로그인</b-dropdown-item>
              <b-dropdown-item href="#">회원가입</b-dropdown-item>
            </b-nav-item-dropdown>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>
  </div>
</template>

<script>
export default {
  name: "TheHeader",
}
</script>

<style>
.header {
  padding: 30px;
  text-align: center;
  box-shadow: 0px 1px 10px rgba(159, 157, 157, 0.3);
}

a {
  font-weight: bold;
  color: #2c3e50;
}

a:hover {
  color: #42b983;
}
</style>
