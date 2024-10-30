import { defineStore } from 'pinia'
import axios from 'axios'

const BASE_URL = 'http://localhost:8000'

export const useUserStore = defineStore('user', {
  state: () => ({
    selectedUser: {},
    isLogin: false
  }),
  actions: {
    async login(email, password) {
      try {
        const userData = { KU_email: email, password: password }
        const response = await axios.post(`${BASE_URL}/api/login`, userData)
        const message = response.data.message

        if (message === "Login successful") {
          this.selectedUser = response.data.user
          this.isLogin = true
        } else {
          throw new Error('Invalid email or password')
        }
      } catch (error) {
        console.error('Login error:', error)
        throw error
      }
    },
    async logout() {
      this.selectedUser = {}
      this.isLogin = false
    },
    async editUser(userData) {
      try {
        const response = await axios.patch(`${BASE_URL}/api/profile-save-change/${this.selectedUser.KU_email}`, userData)
      } catch (error) {
        console.error('Login error:', error)
        throw error
      }
    }
  }
})