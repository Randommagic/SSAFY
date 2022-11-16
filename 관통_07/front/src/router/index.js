import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'main',
    // component: HomeView
  },
  {
    path: '/board',
    name: 'board',
    component: () => import('@/views/AppBoard.vue'),
    redirect: "/board/list",
    children: [
      {
        path: "list",
        name: "boardlist",
        component: () => import("@/components/board/BoardList"),
      },
      {
        path: "write",
        name: "boardwrite",
        component: () => import("@/components/board/BoardWrite"),
      },
      {
        path: "view/:no",
        name: "boardview",
        component: () => import("@/components/board/BoardView"),
      },
      {
        path: "modify/:no",
        name: "boardmodify",
        component: () => import("@/components/board/BoardModify"),
      },
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
