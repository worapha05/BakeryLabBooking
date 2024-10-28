import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/HomeView.vue'
import AboutView from '@/views/AboutView.vue'

// admin site
import AdminUserListView from '@/views/admin/user/ListView.vue'
import AdminUpdateUserView from '@/views/admin/user/UpdateView.vue'
import AdminEquipmentListView from '@/views/admin/equipment/ListView.vue'
import AdminUpdateEquipmentView from '@/views/admin/equipment/UpdateView.vue'
import AdminMyAccountView from '@/views/admin/MyAccount.vue'
import AdminUseRoomView from '@/views/admin/user/UseRoomView.vue'
import LoginView from '@/views/LoginView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/admin/users/list',
      name: 'admin-users-list',
      component: AdminUserListView
    },
    {
      path: '/admin/users/create',
      name: 'admin-create-user',
      component: AdminUpdateUserView
    },
    {
      path: '/admin/users/update/:id',
      name: 'admin-edit-user',
      component: AdminUpdateUserView
    },
    {
      path: '/admin/eqiuipment/list',
      name: 'admin-equipments-list',
      component: AdminEquipmentListView
    },
    {
      path: '/admin/eqiuipment/create',
      name: 'admin-create-equipments',
      component: AdminUpdateEquipmentView
    },
    {
      path: '/admin/eqiuipment/update/:id',
      name: 'admin-update-equipments',
      component: AdminUpdateEquipmentView
    },
    {
      path: '/admin/my-account',
      name: 'admin-my-account',
      component: AdminMyAccountView
    },
    {
      path: '/admin/use-room',
      name: 'admin-use-room',
      component: AdminUseRoomView
    },
    {
      path: '/admin/use-room',
      name: 'admin-use-room',
      component: AdminUseRoomView
    },
  ]
})

export default router
