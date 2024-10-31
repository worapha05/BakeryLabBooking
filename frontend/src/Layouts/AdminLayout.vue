<script setup>
import { RouterLink } from 'vue-router'
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import NavbarLogin from '@/components/NavbarLogin.vue'
import { useUserStore } from '@/stores/user'
  
const userStore = useUserStore()
const currentImage = ref(`@/assets/${userStore.selectedUser.profile_image}`)
console.log(currentImage.value)

const route = useRoute()

const pageData = [
    {
        name: 'ตารางการเข้าใช้ห้อง',
        route: '/admin/use-room-table',
    },
    {
        name: 'การเข้าใช้ห้อง',
        route: '/admin/use-room',
    },
    {
        name: 'เครื่องมือและอุปกรณ์',
        route: '/admin/eqiuipment/list',
    },
    {
        name: 'เพิ่มบัญชี',
        route: '/admin/users/create',
    },
    {
        name: 'จัดการบัญชี',
        route: '/admin/users/list',
    },
    {
        name: 'My account',
        route: '/admin/my-account',
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
            Admin
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