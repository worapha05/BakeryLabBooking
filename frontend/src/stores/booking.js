import { ref, computed, toRaw } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'
import { Result } from 'postcss';


const BASE_URL = 'http://localhost:8000'

export const useBookingStore = defineStore('booking', {
  state: () => ({
    list: []
  }),
  actions: {
    async loadBooking(student_id) {
        try {
            
            const response = await axios.get(`${BASE_URL}/api/get-request/${student_id}`);

            let bookingList = response.data.request
            console.log(bookingList)
            for (let i = 0; i < bookingList.length; i++) {
                const booking = bookingList[i][0]; // Get the booking object
                // Check if booking_id is already in this.list
                const isDuplicate = this.list.some(item => item.booking_id === booking.booking_id);
                if (!isDuplicate) {
                    this.list.push(booking); // Only push if it's not a duplicate
                    console.log(booking); // Log the booking object
                } else {
                    console.log(`Booking ID ${booking.booking_id} is a duplicate and will not be added.`);
                }
            }
            
        } catch (error) {
            console.error("ไม่เจอคำขอใด ๆ")
        }
    },
    async addBooking(booking) {
      try {
        const bookingData = {
            usage_date: booking.bookingDate,
            priority_status: "low",
            request_pdf: booking.pdf,
            usage_reason: booking.reason,
            use_category: booking.useCategory,
            usage_time_start: booking.startTime,
            usage_time_end: booking.endTime,
            booking_status: "รออนุมัติ"
        }
        
        console.log(bookingData)
        let response = await axios.post(`${BASE_URL}/api/add-booking-request`, bookingData);
        alert(response.data.message)
        const bookingId = response.data.bookingId
        for (let member of booking.memberList) {
          console.log(member)
            const bookingList = {
              booking_id: bookingId,
              student_id: member.studentId,
              KU_email: member.email,
              first_name: member.firstName,
              last_name: member.lastName,
              position: "สมาชิก" // "Member"
            };
            try {
              console.log(bookingList);
              await axios.post(`${BASE_URL}/api/add-booking-list`, bookingList);
            } catch (error) {
              console.error("เพิ่มสมาชิกไม่สำเร็จ"); // "Failed to add member"
            }
          }
  
          // Add owner to booking
          const bookingListOwner = {
            booking_id: bookingId,
            student_id: booking.owner.student_id,
            KU_email: booking.owner.KU_email,
            first_name: booking.owner.first_name,
            last_name: booking.owner.last_name,
            position: "ผู้จอง" // "Owner"
          };
          try {
            await axios.post(`${BASE_URL}/api/add-booking-list`, bookingListOwner);
          } catch (error) {
            console.error("เพิ่มสมาชิกไม่สำเร็จ"); // "Failed to add owner"
          }
  
          // Add used equipment
          for (let equipmentId of booking.selectedEquipment) {
            const usedEquipmentList = {
              booking_id: bookingId,
              equipment_id: equipmentId,
              post_usage_status: "operational"
            };
            try {
              console.log(usedEquipmentList);
              await axios.post(`${BASE_URL}/api/add-used_equipment`, usedEquipmentList);
            } catch (error) {
              console.error("เพิ่มเครื่องมือไม่สำเร็จ"); // "Failed to add equipment"
            }
          }
          const result = await axios.get(`${BASE_URL}/api/get-user/${booking.owner.student_id}`)
          console.log(result.data.department)
          const departmentName = result.data.department
          let approval = {
            booking_id: bookingId
          }
          console.log(approval)
          if (departmentName == "วิทยาศาสตร์และเทคโนโลยีการอาหาร") {
            approval.approval_status = "1"
          } else {
            approval.approval_status = "0"
          }
          try {
            await axios.post(`${BASE_URL}/api/add-approval`, approval);
          } catch (error) {
            console.log("เพิ่มคำขออนุญาติไม่สำเร็จ", error)
          }
    } catch (error) {
    console.error('add request error:', error);
    alert(error.response.data.message)
  }
    }, async loadBookingByProfessor(position, department) {
      try {
          
          const response = await axios.get(`${BASE_URL}/api/get-request/${position}/${department}`);

          let bookingList = response.data.bookings
          for (let i = 0; i < bookingList.length; i++) {
              const booking = bookingList[i][0];
              console.log(booking)
              const isDuplicate = this.list.some(item => item.booking_id === booking.booking_id);
              if (!isDuplicate) {
                  this.list.push(booking); // Only push if it's not a duplicate
                  console.log(booking); // Log the booking object
              } else {
                  console.log(`Booking ID ${booking.booking_id} is a duplicate and will not be added.`);
              }
          }
          
      } catch (error) {
          console.error("ไม่เจอคำขอใด ๆ")
      }
  }
  }
});
