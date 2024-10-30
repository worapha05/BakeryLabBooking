<script setup>
import { ref, computed, watch } from 'vue';

import StudentLayout from '@/Layouts/StudentLayout.vue'
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
    { time: '16:00:00' },
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
    <StudentLayout>
        <div class="m-3 border-2 rounded-xl p-5">
            <div class="font-bold mt-3 mx-5">ตารางการจอง</div>
            <div class="mt-5 mx-5">กรุณาเลือกวันที่</div>
            <div>
                <input type="date" v-model="selectedDate" class="p-1.5 rounded-sm border-2 my-3 mx-5">
            </div>
            <!-- Time Table -->
            <div class="overflow-x-auto">
                <table class="table w-full max-w-[800px] border border-gray-300 m-5">
                    <!-- head -->
                    <thead>
                    <tr>
                        <th class="text-black border border-gray-300 w-52">Time slot</th>
                        <th class="text-black border border-gray-300">การจอง</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- row 1 -->
                    <tr v-for="slot in timeSlots" :key="slot.time">
                        <td class="border border-gray-300">{{ slot.time }}</td>
                        <td class="border border-gray-300"
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
    </StudentLayout>
</template>