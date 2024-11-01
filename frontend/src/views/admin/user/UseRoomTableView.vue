<script setup>
import { ref, computed } from 'vue'
import AdminLayout from '@/Layouts/AdminLayout.vue'

const bookingDetail = ref([
    {
        booking_id: "1",
        usage_date: "31/11/2024",
        usage_time_start: "9:00",
        usage_time_end: "12:00",
        usage_reason: "ใช้เพื่อการแข่งขัน",
        booking_status: "อนุมัติ",
        lastAction: "ดำเนินการขอจองล่าสุด 25/11/2024",
        icon: "../assets/default-user.jpg"
    },
    {
        booking_id: "2",
        usage_date: "02/11/2024",
        usage_time_start: "01:00",
        usage_time_end: "12:00",
        usage_reason: "ใช้เพื่อการแข่งขัน",
        booking_status: "อนุมัติ",
        lastAction: "ดำเนินการขอจองล่าสุด 25/11/2024",
        icon: "../assets/default-user.jpg"
    },
    {
        booking_id: "3",
        usage_date: "02/11/2024",
        usage_time_start: "9:00",
        usage_time_end: "12:00",
        usage_reason: "ใช้เพื่อการแข่งขัน",
        booking_status: "ถูกยกเลิก",
        lastAction: "ดำเนินการขอจองล่าสุด 25/11/2024",
        icon: "../assets/default-user.jpg"
    },
    {
        booking_id: "4",
        usage_date: "02/11/2024",
        usage_time_start: "9:00",
        usage_time_end: "12:00",
        usage_reason: "ใช้เพื่อการแข่งขัน",
        booking_status: "รออนุมัติ",
        lastAction: "ดำเนินการขอจองล่าสุด 25/11/2024",
        icon: "../assets/default-user.jpg"
    }
])

const today = new Date(); // ใช้เวลาปัจจุบันของเครื่อง
const selectedDate = ref(null);
const selectedStartTime = ref(null);
const selectedEndTime = ref(null);

// ให้แสดงแค่ booking ที่ "รออนุมัติ", "อนุมัติ" และวันที่ >= ปัจจุบัน
const filteredBookings = computed(() => {
    return bookingDetail.value.filter(booking => {
        const [day, month, year] = booking.usage_date.split("/").map(Number);
        const bookingDate = new Date(year, month - 1, day);

        const [endHour, endMinute] = booking.usage_time_end.split(":").map(Number);
        const endTime = new Date(bookingDate);
        endTime.setHours(endHour, endMinute);

        return (
            (booking.booking_status === "รออนุมัติ" || booking.booking_status === "อนุมัติ") &&
            bookingDate >= today &&
            endTime > today
        );
    });
});

// ปุ่มยกเลิกการจอง
const cancelBooking = (booking) => {
    booking.booking_status = "ถูกยกเลิก";
}

</script>

<template>
    <AdminLayout>
        <div class="flex justify-center">
            <div class="main-container w-[1000px] bg-white shadow-lg mt-14 relative p-4 rounded-lg border-2 border-gray-300">
                <div class="font-bold text-xl ml-5 mt-5">
                    ตารางการใช้ห้อง
                    <div class="h-[0.5px] w-full rounded-lg border-2 bg-gray-300 my-3 mr-4"></div>
                </div>
                <div class="ml-5 mt-5">
                    เลือกวันเวลาในการเปลี่ยนสถานะห้องเป็นใช้งานได้หรือไม่พร้อมใช้งาน
                </div>
                <div class="flex">
                    <div class="relative my-3 ml-5">
                        <input type="date" class="p-1.5 rounded-lg pl-10 border-2 w-full" id="date-input" v-model="selectedDate">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3">
                            <img src="@/assets/icon_calendar.png" alt="">
                        </div>
                    </div>
                    <div class="input flex input-bordered border-2 border-gray-200 items-center h-[45px] w-48 ml-5 my-3 pl-2 relative">
                        <img src="@/assets/icon_clock.png" alt="">
                        <select class="custom-select grow ml-1" v-model="selectedStartTime">
                            <option value="" disabled selected>เลือกเวลาเริ่มต้น</option>
                            <option>09.00</option>
                            <option>10.00</option>
                            <option>11.00</option>
                            <option>12.00</option>
                            <option>13.00</option>
                            <option>14.00</option>
                            <option>15.00</option>
                            <option>16.00</option>
                        </select>
                        <span class="absolute right-3 top-1/2 transform -translate-y-1/2 pointer-events-none">▼</span>
                    </div>
                    <span class="ml-5 my-6">
                        ถึง
                    </span>
                    <div class="input flex input-bordered border-2 border-gray-200 items-center h-[45px] w-48 ml-5 my-3 pl-2 relative">
                        <img src="@/assets/icon_clock.png" alt="">
                        <select class="custom-select grow ml-1" v-model="selectedEndTime">
                            <option value="" disabled selected>เลือกเวลาสิ้นสุด</option>
                            <option>09.00</option>
                            <option>10.00</option>
                            <option>11.00</option>
                            <option>12.00</option>
                            <option>13.00</option>
                            <option>14.00</option>
                            <option>15.00</option>
                            <option>16.00</option>
                        </select>
                        <span class="absolute right-3 top-1/2 transform -translate-y-1/2 pointer-events-none">▼</span>
                    </div>
                </div>
                <div class="overflow-x-auto">
                    <table class="table ml-5 mt-3">
                        <thead>
                        <tr class="bg-gray-200 rounded-lg border-2 border-gray-200">
                            <th>Booking ID</th>
                            <th>Date</th>
                            <th>Usage-time-start</th>
                            <th>Usage-time-end</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="booking in filteredBookings" :key="booking.booking_id">
                            <td>{{ booking.booking_id }}</td>
                            <td>{{ booking.usage_date }}</td>
                            <td>{{ booking.usage_time_start }}</td>
                            <td>{{ booking.usage_time_end }}</td>
                            <td>{{ booking.booking_status }}</td>
                            <td>
                                <button class="btn btn-sm custom-cancel-button" @click="cancelBooking(booking)">
                                    ยกเลิก
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>

.custom-cancel-button {
    background-color: #CC1417;
    color: white;
}

.custom-select {
    border: none; /* กำหนดกรอบ */
    background-color: none; /* พื้นหลัง */
    appearance: none; /* ซ่อนลูกศรปกติ */
    position: relative; /* กำหนดตำแหน่งให้กับลูกศร */
}

</style>
