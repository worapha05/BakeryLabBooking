<script setup>
import { ref, computed, watch } from 'vue';
import NavbarLogin from '@/components/NavbarLogin.vue'
import { useBookingByDateStore } from '@/stores/bookingByDate';

const bookingByDateStore = useBookingByDateStore()

// วันที่ที่ผู้ใช้เลือก
const selectedDate = ref(''); 

// ข้อมูลช่วงเวลา (time slots)
const timeSlots = [
    { time: '08:00:00' },
    { time: '09:00:00' },
    { time: '10:00:00' },
    { time: '11:00:00' },
    { time: '12:00:00' },
    { time: '13:00:00' },
    { time: '14:00:00' },
    { time: '15:00:00' },
    { time: '16:00:00' }
];

const isUnavailable = computed(() => {
    return (slotTime) => {
        return bookingByDateStore.list.some(item => item.time === slotTime);
    };
});

// Load bookings when the selected date changes
watch(selectedDate, async (newDate) => {
    if (newDate) {
        await bookingByDateStore.loadBookingByDate(newDate);
    }
});
</script>

<template>
    <NavbarLogin/>
    <div class="flex items-center justify-center">
        <div class="custom-bg">
            <div class="mt-12 text-2xl font-bold">
                ตารางการจองห้องปฎิบัติการเบเกอรี่
            </div>
            <div class="flex my-1">
                <div>
                    <input type="date" v-model="selectedDate" class="my-5 p-1.5 rounded-sm border-4">
                </div>
                <div class="login-button flex justify-center">
                    <RouterLink to="/login" class="btn my-5 ml-5 custom-booking-btn ">
                        จองห้องเบเกอรี่
                        <img src="@/assets/icon-add.png" alt="">
                    </RouterLink>
                </div>
            </div>
            <!-- Time Table -->
            <div class="overflow-x-auto">
                <table class="table border border-gray-300">
                    <!-- head -->
                    <thead>
                    <tr>
                        <th class="text-black border border-gray-300">Time slot</th>
                        <th class="text-black border border-gray-300">การจอง</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- row 1 -->
                    <tr v-for="slot in timeSlots" :key="slot.time">
                        <td class="border border-gray-300 py-4">{{ slot.time }}</td>
                        <td class="border border-gray-300 py-4"
                            :class="{
                                    'bg-red-200': isUnavailable(slot.time),
                                    'bg-green-200': !isUnavailable(slot.time)
                            }">
                            <span v-if="isUnavailable(slot.time)">
                                ไม่ว่าง
                            </span>
                            <span v-else>
                                ว่าง
                            </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<style scoped>
.custom-bg {
    background-color: none;
    width: 1000px;
    overflow: auto;
}

.custom-booking-btn {
  background-color: #15570F;
  color: #fff;
}
</style>