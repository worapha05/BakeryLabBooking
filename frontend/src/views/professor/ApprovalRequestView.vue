<script setup>
import ProfessorLayout from '@/Layouts/ProfessorLayout.vue'
import BookingCard from '@/components/BookingCard.vue'
import { computed, ref } from 'vue'

const statuses = ['อนุมัติแล้ว', 'รอการอนุมัติ', 'ยกเลิก']
const viewProfileStatuses = ['Profile', 'Competition', 'ประวัติการใช้ห้อง']
const bookingDetail = [
    {
        bookingId: "1",
            date: "จองห้องวันที่ 26/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            usage_reason: "ต้องการใช้เพื่อทำขนมปังสูตรจิ้งหรีดสำหรับการแข่งขัน start up thailand 2024 เพื่อได้ผลิตภัณฑ์ให้กรรมการชิม",
            status: "รอการอนุมัติ",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            request_pdf: "dararat_lab_form.pdf",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "2",
            date: "จองห้องวันที่ 26/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            usage_reason: "ต้องการใช้เพื่อการแข่ง......",
            status: "รอการอนุมัติ",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            request_pdf: "dararat_lab_form.pdf",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "3",
            date: "จองห้องวันที่ 26/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            usage_reason: "ต้องการใช้เพื่อทำเค้ก",
            status: "อนุมัติแล้ว",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            request_pdf: "dararat_lab_form.pdf",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "4",
            date: "จองห้องวันที่ 26/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "ยกเลิก",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            request_pdf: "dararat_lab_form.pdf",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },{
        bookingId: "5",
            date: "จองห้องวันที่ 26/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติแล้ว",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            request_pdf: "dararat_lab_form.pdf",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    }
]

// mog user ของ booking ที่เลือก
const bookingUser = [
    { 
        KU_email: "phaptawan.su@ku.th",
        student_id: "6510405733",
        first_name: "Phaptawan",
        last_name: "Sukhum",
        role: "student",
        status: "enabled",
        profile_image: "@/assets/default-user.png"
    }
]

// mog member ของ booking ที่เลือก
const bookingMember = [
    { member: 'member1@ku.th' },
    { member: 'member2@ku.th' },
    { member: 'member3@ku.th' },
];

// mog equipment ของ booking ที่เลือก
const bookingEquipment = [
    { equipment: 'เตาอบ' },
    { equipment: 'เครื่องนวดแป้ง' },
    { equipment: 'พิมพ์ขนมปัง' },
    { equipment: 'ชามผสม' },
];

const selectedStatus = ref("รอการอนุมัติ")
const selectedViewProfileStatus = ref("Profile")
const selectedBooking = ref(null)
const selectedProfile = ref(null)

const filterBooingList = computed(() => {
    return bookingDetail.filter(booking => booking.status === selectedStatus.value)
})

const changeSelectedStatus = ((newStatus) => {
    selectedStatus.value = newStatus
})

const changeSelectedViewProfileStatus = ((newStatus) => {
    selectedViewProfileStatus.value = newStatus
})

const selectBooking = (booking) => {
    selectedBooking.value = booking // ตั้งค่า booking ที่เลือก
}

const selectProfile = () => {
    selectedProfile.value = bookingUser
}

const backToList = (() => {
    selectedBooking.value = null;
})


</script>

<template>
    <ProfessorLayout>
        <div v-if="bookingDetail.length > 0">
            <!-- ยังไม่ไ้ด้เลือก booking ไหน -->
            <div v-if="!selectedBooking">
                <div class="my-3">
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
                <div class="main-container w-auto bg-white shadow-lg mx-6 relative my-0 p-4">
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
                    :time_start= list.time_start
                    :time_end= list.time_end
                    :usage= list.usage
                    :status= list.status
                    :lastAction= list.lastAction
                    :icon= list.icon
                    @click="selectBooking(list)" 
                    ></BookingCard>
                 </div>
            </div>
            <!-- คลิกดู booking...  -->
            <div v-else>
                <div v-if="!selectedProfile">
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
                    <div class="main-container w-auto bg-white shadow-lg mx-6 relative my-0 p-4">
                        <div class="flex">
                            <div class="avatar">
                                <div class="w-16 rounded-full mx-6 mb-6">
                                    <img src="@/assets/list.png" />
                                </div>
                            </div>
                            <span class="text-4xl mt-2">รายการ</span>
                            <button class="btn absolute right-0 bg-white border border-gray-300 mt-2 mr-10" @click="backToList">
                                    <img src="@/assets/icon-back.png" alt="">
                                    ย้อนกลับ
                                </button>
                        </div> 
                        <BookingCard
                            :bookingId="selectedBooking.bookingId"  
                            :date="selectedBooking.date"              
                            :time_start="selectedBooking.time_start"  
                            :time_end="selectedBooking.time_end"     
                            :usage="selectedBooking.usage"           
                            :status="selectedBooking.status"          
                            :lastAction="selectedBooking.lastAction"  
                            :icon="selectedBooking.icon"
                        ></BookingCard>
                        <div class="flex justify-center">
                            <div class="w-full bg-white shadow-lg mx-6 relative p-4 rounded-lg border border-gray-300">
                                <div class="ml-5 mt-5">
                                    <div class="text-base font-bold my-3">
                                        ผู้จอง
                                    </div>
                                    <div class="flex">
                                        <div class="flex bg-white rounded-lg border border-gray-300 h-12 pt-3 px-4">
                                            {{ bookingUser[0].student_id }}
                                        </div>
                                        <div class="flex bg-white rounded-lg border border-gray-300 w-80 h-12 ml-2 pt-3 pl-4">
                                            {{ bookingUser[0].first_name }} {{ bookingUser[0].last_name }}
                                        </div>
                                        <button class="btn custom-button w-28 ml-5" @click="selectProfile">
                                            ดูประวัติ
                                        </button>
                                    </div>
                                    <div class="text-base font-bold mt-7 my-3">
                                        เหตุผลการใช้ห้อง
                                    </div>
                                    <div class="w-[700px]">
                                        {{ selectedBooking.usage_reason }}
                                    </div>
                                    <div class="text-base font-bold mt-7 mb-3">
                                        สมาชิกที่จะเข้าใช้ห้อง
                                    </div>
                                    <div v-for="member in bookingMember" :key="member.member" class="my-2">
                                        {{ member.member }}
                                    </div>
                                    <div class="text-base font-bold mt-7 mb-3">
                                        Lab permission form
                                    </div>
                                    <div class="flex bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                        <div>
                                            <img src="@/assets/icon-pdf.png" alt="" >
                                        </div>
                                        <div class="ml-3">
                                            {{ selectedBooking.request_pdf }}                               
                                        </div>
                                    </div>
                                    <div class="text-base font-bold mt-7 mb-3">
                                        อุปกรณ์ที่ต้องใช้
                                    </div>
                                    <div v-for="equipment in bookingEquipment" :key="equipment.equipment" class="my-2">
                                        - {{ equipment.equipment }}
                                    </div>
                                    <div class="text-base font-bold mt-7 mb-3">
                                        แนบเอกสารที่เซ็นอนุมัติแล้ว
                                    </div>
                                    <label class="btn border-gray-300 bg-white mt-3 cursor-pointer"> 
                                        <img src="@/assets/icon-add-black.png" alt="">
                                        Attach file here
                                        <input type="file" class="hidden" @change="onFileChange"/>
                                    </label>
                                    <div class="flex justify-center mt-10 mb-10">
                                        <button class="btn custom-accept-btn w-28">
                                            อนุมัติ
                                        </button>
                                        <button  class="btn ml-5 custom-deny-btn w-28">
                                            ปฏิเสธ
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-else>
                    <div class="my-6">
                        <span class="text-3xl mx-12">ผลการขอจอง</span>
                        <div class="my-6">
                            <a
                            v-for="profile_status in viewProfileStatuses" :key="profile_status"
                            :class="profile_status === selectedViewProfileStatus ? 'btn custom-button ml-12' : 'btn button ml-12'"
                            @click="changeSelectedViewProfileStatus(profile_status)">
                            {{ profile_status }}
                        </a>
                        </div>
                        <div class="h-[0.5px] w-full bg-gray-300"></div>
                    </div>
                </div>
            </div>
        </div>
        <div v-else>
            <img src="@/assets/no_data.png" alt="" class="mx-auto">
        </div>
    </ProfessorLayout>
</template>

<style scoped>
.custom-button {
    background-color: #2784E1;
    color: white;
}

.custom-deny-btn {
    background-color: #CC1417;
    color: #fff;
}

.custom-accept-btn {
  background-color: #15570F;
  color: #fff;
}

</style>