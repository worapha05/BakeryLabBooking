<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue'
import BookingCard from '@/components/BookingCard.vue'

const bookingDetail = [
    {
        bookingId: "1",
        date: "30/10/2024",
        time: "เวลา 9.00 ถึง 12.00",
        usage: "ใช้เพื่อการแข่งขัน",
        status: "อนุมัติแล้ว",
        lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
        icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    }
]

</script>
<template>
    <AdminLayout>
        <div class="my-5 mt-10">
            <span class="text-xl font-bold ml-28">ผลการขอจอง</span>
        </div>
        <div class="flex justify-center">
            <div class="main-container w-[1000px] bg-white shadow-lg mt-3 relative p-4 rounded-lg border-2 border-gray-300">
                <div class="mt-5">
                    <BookingCard v-for="list in bookingDetail"
                        :bookingId= list.bookingId
                        :date= list.date
                        :time= list.time
                        :usage= list.usage
                        :status= list.status
                        :lastAction= list.lastAction
                        :icon= list.icon
                        >
                    </BookingCard> 
                    <div class="flex justify-center">
                        <div class="w-[920px] bg-white shadow-lg mt-3 relative p-4 rounded-lg border border-gray-300">
                            <div class="mt-3 ml-3">
                                สมาชิกที่จะเข้าใช้ห้อง
                            </div>
                            <div class="flex">
                                <div class="ml-3 my-5">
                                    อุปกรณ์ที่ต้องใช้
                                </div>
                                <div class="ml-3 my-5">
                                    status
                                </div>
                            </div>
                            <div class="ml-3 my-5">
                                OTP-สร้างเพื่อยืนยันการเข้าใช้ห้องของนิสิต
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>