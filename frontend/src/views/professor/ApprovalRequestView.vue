<script setup>
import ProfessorLayout from '@/Layouts/ProfessorLayout.vue'
import BookingCard from '@/components/BookingCard.vue'
import { computed, ref } from 'vue'

const statuses = ['อนุมัติ', 'รอการอนุมัติ', 'ยกเลิก']
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
            clean_status: null,
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
            clean_status: null,
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
            status: "อนุมัติ",
            clean_status: "สะอาด",
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
            clean_status: "ไม่สะอาด",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            request_pdf: "dararat_lab_form.pdf",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },{
        bookingId: "5",
            date: "จองห้องวันที่ 26/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติ",
            clean_status: "สะอาด",
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
        phone_number: "0891111111",
        role: "student",
        department: "เทคโนโลยีอุตสาหกรรมเกษตร",
        status: "enabled",
        blacklist_status: "nonblacklisted",
        profile_image: "@/assets/default-user.jpg"
    }
]

// mog competition_history ของ user นี้
const userCompetition = [
    {
        student_id:"6510405733",
        competition_name: "การแข่ง1",
        certificate: "certificate.pdf"
    },
    {
        student_id:"6510405733",
        competition_name: "การแข่ง2",
        certificate: "certificate.pdf"
    },
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
const showCancelInput = ref(false);

const filterBookingList = computed(() => {
    return bookingDetail.filter(booking => booking.status === selectedStatus.value)
})

const filterBookingListHistory = computed(() => {
    return bookingDetail.filter(booking => booking.status === 'อนุมัติ')
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

function toggleCancelInput() {
    showCancelInput.value = !showCancelInput.value;
}

const backToList = (() => {
    selectedBooking.value = null;
})

const backToBookingDetail = (() => {
    selectedProfile.value = null;
})

const backToComfirm = (() => {
    showCancelInput.value = null;
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
                    <BookingCard v-for="list in filterBookingList"
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
                                    <div v-if="!showCancelInput" class="flex justify-center mt-5">
                                        <div class="flex justify-center mt-10 mb-10">
                                            <button class="btn custom-accept-btn w-28">
                                                อนุมัติ
                                            </button>
                                            <button  class="btn ml-5 custom-deny-btn w-28" @click="toggleCancelInput">
                                                ปฏิเสธ
                                            </button>
                                        </div>
                                    </div>
                                    <div v-else>
                                        <div class="flex">
                                            <div class="flex mt-3">
                                                <div class="mt-3">
                                                    เหตุผลการปฏิเสธ
                                                </div>
                                                <button class="btn btn-sm absolute right-0 bg-white border border-gray-300 text-sm mr-10" @click="backToComfirm">
                                                    <img src="@/assets/icon-back.png" alt="">
                                                    ย้อนกลับ
                                                </button>
                                            </div>
                                        </div>
                                        <input type="text" placeholder="โปรดระบุเหตุผลในการปฏิเสธ" class="input input-bordered w-[1000px] h-[100px] mt-3"/>
                                        <div class="flex justify-center">
                                            <button  class="btn custom-deny-btn mt-5 mb-8">
                                                ยืนยันการปฏิเสธ
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- หน้าดูประวัตินิสิต -->
                <div v-else>
                    <div class="my-6">
                        <span class="text-3xl mx-12">ประวัตินิสิต</span>
                        <div class="my-6">
                            <a
                            v-for="profile_status in viewProfileStatuses" :key="profile_status"
                            :class="profile_status === selectedViewProfileStatus ? 'btn custom-button ml-12' : 'btn button ml-12'"
                            @click="changeSelectedViewProfileStatus(profile_status)">
                            {{ profile_status }}
                        </a>
                            <button class="btn absolute right-0 bg-white border border-gray-300 mt-2 mr-10" @click="backToBookingDetail">
                                    <img src="@/assets/icon-back.png" alt="">
                                    ย้อนกลับ
                            </button>
                        </div>
                        <div class="h-[0.5px] w-full bg-gray-300"></div>
                    </div>

                    <!-- เมนู Profile-->
                    <div v-if="selectedViewProfileStatus == 'Profile'">
                        <div class="flex justify-center">
                            <div class="main-container w-[1000px] bg-white shadow-lg mx-10 relative my-0 mb-5 p-4 rounded-lg border-2 border-gray-300">
                                <div class="font-bold ml-10 mt-5">
                                    Personal Information
                                    <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                                </div>
                                <div class="avatar flex justify-center my-5">
                                    <div class="w-36 rounded-full border">
                                        <img :src="bookingUser[0].profile_image" alt="">
                                    </div>
                                </div>
                                <div class="flex justify-center">
                                    <div>
                                        <div class="my-5">
                                            ชื่อจริง
                                        </div>
                                        <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                            {{ bookingUser[0].first_name }}                               
                                        </div>
                                    </div>
                                    <div class="mx-9">
                                        <div class="my-5">
                                            นามสกุล
                                        </div>
                                        <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                            {{ bookingUser[0].last_name }}                               
                                        </div>
                                    </div>
                                </div>
                                <div class="flex justify-center">
                                    <div>
                                        <div class="my-5">
                                            รหัสนิสิต
                                        </div>
                                        <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                            {{ bookingUser[0].student_id }}                               
                                        </div>
                                    </div>
                                    <div class="mx-9">
                                        <div class="my-5">
                                            สาขาวิชา
                                        </div>
                                        <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                            {{ bookingUser[0].department }}                               
                                        </div>
                                    </div>
                                </div>
                                <div class="font-bold ml-10 mt-14">
                                    Contact Infromation
                                    <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                                </div>
                                <div class="flex justify-center mt-5 mb-10">
                                    <div>
                                        <div class="my-5">
                                            Email
                                        </div>
                                        <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                            {{ bookingUser[0].KU_email}}                               
                                        </div>
                                    </div>
                                    <div class="mx-9">
                                        <div class="my-5">
                                            Phone
                                        </div>
                                        <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 my-1 pt-3 pl-4">
                                            {{ bookingUser[0].phone_number }}                               
                                        </div>
                                    </div>
                                </div>
                                <div class="font-bold ml-10 mt-14">
                                    Blacklist Status
                                    <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                                </div>
                                <div class="flex justify-center mt-5 mb-10">
                                    <div class="bg-white rounded-lg border border-gray-300 w-80 h-12 mt-5 my-1 pt-3 pl-4">
                                        {{ bookingUser[0].blacklist_status }}                               
                                    </div>
                                    <div class="w-80 h-12 mx-9 my-1 pt-3 pl-4"></div>
                                </div>
                            </div>
                        </div>    
                    </div>

                    <!-- เมนู Competition -->
                    <div v-if="selectedViewProfileStatus == 'Competition'">
                        <div class="flex justify-center">
                            <div class="main-container w-[1000px] bg-white shadow-lg mx-10 relative my-0 mb-5 p-4 rounded-lg border-2 border-gray-300">
                                <div class="flex">
                                    <div class="font-bold text-base ml-10 mt-5">
                                        ประวัติการแข่งขัน
                                        <div class="h-[0.5px] w-80 rounded-lg border-2 bg-gray-300 my-3"></div>
                                    </div>
                                </div>
                                <div v-for="competition in userCompetition">
                                    <div class="ml-12 my-5">
                                        • {{ competition.competition_name }}
                                    </div>
                                    <div class="flex bg-white rounded-lg border border-gray-300 w-80 h-12 ml-12 mb-10 my-1 pt-3 pl-4">
                                        <div class="mr-3">
                                            <img src="@/assets/icon-pdf.png" alt="">
                                        </div>
                                        {{ competition.certificate }}                               
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                     <!-- เมนู ประวัติการใช้ห้อง -->
                     <div v-if="selectedViewProfileStatus == 'ประวัติการใช้ห้อง'">
                        <div class="flex justify-center">
                            <div class="main-container w-[1000px] bg-white shadow-lg mx-10 relative my-0 mb-5 p-4 rounded-lg border-2 border-gray-300">
                               <div class="mt-5">
                                <BookingCard v-for="list in filterBookingListHistory"
                                :bookingId= list.bookingId
                                :date= list.date
                                :time_start= list.time_start
                                :time_end= list.time_end
                                :usage= list.usage
                                :status= list.status
                                :clean_status= list.clean_status
                                :lastAction= list.lastAction
                                :icon= list.icon
                                @click="selectBooking(list)" 
                                ></BookingCard>
                               </div>
                            </div>
                        </div>
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