<script>
import { RouterLink } from 'vue-router';
export default {
  props: {
    bookingId: String,
    date: String,
    time_start: String,
    time_end: String,
    usage: String,
    status: String,
    lastAction: String,
    icon: String,
  },
}
</script>

<template>
        <div class="bg-slate-100 p-4 mb-8 mx-6 shadow-md rounded-lg">
            <div class="flex justify-between items-start">
                <div class="flex flex-col gap-2 w-[237px]">
                    <span class="text-lg font-bold text-black">Booking id: {{ bookingId }}</span>
                    <span class="text-lg font-normal text-black">{{ date }}</span>
                    <span class="flex text-lg font-normal text-black">เวลา {{ time_start }} ถึง {{ time_end }}</span>
                </div>
            </div>

            <div class="flex flex-col gap-2 mt-4">
                <span class="text-lg font-normal text-black">ประเภทการใช้: {{ usage }}</span>
                <div>
                    <span class="text-lg font-normal text-black">สถานะ: </span>
                    <span class="text-lg font-normal text-blue-500">{{ status }}</span>
                </div>
                <div class="flex items-center gap-2 mt-2">
                    <div class="w-8 h-8 overflow-hidden">
                        <img src="@/assets/time.png" alt="action icon" class="w-full h-full object-cover">
                    </div>
                    <span class="text-xl font-normal text-black">{{ lastAction }}</span>
                </div>
            </div>
        </div>
</template>
