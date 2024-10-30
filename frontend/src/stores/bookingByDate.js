import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'


const BASE_URL = 'http://localhost:8000'

export const useBookingByDateStore = defineStore('bookingByDate', {
  state: () => ({
    list: []
  }),
  actions: {
    async loadBookingByDate(date) {
      try {
        const response = await axios.get(`${BASE_URL}/api/room-available/${date}'`);
        this.list = response.data.room
        console.log(this.list)
      } catch (error) {
        console.error('Login error:', error);
        // Use a notification system here
        // alert(error.response?.data?.message || 'An error occurred during login.');
      }
    }
    }
  }
);