<template>
    <div class="navbar bg-base-100 custom-navbar-shadow">
      <div class="flex-1">
        <a class="btn btn-ghost text-xl">Kasetsart Bakery Lab Booking</a>
      </div>
      <!-- Navbar แสดงผลตามสถานะการล็อกอิน -->
      <div v-if="!userStore.isLoggedIn">
        <div class="navbar-home">
          <a class="btn btn-ghost mx-1">Home</a>
        </div>
        <div class="navbar-booking">
          <a class="btn btn-ghost mx-1">Booking</a>
        </div>
        <div class="navbar-register">
          <a class="btn btn-ghost mx-1">Register</a>
        </div>
        <div class="navbar-login">
          <a class="btn custom-login-btn mx-1" @click="login">Login</a>
        </div>
      </div>
      <div v-else>
        <div class="navbar-user-info">
          <a class="btn btn-ghost mx-1">{{ `${userStore.userID} ${userStore.userName}` }}</a> <!-- แสดงชื่อผู้ใช้ -->
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { computed } from 'vue'
  import { useUserStore } from '@/stores/user'
  
  const userStore = useUserStore()
  
  // ฟังก์ชันล็อกอิน
  function login() {
    userStore.login("6510405733", "Fah") // กำหนดค่า userID และ userName
  }
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
  
  