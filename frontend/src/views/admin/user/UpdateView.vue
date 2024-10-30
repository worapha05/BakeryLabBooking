<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue'
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
                            <img src="@/assets/default-user.jpg" alt="">
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
                        <input type="text" placeholder="Name" class="input input-bordered w-full max-w-xs my-5" />
                        <input type="text" placeholder="Surname" class="input input-bordered w-full max-w-xs ml-20 my-5" />
                </div>
                <div class="flex justify-center">
                    <label class="input input-bordered flex items-center w-80 my-5 relative"> <!-- เพิ่ม relative เพื่อให้ลูกศรอยู่ในตำแหน่งที่ถูกต้อง -->
                        <select class="custom-select grow">
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
                    <div class="w-96 mx-2"></div>
                </div>
                <div class="mt-10 ml-32 font-bold">
                    ข้อมูลติดต่อ
                </div>
                <div class="flex justify-center">
                    <div>
                        <div class="my-5 ml-2">
                            Email
                        </div>
                        <input type="text" placeholder="Email" class="input input-bordered w-80" />
                    </div>
                    <div>
                        <div class="my-5 ml-20">
                            Phone
                        </div>
                        <input type="text" placeholder="Phone" class="input input-bordered w-80 ml-20" />
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
                        <input type="password" placeholder="รหัสผ่าน" class="input input-bordered w-80" />
                    </div>
                    <div>
                        <div class="my-5 ml-20">
                            Confirm password
                        </div>
                        <input type="password" placeholder="ยืนยันรหัสผ่าน" class="input input-bordered w-80 ml-20" />
                    </div>
                </div>
                <div class="create-account-btn my-10 flex justify-center">
                    <button to="/login" class="btn custom-create-account-btn mt-2">
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