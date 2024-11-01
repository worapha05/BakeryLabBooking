<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue'
import axios from 'axios'
import { useRouter } from 'vue-router'
import { ref } from 'vue';

const router = useRouter()

const BASE_URL = 'http://localhost:8000'

const first_name = ref('')
const last_name = ref('')
const department = ref('')
const position = ref('')
const phone_number = ref('')
const password = ref('')
const confirm_password = ref('')
const imageUrl = ref('')
const KU_email = ref('')

let image = null

const onFileChange = (event) => {
  const file = event.target.files[0];
  image = file
  console.log(file) // รับไฟล์ที่อัปโหลด
  if (file) {
    const reader = new FileReader();
    reader.onload = (e) => {
      imageUrl.value = e.target.result;
        // ตั้งค่า URL ของภาพเป็นผลลัพธ์ของ FileReader
    };
    reader.readAsDataURL(file); // อ่านไฟล์เป็น Data URL
  }
};

const removeImage = () => {
  imageUrl.value = ''; // ล้าง URL ของภาพเพื่อยกเลิกการแสดงพรีวิว
};

const editData = async () => {
  if (password.value !== confirm_password.value) {
    return alert("รหัสผ่านไม่ตรงกัน")
  } else {
    let professor = {
        first_name: first_name.value,
        last_name: last_name.value,
        department: department.value,
        KU_email: KU_email.value,
        phone_number: phone_number.value,
        password: password.value,
        role: "professor",
        position: position.value
    }
    if (imageUrl.value !== '') {
        const formData = new FormData();
        formData.append('KU', image);

            try {
                const response = await axios.post(`${BASE_URL}/api/upload`, formData);
                console.log(response);
                // ตั้งค่า profile_image ของนักเรียนเป็นชื่อไฟล์ที่ส่งกลับมา
                professor.profile_image = response.data.filename; // ปรับบรรทัดนี้
            } catch (error) {
                console.log('error', error);
                return alert('Error uploading image');
            }
    } else {
        professor.profile_image = "default-user.jpg"
    }
    try {
        await axios.post(`${BASE_URL}/api/register`, professor)
        alert("เพิ่มบัญชีเรียบร้อย")
    } catch (error) {
        alert(error.response.data.message)
    }
  } // ล้าง URL ของภาพเพื่อยกเลิกการแสดงพรีวิว
};

</script>
<template>
    <AdminLayout>
        <div class="flex justify-center">
            <div class="main-container w-[1000px] bg-white shadow-lg mt-14 relative p-4 rounded-lg border-2 border-gray-300">
                <div class="font-bold text-xl ml-5 mt-5">
                    Create account
                    <div class="h-[0.5px] w-full rounded-lg border-2 bg-gray-300 my-3 mr-4"></div>
                </div>
                <div class="flex">
                    <div class="avatar mt-12 ml-32 my-5">
                        <div class="w-36 rounded-full border">
                            <img v-if="imageUrl" :src="imageUrl" alt="Uploaded Image">
                            <img v-else src="@/assets/default-user.jpg" alt="Profile Image">
                        </div>
                    </div>
                    <label class="btn border-gray-300 m-5 ml-10 mt-24 cursor-pointer"> <!-- ใช้ label เพื่อให้คลิกได้ -->
                        <img src="@/assets/icon-upload.png" alt="">
                        Upload
                        <input type="file" class="hidden" @change="onFileChange"/> <!-- ซ่อน input จริง -->
                    </label>
                    <button class="btn border-gray-300 mt-24" @click="removeImage">
                        <img src="@/assets/icon-bin.png" alt="">
                        Delete
                    </button>
                </div>
                <div class="mt-14 ml-32 my-5 font-bold">
                    ข้อมูลส่วนตัว
                </div>
                <div class="flex justify-center">
                        <input type="text" placeholder="Name" class="input input-bordered w-full max-w-xs my-5" v-model="first_name"/>
                        <input type="text" placeholder="Surname" class="input input-bordered w-full max-w-xs ml-20 my-5" v-model="last_name"/>
                </div>
                <div class="flex justify-center">
                    <label class="input input-bordered flex items-center w-80 my-5 relative"> <!-- เพิ่ม relative เพื่อให้ลูกศรอยู่ในตำแหน่งที่ถูกต้อง -->
                        <select class="custom-select grow" v-model="position">
                            <option value="" disabled selected>ตำแหน่ง</option>
                            <option value="หัวหน้าภาควิชา">หัวหน้าภาควิชา</option>
                            <option value="หัวหน้าห้องเบเกอรี่">หัวหน้าห้องเบเกอรี่</option>
                        </select>
                        <span class="absolute right-3 top-1/2 transform -translate-y-1/2 pointer-events-none">▼</span> <!-- เพิ่มลูกศร -->
                    </label>
                    <label class="input input-bordered flex items-center w-80 my-5 ml-20 relative"> <!-- เพิ่ม relative เพื่อให้ลูกศรอยู่ในตำแหน่งที่ถูกต้อง -->
                        <select class="custom-select grow" v-model="department">
                            <option value="" disabled selected>สาขาที่สังกัด</option>
                            <option value="เทคโนโลยีอุตสาหกรรมเกษตร">เทคโนโลยีอุตสาหกรรมเกษตร</option>
                            <option value="เทคโนโลยีชีวภาพ">เทคโนโลยีชีวภาพ</option>
                            <option value="วิทยาศาสตร์และเทคโนโลยีการอาหาร">วิทยาศาสตร์และเทคโนโลยีการอาหาร</option>
                            <option value="เทคโนโลยีการบรรจุและวัสดุ">เทคโนโลยีการบรรจุและวัสดุ</option>
                            <option value="พัฒนาผลิตภัณฑ์">พัฒนาผลิตภัณฑ์</option>
                            <option value="วิทยาการสิ่งทอ">วิทยาการสิ่งทอ</option>
                        </select>
                        <span class="absolute right-3 top-1/2 transform -translate-y-1/2 pointer-events-none">▼</span> <!-- เพิ่มลูกศร -->
                    </label>
                </div>
                <div class="mt-10 ml-32 font-bold">
                    ข้อมูลติดต่อ
                </div>
                <div class="flex justify-center">
                    <div>
                        <div class="my-5 ml-2">
                            Email
                        </div>
                        <input type="text" placeholder="Email" class="input input-bordered w-80" v-model="KU_email"/>
                    </div>
                    <div>
                        <div class="my-5 ml-20">
                            Phone
                        </div>
                        <input type="text" placeholder="Phone" class="input input-bordered w-80 ml-20" v-model="phone_number"/>
                    </div>
                </div>
                <div class="mt-10 mx-32 font-bold">
                    ตั้งรหัสผ่าน
                </div>
                <div class="flex justify-center">
                    <div>
                        <div class="my-5 ml-2">
                            Password
                        </div>
                        <input type="password" placeholder="รหัสผ่าน" class="input input-bordered w-80" v-model="password"/>
                    </div>
                    <div>
                        <div class="my-5 ml-20">
                            Confirm password
                        </div>
                        <input type="password" placeholder="ยืนยันรหัสผ่าน" class="input input-bordered w-80 ml-20" v-model="confirm_password"/>
                    </div>
                </div>
                <div class="create-account-btn my-10 flex justify-center">
                    <button class="btn custom-create-account-btn mt-2" @click="editData">
                        สร้างบัญชี
                    </button>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>
.custom-create-account-btn {
  background-color: #15570F;
  color: #fff;
}

.custom-select {
    border: none; /* กำหนดกรอบ */
    background-color: none; /* พื้นหลัง */
    appearance: none; /* ซ่อนลูกศรปกติ */
    position: relative; /* กำหนดตำแหน่งให้กับลูกศร */
}
</style>