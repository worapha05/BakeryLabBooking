import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', () => {
  const isLoggedIn = ref(false)
  const userName = ref('')
  const userID = ref('')

  function login(id,name) {
    isLoggedIn.value = true
    userName.value = name
    userID.value = id
  }

  function logout() {
    isLoggedIn.value = true
    userName.value = ''
    userID.value = ''
  }

  return { isLoggedIn, userName, userID, login, logout }
})