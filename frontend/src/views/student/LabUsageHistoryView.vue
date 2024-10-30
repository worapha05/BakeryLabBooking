<script setup>
import StudentLayout from '@/Layouts/StudentLayout.vue'
import BookingCard from '@/components/BookingCard.vue'
import { computed, ref } from 'vue'

const statuses = ['อยู่ระหว่างการใช้', 'ใช้เสร็จแล้ว']
const bookingDetail = [
    {
        bookingId: "1",
            date: "30/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติแล้ว",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "2",
            date: "01/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติแล้ว",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "3",
            date: "02/10/2024",
            time: "เวลา 9.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติแล้ว",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "4",
            date: "02/10/2024",
            time: "เวลา 11.00 ถึง 12.00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "รอการอนุมัติ",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    }
]

const selectedStatus = ref("อยู่ระหว่างการใช้")

const getCurrentDate = () => {
    const today = new Date()
    const day = String(today.getDate()).padStart(2, '0')
    const month = String(today.getMonth() + 1).padStart(2, '0')
    const year = today.getFullYear()
    return `${day}/${month}/${year}`
}

const isPastDate = (dateStr) => {
    const [day, month, year] = dateStr.split('/').map(Number) // แยกวัน เดือน ปี
    const bookingDate = new Date(year, month - 1, day) // สร้างวันที่การจอง
    const today = new Date() // วันที่ปัจจุบัน
    return bookingDate < today // คืนค่าจริงถ้าวันที่ผ่านไปแล้ว
}

const filterBooingList = computed(() => {
    const currentDate = getCurrentDate()
    return bookingDetail.filter(booking => booking.date === currentDate && booking.status === "อนุมัติแล้ว")
})

const filterPartBooingList = computed(() => {
    return bookingDetail.filter(booking => isPastDate(booking.date) && booking.status === "อนุมัติแล้ว")
})

const changeSelectedStatus = ((newStatus) => {
    selectedStatus.value = newStatus
})

</script>
<template>
    <StudentLayout>
        <div class="my-6">
            <span class="text-3xl mx-12">ประวัติการเข้าใช้ห้อง</span>
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
                <div v-if="selectedStatus == 'อยู่ระหว่างการใช้'">
                    <div class="flex justify-center custom-conferm-text mb-7">
                        โปรดยืนยันการเข้าใช้ห้อง หากไม่เข้าใช้ห้องตามที่จองไว้ เจ้าหน้าที่จะทำการ blacklist
                    </div>
                    <BookingCard v-for="list in filterBooingList"
                        :bookingId= list.bookingId
                        :date= list.date
                        :time= list.time
                        :usage= list.usage
                        :status= list.status
                        :lastAction= list.lastAction
                        :icon= list.icon
                        >
                    </BookingCard>  
                </div>
                <div v-if="selectedStatus == 'ใช้เสร็จแล้ว'">
                    <BookingCard v-for="list in filterPartBooingList"
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

.custom-conferm-text {
    background-color: none;
    color: #CC1417;
}
</style>
