<script setup>
import StudentLayout from '@/Layouts/StudentLayout.vue'
import { useEquipmentStore } from '@/stores/equipment';
import { useBookingStore } from '@/stores/booking';
import { useUserStore } from '@/stores/user';
import { onMounted, ref } from 'vue';
import axios from 'axios';

const BASE_URL = 'http://localhost:8000'

const userStore = useUserStore()
const equipmentStore = useEquipmentStore()
const bookingStore= useBookingStore()

const bookingDate = ref('');
const startTime = ref('');
const endTime = ref('');
const useCategory = ref('');
const reason = ref('');
const memberFirstName = ref('');
const memberLastName = ref('');
const studentId = ref('');
const email = ref('');
const memberList = ref([]);
const selectedEquipment = ref([]);

onMounted(async () => {
  await equipmentStore.loadEquipment()
  console.log(equipmentStore.list) 
})

const addMember = () => {
    if (memberFirstName.value && memberLastName.value && studentId.value && email.value) {
    memberList.value.push({
      firstName: memberFirstName.value,
      lastName: memberLastName.value,
      studentId: studentId.value,
      email: email.value,
    });

    // Clear input fields after adding
    memberFirstName.value = '';
    memberLastName.value = '';
    studentId.value = '';
    email.value = '';
  } else {
    alert('กรุณากรอกข้อมูลสมาชิกให้ครบถ้วน');
  }
};

let pdf

const onFileChange = (event) => {
  const file = event.target.files[0];
  pdf = file
  console.log(file) // รับไฟล์ที่อัปโหลด // อ่านไฟล์เป็น Data URL
  };

const addBookingData = async () => {
    let booking = {
        bookingDate: bookingDate.value,
        startTime: startTime.value,
        endTime: endTime.value,
        useCategory: useCategory.value,
        reason: reason.value,
        memberList: memberList.value,
        selectedEquipment: selectedEquipment.value,
        owner: userStore.selectedUser
    }
    const formData = new FormData();
        formData.append('KU', pdf);

            try {
                const response = await axios.post(`${BASE_URL}/api/upload`, formData);
                console.log(response);
                booking.pdf = response.data.filename; // ปรับบรรทัดนี้
            } catch (error) {
                console.log('error', error);
                return alert('Error uploading file');
            }
  try {
    console.log(booking)

    await bookingStore.addBooking(booking)
    router.push('/student/booking/result') 
  } catch (error) {
      console.error("error", error)
    // Optionally, you can update the UI to show an error message to the user
  }
}

</script>

<template>
    <StudentLayout>
        <div class="m-3 border-2 rounded-xl p-4">
            <div class="font-bold">จองห้องปฎิบัติการเบเกอรี่</div>
            <div class="my-3 text-sky-600">กรุณากรอกข้อมูลต่อไปนี้ให้ครบถ้วน</div>
            <div class="flex">
                <div class="font-bold">เลือกวันที่ต้องการเข้าใช้</div>
                <div class="ml-28 font-bold">เลือกเวลา</div>
            </div>
            <div class="flex">
                <div>
                    <input v-model="bookingDate" type="date" class="my-3 p-1.5 rounded-sm border-2">
                </div>
                <div class="ml-28">
                    <select class="my-3 p-1.5 rounded-sm border-2" v-model="startTime">
                        <option disabled selected>เลือกเวลาเริ่มต้น</option>
                        <option>09.00</option>
                        <option>10.00</option>
                        <option>11.00</option>
                        <option>12.00</option>
                        <option>13.00</option>
                        <option>14.00</option>
                        <option>15.00</option>
                        <option>16.00</option>
                    </select>
                </div>
                <div class="my-3 ml-10 p-1.5">
                    ถึง
                </div>
                <div class="ml-10">
                    <select class="my-3 p-1.5 rounded-sm border-2" v-model="endTime">
                        <option disabled selected>เลือกเวลาสิ้นสุด</option>
                        <option>10.00</option>
                        <option>11.00</option>
                        <option>12.00</option>
                        <option>13.00</option>
                        <option>14.00</option>
                        <option>15.00</option>
                        <option>16.00</option>
                        <option>17.00</option>
                    </select>
                </div>
            </div>
            <div class="mt-3 font-bold">
                ประเภทในการใช้ห้อง
            </div>
            <div class="flex my-2">
                <div class="w-40"><input type="radio" name="useCategory" value="การแข่งขัน" v-model="useCategory">ใช้เพื่อการแข่งขัน</div>
                <div class="w-40"><input type="radio" name="useCategory" value="การทดลอง" v-model="useCategory">ใช้เพื่อการทดลอง</div>
            </div>
            <div class="mt-3 font-bold">
                เหตุผลการใช้ห้อง
            </div>
            <textarea placeholder="วัตถุประสงค์และความสำคัญที่ต้องใช้" class="my-4 pt-4 pl-4 w-96 h-44 border-2" v-model="reason"></textarea>
            <div class="font-bold">สมาชิกที่จะเข้าใช้ห้อง</div>
            <div class="flex">
                <input v-model="memberFirstName" class="p-2 mr-4 my-2 border-2" type="text" placeholder="ชื่อจริง" >
                <input v-model="memberLastName" class="p-2 mx-4 my-2 border-2" type="text" placeholder="นามสกุล">
                <input v-model="studentId" class="p-2 mx-4 my-2 border-2" type="text" placeholder="รหัสนิสิต">
                <input v-model="email" class="p-2 mx-4 my-2 border-2" type="text" placeholder="Email">
                <button class="btn bg-sky-300 mt-1" @click="addMember">
                    <img src="@/assets/plus.png" alt="" class="w-3.5 fill-white">เพิ่ม
                </button>
            </div>
            <ul class="ml-5" style="list-style-type: disc;" v-for="(member, index) in memberList">
                <li>{{ member.firstName }} {{ member.lastName }} {{ member.studentId }} {{ member.email }}</li>
            </ul>
            <div class="my-3 font-bold">
                ข้อมูลเอกสารที่ใช้แนบ
            </div>
            <div class="my-3">
                ใช้กรอกเพื่อยื่นให้อาจารย์และเจ้าหน้าที่เซ็นอนุมัต เมื่อกรอกเรียบร้อยแล้วให้แนบไฟล์มาด้วย
            </div>
            <div>
                <input type="file" class="file-input file-input-bordered w-full max-w-xs my-2" required @change="onFileChange"/>
            </div>
            <div class="font-bold my-3">
                อุปกรณ์ที่ต้องใช้ (สามารถเลือกได้มากกว่าหนึ่งอย่าง)
            </div>
            <div>
                <ul class="grid grid-cols-6">
                    <li v-for="equipment in equipmentStore.list" :key="equipment.equipment_id">
                        <input type="checkbox" class="my-3" :value="equipment.equipment_id"
                        v-model="selectedEquipment">{{ equipment.equipment_name }}
                    </li>
                </ul>
            </div>
            <div class="create-account-btn my-10 flex justify-center">
                <button class="btn custom-create-account-btn mt-2" @click="addBookingData">
                    ยืนยันการจอง
                </button>
            </div>
        </div>
    </StudentLayout>
</template>

<style scoped>
.custom-create-account-btn {
  background-color: #15570F;
  color: #fff;
}
</style>