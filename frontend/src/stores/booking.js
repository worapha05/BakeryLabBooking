import { defineStore } from 'pinia'

const BASE_URL = 'https://64f192630e1e60602d23f251.mockapi.io'

export const useBookingStore = defineStore('todo', {
  state: () => ({ // กำหนดข้อมูล state ที่จะเก็บใน store นี้
    list: [],
    selectedTodo: {},
    statuses: ['ยกเลิก', 'อนุมัติแล้ว', 'รอการอนุมัติ']
  }),
  actions: {
    loadBooking() {
        this.list.push({bookingId:"3",
            date:"จองห้องวันที่ 26/10/2024",
            time:"เวลา 9.00 ถึง 12.00",
            usag:"ใช้เพื่อการแข่งขัน",
            status:"รอการอนุมัติ",
            lastAction:"ดำเนินการขอจองล่าสุด 25/10/2024",
            icon:"../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"})

            this.list.push({bookingId:"3",
                date:"จองห้องวันที่ 26/10/2024",
                time:"เวลา 9.00 ถึง 12.00",
                usag:"ใช้เพื่อการแข่งขัน",
                status:"รอการอนุมัติ",
                lastAction:"ดำเนินการขอจองล่าสุด 25/10/2024",
                icon:"../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"})

                this.list.push({bookingId:"3",
                    date:"จองห้องวันที่ 26/10/2024",
                    time:"เวลา 9.00 ถึง 12.00",
                    usag:"ใช้เพื่อการแข่งขัน",
                    status:"รอการอนุมัติ",
                    lastAction:"ดำเนินการขอจองล่าสุด 25/10/2024",
                    icon:"../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"})

                    this.list.push({bookingId:"3",
                        date:"จองห้องวันที่ 26/10/2024",
                        time:"เวลา 9.00 ถึง 12.00",
                        usag:"ใช้เพื่อการแข่งขัน",
                        status:"ยกเลิก",
                        lastAction:"ดำเนินการขอจองล่าสุด 25/10/2024",
                        icon:"../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"})

                        this.list.push({bookingId:"3",
                            date:"จองห้องวันที่ 26/10/2024",
                            time:"เวลา 9.00 ถึง 12.00",
                            usag:"ใช้เพื่อการแข่งขัน",
                            status:"อนุมัติแล้ว",
                            lastAction:"ดำเนินการขอจองล่าสุด 25/10/2024",
                            icon:"../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"})
            
    }
  }
})