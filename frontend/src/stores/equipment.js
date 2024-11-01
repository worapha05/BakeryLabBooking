import { defineStore } from 'pinia'
import axios from 'axios'


const BASE_URL = 'http://localhost:8000'

export const useEquipmentStore = defineStore('equipment', {
  state: () => ({
    list: [],
    selectedEquipment: {}
  }),
  actions: {
    async loadEquipment() {
      try {
        const response = await axios.get(`${BASE_URL}/api/get-all-equipment`)
        const message = response.data.message
        this.list = response.data.equipment
      } catch (error) {
        console.error('Login error:', error)
        alert(error.response.data.message);
      }
    },
    async editStatus(equipment) {
      try {
        const response = await axios.patch(`${BASE_URL}/api/edit-status-equipment`, equipment)
        this.selectedEquipment = response.data.equipment
        console.log(response)
      } catch (error) {
        console.error('Login error:', error)
        alert(error.response.data.message);
      }
    },
    async addEquipment(equipment) {
        let equipmentData = {
            equipment_name: equipment,
            equipment_status: "operational"
        }
        try {
          const response = await axios.post(`${BASE_URL}/api/add-equipment`, equipmentData)
          alert(response.data.message)
        } catch (error) {
          console.error('error add:', error)
          alert(error.response.data.message);
        }
      }
  }
})