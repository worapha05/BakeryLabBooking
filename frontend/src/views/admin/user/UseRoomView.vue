<script setup>
import { ref, computed ,  watch} from 'vue'
import AdminLayout from '@/Layouts/AdminLayout.vue'
import BookingCard from '@/components/BookingCard.vue'

// mog Booking ที่จะถึง
const bookingDetail = [
    {
        bookingId: "1",
        date: "31/10/2024",
        time_start: "09:00",
        time_end: "12:00",
        usage: "ใช้เพื่อการแข่งขัน",
        status: "อนุมัติแล้ว",
        lastAction: "ดำเนินการขอจองล่าสุด 25/10/2024",
        icon: "../assets/images/882d0c62-fac0-4a78-9844-8f16fff17a01.png"
    }
];

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

const showCancelInput = ref(false);

// ฟังก์ชันเพื่อเปลี่ยนสถานะของอุปกรณ์
function changeStatusEquipment(equipmentId) {
    const equipment = equipmentList.value.find(e => e.equipment_id === equipmentId);
    if (equipment) {
        equipment.equipment_status = 
            equipment.equipment_status === "operational" ? "broken" : "operational";
    }
}

// ฟังก์ชันเพื่อสลับการแสดงผลของ input สำหรับการยกเลิก
function toggleCancelInput() {
    showCancelInput.value = !showCancelInput.value;
}



// computed property เพื่อเปรียบเทียบวันและเวลา
const canShowBooking = computed(() => {
    const today = new Date();
    const currentDate = today.toLocaleDateString('th-TH', { day: '2-digit', month: '2-digit', year: 'numeric' });
    const currentTime = today.toLocaleTimeString('th-TH', { hour: '2-digit', minute: '2-digit', hour12: false });

    return bookingDetail.filter(booking => 
        booking.date === currentDate
    ).length > 0;
});

</script>

<template>
    <AdminLayout>
        <div class="my-5 mt-10">
            <span class="text-xl font-bold ml-28">ผลการขอจอง</span>
        </div>
        <div class="flex justify-center">
            <div class="main-container w-[1000px] bg-white shadow-lg mt-3 relative p-4 rounded-lg border-2 border-gray-300">
                <div class="mt-5"></div>
                 <!-- เมื่อมี Booking ในเวลานี้ -->
                 <div v-if="canShowBooking">
                    <BookingCard v-for="list in bookingDetail"
                        :key="list.bookingId"
                        :bookingId="list.bookingId"
                        :date="list.date"
                        :time_start="list.time_start"
                        :time_end="list.time_end"
                        :usage="list.usage"
                        :status="list.status"
                        :lastAction="list.lastAction"
                        :icon="list.icon"
                    />
                    <div class="flex justify-center">
                        <div class="w-[920px] bg-white shadow-lg mt-3 relative p-4 rounded-lg border border-gray-300">
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
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="equipment in equipmentList" :key="equipment.equipment_id">
                                            <td>{{ equipment.equipment_id }}</td>
                                            <td>{{ equipment.equipment_name }}</td>
                                            <td>{{ equipment.equipment_status }}</td>
                                            <td>
                                                <button class="btn btn-sm custom-broken-button ml-3 w-30"
                                                    @click="changeStatusEquipment(equipment.equipment_id)">
                                                    เปลี่ยนสถานะ
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="font-bold ml-5 my-5">
                                OTP-สร้างเพื่อยืนยันการเข้าใช้ห้องของนิสิต
                            </div>
                            <input type="text" class="input input-bordered w-80 ml-5" />
                            <div class="ml-3 my-5">
                                <button class="btn custom-blue-s ml-5">Generate</button>
                            </div>
                            <div v-if="!showCancelInput" class="flex justify-center mt-5">
                                <div class="flex justify-center mt-10 my-5">
                                    <button class="btn custom-blacklist-button w-28">
                                        Blacklist
                                    </button>
                                    <button class="btn custom-broken-button ml-3 w-28" @click="toggleCancelInput">
                                        ยกเลิก
                                    </button>
                                </div>
                            </div>
                            <div v-else>
                                <div class="ml-5">
                                    เหตุผลการยกเลิก
                                </div>
                                <input type="text" placeholder="โปรดระบุเหตุผลในการยกเลิก" class="input input-bordered w-[845px] h-[100px] mx-5 mt-3"/>
                                <div class="flex justify-center">
                                    <button class="btn custom-broken-button my-5 w-28">
                                        ยกเลิก
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- เมื่อไม่มี Booking ในเวลานี้ -->
                <div v-else>
                    <div class="flex justify-center items-center h-[200px]">
                        <span class="text-lg">ยังไม่มีข้อมูลการจองที่จะแสดงในขณะนี้</span>
                    </div>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>
.custom-blue-s {
    background-color: #2784E0;
    color:  #fff;
}

.custom-broken-button {
    background-color: #CC1417;
    color: white;
}

.custom-blacklist-button {
    background-color: black;
    color: white;
}
</style>
