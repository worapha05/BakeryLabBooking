<template>
    <div class="navbar bg-base-100 custom-navbar-shadow">
      <div class="flex-1">
        <RouterLink to="/" class="btn btn-ghost text-xl">
            Kasetsart Bakery Lab Booking
        </RouterLink>
      </div>
      <!-- Navbar แสดงผลตามสถานะการล็อกอิน -->
      <div v-if="!userStore.isLogin">
        <div class="navbar-home">
          <RouterLink to="/" class="btn btn-ghost mx-1">
                Home
            </RouterLink>
        </div>
        <div class="navbar-register">
            <RouterLink to="/register" class="btn btn-ghost mx-1">
                Register
            </RouterLink>
        </div>
        <div class="navbar-login">
          <RouterLink to="/login" class="btn custom-login-btn mx-1">
                Login
            </RouterLink>
        </div>
      </div>
      <div v-else>
        <div class="navbar-user-info">
          <a class="btn btn-ghost mx-1">{{ userDetail }}</a> <!-- แสดงชื่อผู้ใช้ -->
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { watch, ref } from 'vue'
  import { useUserStore } from '@/stores/user'
  
  const userStore = useUserStore()
  const userDetail = ref('')

  watch(
  () => [userStore.isLogin, userStore.selectedUser],
  async () => {

    if (userStore.isLogin) {
      
      if (userStore.selectedUser.role === "student") { 
        userDetail.value = `${userStore.selectedUser.student_id} ${userStore.selectedUser.first_name}`

      } else if (userStore.selectedUser.role === "professor") {
        userDetail.value = `${userStore.selectedUser.first_name} ${userStore.selectedUser.last_name}`

      } else {
        userDetail.value = 'Admin';
      }
      
      
      
    } else {
      
      userDetail.value = '';
    }
  },
  { immediate: true } // ให้รันครั้งแรกทันทีที่สร้าง
);
  // ฟังก์ชันล็อกอิน
  // function login() {
  //   userStore.login("6510405733", "Fah") // กำหนดค่า userID และ userName
  // }
  </script>
  
  <style scoped>
  .custom-navbar-shadow {
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
  }
  
  .custom-login-btn {
    background-color: #F12FA3;
    color: #fff;
  }
  </style>
  
  