import { defineStore } from 'pinia'
import axios from 'axios'

const BASE_URL = 'http://localhost:8000'

export const useUserStore = defineStore('user', {
  state: () => ({
    selectedUser: {},
    isLogin: false,
    list: []
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
        }
      } catch (error) {
        console.error('Login error:', error)
        alert(error.response.data.message);
      }
    },
    async logout() {
      this.selectedUser = {}
      this.isLogin = false
    },
    async editUser(userData) {
      const user = this.selectedUser
      user.first_name = userData.first_name
      user.last_name = userData.last_name
      user.phone_number = userData.phone_number
      user.profile_image = userData.profile_image
      user.new_password = userData.new_password
      user.old_password = userData.old_password
      try {
        const response = await axios.patch(`${BASE_URL}/api/profile-save-change/${this.selectedUser.KU_email}`, user)
        alert("แก้ไขสำเร็จ")
      } catch (error) {
        console.error('update error:', error)
        alert(error.response.data.message);
      }
    },
    async loadUser() {
      try {
        const response = await axios.get(`${BASE_URL}/api/get-all-user`)
        const message = response.data.message
        this.list = response.data.user
      } catch (error) {
        console.error('Login error:', error)
        alert(error.response.data.message);
      }
    },
    async editStatus(user) {
      try {
        const response = await axios.patch(`${BASE_URL}/api/edit-status-user`, user)
        this.selectedUser = response.data.user
        console.log(response)
      } catch (error) {
        console.error('Login error:', error)
        alert(error.response.data.message);
      }
    }
  }
})