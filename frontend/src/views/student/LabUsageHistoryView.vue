<script setup>
import StudentLayout from '@/Layouts/StudentLayout.vue'
import BookingCard from '@/components/BookingCard.vue'
import { computed, ref } from 'vue'
import { useBookingStore } from '@/stores/booking';
import { useUserStore } from '@/stores/user';

const userStore = useUserStore()

const bookingStore= useBookingStore()

const statuses = ['อยู่ระหว่างการใช้', 'ใช้เสร็จแล้ว']
const bookingDetail = [
    {
        bookingId: "1",
            date: "31/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติ",
            clean_status: "สะอาด",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "2",
            date: "01/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติ",
            clean_status: "สะอาด",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "3",
            date: "02/10/2024",
            time_start: "9:00",
            time_end: "12:00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติ",
            clean_status: "สะอาด",
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    },
    {
        bookingId: "4",
            date: "01/11/2024",
            time_start: "15:00",
            time_end: "17:00",
            usage: "ใช้เพื่อการแข่งขัน",
            status: "อนุมัติ",
            clean_status: null,
            lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
            icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    }
]

// mog Booking member ของ booking นี้
const bookingMember = [
    { member: 'member1@ku.th' },
    { member: 'member2@ku.th' },
    { member: 'member3@ku.th' },
];

// ใช้ ref เพื่อให้ Vue ติดตามการเปลี่ยนแปลงใน equipmentList
const equipmentList = ref([
    {
        equipment_id: "1",
        equipment_name: "เครื่องนวดแป้ง",
        equipment_status: "operational",
        date: "30/10/2024",
        time: "9.00 - 12.00"
    },
    {
        equipment_id: "2",
        equipment_name: "เครื่องชั่ง",
        equipment_status: "operational",
        date: "31/10/2024",
        time: "9.00 - 12.00"
    },
    {
        equipment_id: "3",
        equipment_name: "เตาอบไฟฟ้า",
        equipment_status: "broken",
        date: "31/10/2024",
        time: "9.00 - 12.00"
    }
]);

const selectedStatus = ref("อยู่ระหว่างการใช้")
const showComfirmPage = ref(false);


const isPastDate = (dateStr) => {
    const [day, month, year] = dateStr.split("/").map(Number); // แยกวัน เดือน ปี
    const bookingDate = new Date(year, month - 1, day); // สร้างวันที่การจอง
    const today = new Date(); // วันที่ปัจจุบัน
    return bookingDate < today; // คืนค่าจริงถ้าวันที่ผ่านไปแล้ว
}

const filterCurrentBookingList = computed(() => {
    const today = new Date();

    return bookingDetail.filter(booking => {
        // แยกวันที่จากการจอง
        const [day, month, year] = booking.date.split("/").map(Number);
        const bookingDate = new Date(year, month - 1, day);

        // ถ้าไม่ใช่วันที่ปัจจุบันหรือสถานะไม่ใช่ "อนุมัติ" ให้ข้าม
        if (bookingDate.toDateString() !== today.toDateString() || booking.status !== "อนุมัติ") {
            return false;
        }

        // ตรวจสอบช่วงเวลา
        const [startHour, startMinute] = booking.time_start.split(":").map(Number);
        const [endHour, endMinute] = booking.time_end.split(":").map(Number);
        const startTime = new Date(bookingDate);
        startTime.setHours(startHour, startMinute, 0, 0);
        const endTime = new Date(bookingDate);
        endTime.setHours(endHour, endMinute, 0, 0);

        return today >= startTime && today <= endTime;
    });
});


const filterPartBooingList = computed(() => {
    return bookingDetail.filter(booking => isPastDate(booking.date) && booking.status === "อนุมัติ")
})

const changeSelectedStatus = ((newStatus) => {
    selectedStatus.value = newStatus
})

function goToComfirmPage() {
    showComfirmPage.value = !showComfirmPage.value;
}

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
                    <BookingCard v-for="list in filterCurrentBookingList"
                        :bookingId= list.bookingId
                        :date= list.date
                        :time_start= list.time_start
                        :time_end= list.time_end
                        :usage= list.usage
                        :status= list.status
                        :lastAction= list.lastAction
                        :icon= list.icon
                        >
                    </BookingCard>  
                </div>
                <div class="flex justify-center">
                    <div v-if="!showComfirmPage">
                        <button class="btn custom-confirm-btn mb-5" @click="goToComfirmPage">
                            ยืนยันการเข้าใช้ห้อง
                        </button>
                    </div>
                    <div v-else>
                        <div class="flex justify-center">
                            <div class="main-container w-[1065px] bg-white shadow-lg relative my-0 p-4 rounded-lg border-2 border-gray-300">
                                <div class="mt-5 my-3 ml-5">
                                    สมาชิกที่จะเข้าใช้ห้อง
                                </div>
                                <ul v-for="member in bookingMember" :key="member.member" class="ml-12" style="list-style-type: disc;">
                                    <li>{{ member.member }}</li>
                                </ul>

                                <div class="mt-5 my-3 ml-5">
                                    อุปกรณ์ที่ต้องใช้
                                </div>
                                <div class="overflow-x-auto">
                                    <table class="table mt-3 ml-5 w-[500px]">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="equipment in equipmentList" :key="equipment.equipment_id">
                                                <td>{{ equipment.equipment_id }}</td>
                                                <td>{{ equipment.equipment_name }}</td>
                                                <td>{{ equipment.equipment_status }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="font-bold ml-5 my-5">
                                    OTP-สร้างเพื่อยืนยันการเข้าใช้ห้องของนิสิต
                                </div>
                                <input type="text" class="input input-bordered w-80 ml-5" />
                                <div class="ml-3 my-5">
                                    <button class="btn custom-confirm-btn ml-5">ยืนยัน</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if="selectedStatus == 'ใช้เสร็จแล้ว'">
                    <BookingCard v-for="list in filterPartBooingList"
                    :bookingId= list.bookingId
                    :date= list.date
                    :time_start= list.time_start
                    :time_end= list.time_end
                    :usage= list.usage
                    :status= list.status
                    :clean_status= list.clean_status
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

.custom-confirm-btn {
  background-color: #15570F;
  color: #fff;
}

</style>
