<script>
import { data } from 'autoprefixer';
import { RouterLink } from 'vue-router';
export default {
  props: {
    bookingId: String,
    date: String,
    time_start: String,
    time_end: String,
    usage: String,
    status: String,
    clean_status: String,
    lastAction: String,
    icon: String,
  },
  computed: {
    formattedDate() {
      const dateData = new Date(this.date);
      const day = dateData.getDate();
      const month = dateData.getMonth() + 1; // Adding 1 as months are 0-based
      const year = dateData.getFullYear();
      return `${day}-${month}-${year}`;
    },
    formattedLastActionDate() {
      const dateData = new Date(this.lastAction);
      const day = dateData.getDate();
      const month = dateData.getMonth() + 1; // Adding 1 as months are 0-based
      const year = dateData.getFullYear();
      return `${day}-${month}-${year}`;
    },
    formattedStartDate() {
      if (this.time_start == "00:00:09") {
        return "09.00"
      } else if (this.time_start == "00:00:10") {
        return "10.00"
      } else if (this.time_start == "00:00:11") {
        return "11.00"
      } else if (this.time_start == "00:00:12") {
        return "12.00"
      } else if (this.time_start == "00:00:13") {
        return "13.00"
      } else if (this.time_start == "00:00:14") {
        return "14.00"
      } else if (this.time_start == "00:00:15") {
        return "15.00"
      } else if (this.time_start == "00:00:16") {
        return "16.00"
      } else {
        return "17.00"
      }
    },
    formattedEndDate() {
        if (this.time_end == "00:00:09") {
        return "09.00"
      } else if (this.time_end == "00:00:10") {
        return "10.00"
      } else if (this.time_end == "00:00:11") {
        return "11.00"
      } else if (this.time_end == "00:00:12") {
        return "12.00"
      } else if (this.time_end == "00:00:13") {
        return "13.00"
      } else if (this.time_end == "00:00:14") {
        return "14.00"
      } else if (this.time_end == "00:00:15") {
        return "15.00"
      } else if (this.time_end == "00:00:16") {
        return "16.00"
      } else {
        return "17.00"
      }
    },
  }
}
</script>

<template>
        <div class="bg-slate-100 p-4 mb-8 mx-6 shadow-md rounded-lg">
            <div class="flex justify-between items-start">
                <div class="flex flex-col gap-2 w-[237px]">
                    <span class="text-lg font-bold text-black">Booking id: {{ bookingId }}</span>
                    <span class="text-lg font-normal text-black">{{ formattedDate }}</span>
                    <span class="flex text-lg font-normal text-black">เวลา {{ formattedStartDate }} ถึง {{ formattedEndDate }}</span>
                </div>
            </div>

            <div class="flex flex-col gap-2 mt-4">
                <span class="text-lg font-normal text-black">ประเภทการใช้: ใช้เพื่อ{{ usage }}</span>
                <div>
                    <span class="text-lg font-normal text-black">สถานะ: </span>
                    <span class="text-lg font-normal text-blue-500">{{ status }}</span>
                </div>
                <div>
                    <span class="text-lg font-normal text-black">ความสะอาด: </span>
                    <span class="text-lg font-normal text-blue-500">{{ clean_status }}</span>
                </div>
                <div class="flex items-center gap-2 mt-2">
                    <div class="w-8 h-8 overflow-hidden">
                        <img src="@/assets/time.png" alt="action icon" class="w-full h-full object-cover">
                    </div>
                    <span class="text-xl font-normal text-black">ดำเนินการขอจองล่าสุด {{ formattedLastActionDate }}</span>
                </div>
            </div>
        </div>
</template>
