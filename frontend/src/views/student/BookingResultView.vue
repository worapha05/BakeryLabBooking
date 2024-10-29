<script setup>
import StudentLayout from '@/Layouts/StudentLayout.vue'
import BookingCard from '@/components/BookingCard.vue'
import { computed, ref } from 'vue'

const statuses = ['อนุมัติแล้ว', 'รอการอนุมัติ', 'ยกเลิก']
const bookingDetail = [
    {
        bookingId: "1",
            date: "จองห้องวันที่ 26/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "รอการอนุมัติ",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "2",
            date: "จองห้องวันที่ 26/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "รอการอนุมัติ",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "3",
            date: "จองห้องวันที่ 26/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติแล้ว",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "4",
            date: "จองห้องวันที่ 26/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "ยกเลิก",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },{
        bookingId: "5",
            date: "จองห้องวันที่ 26/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติแล้ว",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    }
]

const selectedStatus = ref("รอการอนุมัติ")
const filterBooingList = computed(() => {
    return bookingDetail.filter(booking => booking.status === selectedStatus.value)
})

const changeSelectedStatus = ((newStatus) => {
    selectedStatus.value = newStatus
})

</script>
<template>
    <StudentLayout>
        <div class="my-6">
            <span class="text-3xl mx-12">ผลการขอจอง</span>
            <div class="my-6">
                <a
            v-for="status in statuses" :key="status"
            :class="status === selectedStatus ? 'btn custom-button ml-12' : 'btn button ml-12'"
          @click="changeSelectedStatus(status)">
          {{ status }}
        </a>
            </div>
            <div class="h-[0.5px] w-full bg-gray-300"></div>
        </div>

        <div v-if="bookingDetail.length > 0">
                        <div class="main-container w-auto bg-white shadow-lg mx-6 relative my-0 p-4">
                        <!-- Header Section  -->
                        <div class="flex">
                            <div class="avatar">
                                <div class="w-16 rounded-full mx-6 mb-6">
                                    <img src="@/assets/list.png" />
                                </div>
                            </div>
                            <span class="text-4xl mt-2">รายการ</span>
                        </div> 
                        <BookingCard v-for="list in filterBooingList"
                        :bookingId= list.bookingId
                        :date= list.date
                        :time= list.time
                        :usage= list.usage
                        :status= list.status
                        :lastAction= list.lastAction
                        :icon= list.icon
                        ></BookingCard>
                
                    
                </div>
        </div>
        <div v-else>
            <img src="@/assets/no_data.png" alt="" class="mx-auto">
        </div>
    </StudentLayout>
</template>

<style scoped>
.custom-button {
    background-color: #2784E1;
    color: white;
}
</style>