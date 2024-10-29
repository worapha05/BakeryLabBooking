<script setup>
import { ref } from 'vue';

import StudentLayout from '@/Layouts/StudentLayout.vue'
import { eventStore } from '@/stores/booking';

const event = eventStore()

event.createEvent("1", "2024-10-29", "08.00-09.00")

// วันที่ที่ผู้ใช้เลือก
const selectedDate = ref(''); 

// ข้อมูลช่วงเวลา (time slots)
const timeSlots = [
    { time: '08.00-09.00' },
    { time: '09.00-10.00' },
    { time: '10.00-11.00' },
    { time: '11.00-12.00' },
    { time: '12.00-13.00' },
    { time: '13.00-14.00' },
    { time: '14.00-15.00' },
    { time: '15.00-16.00' },
    { time: '16.00-17.00' },
];

function isUnavailable(slotTime) {
    return selectedDate.value === event.eventDate && slotTime === event.eventTime;
}

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