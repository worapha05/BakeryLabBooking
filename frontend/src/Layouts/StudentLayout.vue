<script setup>
import { RouterLink } from 'vue-router'
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import NavbarLogin from '@/components/NavbarLogin.vue'
import { useUserStore } from '@/stores/user'
  
const userStore = useUserStore()

const route = useRoute()
const currentImage = ref(`@/assets/${userStore.selectedUser.profile_image}`)
console.log(currentImage.value)

const pageData = [
    {
        name: 'ตารางการจอง',
        route: '/student/booking/schedule',
    },
    {
        name: 'จองห้องเบเกอรี่',
        route: '/student/booking/bakery-lab',
    },
    {
        name: 'ผลการขอจอง',
        route: '/student/booking/result',
    },
    {
        name: 'ประวัติการใช้ห้อง',
        route: '/student/usage/history',
    },
    {
        name: 'My account',
        route: '/student/my-account',
    }
]

const currentPath = ref('')
currentPath.value = route.path
const logout = () => {
  userStore.logout()
}
</script>

<template>
    <NavbarLogin>
    </NavbarLogin>
  <div class="drawer drawer-open">
    <input id="my-drawer-2" type="checkbox" class="drawer-toggle" />
    <div class="drawer-content">
      <slot></slot>
    </div>
    <div class="drawer-side">
      <label for="my-drawer-2" class="drawer-overlay"></label>
      <ul class="menu w-60 h-full bg-base-200 text-base-content sidebar">
        <li class="mb-2 font-semibold text-lg">
          <div>
            <div class="avatar">
                <div class="w-16 rounded-full border">
                    <img :src="currentImage" alt="">
                </div>
            </div>
            {{ userStore.selectedUser.first_name }}
        </div>
        </li>
        <li v-for="page in pageData">
          <RouterLink :to="page.route" :class="currentPath === page.route ? 'active' : ''">
            {{ page.name }}
          </RouterLink>
        </li>
        <li>
            <RouterLink to="/login" @click="logout()">
                ออกจากระบบ
            </RouterLink>
        </li>
      </ul>
    </div>
  </div>
</template>

<style scoped>
.sidebar {
    background-color: #EA6AB74D
}

.border {
  border: 0.5px solid gray;
}
</style>