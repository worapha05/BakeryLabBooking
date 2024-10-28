import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/HomeView.vue'
import AboutView from '@/views/AboutView.vue'

// admin site
import AdminUserListView from '@/views/admin/user/ListView.vue'
import AdminUpdateUserView from '@/views/admin/user/UpdateView.vue'
import AdminEquipmentListView from '@/views/admin/equipment/ListView.vue'
import AdminUpdateEquipmentView from '@/views/admin/equipment/UpdateView.vue'
import AdminMyAccountView from '@/views/admin/MyAccountView.vue'
import AdminUseRoomView from '@/views/admin/user/UseRoomView.vue'
import LoginView from '@/views/LoginView.vue'

// student site

import StudentBookingBakeryLabView from '@/views/student/BookingBakeryLabView.vue'
import StudentMyAccountView from '@/views/student/MyAccountView.vue'
import studentBookingResultView from '@/views/student/BookingResultView.vue'
import StudentLabUsageHistoryView from '@/views/student/LabUsageHistoryView.vue'
import StudentBookingScheduleView from '@/views/student/BookingScheduleView.vue'

// Professor site

import ProfessorMyAccountView from '@/views/professor/MyAccountView.vue'
import ProfessorApprovalRequestView from '@/views/professor/ApprovalRequestView.vue'

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
      path: '/student/booking/bakery-lab',
      name: 'student-booking-bakery-lab',
      component: StudentBookingBakeryLabView
    },
    {
      path: '/student/my-account',
      name: 'student-my-account',
      component: StudentMyAccountView
    },
    {
      path: '/student/booking/result',
      name: 'student-booking-result',
      component: studentBookingResultView
    },
    {
      path: '/student/usage/history',
      name: 'student-usage-history',
      component: StudentLabUsageHistoryView
    },
    {
      path: '/student/booking/schedule',
      name: 'student-booking-schedule',
      component: StudentBookingScheduleView
    },
    {
      path: '/professor/my-account',
      name: 'professor-my-account',
      component: ProfessorMyAccountView
    },
    {
      path: '/professor/approval/request',
      name: 'professor-approval-request',
      component: ProfessorApprovalRequestView
    }
  ]
})

export default router
